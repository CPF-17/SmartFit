//
//  LoginViewController.swift
//  SmartFit
//
//  Created by John Law on 12/4/2017.
//  Copyright © 2017 CPF-17. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

@MainActor
final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        restorePreviousSession()
    }

    private func restorePreviousSession() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, _ in
            guard let self, let user else { return }
            Task { @MainActor in await self.authenticate(user) }
        }
    }

    @IBAction private func signInTapped(_ sender: Any) {
        Task { await signInWithGoogle() }
    }

    private func signInWithGoogle() async {
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: self)
            await authenticate(result.user)
        } catch {
            print("Sign-in error: \(error.localizedDescription)")
        }
    }

    private func authenticate(_ user: GIDGoogleUser) async {
        guard let idToken = user.idToken?.tokenString else { return }
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: user.accessToken.tokenString
        )
        do {
            try await Auth.auth().signIn(with: credential)
            navigateToMain()
        } catch {
            print("Firebase auth error: \(error.localizedDescription)")
        }
    }

    private func navigateToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoggedView")
        view.window?.rootViewController = vc
    }
}

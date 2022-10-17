package org.spoto.service;

import org.spoto.model.Users;

public interface LoginService {
    Users doLogin(String account, String passwd);
}

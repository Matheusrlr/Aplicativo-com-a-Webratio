package com.webratio.webapp;

public class User implements java.io.Serializable {
    /** Serial version identifier. */
    private static final long serialVersionUID = 1L;

    private java.lang.Integer _oid;

    private java.lang.String _userName;

    private java.lang.String _password;

    private java.lang.String _email;

    private java.lang.String _token;

    private java.sql.Timestamp _tokenExpirationDate;

    private java.lang.String _secretKey;

    private java.util.Set _roles = new java.util.HashSet();

    private java.util.Set _userToDevice = new java.util.HashSet();

    private float _searchScore;

    public java.lang.Integer getOid() {
        return _oid;
    }

    public void setOid(java.lang.Integer _oid) {
        this._oid = _oid;
    }

    public java.lang.String getUserName() {
        return _userName;
    }

    public void setUserName(java.lang.String _userName) {
        this._userName = _userName;
    }

    public java.lang.String getPassword() {
        return _password;
    }

    public void setPassword(java.lang.String _password) {
        this._password = _password;
    }

    public java.lang.String getEmail() {
        return _email;
    }

    public void setEmail(java.lang.String _email) {
        this._email = _email;
    }

    public java.lang.String getToken() {
        return _token;
    }

    public void setToken(java.lang.String _token) {
        this._token = _token;
    }

    public java.sql.Timestamp getTokenExpirationDate() {
        return _tokenExpirationDate;
    }

    public void setTokenExpirationDate(java.sql.Timestamp _tokenExpirationDate) {
        this._tokenExpirationDate = _tokenExpirationDate;
    }

    public java.lang.String getSecretKey() {
        return _secretKey;
    }

    public void setSecretKey(java.lang.String _secretKey) {
        this._secretKey = _secretKey;
    }

    public java.util.Set getRoles() {
        return _roles;
    }

    public void setRoles(java.util.Set _roles) {
        this._roles = _roles;
    }

    public java.util.Set getUserToDevice() {
        return _userToDevice;
    }

    public void setUserToDevice(java.util.Set _userToDevice) {
        this._userToDevice = _userToDevice;
    }

    public float getSearchScore() {
        return _searchScore;
    }

    public void setSearchScore(float _searchScore) {
        this._searchScore = _searchScore;
    }

    public String toString() {
        java.lang.StringBuffer sb = new java.lang.StringBuffer();
        sb.append(super.toString());
        int n = sb.length() - 1;
        if (sb.charAt(n) == ']') {
            sb.setCharAt(n, ',');
        } else {
            sb.append('[');
        }
        if (_oid != null)
            sb.append("oid=" + _oid + ',');
        if (_userName != null)
            sb.append("userName=" + _userName + ',');
        if (_password != null)
            sb.append("password=" + _password + ',');
        if (_email != null)
            sb.append("email=" + _email + ',');
        if (_token != null)
            sb.append("token=" + _token + ',');
        if (_tokenExpirationDate != null)
            sb.append("tokenExpirationDate=" + _tokenExpirationDate + ',');
        if (_secretKey != null)
            sb.append("secretKey=" + _secretKey + ',');
        n = sb.length() - 1;
        if (sb.charAt(n) == ',') {
            sb.setCharAt(n, ']');
        } else if (sb.charAt(n) == '[') {
            sb.deleteCharAt(n);
        }
        return sb.toString();
    }

    public boolean equals(java.lang.Object obj) {
        if (!(obj instanceof com.webratio.webapp.User)) {
            return false;
        }
        com.webratio.webapp.User __other = (com.webratio.webapp.User) obj;
        java.lang.Object key = null;
        java.lang.Object otherKey = null;
        key = this.getOid();
        otherKey = __other.getOid();
        if (key == null) {
            if (otherKey != null) {
                return false;
            }
        } else {
            if (otherKey == null) {
                return false;
            } else if (!key.equals(otherKey)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int hashCode = 0;
        java.lang.Object key = null;
        key = this.getOid();
        if (key != null) {
            hashCode |= key.hashCode();
        }
        return hashCode;
    }
}

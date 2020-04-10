<html>
    <head>
        <title>Login Page</title>
    </head>
    <body onload='document.f.username.focus();'>
        <h3>Login with Username and Password</h3>
        <form name='f' action='/login' method='POST'>
            <table>
                <tr>
                    <td>User:</td>
                    <td><input type='text' name='username' value=''></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type='password' name='password'/></td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <input name="submit" type="submit" value="Login"/>
                    </td>
                </tr>
                <input name="_csrf" type="hidden" value="1c4ff52d-2b0d-4e46-9d2e-505d9a5efd82" />
            </table>
        </form>
    </body>
</html>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: #7DBEED;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            line-height: 1;
            color: #21689C;
        }

        button {
            background-color: #21689C;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            background-color: lightblue;
        }
        
              input,
      button {
        display: block;
        margin: 0 auto;
		font-size: 20px;
        color: white;
        background-color: steelblue;
      }

        label {
            display: block;
            text-align: center;
            color: white;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            width: 100%; 
        }

        form {
            display: inline-block;
        }
        
        input:hover {
            background-color: #6495ED;
            color: #ffffff;
        }
    </style>
    
    <meta charset="UTF-8">
    <title>Sistema Universitário</title>
</head>
<body>

    <h1>Sistema Universitário</h1>

    <form action="login" method="post">
        <label for="login">Login:</label>
        <input type="text" id="login" name="login" required>
        <br>

        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required>
        <br>

        <input type="submit" value="Login">
    </form>

</body>
</html>

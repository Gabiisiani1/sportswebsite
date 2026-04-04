<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a2e;
            color: white;
        }
        nav {
            background-color: #16213e;
            padding: 15px 30px;
            display: flex;
            gap: 20px;
            align-items: center;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 20px;
            font-weight: bold;
        }
        nav a:hover { background-color: #e94560; }
        nav .logo { color: #e94560; font-size: 1.3em; margin-right: auto; }
        .hero {
            background: linear-gradient(135deg, #16213e, #0f3460);
            padding: 60px 40px;
            text-align: center;
        }
        .hero h1 { color: #e94560; font-size: 3em; margin-bottom: 15px; }
        .hero p { color: #aaa; font-size: 1.2em; }
        .container { padding: 40px; }
        .fact {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px;
            margin: 15px 0;
            border-left: 4px solid #e94560;
            font-size: 1.1em;
        }
        h2 { color: #e94560; margin-bottom: 20px; }
    </style>
</head>
<body>

<nav>
    <span class="logo">🏆 SportsHistory</span>
    <a href="/">Home</a>
    <a href="/football">Football</a>
    <a href="/basketball">Basketball</a>
    <a href="/formula1">Formula 1</a>
</nav>

<div class="hero">
    <h1>🏀 ${title}</h1>
    <p>${description}</p>
</div>

<div class="container">
    <h2>📖 Key Facts</h2>
    <#list facts as fact>
        <div class="fact">${fact}</div>
    </#list>
</div>

</body>
</html>
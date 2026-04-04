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
            transition: background 0.3s;
        }
        nav a:hover { background-color: #e94560; }
        nav .logo { color: #e94560; font-size: 1.3em; margin-right: auto; }
        .container { padding: 40px; }
        h1 { color: #e94560; text-align: center; font-size: 3em; margin-bottom: 10px; }
        .subtitle { text-align: center; color: #aaa; margin-bottom: 40px; }
        .cards { display: flex; gap: 20px; justify-content: center; flex-wrap: wrap; }
        .card {
            background-color: #16213e;
            border-radius: 10px;
            padding: 30px;
            width: 280px;
            text-align: center;
            transition: transform 0.3s;
        }
        .card:hover { transform: translateY(-5px); }
        .card .emoji { font-size: 3em; margin-bottom: 15px; }
        .card h2 { color: #e94560; margin-bottom: 10px; }
        .card a {
            display: inline-block;
            margin-top: 15px;
            background-color: #e94560;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .facts { margin-top: 40px; }
        .fact {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px;
            margin: 10px 0;
            border-left: 4px solid #e94560;
        }
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

<div class="container">
    <h1>🏆 ${title}</h1>
    <p class="subtitle">Explore the history of the world's greatest sports</p>

    <div class="cards">
        <div class="card">
            <div class="emoji">⚽</div>
            <h2>Football</h2>
            <p>The world's most popular sport with over 4 billion fans.</p>
            <a href="/football">Explore</a>
        </div>
        <div class="card">
            <div class="emoji">🏀</div>
            <h2>Basketball</h2>
            <p>Born in 1891, now one of the biggest sports on the planet.</p>
            <a href="/basketball">Explore</a>
        </div>
        <div class="card">
            <div class="emoji">🏎️</div>
            <h2>Formula 1</h2>
            <p>The pinnacle of motorsport since 1950.</p>
            <a href="/formula1">Explore</a>
        </div>
    </div>

    <div class="facts">
        <h2 style="color:#e94560; margin-bottom:20px;">📖 Quick Facts</h2>
        <#list facts as fact>
            <div class="fact"><p>${fact}</p></div>
        </#list>
    </div>
</div>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>About</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #1a1a2e; color: white; }
        nav { background-color: #16213e; padding: 15px 30px; display: flex; gap: 20px; align-items: center; }
        nav a { color: white; text-decoration: none; padding: 8px 18px; border-radius: 20px; font-weight: bold; }
        nav a:hover { background-color: #e94560; }
        nav .logo { color: #e94560; font-size: 1.3em; margin-right: auto; }
        .hero { text-align: center; padding: 60px 40px; background: linear-gradient(135deg, #16213e, #0f3460); }
        .hero h1 { color: #e94560; font-size: 3em; margin-bottom: 10px; }
        .hero p { color: #aaa; font-size: 1.2em; }
        .container { padding: 40px; max-width: 800px; margin: 0 auto; }
        .card { background-color: #16213e; border-radius: 10px; padding: 30px; margin: 20px 0; border-left: 4px solid #e94560; }
        .card h2 { color: #e94560; margin-bottom: 15px; font-size: 1.5em; }
        .card p { color: #aaa; line-height: 1.8; font-size: 1.05em; }
        .sports-list { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 15px; }
        .sport-tag { background-color: #e94560; padding: 6px 16px; border-radius: 20px; font-weight: bold; font-size: 0.9em; }
    </style>
</head>
<body>

<nav>
    <span class="logo">🏆 SportsHistory</span>
    <a href="/">Home</a>
    <a href="/search">Search</a>
    <a href="/about">About</a>
    <a href="/athletes">Athletes</a>
</nav>

<div class="hero">
    <h1>About This Website</h1>
    <p>Learn more about SportsHistory and what we cover</p>
</div>

<div class="container">



    <div class="card">
        <h2>🌍 Sports We Cover</h2>
        <p>We currently cover the following sports:</p>
        <div class="sports-list">
            <span class="sport-tag">⚽ Football</span>
            <span class="sport-tag">🏀 Basketball</span>
            <span class="sport-tag">🏎️ Formula 1</span>
            <span class="sport-tag">🎾 Tennis</span>
            <span class="sport-tag">🏈 NFL</span>
            <span class="sport-tag">🥊 MMA & UFC</span>
            <span class="sport-tag">🏉 Rugby</span>
            <span class="sport-tag">🏅 Olympics</span>
            <span class="sport-tag">🏆 World Cup 2026</span>
        </div>
    </div>

    <div class="card">
        <h2>🇬🇪 Georgian Champions</h2>
        <p>We are especially proud to feature content about Georgian UFC champions <strong style="color:#e94560;">Ilia Topuria</strong> and <strong style="color:#e94560;">Merab Dvalishvili</strong> — two of the biggest names in combat sports today, both representing Georgia on the world stage!</p>
    </div>

    <div class="card">
        <h2>💻 Built With</h2>
        <p>This website was built using Java Spring Boot, FreeMarker templates, H2 database, and Spring Data JPA as part of a university web programming course project.</p>
    </div>

</div>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { scroll-behavior: smooth; }
        body { font-family: Arial, sans-serif; background-color: #1a1a2e; color: white; }
        nav { background-color: #16213e; padding: 15px 30px; display: flex; gap: 20px; align-items: center; }
        nav a { color: white; text-decoration: none; padding: 8px 18px; border-radius: 20px; font-weight: bold; transition: background 0.3s; }
        nav a:hover { background-color: #e94560; }
        nav .logo { color: #e94560; font-size: 1.3em; margin-right: auto; }
        .hero { text-align: center; padding: 60px 40px; background: linear-gradient(135deg, #16213e, #0f3460); }
        .hero h1 { color: #FFD700; font-size: 3em; margin-bottom: 10px; }
        .hero p { color: #aaa; font-size: 1.2em; }
        .container { padding: 40px; max-width: 1200px; margin: 0 auto; }
        .section-title { color: #FFD700; font-size: 2em; margin: 40px 0 20px; border-bottom: 2px solid #FFD700; padding-bottom: 10px; }
        .athletes-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-bottom: 20px; }
        .athlete-card {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px;
            border-left: 4px solid #FFD700;
            transition: transform 0.3s, box-shadow 0.3s;
            opacity: 0;
            animation: fadeIn 0.5s forwards;
        }
        .athlete-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(255,215,0,0.3); }
        .athlete-name { color: #FFD700; font-size: 1.2em; font-weight: bold; margin-bottom: 5px; }
        .athlete-sport { background-color: #e94560; padding: 3px 12px; border-radius: 10px; font-size: 0.8em; display: inline-block; margin-bottom: 10px; }
        .athlete-nationality { color: #aaa; font-size: 0.85em; margin-bottom: 10px; }
        .athlete-info { color: #ccc; font-size: 0.9em; line-height: 1.5; margin-bottom: 10px; }
        .athlete-achievement { background-color: #0f3460; padding: 8px 12px; border-radius: 5px; font-size: 0.85em; color: #FFD700; font-weight: bold; }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .athlete-card:nth-child(1) { animation-delay: 0.05s; }
        .athlete-card:nth-child(2) { animation-delay: 0.1s; }
        .athlete-card:nth-child(3) { animation-delay: 0.15s; }
        .athlete-card:nth-child(4) { animation-delay: 0.2s; }
        .athlete-card:nth-child(5) { animation-delay: 0.25s; }
        .athlete-card:nth-child(6) { animation-delay: 0.3s; }
        .athlete-card:nth-child(7) { animation-delay: 0.35s; }
        .athlete-card:nth-child(8) { animation-delay: 0.4s; }
        .athlete-card:nth-child(9) { animation-delay: 0.45s; }
        .flag { font-size: 2em; margin-bottom: 15px; }
        .stats { display: flex; gap: 20px; justify-content: center; margin-top: 20px; flex-wrap: wrap; }
        .stat-box { background-color: #FFD700; color: #1a1a2e; padding: 15px 25px; border-radius: 10px; text-align: center; font-weight: bold; }
        .stat-box .number { font-size: 2em; }
        .stat-box .label { font-size: 0.85em; }
    </style>
</head>
<body>

<nav>
    <span class="logo">🏆 SportsHistory</span>
    <a href="/">Home</a>
    <a href="/athletes">Athletes</a>
    <a href="/georgian-athletes">🇬🇪 Georgian</a>
    <a href="/search">Search</a>
    <a href="/about">About</a>
</nav>

<div class="hero">
    <h1>🇬🇪 Georgian Athletes</h1>
    <p>Georgia's greatest sports stars representing their nation on the world stage</p>
    <div class="stats">
        <div class="stat-box">
            <div class="number">${georgianAthletes?size}</div>
            <div class="label">Georgian Athletes</div>
        </div>
        <div class="stat-box">
            <div class="number">2</div>
            <div class="label">UFC Champions</div>
        </div>
        <div class="stat-box">
            <div class="number">2</div>
            <div class="label">Olympic Gold Medals</div>
        </div>
    </div>
</div>

<div class="container">
    <h2 class="section-title">🥊 MMA & UFC Champions</h2>
    <div class="athletes-grid">
        <#list georgianAthletes as athlete>
            <#if athlete.sport == "MMA & UFC">
            <div class="athlete-card">
                <div class="flag">🇬🇪</div>
                <div class="athlete-name">${athlete.name}</div>
                <span class="athlete-sport">${athlete.sport}</span>
                <div class="athlete-info">${athlete.info}</div>
                <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
            </div>
            </#if>
        </#list>
    </div>

    <h2 class="section-title">⚽ Football</h2>
    <div class="athletes-grid">
        <#list georgianAthletes as athlete>
            <#if athlete.sport == "Football">
            <div class="athlete-card">
                <div class="flag">🇬🇪</div>
                <div class="athlete-name">${athlete.name}</div>
                <span class="athlete-sport">${athlete.sport}</span>
                <div class="athlete-info">${athlete.info}</div>
                <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
            </div>
            </#if>
        </#list>
    </div>

    <h2 class="section-title">🏀 Basketball</h2>
    <div class="athletes-grid">
        <#list georgianAthletes as athlete>
            <#if athlete.sport == "Basketball">
            <div class="athlete-card">
                <div class="flag">🇬🇪</div>
                <div class="athlete-name">${athlete.name}</div>
                <span class="athlete-sport">${athlete.sport}</span>
                <div class="athlete-info">${athlete.info}</div>
                <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
            </div>
            </#if>
        </#list>
    </div>

    <h2 class="section-title">🏅 Olympics</h2>
    <div class="athletes-grid">
        <#list georgianAthletes as athlete>
            <#if athlete.sport == "Olympics">
            <div class="athlete-card">
                <div class="flag">🇬🇪</div>
                <div class="athlete-name">${athlete.name}</div>
                <span class="athlete-sport">${athlete.sport}</span>
                <div class="athlete-info">${athlete.info}</div>
                <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
            </div>
            </#if>
        </#list>
    </div>
</div>

</body>
</html>
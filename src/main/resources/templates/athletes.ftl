<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
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
        .container { padding: 40px; max-width: 1200px; margin: 0 auto; }
        .section-title { color: #e94560; font-size: 2em; margin: 40px 0 20px; border-bottom: 2px solid #e94560; padding-bottom: 10px; }
        .georgian-badge { background-color: #e94560; color: white; padding: 3px 10px; border-radius: 10px; font-size: 0.75em; margin-left: 10px; vertical-align: middle; }
        .athletes-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-bottom: 20px; }
        .athlete-card { background-color: #16213e; border-radius: 10px; padding: 20px; border-left: 4px solid #e94560; transition: transform 0.2s; }
        .athlete-card:hover { transform: translateY(-3px); }
        .athlete-card.georgian { border-left: 4px solid #FFD700; }
        .athlete-name { color: #e94560; font-size: 1.2em; font-weight: bold; margin-bottom: 5px; }
        .athlete-card.georgian .athlete-name { color: #FFD700; }
        .athlete-nationality { color: #aaa; font-size: 0.85em; margin-bottom: 10px; }
        .athlete-info { color: #ccc; font-size: 0.9em; line-height: 1.5; margin-bottom: 10px; }
        .athlete-achievement { background-color: #0f3460; padding: 8px 12px; border-radius: 5px; font-size: 0.85em; color: #e94560; font-weight: bold; }
    </style>
</head>
<body>

<nav>
    <span class="logo">🏆 SportsHistory</span>
    <a href="/">Home</a>
    <a href="/athletes">Athletes</a>
    <a href="/search">Search</a>
    <a href="/about">About</a>
</nav>

<div class="hero">
    <h1>🌟 Athletes</h1>
    <p>The greatest athletes from every sport</p>
</div>

<div class="container">

    <h2 class="section-title">🇬🇪 Georgian Athletes</h2>
    <div class="athletes-grid">
        <#list georgianAthletes as athlete>
        <div class="athlete-card georgian">
            <div class="athlete-name">${athlete.name} 🇬🇪</div>
            <div class="athlete-nationality">${athlete.sport} • ${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">⚽ Football</h2>
    <div class="athletes-grid">
        <#list footballAthletes as athlete>
        <div class="athlete-card <#if athlete.georgian>georgian</#if>">
            <div class="athlete-name">${athlete.name}<#if athlete.georgian> 🇬🇪</#if></div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏀 Basketball</h2>
    <div class="athletes-grid">
        <#list basketballAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏎️ Formula 1</h2>
    <div class="athletes-grid">
        <#list formula1Athletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🎾 Tennis</h2>
    <div class="athletes-grid">
        <#list tennisAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏈 NFL</h2>
    <div class="athletes-grid">
        <#list nflAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🥊 MMA & UFC</h2>
    <div class="athletes-grid">
        <#list mmaAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏉 Rugby</h2>
    <div class="athletes-grid">
        <#list rugbyAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏅 Olympics</h2>
    <div class="athletes-grid">
        <#list olympicsAthletes as athlete>
        <div class="athlete-card <#if athlete.georgian>georgian</#if>">
            <div class="athlete-name">${athlete.name}<#if athlete.georgian> 🇬🇪</#if></div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <h2 class="section-title">🏆 World Cup 2026 - Top Teams</h2>
    <div class="athletes-grid">
        <#list worldcupAthletes as athlete>
        <div class="athlete-card">
            <div class="athlete-name">${athlete.name}</div>
            <div class="athlete-nationality">${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

</div>

</body>
</html>
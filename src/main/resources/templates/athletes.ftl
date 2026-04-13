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
        .hero h1 { color: #e94560; font-size: 3em; margin-bottom: 10px; }
        .hero p { color: #aaa; font-size: 1.2em; }
        .container { padding: 40px; max-width: 1200px; margin: 0 auto; }
        .section-title { color: #e94560; font-size: 2em; margin: 40px 0 20px; border-bottom: 2px solid #e94560; padding-bottom: 10px; }
        .athletes-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-bottom: 20px; }
        .athlete-card {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px;
            border-left: 4px solid #e94560;
            transition: transform 0.3s, box-shadow 0.3s;
            opacity: 0;
            animation: fadeIn 0.5s forwards;
        }
        .athlete-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(233,69,96,0.3); }
        .athlete-card.georgian { border-left: 4px solid #FFD700; }
        .athlete-card.georgian:hover { box-shadow: 0 8px 25px rgba(255,215,0,0.3); }
        .athlete-card.retired { border-left: 4px solid #C0C0C0; }
        .athlete-card.retired:hover { box-shadow: 0 8px 25px rgba(192,192,192,0.3); }
        .athlete-name { color: #e94560; font-size: 1.2em; font-weight: bold; margin-bottom: 5px; }
        .athlete-card.georgian .athlete-name { color: #FFD700; }
        .athlete-card.retired .athlete-name { color: #C0C0C0; }
        .athlete-nationality { color: #aaa; font-size: 0.85em; margin-bottom: 10px; }
        .athlete-info { color: #ccc; font-size: 0.9em; line-height: 1.5; margin-bottom: 10px; }
        .athlete-achievement { background-color: #0f3460; padding: 8px 12px; border-radius: 5px; font-size: 0.85em; color: #e94560; font-weight: bold; }
        .athlete-card.georgian .athlete-achievement { color: #FFD700; }
        .athlete-card.retired .athlete-achievement { color: #C0C0C0; }
        .pagination { display: flex; justify-content: center; gap: 10px; margin: 40px 0; align-items: center; }
        .pagination a { background-color: #e94560; color: white; padding: 10px 20px; border-radius: 20px; text-decoration: none; font-weight: bold; transition: background 0.3s, transform 0.2s; }
        .pagination a:hover { background-color: #c73652; transform: translateY(-2px); }
        .pagination span { padding: 10px 20px; background-color: #16213e; border-radius: 20px; }
        .sport-filter { display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 30px; justify-content: center; }
        .sport-filter a { background-color: #16213e; color: white; padding: 8px 18px; border-radius: 20px; text-decoration: none; font-weight: bold; border: 2px solid #16213e; transition: all 0.3s; }
        .sport-filter a:hover { border-color: #e94560; transform: translateY(-2px); }
        .sport-filter a.active { background-color: #e94560; border-color: #e94560; }
        .legend-note { display: flex; gap: 20px; justify-content: center; margin-bottom: 20px; flex-wrap: wrap; }
        .legend-note span { padding: 6px 16px; border-radius: 20px; font-size: 0.85em; font-weight: bold; }
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

        .athlete-card.georgian-legend {
            border-left: 4px solid #FFD700;
            border-right: 4px solid #C0C0C0;
        }
        .athlete-card.georgian-legend .athlete-name {
            background: linear-gradient(90deg, #FFD700, #C0C0C0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
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
    <h1>🌟 Athletes</h1>
    <p>The greatest athletes from every sport</p>
</div>

<div class="container">



    <h2 class="section-title">🌍 All Athletes</h2>

    <div class="legend-note">
        <span style="border: 2px solid #e94560; color: #e94560;">⚽ Active Athlete</span>
        <span style="border: 2px solid #FFD700; color: #FFD700;">🇬🇪 Georgian Athlete</span>
        <span style="border: 2px solid #C0C0C0; color: #C0C0C0;">🏆 Retired Legend</span>
    </div>

    <div class="sport-filter">
        <a href="/athletes" class="${(!selectedSport??)?then('active', '')}">All</a>
        <a href="/athletes?sport=Football" class="${(selectedSport?? && selectedSport == 'Football')?then('active', '')}">⚽ Football (${footballCount})</a>
        <a href="/athletes?sport=Basketball" class="${(selectedSport?? && selectedSport == 'Basketball')?then('active', '')}">🏀 Basketball (${basketballCount})</a>
        <a href="/athletes?sport=Formula 1" class="${(selectedSport?? && selectedSport == 'Formula 1')?then('active', '')}">🏎️ Formula 1 (${formula1Count})</a>
        <a href="/athletes?sport=Tennis" class="${(selectedSport?? && selectedSport == 'Tennis')?then('active', '')}">🎾 Tennis (${tennisCount})</a>
        <a href="/athletes?sport=NFL" class="${(selectedSport?? && selectedSport == 'NFL')?then('active', '')}">🏈 NFL (${nflCount})</a>
        <a href="/athletes?sport=MMA %26 UFC" class="${(selectedSport?? && selectedSport == 'MMA & UFC')?then('active', '')}">🥊 MMA & UFC (${mmaCount})</a>
        <a href="/athletes?sport=Rugby" class="${(selectedSport?? && selectedSport == 'Rugby')?then('active', '')}">🏉 Rugby (${rugbyCount})</a>
        <a href="/athletes?sport=Olympics" class="${(selectedSport?? && selectedSport == 'Olympics')?then('active', '')}">🏅 Olympics (${olympicsCount})</a>
        <a href="/athletes?sport=World Cup 2026" class="${(selectedSport?? && selectedSport == 'World Cup 2026')?then('active', '')}">🏆 World Cup 2026 (${worldcupCount})</a>
    </div>

    <div class="athletes-grid">
        <#list athletes as athlete>
        <div class="athlete-card <#if athlete.georgian && athlete.retired>georgian-legend<#elseif athlete.georgian>georgian<#elseif athlete.retired>retired</#if>">
            <div class="athlete-name">${athlete.name}<#if athlete.georgian> 🇬🇪</#if><#if athlete.retired> 🏆</#if></div>
            <div class="athlete-nationality">${athlete.sport} • ${athlete.nationality}</div>
            <div class="athlete-info">${athlete.info}</div>
            <div class="athlete-achievement">🏆 ${athlete.achievement}</div>
        </div>
        </#list>
    </div>

    <div class="pagination">
        <#if currentPage gt 0>
            <a href="/athletes?page=${currentPage - 1}<#if selectedSport??>&sport=${selectedSportEncoded}</#if>">← Previous</a>
        </#if>
        <span>Page ${currentPage + 1} of ${totalPages}</span>
        <#if currentPage lt totalPages - 1>
            <a href="/athletes?page=${currentPage + 1}<#if selectedSport??>&sport=${selectedSportEncoded}</#if>">Next →</a>
        </#if>
    </div>

</div>

</body>
</html>
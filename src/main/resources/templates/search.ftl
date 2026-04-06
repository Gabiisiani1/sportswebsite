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
        .hero h1 { color: #e94560; font-size: 3em; margin-bottom: 20px; }
        .search-box { display: flex; justify-content: center; gap: 10px; margin-top: 20px; }
        .search-box input {
            padding: 12px 20px;
            border-radius: 25px;
            border: 2px solid #e94560;
            background-color: #16213e;
            color: white;
            font-size: 1em;
            width: 350px;
            outline: none;
        }
        .search-box button {
            padding: 12px 25px;
            border-radius: 25px;
            border: none;
            background-color: #e94560;
            color: white;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
        }
        .search-box button:hover { background-color: #c73652; }
        .container { padding: 40px; max-width: 900px; margin: 0 auto; }
        h2 { color: #e94560; margin-bottom: 20px; font-size: 1.5em; }
        .result {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px 25px;
            margin: 15px 0;
            display: flex;
            align-items: center;
            gap: 20px;
            transition: transform 0.2s;
        }
        .result:hover { transform: translateX(5px); }
        .result .emoji { font-size: 2.5em; }
        .result h3 { color: #e94560; margin-bottom: 5px; }
        .result p { color: #aaa; font-size: 0.95em; }
        .result a {
            margin-left: auto;
            background-color: #e94560;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            white-space: nowrap;
        }
        .result a:hover { background-color: #c73652; }
        .athlete-result {
            background-color: #16213e;
            border-radius: 10px;
            padding: 20px 25px;
            margin: 15px 0;
            border-left: 4px solid #e94560;
            transition: transform 0.2s;
        }
        .athlete-result.georgian { border-left: 4px solid #FFD700; }
        .athlete-result:hover { transform: translateX(5px); }
        .athlete-result h3 { color: #e94560; margin-bottom: 5px; }
        .athlete-result.georgian h3 { color: #FFD700; }
        .athlete-result .sport-tag { background-color: #0f3460; padding: 3px 10px; border-radius: 10px; font-size: 0.8em; margin-left: 10px; }
        .athlete-result p { color: #aaa; font-size: 0.95em; margin-top: 8px; }
        .athlete-result .achievement { color: #e94560; font-size: 0.85em; font-weight: bold; margin-top: 8px; }
        .no-results { text-align: center; color: #aaa; font-size: 1.2em; margin-top: 40px; }
        .section-title { color: #e94560; font-size: 1.8em; margin: 30px 0 15px; border-bottom: 2px solid #e94560; padding-bottom: 10px; }
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
    <h1>🔍 Search</h1>
    <form class="search-box" action="/search" method="get">
        <input type="text" name="keyword" placeholder="Search sports or athletes..." value="${keyword!}"/>
        <button type="submit">Search</button>
    </form>
</div>

<div class="container">
    <#if keyword?? && keyword?has_content>

        <#if results?size == 0 && athleteResults?size == 0>
            <p class="no-results">No results found for "${keyword}" 😕 Try another search!</p>
        </#if>

        <#if results?size gt 0>
        <h2 class="section-title">🏟️ Sports (${results?size})</h2>
        <#list results as sport>
        <div class="result">
            <span class="emoji">${sport.emoji}</span>
            <div>
                <h3>${sport.name}</h3>
                <p>${sport.description}</p>
            </div>
            <a href="/sport/${sport.urlName}">View →</a>
        </div>
        </#list>
        </#if>

        <#if athleteResults?size gt 0>
        <h2 class="section-title">🌟 Athletes (${athleteResults?size})</h2>
        <#list athleteResults as athlete>
        <div class="athlete-result <#if athlete.georgian>georgian</#if>">
            <h3>${athlete.name}<#if athlete.georgian> 🇬🇪</#if> <span class="sport-tag">${athlete.sport}</span></h3>
            <p>${athlete.info}</p>
            <p class="achievement">🏆 ${athlete.achievement}</p>
        </div>
        </#list>
        </#if>

    <#else>
        <h2 class="section-title">🏟️ All Sports</h2>
        <#list results as sport>
        <div class="result">
            <span class="emoji">${sport.emoji}</span>
            <div>
                <h3>${sport.name}</h3>
                <p>${sport.description}</p>
            </div>
            <a href="/sport/${sport.urlName}">View →</a>
        </div>
        </#list>
    </#if>
</div>

</body>
</html>
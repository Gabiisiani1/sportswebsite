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
        .no-results { text-align: center; color: #aaa; font-size: 1.2em; margin-top: 40px; }
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
    <h1>🔍 Search Sports</h1>
    <form class="search-box" action="/search" method="get">
        <input type="text" name="keyword" placeholder="Search for a sport..." value="${keyword!}"/>
        <button type="submit">Search</button>
    </form>
</div>

<div class="container">
    <#if keyword?? && keyword?has_content>
        <h2>Results for "${keyword}"</h2>
        <#if results?size == 0>
            <p class="no-results">No sports found for "${keyword}" 😕 Try another search!</p>
        <#else>
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
    <#else>
        <h2>All Sports</h2>
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
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
        .hero {
            background: linear-gradient(135deg, #16213e, #0f3460);
            padding: 40px;
            text-align: center;
        }
        .hero img {
            width: 100%;
            max-height: 350px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 25px;
        }
        .hero .emoji { font-size: 4em; margin-bottom: 10px; }
        .hero h1 { color: #e94560; font-size: 3em; margin-bottom: 15px; }
        .hero p { color: #aaa; font-size: 1.2em; max-width: 700px; margin: 0 auto; }
        .container { padding: 40px; max-width: 900px; margin: 0 auto; }
        h2 { color: #e94560; margin-bottom: 20px; font-size: 1.8em; }
        .fact { background-color: #16213e; border-radius: 10px; padding: 20px 25px; margin: 15px 0; border-left: 4px solid #e94560; font-size: 1.1em; line-height: 1.6; }
        .back-btn { display: inline-block; margin-bottom: 30px; background-color: #16213e; color: white; padding: 10px 20px; border-radius: 20px; text-decoration: none; font-weight: bold; }
        .back-btn:hover { background-color: #e94560; }
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

    <div class="emoji">${sport.emoji}</div>
    <h1>${sport.name}</h1>
    <p>${sport.description}</p>
</div>

<div class="container">
    <a href="/" class="back-btn">← Back to Home</a>
    <h2>📖 Key Facts</h2>
        <div class="fact">${sport.fact1}</div>
        <div class="fact">${sport.fact2}</div>
        <div class="fact">${sport.fact3}</div>
        <div class="fact">${sport.fact4}</div>
        <div class="fact">${sport.fact5}</div>
        <#if sport.fact6?? && sport.fact6?has_content><div class="fact">${sport.fact6}</div></#if>
        <#if sport.fact7?? && sport.fact7?has_content><div class="fact">${sport.fact7}</div></#if>
        <#if sport.fact8?? && sport.fact8?has_content><div class="fact">${sport.fact8}</div></#if>
        <#if sport.fact9?? && sport.fact9?has_content><div class="fact">${sport.fact9}</div></#if>
        <#if sport.fact10?? && sport.fact10?has_content><div class="fact">${sport.fact10}</div></#if>

</div>

</body>
</html>
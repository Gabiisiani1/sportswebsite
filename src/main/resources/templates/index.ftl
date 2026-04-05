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
        .container { padding: 40px; }
        .cards { display: flex; gap: 20px; justify-content: center; flex-wrap: wrap; }
        .card-link { text-decoration: none; color: inherit; }
        .card {
            background-color: #16213e;
            border-radius: 10px;
            padding: 30px;
            width: 260px;
            text-align: center;
            transition: transform 0.3s;
            cursor: pointer;
        }
        .card:hover { transform: translateY(-5px); }
        .card .emoji { font-size: 3em; margin-bottom: 15px; }
        .card h2 { color: #e94560; margin-bottom: 10px; }
        .card p { color: #aaa; font-size: 0.95em; }
        h2.section-title { color: #e94560; text-align: center; font-size: 2em; margin: 40px 0 20px; }
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
    <h1>🏆 Sports History Website</h1>
    <p>Explore the history of the world's greatest sports</p>
</div>

<div class="container">
    <h2 class="section-title">Browse Sports</h2>
    <div class="cards">
        <#list sports as sport>
        <a href="/sport/${sport.urlName}" class="card-link">
            <div class="card">
                <#if sport.imageUrl?? && sport.imageUrl?has_content>
                    <img src="${sport.imageUrl}" alt="${sport.name}" onerror="this.style.display='none'" style="width:100%; height:150px; object-fit:cover; border-radius:8px; margin-bottom:15px;"/>
                </#if>
                <div class="emoji">${sport.emoji}</div>
                <h2>${sport.name}</h2>
                <p>${sport.description}</p>
            </div>
        </a>
        </#list>
    </div>
</div>

</body>
</html>
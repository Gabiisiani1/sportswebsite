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
        .container { padding: 40px; max-width: 800px; margin: 0 auto; }
        h1 { color: #e94560; margin-bottom: 30px; }
        .form-section { background-color: #16213e; border-radius: 10px; padding: 30px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #aaa; font-weight: bold; }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px 15px;
            border-radius: 8px;
            border: 2px solid #0f3460;
            background-color: #1a1a2e;
            color: white;
            font-size: 1em;
        }
        .form-group input:focus, .form-group select:focus { outline: none; border-color: #e94560; }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .error { color: #e94560; font-size: 0.85em; margin-top: 5px; }
        .btn { padding: 10px 25px; border-radius: 20px; border: none; cursor: pointer; font-weight: bold; font-size: 1em; }
        .btn-primary { background-color: #e94560; color: white; }
        .btn-secondary { background-color: #16213e; color: white; border: 2px solid #e94560; text-decoration: none; display: inline-block; }
        .checkbox-group { display: flex; gap: 20px; }
        .checkbox-group label { display: flex; align-items: center; gap: 8px; color: white; cursor: pointer; }
    </style>
</head>
<body>

<nav>
    <span class="logo">🏆 SportsHistory</span>
    <a href="/">Home</a>
    <a href="/admin" style="background-color:#e94560;">⚙️ Admin</a>
</nav>

<div class="container">
    <h1>✏️ Edit Athlete</h1>

    <div class="form-section">
        <form action="/admin/athletes/edit/${athlete.id}" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label>Name *</label>
                    <input type="text" name="name" value="${athlete.name}"/>
                </div>
                <div class="form-group">
                    <label>Sport *</label>
                    <select name="sport">
                        <option value="Football" <#if athlete.sport == "Football">selected</#if>>⚽ Football</option>
                        <option value="Basketball" <#if athlete.sport == "Basketball">selected</#if>>🏀 Basketball</option>
                        <option value="Formula 1" <#if athlete.sport == "Formula 1">selected</#if>>🏎️ Formula 1</option>
                        <option value="Tennis" <#if athlete.sport == "Tennis">selected</#if>>🎾 Tennis</option>
                        <option value="NFL" <#if athlete.sport == "NFL">selected</#if>>🏈 NFL</option>
                        <option value="MMA & UFC" <#if athlete.sport == "MMA & UFC">selected</#if>>🥊 MMA & UFC</option>
                        <option value="Rugby" <#if athlete.sport == "Rugby">selected</#if>>🏉 Rugby</option>
                        <option value="Olympics" <#if athlete.sport == "Olympics">selected</#if>>🏅 Olympics</option>
                        <option value="World Cup 2026" <#if athlete.sport == "World Cup 2026">selected</#if>>🏆 World Cup 2026</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Nationality *</label>
                    <input type="text" name="nationality" value="${athlete.nationality}"/>
                </div>
                <div class="form-group">
                    <label>Achievement</label>
                    <input type="text" name="achievement" value="${athlete.achievement!}"/>
                </div>
            </div>
            <div class="form-group">
                <label>Info *</label>
                <textarea name="info" rows="4">${athlete.info}</textarea>
            </div>
            <div class="form-group">
                <div class="checkbox-group">
                    <label><input type="checkbox" name="georgian" value="true" <#if athlete.georgian>checked</#if>/> 🇬🇪 Georgian</label>
                    <label><input type="checkbox" name="retired" value="true" <#if athlete.retired>checked</#if>/> 🏆 Retired Legend</label>
                </div>
            </div>
            <div style="display:flex; gap:15px; margin-top:20px;">
                <button type="submit" class="btn btn-primary">💾 Save Changes</button>
                <a href="/admin" class="btn btn-secondary">← Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
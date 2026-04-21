<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #1a1a2e; color: white; }
        nav { background-color: #16213e; padding: 15px 30px; display: flex; gap: 20px; align-items: center; }
        nav a { color: white; text-decoration: none; padding: 8px 18px; border-radius: 20px; font-weight: bold; transition: background 0.3s; }
        nav a:hover { background-color: #e94560; }
        nav .logo { color: #e94560; font-size: 1.3em; margin-right: auto; }
        .container { padding: 40px; max-width: 1200px; margin: 0 auto; }
        h1 { color: #e94560; margin-bottom: 30px; }
        h2 { color: #e94560; margin-bottom: 20px; }
        .stats { display: flex; gap: 20px; margin-bottom: 40px; }
        .stat-box { background-color: #16213e; padding: 20px 30px; border-radius: 10px; text-align: center; border-left: 4px solid #e94560; }
        .stat-box .number { font-size: 2.5em; font-weight: bold; color: #e94560; }
        .stat-box .label { color: #aaa; }
        .form-section { background-color: #16213e; border-radius: 10px; padding: 30px; margin-bottom: 40px; }
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
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none;
            border-color: #e94560;
        }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .error { color: #e94560; font-size: 0.85em; margin-top: 5px; }
        .btn { padding: 10px 25px; border-radius: 20px; border: none; cursor: pointer; font-weight: bold; font-size: 1em; }
        .btn-primary { background-color: #e94560; color: white; }
        .btn-primary:hover { background-color: #c73652; }
        .btn-danger { background-color: #c0392b; color: white; }
        .btn-warning { background-color: #f39c12; color: white; }
        .success-msg { background-color: #27ae60; padding: 15px 20px; border-radius: 8px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th { background-color: #0f3460; padding: 12px; text-align: left; color: #e94560; }
        td { padding: 10px 12px; border-bottom: 1px solid #0f3460; font-size: 0.9em; }
        tr:hover { background-color: #0f3460; }
        .checkbox-group { display: flex; gap: 20px; }
        .checkbox-group label { display: flex; align-items: center; gap: 8px; color: white; cursor: pointer; }
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
    <a href="/admin" style="background-color:#e94560;">⚙️ Admin</a>
</nav>

<div class="container">
    <h1>⚙️ Admin Panel</h1>

    <#if successMessage??>
    <#if errors??>
    <div style="background-color:#c0392b; padding:15px 20px; border-radius:8px; margin-bottom:20px;">
        ❌ Please fix the following errors:
        <ul style="margin-top:10px; margin-left:20px;">
        <#list errors as error>
            <li>${error.defaultMessage}</li>
        </#list>
        </ul>
    </div>
    </#if>
    <div class="success-msg">✅ ${successMessage}</div>
    </#if>

    <div class="stats">
        <div class="stat-box">
            <div class="number">${sportCount}</div>
            <div class="label">Sports</div>
        </div>
        <div class="stat-box">
            <div class="number">${athleteCount}</div>
            <div class="label">Athletes</div>
        </div>
    </div>

    <div class="form-section">
        <h2>➕ Add New Athlete</h2>
        <form action="/admin/athletes/add" method="post" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group">
                    <label>Name *</label>
<input type="text" name="name" value="${newAthlete.name!}" placeholder="Athlete name"/>
<#if newAthlete?? && (newAthlete.name)?? == false>
<span class="error">Name is required</span>
</#if>
                    <#if newAthlete?? && newAthlete.name?? == false>
                    </#if>
                </div>
                <div class="form-group">
                    <label>Sport *</label>
                    <select name="sport">
                        <option value="">Select sport...</option>
                        <option value="Football">⚽ Football</option>
                        <option value="Basketball">🏀 Basketball</option>
                        <option value="Formula 1">🏎️ Formula 1</option>
                        <option value="Tennis">🎾 Tennis</option>
                        <option value="NFL">🏈 NFL</option>
                        <option value="MMA & UFC">🥊 MMA & UFC</option>
                        <option value="Rugby">🏉 Rugby</option>
                        <option value="Olympics">🏅 Olympics</option>
                        <option value="World Cup 2026">🏆 World Cup 2026</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Nationality *</label>
                    <input type="text" name="nationality" placeholder="e.g. Georgian"/>
                </div>
                <div class="form-group">
                    <label>Achievement</label>
                    <input type="text" name="achievement" placeholder="e.g. Olympic Gold Medal"/>
                </div>
            </div>
            <div class="form-group">
                <label>Info *</label>
                <textarea name="info" rows="3" placeholder="Athlete biography and information..."></textarea>
            </div>
            <div class="form-group">
                <label>Upload Image (optional)</label>
                <input type="file" name="imageFile" accept="image/*"/>
            </div>
            <div class="form-group">
                <div class="checkbox-group">
                    <input type="hidden" name="georgian" value="false"/>
                    <label><input type="checkbox" name="georgian" value="true"/> 🇬🇪 Georgian Athlete</label>
                    <input type="hidden" name="retired" value="false"/>
                    <label><input type="checkbox" name="retired" value="true"/> 🏆 Retired Legend</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">➕ Add Athlete</button>
        </form>
    </div>

    <div class="form-section">
        <h2>📋 All Athletes</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Sport</th>
                <th>Nationality</th>
                <th>Georgian</th>
                <th>Retired</th>
                <th>Actions</th>
            </tr>
            <#list athletes as athlete>
            <tr>
                <td>${athlete.name}</td>
                <td>${athlete.sport}</td>
                <td>${athlete.nationality}</td>
                <td><#if athlete.georgian>🇬🇪</#if></td>
                <td><#if athlete.retired>🏆</#if></td>
                <td>
                    <a href="/admin/athletes/edit/${athlete.id}" class="btn btn-warning" style="padding:5px 12px; font-size:0.85em;">✏️ Edit</a>
                    <form action="/admin/athletes/delete/${athlete.id}" method="post" style="display:inline;">
                        <button type="submit" class="btn btn-danger" style="padding:5px 12px; font-size:0.85em;" onclick="return confirm('Delete ${athlete.name}?')">🗑️ Delete</button>
                    </form>
                </td>
            </tr>
            </#list>
        </table>
    </div>
</div>

</body>
</html>
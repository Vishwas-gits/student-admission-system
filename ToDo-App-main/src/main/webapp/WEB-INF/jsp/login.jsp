<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Admission — Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>

        /* ===== CSS Variables ===== */
        :root {
            --navy: #0d1f3c;
            --navy-mid: #1a3260;
            --accent: #c8973a;
            --accent-light: #f0c97a;
            --white: #ffffff;
            --text-dark: #0d1f3c;
            --success: #1d7a5f;
            --danger: #a8302a;
            --border: #d8dff0;
            --shadow: 0 8px 40px rgba(13,31,60,0.18);
        }

        /* ===== Reset ===== */
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        /* ===== PAGE BACKGROUND ===== */
        body {
            background-color: #0d1f3c;
            background-image:
                radial-gradient(ellipse at 20% 50%, rgba(26,50,96,0.8) 0%, transparent 60%),
                radial-gradient(ellipse at 80% 20%, rgba(200,151,58,0.12) 0%, transparent 50%),
                radial-gradient(ellipse at 60% 80%, rgba(13,31,60,0.9) 0%, transparent 55%),
                linear-gradient(135deg, #0a1628 0%, #0d1f3c 40%, #1a3260 100%);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 16px;
            position: relative;
            overflow: hidden;
        }

        /* Animated floating orbs */
        body::before {
            content: '';
            position: fixed;
            top: -120px; left: -120px;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(200,151,58,0.08) 0%, transparent 70%);
            border-radius: 50%;
            animation: floatOrb1 8s ease-in-out infinite;
            pointer-events: none;
        }

        body::after {
            content: '';
            position: fixed;
            bottom: -100px; right: -100px;
            width: 350px; height: 350px;
            background: radial-gradient(circle, rgba(26,50,96,0.6) 0%, transparent 70%);
            border-radius: 50%;
            animation: floatOrb2 10s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes floatOrb1 {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50%       { transform: translate(40px, 30px) scale(1.1); }
        }

        @keyframes floatOrb2 {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50%       { transform: translate(-30px, -40px) scale(1.08); }
        }

        /* Subtle dot grid pattern */
        .bg-grid {
            position: fixed;
            inset: 0;
            background-image: radial-gradient(rgba(255,255,255,0.04) 1px, transparent 1px);
            background-size: 32px 32px;
            pointer-events: none;
            z-index: 0;
        }

        /* ===== LOGIN CARD BACKGROUND ===== */
        .login-card {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 460px;
            background-color: rgba(255,255,255,0.04);
            background-image: linear-gradient(
                145deg,
                rgba(255,255,255,0.08) 0%,
                rgba(255,255,255,0.03) 50%,
                rgba(13,31,60,0.2) 100%
            );
            border: 1px solid rgba(255,255,255,0.10);
            border-radius: 24px;
            padding: 0;
            box-shadow:
                0 20px 60px rgba(0,0,0,0.5),
                inset 0 1px 0 rgba(255,255,255,0.10);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            animation: cardReveal 0.7s cubic-bezier(0.22,1,0.36,1) both;
        }

        @keyframes cardReveal {
            from { opacity: 0; transform: translateY(30px) scale(0.97); }
            to   { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* ===== CARD HEADER BACKGROUND ===== */
        .card-header {
            background-color: rgba(200,151,58,0.10);
            background-image: linear-gradient(
                135deg,
                rgba(200,151,58,0.15) 0%,
                rgba(200,151,58,0.05) 60%,
                transparent 100%
            );
            border-bottom: 1px solid rgba(200,151,58,0.20);
            border-radius: 24px 24px 0 0;
            padding: 36px 40px 30px;
            text-align: center;
            position: relative;
        }

        /* Gold top line */
        .card-header::before {
            content: '';
            position: absolute;
            top: 0; left: 50%;
            transform: translateX(-50%);
            width: 80px; height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent), transparent);
            border-radius: 0 0 4px 4px;
        }

        /* ===== LOGO / ICON BACKGROUND ===== */
        .logo-wrap {
            width: 72px; height: 72px;
            margin: 0 auto 18px;
            background-color: #0d1f3c;
            background-image: linear-gradient(135deg, #0d1f3c 0%, #1a3260 100%);
            border-radius: 50%;
            border: 2px solid rgba(200,151,58,0.40);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            box-shadow:
                0 0 0 6px rgba(200,151,58,0.08),
                0 8px 24px rgba(0,0,0,0.4);
        }

        .card-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 1.7rem;
            font-weight: 700;
            color: #ffffff;
            letter-spacing: -0.3px;
            margin-bottom: 6px;
        }

        .card-header p {
            color: rgba(255,255,255,0.50);
            font-size: 0.87rem;
            font-weight: 400;
            letter-spacing: 0.03em;
        }

        /* ===== FORM BODY BACKGROUND ===== */
        .card-body {
            background-color: transparent;
            padding: 32px 40px 40px;
        }

        /* ===== ERROR MESSAGE BACKGROUND ===== */
        .error-msg {
            background-color: rgba(168,48,42,0.15);
            background-image: linear-gradient(90deg, rgba(168,48,42,0.20), rgba(168,48,42,0.08));
            border: 1px solid rgba(168,48,42,0.35);
            border-left: 3px solid #a8302a;
            border-radius: 8px;
            color: #ffb3af;
            font-size: 0.86rem;
            font-weight: 500;
            padding: 12px 16px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* ===== SUCCESS MESSAGE BACKGROUND ===== */
        .success-msg {
            background-color: rgba(29,122,95,0.15);
            background-image: linear-gradient(90deg, rgba(29,122,95,0.20), rgba(29,122,95,0.08));
            border: 1px solid rgba(29,122,95,0.35);
            border-left: 3px solid #1d7a5f;
            border-radius: 8px;
            color: #7ee8c8;
            font-size: 0.86rem;
            font-weight: 500;
            padding: 12px 16px;
            margin-bottom: 24px;
        }

        /* ===== FORM GROUP BACKGROUND ===== */
        .form-group {
            background-color: transparent;
            margin-bottom: 20px;
        }

        /* ===== LABEL BACKGROUND ===== */
        label {
            display: block;
            background-color: transparent;
            color: rgba(255,255,255,0.75);
            font-size: 0.82rem;
            font-weight: 600;
            letter-spacing: 0.07em;
            text-transform: uppercase;
            margin-bottom: 9px;
        }

        /* ===== INPUT WRAPPER BACKGROUND ===== */
        .input-wrap {
            position: relative;
            background-color: rgba(255,255,255,0.05);
            background-image: linear-gradient(
                180deg,
                rgba(255,255,255,0.07) 0%,
                rgba(255,255,255,0.03) 100%
            );
            border: 1.5px solid rgba(255,255,255,0.12);
            border-radius: 10px;
            transition: all 0.22s ease;
        }

        .input-wrap:hover {
            border-color: rgba(200,151,58,0.35);
            background-color: rgba(255,255,255,0.07);
        }

        .input-wrap:focus-within {
            border-color: var(--accent);
            background-color: rgba(200,151,58,0.06);
            background-image: linear-gradient(
                180deg,
                rgba(200,151,58,0.08) 0%,
                rgba(200,151,58,0.03) 100%
            );
            box-shadow: 0 0 0 3px rgba(200,151,58,0.14);
        }

        .input-icon {
            position: absolute;
            left: 15px; top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,0.35);
            font-size: 1rem;
            pointer-events: none;
            transition: color 0.2s ease;
        }

        .input-wrap:focus-within .input-icon {
            color: var(--accent);
        }

        /* ===== INPUT BACKGROUND ===== */
        .form-control {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
            padding: 13px 16px 13px 44px;
            font-family: 'DM Sans', sans-serif;
            font-size: 0.94rem;
            color: #ffffff;
            border-radius: 10px;
        }

        .form-control::placeholder {
            color: rgba(255,255,255,0.28);
        }

        /* ===== REMEMBER ROW ===== */
        .remember-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: transparent;
            margin-bottom: 28px;
            margin-top: 4px;
        }

        .remember-row label {
            display: flex;
            align-items: center;
            gap: 8px;
            color: rgba(255,255,255,0.55);
            font-size: 0.84rem;
            text-transform: none;
            letter-spacing: 0;
            cursor: pointer;
            margin-bottom: 0;
        }

        /* Custom checkbox */
        .remember-row input[type="checkbox"] {
            width: 16px; height: 16px;
            accent-color: var(--accent);
            cursor: pointer;
        }

        .forgot-link {
            color: var(--accent);
            font-size: 0.84rem;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .forgot-link:hover {
            color: var(--accent-light);
        }

        /* ===== LOGIN BUTTON BACKGROUND ===== */
        .btn-login {
            width: 100%;
            background-color: #c8973a;
            background-image: linear-gradient(
                135deg,
                #a87a28 0%,
                #c8973a 45%,
                #d4a84a 100%
            );
            color: #0d1f3c;
            border: none;
            border-radius: 11px;
            padding: 15px 24px;
            font-family: 'DM Sans', sans-serif;
            font-weight: 800;
            font-size: 0.96rem;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            cursor: pointer;
            box-shadow:
                0 5px 20px rgba(200,151,58,0.35),
                0 1px 0 rgba(255,255,255,0.15) inset;
            transition: all 0.22s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(255,255,255,0.18) 0%, transparent 60%);
            opacity: 0;
            transition: opacity 0.22s ease;
        }

        .btn-login:hover {
            background-color: #d4a84a;
            background-image: linear-gradient(135deg, #c8973a 0%, #d4a84a 100%);
            box-shadow: 0 8px 30px rgba(200,151,58,0.50);
            transform: translateY(-2px);
        }

        .btn-login:hover::before { opacity: 1; }
        .btn-login:active { transform: translateY(0); }

        /* ===== DIVIDER ===== */
        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 28px 0;
            color: rgba(255,255,255,0.25);
            font-size: 0.78rem;
            letter-spacing: 0.06em;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.12), transparent);
        }

        /* ===== CARD FOOTER BACKGROUND ===== */
        .card-footer {
            background-color: rgba(0,0,0,0.15);
            background-image: linear-gradient(90deg, rgba(0,0,0,0.10), rgba(26,50,96,0.15));
            border-top: 1px solid rgba(255,255,255,0.06);
            border-radius: 0 0 24px 24px;
            padding: 18px 40px;
            text-align: center;
            color: rgba(255,255,255,0.38);
            font-size: 0.80rem;
        }

        .card-footer span {
            color: var(--accent);
            font-weight: 600;
        }

        /* ===== SCROLLBAR ===== */
        ::-webkit-scrollbar { width: 7px; }
        ::-webkit-scrollbar-track { background-color: #0a1628; }
        ::-webkit-scrollbar-thumb {
            background-color: #1a3260;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover { background-color: var(--accent); }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 480px) {
            .card-header, .card-body { padding-left: 24px; padding-right: 24px; }
            .card-footer { padding-left: 24px; padding-right: 24px; }
            .card-header h1 { font-size: 1.45rem; }
        }

    </style>
</head>
<body>

    <div class="bg-grid"></div>

    <div class="login-card">

        <!-- Header -->
        <div class="card-header">
            <div class="logo-wrap">🎓</div>
            <h1>Welcome Back</h1>
            <p>Student Admission Management System</p>
        </div>

        <!-- Body -->
        <div class="card-body">

            <!-- Error Message (Spring will set this) -->
            <c:if test="${not empty error}">
                <div class="error-msg">⚠ ${error}</div>
            </c:if>

            <!-- Success / Logout Message -->
            <c:if test="${not empty message}">
                <div class="success-msg">✓ ${message}</div>
            </c:if>

            <!-- Login Form -->
            <form action="/login" method="post">

                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-wrap">
                        <span class="input-icon">👤</span>
                        <input type="text" id="username" name="username"
                               class="form-control"
                               placeholder="Enter your username"
                               required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrap">
                        <span class="input-icon">🔒</span>
                        <input type="password" id="password" name="password"
                               class="form-control"
                               placeholder="Enter your password"
                               required />
                    </div>
                </div>

                <div class="remember-row">
                    <label>
                        <input type="checkbox" name="remember" />
                        Remember me
                    </label>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </div>

                <button type="submit" class="btn-login">🔐 Login</button>

            </form>

            <div class="divider">STUDENT PORTAL</div>

        </div>

        <!-- Footer -->
        <div class="card-footer">
            © 2024 <span>Student Admission System</span> · All rights reserved
        </div>

    </div>

</body>
</html>
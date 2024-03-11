Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5417557
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148553; cv=none; b=nzASQK8I0C4/Zyu1OtPcN9zF+HeB5ec62MlBOjJWfsp8VchoM+47uvhstDOwzqWuaEm9FF+4vsqolMnwu9Q6Q2DHTPl+ZLw6tpHyvAiTQL6DmojHQjWfId5EpG+6YpeTtv7cVlCE70kSYI8AqS1d8EN8U02PB5RqdpHnGCobCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148553; c=relaxed/simple;
	bh=SHe823c6VGye6PdlJLuHS7JghDZjsCULh7bG4duNDrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPjbSegWo8EldDoCIOkpoCm/Gyc/dqF6ldDzMT8tl545K94EY0E3iO4GCL4LTKgNC4vVGlKR8VgHxnWS2NCEya/EJhlzFC1pCUgGuk/rXKYmeBWuP9rpb3IGLEAQoW7Jt9+D9tJY6Hs5bOpyzQj0IZU88s0W5im236Ffh8pGOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGQLmqYq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGQLmqYq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso243627266b.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148550; x=1710753350; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7VN7dAxY/atiKl1Kg9VLJc8sP0Tkd5ODVxcz6HIAw0=;
        b=WGQLmqYqi6P3XeAQse/lGYEP7bxMwayBNO+zy/s49HiEFfHNa5M+BsoHVLLOniVBq5
         Al/HugtaMVZRERO2Ndr+9PdwhAps5hlHeHhEH/Lo4TjTOJO2/EoD/L1CoDWnxqhEUY9Q
         xZt5kSk5HtvtCovcmvF/9iwxNWH71rBkXXW52WCQQ/k2SzZUgZX9NZvEzm0U8lEgHcm3
         h86a7Kxjz1uMWdDnVveLpjJM2oZ/zWZlBvj4+p0qVVyOpANVcs/7LGz8Kn93MJwAsS1M
         usudOJUmR38MgVsUUSWQB9qB2+i5J/6/YpgThEu37K2cWeoxYz69EpQMp+pIp28vpP3c
         HULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148550; x=1710753350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7VN7dAxY/atiKl1Kg9VLJc8sP0Tkd5ODVxcz6HIAw0=;
        b=SLGIZ81dsxhm5KYeG+xzMZYdjgXpuL68rYezvlIJUoSYIAS7a/NuMvKj4WweXD9VRJ
         i/wvXoIzXCXllkY9JFFIRriy6Qxxmxwt1KwKpu5FvS9Rj/0EyBnlWtbYopWpt/6FcsRh
         MxN9AVjAce03n6H51FJ453z0yaa8hPYKeow+524mTGcCbUqOD4QEjNwdkjAawtsVfzzr
         YU8prghBTzaLvLpAURnniaUBxiPItC/2x6qfuG0LSUyrlnkHYHvR0BaN7nMYHTBgb4Mu
         WaDEM/MZWr/FmcSA9eTF79lgqhGBgkz16pCCJlYbbM84PKBSLK5Pa0ieMq8BJJ2gIMH+
         Icbw==
X-Forwarded-Encrypted: i=1; AJvYcCXaU+kKW6DP/9NWQIqOXvFEsCF9BLN/DWnRjE+O1+/p2QjF2D4c2q2mJ4NTwHic3LA1ZD5zFxPEgZbwOLzyw0IN1DboFg==
X-Gm-Message-State: AOJu0YzBOBADdlG1xmRuk5eSZxVQdVuT/RrycH3hgA4wO5oRNIPcFnq6
	t7Riz8xpbu3e3mx+mQ3REFcandKF5CGETx/13HAdG4qFM7O6EnWvnSI8KOG4L8c=
X-Google-Smtp-Source: AGHT+IGs6MpU+OJdf17qXIWc5gk5kFevP1w8nstqMmBURQruw+S+ldJXmahriXpzUE/kIpVAuq56Rg==
X-Received: by 2002:a17:907:d041:b0:a46:1cd4:cb49 with SMTP id vb1-20020a170907d04100b00a461cd4cb49mr2430183ejc.48.1710148550112;
        Mon, 11 Mar 2024 02:15:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:45 +0100
Subject: [PATCH v3 8/9] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-8-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Several architectures defines this stub for the graph tracer,
and it is needed for CFI, as it needs a separate symbol for it.
The trick from include/asm-generic/vmlinux.lds.h to define
ftrace_stub_graph to ftrace_stub isn't working when using CFI.
Commit 883bbbffa5a4 contains the details.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-ftrace.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index 3e7bcaca5e07..bc598e3d8dd2 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -271,6 +271,10 @@ ENTRY(ftrace_stub)
 	ret	lr
 ENDPROC(ftrace_stub)
 
+ENTRY(ftrace_stub_graph)
+	ret	lr
+ENDPROC(ftrace_stub_graph)
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 
 	__INIT

-- 
2.34.1


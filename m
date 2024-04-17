Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D71272A6
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342663; cv=none; b=J5siCZPuo45TC3cOYSSWsQqhwGB04etkdZ+s7QSAfch6QiK4oSV68lIlHIlKXzELm4ArgJbrjBdwBjyo1AgnBxtpNpPEmOQHjFriA9gynDADDPd1Uec/q9XkKO0ssb8JPTOP3lGMPQf1yvqrmPDJpWgBeDb5uqd0PW8zAxm59RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342663; c=relaxed/simple;
	bh=BNFdvBSweRsP5yvo3LDzy/S5LF2sUKq1AA+bn058AAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yd8fv/nB4KXSWbXb1JeCgrYu5rovvFrQgiy4eXDseihcogWmKNgXcDf2QHV1M8aHesDUfOpxqe/Tr+1lQZ8ga1HD4abqWhx//ftgmjR5gYYBqLpCQuMG4nXOMEXV1uBTv03ORdizF/6mJP58d1JLOmuTd5brMrgRSGPBX1uvdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WjcPRwo9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WjcPRwo9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso545513e87.1
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342659; x=1713947459; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=WjcPRwo9IHxFrDisJylUvJvYWmYIBf5dHrzEzzigyddnH6Kv2UUSvlvs3VCimgc8VK
         oXG2+LkqcsP+Jt8CQUev0JXPsziDVkHVDfa1JPxuLRTsMSsepyULv9v8w9gdb1k24EJQ
         XLj/sPS4FYbTVe4XqWS626ou5hbA1ckbFBqIWI+T1arpWlHzoDG0yRjDhYKa7XaeRReI
         HK9M7I5fJX2m3okRwMCaceXeDTi2fFc7it+pbyL8C/gWIu1hC78DY69bhWuGcN9xKdfR
         SXZI2CBqApCg2ktVtH4At24SJ5TpRWpi8v1+WSSP5Y3jczu/empjPPoTy4OL7e4frcWg
         YZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342659; x=1713947459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=hhRlThUzKEwpZlDGF2c9EI2SRwFLOLdJH0IPoZgO84Xm1IVuBt6WrMTMVqrq2HQ96l
         /VyjKzjpPZ1rDBHfoppWGcgE36fyXZOxmwOtnml3ExPxsGC+iTG3HzZZaMjDodg2r5uI
         YcjPahQj2gfE6zKWEaABf2N7YoMRPA34S4GfkVbODbpxp1fxNUaAAgCzo4IFW/qKP6SX
         XUXeMYHliYrvXH+dequ2LHkqVujYcvqH+gklfaVjDeI9gCyHTB6+BcE8FrPMb+UxAsee
         Ckfn04f+h1uhsDUhWqc0oEe9WeLLZwGcdTEXXP2WTQGhP8exM1ssQxWjxh9XNS4mFfK5
         J2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgScAmYq80vqDREf2+w9OhSKxRVJ3tCjaQBRfbPTiDnIUPcWGqYf6GdOI8HDmJ3npNjEOgP3o7tTlpQ3lW4ocyd+M6Sg==
X-Gm-Message-State: AOJu0YwRzryg0ybVLAaj681LqkNhoO+DWhGV/KjhBT4EMeD/PEMSU/t8
	6DMOTwR68Zx5IF3R3hxdqVdrgR1fBrL5F77YYzfEoJJtr34c8gFUU2D13ZMFrPM=
X-Google-Smtp-Source: AGHT+IFN9dfO6OYwpHh3pMr+v9jNyhnNAh1I4U8fQQyEks8csQyV0TYep99DGgx87ndn1C/nkgViVw==
X-Received: by 2002:ac2:5050:0:b0:516:ac69:3bf5 with SMTP id a16-20020ac25050000000b00516ac693bf5mr1488979lfm.0.1713342659374;
        Wed, 17 Apr 2024 01:30:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:30:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:50 +0200
Subject: [PATCH v6 01/11] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-1-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Instead of checking if cpu_check_bugs() exist, check for this
callback directly in the CPU vtable: this is better because the
function is just a define to the vtable entry and this is why
the code works. But we want to be able to specify a proper
function for cpu_check_bugs() so look into the vtable instead.

In bugs.c assign PROC_VTABLE(switch_mm) instead of
assigning cpu_do_switch_mm where again this is just a define
into the vtable: this makes it possible to make
cpu_do_switch_mm() into a real function.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/bugs.c     | 2 +-
 arch/arm/mm/proc-v7-bugs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/bugs.c b/arch/arm/kernel/bugs.c
index 087bce6ec8e9..35d39efb51ed 100644
--- a/arch/arm/kernel/bugs.c
+++ b/arch/arm/kernel/bugs.c
@@ -7,7 +7,7 @@
 void check_other_bugs(void)
 {
 #ifdef MULTI_CPU
-	if (cpu_check_bugs)
+	if (PROC_VTABLE(check_bugs))
 		cpu_check_bugs();
 #endif
 }
diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
index 8bc7a2d6d6c7..ea3ee2bd7b56 100644
--- a/arch/arm/mm/proc-v7-bugs.c
+++ b/arch/arm/mm/proc-v7-bugs.c
@@ -87,14 +87,14 @@ static unsigned int spectre_v2_install_workaround(unsigned int method)
 	case SPECTRE_V2_METHOD_HVC:
 		per_cpu(harden_branch_predictor_fn, cpu) =
 			call_hvc_arch_workaround_1;
-		cpu_do_switch_mm = cpu_v7_hvc_switch_mm;
+		PROC_VTABLE(switch_mm) = cpu_v7_hvc_switch_mm;
 		spectre_v2_method = "hypervisor";
 		break;
 
 	case SPECTRE_V2_METHOD_SMC:
 		per_cpu(harden_branch_predictor_fn, cpu) =
 			call_smc_arch_workaround_1;
-		cpu_do_switch_mm = cpu_v7_smc_switch_mm;
+		PROC_VTABLE(switch_mm) = cpu_v7_smc_switch_mm;
 		spectre_v2_method = "firmware";
 		break;
 	}

-- 
2.44.0


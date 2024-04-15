Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE457174D
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188616; cv=none; b=ZzXpbNCxwVflItziC8vrMTFQ4zY0OPcurtIGJLrdwr8/dUrhfKcO4q05q6L8ekxl89uYui4HunHyW+hNgmH4ZASKvp3b2YtbivzAzwy4caabCp8+XFCJ8+sgWRws+y9El5mgDv/yJfsQDERi3Ez/AVme0Nv/0k+thrhMY9/5HQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188616; c=relaxed/simple;
	bh=BNFdvBSweRsP5yvo3LDzy/S5LF2sUKq1AA+bn058AAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJdVQJJFQ4gdEN+UhxGaCtrqIyLLweUE8qjUNWB+LOIHJA+JawAlbE9q1lgh3nDHLzW/bNUTE2cuFkh4vdCwEfJPR5z72Ogm10eTFVeZfh1PaYgiTPUYGDiDAm59AVCk/NM6QmQriCHGn0ccuzE1mXU4B/J51T1Zr7ReMtyVhuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mBMcaYsZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mBMcaYsZ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2da88833109so11316961fa.0
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188613; x=1713793413; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=mBMcaYsZxGLd3tVrodSDJejy7j/rWXzhLy2WDuWA3tOBg7h75CG84rhZ8WCJYEJx8o
         p6zoznM2Wlf/lDyvXQ53qWn5zGtxNMq63WDxQONugGMN4gWmfhqHBhRg4J/G+uX5D1sC
         uxi1eyUEjoeDxvQM3Spz8ZjUNcIqQmg3/btCQPpJTIpfObk4uQrMODfcrTk9CtZ5rpHo
         H1GWyBDA/1d3tn9p9MwBu7+LPLFQtmIIoZpALIjYd0n6chDlRV60wm5KmU7TGd9HlN4I
         8XHMkcjrkmtQDbuRSh+RBjXWxmncG2CqOvbs7e+KlkplNkbfmQY/0KIDMdM5ZahWKzbD
         M6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188613; x=1713793413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=dIsvSWdI83m50TfBMbEUVx54imsc5ITgSIdYXFgmpGcVGMKmEIH9Z8iYPEkiVN6pmL
         fHoRTeLnUijzoix2jUDi7HMnPHw0EQeHQrQJPNqC1BkJcFDan84W5i5BEgd+JZq8rj/7
         mC3ChVYwvjWr0nzbNgtrDJuCbqxr6EzD6j5Luv/dzEesyXF5RRXCo04Wl8epSZec4E0x
         eL4NBtosLZCnDroWNKA/hKgBgMslsbuCF5eCrttbyRwYktRJhgeM3RwwJD0r9asB93fc
         hKR50PekQ5Mt4a85WAY/CDxTmHVTgh4gJ5C7G0Yn3OO0utq2UQ5MKvMOJNdhe1iqPtqO
         zflQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGoMs7ix7EOdQltoisQucLJrRBMlbeNFsxkSThTLXb/PyJZFWH40/Pqez/M68fP+kQjzqDwaW+W5F4mpKrFinfn/kMSA==
X-Gm-Message-State: AOJu0YyopClIxKw1Th36KismrQLvrQCA0KnbABI54ERAZLlU1Q1A9g2R
	SB4+eLNl44i5FdNyB8DjqKUOidoI3LBsnqhZck9VpVVxvgytCYzxfYhGaV0VWe0=
X-Google-Smtp-Source: AGHT+IENvq8G1LUSUr3osHrUpSD/2JG0PYRSNVB4/7/e2ibwfVimAbybaiBmt+OXtjMjSHOHdJ/NRg==
X-Received: by 2002:a2e:a316:0:b0:2d8:2761:a90f with SMTP id l22-20020a2ea316000000b002d82761a90fmr6061460lje.33.1713188613154;
        Mon, 15 Apr 2024 06:43:33 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:20 +0200
Subject: [PATCH v5 01/10] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-1-ff11093eeccc@linaro.org>
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
In-Reply-To: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
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


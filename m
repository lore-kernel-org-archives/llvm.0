Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B2735F18
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148548; cv=none; b=iPy8m9miC3AwI/o/Ex0TEwfMyWqn5RiIVMl9ySpZwRYkXArirRAUdIUqp2/4z5UE61Loh+BqlOLZAWBwQTVvMkTJuCwPYKkNApqD/sTYO4wtU3zsjfqooWxYuw+5xdikFPNWezwefVRcHwQK3RiWqUSXZnQCtxo7zrLXsJZTidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148548; c=relaxed/simple;
	bh=WjpCRBe+vZFn8yoU6NIkWivSfH1KKxda2QhHNT+5kfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gS3sxT8+OFC5KZouSQ8KE6VkB72yI94bOKuFd2Ei+O3X5XUOnrVrwFY6sEglhR36Y8vTpod+Ud2fq4Ko+JuMILYF6N24spHgXRr80d1+j8/fS0MyV2PteTAqe9kDQvbgwWil1ebXxmr9dABYhnM8r4OJ8pXZzOd/NPjhWTnQ9eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMTJdxbA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMTJdxbA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a449c5411e1so527740166b.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148545; x=1710753345; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=HMTJdxbAcALW3c1JB6D4XPfkwOTv4GBGt3sTLet8mVMCXOe5FkXsRjUynE2U2PrTTd
         A5Ak+XV6siHUMWlNPLLckgZh++EUcjpbtDSCRNlAEJPJ3gMhpZ2HwzlA2m/lBU1ln8lf
         hUmkQexvuZRUqSwMRy3AX552ndvs4JAC4KtX9F0LCp5LYpIXwddFVbBh0DJw7qgMjJJE
         V4bVud4t7333qBWAfLxu8rHaF6aJ2Yq/X9OslnyaFasFJ7xGmywKBBzwju7WLWN6LevY
         XyLx6bAhzWzMaNL1+/osaZOFvPz4hjcGyTEErAtfeO8Avm/KhHBlyp6B0r8aDtoV/GUR
         /WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148545; x=1710753345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=kpHLwPlBisi6C5cr7Wcgy560h4nxdyooAVmI1CvYCyvFAxX8xyOxg+L0EggC5zWEvE
         Ac+xatO5AyBImyscF6Ph5CsjJqYZ85ubgSlt4Ruhm6yc9W9wgJh0QCZQK1t+j5TzkW8Z
         B0soV3QUTPgukVRBK60QWDriWqgXrQYZZtQdHuXPHvGvj6YG0lPlg0rpfbhvBonP8OQ/
         GYnurQJBWQ6TJh+C+4MOlE1B1J+nIroBwaMrOgTPDvuqC4Hx2E7k5gsvGVHSS8oOzNeE
         dwsSAae0xumoYMqTNOsi0+ADr/KO6ZoPXGDW+kVoWXwK6ZvJ/maQVJ7vj9bZG2tTx2VV
         +Thg==
X-Forwarded-Encrypted: i=1; AJvYcCWB5YO/e8vtKNWSleEEc5wcCJQwCWJclSnBmV5WEaSs6LBu++AVOtHj6i2fK9FIJ3ZQkON2SA3ug5bLG/snHjoBZTPcqg==
X-Gm-Message-State: AOJu0Yz5meS/rGOtXzG+HFQwgqGCDc4CJeF9gwDxHEQBxd7MkJvlGwAR
	HgBtpfc2FxE3mujfWI2m7ITroafZOFFSlL5PxI+FUr0xYHE8WZuesUMfQlMCe/c=
X-Google-Smtp-Source: AGHT+IHDnM4IJaApY7pw00admaAa3JjS3BnAZhOMSFkbG2yLqgAL61ecbv6xbQrSNTpH89f8vOW9yw==
X-Received: by 2002:a17:906:a287:b0:a44:7ad0:8069 with SMTP id i7-20020a170906a28700b00a447ad08069mr3668889ejz.72.1710148544581;
        Mon, 11 Mar 2024 02:15:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:40 +0100
Subject: [PATCH v3 3/9] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-3-224a0f0a45c2@linaro.org>
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

Instead of checking if cpu_check_bugs() exist, check for this
callback directly in the CPU vtable: this is better because the
function is just a define to the vtable entry and this is why
the code works. But we want to be able to specify a proper
function for cpu_check_bugs() so look into the vtable instead.

In bugs.c assign PROC_VTABLE(switch_mm) instead of
assigning cpu_do_switch_mm where again this is just a define
into the vtable: this makes it possible to make
cpu_do_switch_mm() into a real function.

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
2.34.1


Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043C12DDB5
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821330; cv=none; b=SNSnRW7SHgSCImP24BR+zKBvU+iJiKLUSLQEsdMhsJZqwBVy/mK+g20eKrybEC+8WTiC0miPruRnfsCrDcebNBeiLLfRloNi87LcuR5UWXyWyJjF0X3ZTRiIoM6cr+ydsONcWDHkMOG3vCBTE7MzMfsmXtdM2ed3lSxoa5qKL08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821330; c=relaxed/simple;
	bh=WjpCRBe+vZFn8yoU6NIkWivSfH1KKxda2QhHNT+5kfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvAjwGPsGNAUEMJ5yM75m5iMWDHXXZ/tU1Qru03VYoBVG7JM0QBHn6J8XkSFx8hOCzoH27rbrdaPdzQcMQCYk1XrqowT8dpgZ+lFFlC/2f2Pq7119xGWs0o75HAdJz4ljNWSAm2YMVJ+QXWNQ4SDPd082zd15pqkg4kuZRMlaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E99eFfc/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E99eFfc/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5131c0691feso1253875e87.1
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821327; x=1710426127; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=E99eFfc/aWcpJS6gF1Nc9fLupZqXPS7B1twJLWSrVMxYW5gqiGXhpkKNITX42hrZkv
         TPGq5pn6LZrkVzk+QosWPFWI94bLA76gNnaW2iQnlYRfqfOkboEomXCum1CfsQtIFAIZ
         MXXQcEaJlS0Ujxduz1vN4lRN7e99xP1EjYo64JuEw1WTtdOdttG0WRAhQZINKVYEzhwV
         i2lLUna2i5EzZXCyGwdGSzv3ujaU6EuQl+4HXcqk6OC6XDYj+BtSt14W+6b2mcOduvwR
         qbbmKpMkEi4rZImOkhqlzbGZkce9ZftHDD2aYNQHdX1Dm9PUlNtJm3yxpGz9xZJFEFK9
         +t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821327; x=1710426127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B30jBDh8l6oorNFVXLBM1TGNZMOeiKLndpCjpsCjwrU=;
        b=gzu2qkMNoYsgQBKUfuGpgPm+4kUN7XSoqVyTSPaaONbZmwdGzP1o4yl117k0cRbzAF
         DMTqJwBZyjtJDgMKY5CxUdFqLh3oRUL47B6eifzl0C/Wk0zS2cPn82Lv5YdTm/EQyUWa
         aKDyEWOLa67kvWu5jhrlfay8uheE/xdTwLxBUj/lTBFYY7XS1NFa26oKrJ9vPhsQhq/u
         +IPfLnKA2SDPiU7cDHFhzv7pUYlprFl9hZe5vIsGd1H3uEGiLxhavNkxh9W48W/llp+L
         uGV+taF42bdROQDoLNyjBfG7hwirNP1IfHlKJSJNsmKgrlWbYV0wGA6CX3+CyHYB8up6
         U++w==
X-Forwarded-Encrypted: i=1; AJvYcCVRfs+j9sjD8yxxweKrLEzS//pvLPW59YqoYircrXDKDu37SZ5d5jS58RyuWpPOI4IKMOHZFz9nai2xrajcbrZb2Z6wDQ==
X-Gm-Message-State: AOJu0YyupgYjBtvaYtK/UctcMJZae7WiiAwO1fMRsRZUYg75/bDdTnDu
	xtjdoaYn0DfKuefzGCBW9I26vevStG0qN8WeLwPQFgGqzPNS+dl9Dy5poUqga70=
X-Google-Smtp-Source: AGHT+IGXjoDQpzRMRKlzo/7VGOXZ+RgzbXKawPARgnq/UpHXLLP5tU5H1naXKLsUutRVz3aQXuGqlA==
X-Received: by 2002:a19:430e:0:b0:513:4847:2c0d with SMTP id q14-20020a19430e000000b0051348472c0dmr1459347lfa.29.1709821326883;
        Thu, 07 Mar 2024 06:22:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:02 +0100
Subject: [PATCH v2 3/9] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-3-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
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


Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B473AC34
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724113; cv=none; b=WGWDzpwo0q2LX8CkMcetdKk6RlD0opyCRXx84EzJheAtL6PPMuDBkwHnzFw64JugC9/gYQWrWT7El6/iboDRCJCPKF5n6cDrcudzeOV7MRIAndhE5bhsMf8bXAWqTCVmQ+0cn4af7O1xI74ZSjC/oQAA0+eUzEDv6EhDy5GRfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724113; c=relaxed/simple;
	bh=BNFdvBSweRsP5yvo3LDzy/S5LF2sUKq1AA+bn058AAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiUjUUu1hPKnXfyzwi9zSopAN1eCBHAWGRFOAywti6QZgpVqq2xOJxH2D5vmIr23RMszmXT2xrNuvpfg2tnYD8ooUzzMZ7RK3ZKH9b3AQXdjPVZem7wGIEGMuoUa2EouhjFoFnNjl4oFdpkwGMNEreHt2ngmOm3XyQFAEsyTsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnFsQB27; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnFsQB27"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ac9c6599bso2754492e87.1
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724110; x=1714328910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=SnFsQB27HIYK5OWcEmuJ3Ma1mFcogyHVL3Jxviz3ujbWVNpuxRhIQ+suEoaUqkM/wU
         eg3d2m9V3U/CJjP8O6eMIzcfP205eYwTKO79jZWD4jKb9OsMgmTsU28xkgVB+07i0lEy
         54q9IukUIt/PwICuBQLY5tim0Lv5NOdrmIrI5A2Bl2UtTCRizYp4hrBvN/u1QcrSER1I
         ipKEVn9TAAlTkUJYvFqb9gvEi21uGcj9SLTiYVN4JIqnVFPX5XVb7zi3Q6sHvVn7+CQ9
         HpkKEiIAPLNY6fJGU9KKOGoqwmvF8hDBhkdyuG2wYxNiKbhGB6KrVl26NRb/OrAGViem
         RavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724110; x=1714328910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDN5FRmJQobK+MX9/UAQHb6uzGwTwVFq2SIWEuBGTZ8=;
        b=lVx26SnGvYixyJvHvtk6CdSgEu+exfnVp1bV6r7P4aRHPnAt+Gax3nNUtfdw7J1cJX
         5aGWb23UT5Y4qm1sEC14iOvj5g//g1GLaY5To1QDoyZURrNnvBQMw19SaesMoMsx2rlJ
         gYrVmIW38C0wegVbKrJ/PGrxqaMpgo1NnrAMiithuW1CXulT+g68odIy42oQ/X4eqMYQ
         T54wXf9TJhVv2v5UBkp6vq1llmtlyazBbyN4/at+5YC+KU+wB14I7QDcjF+VNdKI3iEg
         H7gJuXUCgvC3eSmawn3T/IEfJKi+QZ1lbamFfGZOwnBH5W0rnvR7pcSan/O/BRa87to0
         DHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHe60SffPT6rxO09NuMq2AgImIvnc5hGvQ2YyUCx9QjfzeWybNYkR2RijiHG6qaw4qNqW4uNLRhRtdtAuUn7iOJ3CxDw==
X-Gm-Message-State: AOJu0YyE4SHBdeT7aBM7hleFxEsIjGwCSMEV7lxzgrz6ajpzJUdmbsxc
	YK5QeLusT80mn/NgjAZmU2OD0Pir0flG2jqGtcIKaTzuWl6CXELuuafVC+zbmhA=
X-Google-Smtp-Source: AGHT+IF1kFCvJZyBCCjnyY8onMy4sCEISbjCHyqmS3da1hYqvcFYcwFVkAZPOvSJ5O6gz/WKOXWcOQ==
X-Received: by 2002:a05:6512:23a8:b0:51a:ca75:9ffe with SMTP id c40-20020a05651223a800b0051aca759ffemr6207388lfv.42.1713724110277;
        Sun, 21 Apr 2024 11:28:30 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:27 +0200
Subject: [PATCH v7 01/11] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-1-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
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


Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972D2CCA0
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613973; cv=none; b=GAROVOjlExAZa4dGoB37YHOxl9fPHxOgNmRgWVprU0C1aU4TylC3CO1XtgrWlJ/45Feq7NJfWxMO8IjMAss1J8+TljwHhR8VXZvRP/y6U4BV3FXLgOAX6kXGMa0FV4a0bkVlchBXQ2uRxx4B3E31adkRdv6OJfffAGUPOPE/000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613973; c=relaxed/simple;
	bh=uH5mUJukOr8IFKK76cdOrKX0iVIJS5nEyoaBFyQwAr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1tFYsz+zQor4lPu8B5onK0EErezhVJt1GNbKlofNF7M4354+gQY0o9Ki51vd6em7RFso7ru0rbubS0eaQy1GjRY2lVJ3Z1m6aRGe6+OoloE6pMDNv4EN/2HWe9Pk3n/LfELPeH8/Kv53HNbajD8FntlvI2otge1/BfkHIlUBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mthGJduv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mthGJduv"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56c2b4850d2so763153a12.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613970; x=1712218770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CyZZb/q52ADG1Ns94g158QKzpX2+8bkeCd4yJ6fxkA=;
        b=mthGJduv3ihvv1ig/Qb/nbjAsSu4B/OwT4Ru0z0Vl4I3b0qRw5IifdxSC5CFQfMCwW
         /7UnTtcNwLCZvDSfvzjMouSyQ4JqZaNTx+zscsVPXeTU+/0ZC3SI5NxVobCUAm4u7Jox
         MjMgRampx2ZfM58PmwV2w7O0uNMEYfulBDHaS4yxc2cfNH5uqPXlRsWVDXVTpU0XFxaN
         lzZ9KfajKLT7apFnpYkpQVEn7cxAzpMsDyzNWsGXtXOmF9k9EL4ljqJYraxu+a9e9wFE
         A4W7ySPWuEZolaAftCTi3jg1qfuiFw0VRbtXGnR4iqDcNsuhZeWf+QiZK0xmpl5c79f+
         7nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613970; x=1712218770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CyZZb/q52ADG1Ns94g158QKzpX2+8bkeCd4yJ6fxkA=;
        b=OrbtVfGdve5ecJKGUAzl0/0VAAWeiOOoP9wZaUGuP7dykbfi2Vr+rkHEoI+r1Ksxlx
         I2egY1ksrMSBHThu+5XpAUfq67QOzrU6itlXtiMD8oQFzWffF+tXdCadpnbrN2BjyjjJ
         eVTJ6Mz6+ojahZhgdCop1cEJLk6RZNu2YdZpB9TQcanlpgs3k8zu/DMp2cpp+KiV+10X
         IptZTMesmgD4GNKerSUaRhn7pyKXLIk/C7seDQ6ruTaC+TNLQpFuONNv2OkuXvFNynWj
         T4aRBCPRcvVD6vIYqiNcokLbh8DCFwtCvE4/tNpk+lfv0gNODm7ESlsO3zZFZCt9yru9
         SzkA==
X-Forwarded-Encrypted: i=1; AJvYcCXBf8X4jQqP3+zmcBIMzZNYgTrYzBqGmzbfkK8I0v3wqXTplADZhP3xNlnpYHTLbqR3gmBhR/d/tJbU2BVgKqRbWQy8dw==
X-Gm-Message-State: AOJu0YyRQ5BzJAcZp08PPjVouBVVb3g91B5k5tBWuHMta0q1loWxwBDV
	iCRNtA4nxZ3BaeJY0Out4jgDsDTLElDgGTzrz4On2XmiQxI2Xy7t9U1+WHnvpv0=
X-Google-Smtp-Source: AGHT+IHzEi20HXA9sEd3jUX1smrRmr0wS8k7O94mJZu3c52WLkHQoAoV3WTxSWf/Fh+PSLfieoktpA==
X-Received: by 2002:a50:cc81:0:b0:56c:d33:7881 with SMTP id q1-20020a50cc81000000b0056c0d337881mr1468362edi.23.1711613970605;
        Thu, 28 Mar 2024 01:19:30 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:19:24 +0100
Subject: [PATCH v4 1/8] ARM: bugs: Check in the vtable instead of defined
 aliases
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-arm32-cfi-v4-1-a11046139125@linaro.org>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
In-Reply-To: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
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


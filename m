Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9795197A82
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731051460; cv=none; b=EkxOCS+bxMJR1bokSwMgnsLZp33gkxcu6i3Bm9gAi7ljj4dSF6OUU1xvyiLOTBREA+Z46vI5IEB3h5mpJp7DFk+zfk16MzjPxJwfx64/KX9H+UyXPhUFEVp7BThhdS0YfNaDbY2c+7QCElGHFJrMd4OQPpPj8dJ8SlrgnjCx560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731051460; c=relaxed/simple;
	bh=NjNyma4iDr8yw22McSGR4D2CBfiU2MdvGrWItmqwydM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R6yM5WERSKByD7UDMAMwZk75ne+peMyzAX98Uk8bS5HjEUb36nwJt3y/9+y9WpRCLV2CyJVoQ3/lVRH72n92ig/3tOnOUftXwibW+JJVeNTTCuyM7hAMBtXjgSas0WfnHObm0VCMszQEd9a8H1Kcazisro9CPyscBzXMmzuksRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OD7Baoyy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OD7Baoyy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1690863e87.3
        for <llvm@lists.linux.dev>; Thu, 07 Nov 2024 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731051457; x=1731656257; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6+NOPrIh4Bt07gXb1NnYdK/UawvL1MDSSHlM6jV428=;
        b=OD7BaoyySANYisv5Dmks1+4YrLZMKgXL61XaiC/tfHtUEeJRhirt3kTbOCZ5YhDhCj
         j6HYVINM9cXvBNkKtKd1XFJzJv/urHFxJmLaNqhBvKKPTRwqWPwim8rX3/cUl3z1JGU8
         l4GeI0B8A5nSFKM9MLUbKyXSsEx0qRMuWX0k42o7mczN9GgptQpHOCpbnJ0J0mrX550I
         v1fsI8DDU+RYrgJb4agPaYGGG0H8us2vkShg9B0CYKdAGSvG3XBM/4wWo/xUdX2/o+j0
         64hfQW8aF1H0OmUI4XvWvJUgqFBe0iq2WRpsROjMoSapfs774gnmpwlMXFi3KQDulH3q
         Snkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731051457; x=1731656257;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6+NOPrIh4Bt07gXb1NnYdK/UawvL1MDSSHlM6jV428=;
        b=U+alY6pcqsK/I34DeCjgkUARBZc9beMapoI4lnmjDaev7JwTZP8ckd+OSPBXonO1cT
         nZSAXon2G5iLUfK4Wf6RTh1v+eBVmAXxGcp94iyguXQwrsm+I6TB6y7wJMKHoBl5BU+/
         qwKjes/gEPzLtLLwikR55FE0buSAJmhbuqg4MrXnocrcy9QINcjKu7dpFKQKobBuNPig
         zXxJB/z17j/gphzycGxKlh32qfnSWtZ3g6WP7K+mNXEQbkDSsgUXi/Ic5B+6ymrSr0Bl
         +5X/ozDvWGjdB48/IqKTBncC5BJ7q+uTNqBH9HngFH+GPa++iaxtTXTzflFLns4s4Hu9
         71pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeAl8KDM8zZScBNZXXdJSLxgoooOZzD8zre03J+FPioYv68eCVW7dUoCpiyrD6PKZLQQ2F@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxuv5v0UrtVMpFdRXa20SaRVxnN42ApwYoztkN86sgxpnFQjS0
	nuSwz/Iq0Ak1pYGUlmNeKAa70DIH0RR1Wh8rSHI0SHJPlnf0yxRPGEplgwrcZxo=
X-Google-Smtp-Source: AGHT+IEZfwO1BvsXunYs3RGuIPq3yZBvOtCJCFAMH7tkW12EQF+tYwgCG/Ju9xc9oYOfOT6HzBJmuQ==
X-Received: by 2002:a05:6512:2398:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53d862ee137mr795412e87.38.1731051456811;
        Thu, 07 Nov 2024 23:37:36 -0800 (PST)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826787c7sm508221e87.6.2024.11.07.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 23:37:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Nov 2024 08:37:36 +0100
Subject: [PATCH] ARM: cfi: Fix compilation corner case
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL+/LWcC/x2MQQqAIBAAvxJ7bkErMvpKdFBbbQkslCIQ/550H
 IaZDIkiU4K5yRDp4cRnqCDbBuyugyfkrTJ0ohukFAodv3hYx2huj5p6IyZrrBwV1OSKVP2/W9Z
 SPg4SFB1eAAAA
To: Russell King <linux@armlinux.org.uk>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

When enabling expert mode CONFIG_EXPERT and using that power
user mode to disable the branch prediction hardening
!CONFIG_HARDEN_BRANCH_PREDICTOR, the picky assembly linker
in CLANG notices that some assembly in proc-v7.S does
not have corresponding C call sites, i.e. the prototypes
in proc-v7-bugs.c are enclosed in ifdef
CONFIG_HARDEN_BRANCH_PREDICTOR so this assembly:

SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)

Results in:

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_smc_switch_mm
>>> referenced by proc-v7.S:94 (.../arch/arm/mm/proc-v7.S:94)
>>> arch/arm/mm/proc-v7.o:(.text+0x108) in archive vmlinux.a

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_hvc_switch_mm
>>> referenced by proc-v7.S:105 (.../arch/arm/mm/proc-v7.S:105)
>>> arch/arm/mm/proc-v7.o:(.text+0x124) in archive vmlinux.a

Fix this by adding an additional requirement that
CONFIG_HARDEN_BRANCH_PREDICTOR has to be enabled to compile
these assembly calls.

I suppose it wasn't a problem before because the linker is not
so picky that other assembly symbols are actually being
used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411041456.ZsoEiD7T-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/proc-v7.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 5fb9a6aecb00..2cd933342679 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -94,7 +94,7 @@ SYM_TYPED_FUNC_START(cpu_v7_dcache_clean_area)
 	ret	lr
 SYM_FUNC_END(cpu_v7_dcache_clean_area)
 
-#ifdef CONFIG_ARM_PSCI
+#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_HARDEN_BRANCH_PREDICTOR)
 	.arch_extension sec
 SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
 	stmfd	sp!, {r0 - r3}

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241107-fix-kcfi-bug-ae3b08cbc167

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


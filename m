Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C1548F3
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613980; cv=none; b=EFGt8u2YhwF4+FCKPvrI3LXw5kR3ms3swi3m3KxozN5tAqnq5QsFLAXoJBou1QWqpkPamUG3uGC1TqA2heVlQv87StyNGCbUdrNRCpllJsSkrvTcI9GktugWMixI5K3XRIuATFnNotLK0r7AiuyNiAfVgYSme9vACwYp6vCfgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613980; c=relaxed/simple;
	bh=gAJ6BRl+6GJFjFfj7hK6glDoqAeKWO/JdoYGGNwtQaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1X8dpam88CuVLkMDp1bDzWjeYKye4bBykWl32JgsKKbAUtnngBMz6LG8/HSLgTa2vShi4r5GQZDMALOM56FgplZ7iSkQblFZFenp2zGDWSO8yewiopsJl3knLbMxfHgvM6rfT3XhIg5CjM15X9zQTfUVIRq8oLfjtYpLnhYSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0HRel9D; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0HRel9D"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so760408a12.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613976; x=1712218776; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rFKQQriDx8kyCVbgQlVcguGLC3EYwSTxPGRwqSUeh0=;
        b=M0HRel9Dam28i0xsRB+nDTedfKcBe2eL7PTqd5yGAG9K2jVceC5hqngHyJDyxcTQ45
         IY38MZUOoaIDW/BbucPVOTGpadh07sLnMYqPJey+ysS4bgAYlERRcurTi3GC00aa7K9A
         U/W6myXzFqV+yqyVraS5hkd3Di5EiFRHoVXuyDEpOKkeMYjsU7sKcBXKAvKY8Vz/LeTo
         Jsc71OJ9XyOJOW2oul15uDdFvCZc8ixeklkaz6v8lK6owBpdpH/LFPxBhDB85AKyy8aO
         dIJcGOisxEuWOxNRy25CrnyAoOpBCjZEhvx/0MjhAlpFE3zjUgjNyfwwBptebQyEzVRE
         TzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613976; x=1712218776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rFKQQriDx8kyCVbgQlVcguGLC3EYwSTxPGRwqSUeh0=;
        b=TB+QcraKiwK+dza8F8ln6tkHBqO2gyuS6nGARNCLz41Q7JVH+mVKIOyHqNFFWI2SsC
         Uo509XlQLx1AH/f0VxtMNjl0m9h2q8yNhSs6Qu4MCcDK4NDo1CBydK8tsvWTMtO7aWBI
         ung9MOpkxTZfwb3g0tHB6RXmuHdNb9OeABuHH+99/ea381MEHljGfe2/03d1HL2ZpNNx
         DYHmfkf6gLLlYxukfoumlThu+lbUHdUbd5TA1GeszSrgXKNpBbgtMa0aFohF4GUtrHSD
         xzyzxtViX8q8C56WcINWvsfZV1bo3ngIfm+v2ZPfYi+c9CAzBuZhmescXhNlvbUcHxLM
         6ZPw==
X-Forwarded-Encrypted: i=1; AJvYcCW/lHq0OUt6oKIhxHcfWk4hLEELKTsYjJKo8l49RT4kUBFNa4BH2u0LSOg4SpPA4YALzTrAAYjDeV108yf1es14TV5aaw==
X-Gm-Message-State: AOJu0YxSWBwrOfTc3JfE4D+WxKxO8xLgYs3KkRDQD2ByLD5Wjs8oJplL
	XP+j7ImnlYdaTlu5g961RIPazVpSSGEm2dMsObCOqzTogh/OHDOxcOUN4j6EEu9cizrSszi8uKJ
	k
X-Google-Smtp-Source: AGHT+IFyrbNGcgombAS1Q/MVB83BT8nlFzTxjXpcqYRdLoPAd/Ph2OS/kY09OwmJKYa/enUyqz94cA==
X-Received: by 2002:a50:bac4:0:b0:568:180a:284b with SMTP id x62-20020a50bac4000000b00568180a284bmr1457913ede.37.1711613976227;
        Thu, 28 Mar 2024 01:19:36 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:19:29 +0100
Subject: [PATCH v4 6/8] ARM: lib: Annotate loop delay instructions for CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-arm32-cfi-v4-6-a11046139125@linaro.org>
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

When we annotate the loop delay code with SYM_TYPED_FUNC_START()
a function prototype signature will be emitted into the object
file above each site called from C, and the delay loop code is
using "fallthroughs" from the different assembly callbacks. This
will not work as the execution flow will run into the prototype
signatures.

Rewrite the code to use explicit branches to the other code
segments and annotate the code using SYM_TYPED_FUNC_START().

Tested on the ARM Versatile which uses the calibrated loop delay.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/lib/delay-loop.S | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/lib/delay-loop.S b/arch/arm/lib/delay-loop.S
index 3ac05177d097..33b08ca1c242 100644
--- a/arch/arm/lib/delay-loop.S
+++ b/arch/arm/lib/delay-loop.S
@@ -5,6 +5,7 @@
  *  Copyright (C) 1995, 1996 Russell King
  */
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/delay.h>
 
@@ -24,21 +25,26 @@
  * HZ  <= 1000
  */
 
-ENTRY(__loop_udelay)
+SYM_TYPED_FUNC_START(__loop_udelay)
 		ldr	r2, .LC1
 		mul	r0, r2, r0		@ r0 = delay_us * UDELAY_MULT
-ENTRY(__loop_const_udelay)			@ 0 <= r0 <= 0xfffffaf0
+		b	__loop_const_udelay
+SYM_FUNC_END(__loop_udelay)
+
+SYM_TYPED_FUNC_START(__loop_const_udelay)	@ 0 <= r0 <= 0xfffffaf0
 		ldr	r2, .LC0
 		ldr	r2, [r2]
 		umull	r1, r0, r2, r0		@ r0-r1 = r0 * loops_per_jiffy
 		adds	r1, r1, #0xffffffff	@ rounding up ...
 		adcs	r0, r0, r0		@ and right shift by 31
 		reteq	lr
+		b	__loop_delay
+SYM_FUNC_END(__loop_const_udelay)
 
 		.align 3
 
 @ Delay routine
-ENTRY(__loop_delay)
+SYM_TYPED_FUNC_START(__loop_delay)
 		subs	r0, r0, #1
 #if 0
 		retls	lr
@@ -58,6 +64,4 @@ ENTRY(__loop_delay)
 #endif
 		bhi	__loop_delay
 		ret	lr
-ENDPROC(__loop_udelay)
-ENDPROC(__loop_const_udelay)
-ENDPROC(__loop_delay)
+SYM_FUNC_END(__loop_delay)

-- 
2.44.0


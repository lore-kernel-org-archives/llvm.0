Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AE7EF1B
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342674; cv=none; b=DbHWRheclpLocVftuC8nV2eiLqVuuoGDhdknpxZqctV9C5tT5sWvhbFYtg4ywOqKhIXw6qqBkIg2mzejnK3817EnNfl/1weyVQ0P1ZVAR1MRVCKVxXpfwIM4M2PF9TYShixk0YCgaNRi3Hrw1psptGgfEWPSoQiphEmfBoyMko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342674; c=relaxed/simple;
	bh=aLKiZgS37zc7YuPorQd54VObPRUxViY7WVDUfVJJHVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czVFC922Snk1lRYrOvj0cymRsJ322z5VUJjEG5OVJ9/3mhaObZAfX6g67hx8jXAHIiXY7sEHT2t2O3B+bu1H6O0icV613KDEX6XsKd4Q4sZ0SoDgif0tn6CCqIYWKQL9fhrdoyduwnXeF6REeW6+TLg8tCwAfuJYBtN2Y1CRvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgP1FmbE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgP1FmbE"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518e2283bd3so5238057e87.1
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342670; x=1713947470; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=qgP1FmbECqmFw+e7zljcoHDBbqE1Ul8KpfZLFGrKRre8YHIRJOk9Y6Wl6y+3MJsBoa
         PFEN8+ocA5juQ0G8918KzFT+2j0Kd4GFLl5MabW6fFah+JzmV8RkYrPOQQu09aRMt1KK
         n/caHNqfNmuAUL9OonKpEuJY4YtM6OuMT3wNudpNHerGu66VcFju1JEevayndRSGCLmY
         0xiEGwSNt2I4EFeRDDKdGK/Ck+1Di5NxyLGp2/mTce0a1MeNAhsoiMW0OoG83fpv50RM
         V3pATRqp/QqpFYNjI7NSnsQWGm4dRV9azXiepVFkw6tP2uOihz2QCnrCjmXqoWw5B++D
         kHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342670; x=1713947470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=H7WnGAJxyMaEjySJxlLOfdk1/3fj3XyyMbFJZUnxdVHPtG4US0PyRpFHbGkSkdFOQ/
         JobI5i0gjmRMmpPaPSYcN2p32D8Qn4AKlWHeeGlJvgTdIMQK+7FkBUFR4lYQrZjTZXSH
         r2TJt18WOPtb1AgRq0Q72hmBD9apbgoNztAbEVAjIsl1QywbTN+zx1ouoAZw7CKJ7dfr
         dWegvY0/sDNsBXRqKqLpuyMcOg7g3lsjJ64FwiadBJEON5GtYfocUU7l01KXCQBz9a07
         mT1N1BlPWe0OvfX+bZ0jdgSN3Gn1XwA6S7Msctthf+Yp5vO3GFOfl35YWit+IFKDEhkL
         f/uw==
X-Forwarded-Encrypted: i=1; AJvYcCVr1lbYWHz2eO0T1yjTcvgqwy3qOqXNB1LdFBBnQi0ZFpGMALXVaMC1uG4CuxyHiEeZpSgIbbdcoR/n/5AL2a4vaf3eJw==
X-Gm-Message-State: AOJu0YyHN276PU+s4lfCyQti0/Zzo4O0KO14Jca8+r+iX+yGQPyuL6zS
	+lglcf2EySuwCUnSyoJuiJkjH21iVuQiC19eha2EjLTg+ixUQhd+BCNd7cnT+yw=
X-Google-Smtp-Source: AGHT+IHfxdzveXLE3ehxMNcuRZ7EtQNOh9qmXu6zJBln4qQr28zP5D1P0a3kERNqOCToEAMzdHtEyQ==
X-Received: by 2002:a05:6512:29c:b0:515:d196:6d4d with SMTP id j28-20020a056512029c00b00515d1966d4dmr12105878lfp.24.1713342670389;
        Wed, 17 Apr 2024 01:31:10 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:58 +0200
Subject: [PATCH v6 09/11] ARM: lib: Annotate loop delay instructions for
 CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-9-6486385eb136@linaro.org>
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

When we annotate the loop delay code with SYM_TYPED_FUNC_START()
a function prototype signature will be emitted into the object
file above each site called from C, and the delay loop code is
using "fallthroughs" from the different assembly callbacks. This
will not work as the execution flow will run into the prototype
signatures.

Rewrite the code to use explicit branches to the other code
segments and annotate the code using SYM_TYPED_FUNC_START().

Tested on the ARM Versatile which uses the calibrated loop delay.

Tested-by: Kees Cook <keescook@chromium.org>
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


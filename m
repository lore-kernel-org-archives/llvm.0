Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955A3A8D2
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724121; cv=none; b=pEDHzTYDa2+aojBgVxS8ZXnXvTNIH/9VfRHErdkohAy9iXTUdfLZD4Dmmyfg32QGOp5G6jtYGpAw8u05uX/WMQxX8DTxWk03U5thF0eApH58dHDndk/uI+j1aEr6kYw0Ka42eXwHAk+UrqQ7tGn9D1howP3U4MqxGdKyDWcvErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724121; c=relaxed/simple;
	bh=aLKiZgS37zc7YuPorQd54VObPRUxViY7WVDUfVJJHVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIYU20sASNQ1lPbK3IarDHVn1CmH/f+bCRCa1HavlFGr0XEWmIRvOVUj7aoPL3F5MoLozxD0UlPOVZp8kSrYRePhrtGHS4e7ohOA8zzvKX2Z236xwRdHLCzCPjK5hkN6Iss6Waxux706bmIX4YKMKs3ArRUHrpaL8GLEN4fg+Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9yOU6Ia; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9yOU6Ia"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso5494368e87.3
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724118; x=1714328918; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=b9yOU6IaKYfmZRPhhvZcedUEs+S+rE09isDO9Xs/7zel9XA1uMh6iSxdtrj8dfuPEA
         4XZpFVjCyRVPwIT+XZh5Dt1brQ69mlOXpAJLiKuGUCFxb6FtEKQvRAnofMNXEK4jRx/I
         IvxcaHhYrOUQZdAZTKDIvEeuLcd5vqZDLdjky24fnhy0gBilVHYyC8v6bJ28UIlKHlUI
         GWovNOnqoG2Tj+WwzmXhixXa0YoNnIdpfC1EgZA1+R6YKFisXvNVsDyKg8P/IBQx92Y0
         ApVr4F/hrFykQY8Kxzb7CGuXwJAUY7g3rZTvmPNr5k4tPh7air39QTZutELV1yezYZGj
         uw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724118; x=1714328918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=mY3fXixmIoaDcE5CtiySw09ROxmebkhvnwMgqMEzN2Dn1gbEzbusYbynxG/RBwglZd
         SoOk2mBz7XOCtx83nlC3JTqpJ+2ZeAy3DhUPUcN+nEm7sHykTqXDHFYRPnE0hTDS6Dox
         HEgHX5kZBZMm08WENmmj9HD+p/i7BtzMaB3pwCaiyQyfMGpzWkNNQKLLTaP1/UFn52+F
         QB8lSpkA5z5LtOyUHUbEXinB+R1X+/fvWZPUlgTOzw1KOIxAIHcsKJRqR9CgHFlK7fHD
         DiPy47PVekBaMrls7ET9Hwz9dmdhuzr6fxQFn6fjXP//72jr9zPxemKtMcfg14hKvT0g
         SUaw==
X-Forwarded-Encrypted: i=1; AJvYcCXCKijMS4R9HFNTWSMZTOr+u68RnDbewH38Y+kaw9CQRbhB1wAwc/2FBrjjzDKFb5c1YgJgbSz60mrxLMOPOU0LCHHT1Q==
X-Gm-Message-State: AOJu0YzbuW4bhyyUq5wv+ppVTThhMyRWrO7kaKu+QxXBnGst2IpNaeBb
	eQNW1HIG9nG2AQX9S79eL94mC415MzsH/pf+zhQCQgEDW6yNarwVmW0ONVFMKmI=
X-Google-Smtp-Source: AGHT+IEh4egod2woZlvsaC0LomDmn5pY2lASSJpITdB0Oc8MC5cFfYxA/L8olJpiH4vs6LxsOlev1w==
X-Received: by 2002:a05:6512:1319:b0:516:d0c2:3ff9 with SMTP id x25-20020a056512131900b00516d0c23ff9mr6886919lfu.67.1713724117939;
        Sun, 21 Apr 2024 11:28:37 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:35 +0200
Subject: [PATCH v7 09/11] ARM: lib: Annotate loop delay instructions for
 CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-9-6e132a948cc8@linaro.org>
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


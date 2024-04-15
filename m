Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0F7318A
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188626; cv=none; b=tn1wrFQW+nSu7guK8Qx0xtdmdpaOFIVRcuMek4gVW04hDlyEkQlol0EWSSpjx5F8geEjajd6dWA/MkR5bEWd5+NWsxLSl3foGUlIkXZ55MU9r82xv1gs/MEDdRwVE7xl+abHDzKtuhAwi7XfnFe75jaGaH+fmGl9tZDf5GG4CbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188626; c=relaxed/simple;
	bh=aLKiZgS37zc7YuPorQd54VObPRUxViY7WVDUfVJJHVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiyCKkeF0CBNqEvT5T3S3fdfMW79oLuPgu5C4yXv/T5BTMqL8G6unxeitmG0DUKsNqmLIM7eneZJSAtEJ7z5TJ3pNQSy4c0N/k5ni8+097pW1Gk2RxeFMuK0cU033hBWReiDex4jRl2bNYBQMu3ouQK0QcdOOp1NfkODXHDIMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SblRxi5n; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SblRxi5n"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d858501412so41735511fa.0
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188623; x=1713793423; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=SblRxi5nlb/5PUM1zIxTleN0rc2VhtmJOFNAnsIXnmrY8knrerPqV8HU+1a8blbl09
         RFvPkYbr6bKaFa9rKQkrJkfvZgMoOtKiaH64aO4WiOJLCLkuQE9givwbMU69CZrmXlIB
         s0neoUIs2dymvDV/0I3j7G87lOMIvyMhFjOAHLYlrze1k10Z/TOZ1zEKOMm4ALhM6m1D
         /MxT5oTwvx+dojg2VkxSauYjU07kpr39AbZTmm5/9z3U7jlMiYLaUhcXPUIl+bi7iDS+
         buVHIdxlH6RqxOcq1S4+T/lfxousfbSvdkpgRJdNsfM0glJrEonGNExau1y/ZLRCofrK
         cnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188623; x=1713793423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrM2dGN+EheWjKnt5zlJvOk5v0Ei3knf8+WuyH2chzo=;
        b=AVoPdKhNy/TeskgWf86jPX65nKBQNOoJJAT8ex5MiRL9KzKuTJPoTltFZhscy/LksK
         6j2teksft+99x0JXhVhV6BpVm1TKLXWVIgC+RBqxbdM4oe2SuHzbjhsoItrYSeO5m/19
         mr2/jz0DvJqWxpo4ss6n+NcDW6nqtzBGCUEmRXsk66xD8phpcHgzwxBkjOupiPJdTE+S
         atIVuzzM+LQ/34cpnl6Mah8HtGAV9TI4McgQq3sgUapg052BirLR6tzcPs3r+HXPL7nv
         rQDVFWprXH/FsDKy4Hvd/U8eWc+6vxySnoFcMsDd+8VNLP6wI5vgw4Ae/8rzobazmfrb
         Z8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVln5mU7dTmEz9R5WKGKZBtteh+5/Q4jo/mN4mmzM/B74v3E/eInwsquGjNrTNq4co6rsPb3CR9CRTiCHLwvxYjF8R57w==
X-Gm-Message-State: AOJu0YxKHRFpSZxXl36Q1qa2Mk77+E67Ca3jbYxWMz2w+llC/X5SfixH
	33E1C+rINRQYmgKvyop841MpG6I7+fxl54sBpMqyZP82Kl2nnFBIEWzB43/OzvQ=
X-Google-Smtp-Source: AGHT+IG94lB9rql4I3J1YIwyMpGhO47ECSfiEOBK36ZwoxzhQGBWhB1wnYr49xE+cUmyLtMHraD2IQ==
X-Received: by 2002:a05:651c:1546:b0:2da:91f5:a624 with SMTP id y6-20020a05651c154600b002da91f5a624mr1263154ljp.17.1713188623672;
        Mon, 15 Apr 2024 06:43:43 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:27 +0200
Subject: [PATCH v5 08/10] ARM: lib: Annotate loop delay instructions for
 CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-8-ff11093eeccc@linaro.org>
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


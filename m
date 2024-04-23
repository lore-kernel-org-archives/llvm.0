Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4745BE6
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856801; cv=none; b=JahLmTcwpgxhv/hRKJLwqOaBLGZxUZkRACXlChrUuQQ4sUvll//MAVtohtPqWV7NXbF0gUWA0pFgrMAoNxRY7GnBgNf0R8VTWSoABPdTmTmkudao9we4AhKkIsJQt1UaggujW6VH3HX0pzadMMEubVGY0WnyYeW8vurgOWBGrT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856801; c=relaxed/simple;
	bh=7ZchepX2znlaf1W+Jc4OkVlxe0UrmV+LvH1MwA7/ccs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiVtvW9eWGXy9ETRF8gN0caCyP55jABneBvptrfs1zU6G1TAyr1BQSFNKQrwpFh5CiT0HftOMxjBXVdWwQLl+Ha0T0jQE9RWMGQEUiXvpLc6aevaFvFRkbiLZGuKT74q9WeuwgsDcoWGUQiQAULhUiODoWBbhN570lARGpbbi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOW1K3lp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOW1K3lp"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51acb95b892so4255517e87.2
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856798; x=1714461598; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXlA0vz+18Lb+7497sCyCPbM3iFgEXBR17af5fAEoCY=;
        b=QOW1K3lpwwLEqMD3Xdp0YjB3VdV8ErMHZb7PgLqIE2s+I2oTJlLl11PIIQB0LfE3vy
         ycSUw/R8sO4AUmmk6jFbgOWmYB+MD7od/4GS7L16zjt+gLMJVRmeCcXWNFndB6c0q4IP
         7POuvAfppgHKcIahc/u2WdSe7m+3mwrMl+Lik+DqV99dsVuJostb63SkL1S/wo2p4H8T
         /yuubSipIaZ2h6XNkmmvDJqnedFOIkilT7uBJxjyC4g2/yzopsknb34gts4JOospKr85
         dKtmkzkaPy+Vmf8E149CEdSXyKl9CE1VsxcpUegZSUj+YSrepAI4ESi9QiJfciaX+53X
         gV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856798; x=1714461598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXlA0vz+18Lb+7497sCyCPbM3iFgEXBR17af5fAEoCY=;
        b=DfSZ07LUUKy+aqqG2FJk9sRwHsLSAnocrKcdf86gd8gTnnY2/ZP0DnOL1vcV119QEu
         qqdzNznY1ehWl1wpU65YJSSi8Qy20rx0/CzDRAinOXUdKgVZgZSTOioUexfhVk1fboeJ
         VBiH50tBEGDLYf3Bgo13ZvlzJQl81FpybZ/MkslA8R36Bh025nE5EEBJ74fDvCmu0HMX
         ItsYNA9D5JnHkVVyPX3hgUIzRFGpeMMf5mcT44gxKlEaKwLnSb7uKFCZAGYHNJjx+UbO
         iQ+c8hOjpvw9t8ja5PA5GBSN03Lf5pO6PoLLH5gH/RXmUPpoPJwAP+MLB7006Xn9R0z9
         K8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTL0nMdwF0ELNWOGII2yuQlRoEqYb3x8yTetPSGe4071h/lDTvQ7dYmipCf5eFGVaPdH37g508NrqEgX1cgnY1J4M08g==
X-Gm-Message-State: AOJu0YyY22qQJIUa/NdD8/+FZVW8beBlNeCbodnYIMsvyNf4qYXseTM0
	XOC8f+Ie+ZeiifAR5LMAYvZW4cOSw1lDkUV9ncZR72WR77tZhqZ/pKA+7sjWDGk=
X-Google-Smtp-Source: AGHT+IGGnYoJRlkr2ZtVgyk7NVrxj8BGE+VKtvdR0iTD43TKecu30uegGmrvxHqb6hNuBc15obtsTw==
X-Received: by 2002:a19:7505:0:b0:51a:f689:b4df with SMTP id y5-20020a197505000000b0051af689b4dfmr5704254lfe.44.1713856798484;
        Tue, 23 Apr 2024 00:19:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:53 +0200
Subject: [PATCH v8 7/9] ARM: lib: Annotate loop delay instructions for CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-7-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
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
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
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


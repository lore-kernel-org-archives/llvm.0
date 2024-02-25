Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F7199BE
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891700; cv=none; b=PLdNgAGjBXwr0rRejE4gwbkK83a3CBCNuqApBsIedwrGoXtBWYmVoV+KVst4KB/fkt+vRgnDgTbuuIo6XFnByjYKX3yU9g/1blgxHFas3fgQ8k2suQL8DulnYzYLKXAIOhI8mN62wa+cd2GyzETRjnkj9sEeej6ZQ/Fzo0+kosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891700; c=relaxed/simple;
	bh=5SGDm7QNCUVYjMa5HHJMDC7JvUxru9Eq4fafddtS4Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7UfIh/WUSQRBhBV8UFBRv05zqOoSdzAH9F7ma2ug5WF1dwLE+MpxzlFSc/+3VU0Nzq0a+9vkDTYQeOhiU71Lwyo0zJqGjaqYGJ/A4h9TElr0mbzgN763VsVLa/Ly5DqoxAE4JRie+FspF+Lws4k0br89pqUAqQ+YrIXfhXiQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XwYf1Gr7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XwYf1Gr7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso2213912a12.3
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891697; x=1709496497; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=XwYf1Gr74MRvz2aYEf6SHCmAzhXu30mfrK60ArnpJAvZs+se91UGBmZcXWYAJ5x4gb
         sUKn5kf07PsLDi5ZHZDcNvtHNMJaBK86l4K01SoBpH87WTn5c+juUjo5VckDnHIQefor
         cEVE0xQAkbpi48JlJBzDQ68bY7YK9LFE67z8w8m4CGUf1tjG6aF9hwja4wFIrONOvPUo
         dl07bUbF7+RWkkPWjI5nlq1T2jo+egMxHUyWx03vg8PO64r9mygmbLfTUsg64ygzhiHl
         /N6NkgFlJuxjrXuNOG6xZ64zDg9HuV2SXQbS+7JtVm6g3ksYFxCS+hGGuzRLUrfK4cuY
         5CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891697; x=1709496497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=sOak7IDbdZmOxh5kj2mAr7s+FDZWC3bzOGFWYSmwCrVOQj8LH3hEg7FRpoFof/YctV
         X5cqvZvmg8uLQyIJILgweKN7wInzMSbZBtWgSg7+68JjOFJJ55WIHMjKIRTK6ZnFL7bQ
         xJtdaoZyuKohD1KDYAjfP7GLeb9DWlyPUHZPSSFiDb0SUhEnAuuobSBE+VCofjOrtT8q
         skay5pwlMvCSL0Sr2sd3e4/JpRzP5hTakoOyIACPSpVaacyfp5VhvBICTLwH0AFmov6d
         Ao+dIGfrEhetVGHGHhGJ1183E46UugorcnuTY65qNvfTNNK9DElmOvnP8z104ZZjoD6L
         hUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjDJMfTiyqmhOIfdUMEqoj6tauBfdwBVONBf3PiFS4kearqF5+Sfv3ul97prgQ7RtP62DiNZq1vQWZ6uXHP9fBLTfXpA==
X-Gm-Message-State: AOJu0Yx173hUAVzygsymdnRfKqjk6j5VoIdLEgSL0uSmg88+3b2yE3/u
	q0lr/za1zpG1Zms9CpiHK0NeMJBShkseCdW/cPD60xIlVr84dRqYI26UB0uE4kQ=
X-Google-Smtp-Source: AGHT+IHACgERb6xIUeaYkFa6VntM3WbFza/uQrU+TjVC2bkt/yJGY3XoiECyU8pm8Wl+xgSi9WmMFQ==
X-Received: by 2002:a17:906:f155:b0:a43:3f87:b985 with SMTP id gw21-20020a170906f15500b00a433f87b985mr936069ejb.75.1708891697175;
        Sun, 25 Feb 2024 12:08:17 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:14 +0100
Subject: [PATCH 5/7] ARM: delay: Turn delay functions into static inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-5-6943306f065b@linaro.org>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The members of the vector table arm_delay_ops are called
directly using defines, but this is really confusing for
KCFI. Wrap the calls in static inlines and tag them with
__nocfi so things start to work.

Without this patch, platforms without a delay timer will
not boot (sticks in calibrating loop etc).

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/delay.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/delay.h b/arch/arm/include/asm/delay.h
index 1d069e558d8d..7d611b810b6c 100644
--- a/arch/arm/include/asm/delay.h
+++ b/arch/arm/include/asm/delay.h
@@ -55,7 +55,10 @@ extern struct arm_delay_ops {
 	unsigned long ticks_per_jiffy;
 } arm_delay_ops;
 
-#define __delay(n)		arm_delay_ops.delay(n)
+static inline void __nocfi __delay(unsigned long n)
+{
+	arm_delay_ops.delay(n);
+}
 
 /*
  * This function intentionally does not exist; if you see references to
@@ -76,8 +79,15 @@ extern void __bad_udelay(void);
  * first constant multiplications gets optimized away if the delay is
  * a constant)
  */
-#define __udelay(n)		arm_delay_ops.udelay(n)
-#define __const_udelay(n)	arm_delay_ops.const_udelay(n)
+static inline void __nocfi __udelay(unsigned long n)
+{
+	arm_delay_ops.udelay(n);
+}
+
+static inline void __nocfi __const_udelay(unsigned long n)
+{
+	arm_delay_ops.const_udelay(n);
+}
 
 #define udelay(n)							\
 	(__builtin_constant_p(n) ?					\

-- 
2.34.1


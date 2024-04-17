Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471D7EF0F
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342676; cv=none; b=bkQv9ZVawkFmmUtBmfShDjuO9MwjeKlgAzLJWbC4ViuKJqf2JJzyEnDnDK40mM9QTvu5LbO6fIdLAyVbYQscMgEnRVHBW58QH+G9DPh6BQ5Usl4Nz2AOhc3swXZTYB1a/4Jixuh5Y7KW0Ebt2dVyYjZDnc9foj/OavybR+qOhIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342676; c=relaxed/simple;
	bh=7O3Om7ips7szRQxRgx+RW7NvKEbAxZva25/bAWcwIds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1UNDgxrhMR9p0UKPeQI0WzjyTCx07u+wTdgb+MuLYVTgkVk04k3iCBAli9IohGUijvMPab2N9RekhZ6XotKZt1s0A+dbr4lpUHPZ+oY4LqozPGx7UB3BB/rMTkvXMQTqJQHI4PkeD5x4e4+dS4GMATBgPoch48AXvIem24ae5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBV8DfdU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBV8DfdU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-518a3e0d2e4so506384e87.0
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342673; x=1713947473; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=fBV8DfdURIZTufhwJtSNKxCm+J8kNzt0WS2PRllSqOKE6hH+oHykjRw/rhPekOXRHG
         iVb5X0ePBCGUz+42IERmzGYZSh3HqQ4NzD7wxMqV72nJ/zWXCwWYERuTI+A4AgIZkI4i
         2CVMi9BbO7XZ9QGhSwQwZq80Yz8ta4TXrc23p8LFZXml5Z7ixoHIIlgy7F5Fa6jmvGfV
         sW+88g0GFWLATXr4pDCThAhLn5oDhTIUdTRP+r72Boc1QVPOIrajGjuACrljO7NIi2XY
         L8cyVb941a31KbnNw6fWGkHp0BY9+xAZTKPI+YgfgoCsqskSp8d0fN1yOHLh7PUww6NN
         /Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342673; x=1713947473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=SZ988RZx6wnfzrRe81882R+t1I7LC865XvLJgrznh41AJBopmOFcXjO9Tis5hKONOQ
         pohlWHAqFu33t1eAUwsjgQ166xwb/7BTnvx7GtjiNnBC8FSMUCYqb/NEHkMqcXwct+cJ
         R1+3XVpLCBkQ2DC3bF7VgU5dFqd/DKB8TpxhR9uTipp+0Up1DH+KYHG4lClHOHrF2t1j
         9uzgXU5jKRD70Bw/QEUgSUvNOCxUjXq44zH4d5KiliWAry462vB5M1nsXQ5zAVkBSJNo
         q4FbCaedXM/ZUzEjYis4avqtf6wYJJuTUI20JAppJXLfhCm4NDouLpOyK6nwApNrJUtc
         Agtg==
X-Forwarded-Encrypted: i=1; AJvYcCV1HXgxAOsVCz4DFCv6kWQjvIb4b1+WUTYP16C0B5lhBkprRlvdOwoXdKoW//cr5hkP9iSXEMAf0CDiWs3SdCbwcUWJew==
X-Gm-Message-State: AOJu0YxGVpoyHIhP+2DxiU41Agdt3MXYipykvBkub1d58Wjj1KbGofXI
	Gdlu/FzdX82hIByxkThnARVRk/J9aWZPL0mSix8y1XdwgB55Pj1Xqo80Tk3L7FCefjynIi5hBW4
	o
X-Google-Smtp-Source: AGHT+IGN7KshMjL76IO2W7gDdx8lXhyK3hvTNv94FJbHVjszon/A15j/oB2hQ+dAApW8hZTk3vdPCQ==
X-Received: by 2002:a19:e005:0:b0:519:1ff0:27 with SMTP id x5-20020a19e005000000b005191ff00027mr1281203lfg.22.1713342673217;
        Wed, 17 Apr 2024 01:31:13 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:31:00 +0200
Subject: [PATCH v6 11/11] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-11-6486385eb136@linaro.org>
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

Support Control Flow Integrity (CFI) when compiling with
CLANG.

In the as-of-writing LLVM CLANG implementation (v17)
the 32-bit ARM platform is supported by the generic CFI
implementation, which isn't tailored specifically for ARM32
but works well enough to enable the feature.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..df7bd07ad0d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -35,6 +35,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP

-- 
2.44.0


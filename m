Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88914293
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148545; cv=none; b=R4BXk/n3kw9J62aVsF6ELDfulrSX+HN5GNXIndqWXW/lcN6UcwLhYcrSAAYOQDXf8e33AU0IayACX+8USlHOGRuhbrqpnbHQBRnCMP0BLohPRMZ73VjgrpA24B+MY72lcIuMfJLEwrKjid6hsiYdaUNGBWhYICQFQLQMAapd2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148545; c=relaxed/simple;
	bh=6p+a66UDUSXgEFKwwrNNqxq3Xu7yzN1IQ7D6NZSeuOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHeKoYZqbOOSVpofPm+dDPIswc+BdmYh0++AMvtELSI3meZX6vXdfYb6QU/I2/i3AiW/RGdj/QtU/W1+ppgfHw+mtl9s/OLfEsDIvz6xqzwAZ07hUGrTd+j4G/xUCJVp/jFh1zHaNwBLVgkgeew/l07ea5PkWkmorH8v3V5QtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JgoWKN3b; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JgoWKN3b"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a45606c8444so485494266b.3
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148542; x=1710753342; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=JgoWKN3bVo4eNrd0bH3kZSfNWWREfsrJY/AHYhyFCqWyKI66nPNrnuEq6qmV9RPmjP
         cAL3OwixJMMDmet1/Lov/ZuHNuBbu4SnQ2fi4IHrT0Z3tPYUb5H8GdgVyfvl3b95QD54
         X88QP8YGlCAtfdI7Ap9lqo2haJI1GPnIjkhIjdTH9VYzeac3p5f1lfhJBze7VR2tkz1F
         sZ2B92zlxJ8KN/8XQM8vLc2NLWxkP6vT3mpTmHo+T0bZtmuqzYNMkvUT7GQFVF/oWVl+
         PYmCj28XBdpduKu8/AGN2M/YlPRmqlLclwlG9mCLtpCMRSMJk0d3BkocmQzkNVAjnwvj
         FCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148542; x=1710753342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=HYp6tEED0bb0i71biLeShy3jkT5rtoBiqoUz9O0g8laYtWW9Dmu5io5F3VxxE0ZxgW
         QNKTFEhrYAAA2h9+nhOsHZ7xxXr2o+0SdNrFIGgywUIjBlcl/dZEkAkWA/Z0BzMiy0zq
         400/1EpFHEm8L7Sn6SYNgGBhj2SrSq7YLY61pnueI9h27XCP8wXLh6SR6POzZ1h352US
         T2PKidiCfG0jkl6vQllxsEzGVp1CQHeX2JGi0HYaOCag8PPOVdqlFkxP0hiI0bhnRopw
         BKHCEBjcqH9bVyrrDRjD+gx5JqCCBNlDCWuObBIgMi7LJiFCR/PRab1KERwtfKQU1FLW
         DmIA==
X-Forwarded-Encrypted: i=1; AJvYcCUyD8Spcl8OySq4L1Ujld8ShHQ0xcIGjDbEchs8YUojZ8N5NQaPv+HQmMN6rzFK9qt6X7zWvmpxiZiBtKVs+IHfvP5vMg==
X-Gm-Message-State: AOJu0Yzr2+TRSU0KEr7Ic/38mLCuu8FID+0L7zjSIzYjq8QkGoI3LeKE
	DePDtUeYV6O41/auQPtKtTTZamAkZh/xUvdkP6Iqc3sPb0jT/hF+tDDCVM3gMpo=
X-Google-Smtp-Source: AGHT+IH1ShWHVcuL7royJmForLT2aqxmDB6ut5XSUOvUt0Umf/hDQ4y97HyAoJH2LFefeWUMgynafg==
X-Received: by 2002:a17:907:c086:b0:a46:2349:7650 with SMTP id st6-20020a170907c08600b00a4623497650mr1957475ejc.17.1710148541902;
        Mon, 11 Mar 2024 02:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:38 +0100
Subject: [PATCH v3 1/9] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-1-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Support Control Flow Integrity (CFI) when compiling with
CLANG.

In the as-of-writing LLVM CLANG implementation (v17)
the 32-bit ARM platform is supported by the generic CFI
implementation, which isn't tailored specifically for ARM32
but works well enough to enable the feature.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0af6709570d1..1216656a40bc 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -34,6 +34,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP

-- 
2.34.1


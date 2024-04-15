Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E773530
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188628; cv=none; b=jKVfQdNsRu0j3ImST9ePTQyn8GABh5glFpfQwPbc68DHSere8H8DORe3nx0MNuTjGzWdTkp1pNmk3esSF9HclGE2PCfmBVBJJus8yCh3TgdCcbZ8jT/SB1Vgunsrb7VdyyxAkimWQg6756TFMhakVeG4tZ3iGu8PzrSaCFEjeUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188628; c=relaxed/simple;
	bh=7O3Om7ips7szRQxRgx+RW7NvKEbAxZva25/bAWcwIds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2shq5btj90OczlhpZ0mM2lMR6q3x1gnlukkd2RfdQl6gX2SK0/cnhvlQWhzu9vj4eeCgYAEYOrs1jk1g7Fr1MSERJBRhUpxmcJab2sLffhYNopCqhCGBo7eL2kBCOXyHMsZoBXNLEg91DKlp43GwuF9b90OBD+3ckTiiBWvPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqeZ6Igc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqeZ6Igc"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2da0f8f7b24so23852481fa.1
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188625; x=1713793425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=pqeZ6IgcyxGyWcpg6saXFY/vB9TqvB5S8RkXeB5kbes2avQEaPzJJBtc3Ojh5B9JWY
         vBj1ZlxRsopnEWJNEX1LRbec/SSU0FJiZ+i/iUK2M8mhYcDejy5N/Uy1CF97Iwmfa3oI
         w54ie+cQRSCUyWA4K9zm4hEMsHETFz/DLPrhdqFSbZyOitvJjFx1Kj23yD7u1vTF+Xmf
         KO7WeRystcCS+hitJX9CCmPO2/Bcb6AFY5N7IFopFDdTvCpreFWsAPPPLfCh6/XS+R2J
         WZ8kjtvNS29XiI0K7+o6T+X0580eo0Efyekzc8nPMj7Q+WEE2chlzWRjjMk00euVhDMc
         E0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188625; x=1713793425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=bm2iRdWfs3YvmzBGrmBY0ZVG0eG4O6atbrynIOp77/XBQXiDn3s4DvF51sfR68mslI
         MgCoWmPhsQcvGDfRPVhLjQ0XAfJ72+rjGXtYp39nnUBNjpi2qo/7IALVh5SWhF8mtPYA
         qdxoFbwyEEDSPg5fbVgZ23+LEm7QEH/gixpfQVoDU731qhluHmYkkDXYvQqMVqvDM/it
         FK005IZ1wprBHvaZZ4uBf7j2E1pfoFJpVOrlF7xfjZdJiXpkEAtC4MXqNvfMUsujbYMa
         x/G9EPrZRdToHZjaJaB1Ar7v8QYiwZNIQyCLq0Chb/ucWdABYC3gRI6Kx/qciiYlqqrV
         Gltw==
X-Forwarded-Encrypted: i=1; AJvYcCWjtwwhcwkCqnTKMeIj1za1bwEJ7ZLAdHrd2KfmiDVNhIuV0YUJ1DJGcLUfqVBe6S1yTNgw4yWuBB8s/2XvEIotVbd0Qg==
X-Gm-Message-State: AOJu0YxtziUuSW5ETp42CR1RJNS+1g13m4VeRsK/MFZqdzKq3ZVJPj06
	sud2eI59gFvKA0eAzgF6qtRltSXEx2SPue2ivDoJf3fWN0BMBo3hZdI3M5fuwNk=
X-Google-Smtp-Source: AGHT+IEmyCgv9WW7TFMUR7JYOcSk9YY4+1KCbUsCbRpdV3oTPSyMbS3vKIvR5G7m99Geqd/RcnjwLA==
X-Received: by 2002:a05:651c:1053:b0:2da:b13:f405 with SMTP id x19-20020a05651c105300b002da0b13f405mr2699614ljm.13.1713188625317;
        Mon, 15 Apr 2024 06:43:45 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:29 +0200
Subject: [PATCH v5 10/10] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-10-ff11093eeccc@linaro.org>
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


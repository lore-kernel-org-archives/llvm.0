Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53697548F8
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613983; cv=none; b=GT/zsc+irmptkJyE+qB7cIc3jG8z1O2a04+qGNpzXamU2J7OHHHqblGwlrLBhIasKp6BHA7/cayojayTKgNSuIoOtiIEwRArDIWVJAyMNRfsirk+dwa8hNlAlHbYmHNK34mgVUXgeFKp8SEr3Lbc9N9KGvT4HiIjJYQeptL2+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613983; c=relaxed/simple;
	bh=ODy0lqPwCSAQDRS6+g6WoTcBw2rSrtyh84GmR+QmmCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vv1RINHKemkSZydX//G9Rec2ldjCrczasCtGLMIIQW19jJfQaJZ6zg7P13pqzdeFr5x7G/04kHaN/vfAJO5hj8lQtkMZD7p2JDETcF36P8oKliC/wGJ6fKWLdkrVbqh/bZFs/54ZAOmONgvrragG6vck4R0f9Z+/aDdlVxTVqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiTyoBHf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiTyoBHf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56c0bd07e7bso763532a12.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613978; x=1712218778; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMzFUnRtX62zU/R/bgMwI29QqVpyfZ4QmTH5fvJSYIA=;
        b=ZiTyoBHfSE0uxcbFRzWu/sb/GqSqYhqncT6aN1ndjNjscx0nDu3K74LxYTjS57ss/e
         BVmImiAbEDOtb/axlKcgPTsc6WusQZdHAkXS3h2erUZoTMaD1Wo1OWZApgha9fXU598t
         SzihU2ENQCRWqTKyyNoRWTZxNva9CZqOlqy6QUbhIbavBQNO4EZCDR1znpCILgstT6vf
         Lhb1Gy5kf2NEM3Z8FFJadxzVajmJ6OIn8zKtbMWhF/FauLiHleG87T1Elx8HOXgpj0/J
         v0V7Itcerd+i7mtW7BKNAp/P442QVIgtGSpOoeJwgF6EghB2V5kAWDAaq5yRjT92GUvS
         KLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613978; x=1712218778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMzFUnRtX62zU/R/bgMwI29QqVpyfZ4QmTH5fvJSYIA=;
        b=e8G1CH56q/wH/8dJdmMhmgyvYh4zhXgpjlW0mh350RIHq/9O7iWx30JkLNzVvclb0l
         FH77icuNYHnQh2Bd5+fJ+Ah9uXE/qoNnr696STsuW0GCIV/I7r7+TDi+79PI9nVGvMb2
         WbD7h+McRvsu9lgx+W+gs6ypFyRl2pYOJp/htvZoeTZmzkAVJNOzePGcYuG2GZO1TC0u
         yO1zoq0PC0pijT6ohlw5Ux18zEpik5xNU2rB8cEL6i5sT72rbeShtJeFjp2DEXKTHVHp
         j18ysuj3JQgEWQ0gEJSGK48jTt0NdIzmkBamE5kg1TWOD4txfxxDjTczplugUZh1yIPp
         wsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcN9+e5Pf+OsOp9/8rDOolbxVxG7LgGg/Jd90vNUFeTm/PdleuS6757l+79DBrlvWUqkJ04HtjHiZJMCSeH3QtSxE7hA==
X-Gm-Message-State: AOJu0YzV9u9MrSOOQSxCDwHKKqf67XprRjQ+OBmwWznlLcdIa6D5fGkN
	3lVwAjW+XUydlI8diqid4F2u06T6cFpEymFea7Q6APDiwH7AIznA+q0rUgnXpcA=
X-Google-Smtp-Source: AGHT+IEaiIm6wNHKHpd3YTFQrmxmooI0QpqE73ocyWy1xx61czg4HwW1mF+BVa+YpTRRA1p6sr/YZQ==
X-Received: by 2002:a50:bac4:0:b0:568:180a:284b with SMTP id x62-20020a50bac4000000b00568180a284bmr1458006ede.37.1711613978491;
        Thu, 28 Mar 2024 01:19:38 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:19:31 +0100
Subject: [PATCH v4 8/8] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-arm32-cfi-v4-8-a11046139125@linaro.org>
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


Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C812E1FE
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821327; cv=none; b=B/y/cLFzp+6+eLC8EmjEQYh5xS1USkYNNgHZI/S+tPUI/BhxFIo4KU7usXLg0G6FFFy4J0DlT+vL2e/9v4AZcHQZXXPqlH8d+cUQr7gOfg2jaAuZZoPpigqdPkKqsS756oTL81ONII2Vt+S+TsO/D39aPgI+Pn8zbffjhiSXkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821327; c=relaxed/simple;
	bh=6p+a66UDUSXgEFKwwrNNqxq3Xu7yzN1IQ7D6NZSeuOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvLsBWSaXL7l7fTdlq3yBvUy3uvwhFH4LFCXvofOnUsbCID8aQg8Rz+wn2Zab5FWlfRhEkMILAjyryaudyaPnYlFY7qGUfGzalBDfnzSgzEEaQGXkT6z446OQXofOP+oP+eRtAqPCz9SrbcTHh4r57PfDnwlzbJe38q/jS7ERUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4c9gQZj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4c9gQZj"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51321e71673so982358e87.2
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821323; x=1710426123; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=f4c9gQZjZeIbT66GC/Jf3xzenOZULMdmM1LJVRIxSS/RtZtT9dq/QtRb9hagdXvQCW
         VdogXOukmtweZAck6UdlmwYuNSf0DA8i2NuNYNuogl3uFCgDQgpZRREppLoXUv3h5DxR
         tsjjqCdaVnGMiMgPFx82zVR3kfO27YGHDdgsYseAkdUgoM2QW8IDXG5mvYvl5Ue/cW5O
         cMRwj1MjoJAxC62Dwe+UDDf3Vx0iTxPzIwTL0Kp36CgMwk43NtL/NE/XkY4ULO5/qmRP
         HhMX1dPA2OgtIUABj2DzVT0EFwv5txhjYLE3gH5ZTbnoqJrlC32tl4UHtbyLJsdGa1ws
         OoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821323; x=1710426123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=Gm14fLl0kSwdofarTtZCMdvE6DKH9QJgXKVD72OQ3Hl2F/rN8KBtfnZrUJ438mLdlH
         8sxVFgF/ukH8TGHj7fkabieA3Ptr9Ei84UXomkzVIgEUOtaqpN7OipS5F3C4ugJ117Tf
         xbZja6WyVRrD1F7dpjiUcXLee5XYgnOA2iXBCc1F4DAGgARkCSpOAIKluBqT4rzY3p3y
         14WNRe4ikmu0dRI1T58pmSLbyUH/VWEceTpvnycC78gDPQK0Xmi8l1+9HnepTkA9vCZU
         wfv6anFCDHlFT8mDguT3RLtBC0eAlqqYEXsxNJydu057UG6zd9F8c4/d+okSliH96uSZ
         Kb9g==
X-Forwarded-Encrypted: i=1; AJvYcCW43ah/n6zjqLyO6MLyCFPsAeij0hDBEQBg5tC8Y7SxSqFpFnN4TlQnIgk6V2WSXFRrGmkuWLvqlyhHSfeVOCa/hKuQEg==
X-Gm-Message-State: AOJu0YzxWuYlEPGGF8BWnNxJYp8Xqob4PJ9QUz0DxD2sBctIpEJqYTj9
	K2Yo3q9CDTFe20jdiKcCtbyU9hTQVWfqOELLA2m2a8Q2Bk4LtUTvC+MPgknurzA=
X-Google-Smtp-Source: AGHT+IEjEs26cHK1t9iAXvxyu/L9BJnGLeqBGsWPyI0GJgRqzy6czqPbkg8pKDhoELdHGfHHlDTaeg==
X-Received: by 2002:a05:6512:3b1:b0:513:600c:4ae1 with SMTP id v17-20020a05651203b100b00513600c4ae1mr1522176lfp.27.1709821323348;
        Thu, 07 Mar 2024 06:22:03 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:00 +0100
Subject: [PATCH v2 1/9] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-1-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
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


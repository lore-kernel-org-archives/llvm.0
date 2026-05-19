Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C962772E
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152373; cv=none; b=u7H+KNonSqkHDmjupjH7kIhkxXtK4Uw/CdCE53p7s76JbK15ejUnm+c3GvkmWJ8p46xIBZEOrNhpxg9w4nD81vE5Du38a5Dvs9KohMY8hvGRKyX8WJWdFDHfLGNsz1FOFWxsP5cZ3YcbXuCILaxpG0Xnd/b47OBgO9EjPdEN9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152373; c=relaxed/simple;
	bh=RVGlnfTJCsA2aWIQ+ux2CjHM7mpyQZVo8nD9it64TAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3G1Ryg+qceDCUxUhedf77K434QkCxUfaLSW8VjTecmTk1AL6KX1u11bSg+XzxRWeyViOaRe4fTr/USyCRLV4PRv5uc3u+kGrpddqmaM4KGgzZ3tN3o5dK+P6Mh2YUNdyTh9Y5tGfqpfwaG0I7KdpBSZVRY5Tr99MYCGRhNkBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aA3+sdCj; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aA3+sdCj"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c827313dac0so1674338a12.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152371; x=1779757171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zq27fTWBB40gdJ8oRGobsPvQc9+O/rtZ98vQcdGin5A=;
        b=aA3+sdCjLEigf8wEuOFD1mEJqcAco9rIT47w+gH08UIiHn0M7BCgzg06Z4sXPX+rMG
         kzZn8GrzMXOKsnRzf8J0z9IpstH7G1PNSrmP/4ilZaBEeuJtpAqpo5B/E3mq1HGNlh90
         zh7Yn2IJuIO9f4H1uP6aOB2iuOoJKR4WOzUSGhG6OipKZ59Gsr90nmHA4JlaKW7KR8DQ
         jsOnzrnssLWi2ZLf/oHk6A05f3/K3LeIX5UYxb722UU/YjZThKXJZHiOSeEIF9s6mCd6
         ByRdy7ivQaICH1czkqhQaxGcdleAqaJs/Mmgnzb0y6Sli+CME7iSE1Hy0I+BeILiZp82
         ZYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152371; x=1779757171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq27fTWBB40gdJ8oRGobsPvQc9+O/rtZ98vQcdGin5A=;
        b=YtEIyIBVaoYvs6SmaTpmgHNNR4eeOOT4CC5SGty4BXjO2YQxCSSZnpaNy7iHCuBWUU
         hn3VdlduG3vc4XeruAQmY+I+dHNwV8+CCp9pAA6DlXj7VST3L2PN8vjD4QQOs2uQzr2s
         75WCCk9JQ/mId2HhzG+MR+iV3yyA/M2Ti0V+RLOBZ5iSbT0oYVYhLycZuB9UMjLugQSp
         PTVTL7xjs3JNQ+oaRVh5KqxN+9Y+HmglWhpCNO5DFbDZCekHqPLsV0GlsjWNZOQFlmGo
         JEhRdydnJbda1s+cNTyM/dVB2n6bB3OQPcIzRZTV6E3vc0ZFGrXSiz4hcgRpkHN7t/ZW
         dLwA==
X-Forwarded-Encrypted: i=1; AFNElJ8sqEbjCbENhwnlM8GJFe7rRPADvEMTsD04d8j15+J0mYAJmcZN0tKDWRGVUCLyhaCbbX+U@lists.linux.dev
X-Gm-Message-State: AOJu0YzxAFGTd+Fm3u3gegYok5eSp0turjwT89tVC/pYCpB4MCl0VQoI
	4MqeV9q8rBGK/UC6TO0sxVOCz6tElv+R8YKM3e0Di8/KSZYSQAZaOlzM
X-Gm-Gg: Acq92OFmnWWr8VMDb2SP1m67Zi9zPo2MoKcog+LMTi6iavH1IWhS3dBV1pjCp+VPrEn
	LqNLk0Fk891FzmJ3Si52vRMAPFO8dirMuHB4toQ/OP2R1jSoRGP9WoKjJSJ49n5ywmbsGh2t3a/
	0FkgxnnWvh8jTencKj28sCuysxqYrbYXN3m37LvTQlPIWToP/fQRLLx148DJVkXAq2oTsZ3K7rN
	4wMHWEdAN7LXwmA8C/NVH+efraCKpEMTQOSu40V5C+QPQKt0hgO5m+umlRNvbVyc6zACRsVuV1i
	ruvUiW11/AnwIt36wzeO4J+euWR7nIrAcGD6Wq3/okikgTKhxnou6EFcjQxqWxyyi8SbQVskU/Y
	/UCQn84SB2YT8j1+vo3seJCwTEkqSLWoE9e6G9yaFOt1oH7llNUNxVwrfJ4B8PcO3X4ijmELVUV
	X+lZ0i/8XNbu6gUe2mX9GV3ULYphTvypou/RGpu4ozUtpHO6J5vF0sydauSljxdIs7uq8ZlB53G
	IzduQRfoTtYHGstL9NY4zuNDFDp8+sXl+c=
X-Received: by 2002:a05:6a20:a125:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3b0c009d62fmr19703341637.22.1779152370763;
        Mon, 18 May 2026 17:59:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm14813384a12.28.2026.05.18.17.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:59:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: en7523: allow COMPILE_TEST builds
Date: Mon, 18 May 2026 17:59:12 -0700
Message-ID: <20260519005912.628667-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha EN7523 GPIO driver uses generic platform, MMIO, and gpiolib
interfaces.  Allow it to build with COMPILE_TEST so it gets coverage on
non-Airoha platforms.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-en7523.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00fcab5d09a4..ba2e8c802093 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -302,7 +302,7 @@ config GPIO_EM
 
 config GPIO_EN7523
 	tristate "Airoha GPIO support"
-	depends on ARCH_AIROHA
+	depends on ARCH_AIROHA || COMPILE_TEST
 	default ARCH_AIROHA
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
-- 
2.54.0


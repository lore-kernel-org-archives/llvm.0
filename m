Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF2440C
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 20:14:13 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id h2-20020a656382000000b0044b0f6c572fso3159703pgv.20
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8mJKRUhkPO00K8I7nJ7lKtujFUxdFbhGR6doaLvrDA=;
        b=BYM366/GijWPTopDA+VEKZCw8lt94RZAa7uz9fHy13iIxLmF/SiRvm6EKXw4XkFrVC
         0/AFpRSo+OkTcJcEowFM26R/wt2WYyUk++ENn0H40iFDFIrigMFwh8BWRUOE7iRYNd2P
         qKAY3+4ocVgvva99hRSjvPK9PZJ6zk4lV45RCTz0FkCeST3ME72YjlFgv3742PGmb+0j
         n7bXvVs99h6QQWxXId6qDWLzlfR0W5inoQJkEbJAKTb3U1mef5pUMKhTwlFV7xn8i8H5
         VWMmkzgTvlXM/Le7Z9DDzVYzaw2o6i0FoK8vu+l/U+FukJtX932a+ixfNqPrxYRR+d0a
         XGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8mJKRUhkPO00K8I7nJ7lKtujFUxdFbhGR6doaLvrDA=;
        b=pM/y1iI+rcZ7BgaLa3q8Fe/F3qCU+bvmbwul5KjNh9YGQSEP8s0P9Wt9DPFw6MpX9Z
         NB/G191tYchbDST7aU48HaCp73JfAZ9LrDGWGC2RXRRPQPw8P8N3Ga869aIQuLnoyZiv
         w1UmMb7UG+SsaagCtJzawgFEoNNHv2r2mzw8mjjgDscEjba0bkvuKURfMP72EI46jJLY
         SSLp1IMsYV1AhVuoQl2P5W5VZayQWcZwSlOzcssxeyDrRYZfVYUNPPDRV1ndB1aeyV72
         oT2sz0MDsSnZLEkkpfOzHkrGKCcL6OwG3EGGKTeYB+nGDE2ahoExXGAvqn4QyGD4cWTF
         lMLw==
X-Gm-Message-State: ACrzQf3qkhB48SOzLqHaxXaF02hRrLOltJfL5ybzJ5/DalGPQdHb8AHy
	ZA9xlcXv/5xbYMAuSPoG61KYmZzuXZCKp1M/5bQ=
X-Google-Smtp-Source: AMsMyM6+9zpr2T0LPT/BeZEh1rZWUcFwUjwPvlqA2QZ7aSFLVdSq53MFZ5X702ajJs3ldp0bupobvrmNpHPhBX3GB+E=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:2ba5:63af:4077:4515])
 (user=ndesaulniers job=sendgmr) by 2002:a63:f20a:0:b0:464:8c6:f27e with SMTP
 id v10-20020a63f20a000000b0046408c6f27emr5950038pgh.411.1665778452643; Fri,
 14 Oct 2022 13:14:12 -0700 (PDT)
Date: Fri, 14 Oct 2022 13:13:53 -0700
In-Reply-To: <20221014201354.3190007-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221014201354.3190007-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665778434; l=938;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=ACjI4N5sTL9n0wpGEn6FRvgPw+8Rz09PIyJcQd9YCec=;
 b=sGDWzyqBWRtnFPlXYn6kJkJaWPxF/mHGnIFQ2BAlp1wGuBNBknNXQsLiZyXK2nnSLBk0d43jnQ3U
 fmzoIrnOCxUcdMi39cmhiVMeJKrVlAhtyIzU8eFJPCyQj5/IiRBo
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221014201354.3190007-4-ndesaulniers@google.com>
Subject: [PATCH v4 3/4] ARM: only use -mtp=cp15 for the compiler
From: Nick Desaulniers <ndesaulniers@google.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Avoids an error from the assembler for CONFIG_THUMB2 kernels:

clang-15: error: hardware TLS register is not supported for the thumbv4t
sub-architecture

This flag only makes sense to pass to the compiler, not the assembler.

Perhaps CFLAGS_ABI can be renamed to CPPFLAGS_ABI to reflect that they
will be passed to both the compiler and assembler for sources that
require pre-processing.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 8dd943b50b7d..ee888070b2ff 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -111,7 +111,7 @@ CFLAGS_ABI	+= -meabi gnu
 endif
 
 ifeq ($(CONFIG_CURRENT_POINTER_IN_TPIDRURO),y)
-CFLAGS_ABI	+= -mtp=cp15
+KBUILD_CFLAGS	+= -mtp=cp15
 endif
 
 # Accept old syntax despite ".syntax unified"
-- 
2.38.0.413.g74048e4d9e-goog


Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0ED2F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:08 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id z6-20020a257e06000000b0059bad6decfbso4529344ybc.16
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Rf8jBzZ3eApLb3r5KnUpdRGXEBCEtWsNOWspCDCC/hg=;
        b=iqyF5u4wdkWsWReDGSW9MUA+WQOiWcxgHCBVwiiDnpI0vHJQVskfCl6UZaSZqm9Scj
         7cKa+WF7J96p1yPKEOT2MtqtmpIn9oN3I2NYAV8kHk0QFOCOaZpQv9Gdtgq7fEJGvYK3
         /5HmSMj4tyiBa5Ne+wwBQcLYERfesHxGFyN2JLEgMUN6xyoe0RHNcif07jPx+MKGERUP
         XFcibR/9WZNK3guf7dCnmYs0cX7hGaMFn99TvNA61dhpxpIBt3Lze67A7ysgVkKjoJFl
         xQuCdcrgJuOBIye9Bo2d7LmH3nUJuRcYKRFlp/cjlpEi8sx6x3jXjyg+8bNliFVA0ekZ
         ogug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Rf8jBzZ3eApLb3r5KnUpdRGXEBCEtWsNOWspCDCC/hg=;
        b=Xb5EYVao+YHqwAw0z9TZSVB025EN3SKT5Y3+oAjHDjMQQ9se+uOI8+WtHfY1MYwDx/
         PITnA3CNZ+2+VwuLmvNCn0IaMnK02cJzADYBrwfa3roWq6VGM/cGH/x93p6RDWlZwqTX
         8F3dbbo/5pGe8+GEAfjZ1mGxpvAWvYdo7zaok9fgE/6Obtu1j81zqHNpwdSts+jVyMl+
         r9BP4N+f20EiPwkwvlVkesDe0an7WFt3VEEosCkBnzVjzM7Lw4mCSH68Waqgt/LcddLj
         3PXbJWkjqcP2viNhHcN15RvHaIqW+2a2iRmFWXAnZYWXiE8I6pT9O7zXbEZhgL89r4oA
         guLg==
X-Gm-Message-State: AOAM530f0DF0fSDKwqjFPyBKM/M7rTFBA+lemHzxFCqFoWt7qyvtOPgX
	qGuHQGqdCeuFJA+4N/kjYTu40l6GIDPLm4DJQKc=
X-Google-Smtp-Source: ABdhPJzWzEopVMUHgYzbEm//5d9xq9b3aDazQBNoqRBs7cxPv6GU3P6c/aYjtmlVCsMnxpWGfxhy4bNDsHlRSVGixQc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a25:c6cc:: with SMTP id
 k195mr340980ybf.153.1631317267872; Fri, 10 Sep 2021 16:41:07 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:44 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-8-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 07/10] arm64: remove GCC version check for ARCH_SUPPORTS_INT128
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Now that GCC 5.1 is the minimally supported compiler version, this
Kconfig check is no longer necessary.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 077f2ec4eeb2..5c7ae4c3954b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -86,7 +86,7 @@ config ARM64
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.33.0.309.g3052b89438-goog


Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095A2F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:13 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id r3-20020a0cc403000000b00377a3318261so40037202qvi.11
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KI6FERE75H2tLRM3WxhJHGnTaCX1rYLoA1+YNY2WdtU=;
        b=Wneq6nLtY2fi7biw5FFUeksmuAgLQ4myMnnpQuCOxbV7kuPgGZxYfQLwj/OHwDFAhI
         3WwF5caRL+QBMX7buPsJ5GNPXZ6nwvD21XfRKDyqnLP+1Kxyq+adTa0QBBIuBcIl5Iok
         H3AlVPnVRCJPBDGaof0KjO6nGE78IT40dK8lz4gZV2qOdYSjGPA5XlCzKNDJ7QvzdM48
         BRmFkyse7bykq84YCUdxr4Xmd9MA253Fgw/lROZLx+LPWQkIvRxPKODFP/ip1f/9nAn+
         sVFu0khIQOmEMrVfDdNjK3dTR2rvPvGygSxpDjjl1+zpynlaoGeo+WDypDPtIenpLYIG
         tJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KI6FERE75H2tLRM3WxhJHGnTaCX1rYLoA1+YNY2WdtU=;
        b=a4ZqANFeL7zqevNlMh8gpUDZnqg3KfEvi5ACb8yKS8gJ5gB1OFdrGxzcQu4RmncrKP
         rVtkCFmdJeWUpeVgqC3Mo3urYp1k3Jt2710bYTz+pwfryDorqMV05u9sJ7xj9mowHBqW
         HDZwGBD1rC3j0NUVDVt79mRX3252WQoKV/N3mhiuw6Ch+RNocRV/mcwIN/2WCHgsOW/c
         LRL6cIFoRGE35FTZH2FR1Ti24BZo4wCTWrnEXvKd5sVkhfV2OF5q8eHHykx4SxQlYanI
         ZllZGFfe0evfQwIASCXR/GgI8oMvyUwGMagmGWASNo7eNyxJ0Ai7K36xCsDezttFK8ig
         kL5g==
X-Gm-Message-State: AOAM530uSe3v8Xn4DgTudZJMYgQVxhUnIPi1q/yCyZTos6lXCtyh+VBT
	AQFMCzzsob7dZWFQ1VvEkR4sWInt/gqDscZlMM8=
X-Google-Smtp-Source: ABdhPJzKFYeyaWGf3gYR0EgtJzV4X0Xdp1dLJmFHxl1G2QvKxUR474k0YH7ZXkNoArEsMndUfbKJ/SG5cTxsuGxiYCU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1843:: with SMTP id
 d3mr11020849qvy.10.1631317272617; Fri, 10 Sep 2021 16:41:12 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:46 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-10-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 09/10] compiler-gcc.h: drop checks for older GCC versions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that GCC 5.1 is the minimally supported default, drop the values we
don't use.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/compiler-gcc.h       | 4 +---
 tools/include/linux/compiler-gcc.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 3f7f6fa0e051..fd82ce169ce9 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -98,10 +98,8 @@
 
 #if GCC_VERSION >= 70000
 #define KASAN_ABI_VERSION 5
-#elif GCC_VERSION >= 50000
+#else
 #define KASAN_ABI_VERSION 4
-#elif GCC_VERSION >= 40902
-#define KASAN_ABI_VERSION 3
 #endif
 
 #if __has_attribute(__no_sanitize_address__)
diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
index a590a1dfafd9..43d9a46d36f0 100644
--- a/tools/include/linux/compiler-gcc.h
+++ b/tools/include/linux/compiler-gcc.h
@@ -16,9 +16,7 @@
 # define __fallthrough __attribute__ ((fallthrough))
 #endif
 
-#if GCC_VERSION >= 40300
-# define __compiletime_error(message) __attribute__((error(message)))
-#endif /* GCC_VERSION >= 40300 */
+#define __compiletime_error(message) __attribute__((error(message)))
 
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
-- 
2.33.0.309.g3052b89438-goog


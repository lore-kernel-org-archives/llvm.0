Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A26AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:20:24 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id m11-20020a5b040b000000b0066fcc60d1a0so2163854ybp.19
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=xoz21j2Dj3N22i5I3c/WmVlJjyxmAgsmaF7YGZS1igQ=;
        b=r0CrshHTamGdv7nAX2cKNcCLazSyYJyvvzY4UhayDPzGRMDwZRP7CHkXtY4j+xI9wF
         wtfbR1Y2qehU4i7DplHqn+PpyQUavJTWnmwWvvaN87Zcni1NiCma4ABFCtdPyQi9z2UL
         FN/euEa7ngpeu88Fz5KwJH9v2re3f5vdSUOhr+07dc5waTJt70WFEXamTQHH90oEZ8Ez
         s2nmMpA/rQCiffiSNRmt8tRrpGndqSw5TiPqDXRqg+V+4fFPVBvSgmj8C4NLk1/sZz/b
         6iAzxWzIN5vOGy9krYodMG+7pglSQZI4H3v+0MYZO0uuggFCy+8oSczOhCMvL9xAP4Ft
         f2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=xoz21j2Dj3N22i5I3c/WmVlJjyxmAgsmaF7YGZS1igQ=;
        b=bM3qGxnqJ1Ti/m6ieKG2gp51Wpn6J5jnpOHarj7dvucAMhtUddb96xa08cr+ybJ/Y/
         6ktF2R2bDJbok2zuCar3DCge/YsQEaR5+Rp38+1W3IwMtGaJQOTkw6N1tLyYWB/z0nEF
         UHOxiKpDmfu9STSdZhxtuZj3ti/RiTv03yy/Y++L26PqmZZy22BFTnMkN9S371pY3NBK
         FJWHHuMBGJgwMJaCGZ/4yAv+Pyi91U/AOiuUDxb/64hldmsk1TYNGaRVQv4t36DgeA1i
         Lu/rSq4gb5WYY7JEx43thKUp33fq9aQj+XFmUXj+yomgJBKfUoy4t1sw/9Xi9O3Yr+AR
         IG0A==
X-Gm-Message-State: AJIora+MGuu1jdBKNDneJh5FTFoFcznYBv7gt7TV7nn/xtb77+cT1NrK
	IAc8SkA5N2cCEWI9F06CI0ylJfNlyRoRuPhQEg==
X-Google-Smtp-Source: AGRyM1vEU0TU6446zcFlt8XQ41VpLNIDpvLPJJWLFyAvdYxrrXtwtri0B4ajRFiKvqzZ4o36bIfOakNDOfb3+fL11Q==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:706:b0:670:a469:6efb with
 SMTP id k6-20020a056902070600b00670a4696efbmr500406ybt.410.1658438423802;
 Thu, 21 Jul 2022 14:20:23 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:20:12 -0700
Message-Id: <20220721212012.4060328-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH] drivers: lkdtm: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning
(ARCH=hexagon + CONFIG_FRAME_WARN=0):
| ../drivers/misc/lkdtm/bugs.c:107:3: error: format specifies type
| 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
|                 REC_STACK_SIZE, recur_count);
|                 ^~~~~~~~~~~~~~

Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 drivers/misc/lkdtm/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 009239ad1d8a..6381255aaecc 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -29,7 +29,7 @@ struct lkdtm_list {
 #if defined(CONFIG_FRAME_WARN) && (CONFIG_FRAME_WARN > 0)
 #define REC_STACK_SIZE (_AC(CONFIG_FRAME_WARN, UL) / 2)
 #else
-#define REC_STACK_SIZE (THREAD_SIZE / 8)
+#define REC_STACK_SIZE ((unsigned long)(THREAD_SIZE / 8))
 #endif
 #define REC_NUM_DEFAULT ((THREAD_SIZE / REC_STACK_SIZE) * 2)
 
-- 
2.37.1.359.gd136c6c3e2-goog


Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F52F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:16 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id a22-20020ac86116000000b002a1463f30ddso41611620qtm.17
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YEmwi7Tj0kCjh6V7g9aN0YraW8uzMWFmrARhRhvny3I=;
        b=RPBIg95u6Anq/SGueX445eP7TczY5dK74ouUzISfoUl7PMfpwk74LbgNA84ioOq7dL
         dbrOusRGKsifFAvO9rS2ey3c/4djphfaL5Fb5kQah4ToMLID/Cp/fKirCeW8kYuyXo+r
         9NX6Ee9afYRreiLl9ZFEIwwz0FbdfWn12xI/OlSaLrQgDq41Bz9B2G6nNn3c4N9TViW/
         GauEsd0xyhfJmGttXPEzz4bzipacXmT3rGcqGu1ISsEhm/mZHct0RC0jj7FSMBvsw8aQ
         mJA6JXxA2XsrHwfm3L0lp2YCKamjDcr7v2SZ6Zmsdt4uudq71AwIac24meZBC/BC0CPI
         YJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YEmwi7Tj0kCjh6V7g9aN0YraW8uzMWFmrARhRhvny3I=;
        b=Ffl39WrBGjeO9MGcaRqvDXtOWBy3devigq8I04Gjg2HSqz/xTtzalqTff4J4M3t/Pm
         s3I+n1nsTLsuHNNoMyo2ddIXUoxZytbNBK3Eiq0e6yjQyOwZkOxosQZsukEZ5ftp0qIp
         blg2INmwRXjDjaZi2dC3fNm4gHyr9VHrAiE6Oa38y17m1O+KFEjwVjQUvuNFBO6szTCT
         jPYag2mL3uZVFyx1rrwWcywS8XSleqJx4FMeMpvR1gwi9oLeYlLNOm2UyT7KlDVhYPlz
         Yqg7gG7EsUFB+n+N8mTg/dEeywx+y9M/BzUs/ar1F/JVlwbzv0ifQw1xx+Vp9tmRey4B
         jm9Q==
X-Gm-Message-State: AOAM533tm5F1rAAmePEqRU5CmUBdt1hPOcOVqiginMdPp7FLSzW6caMb
	VI2UGFrS6NScgNijorAXwzktFCJ7wTBdgX/oo7M=
X-Google-Smtp-Source: ABdhPJwAvYOSR2O8xm1EsycpD3M3UheO+Uw5/QhtUMB9XjozM/U8NcKbCquOrf1ej0cyOrQhl25lUCvoJNBOPjt58R4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1324:: with SMTP id
 c4mr43709qvv.61.1631317274899; Fri, 10 Sep 2021 16:41:14 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:47 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-11-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 10/10] vmlinux.lds.h: remove old check for GCC 4.9
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Now that GCC 5.1 is the minimally supported version of GCC, we can
effectively revert

commit 85c2ce9104eb ("sched, vmlinux.lds: Increase STRUCT_ALIGNMENT to
64 bytes for GCC-4.9")

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/asm-generic/vmlinux.lds.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index aa50bf2959fe..f2984af2b85b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -116,11 +116,7 @@
  * GCC 4.5 and later have a 32 bytes section alignment for structures.
  * Except GCC 4.9, that feels the need to align on 64 bytes.
  */
-#if __GNUC__ == 4 && __GNUC_MINOR__ == 9
-#define STRUCT_ALIGNMENT 64
-#else
 #define STRUCT_ALIGNMENT 32
-#endif
 #define STRUCT_ALIGN() . = ALIGN(STRUCT_ALIGNMENT)
 
 /*
-- 
2.33.0.309.g3052b89438-goog


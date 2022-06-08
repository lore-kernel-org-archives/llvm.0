Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F37B
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 00:14:52 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id bo5so16914455pfb.4
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=45epDQdJCBp4DgsIx1Sz2CxwS+YHltdpTyZ3wnT8hgs=;
        b=aQTromRtl9Y8U0lSwdvw9JG/L6+ooOtEs95fFlo72XqRmwp+oPMHpnTAvjNmGlpzcP
         P6SsxkAWmuw0sO2drXqm1qW6y86edJ8FtkvwTqyy4Z7F6OskExf3akYJDxmxgb5UAgEV
         8bnEHiAjLg/Jxwg5mj4zvzCh5ZXxVmBgxmlJ12LeG4M6EzrOJ8uGq1Rw/fzsJc4GBCWO
         PMxIEj7Iii+JdU2tsKoIb/+EKDVglzEsSFNuA4D0YpNmwKdz2cUIzUAlhCMEtwzPCm4L
         qaUeh1GXO75cY11pQH5OhdAedvysyZBHTpwZ9xYnLGd0pEetd+sadM8v5NNfj9ghO8in
         FiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=45epDQdJCBp4DgsIx1Sz2CxwS+YHltdpTyZ3wnT8hgs=;
        b=pziiFPXCnn5+Axn7mjKiRJXlwfEi2i/TDZcywz+gLOBKFyWAhIEwe8HQeen2xoE+Jk
         w11Ws8lVbaZjSyju31bcmNBt3goZGvqIC4sfp+RyKDQBTTMhQxSIACW7pQa0pEJFf+c4
         lOz2SZnDuNczlcOSdi4yxNSp4EbTeZ/N08Ahd1U0EWinnL7bnQiqmQ/9QSiNTP5yGXOK
         Dk/Gq5bbqWJVqIqsYjK9CzUyv4uy2U6UTsJQD1LsIYDL6KlXwu2r5M2J3lM+m/6giIhW
         k99eNtN5AsRDnFMP5yLwhz80bq6TzMi/d4GjJisCr7Hubdmcz/pNFjnvhGOD9u+dC8fL
         qQjQ==
X-Gm-Message-State: AOAM533ca+m58SIZOjCmf1AAX6XD6ORIz7+KSgZV47TqXYpxG4Cqrasm
	OEvR+Rv0u/WwwGCW5LEQ1Yo=
X-Google-Smtp-Source: ABdhPJyp28p2GDv7dkrNLXwv8Yj9hsL5KfMbOVCvI7otC6p6OS3I+JYKTxX9fdbZfv/y1by8dd43Kw==
X-Received: by 2002:a63:6b41:0:b0:3fe:22d6:e6aa with SMTP id g62-20020a636b41000000b003fe22d6e6aamr2305774pgc.249.1654647291916;
        Tue, 07 Jun 2022 17:14:51 -0700 (PDT)
Received: from penguin.lxd ([2620:0:1000:2514:216:3eff:fe31:a1ca])
        by smtp.googlemail.com with ESMTPSA id t1-20020a63f341000000b003fc4cc19414sm13458821pgj.45.2022.06.07.17.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:14:51 -0700 (PDT)
From: Justin Stitt <jstitt007@gmail.com>
To: ndesaulniers@google.com,
	akpm@linux-foundation.org
Cc: jstitt007@gmail.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	trix@redhat.com
Subject: [PATCH v2] include/uapi/linux/swab.h: move explicit cast outside ternary
Date: Tue,  7 Jun 2022 17:14:22 -0700
Message-Id: <20220608001422.26383-1-jstitt007@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com>
References: <CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A cast inside __builtin_constant_p doesn't do anything since it should evaluate
as constant at compile time irrespective of this cast. Instead, I moved this
cast outside the ternary to ensure the return type is as expected.

For instance, if __HAVE_BUILTIN_BSWAP16__ was not defined then __swab16 is
actually returning an `int` not a `u16` due to integer promotion as described
by Nick in this thread. This has repercussions when building with clang
-Wformat. This fix should solve many of these warnings.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <jstitt007@gmail.com>
---
 include/uapi/linux/swab.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index f6be3f2e6fee..ab5a1283800c 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -99,10 +99,10 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
  * @x: value to byteswap
  */
 #ifdef __HAVE_BUILTIN_BSWAP16__
-#define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
+#define __swab16(x) (__u16)__builtin_bswap16(x)
 #else
 #define __swab16(x)				\
-	(__u16)(__builtin_constant_p((__u16)(x)) ?	\
+	(__u16)(__builtin_constant_p(x) ?	\
 	___constant_swab16(x) :			\
 	__fswab16(x))
 #endif
@@ -112,10 +112,10 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
  * @x: value to byteswap
  */
 #ifdef __HAVE_BUILTIN_BSWAP32__
-#define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
+#define __swab32(x) (__u32)__builtin_bswap32(x)
 #else
 #define __swab32(x)				\
-	(__builtin_constant_p((__u32)(x)) ?	\
+	(__u32)(__builtin_constant_p(x) ?	\
 	___constant_swab32(x) :			\
 	__fswab32(x))
 #endif
@@ -125,10 +125,10 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
  * @x: value to byteswap
  */
 #ifdef __HAVE_BUILTIN_BSWAP64__
-#define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
+#define __swab64(x) (__u64)__builtin_bswap64(x)
 #else
 #define __swab64(x)				\
-	(__builtin_constant_p((__u64)(x)) ?	\
+	(__u64)(__builtin_constant_p(x) ?	\
 	___constant_swab64(x) :			\
 	__fswab64(x))
 #endif
-- 
2.30.2


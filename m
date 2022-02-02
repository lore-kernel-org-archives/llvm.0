Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8112F25
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 10:21:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b13so41105742edn.0
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=onRlZdRbDosaab/y/zUC++ZMX5giuurTyAahBOEwPR8=;
        b=Iw8mIF0IhzTswuIYzJcfjySaSEWJKOjDnQp43YD102crOmlk6ox48nP108mNAPQatc
         scZPiFCncu7zFYS/sGdDAV32PuAL/d0WMFsnJKi/7/U/vBTfLXpKjIYfJys+khnY66Fn
         taN0nCKP4/pAqVCuAHztjDePFlX0QmtWfoQ0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=onRlZdRbDosaab/y/zUC++ZMX5giuurTyAahBOEwPR8=;
        b=0axmEzhTeERHwwJRqmZIM4SKHqumJB5VMnp9hoK7vrQctDGiOaYW44sl/lvovfnVBG
         C4W03caqSd80RmKgxdvds/HI1kFhQLCkgrzknm5Hu6xOuBjEvR4ldxgzcaKx4Fy0Hn4A
         gPSIeiNPZfY3vdLJfXJDrR0IYhRzv5ViGPnlAuKD473vORUIxehwp9TIrUxdzitoXHUb
         TRELO11s0AuxNqp+65rDKi2zcUrD2Ua6k5WMab/0B03hq5CXmHGY2hBhBuHakA0tB3Qe
         cOf5ahseXK+3v7Gdq9SWvWcXiL3oVDU+yhVYgYAOAsG9ruqxC9bEjJu1kUR6ez/3X4gt
         5R2A==
X-Gm-Message-State: AOAM530TQPmT9/dyRDyMsWfPcvcjgb3GN6ow0qy57KHS2NhIpEiHKwn+
	oH/J3p2u9ElSm2GpBY2bycn3EQ==
X-Google-Smtp-Source: ABdhPJx+fpprtlVWRfOIbm22oor83E+wyYwA4ey03sqFiVnjRuxsTVTcpecmQmC5c/zbGMz6xVJlmw==
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr29049244edd.355.1643797310747;
        Wed, 02 Feb 2022 02:21:50 -0800 (PST)
Received: from localhost.localdomain ([80.208.64.233])
        by smtp.gmail.com with ESMTPSA id v2sm15277559ejb.114.2022.02.02.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 02:21:50 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] include: drop pointless __compiler_offsetof indirection
Date: Wed,  2 Feb 2022 11:21:47 +0100
Message-Id: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(1) compiler_types.h is unconditionally included via an -include
flag (see scripts/Makefile.lib), and it defines __compiler_offsetof
unconditionally. So testing for definedness of __compiler_offsetof is
mostly pointless.

(2) Every relevant compiler provides __builtin_offsetof (even sparse
has had that for 14 years), and if for whatever reason one would end
up picking up the poor man's fallback definition (C file compiler with
completely custom CFLAGS?), newer clang versions won't treat the
result as an Integer Constant Expression, so if used in place where
such is required (static initializer or static_assert), one would
get errors like

t.c:11:16: error: static_assert expression is not an integral constant expression
t.c:11:16: note: cast that performs the conversions of a reinterpret_cast is not allowed in a constant expression
t.c:4:33: note: expanded from macro 'offsetof'
#define offsetof(TYPE, MEMBER)  ((size_t)&((TYPE *)0)->MEMBER)

So just define offsetof unconditionally and directly in terms of
__builtin_offsetof.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/linux/compiler_types.h | 2 --
 include/linux/stddef.h         | 6 +-----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 3c1795fdb568..83ee7f7ada5d 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -137,8 +137,6 @@ struct ftrace_likely_data {
  */
 #define __naked			__attribute__((__naked__)) notrace
 
-#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
-
 /*
  * Prefer gnu_inline, so that extern inline functions do not emit an
  * externally visible function. This makes extern inline behave as per gnu89
diff --git a/include/linux/stddef.h b/include/linux/stddef.h
index ca507bd5f808..929d67710cc5 100644
--- a/include/linux/stddef.h
+++ b/include/linux/stddef.h
@@ -13,11 +13,7 @@ enum {
 };
 
 #undef offsetof
-#ifdef __compiler_offsetof
-#define offsetof(TYPE, MEMBER)	__compiler_offsetof(TYPE, MEMBER)
-#else
-#define offsetof(TYPE, MEMBER)	((size_t)&((TYPE *)0)->MEMBER)
-#endif
+#define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
 
 /**
  * sizeof_field() - Report the size of a struct field in bytes
-- 
2.31.1


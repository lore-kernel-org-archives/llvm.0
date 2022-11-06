Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994023A9
	for <llvm@lists.linux.dev>; Sun,  6 Nov 2022 09:51:29 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id b29so8123059pfp.13
        for <llvm@lists.linux.dev>; Sun, 06 Nov 2022 01:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypcKLldwiqaDsOlKIEGYcVxJUId8HFUjb6S7/qxsdjE=;
        b=QBgr9zaTfSggETOEfREZkmAC9yEJR6EOPOcX9uReV/JQPsZ/IU1xIcz14lf13MYlNJ
         PfwH/wZiLZ5HW/VSUBBAnIoxDaFNoBfpgHqP0OVPOwkagdtbatdoSACMxEfkwNSKPJJa
         +xD8mX/j+P4RRrKXr/QJ890acISwlsaHC5764DhakcUjQq7x97TjCgS78/quvz1p6KQo
         HgQj+z0vW2mini8Xj7P4O+0NAk9EQpcan1J+VKPTPWs/rNorAxtHQClBp01tB0ztr1+w
         ts2D7OIpGVyaIsjN11sEzKqqhHOl41ldAWwnqa2GlIlGUjMuTJJLiXpNwcW5VwhZhura
         Bg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypcKLldwiqaDsOlKIEGYcVxJUId8HFUjb6S7/qxsdjE=;
        b=0lDfsilCTEpKDUaVwqoMktkPs9kDyBdIAXEueeOtcz8zw1hzPWuVFSr7sepS5YP74a
         kmIFAVSXH7C7LFOVqsAVhai9Sm04sIXrCJytHhoIAF2Zl2XacmKYt6ID6CgVpmq6A6js
         t5LrvCl6hseQM64xDd2tnqoNyLxGiMxYQCHjbLTREaRUyq0WrsPHBceXL56E1NYln7hj
         njP63tH2P2JoCj72QP0w4r9WvZYmFRBuI/Y38wun7g9slgf2CI9SBT6KFEy3y8bD5/YR
         N5IWtOGxSuZIMuM6g7du3n0/dwNAZ3mBLoL7PgHv2DoS1BAjPUpPfWp8RgSiq0MFdj8+
         4SQQ==
X-Gm-Message-State: ACrzQf1S6vlVrMTyp6wbxmJQZQQTgbXSdso8K0+sTholsJLj+z9hWbkd
	DP9cpRHc4H2klXVz7VCAkOM=
X-Google-Smtp-Source: AMsMyM5acENCwMU2s5DQIuUVT25ILLLvRbnoiZTTYvvIARQltZcdlyGzSNJ5Qyqntyb70XpQQ8KKrQ==
X-Received: by 2002:a63:6bc5:0:b0:460:bd9a:64b8 with SMTP id g188-20020a636bc5000000b00460bd9a64b8mr39144875pgc.257.1667728288714;
        Sun, 06 Nov 2022 01:51:28 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id b5-20020aa79505000000b0056bfd4a2702sm2368677pfp.45.2022.11.06.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:51:28 -0800 (PST)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	llvm@lists.linux.dev,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Borislav Petkov <bp@suse.de>
Subject: [PATCH v1 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate constant expressions
Date: Sun,  6 Nov 2022 18:51:06 +0900
Message-Id: <20221106095106.849154-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC and clang offers the __builtin_clz(x) and __builtin_clzll(x)
functions which return the number of leading zero bits in
x. c.f. [1]. By a simple subtraction, we can derive below equivalences:

* For fls:
  Aside of the x = 0 special case, fls(x) is equivalent to
  BITS_PER_TYPE(x) - __builtin_clz(x).

* For fls64:
  Aside of the x = 0 special case, fls64(x) is equivalent to
  BITS_PER_TYPE(x) - __builtin_clzll(x). __builtin_clzll() takes an
  unsigned long long as argument. We choose this version because
  BITS_PER_LONG_LONG is defined as 64 bits for all architecture making
  this flavor the most portable one. A BUILD_BUG_ON() safety net is
  added.

When used on constant expressions, the compiler is only able to fold
the builtin version (c.f. [2]). However, for non constant expressions,
the kernel inline assembly results in better code for both GCC and
clang.

Use __builtin_constant_p() to select between the kernel's
fls()/fls64() __builtin_clz()/__builtin_clzll() depending on whether
the argument is constant or not.

While renaming fls64() to variable_fls64(), change the argument type
from __64 to u64 because we are not in an uapi header.

[1] Built-in Functions Provided by GCC:
https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html

[2] commit 146034fed6ee ("x86/asm/bitops: Use __builtin_ffs() to evaluate constant expressions")

CC: Borislav Petkov <bp@suse.de>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/x86/include/asm/bitops.h | 57 ++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index a31453d7686d..58fb2fc49760 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -333,18 +333,15 @@ static __always_inline int variable_ffs(int x)
  */
 #define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))
 
-/**
- * fls - find last set bit in word
- * @x: the word to search
- *
- * This is defined in a similar way as the libc and compiler builtin
- * ffs, but returns the position of the most significant set bit.
- *
- * fls(value) returns 0 if value is 0 or the position of the last
- * set bit if value is nonzero. The last (most significant) bit is
- * at position 32.
- */
-static __always_inline int fls(unsigned int x)
+static __always_inline int constant_fls(unsigned int x)
+{
+	if (!x)
+		return 0;
+
+	return BITS_PER_TYPE(x) - __builtin_clz(x);
+}
+
+static __always_inline int variable_fls(unsigned int x)
 {
 	int r;
 
@@ -375,18 +372,30 @@ static __always_inline int fls(unsigned int x)
 }
 
 /**
- * fls64 - find last set bit in a 64-bit word
+ * fls - find last set bit in word
  * @x: the word to search
  *
  * This is defined in a similar way as the libc and compiler builtin
- * ffsll, but returns the position of the most significant set bit.
+ * ffs, but returns the position of the most significant set bit.
  *
- * fls64(value) returns 0 if value is 0 or the position of the last
+ * fls(value) returns 0 if value is 0 or the position of the last
  * set bit if value is nonzero. The last (most significant) bit is
- * at position 64.
+ * at position 32.
  */
+#define fls(x) (__builtin_constant_p(x) ? constant_fls(x) : variable_fls(x))
+
 #ifdef CONFIG_X86_64
-static __always_inline int fls64(__u64 x)
+static __always_inline int constant_fls64(u64 x)
+{
+	BUILD_BUG_ON(sizeof(unsigned long long) != sizeof(x));
+
+	if (!x)
+		return 0;
+
+	return BITS_PER_TYPE(x) - __builtin_clzll(x);
+}
+
+static __always_inline int variable_fls64(u64 x)
 {
 	int bitpos = -1;
 	/*
@@ -399,6 +408,20 @@ static __always_inline int fls64(__u64 x)
 	    : "rm" (x));
 	return bitpos + 1;
 }
+
+/**
+ * fls64 - find last set bit in a 64-bit word
+ * @x: the word to search
+ *
+ * This is defined in a similar way as the libc and compiler builtin
+ * ffsll, but returns the position of the most significant set bit.
+ *
+ * fls64(value) returns 0 if value is 0 or the position of the last
+ * set bit if value is nonzero. The last (most significant) bit is
+ * at position 64.
+ */
+#define fls64(x) \
+	(__builtin_constant_p(x) ? constant_fls64(x) : variable_fls64(x))
 #else
 #include <asm-generic/bitops/fls64.h>
 #endif
-- 
2.37.4


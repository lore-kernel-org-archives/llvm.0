Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC322091
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eK6IW7i4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5e77a4a59eeso2737257b3.0
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702925092; x=1703529892; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=otZZ0TbH3O/9uh/WTuAjWwf68II/fAS101L08F2nen4=;
        b=eK6IW7i4oGfUM+WbYdV3Ghmgq/yoxHyqXwP+WyFdmeZT4Vu04g+Uvm2Bu7Iht0WxKn
         E6JYYY8Iy9Oj77cZBxiupEly+lPaVMY28Zh8nlztY3OKQBGchj26JHJIrxNxLTUzRwyo
         i4n1+U3U0RwtITiY7ARYEW2WoiUz3ARujth2EXL7cuwDAZOZalj4MzLKlZgxLQZbsqwE
         NZwI7j1MrMbT7vPLKwz9y/wXpDvBM9whX2TrsJv2UAwigGE32icR2ZT97H6FhSc76lan
         6RTosQoyRsmHOSVRecaVAK2uDGOoFFgdxw33TuJ21BsCoIKAFnxgylmA+pH8F98PSMgG
         nPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702925092; x=1703529892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otZZ0TbH3O/9uh/WTuAjWwf68II/fAS101L08F2nen4=;
        b=n2uyfyxbJThE4ROzz2GD7K6mHWYdWQ1YPpgccjwjRWwuYlL7hp7DJQOs4eDiGQ0BSl
         ZPiPlUL1J8S14KdDlsdGmj1c3qelROiIAo2JgQrJ0tXuwXVDBDU4tH+m8E9kcKzUhYGq
         k4ND3JZyaytHud9D7ZSLfz44Gvh2By1INQnv3t8QypL6XdoMNJDPFem6G/5TJ8PuTuWk
         X0GCivJFG8XeBXBt1SL/+kCc04jDe2fbM5uyyBLQfsTHQV0sUvkovnwQ+ujn7CU5XvQV
         Q0TWVng2v8RoSqdNZ+dupKidL+4Y6gF1KdKnmVbnx1sHCruyA++6dGCozDutE3qjnsel
         ovDw==
X-Gm-Message-State: AOJu0YzC0iZchmpfKhwxSFBx5RRpPv3Y9jyMfteBD1DltQEfnJggNBx0
	ufZXEocYumpu1tbAFS97HXGsj+xwN4wJ
X-Google-Smtp-Source: AGHT+IHzdlAv080D0kEhLad8Vbm8sguShMzLkHfNhIcwx0//4rTOgbUFe3INzcxZmfXd3x6uVUlDWwWl6dF5
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:690c:83:b0:5d5:6a4c:b0b3 with SMTP id
 be3-20020a05690c008300b005d56a4cb0b3mr2386137ywb.8.1702925092683; Mon, 18 Dec
 2023 10:44:52 -0800 (PST)
Date: Mon, 18 Dec 2023 18:44:47 +0000
In-Reply-To: <20231218-libstringheader-v3-0-500bd58f0f75@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231218-libstringheader-v3-0-500bd58f0f75@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702925089; l=5960;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=1zmqDeKrI4VGJQmHkQfCpOMar1eOZu561uUlu020PMg=; b=aIzg8QQKRJufy3r1aZ1mmlDEDn6a3LTdwAfet0aRj6YMycSQOJRraIUquQXmVDA5JL7zMT29f
 rJ/wSyFr1UNCMHEtmf5jE79LRfjmSb329FbLTMgoDySWVrtjjQPGcsW
X-Mailer: b4 0.12.3
Message-ID: <20231218-libstringheader-v3-1-500bd58f0f75@google.com>
Subject: [PATCH v3 1/2] kernel.h: removed REPEAT_BYTE from kernel.h
From: tanzirh@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This patch creates wordpart.h and includes it in asm/word-at-a-time.h
for the all architectures. WORD_AT_A_TIME_CONSTANTS depends on kernel.h
because of REPEAT_BYTE. Moving this to another header and including it
where necessary allows us to not include the bloated kernel.h. Making
this implicit dependancy on REPEAT_BYTE explicit allows for later
improvements in the lib/string.c inclusion list.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 arch/arm/include/asm/word-at-a-time.h     |  1 +
 arch/arm64/include/asm/word-at-a-time.h   |  1 +
 arch/powerpc/include/asm/word-at-a-time.h |  1 +
 arch/riscv/include/asm/word-at-a-time.h   |  1 +
 arch/s390/include/asm/word-at-a-time.h    |  1 +
 arch/sh/include/asm/word-at-a-time.h      |  2 ++
 arch/x86/include/asm/word-at-a-time.h     |  1 +
 fs/namei.c                                |  2 +-
 include/asm-generic/word-at-a-time.h      |  1 +
 include/linux/kernel.h                    |  7 -------
 include/linux/wordpart.h                  | 17 +++++++++++++++++
 11 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 352ab213520d..aea6bfe259f5 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -9,6 +9,7 @@
  * Heavily based on the x86 algorithm.
  */
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index f3b151ed0d7a..cf8c28a3bba9 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -10,6 +10,7 @@
 #ifndef __AARCH64EB__
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 30a12d208687..032a77d324e6 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -6,6 +6,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
 
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 7c086ac6ecd4..9b7ea4c1a616 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -10,6 +10,7 @@
 
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index 2579f1694b82..5af1d267b4d7 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
 
diff --git a/arch/sh/include/asm/word-at-a-time.h b/arch/sh/include/asm/word-at-a-time.h
index 4aa398455b94..3a11158f0143 100644
--- a/arch/sh/include/asm/word-at-a-time.h
+++ b/arch/sh/include/asm/word-at-a-time.h
@@ -5,6 +5,8 @@
 #ifdef CONFIG_CPU_BIG_ENDIAN
 # include <asm-generic/word-at-a-time.h>
 #else
+#include <linux/kernel.h>
+#include <linux/wordpart.h>
 /*
  * Little-endian version cribbed from x86.
  */
diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 46b4f1f7f354..c002c864a63e 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 /*
  * This is largely generic for little-endian machines, but the
diff --git a/fs/namei.c b/fs/namei.c
index 71c13b2990b4..03db8ca3f394 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -17,7 +17,7 @@
 
 #include <linux/init.h>
 #include <linux/export.h>
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/filelock.h>
diff --git a/include/asm-generic/word-at-a-time.h b/include/asm-generic/word-at-a-time.h
index 95a1d214108a..fc007fda0b2e 100644
--- a/include/asm-generic/word-at-a-time.h
+++ b/include/asm-generic/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <asm/byteorder.h>
 
 #ifdef __BIG_ENDIAN
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index d9ad21058eed..162660af5b7d 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -39,13 +39,6 @@
 
 #define STACK_MAGIC	0xdeadbeef
 
-/**
- * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
- * @x: value to repeat
- *
- * NOTE: @x is not checked for > 0xff; larger values produce odd results.
- */
-#define REPEAT_BYTE(x)	((~0ul / 0xff) * (x))
 
 /* generic data direction definitions */
 #define READ			0
diff --git a/include/linux/wordpart.h b/include/linux/wordpart.h
new file mode 100644
index 000000000000..6a5ed5d54ba2
--- /dev/null
+++ b/include/linux/wordpart.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Google LLC <tanzirh@google.com>
+ */
+
+#ifndef _LINUX_WORDPART_H
+#define _LINUX_WORDPART_H
+/**
+ * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
+ * @x: value to repeat
+ *
+ * NOTE: @x is not checked for > 0xff; larger values produce odd results.
+ */
+#define REPEAT_BYTE(x)	((~0ul / 0xff) * (x))
+
+#endif // _LINUX_WORDPART_H
+

-- 
2.43.0.472.g3155946c3a-goog


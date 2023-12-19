Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B8381A1
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="go1gGqJU"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbd59ddfd66so933521276.0
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 10:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703011685; x=1703616485; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbybSsV/bS+3WyIy5bQjflj1d8kB/aeheYO00KzfCc4=;
        b=go1gGqJUmRq+6WlPMMax2QK7Tt8XqhElaunw9hDbPhTKYrK6CZlROrDjl0UI+2gwDR
         GOgUWrr0HA/SNXzQoth2n80BQkSq9SbAVmavhqJAm/J2BP6QG6HjAnvNpd8cSDeYDcpo
         aC2X2k8oDfpbLaklbuUPGVS97Aj5/HHe4dwjx9HDv+udOqIpXP2tF0LnXRm2+a5WzwOX
         ZYfXXC/KOlvu7qyFRA6ccSNbhvUnWwwWfAfHnfuGrOzqLY53iDYMHBs6b6mDqfCkpSqb
         zjocW0+JqzfHoAlWjYXABP1RKFvs60gVE9GlJKIJImHyimJmJaM8UFY2OcDBQSa+zUeC
         yygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703011685; x=1703616485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbybSsV/bS+3WyIy5bQjflj1d8kB/aeheYO00KzfCc4=;
        b=uDHIrNNCvj46TPjZLayKQ6J09lUHeCVDnmRKqT+nN5/CJRo3qHkQtBhBL8bpOOqW/X
         BOtqEip3CeYl3ef8yYnDgIhRGVxeOtLBXsVvt6bfhT6SSRavD5D/KSuxzTIr64mJkQcq
         VpeiX4eLnNoN6TGcHVklyMRmKzAsUyC3TH0RqBuSMJg3c5oL6wpe9jsqDBjTCokPlZfA
         +7jBNrByrlxt9DuJIcq3fbRVKYkzuCi4eApG4vE+qQvNPC/JupNy47OlAGG6agqOurqA
         MKJqAJWRkfv/nLM7GXZq2jup6q+wE2FD6vbixAS+dv8DbKToTakBMC6i4WoWes4iPa7Y
         SJHw==
X-Gm-Message-State: AOJu0Yx09j9vJmrCeo8ZhlAWO9zC2JfOc6bxH1h3tUpvtww1lNvsemKH
	gU1dHY2MbmeGxpqZZ3IrZKVdGupAW6oJm8Wk03w=
X-Google-Smtp-Source: AGHT+IHOG8gufTHHonMi2Xc/wBkaLbrjdmS+i6td2TKm2vZG7Cm8N7oobhSCfLeoBzlJOo2TyvRazqeUhxV0
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:6902:f04:b0:dbc:decd:3c7d with SMTP id
 et4-20020a0569020f0400b00dbcdecd3c7dmr557649ybb.6.1703011685613; Tue, 19 Dec
 2023 10:48:05 -0800 (PST)
Date: Tue, 19 Dec 2023 18:47:53 +0000
In-Reply-To: <20231219-libstringheader-v5-0-206d4afd309a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231219-libstringheader-v5-0-206d4afd309a@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703011682; l=6067;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=2//M5tR0AMdNBe14AksDgWdDSCB4lFtXwH0yxJGuKqc=; b=0wmsNcdXgytnPMUQvnsztAk4CPsOO6DiKEvruiUTRlJ1Ec/U96tpLNk6uO1ykcSCazR27+OH1
 V7GtQSZN5kdB9PuFsG3n3TZ5PPGH978S7Q18bokVz9NK9uJm3d82VHu
X-Mailer: b4 0.12.4
Message-ID: <20231219-libstringheader-v5-1-206d4afd309a@google.com>
Subject: [PATCH v5 1/2] kernel.h: removed REPEAT_BYTE from kernel.h
From: Tanzir Hasan <tanzirh@google.com>
To: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This patch creates wordpart.h and includes it in asm/word-at-a-time.h
for the all architectures. WORD_AT_A_TIME_CONSTANTS depends on kernel.h
because of REPEAT_BYTE. Moving this to another header and including it
where necessary allows us to not include the bloated kernel.h. Making
this implicit dependency on REPEAT_BYTE explicit allows for later
improvements in the lib/string.c inclusion list.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 arch/arm/include/asm/word-at-a-time.h     |  2 +-
 arch/arm64/include/asm/word-at-a-time.h   |  2 +-
 arch/powerpc/include/asm/word-at-a-time.h |  2 +-
 arch/riscv/include/asm/word-at-a-time.h   |  2 +-
 arch/s390/include/asm/word-at-a-time.h    |  2 +-
 arch/sh/include/asm/word-at-a-time.h      |  1 +
 arch/x86/include/asm/word-at-a-time.h     |  1 +
 fs/namei.c                                |  2 +-
 include/asm-generic/word-at-a-time.h      |  2 +-
 include/linux/kernel.h                    |  7 -------
 include/linux/wordpart.h                  | 14 ++++++++++++++
 11 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 352ab213520d..e08304996121 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -8,7 +8,7 @@
  * Little-endian word-at-a-time zero byte handling.
  * Heavily based on the x86 algorithm.
  */
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index f3b151ed0d7a..bd8cfbc2b9c3 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -9,7 +9,7 @@
 
 #ifndef __AARCH64EB__
 
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 30a12d208687..26e4f718a674 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -5,7 +5,7 @@
  * Word-at-a-time interfaces for PowerPC.
  */
 
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
 
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 7c086ac6ecd4..94bec2f7ba53 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -9,7 +9,7 @@
 #define _ASM_RISCV_WORD_AT_A_TIME_H
 
 
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index 2579f1694b82..55e66d9371d6 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_WORD_AT_A_TIME_H
 #define _ASM_WORD_AT_A_TIME_H
 
-#include <linux/kernel.h>
+#include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
 
diff --git a/arch/sh/include/asm/word-at-a-time.h b/arch/sh/include/asm/word-at-a-time.h
index 4aa398455b94..663658cea69a 100644
--- a/arch/sh/include/asm/word-at-a-time.h
+++ b/arch/sh/include/asm/word-at-a-time.h
@@ -5,6 +5,7 @@
 #ifdef CONFIG_CPU_BIG_ENDIAN
 # include <asm-generic/word-at-a-time.h>
 #else
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
index 95a1d214108a..6f088b2b0b03 100644
--- a/include/asm-generic/word-at-a-time.h
+++ b/include/asm-generic/word-at-a-time.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_WORD_AT_A_TIME_H
 #define _ASM_WORD_AT_A_TIME_H
 
-#include <linux/kernel.h>
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
index 000000000000..43c1a8ae5152
--- /dev/null
+++ b/include/linux/wordpart.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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


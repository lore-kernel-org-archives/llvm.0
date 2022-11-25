Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418CA7E
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 02:33:59 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q1so2813212pgl.11
        for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 18:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yAoT1kLjr2RjOiYLwcVMKA0GhtRYKf2X90lTYA9Hn4=;
        b=T/qdGX3ipHc7MMkeq8ke6n/7Kx1Mu93QbEcxMleGD7kJGuP0VXCtHwETV4Z+K9pSOk
         KbAU/aTvuEZfcAhyhtq5/G7Xe6Egm+NBcRRXpHcaPOcCvERwy0p0TdVMT3b86T4M4qTY
         UbU2XcbRqpGpE+2omjBcyT7B8iONaRy365xNp++rW8bNWpr9Yb/t7PL6iDOlNyQ0cWz0
         /mlyCSXYUhKEV37gn3VKtVq8oQDKdAxT7zZeVN2nPoSm1g6ICWSowekz0heRzPrOh1n5
         HH6biCVATxCQHWVQ5VACH20U3Rn6S32lHun0tnsB//x/zdIP0ciqXAG+/Qd3p9OPd52o
         kMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yAoT1kLjr2RjOiYLwcVMKA0GhtRYKf2X90lTYA9Hn4=;
        b=VOZ7noNo28UFxqtPZXlmCvcZrTgi5z5/KRwu/oNEsq+1xgdFzgbR4sV2kZLVmXTxEA
         /R9bxwSVAEEe1M31ub4KAqI9n/xlh9yzunwjZoGI9kdjj91GevgclKAiHAcbr9cTNVqK
         IrBgiE1Ju4+Wp0x+fSuuuvhubiGh02UM5tYnVh68bEk0RYVKMSkPaR1kGd9jdxx0dNtf
         TZ5Y7f4+GZytJ6JPIk9cEz8NmDZuriiIoBVIEB9Hp3iURxBuOsrL4bTBzrdkfyS0GZmK
         52LM+JkRRZ26RIbn9au6c3WQcO4TuJiCnETmeu8YaLzPBYXkAXugFe+HMYgUbP76kym3
         tdwQ==
X-Gm-Message-State: ANoB5plseOqe8o/Qz2UDQ5QdyqRfCGWXu3NXAD6bgmh3raAAAvDx7aAB
	kYOb36mMAn6yxXSV+mVKkyU=
X-Google-Smtp-Source: AA0mqf5iZlH730FIMbWjNM/VqjZdwc+5RwTIk+VuF/xjGNEX4C2l2JbUHDmFaFALAqPmj12m336MKQ==
X-Received: by 2002:a05:6a00:d59:b0:56e:5bcd:d025 with SMTP id n25-20020a056a000d5900b0056e5bcdd025mr16409954pfv.65.1669343638652;
        Thu, 24 Nov 2022 18:33:58 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id m127-20020a625885000000b0056bc5ad4862sm1893822pfb.28.2022.11.24.18.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 18:33:58 -0800 (PST)
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
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Borislav Petkov <bp@suse.de>
Subject: [PATCH v2 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate constant expressions
Date: Fri, 25 Nov 2022 11:33:30 +0900
Message-Id: <20221125023330.195581-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125023330.195581-1-mailhol.vincent@wanadoo.fr>
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221125023330.195581-1-mailhol.vincent@wanadoo.fr>
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

* For fls64: Aside of the x = 0 special case, fls64(x) is equivalent
  to BITS_PER_TYPE(x) - __builtin_clzll(x).
  __builtin_clzll() takes an unsigned long long as argument instead of
  a u64 which is fine because those two types are equivalent. Regardless,
  add a BUILD_BUG_ON() safety net is added to formally assert that u64
  and unsigned long long are the same.

When used on constant expressions, the compiler is only able to fold
the builtin version (c.f. [2]). However, for non constant expressions,
the kernel inline assembly results in better code for both GCC and
clang.

Use __builtin_constant_p() to select between the kernel's
fls()/fls64() and __builtin_clz()/__builtin_clzll() depending on
whether the argument is constant or not.

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
 arch/x86/include/asm/bitops.h | 56 ++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index a31453d7686d..d10e774af343 100644
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
 
@@ -375,18 +372,29 @@ static __always_inline int fls(unsigned int x)
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
+	if (!x)
+		return 0;
+
+	BUILD_BUG_ON(!__same_type(x, unsigned long long));
+	return BITS_PER_TYPE(x) - __builtin_clzll(x);
+}
+
+static __always_inline int variable_fls64(u64 x)
 {
 	int bitpos = -1;
 	/*
@@ -399,6 +407,20 @@ static __always_inline int fls64(__u64 x)
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


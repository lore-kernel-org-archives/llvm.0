Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDD28F2
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 14:26:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id p12so15106087pfn.0
        for <llvm@lists.linux.dev>; Tue, 10 May 2022 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+wxOYG9ghH/9a5UJTVaKlcRNHbqfracDkNPfmduVwBo=;
        b=k9+PjtptzZEnQKChCLzYZbzQWE1mIn4uv/pIHXhTfxtWMVh6eoOGw/gxJ18YqLkHgF
         OcXq0HcCsygqny/0P5I3xfRlLYnC/4i1d1MdP4jQ0vEvkcxdDC5MpVNhl95F7ySjfy++
         fLE85uau3pjLVWJphwgCt99DKyeOVnAFy6GKh9mjGuCTONQWTu12tHjPIXMl7xGxBAhk
         eXPIDnyz5ieePPSibI/A7Froy8CR3JKh35KviAiQ2gOHcyQICY4x01MUFHy/lUZEMyLi
         tlcuOx6E23i7gvDFTKtngwvPvWakQp29Rhr3LB+zZxrksse5AKghVr26S1IS5y73jY4U
         FVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+wxOYG9ghH/9a5UJTVaKlcRNHbqfracDkNPfmduVwBo=;
        b=lXAHci4l/OwG0usfy0k9DqBQLmpVJQvF5bcwzKrrllNCasWyqsvaEYH8cc+QhgUVTD
         1h3WZkuoqGAbop2MDJ1XUWhYJOyZepDBV0eu7v/pTtaKEDYSs+fljExzG39kVOW5arH/
         XoN7cP1Uc0OEOLfZRyKgC66iMRqvueaW06y+S2s/a9zGbGL7JlUklETxrjTi/k1g3xio
         2hAd+H0ZcT4T+rYFKm+BwyL91X7oae4kOvxI7/JFcqt4+gM+nc2vmYRRlwpvDN4NFUxL
         MtDYrAnRPvR8VApQIiRRsdr67tLc9fWeuxMHgHWpsqEOBixhg8k6WfcAe3fGNsndpLmU
         kPKg==
X-Gm-Message-State: AOAM530Mef4WujYlPcAFpfGxVJJ8ncVfzM0uCZ89H1BLloGJ4LF/mSap
	RPfoGxXpVQoOrSkmPVHj9vI=
X-Google-Smtp-Source: ABdhPJwxuyIepWDfdgGxfWUw3KHfu67KyVM092PCotq6edwFAS2ONUMYFyz/fJPf5o8NsvRd8efdTA==
X-Received: by 2002:a05:6a00:ac1:b0:4f1:29e4:b3a1 with SMTP id c1-20020a056a000ac100b004f129e4b3a1mr20596239pfl.63.1652192790629;
        Tue, 10 May 2022 07:26:30 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709028eca00b0015ea8b4b8f3sm2057568plo.263.2022.05.10.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:26:30 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant expressions
Date: Tue, 10 May 2022 23:25:49 +0900
Message-Id: <20220510142550.1686866-2-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr>
References: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For x86_64, the current ffs() implementation does not produce
optimized code when called with a constant expression. On the
contrary, the __builtin_ffs() function of both GCC and clang is able
to simplify the expression into a single instruction.

* Example *

Let's consider two dummy functions foo() and bar() as below:

| #include <linux/bitops.h>
| #define CONST 0x01000000
|
| unsigned int foo(void)
| {
| 	return ffs(CONST);
| }
|
| unsigned int bar(void)
| {
| 	return __builtin_ffs(CONST);
| }

GCC would produce below assembly code:

| 0000000000000000 <foo>:
|    0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
|    5:	0f bc c7             	bsf    %edi,%eax
|    8:	83 c0 01             	add    $0x1,%eax
|    b:	c3                   	ret
|    c:	0f 1f 40 00          	nopl   0x0(%rax)
|
| 0000000000000010 <bar>:
|   10:	b8 19 00 00 00       	mov    $0x19,%eax
|   15:	c3                   	ret

And clang would produce:

| 0000000000000000 <foo>:
|    0:	55                   	push   %rbp
|    1:	48 89 e5             	mov    %rsp,%rbp
|    4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
|    9:	0f bc 05 00 00 00 00 	bsf    0x0(%rip),%eax        # 10 <foo+0x10>
|   10:	ff c0                	inc    %eax
|   12:	5d                   	pop    %rbp
|   13:	c3                   	ret
|   14:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
|   1b:	00 00 00
|   1e:	66 90                	xchg   %ax,%ax
|
| 0000000000000020 <bar>:
|   20:	55                   	push   %rbp
|   21:	48 89 e5             	mov    %rsp,%rbp
|   24:	b8 19 00 00 00       	mov    $0x19,%eax
|   29:	5d                   	pop    %rbp
|   2a:	c3                   	ret

For both examples, we clearly see the benefit of using __builtin_ffs()
instead of the kernel's asm implementation for constant expressions.

However, for non constant expressions, the ffs() asm version of the
kernel remains better for x86_64 because, contrary to GCC, it doesn't
emit the CMOV assembly instruction, c.f. [1] (noticeably, clang is
able optimize out the CMOV call).

This patch uses the __builtin_constant_p() to select between the
kernel's ffs() and the __builtin_ffs() depending on whether the
argument is constant or not.


As a side benefit, this patch also removes below -Wshadow warning:

| ./arch/x86/include/asm/bitops.h:283:28: warning: declaration of 'ffs' shadows a built-in function [-Wshadow]
|   283 | static __always_inline int ffs(int x)

[1] commit ca3d30cc02f7 ("x86_64, asm: Optimise fls(), ffs() and fls64()")
http://lkml.kernel.org/r/20111213145654.14362.39868.stgit@warthog.procyon.org.uk


Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/x86/include/asm/bitops.h | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index a288ecd230ab..535a7a358c14 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -269,18 +269,7 @@ static __always_inline unsigned long __fls(unsigned long word)
 #undef ADDR
 
 #ifdef __KERNEL__
-/**
- * ffs - find first set bit in word
- * @x: the word to search
- *
- * This is defined the same way as the libc and compiler builtin ffs
- * routines, therefore differs in spirit from the other bitops.
- *
- * ffs(value) returns 0 if value is 0 or the position of the first
- * set bit if value is nonzero. The first (least significant) bit
- * is at position 1.
- */
-static __always_inline int ffs(int x)
+static __always_inline int __ffs_asm(int x)
 {
 	int r;
 
@@ -310,6 +299,22 @@ static __always_inline int ffs(int x)
 	return r + 1;
 }
 
+/**
+ * ffs - find first set bit in word
+ * @x: the word to search
+ *
+ * This is defined the same way as the libc and compiler builtin ffs
+ * routines, therefore differs in spirit from the other bitops.
+ *
+ * ffs(value) returns 0 if value is 0 or the position of the first
+ * set bit if value is nonzero. The first (least significant) bit
+ * is at position 1.
+ */
+#define ffs(x)					\
+	 (__builtin_constant_p(x) ?		\
+	  __builtin_ffs(x) :			\
+	  __ffs_asm(x))
+
 /**
  * fls - find last set bit in word
  * @x: the word to search
-- 
2.35.1


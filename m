Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4C7A
	for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 07:27:17 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so4811438pjb.2
        for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fb9zkrt/XV4sp0+cay1+ZeMzm2Ju2agtyJo6blkhfIE=;
        b=Oof7xBrLvI4I+9r5EQd2eKjXJFmHGV6UEL8Bft6p3Zywy01Wd/A90aL2f7Dg9MybEx
         XIelNpnTJLRzaFPSVk6wfBJGQ5RFC3HacOC3AMwqA2yE2MsqDMwBeRgqW9/gazIU+rQI
         84vPzdG2IWA0Su6c5cKykVgMgvQ8HUjg0Q8DZSaw7tKlYhyT0A1+Z5bLwa7elbyhIv6C
         fdow6VDLy7zJdTKQLynJjcsL7H4ShBwd2B2bwpz7cyykrZ95sA3Ug/NsX7T7PduNtFG0
         Iurs9DylXbLLcOqi5mKWbCCsFkrj/w5gb0ZO8gtQPMsI0AfXzHqilF3dFtZ7OOAhjnt4
         vVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Fb9zkrt/XV4sp0+cay1+ZeMzm2Ju2agtyJo6blkhfIE=;
        b=iMkZXTnJwllDghN654UskhV2GIccNW0bAPC19pxHUpl6v/1HIpSkq76TI2YD5szUgJ
         gIUA4OY/d0yHXD4VRIBVIlfkfyGOtfhRb+U6P8FHEhao5eJ693pUFpkUzeHkvN61o1lF
         m+Z0GO8emDjJP1o6g5odnMfovIfbqhMMEu7sQGQDpiUh8PyAk5B4pae3641at+rp93Nq
         OmwXOGjO8i2TXWca1BaTOidEVxKxp4GOaEYN7r1c2lb9Sptu03fgJ5/RMJMhL/A3UYkw
         jidWrNW9SNNe+6T2nXymC4RNwECmVxH2FQqFxDgWipZbLceheKE62AB+gugUPo4KSkO2
         EEBw==
X-Gm-Message-State: AJIora+VFOCAukFqAgWQ9WfVKKBfAj/cZaSfsOO0+3uJ0ZTsGmf4fw5p
	xNIBELmsfLYmj5xrTaRBF0U=
X-Google-Smtp-Source: AGRyM1vSeFSLb7OKnM3LwhzWf647HhR6uAtIrCN4/vvCx3q3Hxv98YFfE4E6IOMAbyfmZlMsp3z1og==
X-Received: by 2002:a17:90b:4a0c:b0:1ec:d90c:601d with SMTP id kk12-20020a17090b4a0c00b001ecd90c601dmr3217617pjb.154.1656142037274;
        Sat, 25 Jun 2022 00:27:17 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090a5b0c00b001e29ddf9f4fsm2973821pji.3.2022.06.25.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 00:27:16 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [RESEND PATCH v4 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant expressions
Date: Sat, 25 Jun 2022 16:26:44 +0900
Message-Id: <20220625072645.251828-2-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625072645.251828-1-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220625072645.251828-1-mailhol.vincent@wanadoo.fr>
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
|    0:	ba 00 00 00 01       	mov    $0x1000000,%edx
|    5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
|    a:	0f bc c2             	bsf    %edx,%eax
|    d:	83 c0 01             	add    $0x1,%eax
|   10:	c3                   	ret
<Instructions after ret and before next function were redacted>
|
| 0000000000000020 <bar>:
|   20:	b8 19 00 00 00       	mov    $0x19,%eax
|   25:	c3                   	ret

And clang would produce:

| 0000000000000000 <foo>:
|    0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
|    5:	0f bc 05 00 00 00 00 	bsf    0x0(%rip),%eax        # c <foo+0xc>
|    c:	83 c0 01             	add    $0x1,%eax
|    f:	c3                   	ret
|
| 0000000000000010 <bar>:
|   10:	b8 19 00 00 00       	mov    $0x19,%eax
|   15:	c3                   	ret

In both examples, we clearly see the benefit of using __builtin_ffs()
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

** Statistics **

On a allyesconfig, before applying this patch...:

| $ objdump -d vmlinux.o | grep bsf | wc -l
| 1081

...and after:

| $ objdump -d vmlinux.o | grep bsf | wc -l
| 792

So, roughly 26.7% of the calls to ffs() were using constant
expressions and could be optimized out.

(tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)

[1] commit ca3d30cc02f7 ("x86_64, asm: Optimise fls(), ffs() and fls64()")
http://lkml.kernel.org/r/20111213145654.14362.39868.stgit@warthog.procyon.org.uk

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/x86/include/asm/bitops.h | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index a288ecd230ab..6ed979547086 100644
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
+static __always_inline int variable_ffs(int x)
 {
 	int r;
 
@@ -310,6 +299,19 @@ static __always_inline int ffs(int x)
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
+#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))
+
 /**
  * fls - find last set bit in word
  * @x: the word to search
-- 
2.35.1


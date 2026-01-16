Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D4315D3B;
	Fri, 16 Jan 2026 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605995; cv=none; b=VyCcNsHxcF+/812pkbgBcZTZfJUFXaDZTNFRNWHDkIZdmvzGpYSl6LycsijFnwSC768qmuPefhQjpKu9pRVdoIVmMQ+I/FUVOMRE44wSWWB6Js5ZvwNHdEe1aR1rEoCpQXoS+59DnY7y8g4RJR9Xkm5XTvVF19sPq60bwUBHD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605995; c=relaxed/simple;
	bh=UszndEsFNUUrQbjIPPtCJ3lDr20U+HVxbXPY6UNIaMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jY2m7lF5R5yUlXVGFMdiv4yEy8gFrzujIYo4I9xnkZaf5uJlGWMGaH18bp2dkTOCOolgwi13Bd1nMhBUJc/EjUY8berLwrwTgNZkUku6yb922DjE+USK+oRyL3a+HBhGTzbHw7Dmp6Vgy7oujP0VozHyhCL+GhASLStfacx4KbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1Dezqa8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1Dezqa8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F23C116C6;
	Fri, 16 Jan 2026 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768605994;
	bh=UszndEsFNUUrQbjIPPtCJ3lDr20U+HVxbXPY6UNIaMk=;
	h=From:Date:Subject:To:Cc:From;
	b=i1Dezqa84jIY1PnbSyy3Hhb/Tw/xo5ISWgso30xw6km6i77OT0ielGQsN2aiZoNdf
	 762jugp+vusG6oZasboo5ngpmmlAE9S7ZpPNBD2L4r0PnJIbwiJ1nurMMrJyA2FWbA
	 VHSjHezhosJdPQTs7+mQgOcKfyCQulwX2qw0mYF+XR3avIzUQ7fqE6ex3dZhLkR/wZ
	 Lg2mwflw43ZWmNzx9pT0Pka1/hoGMfvLyhPdikwGZs1ZLFI4ARm+xo91lYE1ToG/0P
	 RxwRNRhFiqW3VJttivET9Yxxwvg+q76cuC4u5P/PTmzwb7kEhY1TJfPR4CZU48XwCd
	 DmyT2ubV55xyw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 16 Jan 2026 16:26:27 -0700
Subject: [PATCH] compiler-clang.h: Require LLVM 19.1.0 or higher for
 __typeof_unqual__
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-require-llvm-19-1-for-typeof_unqual-v1-1-3b9a4a4b212b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTsJxYDRqxhDxjLVMbWFKSUaw
 t2tunyb/1dIrMIJTtUKyoskiaHA7Cqwdwo3RhmKoambrjamQ+UpizJ6vzzRHNGgi4rze+To+hy
 mTB5basnu+TA4slBKo7KT1+9yvvyd8vXBdv6mYds+lWSv6YcAAAA=
X-Change-ID: 20260116-require-llvm-19-1-for-typeof_unqual-5a5ac3e7dfac
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Uros Bizjak <ubizjak@gmail.com>, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3045; i=nathan@kernel.org;
 h=from:subject:message-id; bh=UszndEsFNUUrQbjIPPtCJ3lDr20U+HVxbXPY6UNIaMk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlZJzU0t7ezeW/oUHbiOL22sXLCQ43rTwWOm0hWLl9gx
 Kv3Wbijo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk7iUjwx5bs6CP6ZPui4g4
 TUjinLTCi7foyzyLT7UHb57+L116+RkjwxvB3ppW6blMB1u2/9P7JLeY3XrN1IZzld/anp5VUli
 WzgkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building the kernel using a version of LLVM between llvmorg-19-init
(the first commit of the LLVM 19 development cycle) and the change in
LLVM that actually added __typeof_unqual__ for all C modes [1], which
might happen during a bisect of LLVM, there is a build failure:

  In file included from arch/x86/kernel/asm-offsets.c:9:
  In file included from include/linux/crypto.h:15:
  In file included from include/linux/completion.h:12:
  In file included from include/linux/swait.h:7:
  In file included from include/linux/spinlock.h:56:
  In file included from include/linux/preempt.h:79:
  arch/x86/include/asm/preempt.h:61:2: error: call to undeclared function '__typeof_unqual__'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     61 |         raw_cpu_and_4(__preempt_count, ~PREEMPT_NEED_RESCHED);
        |         ^
  arch/x86/include/asm/percpu.h:478:36: note: expanded from macro 'raw_cpu_and_4'
    478 | #define raw_cpu_and_4(pcp, val)                         percpu_binary_op(4, , "and", (pcp), val)
        |                                                         ^
  arch/x86/include/asm/percpu.h:210:3: note: expanded from macro 'percpu_binary_op'
    210 |                 TYPEOF_UNQUAL(_var) pto_tmp__;                          \
        |                 ^
  include/linux/compiler.h:248:29: note: expanded from macro 'TYPEOF_UNQUAL'
    248 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
        |                             ^

The current logic of CC_HAS_TYPEOF_UNQUAL just checks for a major
version of 19 but half of the 19 development cycle did not have support
for __typeof_unqual__.

Harden the logic of CC_HAS_TYPEOF_UNQUAL to avoid this error by only
using __typeof_unqual__ with a released version of LLVM 19, which is
greater than or equal to 19.1.0 with LLVM's versioning scheme that
matches GCC's [2].

Link: https://github.com/llvm/llvm-project/commit/cc308f60d41744b5920ec2e2e5b25e1273c8704b [1]
Link: https://github.com/llvm/llvm-project/commit/4532617ae420056bf32f6403dde07fb99d276a49 [2]
Fixes: ac053946f5c4 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/linux/compiler-clang.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 107ce05bd16e..cccc72fd336b 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -152,4 +152,4 @@
  * Bindgen uses LLVM even if our C compiler is GCC, so we cannot
  * rely on the auto-detected CONFIG_CC_HAS_TYPEOF_UNQUAL.
  */
-#define CC_HAS_TYPEOF_UNQUAL (__clang_major__ >= 19)
+#define CC_HAS_TYPEOF_UNQUAL (__clang_major__ > 19 || (__clang_major__ == 19 && __clang_minor__ > 0))

---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20260116-require-llvm-19-1-for-typeof_unqual-5a5ac3e7dfac

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBC4A5C2F
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271068; cv=none; b=LHsTpUpEFhh7yAf/4lS53FsoS/pqyFsFUBe2l8Rh7dfxUShF0OzZhDOs0Q7DiQ0pS6CkYWf3Wlu9oT+HZEQpCI+ahf5s82eXH5Aio/YBI1HYZtx+3Uc1i2c3PC4PzYq80jefNvmYsX8Hts62tExuCssXtVM4fLg7xShkHEF449E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271068; c=relaxed/simple;
	bh=8k0pAYunK0C/ZEASjnYOeevtTRfrL6thzTwkzzYEkFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5PH2XTgn+sUjzGAsCy3rHLeuZuMyFBNWtFhgcWpcnkYGOuFn0q5FRX1WA4PVPh1SbciMDmINzkKCDlaDftiEKQ+dV9jWTcXnnCbT6b3C3pTyKVeM7/WDsrdQL/9Su4op79ooeQTSTkT0D15TCrUjLG9217BS0grpbMfALyh9CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=K8vsX+f3; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="K8vsX+f3"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso97655a91.2
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790271066; x=1790875866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ap6pakDUJlnHSF/aqYwnk2uDwDP9NpWN5G+PbeaxTVk=;
        b=K8vsX+f3WfnEZju66ADYTkhmNSQZPkYuTQiUJ81iP9PtLdm9DGgOtBap5rgNmmTWd2
         cgGBA4ELf8vskH28RjgNcSCl4MzqRNjknJobgR3WK0a5/KzO07zxQqQJT1ioKHJVsVXb
         4fAau9Mly7/YLC3MDELdvQz/yoFlJtYojwaBtFOHQ1ctL+PMMcyhkh8SA0R6p0yYrHMt
         /Lo5y7eLfL56nWYU4dc++a8Ok9sWHSVSH/MN/3fBDh3AoJu7tONDB/sGK1uEtsRor8is
         vxX519kFnmgSBGwil6dXiJj71X1Z0ELRGjNSiM1e3bYIU8QY1XinPAj/Wscrhlp8VMYD
         kTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271066; x=1790875866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ap6pakDUJlnHSF/aqYwnk2uDwDP9NpWN5G+PbeaxTVk=;
        b=F+fFaIP+PwzWtwWzSg5OTqkERRdJbbohCsl75/ckuT/Xji4VsgbW3TXENXICfhO75B
         SIlhmdUfZEN7i++YbYjcKk2ITs9l3aoxPkvFgyq5EZoik7Z8m0+J4PoDRUTS4vUQnx3U
         ORAYnGeOMBpLsw7ps1qCV7o7wx5udp9hWto94jbnYRiJKs7emcVEcO53/F2GgeeaiwSw
         gx9NP1MoveXMlenr4dDRfRn4leIDMbOiElZWoQCpx5uGuwconHagz3QaK3Faj8SegZty
         tnriesJayxraxoehSllNOvhm8V4SEeanc5uhSDZr3BwEZ5FbLoAh7Cfzdq+t1lU2thx+
         TrTw==
X-Forwarded-Encrypted: i=1; AKwUvBzpMPLzXToxqLJthzrU6+be8WlTiORTgqu0Kwnu8A++aE+7AgFgSd6F1rvneVk94tZcjf1P@lists.linux.dev
X-Gm-Message-State: AFuF++lU5KCTsD4rJnCAK6J8Vx2azTR9v45qYW9+2ZvlsL/QrIng/RTE
	hSrvWQMf+dLBX9le1HJ70f+MZFq4B5JQ0Jo8zw6hMoNG87Mjix0gEziyWE8yCvfrJd8=
X-Gm-Gg: AYBFou3kIB842T6jTR1jdLpy7SXBMQqcxdz6/RSFLaqmIH7kBDv6TsCeqNrlWwGeKRZ
	xso5YZeqdAx2+ENZOFVS233M85FdNdRXcA5d2xmBMwgdLz5nI+m1AtLgatl2/Ho70cWNz6ZcykT
	Clg8J30l012xbz2Go2CmiWXdEb9fi/3XwGNbNcODat/S22fVKjme/RzszMr7eOgb18HAhEOWSQD
	acoerxC61Bbqv0CFZ/TU40PyE0x3671oTxRvjxN7aTJA/9BfeLvgUHYAwHk5sgQLk8wqhAvZI2F
	nV5x0Fv0i7oU5HUHvFK66jhyHF1MBrq0r6usgkoT0VHZw7LATrKwk40ugx9HnQKu7UQCwpiSsmB
	hqCeQVemTfBWNb1nXEgBy9Wq8SBT69dGv7sTAd+oPU0EQuo6fUKiXIoPH/xufBT9oFiv2dBs1Cg
	RAJxIXI5XvueWoNQb6yc0XgDhr6LTOiVRInXRLsmoDKBrfgzxoqMf5Y8wexDdOq32Pe7i1mMLHg
	BEwTo6jEi2g/zSaLOTDPWiy+3SFYaALk4GJlIcD61r5gAsXOvODh/zT8odSdHN8EXAbVBI=
X-Received: by 2002:a17:90b:2e4e:b0:3a0:a515:c450 with SMTP id 98e67ed59e1d1-3a0a515c806mr1763774a91.27.1790271065988;
        Thu, 24 Sep 2026 10:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:f875:3165:4649:e818])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm6082456a91.11.2026.09.24.10.31.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 10:31:05 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 6.1.y] start_kernel: Add __no_stack_protector function attribute
Date: Thu, 24 Sep 2026 13:30:59 -0400
Message-ID: <20260924173100.87358-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "ndesaulniers@google.com" <ndesaulniers@google.com>

[ Upstream commit 514ca14ed5444b911de59ed3381dfd195d99fe4b ]

Back during the discussion of
commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
we discussed the need for a function attribute to control the omission
of stack protectors on a per-function basis; at the time Clang had
support for no_stack_protector but GCC did not. This was fixed in
gcc-11. Now that the function attribute is available, let's start using
it.

Callers of boot_init_stack_canary need to use this function attribute
unless they're compiled with -fno-stack-protector, otherwise the canary
stored in the stack slot of the caller will differ upon the call to
boot_init_stack_canary. This will lead to a call to __stack_chk_fail()
then panic.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94722
Link: https://lore.kernel.org/all/20200316130414.GC12561@hirez.programming.kicks-ass.net/
Tested-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/r/20230412-no_stackp-v2-1-116f9fe4bbe7@google.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Signed-off-by: ndesaulniers@google.com <ndesaulniers@google.com>

[ Backport to 6.1.y: retain this tree's start_kernel() signature, which
  predates its upstream __noreturn annotation, and add
  __no_stack_protector. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and kernel and powerpc maintainers,

I am continuing CVE backports still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53491

Build validation: The touched powerpc allmodconfig objects built
with CONFIG_WERROR=y, and the patched functions had no stack_chk_fail
reference.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 arch/powerpc/kernel/smp.c           |  1 +
 include/linux/compiler_attributes.h | 12 ++++++++++++
 init/main.c                         |  3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 980f2bc832d98d..fa17fdcc55a3de 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1608,6 +1608,7 @@ static void add_cpu_to_masks(int cpu)
 }
 
 /* Activate a secondary processor. */
+__no_stack_protector
 void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index ab1fe28162b5e8..b9778e13b0a085 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -277,6 +277,18 @@
  */
 #define __noreturn                      __attribute__((__noreturn__))
 
+/*
+ * Optional: only supported since GCC >= 11.1, clang >= 7.0.
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no_005fstack_005fprotector-function-attribute
+ *   clang: https://clang.llvm.org/docs/AttributeReference.html#no-stack-protector-safebuffers
+ */
+#if __has_attribute(__no_stack_protector__)
+# define __no_stack_protector		__attribute__((__no_stack_protector__))
+#else
+# define __no_stack_protector
+#endif
+
 /*
  * Optional: not supported by gcc.
  * Optional: not supported by icc.
diff --git a/init/main.c b/init/main.c
index 50b84f1f9ff38a..6acfd5a78bd7a5 100644
--- a/init/main.c
+++ b/init/main.c
@@ -908,7 +908,8 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
-asmlinkage __visible void __init __no_sanitize_address start_kernel(void)
+asmlinkage __visible __init __no_sanitize_address __no_stack_protector
+void start_kernel(void)
 {
 	char *command_line;
 	char *after_dashes;
-- 
2.39.5

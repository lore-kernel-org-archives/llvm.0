Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439638;
	b=QxwmjnJPRslJzP78fKRbr+p2nyPab8KnZRmxPyrh0WEvpyZakGW1D+f+yVaRjW0I2s4u
	 k9P4ZxDMlTUE0UzCrp8c4xHEAoLK7fSLdEyNGr8gb+wQIOnuDTXFjOOgC4uSJECgtBEHF
	 hqy9TAIaaJulTC8bFnPuBRdw/ON8MGtD+s6dcA7QiRjh7qW739CqtVte6y7SuqniA4v7o
	 B8g/aLcjfcqgrdSH8cR494NKBs+SyIdOKkeFMtr4+qI+W0jaTf26FpFTdr/K8v36od+KK
	 QiWqeKwjf8s+yXaSRZy5ZHT929icHPr9HnAu3xXTg5gZ98OwERyOmi7YfinLmeysFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439638;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:X-Change-ID:To:Cc:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-Id;
	bh=ibaTJ8TCP6OWunZ7wZlURPIe35dSzkZ2HZ9fJtO8n3g=;
	b=z6wT+V2lndbqMlubXb3pX4wfDGsUktzz9U2idnAZFbu3f8AydYAN87EhXklnWWAIVgWF
	 LcY9JRYk74cYkhKaGQ/zrLL0muwqwHG2j/jRuUz76JFndhPlsLKDi8a672OwJT/4vdegm
	 qCxWnDlw7gDOqVBCEv3ogW/BNhkmoE3u77RiShen7R/O/0DF0hSgKgl7861b3kDmbJHtq
	 4DltHiMKsPVCNImegUi8QYRyoL7GxibQA/DoGxgMNJAXqoWjGHSpJECXajafdOp17HdIy
	 G9D5XCfpCNEc5gRieYcRhDLIz/+n0DOwZbfP+ky1GzIf77Tdeqp1sjZ+G83Iwl6/GYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	dkim=pass header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=YlEF5l7M;
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965C2606A896
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 23:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965C2606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=YlEF5l7M
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=CWD1v7MEPnp/d6fyb0l0aAU6Shc6s8sYA1kH4JoyyVM=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794439635; v=1; x=1795044435;
 b=YlEF5l7MuoJB7IMWXmZD4EcQLWviYVcchvOXjgxzUAR3iBb//dWsEcUaWEjUR5dm+/BzewZg
 UbyYgtdiZ/qi2dswprlmlL+AkTfWdDK2Kd6Ulux/v9/XxK27YeWdOamQWnUAZQ+kBNxIIeOxQcr
 AQnjYZ/ll3KT1/2vp+uIP8DuwQVxcoLgkqp8ppOmYmapwxubCQcTI0Svy/GouWyfLR+/f1STx2t
 WN/DRf7yNqHkWx/9Zira+cjXCUMUiKU36XBXjKaKhzpqEYjqvB+YtKEFbAHlfIAbfeq+mVmhALd
 fFrfFXG3xFX1rFm2t1/6oN9mCC/jF6k7df75uXFa0B6cg==
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c31d66e627087ea2;
	Wed, 11 Nov 2026 23:27:15 +0000
X-Mizu-Trace-ID: c31d66e627087ea2
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
Subject: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
X-Change-ID: 20261111-x86-kexec-kcfi-5b2b437413d2
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
X-Mailer: b4 0.15.2
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Wed, 11 Nov 2026 15:26:59 -0800
Message-Id: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>

machine_kexec() calls the control page's copy of relocate_kernel()
indirectly. The routine has no kCFI type, so all of machine_kexec() is
exempt since commit 2114796ca041 ("x86/kexec: Mark machine_kexec() with
__nocfi"), and ANNOTATE_NOCFI_SYM() silences objtool.

No other call there loses its check today, but one added later would.
Review of that mark on arm64 preferred a typed entry, and objected to
covering a whole function, on x86 too [1].

Typing the routine was set aside in 2025 as not worth it [2]: a type
from the caller cannot catch a prototype that drifts, and
machine_kexec() seemed unlikely to follow a stray pointer.

Type the routine with SYM_TYPED_START(), emit an ENDBR only under
CONFIG_FINEIBT, whose boot-time rewrite skips a function without one,
and drop both exemptions, along with kexec as a valid use in annotate.h.

The check guards only the pointer, and not reliably under plain FineIBT,
which checks in the callee with IBT off. A failed check panics or hangs
with no CFI report, since load_segments() has reset GS.

Link: https://lore.kernel.org/202609241804.BB23BF10@keescook # [1]
Link: https://lore.kernel.org/9c41ab61efc573e3ab5a75b6e4031f81db84a846.camel@infradead.org # [2]
Signed-off-by: Ben Cressey <ben@cressey.dev>
---
This follows Kees Cook's review [1] of the arm64 kexec fix, which goes
separately. It is not a security fix, and nothing faults here today.
The copy gains a type hash and, with CONFIG_FINEIBT=y, an ENDBR, bare
under cfi=kcfi or cfi=off. SYM_TYPED_FUNC_START() is not used, since it
would put an ENDBR in every IBT build. Code built with CONFIG_CFI=n is
unchanged. A failed check stops crash kexec too.

An LLM wrote the patch and drafted the changelog. Tested on v7.4-rc1,
defconfig plus CFI, under cfi=off, cfi=kcfi and cfi=fineibt, the last
with and without paranoid and bhi. kexec_file_load(2), kexec_load(2),
crash kexec and a preserve-context round trip pass under QEMU TCG, so
functional only. They also pass in KVM guests on Ice Lake, which has no
IBT, with small loaders in place of kexec-tools. The KHO selftest
passes under TCG, not run with bhi. A pointer of another type is
stopped in all but cfi=off, one to code with no preamble only under
kcfi and paranoid. objtool is silent with clang, CFI on and off, and
GCC 13.3. Bare-metal kexec, IBT hardware, GCC's kCFI and LTO are
untested.
---
 arch/x86/kernel/machine_kexec_64.c   |  6 +-----
 arch/x86/kernel/relocate_kernel_64.S | 17 ++++++++++++++++-
 include/linux/annotate.h             |  5 ++---
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index c3f4a389992d..c15dfbd574cb 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -381,7 +381,7 @@ void machine_kexec_cleanup(struct kimage *image)
  * Do not allocate memory (or fail in any way) in machine_kexec().
  * We are past the point of no return, committed to rebooting now.
  */
-void __nocfi machine_kexec(struct kimage *image)
+void machine_kexec(struct kimage *image)
 {
 	unsigned long reloc_start = (unsigned long)__relocate_kernel_start;
 	relocate_kernel_fn *relocate_kernel_ptr;
@@ -463,10 +463,6 @@ void __nocfi machine_kexec(struct kimage *image)
 
 	__ftrace_enabled_restore(save_ftrace_enabled);
 }
-/*
- * Handover to the next kernel, no CFI concern.
- */
-ANNOTATE_NOCFI_SYM(machine_kexec);
 
 /* arch-dependent functionality related to kexec file-based syscall */
 
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index eaeb77464c06..86e1b1c655d1 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -5,6 +5,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <linux/stringify.h>
 #include <asm/alternative.h>
 #include <asm/page_types.h>
@@ -59,9 +60,23 @@ SYM_DATA_END(kexec_debug_idt)
 
 	.section .text..relocate_kernel,"ax";
 	.code64
-SYM_CODE_START_NOALIGN(relocate_kernel)
+/*
+ * The kCFI preamble in front of this entry is copied to the control page
+ * with the code, in the form boot-time patching left it, so it must stay
+ * position independent. FineIBT+BHI adds a CALL to a preamble only if it
+ * records arguments, and __CFI_TYPE() records none whatever the prototype.
+ */
+SYM_TYPED_START(relocate_kernel, SYM_L_GLOBAL, SYM_A_NONE)
 	UNWIND_HINT_END_OF_STACK
+#ifdef CONFIG_FINEIBT
+	/*
+	 * IBT is off by now, see cet_disable(), but FineIBT only rewrites the
+	 * preamble of a function that starts with ENDBR.
+	 */
+	ENDBR
+#else
 	ANNOTATE_NOENDBR
+#endif
 	/*
 	 * %rdi indirection_page
 	 * %rsi pa_control_page
diff --git a/include/linux/annotate.h b/include/linux/annotate.h
index 2f1599c9e573..8e9a7e17e64a 100644
--- a/include/linux/annotate.h
+++ b/include/linux/annotate.h
@@ -96,9 +96,8 @@
  */
 #define ANNOTATE_REACHABLE(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_REACHABLE)
 /*
- * This should not be used; it annotates away CFI violations. There are a few
- * valid use cases like kexec handover to the next kernel image, and there is
- * no security concern there.
+ * This should not be used; it annotates away CFI violations. The valid use
+ * case is a test that violates CFI on purpose, like LKDTM.
  *
  * There are also a few real issues annotated away, like EFI because we can't
  * control the EFI code.

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-x86-kexec-kcfi-5b2b437413d2


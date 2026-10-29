Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269845;
	b=xHW3fwMUNzyiAPlCHmbL/B3LyIYdT4fGwH0zD+18aXdevcOfWhEvDLpESFxAZU0aD6il
	 XJ01jFZRW6N1p9gKzemTcjPJ36oa6RAy81K19otxqB4u1EYyl1iZYPdroP0ve0wGa5fMu
	 nv4JAyqEWP+oYCWtQqnFRetuFyWnqcjA3tNNueR9vK3g8sRWZFvTDIP0WAXnmo0JExGVi
	 /wyIzj0R3mRQoqYiBuL4EcKxDdd2nmprB82f7H36uV5DxVUtX3loMWydRqx6e2qtZ4AiY
	 DUG6PUAiV+aNGIHtOafdHiJnLm1Yc3tDa6itprPe2zPumBJ0JYqAv7XWi22bbGyjcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269845;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=37k4SuCznrRROwQPx+TAnrlUwps6gOeYzDwf1eYuuEE=;
	b=mJuKrsXbvtLFSqmAUGkNT7MpoBhcUIyRHxu8BUX3KpSuqFoU7hHtcE+mZO6KhcMieYVn
	 20O14oa+Ir0k0/YmizxbFcAu548zP/iq4vmhdDE49VMVVdPMCkIWPEoexcKyWd1K9d09o
	 xs7n3s8udDo5M6wfP1YYrc88azptVyEhTlf1CBHjiOhO4Z/a+T0R9AIkm+sQ0PClzzPva
	 uvu3DjXv9JKVgpKBtRDLWV6RMTnnCgGzGhwDYg5FnOxcHVvnanMK1V2X3Hp6q+I1ef42l
	 yBnz1aqjn2HUzFns4bQitNifte6Na8rncygeRuKkZHHiVsE7JIYZ6HTMrXTxVtOuNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Y7xKS6kM;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26F606A31C;
	Thu, 29 Oct 2026 10:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E26F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Y7xKS6kM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=37k4SuCznrRROwQPx+TAnrlUwps6gOeYzDwf1eYuuEE=; b=Y7xKS6kMrf8k2TFtPlWjzjJWEX
	ovwq54zt09HR+k8ZactmRpcRNo7w7ATpt3b3kr0gb/0BVksuiBumA9pPNB30fPCG9z66PPWebYHWh
	PJMLHc35a/2kzrbhWTvATa7KXaAW50T0fo1Q75kmwRliTC0gs6qgOaHapjwrQ93WPnl1OInEKxu4i
	l6ax29oYznOkHaupCmTD+4JdztPuHy4Ox6gtv6LVN2L1FftCwUuCZqj3oCf8BmvdDb/77eQIKCYcw
	AaF8kvPf2L2lyG1ov3ghpLs50eXJs5sUhROWkVEQvw1NWLrxfR49RwnO1gkDaEvojDqhzs/tG/crZ
	1SRkIg6A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMNOy-002xSJ-0Q;
	Thu, 29 Oct 2026 10:30:32 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 29 Oct 2026 03:27:23 -0700
Subject: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
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
Message-Id: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
X-B4-Tracking: v=1; b=H4sIAI0f42oC/x3MQQrCMBAF0KsMf92BJEWp2QoewK24SJPRDoRaM
 kWU0rsLvgO8DSZNxRBpQ5O3mr5mRPIdIU9pfgprQSQEF47ehYHtaznVymsaq3BRW9KaJ3Z96Z0
 fTiUfRnSEpclDP//4huvljPu+/wDJr/2BbQAAAA==
X-Change-ID: 20261028-syscall-table-dispatch-03d30189dc5b
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, 
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5936; i=leitao@debian.org;
 h=from:subject:message-id; bh=pQ/CU1ObAwKL/q0NRJON0Pf3ttJvWE6vl503eCUpB+Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq4yBBKTNV4vhYFJzGFGOnbH3fL/JlxwjpzZswC
 L4NRcBTw6KJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauMgQQAKCRA1o5Of/Hh3
 bRBnD/4lgUpXM6muhA51whX3+3X5Vlh9K/Flonkrg2W1ATBnwAISFUbF3ePfnc/wubvvdYSOoNE
 Ew+kclR7ATYfKwTTDGk4pfl1cUlcP4cPLuVQYDex3kgBbtrUMqH6QMZIhhMRseiazE11+jsL8yc
 bepcz+2fS2rTbdzxW7bgFqUW75dq+1IaDtGlBCqIt4yEowAbD8GJRVh5LUJTr/GSgzyLA7mDUNW
 AAv1vTDX1Olbv6TlENCHa9m0ggHpDhu6eVaj8TLGYYBXqSB3DnH32f9mfgsxphVG+0fpte8J4+U
 9yHf+8q3WiTb0Y4A866Nq/gpg6utBzxcrym7rZnTPaCm75PiKjjGl8ZVJXBPa3Ky6DgrgcdaCPU
 XQUGz+yaV8UxF/5WF0I3rnwy2ynPe4LRMokbhxfCidJnUIiWkHGVLk3NMZ9lQgj+cMo/wPqyOG5
 Q4A+Sb8jrZipHlJCsYMcRIvSJ+y2BQ7A6jQq1TL0HqZlmYK0OQG/od5F+lNML5oX56ou+oSa1Kk
 lZ30B2s/D+IOf8WGGvNxHkSIiye8hHap5Wzg9qZr8dEIO7abGzgB7Sqwr000ltMhn9CAumvc704
 7EviW9XBw0v5nFrjuJrIWB9BW842TgiZvkYxq3WO9WkTeefiZkBuhzOEAN0ISREi6Wvu10qBdBi
 nZAYLjg0uJxSleQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Linus' commit 1e3ad78334a6 ("x86/syscall: Don't force use of indirect
calls for system calls") dispatches system calls with a switch
statement, so that syscall entry has no indirect branch for BHI to
target.

As noted by Linus in the commit above, the compiler can either
decide to generate an indirect jump, or just a series of conditional
branches (which is more expensive).

With CONFIG_MITIGATION_RETPOLINE, clang emits no indirect jump, and the
switch becomes a tree of compares and conditional branches. That code is
built in, so a kernel booted with mitigations=off still walks the tree
on every system call.

When neither the Spectre v2 nor the BHI mitigation is enabled, nothing in
the kernel protects indirect branches, and the switch buys nothing. Use a
static key to call through sys_call_table[] in that case.

The compiler emits that call through a retpoline thunk, which boot-time
patching turns into a plain indirect call when retpolines are off.

On next-20261028 built with clang and booted with mitigations=off on a
Xeon Gold 6138 at a fixed 2.0 GHz, perf bench syscall basic (getppid)
and getpgid. Mean and standard deviation of 30 to 45 runs over 2 to 3
boots, and kernel instructions and cycles per call from perf stat:

                         CPU_MITIGATIONS=n  =y              =y + patch
  getppid()  ns          131.2 +- 0.2       134.1 +- 0.1    131.7 +- 0.4
             insns/cyc   310 / 212.1        331 / 218.1     314 / 213.1
  getpgid()  ns          129.8 +- 0.3       132.5 +- 0.2    130.0 +- 0.5
             insns/cyc   302 / 209.4        323 / 214.1     306 / 209.8

Kernels that enable either mitigation keep the switch, behind one extra
jump.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
The reason behind this change is to make the mitigations a boot command
line option rather than a compilation option.

It is common to find different kernel configurations where the major
difference is CONFIG_CPU_MITIGATIONS.

With this patch, CONFIG_CPU_MITIGATIONS can be enabled at build time, and
when the mitigations are disabled at boot, system call dispatch has no
performance impact.
---
 arch/x86/entry/syscall_64.c    | 15 +++++++++++----
 arch/x86/include/asm/syscall.h |  3 ++-
 arch/x86/kernel/cpu/bugs.c     | 12 ++++++++++++
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index 966d3d1b75868..1da8b6c90171e 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -21,9 +21,8 @@
 #define __SYSCALL_NORETURN __SYSCALL
 
 /*
- * The sys_call_table[] is no longer used for system calls, but
- * kernel/trace/trace_syscalls.c still wants to know the system
- * call address.
+ * Used for dispatch only when x64_syscall_use_table is enabled;
+ * kernel/trace/trace_syscalls.c also wants the system call addresses.
  */
 #define __SYSCALL(nr, sym) __x64_##sym,
 const sys_call_ptr_t sys_call_table[] = {
@@ -31,6 +30,11 @@ const sys_call_ptr_t sys_call_table[] = {
 };
 #undef  __SYSCALL
 
+/*
+ * Decide about syscall dispatch method: x64_sys_call() or sys_call_table
+ */
+DEFINE_STATIC_KEY_FALSE(x64_syscall_use_table);
+
 #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
 
 /* The unsigned int @nr argument is intentional as it creates denser code */
@@ -58,7 +62,10 @@ static __always_inline bool do_syscall_x64(struct pt_regs *regs, unsigned long n
 {
 	if (likely(nr < NR_syscalls)) {
 		nr = array_index_nospec(nr, NR_syscalls);
-		regs->ax = x64_sys_call(regs, (unsigned int)nr);
+		if (static_branch_likely(&x64_syscall_use_table))
+			regs->ax = sys_call_table[nr](regs);
+		else
+			regs->ax = x64_sys_call(regs, (unsigned int)nr);
 		return true;
 	}
 	return false;
diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
index cfe4251fc1fe3..509449a70febc 100644
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -13,12 +13,13 @@
 #include <uapi/linux/audit.h>
 #include <linux/sched.h>
 #include <linux/err.h>
+#include <linux/jump_label.h>
 #include <asm/thread_info.h>	/* for TS_COMPAT */
 #include <asm/unistd.h>
 
-/* This is used purely for kernel/trace/trace_syscalls.c */
 typedef long (*sys_call_ptr_t)(const struct pt_regs *);
 extern const sys_call_ptr_t sys_call_table[];
+DECLARE_STATIC_KEY_FALSE(x64_syscall_use_table);
 
 /*
  * Only the low 32 bits of orig_ax are meaningful, so we return int.
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 000ebee2d247b..1823b4d963de3 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -32,6 +32,7 @@
 #include <asm/hypervisor.h>
 #include <asm/tlbflush.h>
 #include <asm/cpu.h>
+#include <asm/syscall.h>
 
 #include "cpu.h"
 
@@ -2134,6 +2135,16 @@ static void __init bhi_apply_mitigation(void)
 	setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_VMEXIT);
 }
 
+static void __init syscall_dispatch_apply_mitigation(void)
+{
+	if (!IS_ENABLED(CONFIG_X86_64) || spectre_v2_enabled != SPECTRE_V2_NONE ||
+	    bhi_mitigation != BHI_MITIGATION_OFF)
+		return;
+
+	pr_info("BHI mitigation off, dispatching syscalls through sys_call_table\n");
+	static_branch_enable(&x64_syscall_use_table);
+}
+
 static void __init spectre_v2_select_mitigation(void)
 {
 	if ((spectre_v2_cmd == SPECTRE_V2_CMD_RETPOLINE ||
@@ -3371,6 +3382,7 @@ void __init cpu_select_mitigations(void)
 	bhi_apply_mitigation();
 	tsa_apply_mitigation();
 	vmscape_apply_mitigation();
+	syscall_dispatch_apply_mitigation();
 }
 
 #ifdef CONFIG_SYSFS

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261028-syscall-table-dispatch-03d30189dc5b

Best regards,
--  
Breno Leitao <leitao@debian.org>


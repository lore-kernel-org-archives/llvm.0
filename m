Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480168;
	b=Lu9dg3Nz7rvckZaK40f0PiYkf5TRAxTZriOy9x2wzctPXTjQt3t+MpDkKtFM46sFjiGt
	 5+/zRlV6E4acv7igHrdgP3/juxIKtAIVn7iKOShOOcVZpop/sqkHC4g3ds53zajnVneEW
	 abTPocuzFyVP0z5BGvEfXd9ZqtNSsSupdb2I5j4bmQHrXYAJ4BpATIdPmKRd/VKwcmOr1
	 Vv6T6kG/61BPsHDAjrL8mF+ytgAm/OwBWwaKbC5vZqM/FTms7iGjg1248P7+4REmbiX8P
	 DNtkLTnxLJZabmtnLIfHMv7iePD0MAYWG7npia/swpDG64yG8322BFFr9N3hYt/TJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bY5d4/TMcy//z+w9FDGxWLfQayj8V8d4N5emA0503YQ=;
	b=0H2BPvvCGYKonazAlCas39smcN4y/IWURFoImyFtWXpBn8mMYYgOoQWXEodHwXJrfAev
	 PmQtSaH76kgdSiUPETHlm+97Haru5aAqp65BsbVfBt71CXoUW3e60i4ZYzG8+jVA8G0/h
	 nXe9uTbGmzmKL5+AUFHyVQw3by/r33o4b3N1kuhmpdl/uoly8pqp+ro6yjqkHb5PbxI0N
	 eLtGrfLrncgG+ZGD09NjEZ94b/cG8kEBG1Y2AbdWzw3RDxaZSOnmUPhdyVsfjJQIHYHhz
	 nrX+EWmNDZ7ygM2OY80PbRshCF4KBTBS7LQ7x/X1/Me27WU8FMNSokatVaZS4c75X1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="Of//l9+c";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C1606A327
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9C1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Of//l9+c
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8780138eec.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480167; x=1795084967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bY5d4/TMcy//z+w9FDGxWLfQayj8V8d4N5emA0503YQ=;
        b=Of//l9+cDXSOxLPlGWG/HkJ3ZQjHZzA67WeRX7WvPJE2H6RqGqOighn3/3LJvvQNCt
         onvIQNZDUtYZ4aQj/AVrfv8p3HzKND0sOMwjcobRBigAEwvXVUqxAIM3hDiLUDDgoCZR
         WCR1U4O9Hue4vtCOGns9yVFfx6Xa2FrqsyM+EYV16JArCKoU295uZA4iUnA4BtdI3F/x
         x7BN4YWKKsDx1BCvhzEOojLfxA6RSZS3edAr+u3mG6BE1lR3AfXQ84mkQ52zp70wxGVb
         SH3qdE1XY7eSjTnE2+4cYnFOihCrglQliHDwZIMLhn2nwM81kJ3+xRxK6F1MVpnwdWU1
         st5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480167; x=1795084967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bY5d4/TMcy//z+w9FDGxWLfQayj8V8d4N5emA0503YQ=;
        b=p/Nv50htW/drIuS3MSU77gN0B6sYtV/KLarQSaexcimFOn5GBB/L8wjzXN2OQtVdLI
         KQXElCQNft4a5lyS1pFP70180uMTIACW4NHqxNp67mExTUkNse3FR4wDAJkXDTwQl1nZ
         M7LJk+ZBJ/AWb3/qe0CAala0QvJkCqhbfBluhHVYUoEN8i8AAwKCBge2gGABJmW9QqiY
         VLa7UL03Eyjzjw4HWakTBxc1WIzLRciSLMIUN236xcsL3JBlR7BhT4YQruIRKJInPTck
         UfhVWVOHrphhrGZxT244MKU89c8ow4VG8sdupJmldXgSbbvam4j5pWoPGCtc10SYs6th
         ia+Q==
X-Forwarded-Encrypted: i=1; AL+hErHGhzZFrVnPKiES4iAejDEoSMCPG1fUxvx0j9mTI8X38MgXeGO1gXjhfxoZxVW0EWRw3o6b@lists.linux.dev
X-Gm-Message-State: APuU4Z+kKMgJdxfat3Z3Sk00jLwabFY+4NR4oZgGL/Flx+u8dGbANEDd
	fDZImI6L+4Ad2TeMpTzcLMJB6VPHznnUm19qUSI1QRQBWNnBDB4Ivxo+342B49zQ85U=
X-Gm-Gg: AYBFou1zbTpiB7AcAPLGz6l+6UopPHrLxF2PMCSbL3PK9qnuX16XgK7TNVP0eNjKmkW
	28fR93o6tJ/ftFIB1mLn+wS0wdZAzyRfVXEsnVntVTFzE47TYn6Jf5dcW+o5tdFQ64AEMc+y/Qp
	c2E0Cg8VDlxLAhJoPGGH9ApZVemtMAp0loWYGHxCrAl+uES9EbziOqsJFX4aTUbBdkvyiYyJ6f7
	cgbekw8G8BMtqsOOb+dMxxDZu8A1S9IngnaPrw1DyS/WPzsONOJbv5ldtmEhNq88DjK1RpjiWa0
	Bc/YCap87aZViLFg2bEt127AN606CPJpDpqGoJk0pHiJ1wJBBnCWlXPTvEriaMiQNBbxVzMdlhW
	oqVtTg7HCy38rl57qPgSub45vWt1wWfMUezx3fKXzZitWFnlAD4Rm08G9uahLMlM0bLUi5HRyMn
	dfwhZeBsbkP0W1UhPq4ybtve3p1Tb8rGTKwBu34IbwMhlNllLBkiZf73P2iF6eYnu1VbWJwONeT
	tiIH9IP6THXzVougWGoMjRDUjQIWi3OKoeIAGzBNGmpsmmqx/FA6KkXJyZLSWcyAUFGVLcXHh4b
	UBpetLpJQtdPMxmkUpWDoyZkPkXjGPA8FqZjzzrC2xBbqZC1ET9ipFn1r64DQP8gt7s=
X-Received: by 2002:a05:7300:2324:b0:36f:350b:3838 with SMTP id 5a478bee46e88-37686278c55mr7595712eec.31.1794480167105;
        Thu, 12 Nov 2026 02:42:47 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.42.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:42:46 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 1/9] riscv: store percpu offset into thread_info
Date: Thu, 12 Nov 2026 18:41:41 +0800
Message-Id: <20261112104149.38589-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V currently derives the current per-CPU offset from the CPU number
and __per_cpu_offset[]. Cache it in thread_info so per-CPU accesses can
load the offset directly.

Initialize the cached offset for the boot and secondary CPUs, and
propagate it across context switches. Set it before each secondary CPU
startup, including parallel bringup and CPU hotplug.

Link: https://lists.riscv.org/g/tech-privileged/topic/risc_v_tech_arch_review/113437553?page=2
Link: https://lore.kernel.org/r/20260826012457.ig3rfmji7vywf6kc@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/asm.h         |  6 +-----
 arch/riscv/include/asm/percpu.h      | 14 ++++++++++++++
 arch/riscv/include/asm/switch_to.h   |  9 +++++++++
 arch/riscv/include/asm/thread_info.h |  3 ++-
 arch/riscv/kernel/asm-offsets.c      |  2 +-
 arch/riscv/kernel/smpboot.c          | 10 +++++++++-
 arch/riscv/net/bpf_jit_comp64.c      |  9 +--------
 7 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index b8bf842d4c136..06ac38f733b0a 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -92,11 +92,7 @@
 
 #ifdef CONFIG_SMP
 .macro asm_per_cpu dst sym tmp
-	lw    \tmp, TASK_TI_CPU_NUM(tp)
-	slli  \tmp, \tmp, RISCV_LGPTR
-	la    \dst, __per_cpu_offset
-	add   \dst, \dst, \tmp
-	REG_L \tmp, 0(\dst)
+	REG_L \tmp, TASK_TI_PCPU_OFFSET(tp)
 	la    \dst, \sym
 	add   \dst, \dst, \tmp
 .endm
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..faf9a75ec66d7
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+#include <linux/thread_info.h>
+
+#include <asm/current.h>
+
+#define __my_cpu_offset (((struct thread_info *)current)->pcpu_offset)
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 123c89b694e87..b4a4d4a44f25d 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -89,6 +89,14 @@ static inline void __switch_to_envcfg(struct task_struct *next)
 			:: "r" (next->thread.envcfg) : "memory");
 }
 
+static inline void __switch_to_pcpu_offset(struct task_struct *prev,
+					   struct task_struct *next)
+{
+#ifdef CONFIG_SMP
+	next->thread_info.pcpu_offset = prev->thread_info.pcpu_offset;
+#endif
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -125,6 +133,7 @@ do {							\
 	if (switch_to_should_flush_icache(__next))	\
 		local_flush_icache_all();		\
 	__switch_to_envcfg(__next);			\
+	__switch_to_pcpu_offset(__prev, __next);		\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9eca..f10ba62b61016 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -53,6 +53,7 @@
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
+	int			cpu;
 	/*
 	 * These stack pointers are overwritten on every system call or
 	 * exception.  SP is also saved to the stack it can be recovered when
@@ -60,8 +61,8 @@ struct thread_info {
 	 */
 	long			kernel_sp;	/* Kernel stack pointer */
 	long			user_sp;	/* User stack pointer */
-	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long		pcpu_offset;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9f..f4f7ee976cd94 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -38,6 +38,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
+	OFFSET(TASK_TI_PCPU_OFFSET, task_struct, thread_info.pcpu_offset);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
@@ -50,7 +51,6 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 #endif
 
-	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 #ifdef CONFIG_RISCV_USER_CFI
 	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
 	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a9de2dae804c6..6431914d21165 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -175,6 +175,10 @@ void __init setup_smp(void)
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
+	/* The idle task is reused across CPU hotplug. */
+	tidle->thread_info.cpu = cpu;
+	tidle->thread_info.pcpu_offset = per_cpu_offset(cpu);
+
 	if (cpu_ops->cpu_start)
 		return cpu_ops->cpu_start(cpu, tidle);
 
@@ -190,7 +194,6 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
 	int ret;
-	tidle->thread_info.cpu = cpu;
 
 	ret = start_secondary_cpu(cpu, tidle);
 	if (!ret) {
@@ -208,6 +211,11 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 }
 #endif
 
+void __init smp_prepare_boot_cpu(void)
+{
+	__my_cpu_offset = per_cpu_offset(smp_processor_id());
+}
+
 void __init smp_cpus_done(unsigned int max_cpus)
 {
 }
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 371405598faa7..fa6ce5613c4d6 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1466,15 +1466,8 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			if (rd != rs)
 				emit_mv(rd, rs, ctx);
 #ifdef CONFIG_SMP
-			/* Load current CPU number in T1 */
-			emit_lw(RV_REG_T1, offsetof(struct thread_info, cpu),
+			emit_ld(RV_REG_T1, offsetof(struct thread_info, pcpu_offset),
 				RV_REG_TP, ctx);
-			/* Load address of __per_cpu_offset array in T2 */
-			emit_addr(RV_REG_T2, (u64)&__per_cpu_offset, extra_pass, ctx);
-			/* Get address of __per_cpu_offset[cpu] in T1 */
-			emit_sh3add(RV_REG_T1, RV_REG_T1, RV_REG_T2, ctx);
-			/* Load __per_cpu_offset[cpu] in T1 */
-			emit_ld(RV_REG_T1, 0, RV_REG_T1, ctx);
 			/* Add the offset to Rd */
 			emit_add(rd, rd, RV_REG_T1, ctx);
 #endif
-- 
2.39.5


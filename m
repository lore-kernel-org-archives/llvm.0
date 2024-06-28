Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16625158A1C
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575309; cv=none; b=QohwgOp0pua/Udr8PSUT93OHTBnOr8MiPyR3Zk8tc6AxJGwWUaQEt7xk1bnRcFLba9X1Ncddgg+FWo4O+PGQYWN749r1VhyJPoPoODpkJXQZ0mQSGcdbS1aP1zNcNhXri4OIsFIj79eO7alA8l2SeDEi4/vJkJTI6fIKVn5BZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575309; c=relaxed/simple;
	bh=2UN4njlPUSnNWhL/NqYg76UfIkKuxRSCp7rCMspAINA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LC2UuyhHVYdh6G4gzEARsyYt2tYltNleTUoG68ltQQnxBYbcenyEbb54bXDN+dqL7o6ybWcdA1Mcess2PvgecOQLajI6tffV9N4fPIfW7wDZMsuN4if517M/enJEtVHfRP2eIK2XiRDXkcm+8NWo9Uw8HFW0K+NKc8AlyenAPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=bs40yJDP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bs40yJDP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-706683e5249so350892b3a.2
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575306; x=1720180106; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRfKgP0f/b5byy3Hsr+xfWPWy/6xoLq7KDU6P/HKJkA=;
        b=bs40yJDPNOZfTDL+eH9HCF2dJ0wQ4zLJkY7/c7xVmx1oyFdSwydZO5XatxZgiEDvzl
         AUNM5Gocg3zCKDXh2ZK5yb1OFWIYLXbRnDTc8ULdxjgUdXEtlEpXzz/m0IkLodpQxfMN
         Gl3alpV6o3RWUhr0y4kGriay7IzWkBnzayDjP48Ra+WJavpUFt+9diRLHXQZfswQorBv
         Ogdj7292tK8hh4Kytl7w1PgKy4HOyRKDYCvBqSJgXu3ILRCUmebJIb9UO/QdoqoVjL2m
         YOmbTjy6TGFaGu18MfbXluXmIYYcl5PafkPAWG2CAzMRpJN++Js93YoV2cj5bEULTaY4
         V05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575306; x=1720180106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRfKgP0f/b5byy3Hsr+xfWPWy/6xoLq7KDU6P/HKJkA=;
        b=SK84SV8N8meU923U4saIqizvXQJqFwm4NVbygc43e6Nyqujllgs9M6ToPjm0YWsiin
         X7p5PomdhgcsmGCF/2thNg6SbrnlOGIwhHA1p9QKHQDSfviIsCP6rg2ADV5CcJn3Q+R+
         EPo8OFOrI5M3MHRes0KfdM2khnXy0SbrmVuFGngRO04Y5/1Ji23kd8Z32eTWjBwIzrAw
         zz8ytg9j/kdCuZQfnD2648Yi3yXD0qroP2rxCcIZi9jlIM9CPntygk0wXPcEpaSlVT8N
         enNeZTHzClr7UlVCJWmxVK/f5YLdMwuu1VB7nwwAkCz1akemziI7a7jdCsutyZqY+/na
         NApQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg2SP7CFMEwKY32/W134yQRJuiwMPRwGzmDph/m6t3AjAgJ9TPJnwmnaDUcRIox1CUc6T8+HPd1qYXAglLCFLu48sBsQ==
X-Gm-Message-State: AOJu0Ywch3rDhpTL5uofMRadM0wT3/s+joABcyBmWA9T6gevOgG2Mhvy
	gTKWOmKQ4DVJwKqcJPPSlstlualaPtXhWOvDfxHvnq6tqq54hfNZDp0cmgy1Jkw=
X-Google-Smtp-Source: AGHT+IEAymT/KibkJ2rVnqkBCpfqAUN3Ax4XLYgVI1XP9yFZGQfCsMCsbNKadorxrzTjX8uUzgoyYQ==
X-Received: by 2002:a05:6a00:2e96:b0:706:8cc6:7471 with SMTP id d2e1a72fcca58-7068cc67611mr15622161b3a.34.1719575306121;
        Fri, 28 Jun 2024 04:48:26 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:25 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:46 +0800
Subject: [PATCH v2 3/6] riscv: ftrace: prepare ftrace for atomic code
 patching
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-3-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4

We use an AUIPC+JALR pair to jump into a ftrace trampoline. Since
instruction fetch can break down to 4 byte at a time, it is impossible
to update two instructions without a race. In order to mitigate it, we
initialize the patchable entry to AUIPC + NOP4. Then, the run-time code
patching can change NOP4 to JALR to eable/disable ftrcae from a
function. This limits the reach of each ftrace entry to +-2KB displacing
from ftrace_caller.

Starting from the trampoline, we add a level of indirection for it to
reach ftrace caller target. Now, it loads the target address from a
memory location, then perform the jump. This enable the kernel to update
the target atomically.

The ordering of reading/updating the targert address should be guarded
by generic ftrace code, where it sends smp_rmb ipi.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  4 +++
 arch/riscv/kernel/ftrace.c      | 80 ++++++++++++++++++++++++++---------------
 arch/riscv/kernel/mcount-dyn.S  |  9 +++--
 3 files changed, 62 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 5f81c53dbfd9..7199383f8c02 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -81,6 +81,7 @@ struct dyn_arch_ftrace {
 #define JALR_T0			(0x000282e7)
 #define AUIPC_T0		(0x00000297)
 #define NOP4			(0x00000013)
+#define JALR_RANGE		(JALR_SIGN_MASK - 1)
 
 #define to_jalr_t0(offset)						\
 	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
@@ -118,6 +119,9 @@ do {									\
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
  */
 #define MCOUNT_INSN_SIZE 8
+#define MCOUNT_AUIPC_SIZE	4
+#define MCOUNT_JALR_SIZE	4
+#define MCOUNT_NOP4_SIZE	4
 
 #ifndef __ASSEMBLY__
 struct dyn_ftrace;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4b95c574fd04..5ebe412280ef 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -64,42 +64,64 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 	return 0;
 }
 
-static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
-				bool enable, bool ra)
+static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target, bool validate)
 {
 	unsigned int call[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int replaced[2];
+
+	make_call_t0(hook_pos, target, call);
 
-	if (ra)
-		make_call_ra(hook_pos, target, call);
-	else
-		make_call_t0(hook_pos, target, call);
+	if (validate) {
+		/*
+		 * Read the text we want to modify;
+		 * return must be -EFAULT on read error
+		 */
+		if (copy_from_kernel_nofault(replaced, (void *)hook_pos,
+					     MCOUNT_INSN_SIZE))
+			return -EFAULT;
+
+		if (replaced[0] != call[0]) {
+			pr_err("%p: expected (%08x) but got (%08x)\n",
+			       (void *)hook_pos, call[0], replaced[0]);
+			return -EINVAL;
+		}
+	}
 
-	/* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
-	if (patch_insn_write((void *)hook_pos, enable ? call : nops, MCOUNT_INSN_SIZE))
+	/* Replace the jalr at once. Return -EPERM on write error. */
+	if (patch_insn_write((void *)(hook_pos + MCOUNT_AUIPC_SIZE), call + 1, MCOUNT_JALR_SIZE))
 		return -EPERM;
 
 	return 0;
 }
 
-int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+static int __ftrace_modify_call_site(ftrace_func_t *hook_pos, ftrace_func_t target, bool enable)
 {
-	unsigned int call[2];
+	ftrace_func_t call = target;
+	ftrace_func_t nops = &ftrace_stub;
 
-	make_call_t0(rec->ip, addr, call);
-
-	if (patch_insn_write((void *)rec->ip, call, MCOUNT_INSN_SIZE))
-		return -EPERM;
+	WRITE_ONCE(*hook_pos, enable ? call : nops);
 
 	return 0;
 }
 
+int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	unsigned long distance, orig_addr;
+
+	orig_addr = (unsigned long)&ftrace_caller;
+	distance = addr > orig_addr ? addr - orig_addr : orig_addr - addr;
+	if (distance > JALR_RANGE)
+		return -EINVAL;
+
+	return __ftrace_modify_call(rec->ip, addr, false);
+}
+
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[1] = {NOP4};
 
-	if (patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
+	if (patch_insn_write((void *)(rec->ip + MCOUNT_AUIPC_SIZE), nops, MCOUNT_NOP4_SIZE))
 		return -EPERM;
 
 	return 0;
@@ -114,21 +136,23 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
  */
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
+	unsigned int nops[2];
 	int out;
 
+	make_call_t0(rec->ip, &ftrace_caller, nops);
+	nops[1] = NOP4;
+
 	mutex_lock(&text_mutex);
-	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+	out = patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE);
 	mutex_unlock(&text_mutex);
 
 	return out;
 }
 
+ftrace_func_t ftrace_call_dest = ftrace_stub;
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
-	int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
-				       (unsigned long)func, true, true);
-
-	return ret;
+	return __ftrace_modify_call_site(&ftrace_call_dest, func, true);
 }
 
 struct ftrace_modify_param {
@@ -182,7 +206,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	if (ret)
 		return ret;
 
-	return __ftrace_modify_call(caller, addr, true, false);
+	return __ftrace_modify_call(caller, addr, true);
 }
 #endif
 
@@ -217,17 +241,17 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 	prepare_ftrace_return(&fregs->ra, ip, fregs->s0);
 }
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-extern void ftrace_graph_call(void);
+ftrace_func_t ftrace_graph_call_dest = ftrace_stub;
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true, true);
+	return __ftrace_modify_call_site(&ftrace_graph_call_dest,
+					 &prepare_ftrace_return, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false, true);
+	return __ftrace_modify_call_site(&ftrace_graph_call_dest,
+					 &prepare_ftrace_return, false);
 }
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 #endif /* CONFIG_DYNAMIC_FTRACE */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index e988bd26b28b..bc06e8ab81cf 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -162,7 +162,8 @@ SYM_FUNC_START(ftrace_caller)
 	mv	a3, sp
 
 SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_call_dest
+	jalr	0(ra)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	addi	a0, sp, ABI_RA
@@ -172,7 +173,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	mv	a2, s0
 #endif
 SYM_INNER_LABEL(ftrace_graph_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_graph_call_dest
+	jalr	0(ra)
 #endif
 	RESTORE_ABI
 	jr	t0
@@ -185,7 +187,8 @@ SYM_FUNC_START(ftrace_caller)
 	PREPARE_ARGS
 
 SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_call_dest
+	jalr	0(ra)
 
 	RESTORE_ABI_REGS
 	bnez	t1, .Ldirect

-- 
2.43.0


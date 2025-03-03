Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31C1E9B27
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984974; cv=none; b=S68YX6Ele4I1iM3E3yEmx7m87tk4VGB78gqaIWGMCrtedUn/ei8a+173eQJGXNnxtj/qzdhMCEwqI1+meUJCEuDy41u5CMOO/44nKFntXDrmItG/Hp5j6alXPZ3zoQPQV8vAbLr2E2kzwoewc8q8f/a3Dbj/nxU7nMDy9p0NGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984974; c=relaxed/simple;
	bh=8+jQ2LOFLvD8yNjmgsq7xpDv7f8F3syKUpRlLU8kRU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UaGF/dp6E0CnuwBgoWwWk4zP9zTc0kx7hhdK/6HwOsddbXlPSR+MeT67Dmb82HcpT/nIH9vs8Px/bHqEKER5gA695r4/8IohtWG7+HN0+u62u6XF/2aPYoVWxy3wK26VmWhdfxLzlzhV8QgqsDR4M5xVYSkOI7+6tW2EMqoiZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3CTnHUm; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3CTnHUm"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2239aa5da08so15284645ad.3
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 22:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984972; x=1741589772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvSQXTXm2WJtvrSSulKAAYVeipdazZIwWA04KeDmP3s=;
        b=b3CTnHUmJ2n/psg8rTT08zvuVOmtJuPSvgPaetMl1CadQEKgNzQGnORjv7AMBcRfEc
         CzI/UDqK2z9Kf10HEfEFwnw7g6k0lYnBCI69GkrQfiHDrvM0dh+FgdGzdoWKSibba/OQ
         /+gtKg1u4UgXB2yjAXiFvoazKyBvt1S4nUlRFS/qJXq7B9wQVy5WLsJGk2+Slx8B7Xlz
         1z4EQa4uXzRcpPNBVQH0TTThrNUneNOruocItwl6amlqAVpQY2huzzlWB0m9UT2fSiQv
         fS7oB6yTmbAMrC2FyU3KquDT18vPFy27lNbO5mENa7HA+khXfMaPoAW/HtPcGBJBazmi
         LdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984972; x=1741589772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvSQXTXm2WJtvrSSulKAAYVeipdazZIwWA04KeDmP3s=;
        b=nZZLqnJzGwo96pjZTxheL28MCBnM9e/4j+OJ0SEYmcQ9zOwA4aE4kKaf2bUK6o6w8Z
         Egq+ZJmAZUT3j1d7T3OXHj2kk7FNSq7E2JjZ1RiNWI+ojTYvHd1qHE5gDv9R4TBPBpAA
         TTCD82q9Aqp0SgGbL9Z7vDpTHZi7133C0xmiQEhqlhiFs5N051edOo4R/aC7ujSzhYL1
         fLjYLKGtbdIT3xdn+vMecWkWZRlIxZ+lkMylMktyW96BhMlU8DqjBmX7YTItFs6eH9G6
         8ufMuNL1n+G6AfbOl9I671QMievXRYZBx9nOdUWI/iqzSbNQJZ3Grkxrby5KCBwPjO5W
         Z2lw==
X-Forwarded-Encrypted: i=1; AJvYcCXzYUM3iAv4Iov+oA7BymIrd3x839QN6s74x4gU+g6xEB44GAhZNhoB5JXiEQjVROrKwJ8h@lists.linux.dev
X-Gm-Message-State: AOJu0YzxnjRYcrAveQ83ZLT31snM4a+AQ4/TRQTYOeicIR+yKF3AchRY
	XHTN/FHXLM48qb8Qn5hfRBqvZM6KzW8dUESMOpKFT6L7nK9ibHMS
X-Gm-Gg: ASbGncu3IZePXoH41JZhI9ebqIf7juvCE3BhbORqidJ1W06A1PHe1erx0++pqDJ2QgV
	bS98ggHBAN0LNZoYUM8wrBHD+4rDFGqTomy3WqbUl/pqfjhEjTM9NrcJMfOcHzTwi6TQe36ApiX
	lQxl60SnvaXi+5xxdm6km3W2HAgyMgfJD1LNHecam9h2JkB4C507MvDTIMwxobPjqDr8JKn9nmA
	l7m/yZqmCHbiFVaxy5dSh8mc/QAzI2QHzoJ5fw4pnNI96wmeTWd9KFa/ITqfbyHwFg5e1fzjkTV
	7h3ZAySYLWZbW86YoBgwa6twDppgwDt/BwJouL61Oh5w1/G9CNb7VLHEfiSkcQ==
X-Google-Smtp-Source: AGHT+IHD7TOQHXPnvhY3fUJExGRRx5jR57Vtr+fKvMEWMLLg1ZWvH9nc0mv2BX9j9PlmWnQhBjDbsg==
X-Received: by 2002:a17:903:3b83:b0:21f:6c3:aefb with SMTP id d9443c01a7336-2236920c418mr195671705ad.35.1740984972122;
        Sun, 02 Mar 2025 22:56:12 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:56:11 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 4/4] arm64: implement per-function metadata storage for arm64
Date: Mon,  3 Mar 2025 14:53:45 +0800
Message-Id: <20250303065345.229298-5-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303065345.229298-1-dongml2@chinatelecom.cn>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-function metadata storage is already used by ftrace if
CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointer
of the callback directly to the function padding, which consume 8-bytes,
in the commit
baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
So we can directly store the index to the function padding too, without
a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
function is 8-bytes aligned, and we will compile the kernel with extra
8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
aligned, and only extra 4-bytes (1 NOPS) is needed.

However, we have the same problem with Mark in the commit above: we can't
use the function padding together with CFI_CLANG, which can make the clang
compiles a wrong offset to the pre-function type hash. He said that he was
working with others on this problem 2 years ago. Hi Mark, is there any
progress on this problem?

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/arm64/Kconfig              | 15 +++++++++++++++
 arch/arm64/Makefile             | 23 ++++++++++++++++++++--
 arch/arm64/include/asm/ftrace.h | 34 +++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ftrace.c      | 13 +++++++++++--
 4 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..7ed80f5eb267 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1536,6 +1536,21 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE if !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	depends on !CFI_CLANG
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding,
+	  which will consume 4-bytes. If FUNCTION_ALIGNMENT_8B is enabled,
+	  extra 8-bytes function padding will be reserved during compiling.
+	  Otherwise, only extra 4-bytes function padding is needed.
+
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2b25d671365f..2df2b0f4dd90 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -144,12 +144,31 @@ endif
 
 CHECKFLAGS	+= -D__aarch64__
 
+ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  ifeq ($(CONFIG_FUNCTION_ALIGNMENT_8B),y)
+  __padding_nops := 2
+  else
+  __padding_nops := 1
+  endif
+else
+  __padding_nops := 0
+endif
+
 ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
+  __padding_nops  := $(shell echo $(__padding_nops) + 2 | bc)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=4,2
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
 else ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_ARGS),y)
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+else ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  CC_FLAGS_FTRACE += -fpatchable-function-entry=$(__padding_nops),$(__padding_nops)
+  ifneq ($(CONFIG_FUNCTION_TRACER),y)
+    KBUILD_CFLAGS += $(CC_FLAGS_FTRACE)
+    # some file need to remove this cflag when CONFIG_FUNCTION_TRACER
+    # is not enabled, so we need to export it here
+    export CC_FLAGS_FTRACE
+  endif
 endif
 
 ifeq ($(CONFIG_KASAN_SW_TAGS), y)
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index bfe3ce9df197..aa3eaa91bf82 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -24,6 +24,16 @@
 #define FTRACE_PLT_IDX		0
 #define NR_FTRACE_PLTS		1
 
+#ifdef CONFIG_FUNCTION_METADATA
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+#define KFUNC_MD_DATA_OFFSET	(AARCH64_INSN_SIZE * 3)
+#else
+#define KFUNC_MD_DATA_OFFSET	AARCH64_INSN_SIZE
+#endif
+#define KFUNC_MD_INSN_SIZE	AARCH64_INSN_SIZE
+#define KFUNC_MD_INSN_OFFSET	KFUNC_MD_DATA_OFFSET
+#endif
+
 /*
  * Currently, gcc tends to save the link register after the local variables
  * on the stack. This causes the max stack tracer to report the function
@@ -216,6 +226,30 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 	 */
 	return !strcmp(sym + 8, name);
 }
+
+#ifdef CONFIG_FUNCTION_METADATA
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return !aarch64_insn_is_nop(*(u32 *)(ip - KFUNC_MD_INSN_OFFSET));
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*(u32 *)insn = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(u32 *)insn = aarch64_insn_gen_nop();
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	return aarch64_insn_patch_text_nosync(ip, *(u32 *)insn);
+}
+#endif
 #endif /* ifndef __ASSEMBLY__ */
 
 #ifndef __ASSEMBLY__
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index d7c0d023dfe5..4191ff0037f5 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -88,8 +88,10 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	 * to `BL <caller>`, which is at `addr + 4` bytes in either case.
 	 *
 	 */
-	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
-		return addr + AARCH64_INSN_SIZE;
+	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS)) {
+		addr += AARCH64_INSN_SIZE;
+		goto out;
+	}
 
 	/*
 	 * When using patchable-function-entry with pre-function NOPs, addr is
@@ -139,6 +141,13 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 
 	/* Skip the first NOP after function entry */
 	addr += AARCH64_INSN_SIZE;
+out:
+	if (IS_ENABLED(CONFIG_FUNCTION_METADATA)) {
+		if (IS_ENABLED(CONFIG_FUNCTION_ALIGNMENT_8B))
+			addr += 2 * AARCH64_INSN_SIZE;
+		else
+			addr += AARCH64_INSN_SIZE;
+	}
 
 	return addr;
 }
-- 
2.39.5


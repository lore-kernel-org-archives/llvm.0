Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB9E1E5701
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984966; cv=none; b=ciFaxDdPgQiP/EeF4D38eZK2do4T+4+wpfBA+V0h4awQcrJSE/hU2e2r+Moog8re1rVGd8fWDoY76a94LdjjBKXUrX42EFHxqUFHAcD6iBZmjCIrW2UMjWWcKZTl8ssMA9IeU7IocweKh9/gAi4REcOJiffkMTItkJKaNfI5R7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984966; c=relaxed/simple;
	bh=r1n1Uafjg9Tb7hAw9aZTOW4QZemIa+WVQ6XY0cn91Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AVv+LB20bW0XqYva+Z2tkgWlXz6baMT8T8KyF6AMn6WIpUIjxB/zxzCA0I9RzaNJYty+vIEUe8E6bfJbTuyft+W6QeprXdicgw8qYW2V+n/EDDSEmYu+BbeAFp8ZRN4xd118oyvoU9UQQCdrFtKzxWeESmHTQwStLEdffAJrqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8rUvxf2; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8rUvxf2"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fea8d8c322so7364843a91.2
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 22:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984964; x=1741589764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMU16H6izdRqPTzQSvNq/kwALVMPh8dWr5JstZVUeSQ=;
        b=f8rUvxf2Q/DO21e5cLr3Vkho5UICWjx8igZDfU6XhMgTK0lE9bTuaZ+9m2ZajWTUzE
         8xvSusdwrjT32X99K5ri1n+3npVNxDOEkCaPb5NsaSVTWJ47fY57BLw+vGLZC/cF6Pya
         NanWOY247AMnkzfTDp1SAA6K+NcY00vH2q6Sx2mNf2YsB3q9wcFVBKEcGI5ExFgsUaKP
         qMxT7U6tGafsEIt4otSpwpp2g8KGvxbctyE9m5+YuAub/yV4tuhLvcm7M7VdNHrhvoG8
         bkBNYsC8tgB4X172VDnv5q+yftDVnG9GrwJCewTNaf95/DhK8sSIrDztkVf+/qGwQeFe
         G4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984964; x=1741589764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMU16H6izdRqPTzQSvNq/kwALVMPh8dWr5JstZVUeSQ=;
        b=Q49bnOQ4yKqE+Q8x+7nav0QbhehKVXO39z/788FeK6Jc3p1Bl2FXVv392susNjjFmW
         pxMNQm3KElytXEHRdeAOXqr0jmK3kckGK06MMSKxan1UpIHyOMCH7mlHA5dLUgkLpomf
         UJl1emHreTvjQkb2CmQ0iKew6lj6xiOvbTFzcCTZVjjFo2ilwApTi+RwPVtRzpn3K9LP
         espcMnzrSdOoH7k9jrO2W3/2za46aMl+GTsn/DzJUlwORPqEdNWbOBwcMbH47Yhzurku
         DuWs5iNF6XZ7si6/YtYuhVxXCAr1V4xTFo9/8Q/czUuaaPqMBStj/XC99eIz8qnmEOvT
         vDog==
X-Forwarded-Encrypted: i=1; AJvYcCWxcs4Du2BwhA6ufkr3FRLaodQOnXSrhhY5BkGjuFBnvIsYRxCnxGA5JrTOBtWSbRvif1N8@lists.linux.dev
X-Gm-Message-State: AOJu0YzssZqn7cU0HhwOEAObElBYRu1hCYfdGjEqlb9bbaJhAFrNFhc+
	IHdxAcaW5CvTniofDFBNwEv6f7ngl9tZaNPpwed3wmrwqIwAVT4j
X-Gm-Gg: ASbGncvqUndQEgj38iqWgIMNxOv8bECXwiaiO2rq5jBZEPXlhzm+5cSx49bXpQbpvrO
	bOV/R+ZxUX/8VMaZ9FJ+Pa8GzExPA0zTsXQ150zeE0xSbxo78TGWTfEUQ8JeaIptgOX01kK8ck8
	/BLPpsqGqHzOOIicgV1EJz/zFLO3kj9vCq4bkosYQ8P9RDBelPuc7rYf0i740K09+Yr9vWXnQMm
	FgvIQLJ/m6klK9UyMlBU16cRCh5Kbzd+9zBBD3UGv0WOqMIM6BXpeLyhbgf3H4//zWAZ4H4e4vw
	qbaGpQ4imnmJLPgGjXxfeMSDNYVspTJeprSn97PQ2BEWVjgxcRrpYWvThujakA==
X-Google-Smtp-Source: AGHT+IGyBy5lAIgE9/BJFGPHKWL9IGQJbSt/AMZr+VvaZ6EhLBWcU/x/8umKGWf6iOEq1B7Odhyfkg==
X-Received: by 2002:a17:90b:1845:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2febab2ecbfmr20898385a91.7.1740984964540;
        Sun, 02 Mar 2025 22:56:04 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:56:04 -0800 (PST)
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
Subject: [PATCH bpf-next v3 3/4] x86: implement per-function metadata storage for x86
Date: Mon,  3 Mar 2025 14:53:44 +0800
Message-Id: <20250303065345.229298-4-dongml2@chinatelecom.cn>
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

With CONFIG_CALL_PADDING enabled, there will be 16-bytes padding space
before all the kernel functions. And some kernel features can use it,
such as MITIGATION_CALL_DEPTH_TRACKING, CFI_CLANG, FINEIBT, etc.

In my research, MITIGATION_CALL_DEPTH_TRACKING will consume the tail
9-bytes in the function padding, CFI_CLANG will consume the head 5-bytes,
and FINEIBT will consume all the 16 bytes if it is enabled. So there will
be no space for us if MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are
both enabled, or FINEIBT is enabled.

In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hold
a 4-bytes index. So we have following logic:

1. use the head 5-bytes if CFI_CLANG is not enabled
2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING and FINEIBT are
   not enabled
3. compile the kernel with FUNCTION_ALIGNMENT_32B otherwise

In the third case, we make the kernel function 32 bytes aligned, and there
will be 32 bytes padding before the functions. According to my testing,
the text size didn't increase on this case, which is weird.

With 16-bytes padding:

-rwxr-xr-x 1 401190688  x86-dev/vmlinux*
-rw-r--r-- 1    251068  x86-dev/vmlinux.a
-rw-r--r-- 1 851892992  x86-dev/vmlinux.o
-rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage

With 32-bytes padding:

-rwxr-xr-x 1 401318128 x86-dev/vmlinux*
-rw-r--r-- 1    251154 x86-dev/vmlinux.a
-rw-r--r-- 1 853636704 x86-dev/vmlinux.o
-rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage

The way I tested should be right, and this is a good news for us. On the
third case, the layout of the padding space will be like this if fineibt
is enabled:

__cfi_func:
	mov	--	5	-- cfi, not used anymore
	nop
	nop
	nop
	mov	--	5	-- function metadata
	nop
	nop
	nop
	fineibt	--	16	-- fineibt
func:
	nopw	--	4
	......

I tested the fineibt with "cfi=fineibt" cmdline, and it works well
together with FUNCTION_METADATA enabled. And I also tested the
performance of this function by setting metadata for all the kernel
function, and it consumes 0.7s for 70k+ functions, not bad :/

I can't find a machine that support IBT, so I didn't test the IBT. I'd
appreciate it if someone can do this testing for me :/

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v3:
- select FUNCTION_ALIGNMENT_32B on case3, instead of extra 5-bytes
---
 arch/x86/Kconfig              | 18 ++++++++++++
 arch/x86/include/asm/ftrace.h | 54 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be2c311f5118..fe5a98401135 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2509,6 +2509,24 @@ config PREFIX_SYMBOLS
 	def_bool y
 	depends on CALL_PADDING && !CFI_CLANG
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	depends on CC_HAS_ENTRY_PADDING && OBJTOOL
+	select CALL_PADDING
+	select FUNCTION_ALIGNMENT_32B if ((CFI_CLANG && CALL_THUNKS) || FINEIBT)
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding
+	  and consumes 5-bytes. FUNCTION_ALIGNMENT_32B will be selected if
+	  "(CFI_CLANG && CALL_THUNKS) || FINEIBT" to make sure there is
+	  enough available padding space for this function. However, it
+	  seems that the text size almost don't change, compare with
+	  FUNCTION_ALIGNMENT_16B.
+
 menuconfig CPU_MITIGATIONS
 	bool "Mitigations for CPU vulnerabilities"
 	default y
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index f9cb4d07df58..d5cbb8e18fd7 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -4,6 +4,28 @@
 
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_FUNCTION_METADATA
+#if (defined(CONFIG_CFI_CLANG) && defined(CONFIG_CALL_THUNKS)) || (defined(CONFIG_FINEIBT))
+  /* the CONFIG_FUNCTION_PADDING_BYTES is 32 in this case, use the
+   * range: [align + 8, align + 13].
+   */
+  #define KFUNC_MD_INSN_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES - 8)
+  #define KFUNC_MD_DATA_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES - 9)
+#else
+  #ifdef CONFIG_CFI_CLANG
+    /* use the space that CALL_THUNKS suppose to use */
+    #define KFUNC_MD_INSN_OFFSET	(5)
+    #define KFUNC_MD_DATA_OFFSET	(4)
+  #else
+    /* use the space that CFI_CLANG suppose to use */
+    #define KFUNC_MD_INSN_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES)
+    #define KFUNC_MD_DATA_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES - 1)
+  #endif
+#endif
+
+#define KFUNC_MD_INSN_SIZE		(5)
+#endif
+
 #ifdef CONFIG_FUNCTION_TRACER
 #ifndef CC_USING_FENTRY
 # error Compiler does not support fentry?
@@ -168,4 +190,36 @@ static inline bool arch_trace_is_compat_syscall(struct pt_regs *regs)
 #endif /* !COMPILE_OFFSETS */
 #endif /* !__ASSEMBLY__ */
 
+#if !defined(__ASSEMBLY__) && defined(CONFIG_FUNCTION_METADATA)
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return *(u8 *)(ip - KFUNC_MD_INSN_OFFSET) == 0xB8;
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*insn = 0xB8;
+	*(u32 *)(insn + 1) = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	text_poke(ip, insn, KFUNC_MD_INSN_SIZE);
+	text_poke_sync();
+	return 0;
+}
+
+#endif
+
 #endif /* _ASM_X86_FTRACE_H */
-- 
2.39.5


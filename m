Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BE21422D
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008655; cv=none; b=T2WtSFRExYC77RK++GlZaeiR7S0C24PifclNX+3qhK2Io/IInZ1l+pWJwXOkjzxNVXdJmpUxOdQYHDfo6M0opvhYVvlpTnRY5qDeN6wjEhvhFb6thaTV7su8tU6Miw7SoBAb4W7NN89A/k7GnYV4xTqeYg7hNC3eeRUjyYezlQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008655; c=relaxed/simple;
	bh=0opDRmJgFcne9MVvIB9mWH4N0ry/ocl2wUXCnUeZZWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=unuuv/WuzFJterWZ2+DY/X6rChPXNqFX/No/3wdqdXKMPGQmTEzXLonW0lJRsss0cxQFuS7S8oHIaXsUMeUX9a5GvWaES1mPrAQIROOId0WKsBKcAVscNuz9O3cB9L4eDRHP3WUPk1TxWg3zUroOCxabcpj3G/07lAQ7Sjl8vwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtnY5t0Q; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtnY5t0Q"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2234e5347e2so87558085ad.1
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008653; x=1741613453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0whn35vPm8J+vjBTbfA5u1AHwSTrw7swcARc6I++Hc=;
        b=BtnY5t0QwyXVMiEWGUYJS/NNdIiRadY8KmHTi0h9Lf+JsECjD4w2soEGtH639NDUIP
         MITv8/rFiJp9kSZ/xAjwsycz18bV4sMCU2bMHyJ11uJNxEc3+Pt0M2U3CxxdSp1cXM1w
         Vx8AdZ9bL4RGXggiTZNprGq2zri/zIQKgwBs0zuC6Fo8Y/qlHcs6aXwGZS2Ti1hNs7wB
         vMNTlStCc9z6uo1MD5K40W8dnJuwRl8ro/ytKmVxWXISMmRkfui7JhfqiHSxUFtnYACF
         kTL/g2Luri3+bdlmGAlkG3P3XO6op3JsdTDE+5LoDhXBpXwytlB7LS0Cw0YvZnbsOwdp
         bsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008653; x=1741613453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0whn35vPm8J+vjBTbfA5u1AHwSTrw7swcARc6I++Hc=;
        b=ZSErtwm4FiAEFQai/G/Mx3UohA+8vvHRCxE5W+9t4ENCxd9IhmCNIqfzjIg1eIqKpT
         MNbUMUYW+FATMelRZ8/OdjWD8SoOHGGp3Co7Dp8CCogNlP1h1/Iyx3lR1Gf9VTpCldZ2
         /g3uR/s+w2Lq+nZzV/2tEj5M+/lRypkvGtVpdVuWqHKpP4sKhvGJAVH79D5b/58kCmjD
         VthSKJIXPrQ9Xt9V7emqr+0qVG86zrZgGJ2tucECGkYDBF4e8IRescjGjkES9I+ALZ/H
         YEXw9niNvaTU69TtjXzraG1Y6HiQKuQmnVWWd1Xa0FNYme7kH0KbsY6iL6W76I0w6MoY
         fFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs2bK6E97k+TCvV/+vLPma3a8zs0P4x2Yr0+m+sP8YjEBuznfegLyUNI7J2ZCvSvQ2krR8@lists.linux.dev
X-Gm-Message-State: AOJu0YxfFP5QezCXKpbQWNBjd6ykvMyFja3URqZAaNKELTWH3d+oYXaX
	VU0tj6uEVJfzqCP8Kp8HbovWVjHLA8pLFH7C748nxisSbnpJS43R
X-Gm-Gg: ASbGncsQ9SXbUa/mrPbfalLClwjqTDIP2D8UlIa+UrJsWJ1pynAz2fSTcKujAWxiMNi
	foeuDhChXK3WMBO8hs+phrzMFrhD/ZGXiTSMYUn8BCcITsuV2Rinrulkqc4pkR3VjCpalg0uSRN
	fporkvGzwOGi6u0keJnlGe3O1GPej5tSSsdEnq2uCIyQkQ0g7FYF9Ik2pehBglQQcMAHsDMueFl
	Iz2zSb0qmJ+XpfBY0CJ28q4B3nlQAdiWkc1vCPN2swzo2BvnNXxxhaQqZyKJgYz13EYswzL+429
	Nk5blU8JHFa49ngjNrEOIKRI85W+ZMGuX5grTy7OM7LXNqQGIDUWhrm32iz4PQ==
X-Google-Smtp-Source: AGHT+IECVEaRvzz7jFgM9Xs6Qsz7AN1fGJ1Lrd2ZRMORcgHaHlhwWOyshFl83O3butQP+uNtOa6yXg==
X-Received: by 2002:a17:902:e5c5:b0:223:4bd6:3863 with SMTP id d9443c01a7336-22368f6a174mr217254605ad.10.1741008652539;
        Mon, 03 Mar 2025 05:30:52 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:52 -0800 (PST)
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
Subject: [PATCH v4 3/4] x86: implement per-function metadata storage for x86
Date: Mon,  3 Mar 2025 21:28:36 +0800
Message-Id: <20250303132837.498938-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303132837.498938-1-dongml2@chinatelecom.cn>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
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
index 5c277261507e..b0614188c80b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2518,6 +2518,24 @@ config PREFIX_SYMBOLS
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
index f2265246249a..700bb729e949 100644
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
@@ -156,4 +178,36 @@ static inline bool arch_trace_is_compat_syscall(struct pt_regs *regs)
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


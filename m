Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480285;
	b=kJL9/Bspsi7/G+pvUNd2P2qOF4cJcrjG22ffav+1ZgGVm/xoCzZY9b6437qZd7unuZ7k
	 7JWUGtDLFbUc2wopdeliZEIVJyYEOjDqq+oeh3XAMKksmMe7x9HWMornXYmJRmarHRVzu
	 00l4weFd6eKbzW6qfI/PXsARb9SMa5bK2rTZhFxNuTT3WFVL6gFgEGNqAOxoz6fyme1E9
	 iSO/nZydN16usuC7D0M+RBKnSVyXqq/2sbxZNpuc84AsxmdhKj6r0OgsjzdBqKkT5ycBk
	 tRG7dihObugC1urWSxzuX4xK1t/wAbTJNkWDRgJKVOXPQl0O+YyT6Q3rmLeO7crar5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
	b=Wyu2U+snUYZS+QoSNUnkOTJI/WPyUtVcX/KLbfdnANqRaK7gJrSertonlmJkq2hTi5Mw
	 PLHQ5xaZkkOGjzDTlN4yuG2rYVeLCmAbBZ+erzlQHAqZWIxdyGCEuLVsWfR08yjZ4EZ79
	 /Y5l3K3/JpNl40zUSxwNJN6xtDtWkvTKw9FFnY3cKQczb8jgcteI3qH4OHRM0sm+FLzef
	 Z6Wy3kswO5xRFNJYN91iLTvMTakPIb8m5YkbC0aGCIB7cPF+lzYKTeNq9YoDGX+TsRKbB
	 LuACFq0hdK1pQSRtgrZ1ykDt6dLc2UVfdTtnBlqiy86WRwQV5NGkCIyxCrCK4tsurtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dfw2zbaA;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B9B606A327
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B9B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dfw2zbaA
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3712b6d9843so3999381eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480285; x=1795085085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=dfw2zbaAB3f+OiXYNEr7sfalbAGe2ik8rWoEf+hjsHbvJvOLUfr50oUeVa7nZNaT3P
         2h7oNtaKVHZKUdOy8k8ENBqR3Gpb+P5aroHmL8O+J4Xatpfg2OaRfjkChHJBc6mJT2aA
         bYJPMO9QJv2ixqlXqeTSdoO2Ho4mZ4/uG29pTfZ9Q3+JNqcyrGbsUikZPQLdmhad68SP
         414eHOZTJkBOa3jQABt9EGwgLLx7tB0AmDz9Xh7hIpYVhKjqlPMBBqS3Xi8GxpDarsZx
         sxO/mppibVZze8IdiU4c/pg47KMAaVM8XB75t2Cg9LHuCPmQ7qzoacg4+QErE9beUpMY
         ZJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480285; x=1795085085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=TZUv3gaJ89ifgmy7rI7xGpZUh5q1P5sDvHYgA+fQlAZHTvpeOACqMbA7osEtJ97idz
         MVoPU8Nu0kNwSL5us6cwuGZJyEQDGOVYFu+JCx0RQgclyFDjq/K6JPBOMIkvJNT0qbjh
         7dzn1iaeDBcKZP7/eLtSflUOzPyuV+26jpZgeGVclBSfyTkTRNNBfoeCUX42xiYqd9rx
         34RSfBGJBSa6VF2ftaaTZoGAZSiAVit5D9O8b8Ib6Pv98+r8P6dPYnOfHarHzb71k8f7
         qNj986r4z2S02IKK7Ex84mpLYOTLfGQp8lig7Huk+7RKu4lfoqNiM7GyXAgIRhVCkk45
         JyaA==
X-Forwarded-Encrypted: i=1; AL+hErE/Nl7H9m+2ToZsbGoWkirUTqA9MEBuRZASufHWEv/PTxu5TkoFmKTGT5EqIedZds6CVfa1@lists.linux.dev
X-Gm-Message-State: APuU4Z+TsEVvr6eQm7zos7r8Ewwzzs5YfArg7L/xOlnCZ5NzIrl0hBCJ
	7kvQMdOgUiIn6Jk2tb8ZZAlfCr3XQukeExFgbTY2uwThJzND+ki2SnD1CVdBMhRxMb0=
X-Gm-Gg: AYBFou2XQ+Ph8SLRxBC0zXyM8NQQ69X/lsedHi1MrfgFLYzjl4KDNG1oKclTCSn3Jgp
	1O1oAZ5DnRDeah8hSYZVc964cQh5a6twtMDBcBEiGnmmWXfgyADFAowyuikPB8+5Polcd79dJMD
	qyA7WM4FfNAem5/Git//NyC9XqHPgd631Rbw2xxFRHft2DbkmMIfE3O/0CFiDxElSK3PgHyDOzT
	2Wj+cH2M+aIl2hLCaFojFaX7Yu8KCbEPq74UZ9VYV/u6Wl7kqPyP6XUaK3zEC9xBvmoKUVA0t1o
	GafoX71IBX2R27U8uX52K9jc/+Ifr9cZZnfdXP7dMmp6bLDdQIJk5/Z5yfzbElYD0wlTfR35ot6
	6MGpN7p3WL5a11Y5AlWKDEpDt1+op6Y40i7LsmV5IVxEPCDRU+tTEo4IO1zLQTKLbiB5W5x4xYt
	zDYpK6X38CsZqoYpMjGGLlnkv3Q5OfVeFnohfXhKEnCa/pn9Mbgk1HmPz5vuuInRnNpZFaI4UAy
	xbJ8tbRbkBLBUFXjxkfS0gEjQd2B3voLtlo50x6+rCXujElb9jAM6kyyLruTAoTC59oEaEIDIKj
	4ecemSG78okhUdt5jsRVoJp/X/snU6iKoJLVm1e/lR/rECmuelr7jWbnpmxUP8aDDqY=
X-Received: by 2002:a05:693c:6381:10b0:378:a35b:9e1c with SMTP id 5a478bee46e88-378a35b9e83mr512290eec.37.1794480284232;
        Thu, 12 Nov 2026 02:44:44 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:43 -0800 (PST)
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
Subject: [PATCH v10 7/9] riscv: implement preemptible this_cpu cmpxchg operations
Date: Thu, 12 Nov 2026 18:41:47 +0800
Message-Id: <20261112104149.38589-8-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to compare-and-exchange
operations. Providing this_cpu_cmpxchg() also allows asm-generic to derive
this_cpu_try_cmpxchg().

Use Zacas where available and LR/SC otherwise. Keep masked subword operands
XLEN-wide so RV64 LR.W sign extension does not affect the comparison, and
use typed helpers to separate asm-generic from the architecture cmpxchg
macro expansion.

Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 140 ++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 810f4c5eaa508..4d2fc10cbdab1 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -401,6 +401,123 @@ __percpu_xchg_case_##sz(void __percpu *pcp, unsigned long val)		\
 
 __PERCPU_8_16_XCHG_CASE(8, .b)
 __PERCPU_8_16_XCHG_CASE(16, .h)
+
+#define __PERCPU_CMPXCHG_CASE(sz, lr_sfx, sc_sfx, cas_sfx)		\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const long cmp = (long)(s##sz)(u##sz)old;			\
+	unsigned long rc;						\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas\n"			\
+			"amocas" #cas_sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr" #lr_sfx " %[ret], 0(%[addr])\n"		\
+			"bne %[ret], %[old], 1f\n"			\
+			"sc" #sc_sfx " %[rc], %[new], 0(%[addr])\n"	\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret), [rc] "=&r" (rc)		\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [old] "r" (cmp),		\
+			  [new] "r" ((u##sz)new)			\
+			: "memory");					\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_CMPXCHG_CASE(32, .w, .w, .w)
+#ifdef CONFIG_64BIT
+__PERCPU_CMPXCHG_CASE(64, .d, .d, .d)
+#endif
+
+/*
+ * Use XLEN-wide masks to clear the upper bits of an RV64 sign-extended
+ * LR.W result before comparing a high byte or halfword.
+ */
+#define __PERCPU_8_16_CMPXCHG_CASE(sz, sfx)				\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);		\
+	const unsigned long field_mask = PERCPU_8_16_GET_MASK(sz);	\
+	const unsigned long mask = field_mask << shift;			\
+	const unsigned long old_field = (old & field_mask) << shift;	\
+	const unsigned long new_field = (new & field_mask) << shift;	\
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);		\
+	unsigned long ret32, tmp, rc;					\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&	\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas, +zabha\n"		\
+			"amocas" #sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr.w %[ret], 0(%[addr])\n"			\
+			"and %[tmp], %[ret], %[mask]\n"			\
+			"bne %[tmp], %[old], 1f\n"			\
+			"and %[tmp], %[ret], %[inv_mask]\n"		\
+			"or %[tmp], %[tmp], %[new]\n"			\
+			"sc.w %[rc], %[tmp], 0(%[addr])\n"		\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret32), [tmp] "=&r" (tmp),	\
+			  [rc] "=&r" (rc)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp32), [mask] "r" (mask),		\
+			  [old] "r" (old_field),			\
+			  [new] "r" (new_field),			\
+			  [inv_mask] "r" (~mask)			\
+			: "memory");					\
+									\
+		ret = (ret32 & mask) >> shift;				\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_8_16_CMPXCHG_CASE(8, .b)
+__PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -421,6 +538,15 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 					     (unsigned long)(val));	\
 })
 
+#define _pcp_wrap_cmpxchg(op, pcp, old, new)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr,			\
+					     (unsigned long)(old),	\
+					     (unsigned long)(new));	\
+})
+
 #define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
@@ -480,11 +606,25 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 #define this_cpu_xchg_8(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
 #endif
 
+#define this_cpu_cmpxchg_1(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_8, pcp, o, n)
+#define this_cpu_cmpxchg_2(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_16, pcp, o, n)
+#define this_cpu_cmpxchg_4(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_32, pcp, o, n)
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_64, pcp, o, n)
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
 #undef __PERCPU_XCHG_AMO_CASE
 #undef __PERCPU_8_16_XCHG_CASE
+#undef __PERCPU_CMPXCHG_CASE
+#undef __PERCPU_8_16_CMPXCHG_CASE
 #undef PERCPU_8_16_GET_SHIFT
 #undef PERCPU_8_16_GET_MASK
 #undef PERCPU_8_16_GET_PCP32
-- 
2.39.5


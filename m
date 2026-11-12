Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480267;
	b=nDAkUa8GmZpREeDR53XCXX9dgALxJWRSaMidMuZWnLVjh3JcL8Ib2uQge1XLGBT4OkF+
	 gSbnvhalGAPo73hhU7wDV6wwiwZ7SGkbOycdvevNpOPmO7F5FEUHbyuvwVvhRRKY6/9xW
	 Ixg43Zq6oyD6pr6RYpusdIgzhYp60H50MirFLtj3h91meLEVuwvEhhA0W5bpG+IU46ccX
	 cwCTbHOe6kYwsYk4AXGdZl7XzEY28gPmBHaI7F0+FO0ZXc6/ih1dn50Q1ztxfvAcrVf1+
	 RoYUJYh3J731g+I/bYoRB6CI6PaeYE+g2+rj3ON4cVzVb0p/Rh4u9XCBXhnfR7S33jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c+0NQhm/2dySRhzukgerkWXzp7x9hEGESn4jnFASt64=;
	b=Dzmx6jtJMdOZq3HsnyE4ST7N306DWvJ1Rruw8WgVQppcLQsj+MNSsMyBd3C7Qh7lhh4j
	 LqH8azEcGwMlid0jS/VZd/7aLt1vG+jKI/1CAJmQxID3wspSExfJ82yaH4j1OqOfVnUxS
	 /oxELb4TbLnJLXleilja+kFy3ZbDbY9RSlKlGkTBz0ggLtNaSeeEpFwaItb0cX+1znbdV
	 yVSlEi40LKA9NWW6hu2tSysvd9bAh4RiTQg3ntzc/nO+3bT/ew49hoV+l9QNl1Dg01Fx8
	 JwqzOUWvb81vKvl4E0jteauk9IgOcp/dZKmoD4dpdd2yUmDv6F/yaUF/LhLQnDvZ5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Y6Ru+UYn;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FA606A323
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Y6Ru+UYn
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so6189924eec.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480265; x=1795085065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c+0NQhm/2dySRhzukgerkWXzp7x9hEGESn4jnFASt64=;
        b=Y6Ru+UYn/EKKAuPxPMtfBrYEzb+vTdp9o7tZFI1xDgywdPDsa00LzK+BqjDCFcZEJv
         QwJ95xQex+vknRCBUHz2eRoUyaGTGjYTH2oyyMfJmKcHu3PfNA4GikJdOWXZ+wlittkv
         55/xKhcKpxTf3R5tvohIYw2hpr8VG+gbb9U9pyAa1s+rXGTkVUlrfTomQwy79imH5GwF
         LltgkVu8p/F1gefzEdBTqDf5lwU5BUyaxGNr8E66DzF+d31zsmdJC4iRsS+fu7SwbKh9
         UUDQCg+ibqPiqhuJG5YY94+ebCYrn2Aad8wWAJGfmLViDvOe2k2cKtd9xJljEu4dIGN+
         Jdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480265; x=1795085065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c+0NQhm/2dySRhzukgerkWXzp7x9hEGESn4jnFASt64=;
        b=dEIFnY4JUVCwElBL16DtXmDMw7SRuNHTiPqw/yDkiundi6Ehvr+aBwVoWUNRqMIvt/
         kVsgbs/oRfKT1HYVTqazcFhvBqIpRtW4KYAuRncZ83GY+tp+vfAyLI8+VaMBf6oF3fv5
         JwjpsUd7DAy7XL/2kic78CpesLJRRBqpq3Lc5sG+J6e82ZUyGaiyvPl9bs5kGupdj74A
         IhMCI4NgR7K3bCB3tQOSyni3tg9sG7jcEy1i6RHpYZ3wDHGPaDnE6PDAJdsX7GAhKqPX
         Ivj+22K7u9UHpF4Y9epLeG2Uge3Q1zl+Zp2XEidudcR5vgaODoPZSJru4z2R0C8CMZHV
         rsCQ==
X-Forwarded-Encrypted: i=1; AL+hErE1kngkxDQZRm06KafmnG9XrUsLbcxw1TfDejryZT45FSjyqbvc98G8Ft8wVbaanCtxo8nB@lists.linux.dev
X-Gm-Message-State: APuU4Z/DoaotCWQzsgfSMRcnu8PBKQS5NTPgH7MDDBWg0+Z1d0WtJ59J
	/xYzeewBiF/eDLNdInk95BBGtNL+wJTbLJTUpFISAH9k8ErD6a4+hRS03QVKT9Xn9L8=
X-Gm-Gg: AYBFou18I2yGWkiG8mcT50nys1nRQBxvS7uke9+l38VD8bzZP8DrGc/+p1ZobxTiNgl
	B4VegoWV17wYLtv0MoMDWsxs8NIXW2yuffNvPuK1sluRIfgr623JFOY85J46eRUlhUaSsUSfLN0
	HVpeRLCZyldyloXWCLUfhjc5j5kRl60+BsPzTWvIcbQNNgnyVAEGo2wph25vrm+e6IGkbkLASY5
	AJsYSN3V6MmC7shnOEXXBenOznE/8Ta6YNFa8AEfjMooCGdVUdt3rGpJ4emcRTBa9iZBKtiHXzp
	i+eUKOjkJdoH6AdTrJccl+CMjyDqC2I2SBj9oFXHfZg37hysFy2o6Ur+yDIIqszB/0ttVhtLqDa
	grOy980tPzk9Z4CJ+s/tlDH1cZvR0uG/qjz7H7q0I67gLVKJ9Jb5INFO2IU+cXlpuaihwTE4wG5
	PJ1yLkbco8jLgKsCCMJRkh+i0W4rTTG2yreRg7hs7ObiT1woSkXUKuSwzG6z3sxTDaMlX1rhS+C
	cGX39OEG1rduhwpIswvrxyzCW3VyEfm1xKu9nTU87J3JeD+MbFe+33mc44fOrRsS7/INYfXn1NU
	BRjTqsbbwH7013lV8aojiwnlCLx7Y4lYB7+gNZ03SkKIksOWW8raAqmwPLsuzR+VfwD+NqAHHBX
	wGw8zld7b9wKt
X-Received: by 2002:a05:693c:4007:b0:369:f420:8679 with SMTP id 5a478bee46e88-37687211c14mr5675144eec.38.1794480264921;
        Thu, 12 Nov 2026 02:44:24 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:24 -0800 (PST)
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
Subject: [PATCH v10 6/9] riscv: implement preemptible this_cpu xchg operations
Date: Thu, 12 Nov 2026 18:41:46 +0800
Message-Id: <20261112104149.38589-7-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to exchange operations.

Use AMOSWAP for native-width and Zabha subword operations. Where Zabha is
unavailable, use a masked LR/SC sequence that preserves neighboring fields
in the same word.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 9ff02f3811550..810f4c5eaa508 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -326,6 +326,81 @@ __percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
 	return __percpu_add_return_8_16(pcp, val, 16);
 }
 
+#define __PERCPU_XCHG_AMO_CASE(sfx, sz)					\
+static __always_inline unsigned long					\
+__percpu_xchg_case_##sz(void __percpu *pcp, unsigned long val)		\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	u##sz ret;							\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		"amoswap" #sfx " %[ret], %[val], 0(%[addr])\n"		\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),		\
+		  [ret] "=&r" (ret)					\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp), [val] "r" ((u##sz)val)		\
+		: "memory");						\
+									\
+	return ret;							\
+}
+
+__PERCPU_XCHG_AMO_CASE(.w, 32)
+#ifdef CONFIG_64BIT
+__PERCPU_XCHG_AMO_CASE(.d, 64)
+#endif
+
+#define __PERCPU_8_16_XCHG_CASE(sz, sfx)				\
+static __always_inline unsigned long					\
+__percpu_xchg_case_##sz(void __percpu *pcp, unsigned long val)		\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const u32 field_mask = PERCPU_8_16_GET_MASK(sz);		\
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);		\
+	const u32 mask = field_mask << shift;				\
+	const u32 new_field = (val & field_mask) << shift;		\
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);		\
+	u32 old, new, rc;						\
+	u##sz ret;							\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zabha\n"			\
+			"amoswap" #sfx " %[ret], %[val], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [val] "r" ((u##sz)val)	\
+			: "memory");					\
+		return ret;						\
+	}								\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		"0: lr.w %[old], 0(%[addr])\n"				\
+		"and %[new], %[old], %[inv_mask]\n"			\
+		"or %[new], %[new], %[new_field]\n"			\
+		"sc.w %[rc], %[new], 0(%[addr])\n"			\
+		"bnez %[rc], 0b\n"					\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),		\
+		  [old] "=&r" (old), [new] "=&r" (new), [rc] "=&r" (rc)	\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp32), [inv_mask] "r" (~mask),		\
+		  [new_field] "r" (new_field)				\
+		: "memory");						\
+									\
+	return (old & mask) >> shift;					\
+}
+
+__PERCPU_8_16_XCHG_CASE(8, .b)
+__PERCPU_8_16_XCHG_CASE(16, .h)
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -338,6 +413,14 @@ __percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
 	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr, ##args);		\
 })
 
+#define _pcp_wrap_xchg(op, pcp, val)					\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr,			\
+					     (unsigned long)(val));	\
+})
+
 #define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
@@ -390,9 +473,18 @@ __percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
 	_pcp_wrap_return(__percpu_add_return_amo_case_64, pcp, val)
 #endif
 
+#define this_cpu_xchg_1(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_8, pcp, val)
+#define this_cpu_xchg_2(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_16, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_32, pcp, val)
+#ifdef CONFIG_64BIT
+#define this_cpu_xchg_8(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
+#undef __PERCPU_XCHG_AMO_CASE
+#undef __PERCPU_8_16_XCHG_CASE
 #undef PERCPU_8_16_GET_SHIFT
 #undef PERCPU_8_16_GET_MASK
 #undef PERCPU_8_16_GET_PCP32
-- 
2.39.5


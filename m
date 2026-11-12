Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480246;
	b=Ww59cj51nf+97aD0sjW2wQICa36iQkYPn31vFu3oZAF8C8POjURwsOUbF2VvEvhg9yOK
	 yDq8b9JiczFg11ZSrld+1BvYdsrDvheCCRP6xr1CAM1LFvINGhzu6BZIBw99p+10j6tEn
	 7VDMh19v6nLOHJEFrvkEyWzHgDmL8tuNenoAGnjumXUvxxtDADC3dPumn0Lv/5SUcj61F
	 JppWJE+opd7iXzg58zVesMwpCQoSBX1Vy/k4yTn4QB418M3WJpbUSAQ5HKNuAEX3rKuZM
	 tLZqI6QZc1iNluo8WqsJoVms8k0pAMku0/n1EzPq4DBEPHg1QhkKrGQmIozHImCKFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
	b=c51Dpj8PW8tFSEXpKhtXNs58Haq0HNayva7eoeJwPltQinlpeTEnQ/IH7aWZEzjMjr4W
	 4bBiMK85ZVuHNKBw7gkzmv272I8h5GjUgsD4MTDeWjnq6rbrS+qOt0TzZDyHFNQsywwsc
	 1c2IqMY29YzsLgXH319DWYeBNxPv6aTDp9o60IEDihUsHcJNT2BT3SDfzgfLxgHnTjh/j
	 c/T2tkTrYG4OMRyEgUa2lKFySh64/0sBhekaaudSuKG+1vbOp1ywMONkbPhqzBAEsA4m0
	 oB7YLw8OwFrhQUh1Xiuf0iTsVgOqa+dy5bx6qStsWzglYyz9HdpbLXqobJmZc0cLV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EoMd7B+n;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A8606A32D
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6A8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EoMd7B+n
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso4156523eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480245; x=1795085045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=EoMd7B+n5sd2I5l5VL7u4NlBsnVOSI0rgcdRfAs4dVgfX0o8oiwx1mOF6fde4dN4zO
         9TEIrMJWgEICTZsUxFEjiU63bzLyiR5Fh1Z1YwI24hipb6rQ2s5RcUAKkj/G7ttx4rd3
         CwjiOYORo//t1vI+n/rxIZLx5ghiXawpdWu+xMTJPwDIqgyZZw7Wtd8IbvInzf9VOGJ4
         gRIwfxknVhjRIqqlrNOj/HeWYPJxGY7DDlGC7Tu4AqDVQwuCq1bA2zshRjYndzjSjHV/
         NAjHUhlv+ByN/fEhYMnDAULr43lGiB8Mxn8V9mYU9BKmOF80oKgb37XAL1BMGtN/aQRc
         vVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480245; x=1795085045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=i7yHynvbUm5vdiIm+1L9SvFI3patZFi3WwsSdjiSVLdKYjOsxZY7yhVTDCXSOy5sY/
         7oxI7QO1uJvbciAdc7BKqLXQ6EhA7Y+DMeRse+tFIA/3ey5aeXE+y4g0ZYSz7bVo4Qg+
         /V3oGFdwAM2GcPMWYLjOsdZq7yQE243AgYi0stb9Imal3GLj0qSkX2T0+NBtkB8Vx5lc
         dfMzUVbOF6dy+sYVM5hYkJlavcMJ6gmo9/kVtwWkYRhxs+DvXd3xp40qk+rlxVdcb46n
         a6hb+V6LdneH69bBlPXhJ4qsdRvHR/5OFuw37gW97+pyMjqA4SwQJDl1invlJ1Noccf3
         O9xg==
X-Forwarded-Encrypted: i=1; AL+hErHVUQeXH4kdCydL3PE5WpPOrh+/xyqMKwaUqjnsTbAXjyCS3NpWp9Mn9kMbruXnLLDY0YXi@lists.linux.dev
X-Gm-Message-State: APuU4Z9eMt2XleK+KQdm6uJ9yjb6UGigNl6mslgNaza+/leEWayQ6LWr
	AsdDU/wz5N4dtZr0bat33mX+Pt05Ka0VrbFkhZl6NLNeuSvbQ/rTAOUIPBsPFzSkoyA=
X-Gm-Gg: AYBFou2DuSizAZteCYIoGlUKM3Vuqlq+jhuFHKOH1rSfIwLvDIER3eRkql3qh1Q+J/F
	N96Wpy93cK+5uPcRO4OH8up5LMMDNRnnjeLckPzRD4HiLOBDNOwj7fdITjSdJtIyqi/jbusiz4D
	L3e7Mj0oAaQkuH1X3w8ex+LW2NOeD7K084L6d5ljHp+0okvyjwQImNrho+j3lG5Po4RN+VhBrnG
	p7lq/OauiFfTDDRxaBROoVRkE5NcQcRWIC9bu4BiFnJbgEZRoc8wNtTKeZ9fFtRfvcHTiUB1KFe
	g+HkGkGd+gmj4n2FK9JRyynkl2cWsVDA8xsNl4kkTzYp9919xB9ORgFVV0gYuOSPwD+VRNRFRqa
	zJ1EQdJI8ASyNKvDI21UrCmtgTF3Jk9zTDqNFA4XzK0+YpGCDQywIuvsDvRYWH3xicNCJ5L5n8u
	0RtlQCX1FnuwkVR8MO/r0IZoeEUZPs+vr7GcYWXyGbcY4sf4O0Kl86BsEQQX4ebRBbzHbhVy3SL
	jafNMwHloyVb95hTOITm+8sWI5bJ4vAcOfxSADKm17oIrL/uE5Vr3egrErZ67wdCTvI76/kRz0M
	zTU1Qnbey+HOeE1dwbNFM88OBYDMbx1X50sdx2rxjpes25BbRFJ/KgUzjMpENdgyvYM=
X-Received: by 2002:a05:7301:d80b:b0:375:370e:f1ff with SMTP id 5a478bee46e88-37687214128mr6314130eec.35.1794480245214;
        Thu, 12 Nov 2026 02:44:05 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:04 -0800 (PST)
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
Subject: [PATCH v10 5/9] riscv: implement preemptible this_cpu add_return operations
Date: Thu, 12 Nov 2026 18:41:45 +0800
Message-Id: <20261112104149.38589-6-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to add-return operations.

Native-width AMOs return the old value, so derive the new value required
by the percpu API from the operand. Use Zabha for subword operations when
available, or a masked LR/SC sequence that returns the updated field.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 46eafa1ef02a1..9ff02f3811550 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -203,6 +203,129 @@ __PERCPU_8_16_OP_CASE(and, 16, .h, and, "and")
 __PERCPU_8_16_OP_CASE(or, 8, .b, or, "or")
 __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 
+static __always_inline u32
+__percpu_add_return_amo_case_32(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u32 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.w %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u32)val)
+		: "memory");
+
+	return ret + (u32)val;
+}
+
+#ifdef CONFIG_64BIT
+static __always_inline u64
+__percpu_add_return_amo_case_64(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u64 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.d %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u64)val)
+		: "memory");
+
+	return ret + (u64)val;
+}
+#endif
+
+static __always_inline unsigned long
+__percpu_add_return_8_16(void __percpu *pcp, unsigned long val,
+			 unsigned int bits)
+{
+	__PCPU_OP_CONTEXT();
+	const u32 field_mask = GENMASK(bits - 1, 0);
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);
+	const u32 mask = field_mask << shift;
+	const u32 val_trunc = val & field_mask;
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);
+	u32 old, new, field;
+	unsigned long ret;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		if (bits == 8) {
+			asm volatile (__PCPU_GPRS_BEGIN
+				".option push\n"
+				".option arch, +zabha\n"
+				"amoadd.b %[ret], %[val], 0(%[addr])\n"
+				".option pop\n"
+				__PCPU_GPRS_END
+				: [gprs] "=m" (__ti->pcpu_gprs),
+				  [off] "=&r" (__off), [addr] "=&r" (__addr),
+				  [ret] "=&r" (ret)
+				: [pcpu_offset] "m" (__ti->pcpu_offset),
+				  [pcp] "r" (pcp), [val] "r" ((u8)val)
+				: "memory");
+			return (u8)(ret + val);
+		}
+
+		asm volatile (__PCPU_GPRS_BEGIN
+			".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[ret], %[val], 0(%[addr])\n"
+			".option pop\n"
+			__PCPU_GPRS_END
+			: [gprs] "=m" (__ti->pcpu_gprs),
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),
+			  [ret] "=&r" (ret)
+			: [pcpu_offset] "m" (__ti->pcpu_offset),
+			  [pcp] "r" (pcp), [val] "r" ((u16)val)
+			: "memory");
+		return (u16)(ret + val);
+	}
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"0: lr.w %[old], 0(%[addr])\n"
+		"and %[field], %[old], %[mask]\n"
+		"srl %[field], %[field], %[shift]\n"
+		"add %[field], %[field], %[val]\n"
+		"and %[field], %[field], %[field_mask]\n"
+		"sll %[field], %[field], %[shift]\n"
+		"and %[new], %[old], %[inv_mask]\n"
+		"or %[new], %[new], %[field]\n"
+		"sc.w %[new], %[new], 0(%[addr])\n"
+		"bnez %[new], 0b\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old] "=&r" (old), [new] "=&r" (new),
+		  [field] "=&r" (field)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp32), [mask] "r" (mask),
+		  [shift] "r" (shift), [val] "r" (val_trunc),
+		  [field_mask] "r" (field_mask), [inv_mask] "r" (~mask)
+		: "memory");
+
+	return field >> shift;
+}
+
+static __always_inline u8
+__percpu_add_return_amo_case_8(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 8);
+}
+
+static __always_inline u16
+__percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 16);
+}
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -256,6 +379,17 @@ __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 #define this_cpu_or_8(pcp, val)		_pcp_wrap(__percpu_or_amo_case_64, pcp, val)
 #endif
 
+#define this_cpu_add_return_1(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_8, pcp, val)
+#define this_cpu_add_return_2(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_16, pcp, val)
+#define this_cpu_add_return_4(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_32, pcp, val)
+#ifdef CONFIG_64BIT
+#define this_cpu_add_return_8(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_64, pcp, val)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5


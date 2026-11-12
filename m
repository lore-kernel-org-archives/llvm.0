Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480305;
	b=LN7YsJIUsMIjE3yOlwAPt1tvRQq0a5tq2Drml7SW8Cx3EVzc12b2XPB937+qitouMUGM
	 QjSPuDlG2oPT0BZLjkinHlhIhDyIrb1UsdKDLL/I2NfpWwextifX49BYCkyQyNpWo8n7d
	 fxaiHRCW/zdVoyYdWNDC6N00X/HcKEGWyx8ReN7pS4yRmC8G4x2davsixLWcIyMTMSQNt
	 ZgPyrZJynbMCm/BtWaStJKqTo+fP6IZk6JcoGUFjB29J8f6FcjvjJLvOGdlvyoI8DDWZ1
	 AzG/o/O3zcgnlXstGhzAVkgDZYuVoZGQGNeSjlaWKaNFr+C2pZKGMoYqJuOb8PnPzGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
	b=VJgm0hXN/pYZxIs1mSG3rFMlqIon+OpNqzl6UFrXnltT1J6FCZOI4ZAx1KcJlBdXDNY8
	 iX8UaiA6BPgW4EX5lOltcEZV2LRasTFFRKE4iH2f5A8tNFv0wWz09l9xz02QcE6qubEEM
	 Aqy+ZSbE//jIbSRZ80QLwEiBLjQfLp5vmf5/TTbqB5QT4Yua7OyhoVNRTwlgIxFPEFHOW
	 nrXOx4N4EVZfRRMMSrNZBFrm3UNgJwNc4kZYAKIAbtBcXUhAc20QvkarqOOr44TiLz3R3
	 XuwGkJ6m2dH8CN5iN6QM+8Fwd/tco0G7f8qb4YB1gqAI57jMm16xXUt0xiWjZo0JHJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="MEDI/eKq";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E59606A321
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MEDI/eKq
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so6810574c88.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480304; x=1795085104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=MEDI/eKqQLMtNEbg8EaFI6La0VCasGnkYnypfPABgQR3lTbF+wYkXlbB+LxHXlT7/j
         F3PfzORJjBz/Wku87qFzrYnMT35T+Ue/3W4dY8+BRociKm1sYPLuVQDzZ7BsqOfZX5Mg
         /NnmbPD3Ap2LoXpaA3K3iAXIwTMxkBFGINiCE6pwRI/6kO/qW+MYKpFPW7nP+cUiY+mb
         SNPRifgq3rdggif/iaetoFmi6BNTsH1pPYjPN/H3K7BNvj7aj5RLTdF7ZPI07E7DicTM
         Rg1JPRrbCJfX4Vple2tz/dtsJLMTR3+NN2Zc8JixRGcNvBi/dKrQL4oMZBzMe4uyhR6z
         QrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480304; x=1795085104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=1UyUe5f2AU92oB+Xv+tgd4K4CJWwLJEIW0L8mHNzSfupxtsfQ+Om08nVdJeILjc3uP
         CmvvPIqpvQllkfjyFzT5tBJUSQh9PT66mEhKOrl8ANpSNd1m83txZwt650ZZor6D+3TX
         aDjagp79d8yEz4vtC2X249DmbwP6HgLlJKPGhhq5EWQLFTa+zEwGTAguvxA9UIGMm6N2
         NDL/lHUD5McVuYgqZ1RfgMfbUQ5md7V9iAjyZsDojabIdsyMWvMqPTBJPNo52jUXTbrL
         8/OO9xPZE+cGv/OwGEfKXkQwUo2MaoZbAYFU03PH1gCEaY128LSM7H6IUHmQJk2xmWZQ
         ziiw==
X-Forwarded-Encrypted: i=1; AL+hErGfAdTGpFQvCKdKeoYQ4/Xa+AVnUi90eEyaxoPfrzUd6rBCfZqcsiHXsMQdse3sYtkngAya@lists.linux.dev
X-Gm-Message-State: APuU4Z+81hkGaBbAlNWbeUyWtOqvMJ8nFKGYpDhREyJHHUFGLFQTN2CD
	lQ73vUGtGlY7UJ3tcGE/GHDICCvKmhYBBH7z+VZMl4ai370dKmy35QNtO5sF/rehSTg=
X-Gm-Gg: AYBFou0AsTZxTn+dS4cFT7cVt4foBwg6mddrznKXCpNhRSvntKjmnlK3YzcV/1F/yEz
	girL6TxwVNE/q6xShQ8mIqtuzX9rOQpaYxNqIN5eHPD7b0iM00c4PeJ7YxNgJHlKsI+rEdUZjVr
	nM7zx/xAe9oefF7b+UItIn97nbYoedsauzqkhsjN0Wd4vBn8Ps7xEqyj58OufUEgYSfbWUWG4/E
	BBPk3rEhMqc96N4q87EozDO3mU1i8IYGlqKJgDQWUvfOHusKz/qEDtX4IaqL4gEYaG0BkkgCPQl
	KfTBla3hfXdUkeoqXAG+R+/qwq7wCdAImB6Z5Kj82Eh6Szhsg1WtSTPOxVfbINi5b4rAzYj1gRU
	AFX9zEuoZxeMz+Y9Pd77YF1W6lqhswrJr14aZWQWHyjQ1Dd4OMm7FoOqSqiQaJjUM1Y7XZtWhhd
	7ivKmsEfdbnKII3YYFmXTdTS4ReDRi5Z2rRliaFGADpdaHkJjXAuC67Ug7l7TIq3RielPjyb66l
	JBWIqh97BGOfbOZmvZ/9C//qQV9vxLrB//WoD/fnYQtVFJdpnUK3lz3sPl7/OhlxXHCDVBRhM7W
	uJLBIO5f0hSaF+DuXGB/DKU/FewcT9j1gvsO+bJCuQBBZ7KZkLMloqgqV5yZuye5Qac=
X-Received: by 2002:a05:701a:ca05:b0:166:5552:780a with SMTP id a92af1059eb24-1b3c02f379amr4916378c88.8.1794480303681;
        Thu, 12 Nov 2026 02:45:03 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:02 -0800 (PST)
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
Subject: [PATCH v10 8/9] riscv: implement preemptible this_cpu cmpxchg128
Date: Thu, 12 Nov 2026 18:41:48 +0800
Message-Id: <20261112104149.38589-9-cuiyunhui@bytedance.com>
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

Extend the preemptible compare-and-exchange support to 128-bit values on
systems with native AMOCAS.Q support.

AMOCAS.Q implicitly consumes register pairs, so keep both halves of the new
value in fixed registers even when either half is zero. Retain the
local-IRQ-protected fallback when native cmpxchg128 is unavailable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 4d2fc10cbdab1..1d35fc89eeeb2 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -9,10 +9,12 @@
 #include <linux/thread_info.h>
 
 #include <asm/asm.h>
+#include <asm/cmpxchg.h>
 #include <asm/cpufeature-macros.h>
 #include <asm/current.h>
 #include <asm/gpr-num.h>
 #include <asm/hwcap.h>
+#include <asm/irqflags.h>
 
 #define __my_cpu_offset (((struct thread_info *)current)->pcpu_offset)
 
@@ -518,6 +520,65 @@ __percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
 
 __PERCPU_8_16_CMPXCHG_CASE(8, .b)
 __PERCPU_8_16_CMPXCHG_CASE(16, .h)
+
+#ifdef system_has_cmpxchg128
+static __always_inline u128
+__percpu_cmpxchg128_case(void __percpu *pcp, u128 old, u128 new)
+{
+	__PCPU_OP_CONTEXT();
+	union __u128_halves old_halves = { .full = old };
+	union __u128_halves new_halves = { .full = new };
+
+	register unsigned long new_lo asm("t1") = new_halves.low;
+	register unsigned long new_hi asm("t2") = new_halves.high;
+	register unsigned long old_lo asm("t3") = old_halves.low;
+	register unsigned long old_hi asm("t4") = old_halves.high;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		".option push\n"
+		".option arch, +zacas\n"
+		"amocas.q %[old_lo], %[new_lo], 0(%[addr])\n"
+		".option pop\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old_lo] "+&r" (old_lo), [old_hi] "+&r" (old_hi)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [new_lo] "r" (new_lo),
+		  [new_hi] "r" (new_hi)
+		: "memory");
+
+	return ((u128)old_hi << 64) | old_lo;
+}
+
+static __always_inline u128
+__percpu_generic_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	unsigned long flags;
+	u128 *ptr;
+	u128 ret;
+
+	flags = arch_local_irq_save();
+	ptr = (u128 *)((__force unsigned long)pcp +
+			 __my_cpu_offset);
+	ret = *ptr;
+	if (ret == old)
+		*ptr = new;
+	arch_local_irq_restore(flags);
+
+	return ret;
+}
+
+static __always_inline u128
+__percpu_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	if (system_has_cmpxchg128())
+		return __percpu_cmpxchg128_case(pcp, old, new);
+
+	return __percpu_generic_cmpxchg128(pcp, old, new);
+}
+#endif
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -618,6 +679,11 @@ __PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 #endif
 
+#ifdef system_has_cmpxchg128
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+	_pcp_wrap_return(__percpu_cmpxchg128, pcp, (u128)(o), (u128)(n))
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5


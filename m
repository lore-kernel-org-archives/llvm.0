Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480208;
	b=X9cQGXMJ7eBAPtnKrOrbETZ3qdW21IsueiO4cWG+YWjL6hn7zsNDGIM2dH05Dt1zE7Dp
	 quXs/MwAOS/Z6Zv9a3RZRfyynX4d59j2vsb4eHXNt0E5UfXz9jzQ6fHDQQ9EYpb/TpdWM
	 oF+LKxEf7qnniUIEi+s9sYBrJeLHKcQBYReW+6LJ3MXkKwbww3CRXGrpCUwMaAJclb1WP
	 +aPlu8FY7dtJZ1auxsJJx5FgJo6n5bKekPGfI2Wg5dNXlHPrgZ4hVnYlhDu1toMOpr65t
	 7hkuefZDdYwSRcKf7/a6i5x+Ytg1NF659t29zqitRHhA3kb18d7hUXPbKF95IkYSVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
	b=QJXCsIad7/HNB3KWJ0rQz9LpT9AIp972/vj2iqu005VMCsi+603gTk/gF5iDW6lwD+a0
	 rM5duCczXAmphiajgsUgyUSMNDcF/Fo4r63Sql1jlYfF7MJdSslnDvvGIMkJZSMDQkzGH
	 smshWEfwrOsHDb9j38dBk65J51f+03xIwJW0kt1xpUpmTSgXaw3U7KN9xCb7XOwXgs7zN
	 XISU3pBuUX+BwZI/Pmx8oen2tWXhq4xF3HQTfDRsiAfKvZgwr8djlPrtrCSBlsI+M7Jjp
	 e9kuCDYmnaUVzwqgMb6f6you2SXvduhxkMtuf32IihjluGwLQ3VizxsrRmtJUAK7+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XCI1BZ+m;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B556606A335
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B556606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XCI1BZ+m
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7697922eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480207; x=1795085007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=XCI1BZ+m5oiLnI10HpRKcOUYIvffRArgrX8mRs62iMNAbz117RT3AccluGmQw03R6T
         VhsYypyjUy90z5VYhxTr8yvNMdCrsXdE2S4RPhZYj9Uj7iG0N5krB28Z8hzPvfbVgEzQ
         Rau3Ut5Wr7mH2p1UPGzNLMY9eh67cbgAPokb17EFuAK40IoDnUy70OuK8lksemDRV5JF
         0AEiPpGnUW2GmD4NoVoSGCvEdfL7AYpeTOnxZ+j3Qa/q55ZYrqvehOE6o+s6baCLYva5
         1rrPoVBEBbTcEgVI/bvzFBmFMaqocuVvU9qInWr4e9LB3H+zo4n93YQW3ez8w1a/NM11
         8Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480207; x=1795085007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=va1yovVMtRh0Ovh1+ieoR7J5ecLHhHH9LQdBnLQU12EXgFz+5+3m3++IKs/p0TEOxL
         lwZJi7NTdSAy4M2SuOZNSpCx1tEFh2bmB7XN3Dw8C0RE5sbCTNrHAh8sri9CsQ1nxaEC
         sLDEdjHMdPtOesYfq5AfokJqNQqYTJoWbo3HUvquNvZSHvqgIEyXl/bB5/NFtBMMczuI
         js9qInZvGyHFEYgzxxxGpsZ6hlFRvgc1f54VON/LQpZPDWGDannMYNq2NC96NWmVej/X
         QPxAdU+vE+nj6ED1mkIqkLdDIcRtpDTGSzkexbV6kKBRUwzwrdYAqb0qM1FuQEMXrpOL
         /f2w==
X-Forwarded-Encrypted: i=1; AL+hErGENlV0CKkk05pnp1CU57LlCAMU50EsFFeF+fuK1fUu7+Vr52TI7Jah6Nh4m3OYBsKGATbm@lists.linux.dev
X-Gm-Message-State: APuU4Z/yvf0UoBGPzWWV1AGUeoSgUlxUqL3s6lJJ654mXe2wlog+YSeE
	VWzn3D/IMPEunfdSKow1mug812T9+J8tjbwtAL98Jx+ghhsyDhx2kAHiIlV+raA2sfw=
X-Gm-Gg: AYBFou2QNp3RRCPmXMXV96TcWPSUiozS+C+V211dtJn20mVzGmYYC5Poec5TqGTbwc9
	NhSEBAOXd9hoRWf7Ioc9P1DTTMKNElTps8v8sgRTZ+rJihG9Xcymx4F063bJr3uYazndV7rKdD0
	AulGzpO5OsHCVPi1gZOA9bV1oJGD1umKO7XIgiZfkwjqAtFqroBnh3C7J0luKmkeN7s6FiNWj5y
	aRHlWu820Ip9L9Me7a/Zc8OqtgKt7fpOYdHIgGwy52SeLU0fcy2rBpitqLno2zwUjifc/pZRKCv
	QfRH1ilpeig3l/MN7yD3EzehnWiIuqCJdss01JeAxOzbPv0foRiX+lWl3es9ToXdmFMA0TSEhKM
	kaulRlULbCi/dUfdKOE6+A1kGDc3cE8gHvko7dWPvaBMHroMO/S34Ji69CXhaVzmEoLkKPS31Fu
	AC0HrCpaH9J1oTZafF4prDpNhny/eqyrbsUYoNCXmXG+4h/cX7Bd6RSjOFrBWUuJah3Yba49qkv
	kfggArSQE1ROjbojJ7l0ARvheJkerR4oSPLoWMw/V8i6KNSszZdMG5AHJdjNMdlQvivjOr08f94
	TdadeN+Z90VjzXVwJBessEF1SRDQvVE9V4GZ/7iJX6LqP5GCV2tb62PTZSmkGQ4beeY=
X-Received: by 2002:a05:7300:bf9c:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3768366a461mr5368073eec.3.1794480207004;
        Thu, 12 Nov 2026 02:43:27 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:43:26 -0800 (PST)
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
Subject: [PATCH v10 3/9] riscv: implement preemptible this_cpu read and write operations
Date: Thu, 12 Nov 2026 18:41:43 +0800
Message-Id: <20261112104149.38589-4-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to read and write
operations.

Keep the address calculation and memory access in the same inline assembly
block, and use naturally sized loads and stores while preserving the type
semantics of the generic percpu API.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 85 +++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 59f7d44f7d3fe..ae7c123a48093 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -4,6 +4,7 @@
 #define __ASM_PERCPU_H
 
 #include <linux/bits.h>
+#include <linux/compiler.h>
 #include <linux/stringify.h>
 #include <linux/thread_info.h>
 
@@ -52,6 +53,90 @@
 #define __PCPU_GPRS_END							\
 	"sh zero, %[gprs]\n"
 
+#define __PCPU_OP_CONTEXT()						\
+	struct thread_info *__ti = (struct thread_info *)current;	\
+	unsigned long __off, __addr
+
+#define PERCPU_RW_OPS(load, store, sz)					\
+static __always_inline unsigned long					\
+__percpu_read_##sz(const void __percpu *pcp)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	unsigned long val;						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		load " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),		\
+		  [val] "=&r" (val)					\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp)					\
+		: "memory");						\
+									\
+	return (u##sz)val;						\
+}									\
+									\
+static __always_inline void __percpu_write_##sz(void __percpu *pcp,	\
+				       unsigned long val)		\
+{									\
+	__PCPU_OP_CONTEXT();						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		store " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr)		\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp), [val] "r" ((u##sz)val)		\
+		: "memory");						\
+}
+
+PERCPU_RW_OPS("lbu", "sb", 8)
+PERCPU_RW_OPS("lhu", "sh", 16)
+
+#ifdef CONFIG_64BIT
+PERCPU_RW_OPS("lwu", "sw", 32)
+PERCPU_RW_OPS("ld", "sd", 64)
+#else
+PERCPU_RW_OPS("lw", "sw", 32)
+#endif
+
+#define _pcp_wrap(op, pcp, ...)						\
+({									\
+	op(&(pcp), __VA_ARGS__);					\
+})
+
+#define _pcp_wrap_return(op, pcp, args...)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr, ##args);		\
+})
+
+#define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_read_8(pcp)	_pcp_wrap_return(__percpu_read_64, pcp)
+#endif
+
+#define this_cpu_write_1(pcp, val)					\
+	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
+#define this_cpu_write_2(pcp, val)					\
+	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
+#define this_cpu_write_4(pcp, val)					\
+	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
+
+#ifdef CONFIG_64BIT
+#define this_cpu_write_8(pcp, val)					\
+	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)(val))
+#endif
+
+#undef PERCPU_RW_OPS
+#undef __PCPU_OP_CONTEXT
+
 #include <asm-generic/percpu.h>
 
 #endif /* __ASM_PERCPU_H */
-- 
2.39.5


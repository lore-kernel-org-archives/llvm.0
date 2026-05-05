Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C373CC9E4
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 06:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962067; cv=none; b=o0aGo1TB3PcaZFKKbOgjQtPWm2S6AKwra53vMtgIy6UV5GYyaFyz/XGLV3oox+Po32SHf9WqVD1jAHqBT3ZiGBgFL/avjOjMiEojgGlYzY4GHsWxMFUetAC5iFMgeXUsyIP0wPoeAmuDxovZGKvcuqN9SQanGIz6PoPirtlG8FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962067; c=relaxed/simple;
	bh=6vd2WgAVEeop7ukkZoD7aM1VrCz8dUOAcyeyUNwokY4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qNsYX32kyj1RXj62KQiZC4CaHgkmzitMwXPdsq1g07DCSpoWf4Oe56QnlEQYyi1Iz5alrOAS4rbr5c79/sCUhpnU9arBH/cB4xDm9akNZbV5YRnPnv8LeuIUb3GGZiBNW05+sLXO3a73k1hRwWlj2jpA9eNPwMpHZ7yC11sXGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UQJhNB0d; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UQJhNB0d"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8367df48711so831811b3a.1
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777962063; x=1778566863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUWhdkh+jSa+kjESo9b/CmN+H/tJl8wa3ioBeRpyc7Q=;
        b=UQJhNB0d47mybbOeEcbkrc3zkGpq+4zMohIN9H6kMLnXYuncLhxRv/bpVEDEcgSkz0
         2stUC+UbRfCFVXYQH/3InxUh/1QDt1U1iRIOKPRXWLCoaAyhWmTd5MqRF0N+PjPtSE5q
         xIix3X3XVqVD+zPk17z///gij1FB9vCp+sac+zNzunztDY6oBTpDfGsMVdcRlDH+hd7w
         snZDDj+FoBlXJvH2pjAHd/pxngXsAAPbR6fc+g8ciTy0mWMQ1W08vuBtihS2e2BmPrDc
         NxIueQc0Av3xe5zQ2nxqlMwv5pUkDswEHKkQjAUtUQWIzirn81tdQ6Uu4PNOtyi50YXl
         DJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777962063; x=1778566863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUWhdkh+jSa+kjESo9b/CmN+H/tJl8wa3ioBeRpyc7Q=;
        b=VntxJI4K5VEevSrPQOSisR9ZswMBosPHV8cwGWOCt8wShkjxXr6CEUHAaeJTWKMqgL
         0BD6DNs8ubW0SzQXLgVQ42Oas6Lze1OTELJWm4qFYl+MG532IL/Mc2aed8snZ/am1/d/
         Uqre01o9GxrQGl2TMwad+Nl+YThPlDessq30dP009YtaPnBh3yHNMpEkLbRu0sgQjnZo
         MCrZYmoaui6UD2HOex6rREf3AqeXvxaQa1JBi6728ia1ZNWl9quky6OZ+pEfz9FrfITf
         l/UM5LKeNJJaDAXKQqlY+72AeXk0BaP1cWSeM2IddH+yKF0rt5iJ99zfAnrwOZAnqkeF
         J52g==
X-Forwarded-Encrypted: i=1; AFNElJ87d7844khOH3gq2jcD8Kvhd9SdwdvOEeXKBxtYiDyTA7gslHhffkWTJMjyMphYx+vzjJQb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx38NpTt6DM4ezUtB57x3y6ERFqxUeoy4sCjgoUN3SFhZwZu3B8
	i0HcWLV+NMNqVSj623KnJbq13Zplhhewlz+fXO4e8DPfI/hSpSfgCSG3cLWn+CHg9mk=
X-Gm-Gg: AeBDieudIgaK8I+1a4YYSLQJAZNZc+mMwQxDCAjXFzQ47rxgzXkgfvoa2Bb4NZWv/Z4
	+DVymyb5jPYGaslIF7cShoBi23NPghEyXA/U++aCR1dQsiIdVHeS0Pvm2CX6yDuN61scEzI4AlQ
	jYWYyqAnV4+awxkaV/AfQdITRdNWuF+rxWopNOLqNKmvGLPxKn8bltcmuU72e1n27VvVcCA+TXH
	hnaLHwn2J8P/s5V+EdkaljafWDEdV7OAFsp8BE7J+4bjyEMorBtzFqsVc0rmoQ7d2uEnHFR0+80
	wZ0s7fZPjhhJDECedKJ6pt2/5j3FunHOuTiE9mJoIuh4ixjLj02ztFvlzBKFrXO2MBijui0PcwO
	B0rBkxOxCsEHnStMdVKFxcTvtObnodgcDKL64qgcebpRwGdlv5aTMAzakWlHajpLZ3v1CbUq/Nc
	m1uYza4klHtFCRix/0FNdiO1lhxZGpHh975BPVuw8E4IzWlarq9Tu+TFU42Elb2fL2
X-Received: by 2002:a05:6a00:4b55:b0:82c:d9d0:f482 with SMTP id d2e1a72fcca58-83924eb8dd2mr1858261b3a.46.1777962063135;
        Mon, 04 May 2026 23:21:03 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm880738b3a.37.2026.05.04.23.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 May 2026 23:21:02 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Tue,  5 May 2026 14:20:24 +0800
Message-Id: <20260505062026.91724-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260505062026.91724-1-cuiyunhui@bytedance.com>
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V PIO helpers derive I/O addresses from PCI_IOBASE in ins*(),
outs*(), and ioport_map().

Under configurations where I/O port support is not available, these
expressions can still be formed during compilation and trigger
-Wnull-pointer-arithmetic warnings from clang.

Introduce a helper for the address calculation and guard the PIO-only
helpers with CONFIG_HAS_IOPORT so unsupported configurations do not
construct these PIO address expressions.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/io.h | 26 ++++++++++++++++++--------
 include/asm-generic/io.h    |  4 ++++
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 09bb5f57a9d34..6f5d70313c83e 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -56,6 +56,8 @@
 #define __io_pbw()	RISCV_FENCE(iow, o)
 #define __io_paw()	RISCV_FENCE(o, io)
 
+#define PCI_IO_ADDR(addr)	((void __iomem *)((unsigned long)PCI_IOBASE + (addr)))
+
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
  * allows us to use the raw read macros, but we still need to fence before and
@@ -102,12 +104,14 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
 #define readsw(addr, buffer, count) __readsw(addr, buffer, count)
 #define readsl(addr, buffer, count) __readsl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
-#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
-#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
-#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
+#define insb(addr, buffer, count) __insb(PCI_IO_ADDR(addr), buffer, count)
+#define insw(addr, buffer, count) __insw(PCI_IO_ADDR(addr), buffer, count)
+#define insl(addr, buffer, count) __insl(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -116,25 +120,31 @@ __io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
 #define writesw(addr, buffer, count) __writesw(addr, buffer, count)
 #define writesl(addr, buffer, count) __writesl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
-#define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
-#define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
-#define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
+#define outsb(addr, buffer, count) __outsb(PCI_IO_ADDR(addr), buffer, count)
+#define outsw(addr, buffer, count) __outsw(PCI_IO_ADDR(addr), buffer, count)
+#define outsl(addr, buffer, count) __outsl(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
-#define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
+#define insq(addr, buffer, count) __insq(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
-#define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
+#define outsq(addr, buffer, count) __outsq(PCI_IO_ADDR(addr), buffer, count)
+#endif
 #endif
 
 #include <asm-generic/io.h>
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index ca5a1ce6f0f89..d799e5ccc9437 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -1205,8 +1205,12 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 #define ioport_map ioport_map
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
+#ifdef CONFIG_HAS_IOPORT
 	port &= IO_SPACE_LIMIT;
 	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
+#else
+	return NULL;
+#endif
 }
 #define ARCH_HAS_GENERIC_IOPORT_MAP
 #endif
-- 
2.39.5


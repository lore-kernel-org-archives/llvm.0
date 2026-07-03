Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E28F3D16F9
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081755; cv=none; b=dw10gEqDxKBYWsX8yC8foDmracCZaLgKacNS4Q9dFzeA6Xxz5HfKB0n6Il2lGbK+aokk2DqQZz4fnbKijB0l+r+W4RwO2EZ58fS3scfQOVmrac2jLK4pgRJ9NL9fDrIYV5pyg3LKi0vToVuxVUfhANjvVqQB+70fp91kFSrIlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081755; c=relaxed/simple;
	bh=3enjAhj+bJCSQm1Q7LRQk1xR8OO/wkxTmZzaOgcPYa4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGQ5SbjVLnASHJ89eBon7lEoRsvYpod6sWk+ccc+PXFEBAexJki7A27rjnbKVoAiOY2l/SWVh60hHRPLQCDQPaV3OdG9744woBWWudxV61yPfNa7DBh3vDIdm+1Vba6AtVDp8TouYk5O3z20UrDmSqkXNohNJL2smj3j/0DYxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DhIndRWg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DhIndRWg"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so305023a12.3
        for <llvm@lists.linux.dev>; Fri, 03 Jul 2026 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081753; x=1783686553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+VxPGsXEB5teg9HEsa3LZ3vy1Qgi8wQBPtiYzVf6Qc=;
        b=DhIndRWghQl/kcU2LzIQZosJEiASPO5MkrY+sBEDyaAWRgqYMQsra+V2VyIQSsunb4
         bL7ZMbEyI5WhJ2WLdUGQGsnwHj8BNdkeke4d8ulxdWv+pkYOXru7pNICyopHIZDlROXU
         My4pR9NjdJ/KBpM4hRv8QBRJboCL6pAxWKw9QBZ1QKqVz7+gsEmIehIQR++dkyiwNngP
         +DRPcJNnvcJE45i96T8tDOV7gDYTXY8szcV727ziSqQdT+pO2o8LrSKfkrOE4vgqzmBo
         prCkJsD8kTCX1EvIMST1DrX5HdX5In8+ADentjKRpahpSV9SOpvtUpUx4qCV2nllkiZt
         jrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081753; x=1783686553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+VxPGsXEB5teg9HEsa3LZ3vy1Qgi8wQBPtiYzVf6Qc=;
        b=C9Xo4xhwDL6+c21vh3vIXxva4dtrRnryPizTX55vvAHt9hXh3Llknm2nDQ35bmw8OY
         fnFeFaYiqaweRwoax1id2KuJH+rmaagCHErOr3RuTOjpVN0jtRKRjLs3KazwvBdzp/3l
         nflkwxLNsY3zd6RPlljbCJr2c9X3dzw5nqDWOvGlr9aW2G/P7mPV80sPIs5M0GewOR5q
         l8Eso2nrlLjKGY5jnXuSoV23qVGheXir+TliENACMPPdf4cajjyTDxQLcgPiVi1QaBuW
         uWdNgJOFB25x7xWy3Gw9SuaRVv//PpRL2gmnrqS9rczD/RJDpJa0o53iErmFed8tqsSG
         OubQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XUz0osKZlZPe7MVBqLLR4scy+BX3yq3N+u+5gJvCOiDN6bfY5jEO6hwCEmkGzNikil61t@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw36sS28ZmynbFVC+Z71Y1OnqjyJlNZOem3RtEWqpv11ZJl6aF
	QffRZUUoN5uUWKkzkDMio+hKJ/aMLgOQUFAzRJdPqHvMEqq8995gYGBopq6/gZIH23o=
X-Gm-Gg: AfdE7cnPZLkEmPJQtiDp66PYSjncBe/x4OuQNbv0HRr08bnzNTohDaHtAdI2S76Us69
	9jLBLnD/H/kjXF5k4xQnYBxlrmuksadMK5jms/wcqSoJrgQC8lWWh38SvrO5VTDr3sxHzqjyNG7
	qYuOfmQPqAXZ22FDyU9+yy0zNYSuO2cBngNn4Yw9n1s9ez9g33qTCVi3u1RA1twVk0CQccXLx+c
	hPcwkvOZi/+tLYhyrGZAK7Z3cZWzBirWCDavRXfq0YISUQAQMooWVRkqENOb3EjF+poPKj4vauC
	IgSkyKxkDlTiVqmLZQzqQxsn9rFy3Vp1YZn8Hwt7woxDOGzxzCelLJpFgnpj1K0ylGyGytSETHx
	l80KmgPVO8QVypbCYtXe+gBE4Q/CvEzY5oZcYuIvaPyXnOzyC/oDyb+SpRRUmdrDR3lG5auB6X6
	dcvQ81AN70bLzvYlH8+SS7xA/3d1O4R4UhGlRBY1gojZW4Yd2/0nU=
X-Received: by 2002:a05:6a21:514:b0:3bf:b960:6fc4 with SMTP id adf61e73a8af0-3bfed4701b4mr11795889637.30.1783081752569;
        Fri, 03 Jul 2026 05:29:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2705551a12.9.2026.07.03.05.28.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jul 2026 05:29:11 -0700 (PDT)
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
Subject: [PATCH v8 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Fri,  3 Jul 2026 20:28:30 +0800
Message-Id: <20260703122832.15984-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260703122832.15984-1-cuiyunhui@bytedance.com>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When port I/O is not supported, exposing the port-string helpers is both
unnecessary and can make clang diagnose null-pointer arithmetic from the
PCI_IOBASE based address expression.  Keep the MMIO string helpers
available as before, but only provide the port I/O variants when
CONFIG_HAS_IOPORT is enabled.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 09bb5f57a9d34..92d5f831f3495 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -102,12 +102,14 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
 #define readsw(addr, buffer, count) __readsw(addr, buffer, count)
 #define readsl(addr, buffer, count) __readsl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
 #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
 #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
 #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -116,26 +118,32 @@ __io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
 #define writesw(addr, buffer, count) __writesw(addr, buffer, count)
 #define writesl(addr, buffer, count) __writesl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
 #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
 #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
 #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
 #define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
 #endif
+#endif
 
 #include <asm-generic/io.h>
 
-- 
2.39.5


Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D92E7165
	for <llvm@lists.linux.dev>; Thu,  2 Jul 2026 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960933; cv=none; b=c65tgCo0EbSxU/czk6c0lwKlaEVLrGG9sn2BYrgS9I6o99QtEaAYbSXGWPyZRYom5Y7mEZkfKyinIrYpJpZfnd3Yn4zGOYGjshdxtxl8+Ch+Ei+tzPNieUbh4o1cHY6q1zdohaAP6kkSt38typZArDa6z0zKnU4N2vw7WMmbdxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960933; c=relaxed/simple;
	bh=lmOaxI1RXCMjG8bFhu5Ke54uH3zrNAZJOEhH2v7clo0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eniQsG4UhKYNw3maC153A0Y5cYQCp5Xi7KzfTaCQBH9F8tIwzz70Q8uQl6L5PyX/1KaHv6kcn1A2iLjU8577GHSqpvdVKUAAxpkHV+BT4TgJow7D/ijrIlI1UBLsOZv89tru764YgZYiNzZkpJN4a1lTnnuXLcI2KPGzvOuyhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ND/Y2/oc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ND/Y2/oc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37df416c44bso872320a91.2
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782960931; x=1783565731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=ND/Y2/ocApYMvfz1RrWcK3z9Rbfex0gsKFGfBYciNs42PK+obI+XZIP2Ote6dJ5kOs
         uSBkwSh/XGd7RW90vqSWxF2WKimvchWMXsALoOR8zkKXTKDJpEzaKcGSyaddT8moiDby
         ZTh004uSybXcF3SYf3eG2DT7bQQEVaFOU3DMUT69XWZaOfZJUX0zYpDJROlsYtNWS+JU
         dYh18iQKHj1hc3Gj+aCND/DpPWIDGGpVUVx2nUEpR6EVTHGPAh+E76uzy9abnq6IRl8v
         /RPHJATSgK/LHiqJm8nTpP5iDsMKdcTlfA1ylKszxpY5NOJuZ0lLp6APq1qU+2kZDvsF
         F5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960931; x=1783565731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=Xs685Ohuzxs5QZBJR4iUIofrfs9uPufgtUZq+Y3j+UQGJO8qj0eDTqQWD8nUtfMqNy
         JyIqz2CHvlKHaRuy6rGZi6ij7i/4nqtHRXByMfZlQrdi5N+6O8xKeTzVmlr8DjBOhYlt
         HXhw0Mt+oSkmhbQW0+WyDEuyJ4kMajAezFpfRqDJzqR2bp8n9Oe0BwPnsskLOrGmJugR
         tCH+XA15wk9kskoJpwApvKvfmRM1/Jo8/WNw8mEetUL8DGPSp5fiuO82MPVO9zQi/30V
         jLJg1y8fXeR/lmsyOSQn4Rg1yCbxdMkc1nnEVUQivDeRnRlKmR38TnG8Us0bfAJbeiVC
         FapQ==
X-Forwarded-Encrypted: i=1; AFNElJ83+tAMIq+dw8v24rENP4AOt2jP8lz6Qibo7Zg70XoPjBjIoLMcdgMVPUIp7KXAQmH0jqNz@lists.linux.dev
X-Gm-Message-State: AOJu0YxXsak7wICe1GPc9Wq2C8rKfpYwm/0wz6iIdMxKSCpzOZNpm1z2
	zGJeu8OThOu6ILPv9HRpFT0/qTlLgyJ/D1mrmycYkItsPZEJlxa8Qj6Gz/VwMm3eqAM=
X-Gm-Gg: AfdE7cmlsA2CShwbVbPapwOaI1fVaR1oXNLFfxw4zJgtqvyWWLwdkw4hM6EvHXr7Fo+
	/l2e2Cf3DCpEhpfpvuKfX4j0Jn50pt7nTHLPqWbpgJ+BevxsFW8b/gMkp+BKdh3Fj9CNt/m2BrC
	OgNVi35AO8zE0nY101F9mK133MucnKMi9PBi/E/T8wpXbneswnvpyiedCYIN/8iNCs/LR/KJpAa
	cJ9QQzMQGQvnMy/11tpPHuPaiqfYm74tda2J5ZlLrDPkBR4TeY1k83Ndvr1yXCh0S5CyvnSKsBm
	ClWBaohE1SlQKRS084xggBSyD+yxuEJ10wclv3TAL2OVVNbGEHq5kcOHGO4R5j1924tVCdd3mF+
	5utRREJLLgCbJNrbBad3+KRkPiq02W/hQrArf/CdiIHFuMzYMZxFFz1a/C7Hr047013KyBg+qpL
	j7EmtOynAljsCrCFTvEeSqPLaW4nVSXq3BFJ0cvpbg1MDPbw==
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr3695006637.51.1782960930507;
        Wed, 01 Jul 2026 19:55:30 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm4358686eec.15.2026.07.01.19.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 19:55:30 -0700 (PDT)
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
Subject: [PATCH v7 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Thu,  2 Jul 2026 10:54:41 +0800
Message-Id: <20260702025443.83389-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260702025443.83389-1-cuiyunhui@bytedance.com>
References: <20260702025443.83389-1-cuiyunhui@bytedance.com>
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


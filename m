Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7013CCFAE
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081740; cv=none; b=Iej57EclCo8UJLqEfnXIyNzyEnYI2SO2Q/csANvKmlUl/rjeAyY51sLo0/ImjFI9Pqj0UbzjeNaDBLXCJcm9PiR9VOWaSRV6k33ldnvYI9ap1uocWzt/cruaakbdcs50L1rZ4/RzRyyS+lKMi9czr+ofiXZOD1Gpd1TOwSoKmfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081740; c=relaxed/simple;
	bh=R91542bB5CYtbj9FWp/+W0JMaOO6fVrDX51mZmOMWCg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=mh9jUKHIjRvyPmKwV/au51X2KHlIbsPSOf7p3X9+/3V+YPfUoqSUb9PyLlvEGm3Xj7malBG7wKu4TnDlUMWbrQDiQ9lhLwEB/sb2vfsRbHXVbY3bcWBOTWXpfXcNvyvb1Gy3uxFJkztXcX+b6aMObRKfjxRQXqmNbcisivvb7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lr9gr5Sf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lr9gr5Sf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8471013fac2so458898b3a.1
        for <llvm@lists.linux.dev>; Fri, 03 Jul 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081738; x=1783686538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xWVG/3qQZSSCl9XZAnFe0CG/d9wAGXcusZYIWuv8No=;
        b=lr9gr5SfrSDmCoWXQDojm2DqFoa56uZu7q+g4iefgjHF0B3YzPPfjEpMI9e2ixthG7
         FxoxbHijh5R1xrGpNQi/jKsGzCOEJMlvQltQrjo8yjV78ssgZMsvcyVgwPevuYYwBy1P
         T3ff4gFrtTR4RaScb62dbGOf+TuXj74zQhs1l9igIBu+XHI3mqezMgnAA40pOeNsPh9r
         1mcXAiOcPS8QO3fS2oCyOIHGY1IwRApyE4mTIoHcqCqb1kFRa3Nmlia7rYUenE5aOUkh
         6J9XV+6hiBPj27RpruOJXQltTpK3RId58cOYHlhXTBEz5J6iN+iq38OINxanrRo89FNO
         V/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081738; x=1783686538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xWVG/3qQZSSCl9XZAnFe0CG/d9wAGXcusZYIWuv8No=;
        b=tAxJEgUswllC2dtGhQh70bsXa4r/Y1rrfzvHVbYHGphpehDlU7RpzEr9KTyjiQiUU1
         J2g8lBKHtmXnAgDlUhQQIfPigyhVZUnQqNZHRIb3R+JzJSBwP/X0X750xW2EkQMEhThf
         RP+5I4/GAS6dkjsMhe6lDgGXk6fNwnUlHfo6BePIUQZO3+Yzmk8RmwFXMdNi3xEyOyvY
         6dOuHaM/ip8GXvE2OpAgZReG2H7W6ghsy2qSJ72UZ2wuNe0FqSQobQiYGMWF2dYyS/74
         lDyMagtf1JBWUualkYi+2G2ROHIpN9KCVVL9ss5L9P/hqP7Fwn8QeWtp+e/zuiDIfmTo
         U88A==
X-Forwarded-Encrypted: i=1; AHgh+RqXfr58dindCf9UQsEbhIJCevd1o/Uft0L77kwHTvgfAX1lXHu/7i1VtlNV9y04odQn98v9@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9aL/GoAXKGDPmTjzkIQDzs4GFK0Pxklc/qxEoY5addu8nnWCG
	RWtzY/WuTg+vpwQGixCAqMm+NgYGTJHV4QeyDmbYVjqwfAhHiYuNvRfYG4YGghqKrjc=
X-Gm-Gg: AfdE7cnKr5Aqcc6EWuPrAvczxD4618o7n5cxQwYT0+F8CrVcA4sN1JRDarRP+/uaee3
	uD8KV8n7jQfHWO/BLcDfvflzdB3dYcA1tyKD5KTwnW4wXhW4dLqmQaTW7doWQS9IFT4MWm0ftE0
	YCrvyXW08Btjo6wlyqj26X+0zhfso/uORRgBJNBxUaz4G6PyVvyDYdpPt+wtx3zxCX30KtN3b/t
	vkpHlF/v5pQ3rQ+vKt+Be029LVxnNjyEfh5ZMnSVLrSuOFBcS0kSqf9bdXyW4jGxDmxar4B6tSL
	M9+WXxqm4kMDl1KpfadsZET9xi9jNPS9qvskHKl+qxgIXSaKowzM07elvbTxryl6OLNqLvn5Lea
	a+Gp6K/y3IUBtiOO5eNVlfbKVg119tpXHj9hAw/J5FJSRz4736xwySXSfdJJey4advA/n+KvFNl
	MdVWlmOReWJZLBqjY173nuzISy54QU7zC1nTLmNE14k5EvdbGvN/E2RKJ84+HBvg==
X-Received: by 2002:a05:6a00:18a7:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-847c0686cc3mr10380342b3a.13.1783081738170;
        Fri, 03 Jul 2026 05:28:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2705551a12.9.2026.07.03.05.28.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jul 2026 05:28:56 -0700 (PDT)
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
Subject: [PATCH v8 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Fri,  3 Jul 2026 20:28:29 +0800
Message-Id: <20260703122832.15984-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v8:
- Fold the TASK_TI_CPU_NUM cleanup into patch 3.
- Pick up Arnd's Reviewed-by tag for patch 1.

Changes in v7:
- Rename the internal AND helpers for consistency.
- Undefine internal percpu helper macros before including asm-generic/percpu.h.

Changes in v6:
- Keep the RISC-V PIO fix local by directly guarding ins*/outs* helpers.
- Add the missing asm/cmpxchg.h include and clean up LR/SC fallback naming.

Changes in v5:
- Drop the generic HAS_IOPORT_MAP/ioport_map changes.
- Fix 8/16-bit LR/SC fallback masking and constraints.
- Initialize secondary idle task pcpu_offset before CPU bringup.

Changes in v4:
- Rework the series into the current PIO helper fix, percpu.h, and
  thread_info pcpu_offset layout.
- Keep the generic pci_iounmap() behavior intact.

Changes in v3:
- Fix this_cpu_cmpxchg128() build issues when cmpxchg128 is unavailable.
- Fix sparse warnings.

Changes in v2:
- Add non-Zabha percpu add/and/or support.
- Add the thread_info pcpu_offset optimization.

Changes in v1:
- Initial RISC-V percpu.h series using optimized native-width percpu ops.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 300 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   2 +-
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 329 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.39.5


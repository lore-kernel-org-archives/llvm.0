Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ED54A2E37
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909034; cv=none; b=LKdDNITZRCAd8SNdtpgFswTCbcJxisMSw8otgHnsZjNRSOELW3ME0HMg4iJb9eMCn1DxeEh9d4ZuENa1c8nSECrh2futF9d3VFJDozVWOYhs1dgaYHXyW9fc6qn/c7y96FKoUzbsRr+PCGtpIQFK3jaQDHtyGzM/9DxzoaNcdqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909034; c=relaxed/simple;
	bh=ZjWVD0tSQ1mhVm/q0JGy6VGtAnh9yMg+FOzzJVCwjsQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=oiHtFsYFKuV/jcIyM7D3DIWFKLQC497Zm5ELuEupBDnkojMlWueOcR3hlNOmeTdfXKxYtZvJNGwjBJg6ziQ0NzNtC86XyiL78UzyvXp2CoK+EAUwgOh9xa7d7rwHy2vcthLaQEUGh3sVDeCv/BGG/ANFOJ238PB5auYxdm0jzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q5rd/M2+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q5rd/M2+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9c9916f75so2806955ad.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782909030; x=1783513830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5IzwYzPDTeWx7tKr7hSDF5l+BLDO1MD+S8kZpieZcM=;
        b=Q5rd/M2+XdcpLvvVu6xuCXU9bd6N+T4zPFAhBYjwhjiiD9ubzU7L7zfKJFpRmz/y5a
         hfevpvdOVKyb+PGJFAeiAIdA9K+SZqm0wKIAbbiA6X772gBsWurB1g//QAgspaPDzEgf
         9QuGgdZw72t8/OdfCmXkdy6427GT+D2eyQ2OteSP2mq1AKoF51Bv5BcHwBCnLgdZA8fM
         ia8CuIv9MtacwnpZB75Wi9aqteOnQcsXigfG70VEqsuBVWkeQcOVT0EEpsSk2dl4NPwH
         myvSN2fnQJ5CyatAM5yzy+hCigelTdpyGNRkIxa/uMxThz90PltYIo6MfyU39LksaS1N
         fshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909030; x=1783513830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5IzwYzPDTeWx7tKr7hSDF5l+BLDO1MD+S8kZpieZcM=;
        b=Lj70QfvSfbByuI6ujTqjJ+FDWWytXvhxYtUIkhosbrBxC6djP+FxGlBZ0aXlVTKqjl
         7wxwiFpglH2PeWaXLZ993CXC8oOr0EYkQbjE5Xhvkm4WfUOznm6M5S4wVAJqrGFhKHyv
         3UY16KG5APB5DbdwH1O3nTahv6qlGMSBPD3+7VqkLczNoMGQUCzldCH8YGq/+QrezCAj
         qxgYywKp9bs1mFWVcHvRkN70WicT6fGzCpVqEu5nImf+C2nWqD2euH0SB9HCB3+gXJGR
         K74gPmkFwnpIH8pfAtL8Jz2+CJMyt1pn3uPbnh4wnt76UJaAv11bAyHoaXZlmPcA24TM
         pz/g==
X-Forwarded-Encrypted: i=1; AHgh+RosXsTdxu9bNQlWZfUTAPO+0np5CbuNnxx8O5m3dh5wC+mJtamgRfuOdp/X00D3Q+6Qn5R4@lists.linux.dev
X-Gm-Message-State: AOJu0YzbszmrrjCMDR4ypOScU+dBb9w4uUDEKGQPYNSKbs9XPpJusjt0
	eEO153xsrCe+qaigDwoELWEEcP8eXlnJkty/PO78nU8/YjxmsiZ7rakhTAt0Rwq2p6U=
X-Gm-Gg: AfdE7cmux2rrGxbj4zWfbpZ9dlMl7f0rtb2Cj0/l6NG3LhFDM9e+bc2iSpy2kjC7OVx
	ic+0s7bSG1jW4zI+kz7yOf10bZTkW5RgMKxI1rBEVs+XoLXQJv2oZGz7CZNH4nnKsnLV3czXH4k
	lW8N27ZC7MaR5kc8Pr5D7XC0BlhQGaWvW/7jEIzkAcqIM2crLelDFWXitrM9EeEsMonKPV3S9dV
	4pznnRFFO/A1Bf3HcUJj4MmK3gF9bTmDrH86x4mqcPHwVZJs7YPpXr8tj3qcqxkE29epGrFURby
	rSMqlHYPc+nL9dHzKlY2AHMmcBWZCOpy8BbuuU8Jmd+RksDEmVgBF2v5CQRqq/SfxdCs1hgJck7
	H4GLfQ8YxvMVCQncfwDdaa4DkFwx1wKeePpLoIoeq9nPHog/mYXMv6zhik+ZG64P3IJdKOHTc8F
	sapMNB9KafkipX80M8CaLE5MdQX6N8AiKenMCsWI6+aZzajosa4viuyukN
X-Received: by 2002:a17:902:d549:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2ca7e682ad6mr16606255ad.8.1782909030457;
        Wed, 01 Jul 2026 05:30:30 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm25166825ad.73.2026.07.01.05.30.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:30:29 -0700 (PDT)
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
Subject: [PATCH v6 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Wed,  1 Jul 2026 20:29:45 +0800
Message-Id: <20260701122948.57584-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v6:
- Drop the extra PCI_IO_ADDR() helper; directly guard the RISC-V ins*/outs*
  helpers with CONFIG_HAS_IOPORT.
- Add the missing <asm/cmpxchg.h> include to arch/riscv/include/asm/percpu.h
  so cmpxchg_relaxed() and system_has_cmpxchg128() are visible.
- Clean up the two 8/16-bit LR/SC fallback asm blocks to use consistent
  old/new/field variable names.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 288 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 317 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


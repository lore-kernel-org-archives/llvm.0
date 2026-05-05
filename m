Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7603C5DCD
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962056; cv=none; b=cNf1wmOPSlCZm1hjJmtZxaWiiI+MkBXNEAHUEdbvb0/dxrciTg49W7kJzxZ3XYGMRq/+TvjuXdNMRIzSsCqrOrVtXFFYgjEKg7s5THLrrUsJMeGPwCaZBycvwJXhKvXb30fx4ubR711JGhBWN6oRf32lqZWDSZqf12l2SGKXE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962056; c=relaxed/simple;
	bh=1N/LGKwuOq9v0S6+Nwko/9VEdnuS/5VPERf1X8fCvxQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=I9nfdQpl/X9xShhBPM34hqBtoQ0WFhW/dXsAiau/i7u4xFIatGTNz//pLLHNa829NlffVQBNe9TMPvG0UBYVCL0zHA8Q0C/oyviKsQvyRAcRclKKaM2rUDwWNOiRmyLGP2oltYjXxqmBdIIvmgutXxorayBPcHpkRvKoOpVGSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e6ZCoY8Y; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e6ZCoY8Y"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8379e010b01so762516b3a.1
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777962053; x=1778566853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IABxPdOKi9qQ0ncIcorYGTDUXVbyRSpLw0RRqytGSAg=;
        b=e6ZCoY8YI6rRMc4So85X4LtQdbmMMRwpugH9kjIGjA00Poo+3fHWwXLm5MCwVzayyK
         xR2rYvSb8Es9o0wGz11YQfetZnLRO+cx/9clikFJFl+5IU7dyqX4L7H27WcKrWbYWRS3
         t0pYtB6y85dol/NvhPHmQgdHaWkCs0hWJDy8pEWE7glSAhTXk6KQXf6WBv8VRFcY6xCH
         6+b3rHVZIw0FIyprOx62mYqg3yVvjSg87V2RsEQKoZWfvCSo/BuvDlyMz2oFO6qpEfEu
         0OAyuUq5tsqJD3t4Hrw19qhJr4UPKeEelMlB2EG2XTtw98Ck3o9VnpvnpEP7ljIgTtOG
         lzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777962053; x=1778566853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IABxPdOKi9qQ0ncIcorYGTDUXVbyRSpLw0RRqytGSAg=;
        b=Lm3xg5Sb/Mh/h8VFw+TsWIlHhVnRR+4T7NuiE7tHpPAuJKnNkF1CiLNOWrQNEL0eR7
         9F3OQ02pMTofjJOz65NbyG5gyk3mgk+kfTyoggVmF7t0yrXycp9btU/xDXRcQ1hWf0NV
         PwQpshPeaTXwlp999kWPp+Zd3n154IPphCE5Q5h9Fr0x/nfjhoTvYj5r54qIsO9Bopg1
         eLtDE4ossvkqnEUkAlDqC0jvRV8rXDW6toj63T4zpCbuvJyOKB7zMcmm6pdwgwygu/K2
         H4UjHACpyTVDbUS15VtH9WpYnxPXaHyvkyjNxNTDLWI0DWEgJrfng/JUWA/CbaxO0RGj
         P5yw==
X-Forwarded-Encrypted: i=1; AFNElJ+aMa4eNvGa5q6DQNRu+CyxH982jLK6JPfKRun9QnqY4QOS4VoYDgE/dmq0odlvS22vAEro@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi+1dVnaKuc2ek5WuxHjMyTwMtFWS+w0bwIXe77qCKfBd+XnLy
	uaisbMcJ9drAfn0ZnUA5O+0EqcDyPCnKba9513ICwHeNnXO/pTi+DG3QJWpr9TTcq0E=
X-Gm-Gg: AeBDievQtAz87C6d7wz2c5c7Ndj2GiJe4lP4Z/OvxCKhU+1XAwaG+diuB+A0G06Urtt
	aH6E98CDrF6ZZC8X24zJYgsymMC3Vu5ZaivUcBfJHlMoEF5p2bppYYZwBS+vZg7YtoIdvMwtMbQ
	69WHhB/Q66clIpHkGyFxmBUhR0UIksPcKxoIYPPj0soVbW5elPfvod9vO6p/nfdh/Bc+kvarAP7
	JL473Bhhmx/rTEfayzp/+UPygM8DX1zXp4kQ12cD63WmWm3ntK9BQ9HudBx5U9Ts0/wDaHmwNQw
	MtMTENGRZQ9WV65s8IbUCQv618VOziLPZDnloPlSse6fiTNqnDzpDVNi8OezCAuGSWraPqwpl4I
	dK2kCEy8dCnNT6Zz+VA6QVNudOFlySZ/bkkyf7r5nEILtecpwORpfGrT3NeAXVyg8HAIDVd1BS7
	59JsSfl52fC2fQRynZAzea4vvGEBhTdvAXApp/nfGSC7yKTYOHFwdwdKjY/0jckNNT
X-Received: by 2002:a05:6a00:c8c:b0:838:3f54:a0ee with SMTP id d2e1a72fcca58-8383f54a1aamr5208071b3a.7.1777962052522;
        Mon, 04 May 2026 23:20:52 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm880738b3a.37.2026.05.04.23.20.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 May 2026 23:20:52 -0700 (PDT)
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
Subject: [PATCH v4 0/3] riscv: improve percpu helpers and PIO mapping
Date: Tue,  5 May 2026 14:20:23 +0800
Message-Id: <20260505062026.91724-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series makes three small RISC-V cleanups and fixes around percpu access
and PIO helper handling.

This work is motivated in part by build reports from lkp and by follow-up
review/discussion around the percpu access rework:

https://lore.kernel.org/all/202512202218.FI6bB5kV-lkp@intel.com/
https://lore.kernel.org/all/202512210052.w0bpUAAO-lkp@intel.com/

1. Avoid forming invalid PIO address expressions when I/O port support is not
enabled, while keeping the generic pci_iounmap() behavior intact.

2. Introduce arch/riscv/include/asm/percpu.h with RISC-V-specific percpu
helpers, including the fix for the 8/16-bit add_return LR/SC fallback.

3. Cache the percpu offset in thread_info so percpu accesses can use it
directly across the relevant RISC-V paths.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |  26 ++-
 arch/riscv/include/asm/percpu.h      | 284 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   7 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 include/asm-generic/io.h             |   4 +
 9 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


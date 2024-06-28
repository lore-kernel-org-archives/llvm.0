Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345B156984
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575296; cv=none; b=O+eaBMM8gJLM2nxTqZ+FB8GdBLmknw6uHnW8mYQLSIjzcJGIZfTsQwwhmZkWLwnKom2pykHK4CVtsC5XNE0XhD5K/Uxzo1m6jdIWZS+6dv+YGPyqdSSbFq02B5ImLfO7iO3iFwoofIDcnagvrkQ2wmMxFuFvWnLJzS1cJvH0LMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575296; c=relaxed/simple;
	bh=nMicCFqOOSqXWHUG6+RMyPjEXy9o5YSjEOcCsaIXIMI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jjXO9LwnnNtBKXpIyNkT0lokhbFwfes0uCF4Di0pO+CP87/FYhQS4nyXRAbU2Kl/JMyNCBNkqY3OGkxkjlHYO/y/pPqlyzd+fXQcX3CLmUC/67Ieijpui5GYa+R/VV8eTlMMP0KToXnzfl6AKpRFNF/gpfny2MdE347r3afrO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ULZRtoQ2; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ULZRtoQ2"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-254aec5a084so312186fac.3
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575293; x=1720180093; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Go8tsPI3JHaqc+IarHpTHOFjcdklbUr4X/cGV00jz4=;
        b=ULZRtoQ2z6zatt2u4KPGlwjdLRcFq+M0SeSUxh4SWwwsqmQYr2BbG3iqO+mOAbiCVK
         8zkjuVeq3agjBuHfd4uCr51CIONDZ7c1yGaDVWlmDDIAm6Jd0Zt+S6M9dRrkbGUnrgAc
         MyS6/hl2cTX7Ya0wqK5CGQDjdcZzIhy6DnOhtmm5soXXFROo/FovX7CqwWqei4I2lgwJ
         lUyUxfMPqgo4ZVvCJ9G9WS+MF+rLURWahCuEwbsEHYx8Bj4/y2INVkajxeR9jMCuHklj
         IntFZLZ2sL5Z8ncSNGGhVIU/72mcUkHu+wg4Lj58O417r+Wnl4972xkgMYUYVgIe4kCR
         gZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575293; x=1720180093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Go8tsPI3JHaqc+IarHpTHOFjcdklbUr4X/cGV00jz4=;
        b=wNRuMfS57vkFeV+SlYOir/W+XAlK6mKtrbRFpv8/p3rKfAKLS3d39uGkskXHAhvEJF
         IxTSkJw8TCmKXXM0v4wXhm8Euu31gSGeClSOm5vnnim+E5twoKHCjk6aCe2ad1pK0v1t
         Mx91GSJFR6HwUDPSjiOqOG6mYcCtVGtD8n4I7dGggm9drHu4LG7bYwZ/NWuEGs+HKwNv
         x7dbkWoBUqNosHkxXOQdX3aXMjKz8fDb39v4tE2wLtEyit18hYDCUsuyOUrFMkmYQl5F
         G3VAC/9YLukcfnfs6qLwAdvCPzhhJ5TCUylgqpE/DWnl7ibGmnpd7gm9waIyJ4Ez1Wep
         47UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnD04sI6ZLF+nfeZbYmvIoQ6rMsK5QbcrQsaT9yEaB7sEhTECrtPnws4echKcvRv+zfqL+b4ImbPSAZcuv7pmVO9dA1w==
X-Gm-Message-State: AOJu0YzRdwj0UDiqFhntbSfnlQjwhqySYQO7elC+6E1TKHGdZ5AGMBud
	3du2FZ3/+BqxYRU7JElhwEz3+pEPE8T0BmmpdrW9FmUxL1wmgp7kFDKFn8NzS9M=
X-Google-Smtp-Source: AGHT+IGxaDreBVCsSLdh9PoJI0Hihs2g42vWKzBlr7lrYPNGCbC+Og4f9H83lvBVMVl6OYqO7WNyog==
X-Received: by 2002:a05:6870:d891:b0:254:7348:9071 with SMTP id 586e51a60fabf-25d0170cec9mr17765030fac.26.1719575292823;
        Fri, 28 Jun 2024 04:48:12 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v2 0/6] riscv: ftrace: atmoic patching and preempt
 improvements
Date: Fri, 28 Jun 2024 19:47:43 +0800
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+ifmYC/4WNQQ7CIBBFr9LM2jEMRWNd9R6mCwJTOwvBQEMkT
 e8u9gIu30v++xtkTsIZ7t0GiYtkiaGBPnXgFhuejOIbg1baqCv16LmgDb469DXgvCbrGIvBwZA
 3Vim2NEBbvxPP8jnKj6nxInmNqR5HhX72f7MQKiR76W9M2iniMcsshc8uvmDa9/0L/OJ01L8AA
 AA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4

This series makes atmoic code patching possible in riscv ftrace. A
direct benefit of this is that we can get rid of stop_machine() when
patching function entries. This also makes it possible to run ftrace
with full kernel preemption. Before this series, the kernel initializes
patchable function entries to NOP4 + NOP4. To start tracing, it updates
entries to AUIPC + JALR while holding other cores in stop_machine.
stop_machine() is required because it is impossible to update 2
instructions, and be seen atomically. And preemption must have to be
prevented, as kernel preemption allows process to be scheduled out while
executing on one of these instruction pairs.

This series addresses the problem by initializing the first NOP4 to
AUIPC. So, atmoic patching is possible because the kernel only has to
update one instruction. As long as the instruction is naturally aligned,
then it is expected to be updated atomically.

However, the address range of the ftrace trampoline is limited to +-2K
from ftrace_caller after appplying this series. This issue is expected
to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
data in front of pacthable functions and can  use it to direct execution
out to any custom trampolines.

The series is composed by three parts. The first part cleans up the
existing issues when the kernel is compiled with clang.The second part
modifies the ftrace code patching mechanism (2-4) as mentioned above.
Then prepare ftrace to be able to run with kernel preemption (5,6)

This series is tested after applying the following ftrace/patching in
the fixes branch:

- commit 57a369b6f2ee ("riscv: patch: Flush the icache right after
                        patching to avoid illegal insns")
- commit a2bd3a5b4b63 ("riscv: stacktrace: convert arch_stack_walk() to
                        noinstr")

Changes in v2:
- Drop patch 1 as it is merged through fixes.
- Drop patch 2, which converts kernel_text_address into notrace. As
  users can prevent tracing it by configuring the tracefs.
- Use a more generic way in kconfig to align functions.
- Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com

---
Andy Chiu (6):
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace: align patchable functions to 4 Byte boundary
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   4 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 +++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++++++---------------------
 arch/riscv/kernel/mcount-dyn.S     |  25 +++++--
 7 files changed, 121 insertions(+), 86 deletions(-)
---
base-commit: a2bd3a5b4b63b95aea7dbf61d9395cd6696a2bc0
change-id: 20240613-dev-andyc-dyn-ftrace-v4-941d4a00ea19

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


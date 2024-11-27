Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A7200BBA
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728590; cv=none; b=tPF4gB2taZJArU4yQL65az5zpJeAkEPD4mcyE04N9Iko48FF0DGSmfSayBlz8gJRhWD+IcvOUYO1lqDsx4RnGWct3/v5XOQY4h8OU6P6vVTHb3gv33Fh1vzAWtIzs2FirfubUrWfQiySvn+1DWa+alqSGnJVw11Rxx1hLXX1+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728590; c=relaxed/simple;
	bh=AgCMaMeAnASpx9ADAFEofuxtrTW5t6AuJNoMsODv+90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IR7yyi4hzmrtbgGx2w+MM2jfT6VGF/hWwQ6JQDxfp9i6x4GqmhbV+B9jxCb9YjE4d4oCaQPiQEwMQ5e5DVeNvJnmeDGuhgCK2KFC53MFZIwl6m/NRC6Y+q5pLM4DPvYUz4MzTCmfV6Grjo9xFJ1O0EcP2yfFI+9oNiPKPDz145A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcXpVZKa; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcXpVZKa"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so5090461a12.2
        for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728589; x=1733333389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4sIOmxt+6E3SUjl0OKh9ltYG/Wh+OnpptrG+2+4Agg=;
        b=XcXpVZKa+gUMQv6sSoQ0GJZEQrM3qNvAVzn0/qUPV61c5RYLce8FnD838YcPwsgrdt
         ZclSrz3P1HSKfZMJ5ovyiNnefLzhx7bwex6JLdIMFrjKSgma2FsCLvhXff4N0shDf6e4
         diZTcu+IRr9/Iqmp5782yYgoqcqkjQEgf7RtY2z/gLvFJi99h2Fp2aTOAjWbF19t6P3p
         5k44KtDh/J/RqgZtVoA9+9zCcUCV54AK61fCXE0AVDauI01WlHYnRGOQe2sjNGbt/8Y8
         PX3HPjNCRKUzogGNwLBHRj57MmDoCraBE+I+a3SVCi+y8cPK7LUCV8TBvpC86GrFLmyr
         +lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728589; x=1733333389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4sIOmxt+6E3SUjl0OKh9ltYG/Wh+OnpptrG+2+4Agg=;
        b=S33BQftm4+M6JuVnt+LLP8AAzGbcUqpU/C4EluaFgHuaI32M4ijuPU64LIQscxOIs+
         5Wz/VXKvbMsD1Hq6eg5vDwQQYZspeF4jr4ifDfdz0GgH/fFZfPmqcXnEiPU2Xp4O7hn5
         faGqGfJHZY3yhAzTuChtVwpRPNLnoZqp3jgp9Fj4ptmOXK+ayRiTXCtfsJ5ds6rh5k9e
         9RG/b7s+v9w5Vub7s1YDldYS3Znc8cTyKXgkohl0cXr9ecHRabNtr8AXDiUUhRFXW0Rj
         Di0gC5N6kzmSNb3rsOvbve8p7rkpLFVKFLUlfH7So+j//S+uwF6ALm0aSDn4AR82H+Gs
         1bsw==
X-Forwarded-Encrypted: i=1; AJvYcCUP1BJa4I88j7VIeLfN0AYs8EPh+HNR2Pa20TRsiEdjvMr0Pe5gmJRmAP0AN0bFb30Rm+A3@lists.linux.dev
X-Gm-Message-State: AOJu0YwCtjfN+XpqfkUfE6JNMVDGAMeAh9JQXLgn2ErIfi5WxKNsl7Rd
	6OtWJk6aZQs6PguqF5uuL1RVTEr7gMTjqIygKBRw7wN/PevO+jV+
X-Gm-Gg: ASbGnctSiAyd8j802RL13wGOBOvHX3Ty0ntOIFFUPBqandDeCpGEWKrlQrnVte4tEuR
	LSPsh6rXI8H+pVsOR4L/R1T6afZ1+JMDNSoNhbn1DvPUGyTz7Vws2D7IoIULxtCvfbvf+CgqUE1
	cYzOxhY5Sw1r0EcqVI9ZyPwD/kl03HWjY5bwA5REhSHX+M7m5RHp7jVF7MsEjEtG72P2wcJvYN3
	TRhk1ZP5bKEc1l2ya0aDtt5V64MNgK8Q89WIVzh5G5GXOILqPtPV70hV4BA/PxH9jzoYjPVBOrx
	PyKlCmfSVHaU4SOMvVERoDZvCVq9
X-Google-Smtp-Source: AGHT+IEQBpzMXh5yXkAktk+B4Le1RfAy/+Rf/KVUrppFxoUQ2qNw97WYZSZiNYXgYFn+fzg6vo950g==
X-Received: by 2002:a05:6a21:2d84:b0:1d9:c6e8:60fc with SMTP id adf61e73a8af0-1e0e0ab4692mr5782140637.6.1732728588569;
        Wed, 27 Nov 2024 09:29:48 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:29:47 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
Date: Thu, 28 Nov 2024 01:29:01 +0800
Message-Id: <20241127172908.17149-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

An ongoing fix:

Since there is no room for marking *kernel_text_address as notrace[1] at
source code level, there is a significant performance regression when
using function_graph with TRACE_IRQFLAGS enabled. There can be as much as
8 graph handler being called in each function-entry. The current
workaround requires us echo "*kernel_text_address" into
set_ftrace_notrace before starting the trace. However, we observed that
the kernel still enables the patch site in some cases even with
*kernel_text_address properly added in the file While the root cause is
still under investagtion, we consider that it should not be the reason
for holding back the code patching, in order to unblock the call_ops
part.

[1]: https://lore.kernel.org/linux-riscv/20240613093233.0b349ed0@rorschach.local.home/

Changes in v3:
- Add a fix tag for patch 1
- Add a data fence before sending out remote fence.i (6)
- Link to v2: https://lore.kernel.org/all/20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com/

Changes in v2:
- Drop patch 1 as it is merged through fixes.
- Drop patch 2, which converts kernel_text_address into notrace. As
  users can prevent tracing it by configuring the tracefs.
- Use a more generic way in kconfig to align functions.
- Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com


Andy Chiu (7):
  riscv: ftrace: support fastcc in Clang for WITH_ARGS
  riscv: ftrace: align patchable functions to 4 Byte boundary
  riscv: ftrace: prepare ftrace for atomic code patching
  riscv: ftrace: do not use stop_machine to update code
  riscv: vector: Support calling schedule() for preemptible Vector
  riscv: add a data fence for CMODX in the kernel mode
  riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   4 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 ++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++-----------------
 arch/riscv/kernel/mcount-dyn.S     |  25 ++++--
 arch/riscv/mm/cacheflush.c         |  15 +++-
 8 files changed, 135 insertions(+), 87 deletions(-)
---
base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
-- 
2.39.3 (Apple Git-145)


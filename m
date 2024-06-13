Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943557CBC
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263962; cv=none; b=lOXySUfIzKgHybsWqtUO/vfWaG6IqpGoEH+e81I0+na2V3NfTeuFE7RjXCbqGYN44ht1KZJAEIC4v6RWvnnO0CxvfQOhPokCB9Nhw3+7KnVqrTkvVjHnbGYHmkWhINKCgsmzwN3t0e+DaiVRBVYg4drJN7U/6/i/J7iyu5xMmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263962; c=relaxed/simple;
	bh=vEH4B/nWb5j8tsvBXi0MDsuLT+abhB89bcABJJ3eO6k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Py+XeLqj4NGWut0JOsbHpw+WN2Y3OvH7ga7xWRsqmUrjkQDcA3pclt0NCFDAy81NdzyOoL1cIWqZdIT4CBOW6STesErizs6NguGGUYntsfVhXA0Nx92MRbdS773jUetvX7t77wn/jbzuOF5rNDIwJe9rH7ZNoresi4WJAF0s0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YoSOag0E; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YoSOag0E"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25528eb4078so320891fac.0
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263960; x=1718868760; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYkT3MY6oOMowcuPeCUIoQ2Ndwhv5Wfye8oIKBe0p2g=;
        b=YoSOag0EC/FUZfCVtw4yyGCgzNLMCtYN28cOdg70DDIfcuwXEL5npvFu9iLdfSUBwx
         gB7GBRrl2emWiK5fgeIAaqgYX7FQHF6y/ZD2pdx4Pr1vLsHcZLqYFo3uyc6V9dzAh1if
         aRpIjeOwWJNE9BJEOLDg1N2g1edtMSEkcSej8yT+TC1+WTfp5eIddUks5246MckPi9G+
         wZdDonVN7q9MCzqCHuX08eYXVHe1ay556ZM9nt5GgcBYCvNyx0Xs0PspVLVfTmBGZKAH
         bOpN7g3j/Norrke0IRxsHPvAEsWYATUG5aK9yHYeSeVW/2KUv2riSyQ3ISDFv421rLHj
         5Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263960; x=1718868760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYkT3MY6oOMowcuPeCUIoQ2Ndwhv5Wfye8oIKBe0p2g=;
        b=FvAbPLz9JuZrGT5LJcQYWPQDfr8xOirFXVUTp8r1eIKD2jQv+YdzWjcMFl0wd1o/IM
         qmy+dXjDZUN4lADi1ur4DcAN5XD+ZOuF5arAp+MeZzaJyGFIJb4o1H7jBd6vVzGR3sFb
         R8El3vYQi5uZCSBmxHTIMpudfF+zmKc/Ednk+Vr3tYk5u6f76wSTi+RikKu54V3DnCpk
         3OLNOT+aiwtvkRUGdyYmyrRqZd6b1HPwZ4S1QCCnaHCEQ68ySmnPMqsHWOWxa0hkgYtk
         ggQzIqgF7KtP1s4zOjSEsZ/QNSYp/p8p8LS439nQ0SAp33nvdSi2kqndUae5Zkwg8PF+
         khZg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOVI5dUuKxB/vKxu4J3d+jJ1nHGfeCrNrMVZ9XWe9WM1HFZd/iadjU6f0BMUGxzgxQPAt+y+LsqTQzT4j18FLY6SbOQ==
X-Gm-Message-State: AOJu0Yzwk36nNtjP5dzQk0EPUb6Bflg1JIiT7eDzBQQtsSUg2B61op9U
	sVREW0oKu9io6qYHAt072DH4MS4isvr6CD5otAEF3Q7X4zJ1HDIvQY84FevH1u8=
X-Google-Smtp-Source: AGHT+IGmYhRnTeJ1bd7J2EL+xnsQNgi//5OJtSEKyWJEXOiAjofEj7fKYDnP/Ta8QspMsNmDQvrm/A==
X-Received: by 2002:a05:6870:392b:b0:254:8006:8e06 with SMTP id 586e51a60fabf-25514c94529mr4505658fac.31.1718263960249;
        Thu, 13 Jun 2024 00:32:40 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:39 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH 0/8] riscv: ftrace: atmoic patching and preempt
 improvements
Date: Thu, 13 Jun 2024 15:11:05 +0800
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAImbamYC/x3MMQqAMAxA0atIZgOtFkGvIg6hiZqlSitFkd7d4
 viG/19IElUSTM0LUbImPUKFbRvwO4VNULkaOtM5M9geWTJS4McjPwHXK5IXzA5HZ9mRMUJ2hFq
 fUVa9//O8lPIBP9tutWkAAAA=
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
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>, 
 Evgenii Shatokhin <e.shatokhin@yadro.com>
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

The series is composed by two parts. The first part (1-3) cleans up
existing issues that was found during testing of and not caused by the
implementation. The second part modifies the ftrace code patching
mechanism (4-6) as mentioned above. Then prepare ftrace to be able to
run with kernel preemption (7,8)

---
Andy Chiu (8):
      riscv: stacktrace: convert arch_stack_walk() to noinstr
      tracing: do not trace kernel_text_address()
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace: align patchable functions to 4 Byte boundary
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   3 +-
 arch/riscv/Makefile                |   7 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 +++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++++++---------------------
 arch/riscv/kernel/mcount-dyn.S     |  25 +++++--
 arch/riscv/kernel/stacktrace.c     |   2 +-
 kernel/extable.c                   |   4 +-
 10 files changed, 129 insertions(+), 90 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240613-dev-andyc-dyn-ftrace-v4-941d4a00ea19

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


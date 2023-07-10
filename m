Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA617C8
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 18:35:48 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-55c1fd0f723so3594398a12.0
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014148; x=1691606148;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ii//NdDJV9WujsqukD3lwiIq5e/LyG2Fswag+05zH+E=;
        b=cRgD+oRUns5YzG9+1bpiaTGIpy4DKL/Xz7bJ7gRd9oD3Xn4lyqRtw/KGJjiH510MA6
         XYA0ZB6HRLE5cy7jDThnf/lxpm2EXODNGbqaAbL6N2igI2KXl0cOiRj7U/evNbfGna2K
         HfzwAQizTxP1bXa+6SRrdzB8mvpoeP9CEQhZ21NmL3Ag+Slaua582VWcKupdcO7zVBf0
         3ekYXBaPC6LyH8OID/IYa3j0DKmstgsoJ5ggVCFOEqoG3LW1b2AZF0q9ItrxjeqGDa7k
         W2tg6ArEqP2N38xhU5sfVF6WGzPabfsrUm/dNMJIzHuUVJkB9Nk1fhln4NbzAJ43fllB
         mmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014148; x=1691606148;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ii//NdDJV9WujsqukD3lwiIq5e/LyG2Fswag+05zH+E=;
        b=lC6XcWBNWGRdVvr3Jgz8ZprQA5jTNGEwRKefGQw9J/Hn6UUl/7tsKCinLo1DDV8Aid
         wQxB1Sr6CMzGFTuO0if13nDkepIPfwpHwDYHvuqXYgKhf54rTSIt2BGX303d4MbiMGQw
         q7Sl1YO+ptc6la0AXmmILokICQB3goikNRjZybSi+LnRNQsFxWmS9yVmhbwvuPA4fj/R
         oJdxSxZkvux8/2c3y7QDaO9Egjkzohgiz6WDdTrRnDrCn+t5GEjTSxml99eTbSUxmsob
         qfW2j31q9mg3OLGBQ+FQTK9R8Fi8Vl2vUi0OXck7Ven094dLm+vGcl5mMOVl9FeW4lrH
         4/Tg==
X-Gm-Message-State: ABy/qLZQ996EB4aM3rYNYHMV21i8vIz/z9gkWm0bpDPJ+ajDmouBQhTJ
	RRDK2wri/ztvwy+hza4cceRJ48bPXAav1OQ29Gk=
X-Google-Smtp-Source: APBJJlGr9RJyCy/NTtd4U3G8YBzsr03Efxb2b0r6mb2spZfsYM39frOrlzfVt4txYLqSsSFhpgcb57zUbCLWzB6Duj0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:7747:0:b0:55c:5c30:33aa with SMTP
 id s68-20020a637747000000b0055c5c3033aamr174205pgc.9.1689014148087; Mon, 10
 Jul 2023 11:35:48 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:45 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192; i=samitolvanen@google.com;
 h=from:subject; bh=7OU2bpD9UM9q2xXwG7ynEd3jeDD83obc/zqrCIV8X8k=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+AhS2yuHhEWb37FLulyBDG6hxPDOCPp4ma4
 1wBuy7vRHaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgAAKCRBMtfaEi7xW
 7roEC/4igkmPPv4O8DtGnr3voPUmeALLQLdA+F8M9Bn3HTFaVz4ioIvWtKmMezopiYJbIDUHGbt
 SDhgD1cRQvrBs4Uusc/ekdt5I3RNrXi0z6DJy+BoH4v1bwxQAurRzapGETRjEeAZGXacIEm8iRj
 54IfAkdnmWdi11rza4Efd2TxMPQquQLui+dmgNiuK9E/7Vo2/j5KWn8MyGP8axxbZgVM2KpGWHd
 EoHqu2niCWANM+elksiJly2S1XiaMQN5TpxUusyMQ01Bm9GtsZpSbF+RLl+P15RO7BuV+ToDSe9
 +C052grMu1y/NaRQqJlPq3RnHTsjhT6yCR7PvqfV2Nz8gbFi/JwVWQG6+bkISVbVah15Fpr5s9f
 6tL8b0o4dsMBjjN1mqqpKOSNfrFbOvrYSt/TtzIZnAxO/nYTEPNrAxdLxLnmW0ormlBt2YFgOjV H7GkBVLFi8Hs3P0GfQIei8SHfcJ+DZAIc5Q+SAJuUMabYv7kWkgKAb0PyzLv00PgaoHUk=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-8-samitolvanen@google.com>
Subject: [PATCH v2 0/6] riscv: KCFI support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds KCFI support for RISC-V. KCFI is a fine-grained
forward-edge control-flow integrity scheme supported in Clang >=16,
which ensures indirect calls in instrumented code can only branch to
functions whose type matches the function pointer type, thus making
code reuse attacks more difficult.

Patch 1 implements a pt_regs based syscall wrapper to address
function pointer type mismatches in syscall handling. Patches 2 and 3
annotate indirectly called assembly functions with CFI types. Patch 4
implements error handling for indirect call checks. Patch 5 disables
CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
to be enabled for RISC-V.

Note that Clang 16 has a generic architecture-agnostic KCFI
implementation, which does work with the kernel, but doesn't produce
a stable code sequence for indirect call checks, which means
potential failures just trap and won't result in informative error
messages. Clang 17 includes a RISC-V specific back-end implementation
for KCFI, which emits a predictable code sequence for the checks and a
.kcfi_traps section with locations of the traps, which patch 5 uses to
produce more useful errors.

The type mismatch fixes and annotations in the first three patches
also become necessary in future if the kernel decides to support
fine-grained CFI implemented using the hardware landing pad
feature proposed in the in-progress Zicfisslp extension. Once the
specification is ratified and hardware support emerges, implementing
runtime patching support that replaces KCFI instrumentation with
Zicfisslp landing pads might also be feasible (similarly to KCFI to
FineIBT patching on x86_64), allowing distributions to ship a unified
kernel binary for all devices.

---

Changes in v2:
  - Rebased on 6.5-rc1.
  - Sorted Kconfig entries alphabetically.


Sami Tolvanen (6):
  riscv: Implement syscall wrappers
  riscv: Add types to indirectly called assembly functions
  riscv: Add ftrace_stub_graph
  riscv: Add CFI error handling
  riscv/purgatory: Disable CFI
  riscv: Allow CONFIG_CFI_CLANG to be selected

 arch/riscv/Kconfig                       |  3 +
 arch/riscv/include/asm/cfi.h             | 22 ++++++
 arch/riscv/include/asm/insn.h            | 10 +++
 arch/riscv/include/asm/syscall.h         |  5 +-
 arch/riscv/include/asm/syscall_wrapper.h | 87 ++++++++++++++++++++++++
 arch/riscv/kernel/Makefile               |  2 +
 arch/riscv/kernel/cfi.c                  | 77 +++++++++++++++++++++
 arch/riscv/kernel/compat_syscall_table.c |  8 ++-
 arch/riscv/kernel/mcount.S               |  9 ++-
 arch/riscv/kernel/suspend_entry.S        |  5 +-
 arch/riscv/kernel/sys_riscv.c            |  6 ++
 arch/riscv/kernel/syscall_table.c        |  8 ++-
 arch/riscv/kernel/traps.c                |  4 +-
 arch/riscv/purgatory/Makefile            |  4 ++
 14 files changed, 238 insertions(+), 12 deletions(-)
 create mode 100644 arch/riscv/include/asm/cfi.h
 create mode 100644 arch/riscv/include/asm/syscall_wrapper.h
 create mode 100644 arch/riscv/kernel/cfi.c


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.41.0.255.g8b1d071c50-goog


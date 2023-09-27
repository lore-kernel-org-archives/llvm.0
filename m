Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBFD1C6B3
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 22:48:02 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-565ece76be4so15274814a12.2
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854882; x=1696459682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WgWh/gTAC4d5wcFhfvGxWr9mtitpn8knrAdbajEBfhU=;
        b=YYu2HtO/6Ebpj+Ne7HQy0u+0kxoWF1mh1PLUt62VtKUH5xnKzDaVxz3B3CmufEYKYF
         YfxSc58mPiD4p/WdR2CEQbvWfC4rCSlxaTLzj+tmI0JV7Z4kQOoEVqZDxUIL1M4z7d4s
         6Lea//ccMj0xIuYT1ZgLoJE9yrtfXqwR8VBKq32lWdsfzEKwtYkSR3XnAe+My6jX5XdE
         aDJIUBC4wj9UTfw2F2efjtCQMR0MaOce9aQqdbkugUjC1eC2xVADl+OQg7TTryNeCLDX
         7eR0f8vEcjngERAZdzP8uu4pTu8YZXBiADqFv7qH7C31iDVcuJNvANpkwSKIaaxNdDob
         bopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854882; x=1696459682;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgWh/gTAC4d5wcFhfvGxWr9mtitpn8knrAdbajEBfhU=;
        b=EKEXcjViFBSQTwuhtyrA6JGk6seHbNmOyzVNvQh5Sc88lku4BNQ9WP5uG+09AtAUW6
         i5SWYa1CBCGMILdUuEILeX5f29GtK9uWz5tIxTogToPhOvUuehTpg2rpYx3elntQdrmB
         qh/cLLZhOh8nNupaT2WMLwxfK7/EbthQRFyPaXYtiqoUjQW9vBG5gno9QMC5uVgGg1UN
         +WxaSw1Ir4mYe5rmpbGhStKCCVQ0KTHRKzL5DQuxZl4Ohp+gYy0tdxPLissmT1GsfUe7
         WhRWMIwf3j9wFWANPhl+VpAcmKXBaHff3Jbp+bvGzGKN5Bt9L8eFUwLHuIolMWBdj/He
         SVXA==
X-Gm-Message-State: AOJu0YylxS7mTi6RCZdtzjtz+3AfYw/n1EMDW6fYgRzxL/PWjd0f2Ms3
	S/hjI0vF0C7zG06AhgMqAgmdqvF+rBkpjQHLyx4=
X-Google-Smtp-Source: AGHT+IGk7G47CUj9RF4pKzDPxTmtIoJ1wCsb9Pr7q3C8UWIAzHgCr3LMujULViUFT/Y4wYbyqLGeqN8JHqUBvqNtx3A=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:32c8:b0:1c3:4d70:6ed9 with
 SMTP id i8-20020a17090332c800b001c34d706ed9mr43384plr.3.1695854881902; Wed,
 27 Sep 2023 15:48:01 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:47:58 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761; i=samitolvanen@google.com;
 h=from:subject; bh=f76u/UaoOPWAzvVIRbNmavYgFKWbwPzMxrH4Tc8hYhQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdhYoTc+kz3ZoLrFhYKOOymIFWJZVZRQni9
 KhyoZ1LHfaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7rnpC/0fjS9A3U3PayoFxJDC7BIBn2TZclbDccTnDGN8dmOZRr0q32iccvz1rwMtx5qn8nLSZy2
 HTDLopQWMRD97unLAk17J7+oywB1UqD9qjuCnhmwY10hlZvYQs+jeFjKtaJDjldiXjVVR7g//bZ
 ZSbBsc5fj1bc39TUa1lCyKHTSTMQo6n1nzdKY19gEwdvmt9XaomfUDlCyACj7U1PZLQ1oZ/MGVt
 JOnItns+7CtNGbq28/mjQkuoZ8w04WsGDOAaAecbjIY9dk4BPaEgKT0/4ez+Q4Q8M/qnciOrVOf
 KNfcrOMSo1EtJcYzW3TR2pMeJ5m2fmNkiGgC/qGC/1mbXe/kwbF7t0BSYNILf+H8h/Ljaevmm8b
 JkiBgac+k3XCuZMRK59/xOpTrYl22a7HAwYW6hPdm3Ca2W6Y3O3EvAXXzT5gId7vYGo05iGLyYK wFDUIb2j886cBr0U7uZQ37b/x3wCTwF1iUcPlbNwodFIZuibDcFtx03CUsYAm5Tqvfiys=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-8-samitolvanen@google.com>
Subject: [PATCH v4 0/6] riscv: SCS support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
uses compiler instrumentation to store return addresses in a
separate shadow stack to protect them against accidental or
malicious overwrites. More information about SCS can be found
here:

  https://clang.llvm.org/docs/ShadowCallStack.html

Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
handling by adding support for accessing per-CPU variables
directly in assembly. The patch is included in this series to
make IRQ stack switching cleaner with SCS, and I've simply
rebased it and fixed a couple of minor issues. Patch 2 uses this
functionality to clean up the stack switching by moving duplicate
code into a single function. On RISC-V, the compiler uses the
gp register for storing the current shadow call stack pointer,
which is incompatible with global pointer relaxation. Patch 3
moves global pointer loading into a macro that can be easily
disabled with SCS. Patch 4 implements SCS register loading and
switching, and allows the feature to be enabled, and patch 5 adds
separate per-CPU IRQ shadow call stacks when CONFIG_IRQ_STACKS is
enabled. Patch 6 fixes the backward-edge CFI test in lkdtm for
RISC-V.

Note that this series requires Clang 17. Earlier Clang versions
support SCS on RISC-V, but use the x18 register instead of gp,
which isn't ideal. gcc has SCS support for arm64, but I'm not
aware of plans to support RISC-V. Once the Zicfiss extension is
ratified, it's probably preferable to use hardware-backed shadow
stacks instead of SCS on hardware that supports the extension,
and we may want to consider implementing CONFIG_DYNAMIC_SCS to
patch between the implementation at runtime (similarly to the
arm64 implementation, which switches to SCS when hardware PAC
support isn't available).

Sami


---

Changes in v4:
  - Fixed the C environment setup in head.S to use
    scs_load_current (patch 4).
  - Rebased to -rc3 to fix merge conflicts.

Changes in v3:
  - Dropped a now unneeded function declaration (patch 1).
  - Refactored call_on_irq_stack to use stack frame offsets
    based on Cl=C3=A9ment's suggestion (patch 2).
  - Rebased on top of v6.5.

Changes in v2:
  - Fixed asm_per_cpu with !CONFIG_SMP (patch 1).
  - Added a fix to the CFI_BACKWARD lkdtm test (patch 6).
  - Rebased on top of -rc6.

---

Deepak Gupta (1):
  riscv: VMAP_STACK overflow detection thread-safe

Sami Tolvanen (5):
  riscv: Deduplicate IRQ stack switching
  riscv: Move global pointer loading to a macro
  riscv: Implement Shadow Call Stack
  riscv: Use separate IRQ shadow call stacks
  lkdtm: Fix CFI_BACKWARD on RISC-V

 arch/riscv/Kconfig                      |   6 ++
 arch/riscv/Makefile                     |   4 +
 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/asm.h            |  41 ++++++++
 arch/riscv/include/asm/irq_stack.h      |   3 +
 arch/riscv/include/asm/scs.h            |  54 +++++++++++
 arch/riscv/include/asm/thread_info.h    |  16 ++-
 arch/riscv/kernel/asm-offsets.c         |   9 ++
 arch/riscv/kernel/entry.S               | 124 ++++++++++++------------
 arch/riscv/kernel/head.S                |  19 ++--
 arch/riscv/kernel/irq.c                 |  56 +++++------
 arch/riscv/kernel/suspend_entry.S       |   5 +-
 arch/riscv/kernel/traps.c               |  68 +------------
 arch/riscv/kernel/vdso/Makefile         |   2 +-
 arch/riscv/purgatory/Makefile           |   4 +
 drivers/misc/lkdtm/cfi.c                |  13 ++-
 16 files changed, 248 insertions(+), 177 deletions(-)
 create mode 100644 arch/riscv/include/asm/scs.h


base-commit: 6465e260f48790807eef06b583b38ca9789b6072
--=20
2.42.0.515.g380fc7ccd1-goog


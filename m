Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917423CF
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:49:38 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-52c30fa5271so6477083a12.0
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129778; x=1686721778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ99alEe0A23tymHcdv/vfT8nEQiGh2D6cQUBbX+NYU=;
        b=YC+K75o6oTdqYCv/UpwXe9gABJK307bP4yAL6WMj+c0OGsLbwkOJ/0OoSCS/Hfnwsu
         GE65E5xvfgH6srsEB4tPrXUaOlutSgYPtnJ9OnZa6Sfly4dUMHmFpX5971LIfNSqGIdP
         Nv2gRNBDawMmNUWqOTu0rbCvluknVfp9eY5z9QAJU2PYdGv+chHD3N6e9l7aDmV5kzWK
         lSJdnZNxeGgWdSd74Lab4pJ/OB2qUQOL81v5QcFRSIwoBmezMntHOYaPBw740unBgypm
         Fdcxp34uF51fGVRKTaWQuNCk7Asr2mpnyQ189by4GCzwMaNY9+Mm6vBizXEnrYzhR8lK
         UKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129778; x=1686721778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ99alEe0A23tymHcdv/vfT8nEQiGh2D6cQUBbX+NYU=;
        b=hscNfkkme7HWm2XP2HJhs+szM3TucpLz+S4dXVhnVwFFrXCUM41Ua/4jeQb8JKUBK2
         ufvCmxFc/J2b75LyjpyYOfbIMlBD9MDG6UJQoX+HxDrevH8+Lfya6hyqIn/hE8P8eY1g
         On3NO0IdIZ+2q+mwHw4ABvTY1Fs1g4DQNqsz9gx4IYv8ZMOn6EYnl8O9CmTfccO7dlNx
         YeeERgRSWj0SIZmHu17pNOU/0qBxrAoN3mzb92ESzIAZ0KL8XGLN6EeZH6MZTI1DjG4a
         9hIW/A4+OhbvKNCgx2qtPl3Zr7CBLJqTb1kd83o1CAqjbWADCfLkY8jQ5YJSfdCfUNN/
         CfKQ==
X-Gm-Message-State: AC+VfDy0/YW3rVjWh+4+cuz979/ohHc011ao/CX7Rv5t7OPHfomGDOJl
	TljxwKCOnLag3LtpK8I1HKDglw==
X-Google-Smtp-Source: ACHHUZ66EM/Ffo2wiDqrucRe8wNpu1TreTFryx+X27BDltpTe5DxTsemz+afopAg9iZvWFHQw1Mb4A==
X-Received: by 2002:a17:902:e9d5:b0:1ac:b52e:f3e5 with SMTP id 21-20020a170902e9d500b001acb52ef3e5mr18553911plk.43.1684129777671;
        Sun, 14 May 2023 22:49:37 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH V6 00/21] Add basic ACPI support for RISC-V
Date: Mon, 15 May 2023 11:19:07 +0530
Message-Id: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series enables the basic ACPI infrastructure for RISC-V.
Supporting external interrupt controllers is in progress and hence it is
tested using poll based HVC SBI console and RAM disk.

The first patch in this series is one of the patch from Jisheng's
series [1] which is not merged yet. This patch is required to support
ACPI since efi_init() which gets called before sbi_init() can enable
static branches and hits a panic.

Below are two ECRs approved by ASWG.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view


Changes since V5:
	1) Reordered commits in the series to avoid intermediate build failure reported by Conor.
	2) Updated hisilicon driver patch as per feedback from Herbert Xu.
	3) Rebased to 6.4-rc2

Changes since V4:
	1) Rebased with 6.4-rc1 which has ACPICA patches now.
	2) Split cpufeature.c patch into two by adding patch 2/7 from Conor's series [2]
	3) Updated caching RINTC logic to avoid global.
	4) Added driver patches to enable allmodconfig build at the start of the series.
	5) Updated tags

Changes since V3:
	1) Added two more driver patches to workaround allmodconfig build failure.
	2) Separated removal of riscv_of_processor_hartid() to a different patch.
	3) Addressed Conor's feedback.
	4) Rebased to v6.3-rc5 and added latest tags

Changes since V2:
	1) Dropped ACPI_PROCESSOR patch.
	2) Added new patch to print debug info of RISC-V INTC in MADT
	3) Addressed other comments from Drew.
	4) Rebased and updated tags

Changes since V1:
	1) Dropped PCI changes and instead added dummy interfaces just to enable
	   building ACPI core when CONFIG_PCI is enabled. Actual PCI changes will
	   be added in future along with external interrupt controller support
	   in ACPI.
	2) Squashed couple of patches so that new code added gets built in each
	   commit.
	3) Fixed the missing wake_cpu code in timer refactor patch as pointed by
	   Conor
	4) Fixed an issue with SMP disabled.
	5) Addressed other comments from Conor.
	6) Updated documentation patch as per feedback from Sanjaya.
	7) Fixed W=1 and checkpatch --strict issues.
	8) Added ACK/RB tags

[1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20230504-divisive-unsavory-5a2ff0c3c2d1@spud/

These changes are available at
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_v6

Testing:
1) Build latest Qemu 

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux after enabling SBI HVC and SBI earlycon
CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"


Jisheng Zhang (1):
  riscv: move sbi_init() earlier before jump_label_init()

Sunil V L (20):
  platform/surface: Disable for RISC-V
  crypto: hisilicon/qm: Fix to enable build with RISC-V clang
  ACPI: tables: Print RINTC information when MADT is parsed
  ACPI: OSL: Make should_use_kmap() 0 for RISC-V
  RISC-V: Add support to build the ACPI core
  ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
  RISC-V: Add ACPI initialization in setup_arch()
  RISC-V: ACPI: Cache and retrieve the RINTC structure
  drivers/acpi: RISC-V: Add RHCT related code
  RISC-V: smpboot: Create wrapper setup_smp()
  RISC-V: smpboot: Add ACPI support in setup_smp()
  RISC-V: only iterate over possible CPUs in ISA string parser
  RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
  RISC-V: cpu: Enable cpuinfo for ACPI systems
  irqchip/riscv-intc: Add ACPI support
  clocksource/timer-riscv: Refactor riscv_timer_init_dt()
  clocksource/timer-riscv: Add ACPI support
  RISC-V: time.c: Add ACPI support for time_init()
  RISC-V: Enable ACPI in defconfig
  MAINTAINERS: Add entry for drivers/acpi/riscv

 .../admin-guide/kernel-parameters.txt         |   8 +-
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig                            |   5 +
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/include/asm/acenv.h                |  11 +
 arch/riscv/include/asm/acpi.h                 |  84 ++++++
 arch/riscv/include/asm/cpu.h                  |   8 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/acpi.c                      | 251 ++++++++++++++++++
 arch/riscv/kernel/cpu.c                       |  30 ++-
 arch/riscv/kernel/cpufeature.c                |  42 ++-
 arch/riscv/kernel/setup.c                     |  11 +-
 arch/riscv/kernel/smpboot.c                   |  77 +++++-
 arch/riscv/kernel/time.c                      |  25 +-
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/osl.c                            |   2 +-
 drivers/acpi/processor_core.c                 |  29 ++
 drivers/acpi/riscv/Makefile                   |   2 +
 drivers/acpi/riscv/rhct.c                     |  83 ++++++
 drivers/acpi/tables.c                         |  10 +
 drivers/clocksource/timer-riscv.c             |  92 ++++---
 drivers/crypto/hisilicon/qm.c                 |   5 +
 drivers/irqchip/irq-riscv-intc.c              |  70 +++--
 drivers/platform/surface/aggregator/Kconfig   |   2 +-
 24 files changed, 772 insertions(+), 86 deletions(-)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/kernel/acpi.c
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

-- 
2.34.1


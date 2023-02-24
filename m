Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C704539D
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246701; x=1708782701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZukmKbhuckdgYPxcrfE3bKQ6TkEUIZBG4kNxEuFJMEs=;
  b=bcf5dK0AceYDByhTOLgGLHU6PC0bYN1OArEwbbrQG9ZY56KMkNoA8MNP
   W5nYLuSCp/bWG/s9KZsgo1qcGPnLfGkyIQbdKsDMxs6ncdJAUQ8iKUaDo
   s+doXSrKE92oRTL4la79pAg+GcC9VxFyNOlVRTFu5F3vM1octttVwYNPN
   /aCrB4KT80FpOvpsh4OMDA7lLwAte3ZAqVJ4QekMayNp6UZ0dmfnnSJdc
   l1OF/0GPvZ4U6AkLg4ikhnCaBUSTGDGg2a1KBBxFCOErABDzRPhNzcqV0
   FAPV98vy8vUkmmtgf9nTJkjTF4x3ZGauESzJQ4jWJDsBMhftxrncjZoK1
   g==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923444"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:30 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <conor@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with rust support
Date: Fri, 24 Feb 2023 13:50:44 +0000
Message-ID: <20230224135044.2882109-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224135044.2882109-1-conor.dooley@microchip.com>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374; i=conor.dooley@microchip.com; h=from:subject; bh=HpaH7oMTktYgKSCgvr9/FNMbXJinNGLWnda4ScFUHPo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/Dmwo8fSS+rnrslhV3QIxvewyGfVJjuHBOg8sXjq7yN4O SKzsKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETSHzEyNLGy7y/49uWRcuOr+Z2vC6 4smbJ76bE1dctbZCoUmMunr2X4X/Ar9bmz27Vrej8EeOez+1t/dfoyxTXEdtfO1T5qXzbdZgQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Miguel Ojeda <ojeda@kernel.org>

The rust modules work on 64-bit RISC-V, with no twiddling required.
Select HAS_RUST and provide the required flags to kbuild so that the
modules can be used.
32-bit is broken in core rust code, so support is limited to 64-bit
only: ld.lld: error: undefined symbol: __udivdi3

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/rust/arch-support.rst | 2 ++
 arch/riscv/Kconfig                  | 1 +
 arch/riscv/Makefile                 | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6982b63775da..197919158596 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 ============  ================  ==============================================
 Architecture  Level of support  Constraints
 ============  ================  ==============================================
+``riscv``     Maintained        ``rv64`` only.
+============  ================  ==============================================
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81eb031887d2..73174157212d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_RUST if 64BIT
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76989561566b..0d6fc4e25221 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -29,8 +29,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
-
 	KBUILD_LDFLAGS += -melf64lriscv
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
 else
 	BITS := 32
 	UTS_MACHINE := riscv32
@@ -38,6 +38,7 @@ else
 	KBUILD_CFLAGS += -mabi=ilp32
 	KBUILD_AFLAGS += -mabi=ilp32
 	KBUILD_LDFLAGS += -melf32lriscv
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv32
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
-- 
2.39.2


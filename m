Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572405;
	b=QhGrGirQ4iif7cPmv0AdI9BH4SPiDc/ldQrieM74rEPFggIGioYpedDWMphiJuvEoHJm
	 cCOqi7dcIisd2sVonbUVqBjUnFsrMTkjWWVmv1HotjMRMg6vwMt1F3HFkGXSss3X9Gt2o
	 qE15rUxb+TIkwtZ7tmy9eIW8ZIh7Akk0mUvbK0FlWMFgGNgp8flS4U2osxIvf40+m61PH
	 WqVqXzY/Q2IF8Q74CWtiiEFt0uNBE7Rshypjg8U+XqifEJjBmKifsCmMIu6BU424W2EhZ
	 2Vg9I23FaHYfhK/Yhu9zI3IBiieF7p8m5y70ySD9fhbzyZiDoZ/is0lbbWL2XzteS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572405;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AIMNKpLjvCoA5SiH6Ca79BEDaWg4eBPJUs04nG8GoDw=;
	b=5WNh5FIBcjS+7KBkHWaO1uQUy00tLrOUqDMvuud5XRUUvuUHJK9VnTIAyzLb0fAYUJ9N
	 LN/oYUts/g7toxg+N0oqsJF5aC48Con+rviBCpzUR1i3H+hE/u7/QlKN93ivxk4ukrhAq
	 KgptPScJZrQUDjCQn74GC3MK9IeKj6fX9R+aaMbIFVqJAPilSTpezC80Oaw8SXyiXl4W8
	 5F8AbU8XKGmzL2SpxQ4m2wc3cQpkYjzlR5nZRCP3MSScRTRrgMHHVsmt+U+hIVLL6H5L9
	 0A2UvQaQHSF/48ykny5k40nrwVTB4t+sEistBkIE87c8XdJaGMSX9kQk4bZd005auLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUy4HVYB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C161606A326;
	Wed, 25 Nov 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUy4HVYB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD661F000C6;
	Wed, 25 Nov 2026 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572405;
	bh=AIMNKpLjvCoA5SiH6Ca79BEDaWg4eBPJUs04nG8GoDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QUy4HVYBmUtfQBumSOInl8PscOLRFftHFWuSkpuS0aBJNPnMeSNN0vhcZWqPNZnX6
	 wZo/rE1XwnDbG/IZSHWwsSAKrXQ+eKsHZ3KCrx04APDhsTAWPrJZzVMg/SkwdRQd7i
	 h3GrE6KbwnWBwKV8H4TCazTbMWAPrR/ZawLZ/4p1qCcfZ7nYR+EAD1qYRWkSEAKIUQ
	 cr9hfTdehvRpPj82IZmGorvKARKx4jRgkkHLw1jw9ekoy1vgDfaugbsZPdCl6g6wiF
	 +9l2L3pgtUMX4Sjc0TP0TWHMj7P+onSKDwmzTzWX+tM2Ui3vih6Zm5t3+ezGzW1lir
	 j2d+QgnQj6ezA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wentao Zhang <wentaoz5@illinois.edu>,
	x86@kernel.org
Subject: [PATCH v3 14/19] x86: Enable Clang's source-based code coverage
Date: Tue, 24 Nov 2026 21:05:58 -0500
Message-ID: <20261125020603.3934222-15-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the sections of Clang's source-based code coverage in the x86
linker script and allow it to be used, including for the entire
kernel, on x86_64.

The coverage mapping is not part of the loaded image, but GNU objcopy
would keep it in the payload of the compressed kernel. Remove it there,
llvm-cov reads it from vmlinux.

Originally-by: Wentao Zhang <wentaoz5@illinois.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/Kconfig                  | 2 ++
 arch/x86/boot/compressed/Makefile | 5 +++++
 arch/x86/kernel/vmlinux.lds.S     | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3159852fd6b3e..44bb4a2f5655e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -89,6 +89,8 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_LLVM_COV		if X86_64
+	select ARCH_HAS_LLVM_COV_PROFILE_ALL	if X86_64
 	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 680ad803cba7d..ecb86fb1a35ea 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -117,6 +117,11 @@ $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
 	$(call if_changed,ld)
 
 OBJCOPYFLAGS_vmlinux.bin :=  -R .comment -S
+ifdef CONFIG_LLVM_COV_KERNEL
+# Only llvm-cov reads the coverage mapping, from vmlinux. GNU objcopy -S
+# would keep it in the payload of the compressed kernel.
+OBJCOPYFLAGS_vmlinux.bin += -R __llvm_covfun -R __llvm_covmap
+endif
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620a..d9f9dee635fcd 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -212,6 +212,8 @@ SECTIONS
 
 	BUG_TABLE
 
+	LLVM_COV_DATA
+
 	ORC_UNWIND_TABLE
 
 	/* Init code and data - will be freed after init */
@@ -417,6 +419,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	LLVM_COV_MAPPING
 	PROPELLER_DATA
 	MODINFO
 	ELF_DETAILS
-- 
2.53.0


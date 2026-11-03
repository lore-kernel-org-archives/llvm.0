Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670792;
	b=R2MfnHLuc6PZB4pxkmMyD4TDxxaiTkrPz9qFVuHTEjOf/VWCCOTs3O2y4c0uT54kWuIp
	 rMgdUPptGJ5MCrCUb08lgo6BDpv8ebmqc2J3cwwg7FiZMp4DL5Tea0xEJvNO3GIizIETE
	 4y+JkGcuvalUJWm+cREOBT33YtMr0XGcbms952zbIGME4QhdE5nagAmuYqOFK+0NjpkPB
	 JZiyTkAvboh0AP2uHWECl4mjJ0dzGDD+vpFGrKy2o5XMK1plFJK5ik9ngU8bHSnhwBslS
	 wDUFtQjjW/UfrdImYy7okxPIphANn9rhcbZLJZg2AbAaZmDFd2ojj7JmTKH8OXd+jRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670792;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Cfhcu7V7NlWHhSeuNE5qSXQk4BaHgts0jmefgeiMHVg=;
	b=f+a/s6oWNW7RridcnvqQX0/jQAXZBFPcj2bGz5p6EnXj92gBglHKnLbpHOxSSTcOrs+1
	 vzWMckXp0HZ8WOffpF2NkC3zoRNIKYLtGk/C6aCnTxRDfmqV6if2Eefqxh/AwpJHqsvkl
	 5w8TnsDnKTIHPbfgbE95vaa4GZ/H0xSBWgKverks0tvYb1Q6YCQpgdn/Q4RBY/UP+U4rb
	 8mTIKvaI16ZxOkpM9PcuWn5QLP/FgUvV3QOUHX1dFIfDcv/QelZnRMDixKDJTZcgdeLct
	 luXXw/gngdD8Lmck5diHjQWYR+aRdS4XCMcUnIaMwHx4vdXjoqV0RUvhF+8vstRe15g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AY3HuobY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA6606EE99;
	Tue,  3 Nov 2026 01:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AY3HuobY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF521F00A1B;
	Tue,  3 Nov 2026 01:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670792;
	bh=Cfhcu7V7NlWHhSeuNE5qSXQk4BaHgts0jmefgeiMHVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AY3HuobYJnYJ8J5BKWRvjs/iIVN7Iwqu+E8K511eiIhEdOZ2IKbW3RmWnVgD2jWds
	 zavmGUKGGG9LgI2aM0fuO1IkjkwuiHdNy17t/aYv8uaPyxIGg3zHtZc+LX5GsQcoMe
	 /jgrW3dwG5ZBdrAMyGlmUMYfVHClO6DmpEbxHV6F2PwFwlrlU8wyHmXw30aA726tkF
	 UVo0erOWO++BZ6nXAGtbA/LLoG6IKaPL3R5YyDRNcaqN0+QS01JLJOiIiBIRCsP+zv
	 6L+iIjAb/zQObphdN8SO5CqGio0EKEsL5pZE0cClHcPJR6pkF29c3nVqF33uUh0EW6
	 pkUlUHT4Rq7RQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Wentao Zhang <wentaoz5@illinois.edu>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v2 15/20] x86: Enable Clang's source-based code coverage
Date: Mon,  2 Nov 2026 20:52:33 -0500
Message-ID: <20261103015238.3780910-16-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

Originally-by: Wentao Zhang <wentaoz5@illinois.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/Kconfig              | 2 ++
 arch/x86/kernel/vmlinux.lds.S | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179b..988add4916411 100644
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
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620a..98f41b943fe63 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -212,6 +212,8 @@ SECTIONS
 
 	BUG_TABLE
 
+	LLVM_COV_DATA
+
 	ORC_UNWIND_TABLE
 
 	/* Init code and data - will be freed after init */
-- 
2.53.0


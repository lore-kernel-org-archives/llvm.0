Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188888;
	b=fxMQ3cKN+UxT5plTzUUrAxFpyw5WswU9HJbxTPlHRAuy5pbE8aFfIxBHRlY3vXKNUszj
	 z5D1s/IsYuRA3Q+nd8Bu+E83y44YyNmz6cR9hlvdO2lqUCz0tpriLSRkMpPdtYEDi07PN
	 JtmrFv7a8ELQ6C45zY4bDaM/nTMWgYQcaa9xXD/VNoMXXPA8WoUzKcoFdTn2SFi48oE7K
	 CoGjmGZhzGSPXI+w01uKWR+D6UosFz6KVRAKDykHDlLfSnrJrbTr10cEFBJ4epSqyZGQ9
	 Rr8y9PblE0fXmfLAVOAfpXxZqCeyhjOaGFZ4Csu80/qBK9BvhDKZpD7SA9ipgvpkEHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188888;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=L3bcO8YRRsgPSNJNkjw9aJlZUyGvdCG/w/uLRTpwFe8=;
	b=0vkhF5THKgLy3YGzOchHcbXK/gc3DofPgGX/nnh/W/FpScXMQXqh8uq+P/UxJFTbpJ6B
	 d7nRhnxO6J5YSimV5VZ7H4VlIiBqWuOT8GXGAm913baR2doNxrT3D6uj3X1jQhyst/Jrj
	 +etkB6OGz/Fm3lQZGJZSePXQQDNoR0WwSWsp4ihaEJhe+WHnSCP8+javDAR45SCkXKs0N
	 6Y/YSdMNOh/aLgXyLIeBuqqVN28FtN3J+Gdn4r+dLAftNQi4RO8q5Hz4pyfwsdMbqOmO9
	 wncNm8DNDtn/wexCPOCgOpAm0kPjEuI1Ko5ZFjtf2O2KHDkAivNS4SZKStWEmXMisOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtD1xeR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60562606A32A;
	Wed, 28 Oct 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtD1xeR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B48C1F031E1;
	Wed, 28 Oct 2026 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188883;
	bh=L3bcO8YRRsgPSNJNkjw9aJlZUyGvdCG/w/uLRTpwFe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TtD1xeR45adtBFPdpzWuX2HqO8tSqDHgmNuX7J36Wk9mbidlitaswFQW6UXqTxR7V
	 gkBU0MgDyEKzfk/JjNRFnYmi77QcZ9VK9KnYORQCP4t0RmGUaXtwFnMQqYtXaf/TWY
	 qaASSP857DuNEPL8tC7rFWMCIDlH39pKhfdj8S9tlpFpHqxVlCYN63Nvj+1ohkhKJH
	 8qCLvQKP47i5YMuw9svSk0hNLJYVptpCXCwfysWuPlxJeG6zwEUUeWvDqTUdcNqF0j
	 cGzytxXXFkp03CfbVHaSrcS9RhyuIDZDMo5zxZIAu9VwPDGNbKvnlS3sQ8/HTnJzUW
	 lotVg2TL8VWcw==
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
Subject: [RFC PATCH 15/20] x86: Enable Clang's source-based code coverage
Date: Wed, 28 Oct 2026 07:59:39 -0400
Message-ID: <20261028120034.871983-16-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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
index a5e29ffd5ddc3..0c26d61350553 100644
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


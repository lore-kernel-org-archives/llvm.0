Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C971BE844;
	Tue,  1 Oct 2024 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782119; cv=none; b=SAqBaaoEDNV0JAKV3WUDm5q9o0SLj0ajgXUcNs1obVZCnA/cTUJCQhaVqo7VQxXOTfhTo+KYkHHA9r/uigWluzN7HTvcH2QlaPkm3ubTrCMc+lcBbXWYDNSQrs3Wg68Cjf4RYEM2qSe0e7uq7UbGFXYKR4CAnvITT5b9kh4886s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782119; c=relaxed/simple;
	bh=KmqvyWGAP2MUjMmA9fNXKIZ1pZgMR6vCNbIUx1juy7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dpd8/22FCq0OEmjqcmGWlqPeFFSYhAv4KLYvzKyXUXaFBKw2ej2HgLea8nv72hzrDpby88VCWhFvvjU/7FdVB+cRXrEYJn/Ab0t9huKUFioQmCIGN9sBfLRMYmZX0bKKJ8sOmpzxGOtcbgxzpDb/SBLGb08klPaF1bhPWVynIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuiLKoyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuiLKoyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F70C4CEC6;
	Tue,  1 Oct 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782118;
	bh=KmqvyWGAP2MUjMmA9fNXKIZ1pZgMR6vCNbIUx1juy7s=;
	h=From:To:Cc:Subject:Date:From;
	b=KuiLKoyWUokatFDV/DS7e+wT0IlNXFkx2mIt+uIFiJlUmIWuiiUXQTiYJyZ8jOW8u
	 Y0WSBveMHbSBHoVEm4vURkR18zchCGaPgbkvf1dO2j1/BsvpY16fMY6unMpPcXfjWo
	 n/QiROVPt2wJiLcONyWz0jspT5eWySVr2ytUvAgujdhLNqqwC7ImGvaLWP/yERBfk/
	 rh8FMe76dqHM91vXrMAuA60dffuvvou+aq45Sd3rPI8VIbwSyehYUAXqQsyrzBcL/S
	 sjT2iEtNoboVhtRYy4LKHYqIZASa1k9iLoP3S/zwL4jf5/sWz9Cn8O9ET0/S2gtOJh
	 ilgZWKRZIOGgQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1] RISC-V: disallow gcc + rust builds
Date: Tue,  1 Oct 2024 12:28:13 +0100
Message-ID: <20241001-playlist-deceiving-16ece2f440f5@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=C14oYIXOukeZfX/D92cINn4baWT04L73uEfZDoXdTw0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGm/75w7rpbkt043eH983KZld+rslI76i/J0Hj/h12n65 1fGyeyOjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzE2Jrhr1zlc+G/WWc6cxl7 M8MzWd85zd3cvvxAy6ltd85HtDUG9DL8lbi7+/ausgyR0JSKqFOxq8KtDGYmTk504zm26PO2xrT DnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

During the discussion before supporting rust on riscv, it was decided
not to support gcc yet, due to differences in extension handling
compared to llvm (only the version of libclang matching the c compiler
is supported). Recently Jason Montleon reported [1] that building with
gcc caused build issues, due to unsupported arguments being passed to
libclang. After some discussion between myself and Miguel, it is better
to disable gcc + rust builds to match the original intent, and
subsequently support it when an appropriate set of extensions can be
deduced from the version of libclang.

Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/ [1]
Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/ [2]
Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust support")
Reported-by: Jason Montleon <jmontleo@redhat.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Palmer, this is yours to take.

CC: jmontleo@redhat.com
CC: ojeda@kernel.org
CC: alex.gaynor@gmail.com
CC: boqun.feng@gmail.com
CC: gary@garyguo.net
CC: bjorn3_gh@protonmail.com
CC: benno.lossin@proton.me
CC: a.hindborg@kernel.org
CC: aliceryhl@google.com
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: nathan@kernel.org
CC: ndesaulniers@google.com
CC: morbo@google.com
CC: justinstitt@google.com
CC: rust-for-linux@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: llvm@lists.linux.dev
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/riscv/Kconfig                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 750ff371570a0..54be7ddf3e57a 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
 =============  ================  ==============================================
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        ``riscv64`` only.
+``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22dc5ea4196ce..76843584960c2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -177,7 +177,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
-- 
2.45.2


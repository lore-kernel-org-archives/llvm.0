Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F961990C7;
	Fri, 23 Jan 2026 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210465; cv=none; b=ltFcbcgT4R7mwZw+bQBvF7+gUwUW6achp5Mkplu+9ng605ACJQTiqMpwgaLyRDsvPFb+a7ofSxsKrvX1hag+jIXDJK6C9BH+qBM/Lf/1G4rW58uvPwePoaj751t+JP8+4/YPKL3yxvLSLem/piWSuxbpKAm0xsCt0dIL5B55rZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210465; c=relaxed/simple;
	bh=h1OhVeo4a07CpgPIzNHE/qIXeJzhLVmyvBwc5/+BbUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dEFLrmEbITldpJvdb7MzzOw16v+sUqennM/um7vW7wGZfNYtVXBWBsb1dlEefpZGL/BmAHbfpWtDn1SBWzaMH1i5F/ninKM7ngSIXkvNo2nxLlyzdcrzE9TcA/Widt7JgtV6Vz1ieFUKr/ea6YcoGnL+gg+u5neNJB89mli/3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jabh+gCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jabh+gCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBB5C4CEF1;
	Fri, 23 Jan 2026 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769210465;
	bh=h1OhVeo4a07CpgPIzNHE/qIXeJzhLVmyvBwc5/+BbUk=;
	h=From:Date:Subject:To:Cc:From;
	b=jabh+gCLRyivnx4BAbwWGHToRDgrPiDJWb9f9NiSxDFLyT7MXbIaETx7XL7eV5fxw
	 VG/SzHJFRlcN0vlmAjG2/qTMLfFa06JDBO+Kad0XPMdhGoRakigVKvZXen4QpGRYAS
	 Ib5EBAQ5Z5eugWjX9lB0aYOtEghBDdLe5yNOaU3u6GKD2cqUpxLZg1RYeFTzMdZMEV
	 mroAOlqMMrFEEpxyS03ZFXblUQr3+prOVNlCrZ68mxxZryTZETaH7loVduKtnEvSmd
	 zIkQqi6eyhHKgxSYO6iwUtNzT1sy+R4tdiBEoJ6NvielvuFz0gbzg2AoyBhR+gWstr
	 wzOFe1NSnbl7A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 23 Jan 2026 16:20:28 -0700
Subject: [PATCH] x86/entry/vdso32: Omit '.cfi_offset eflags' for LLVM < 16
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-x86-vdso32-wa-llvm-15-cfi-offset-eflags-v1-1-0f412e3516a4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CMBBA4auQWTtJfxDRqxgXbZliTaWkg5WEc
 HerLr/Nexsw5UAMl2aDTCVwSFOFPDTg7mYaCcNQDUqoTkilce07LAMnrfBtMMbyRHlE5wMm75k
 WJB/NyGhPthX+rFvVC6i1OZMP6+90vf3NL/sgt3zzsO8fAhMseIsAAAA=
X-Change-ID: 20260123-x86-vdso32-wa-llvm-15-cfi-offset-eflags-b7b40f934280
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 x86@kernel.org
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=nathan@kernel.org;
 h=from:subject:message-id; bh=h1OhVeo4a07CpgPIzNHE/qIXeJzhLVmyvBwc5/+BbUk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJklTHGlgf8yM547HjstuWZb5lyWXdceTD2kI55T0+Hzo
 rfXyMSlo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkaxDDPwt5/sPHTyn+eM73
 8ttHo60ZvsK7OuwNdslk/lc6cbFs1lqGfzrzDmS9uzavpTxfx6Zz1Qdu6+ZNqcXStYLHxRN5cn6
 Z8QIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 884961618ee5 ("x86/entry/vdso32: Remove open-coded DWARF in
sigreturn.S"), building arch/x86/entry/vdso/vdso32/sigreturn.S with LLVM
15 fails with:

  <instantiation>:18:20: error: invalid register name
   .cfi_offset eflags, 64
                     ^
  arch/x86/entry/vdso/vdso32/sigreturn.S:33:2: note: while in macro instantiation
   STARTPROC_SIGNAL_FRAME 8
   ^

Support for eflags as an argument to .cfi_offset was added in the LLVM
16 development cycle [1]. Only add this .cfi_offset directive if it is
supported by the assembler to clear up the error.

Fixes: 884961618ee5 ("x86/entry/vdso32: Remove open-coded DWARF in sigreturn.S")
Link: https://github.com/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a2f4d3b1a30459ccf5b7 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/entry/vdso/vdso32/sigreturn.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/entry/vdso/vdso32/sigreturn.S b/arch/x86/entry/vdso/vdso32/sigreturn.S
index 25b0ac4b4bfe..8dfcf18f9582 100644
--- a/arch/x86/entry/vdso/vdso32/sigreturn.S
+++ b/arch/x86/entry/vdso/vdso32/sigreturn.S
@@ -22,7 +22,15 @@
 	CFI_OFFSET	cs,     IA32_SIGCONTEXT_cs
 	CFI_OFFSET	ss,     IA32_SIGCONTEXT_ss
 	CFI_OFFSET	ds,     IA32_SIGCONTEXT_ds
+/*
+ * .cfi_offset eflags requires LLVM 16 or newer:
+ * https://github.com/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a2f4d3b1a30459ccf5b7
+ * Check for 16.0.1 to ensure the support is present, as 16.0.0 may be a
+ * prerelease version.
+ */
+#if defined(CONFIG_AS_IS_GNU) || (defined(CONFIG_AS_IS_LLVM) && CONFIG_AS_VERSION >= 160001)
 	CFI_OFFSET	eflags, IA32_SIGCONTEXT_flags
+#endif
 .endm
 
 	.text

---
base-commit: 436ee609df7da5671ae5a717d1df867313868baf
change-id: 20260123-x86-vdso32-wa-llvm-15-cfi-offset-eflags-b7b40f934280

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


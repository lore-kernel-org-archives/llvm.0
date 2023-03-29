Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C57B
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 00:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD99C433EF;
	Wed, 29 Mar 2023 00:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680048512;
	bh=3WcLfPtzwae60OgYt8w2UUmVi5MZ0pntGg6lh7c8c0g=;
	h=From:Subject:Date:To:Cc:From;
	b=MkUiaEunlf0RfwvHRvsgdbcDTuS1UTjZQkyctTPtaa/B3dLXW+WPZKSWaIss2UnzI
	 aLG2lqW3c47zaiti7+ESdVFnqCBzEPD0d+zE4oCzfkmhxaZtJBCVviygCJ3vb1vYJV
	 PlN+/Icj3JU3y623Q653BkLDzLwoTeqXaMn8Cw91XsI/qT97tuOcskGSrPXgJ7jTO0
	 nrGGlisY12jjpLG5N18TgG39Hj2ixNfsQte/WTqQvj1KHnC0kY8M011uJ1gyxlRb9K
	 qyPTZ3yH4vgp3bOKULnsJipC3JH6ikIOQbz8fRGLgWblz87dzwMD3E0m0TdqV59rkq
	 W2tSkNSOrIQ9g==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.10 0/4] Backport of e89c2e815e76 to linux-5.10.y
Date: Tue, 28 Mar 2023 17:08:28 -0700
Message-Id: <20230328-riscv-zifencei-zicsr-5-10-v1-0-bccb3e16dc46@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHyBI2QC/x2NwQ7CMAxDf2XKmUxdp06MX0EcupCySKigRJsG0
 /6dlpufLds7GKuwwaXZQXkVk1cu0J0aoDnmB6PcC4N3vne9P6OK0YpfSZyJpQgyxYCdwyGEcUi
 eIo0MpT9FY5w0ZprrwlPysmFoO9d+avxWTrL9r69Qbbgdxw9zQ+8+kAAAAA==
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: conor@kernel.org, stable@vger.kernel.org, llvm@lists.linux.dev, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3WcLfPtzwae60OgYt8w2UUmVi5MZ0pntGg6lh7c8c0g=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCnKjXWdFqd3fr72sfPkfDc50wC5Sn6n6uLvblnvwhada
 o3/EFzaUcLCIMbBICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbiysvwPW+ld6emhXLMOuHc
 7xMUkmUyD+9t1Ty49MHC5xszWYy1GP6HZzrOfufr+cpo53nrWdIt889rJUULs5tUdU2Z9ONMXxw
 DAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This series is a backport of upstream commit e89c2e815e76 ("riscv:
Handle zicsr/zifencei issues between clang and binutils") to
linux-5.10.y, with the necessary machinery for CONFIG_AS_IS_GNU and
CONFIG_AS_VERSION, which that commit requires.

While the middle two patches are not strictly necessary, they are good
clean ups that ensure consistency with mainline. The first three changes
are already present in 5.15, so there is no risk of a regression moving
forward.

If there are any issues, please let me know.

NOTE: I am sending this series with 'b4 send', as that is what I am used
to at this point. Please accept my apologies if this causes any issues.

---
Masahiro Yamada (2):
      kbuild: check the minimum assembler version in Kconfig
      kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS

Nathan Chancellor (2):
      kbuild: Switch to 'f' variants of integrated assembler flag
      riscv: Handle zicsr/zifencei issues between clang and binutils

 Makefile                |  8 +++---
 arch/riscv/Kconfig      | 22 ++++++++++++++++
 arch/riscv/Makefile     | 12 +++++----
 init/Kconfig            | 12 +++++++++
 scripts/Kconfig.include |  6 +++++
 scripts/as-version.sh   | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/dummy-tools/gcc |  6 +++++
 7 files changed, 127 insertions(+), 8 deletions(-)
---
base-commit: ca9787bdecfa2174b0a169a54916e22b89b0ef5b
change-id: 20230328-riscv-zifencei-zicsr-5-10-65596f2cac9e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


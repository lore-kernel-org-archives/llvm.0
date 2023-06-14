Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB3D2FF
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B6BC433BB;
	Wed, 14 Jun 2023 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686765880;
	bh=jdDKzmGvzb5JkbH6WO3k3gITUbYrNHhzoxnPSYvB7lM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gbY9o9Sv96L2mDAOEFQIp/HUIqWoQcvBSVgLpsEbr3hLsZI/2M2mMiAJ1ZqLmGHI7
	 b5qQceLTP5im2Oq1QC27bnvd5XCsIXJepJ/ZZ3OKcD9WRNOrYwNlLFdTf54nDxwnQ2
	 13oBgkaN05K28jMqDlpflqXU0v1RWW30I+/UG5Q/MIfI68zAchR1gZ5/R1hVovnIDl
	 jlXCRUyvzz+PVoaXdRXnCQnD/ecNyg6ufevuUYhApFihIyLBcSNPtUuUd+el3aqzsI
	 52dCC0lo53Ib0QicYYiBEds6mHuw7o7shDEb6HE7kb/3AP71qFSM7TCq9++dFLHd9S
	 QnWMD/ubvC+HQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 14 Jun 2023 11:04:35 -0700
Subject: [PATCH 6.1 1/4] x86/boot/compressed: prefer cc-option for CFLAGS
 additions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-6-1-asssembler-target-llvm-17-v1-1-75605d553401@kernel.org>
References: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
To: gregkh@linuxfoundation.org, sashal@kernel.org, ndesaulniers@google.com
Cc: naresh.kamboju@linaro.org, stable@vger.kernel.org, llvm@lists.linux.dev, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Anders Roxell <anders.roxell@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829; i=nathan@kernel.org;
 h=from:subject:message-id; bh=YoHx4AYzPRErVjfq+b+2h01kFBpw2gCfB8pgnZ77x0Y=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCldjKaHV4Uari/5v0z5lvsT7aTQHy5VDkLz5Zrn9imXf
 Fjy3Naso5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEykIYyRYd16vf7UyCnebje2
 zc8/eLLAeLFiit1BJ5/5Hode96TcnMfIMKWysOPDMymn2HCrzxapm4Rrwhcvex0V935T/d3uRxI
 LmAE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

From: Nick Desaulniers <ndesaulniers@google.com>

commit 994f5f7816ff963f49269cfc97f63cb2e4edb84f upstream.

as-option tests new options using KBUILD_CFLAGS, which causes problems
when using as-option to update KBUILD_AFLAGS because many compiler
options are not valid assembler options.

This will be fixed in a follow up patch. Before doing so, move the
assembler test for -Wa,-mrelax-relocations=no from using as-option to
cc-option.

Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 3a261abb6d15..15b7b403a4bd 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -50,7 +50,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during

-- 
2.41.0


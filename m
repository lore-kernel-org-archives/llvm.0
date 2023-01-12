Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8A38A
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 03:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A5BC433F1;
	Thu, 12 Jan 2023 03:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673492735;
	bh=7eL7HbrvfN88cop/Q2OiR0WRyscekkrF/kn1kocOdzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cM243Il/+AcusLGvUKYUP/b1fOvFSGOnq5VS9e9oA+nb5adZ6M/dmd/JqpDpKEspv
	 sIOQaCFxHLCsZnmziMFGgBTnhGf/IPdiM+N0mUD3p25up1kPsdrK4nwaLaNSWRxJTr
	 yBQybChZFzDoLEbltDw9gZpL+NHXQviZg114KPTWVT8fHWkMH7RuashTuSf0MgbhPw
	 ntLIe7LVZi/QwjvEF4cByqejkX7fAU61UiTKAxKSdzy6HTUFN2xU6BRC5HAT1Tw8t9
	 UF5kzMVoi/98jSrZ68UTB1VtSNy6m+V6mt+0vGHPqpSDCr3s8GzQ5u3eL+EGLM5Nbb
	 GejdVCdmYty2A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Jan 2023 20:04:58 -0700
Subject: [PATCH v2 01/14] x86/boot/compressed: prefer cc-option for CFLAGS
 additions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-1-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To: masahiroy@kernel.org
Cc: ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4Z/QjeIidCHott5q7MuOWLlOJLESu2McA9pepWg0ceM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K37xf7Z0Llnnrx/JsCbGknHpuuBb52Q/qGVPaOSKf2de
 8yG1o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkcxnDf4/jpRrtYd++cq/+a7fi6x
 ZNfe/10ptn6/V7Lw+ozrj37D3DP9sFXBXO+V46/eZV9tM73baV6i4M297zX+PxA65l//wFuQE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

From: Nick Desaulniers <ndesaulniers@google.com>

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
---
Cc: tglx@linutronix.de
Cc: mingo@redhat.com
Cc: bp@alien8.de
Cc: dave.hansen@linux.intel.com
Cc: x86@kernel.org
---
 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 1acff356d97a..6b6cfe607bdb 100644
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
2.39.0


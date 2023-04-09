Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD51FDA
	for <llvm@lists.linux.dev>; Sun,  9 Apr 2023 14:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601D6C433EF;
	Sun,  9 Apr 2023 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681052045;
	bh=sR52KGMqxK6Vt6XY9CUVOsj3Fqld4NSi7ibY6IQOrls=;
	h=From:To:Cc:Subject:Date:From;
	b=c7+bCLim2D3xhHj9JAL0ZLjWdWnrvkOKClHaZBXuRTJFRMzoD8+7yJCMn65AyhspJ
	 r/A8d6GIy75OYca0Ddu2CRsJQzfb6/ttOugEx92E3i+u0hQF7CJlv+1l3c9fZPqdEt
	 7kehPv01N4jrHKBwDghBZA5gWap3UGFm7P19NLQqAQ8yPSo9/PdcSqmei6+punbR02
	 CoFynNaG9cf9QaRFNCKr+yGod6Ajoewn/kCBzpR0egG9Qggebl5e+fCbE/rXiCX3Fj
	 ZnH3QCzmboEVdeLxLQf1TQ0lx3TKAr4NuZVb4F7OwoSB27ubtdDp1gvW2MJytgEgAm
	 vH/w1ohaBirdw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: add $(CLANG_CFLAGS) to KBUILD_CPPFLAGS
Date: Sun,  9 Apr 2023 23:53:57 +0900
Message-Id: <20230409145358.2538266-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When preprocessing arch/*/kernel/vmlinux.lds.S, the target triple is
not passed to $(CPP) because we add it only to KBUILD_{C,A}FLAGS.

As a result, the linker script is preprocessed with predefined macros
for the build host instead of the target.

Assuming you use an x86 build machine, compare the following:

 $ clang -dM -E -x c /dev/null
 $ clang -dM -E -x c /dev/null -target aarch64-linux-gnu

There is no actual problem presumably because our linker scripts do not
rely on such predefined macros, but it is better to define correct ones.

Move $(CFLAGS_CFLAGS) to KBUILD_CPPFLAGS, so that all *.c, *.S, *.lds.S
will be processed with the proper target triple.

Reported-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.clang | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 70b354fa1cb4..93ca059cc3b8 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -38,6 +38,5 @@ CLANG_FLAGS	+= -Werror=unknown-warning-option
 CLANG_FLAGS	+= -Werror=ignored-optimization-argument
 CLANG_FLAGS	+= -Werror=option-ignored
 CLANG_FLAGS	+= -Werror=unused-command-line-argument
-KBUILD_CFLAGS	+= $(CLANG_FLAGS)
-KBUILD_AFLAGS	+= $(CLANG_FLAGS)
+KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.37.2


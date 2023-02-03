Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E54AD5A
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 19:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C22AC433D2;
	Fri,  3 Feb 2023 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675453337;
	bh=IYzoVTIy3jIOIBOxqEJpVTIpJjJqrpgiE5pvZS0VH/s=;
	h=From:To:Cc:Subject:Date:From;
	b=JHGDBupaxkFj6TtnW5AILupv53mu/iLhuc83Mpx09BuiNansznU1Msi/43oXapNzZ
	 lBVUv3c7cs0uVN8ZqG/2x1ryXeTbRGfG5ds+doV956A2ZN2ynlleYi/ADneOHhjnsn
	 OSiuDpAi7ULiBfwlugRhuD4npPePuICKj+8XC7qXhH9nRlgnisR2vq0QIY5ZlKtRPu
	 CbUUs8XPanZZhgxD6hB7a8lrIcjTTzcI52rFuBQCopOh46L1tSoHtuWVkjE6Eutc+2
	 nRznQMRP/WdDEXAHVm0VXX9QG1cDTBRI3UmK9qnNjKEh8JTrishReM5gqkymPIt+1H
	 8CMZ6dnSyUnnQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-hardening@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] randstruct: temporarily disable clang support
Date: Fri,  3 Feb 2023 11:42:01 -0800
Message-Id: <20230203194201.92015-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Randstruct with clang is currently unsafe to use in any clang release
that supports it, due to a clang bug that is causing miscompilations:
"-frandomize-layout-seed inconsistently randomizes all-function-pointers
structs" (https://github.com/llvm/llvm-project/issues/60349).  Disable
it temporarily until the bug is fixed and the fix is released in a clang
version that can be checked for.

Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/Kconfig.hardening | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 53baa95cb644..aad16187148c 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -280,7 +280,8 @@ config ZERO_CALL_USED_REGS
 endmenu
 
 config CC_HAS_RANDSTRUCT
-	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
+	# Temporarily disabled due to https://github.com/llvm/llvm-project/issues/60349
+	def_bool n
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"

base-commit: 7b753a909f426f2789d9db6f357c3d59180a9354
-- 
2.39.1


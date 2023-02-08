Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D386643
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 06:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802ECC433EF;
	Wed,  8 Feb 2023 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675839143;
	bh=1P71LfU0+7FJhlIeYP8dlsmXxGhh3Acgaywm3d013ZY=;
	h=From:To:Cc:Subject:Date:From;
	b=RyDU3ix2lD9bR86sxLas/tTYmH28sDiYAj6aJu6q1z1coHn1ODc7pYp24nYo3EMex
	 XAuMLx/oCkn3UOiv+LgZCzSXDYTBSKPgSNYvtYbg4rFoeHi5lEMvrey8kBp12VBh3B
	 EOHEH+kYvp+Huh18W7A7c9XLb/Wzv/5TfoTMQTobJP1JXCZDKFyOP/F0Ib19L72Hpd
	 5R7KWA//vxQsXCiKuq1b3vPigUT1JRH3wY2D9K0QlekGSHM0YOfFukMByEi+w8bElH
	 hQH5RuQ6BPTSrzPm2Q/rtC+R7iaYhMYmrVzOWKC5R70Ht0E++MuEKCE8+n0Idt5aYE
	 RtebwbDa60i3w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-hardening@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Cc: Bill Wendling <morbo@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] randstruct: disable Clang 15 support
Date: Tue,  7 Feb 2023 22:51:33 -0800
Message-Id: <20230208065133.220589-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

The randstruct support released in Clang 15 is unsafe to use due to a
bug that can cause miscompilations: "-frandomize-layout-seed
inconsistently randomizes all-function-pointers structs"
(https://github.com/llvm/llvm-project/issues/60349).  It has been fixed
on the Clang 16 release branch, so add a Clang version check.

Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/Kconfig.hardening | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 53baa95cb644f..0f295961e7736 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -281,6 +281,9 @@ endmenu
 
 config CC_HAS_RANDSTRUCT
 	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
+	# Randstruct was first added in Clang 15, but it isn't safe to use until
+	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
+	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"

base-commit: 4ec5183ec48656cec489c49f989c508b68b518e3
-- 
2.39.1


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE335470E8C;
	Sun, 11 Oct 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758069; cv=none; b=nRjKlYzowWeLhlplU8Ehfr5WpmeivxBxO7xVVNVLq+djKbIyiBdJprHwobZdz2ohILgsZ1PXwryQF25U4m0CfxlkmLR69/0mgXQAdyb/UuHCb61xhZNPgCeActJUl29ihHd8bZMhyJJQ/2c0dM/eR4RQcBTRAx1c12o3y1drqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758069; c=relaxed/simple;
	bh=7WmmSPyXE6mHUoHCOETbigOtF+ziAlXuDG5P1F0K5mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+ywHj28mmWB0e1+lJH8pY9zN9CXENajYYHQwuL2w1JwW6H1Xgo0VwAjb6GsydXylgKvAwY+hB66XdprXZbtMOm02n6uo/d9xCrO8BSP8JLUib9E4wZYHwQrliZixthq1oOGMlwF/zYHDa+tYoAVHFR+5THyv9N7NqSsqk1RQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMI76Z/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMI76Z/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9448F1F0089D;
	Sun, 11 Oct 2026 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758068;
	bh=UFX2vBDE0ACUiejwt6JUXxcMRwnhC0Ppz/CwF4UTqtE=;
	h=From:To:Cc:Subject:Date;
	b=AMI76Z/Cxi2nuj4kamLSIA5od891ZuCgNtq9ha1bIrbufnMwWhRF+C5fZQbQaTfkF
	 eMj7ZtVCrRNJ3EF5CL9sWoPnfQPdFD8um8SPRYw7E2OySebdYdm28yBSleOXiexbFS
	 kfk1zIcRkNzAkrfB6Y0tUCLbge2MdTWXJYSNgLVFVs/q7+a5o2bcY7Ag9P2/jgD+cu
	 pZf7UtT5P5yumG5qTLy66Fs4eamb4WKWWlq3vYWE0xc6ivwBqsB6y1e21f+Km4+gjo
	 39WvI+SS23pF0/urH/gtGsNjrsbXGOVrESxPSnQFMoKLM+eCrB+nD9OG68Ta0TS+9w
	 D2Q+zUdh+bCdA==
From: Sasha Levin <sashal@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] samples: pidfd: fix userprogs typo
Date: Sun, 11 Oct 2026 18:33:42 -0400
Message-ID: <20261011223358.2327625-14-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Makefile adds pidfd-metadata to "usertprogs-always-y", which kbuild
does not know, so the sample has not been built since the conversion to
userprogs, even with CONFIG_SAMPLE_PIDFD=y.

Fix the variable name. pidfd-metadata.c builds without warnings with
gcc and clang for x86_64 and arm64.

Fixes: 60fb0b1239719 ("samples: pidfd: build sample program for target architecture")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 samples/pidfd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/pidfd/Makefile b/samples/pidfd/Makefile
index 9754e2d81f70d..d82409f7061f3 100644
--- a/samples/pidfd/Makefile
+++ b/samples/pidfd/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-usertprogs-always-y += pidfd-metadata
+userprogs-always-y += pidfd-metadata
 
 userccflags += -I usr/include
-- 
2.53.0


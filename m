Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918072
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 09:22:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A291561B27;
	Tue, 16 Nov 2021 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637054529;
	bh=yXXJ7ZYZdmMULFDotLIAJ3kbIk7CEz04rAyjIO+l1eY=;
	h=From:To:Cc:Subject:Date:From;
	b=pB4niVDsLcz4ei4hW3J6NtH9dck6Dhntvx0NEuxxkODTCGHU4dG70CdFCGvgqTXsc
	 JFOEjbBHQyfGnm4xyEyUbmRDs9WTk2t+HTUwhQJB6BGlhBHc2w9027TnDZmQaYc0dp
	 9Nh+Uj331Lbon78tvc5h8PIC4O7uOz15lNvuEj3Vp5gseHULZ3xgSqwQtgQPTQROc8
	 /B9Sd4SzJBVLEQIyECXT99yh+d4f4BbJVnL8mVOZsTzKKHYxD9qni1btURec/culEi
	 jrtyTibNsdvsE0nhScm42AEgGOearp4h/Wd+bWHx3E+BlR3kHYOhRJ+a5U/ZuQI/kB
	 XImwcNDHy0vwA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-omap@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] omapfb: add one more "fallthrough" statement
Date: Tue, 16 Nov 2021 10:21:54 +0100
Message-Id: <20211116092204.4116587-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang warns about one missing fallthrough that gcc ignores:

drivers/video/fbdev/omap/omapfb_main.c:1558:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]

Add it here as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/omapfb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 3d090d2d9ed9..a6a8404d1462 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
 	case 1:
 		dev_set_drvdata(fbdev->dev, NULL);
 		kfree(fbdev);
+		fallthrough;
 	case 0:
 		/* nothing to free */
 		break;
-- 
2.29.2


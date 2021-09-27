Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BAA3FC8
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 12:14:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F028260F94;
	Mon, 27 Sep 2021 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632744854;
	bh=c44S59J8vMtBO5Jgm/qFk/4jrGFfqAT+vfRj3LdVSAE=;
	h=From:To:Cc:Subject:Date:From;
	b=NYLCmpZli0BJ4jzHBW4yHtHyWM/Wxej1PRkK4l0y64wGYQpraLajNTpDwbDuYzpLY
	 9bvC+Et8aCDsGckoTtJvSzzpphcF2+se+EWJIliwUME/n165+O1BiWBMDidI9HIc2d
	 ztDLgkaIwzXCKqA8hMaKTRwz90e73JxdLZGyouEdPFQ7yzUfBCwFxVkp+MQuo2Ez9v
	 oihjsY63KzVq6i/C1NB+c2SUSW4hssZn/hJBksUr2P4UXHG6t3mG6aNgg1nmCk7CAf
	 9HYHUBXYM4o/ln6Xe7BbVL7qd3dhX4fjF+qjpIAzjnILEwPAM4JsgEHOZ5Pjm4XANI
	 wMuuGiapHMZFA==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pierre Ossman <pierre@ossman.eu>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] cb710: avoid NULL pointer subtraction
Date: Mon, 27 Sep 2021 14:13:57 +0200
Message-Id: <20210927121408.939246-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-14 complains about an unusual way of converting a pointer to
an integer:

drivers/misc/cb710/sgbuf2.c:50:15: error: performing pointer subtraction with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtraction]
        return ((ptr - NULL) & 3) != 0;

Replace this with a normal cast to uintptr_t.

Fixes: 5f5bac8272be ("mmc: Driver for CB710/720 memory card reader (MMC part)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/misc/cb710/sgbuf2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cb710/sgbuf2.c b/drivers/misc/cb710/sgbuf2.c
index e5a4ed3701eb..a798fad5f03c 100644
--- a/drivers/misc/cb710/sgbuf2.c
+++ b/drivers/misc/cb710/sgbuf2.c
@@ -47,7 +47,7 @@ static inline bool needs_unaligned_copy(const void *ptr)
 #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	return false;
 #else
-	return ((ptr - NULL) & 3) != 0;
+	return ((uintptr_t)ptr & 3) != 0;
 #endif
 }
 
-- 
2.29.2


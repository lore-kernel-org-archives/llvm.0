Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1C72
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 09:43:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B85C61157;
	Mon, 27 Sep 2021 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632735812;
	bh=Qo5N2+4XdsKjUHvt2oBi52TBPhJ3ME/G/ELJqQK9RKk=;
	h=From:To:Cc:Subject:Date:From;
	b=vLFWLOZbv7aiqpKTuuB76Lv3lX5+Ga0leEjW9XNc4YO6ggLtmJ0oc8f8B6oosi7u2
	 QkvtifMd/uCxxbDecXZvcV5HAbuRWlAgSSqjsDWNeJxVJKwn8BGhlrNqCxJbTqjkvr
	 /2rGvYfl8mmyKt3mXVW8hptgQtLdHTzHG1YKbonPs6xUbcB7nmwHexI47R8R1DMmbl
	 MUlstFAMIMm3uV1r8KCDJ2NeMraKLYKtGqSvwlZoI7MbsxuTc8Kzh1xtx+VV9moqUJ
	 yh1MB6o/FVrLJbxEKh9e8daOA1VAIgxfWHXVM4cRexZSaISd64+v4aEO8cGDJR+ZKD
	 g9F8F9/0XUQVA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Martijn Coenen <maco@android.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Dan Schatzberg <schatzberg.dan@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] loop: avoid out-of-range warning
Date: Mon, 27 Sep 2021 11:43:00 +0200
Message-Id: <20210927094327.644665-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang warns that the sanity check for page size always succeeds
when building with 64KB pages:

drivers/block/loop.c:282:27: error: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
                           ~~~~~ ^ ~~~~~~~~~

There is nothing wrong here, so just shut up the check by changing
the type of the bsize argument.

Fixes: 3448914e8cc5 ("loop: Add LOOP_CONFIGURE ioctl")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 7bf4686af774..51315a93b399 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -277,7 +277,7 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
  * @bsize: size to validate
  */
 static int
-loop_validate_block_size(unsigned short bsize)
+loop_validate_block_size(unsigned int bsize)
 {
 	if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
 		return -EINVAL;
-- 
2.29.2


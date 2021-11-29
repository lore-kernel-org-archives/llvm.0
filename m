Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C692C87
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051B6C53FD3;
	Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179277;
	bh=cvDcFaDZVEW1u/gAhNbQDP9i1EmPWvMAVO+rzVJt8UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDA1Q9rsnDrm+hHvttboWsJuGAPuy/3d9fyfQ23IueJVZbr+aMpCOqklJt3U+ORoK
	 t1pIY4Rg1GwFFFV/Uaa7XIDE4Wq1WaMA2TOoM+xz6CRYjGoHzZYsj7Lbqq7PotdSSt
	 bWUq0GoNdKaTuy3SW5bsyqQFEH8mzpCQzPmhyo2RFATHGSg2n5tpqLX+6NH1UGnIhU
	 iqCJ6t9+iL0/zADu5LeVTsmhL4vYZv0l9TgAin5nPbpJ+8MmuQrJHmdD0uTwlSC0cV
	 czb3TDNao9phOiHV3T4t3vQH8l6OXXXhAwpVTS8EUInQme+bL+orlxiv2o/IG5UVl8
	 S67L0j8X/zr+w==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RBu-SX; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 16/20] media: davinci: vpbe_osd: mark read reg function as __always_unused
Date: Mon, 29 Nov 2021 10:47:48 +0100
Message-Id: <0c086fea0d3f0771f6c8627e99edb719e282a49c.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638179135.git.mchehab+huawei@kernel.org>
References: <cover.1638179135.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Such function is currently unused, but could be needed in the
future. So, keep it, marking it as __always_unused, in order to
avoid a clang W=1 error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/platform/davinci/vpbe_osd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe_osd.c b/drivers/media/platform/davinci/vpbe_osd.c
index 91b571a0ac2c..32f7ef547c82 100644
--- a/drivers/media/platform/davinci/vpbe_osd.c
+++ b/drivers/media/platform/davinci/vpbe_osd.c
@@ -45,7 +45,7 @@ static const struct platform_device_id vpbe_osd_devtype[] = {
 MODULE_DEVICE_TABLE(platform, vpbe_osd_devtype);
 
 /* register access routines */
-static inline u32 osd_read(struct osd_state *sd, u32 offset)
+static inline u32 __always_unused osd_read(struct osd_state *sd, u32 offset)
 {
 	struct osd_state *osd = sd;
 
-- 
2.33.1


Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7A868
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 715AE604D1;
	Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637781216;
	bh=gHNlvFuvp7pBQTa3UhrpW3kfmpC3Up1K10+Lv71IU4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B31HiaKbFidWXbfwPrdvCnENO4dhSY92pcM0DGe/DJkc5c6xmYNhHkXsz0J03oRIU
	 Gz7OeAbFyIKJ6qOMZ98m4Nl90fZxFSocPiBm3Fsz66JDwUwo07J1Q6reuxwYISdsYp
	 COAilNJhQbSGKNDt0yS9+bnSpYhDGRFz3w5+R2Grt/8Mhloi4aP5L/Jda3NCdZJimI
	 VX4SAYRAphY+iTjWu+h4WnewTTLmZN/uJjeXOIIiq4TgmWcjqnHUVa0a9P2LVjma7u
	 J/5ro6ymzKCVzJd5yjGN9Me5+Le6GCye+3jxL7+B9zCrMPvrEv7vAY9nXivu1F1YHO
	 faUm8jjnyB5wA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mpxhs-004Q5r-M0; Wed, 24 Nov 2021 20:13:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 15/20] media: imx290: mark read reg function as __maybe_unused
Date: Wed, 24 Nov 2021 20:13:18 +0100
Message-Id: <163ccefbbdf07512fe1a84c1531754df75a64378.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Such function is currently unused, but could be needed in the
future. So, keep it, marking it as __maybe_unused, in order to
avoid a clang W=1 error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bf7a6c37ca5d..caab830f8c72 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -363,7 +363,7 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 	return container_of(_sd, struct imx290, sd);
 }
 
-static inline int imx290_read_reg(struct imx290 *imx290, u16 addr, u8 *value)
+static inline int __maybe_unused imx290_read_reg(struct imx290 *imx290, u16 addr, u8 *value)
 {
 	unsigned int regval;
 	int ret;
-- 
2.33.1


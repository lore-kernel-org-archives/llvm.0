Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C472
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423C5C004E1;
	Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179276;
	bh=f974R1GQ3CA5550xZG/h8JPur17WQ/6bdI+wsFzXxXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UC/HYEx9ROToK4CsU5X1Z/pKq3l907BaT/JNjG8PpzYohI9FVKbv9/DWgKKtmEuJ+
	 SmP6YnIiI/YmabhfgB7aTpUhk6LJ6YukEk1vbBMbwwmXw0oJDzXnHAeWC7KEvPUlr4
	 ml3rI9uf/SuSRiMjRYGEIYaAN8tNVCT3ucc6IHKFjknpFPmfbVlxyyfncRrrivh4ts
	 TlHQamih1drbR2WfBSNLQFRxiDG7RcSAsT3pY1ZjxVpSlhxjQY4Q/iu7lSX8X4/Sk1
	 2c49spSnMWczXflCwFKwyyCxho35mWWS4y4nwZY5vEylleuYdBoIU7skGUFbohiylC
	 4E/5s3LBFJ2yw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RAw-4S; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 01/20] media: adv7842: get rid of two unused functions
Date: Mon, 29 Nov 2021 10:47:33 +0100
Message-Id: <f16ce2e275bbe38582e6bb9416c9c7c92bb42f95.1638179135.git.mchehab+huawei@kernel.org>
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

Those functions just call a V4L2 core macro, and aren't used
anywhere. Get rid of them, in order to avoid clang warnings with
W=1.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/i2c/adv7842.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 7f8acbdf0db4..9d6eed0f8281 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -256,21 +256,11 @@ static inline struct v4l2_subdev *to_sd(struct v4l2_ctrl *ctrl)
 	return &container_of(ctrl->handler, struct adv7842_state, hdl)->sd;
 }
 
-static inline unsigned hblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_WIDTH(t);
-}
-
 static inline unsigned htotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_WIDTH(t);
 }
 
-static inline unsigned vblanking(const struct v4l2_bt_timings *t)
-{
-	return V4L2_DV_BT_BLANKING_HEIGHT(t);
-}
-
 static inline unsigned vtotal(const struct v4l2_bt_timings *t)
 {
 	return V4L2_DV_BT_FRAME_HEIGHT(t);
-- 
2.33.1


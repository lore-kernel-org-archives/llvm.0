Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1102C93
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BEEC53FC7;
	Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179277;
	bh=lyjOfRRquo5cdbI3gpJqeiWDs1+gFT1wXowGwbJ8mMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S91kmsM0YvUzBmKwjE4ZtmvsqsB7X+5SXz7RRD8O3EXWXfZ2r6H/rk92xK1SCARA5
	 jBJon1m3DMCAiSQTqaX46Hqw/YH40ycutk0+oPprlPb4CgwUxsKnGWxwJGELgQLg86
	 OtBwRRv+iixXjgK3M3b3q0LMwKT61WPy8Hgb8WPCr3w5TUiaAJnMTrfqsDYPPwmssz
	 oeTBXpytLD+3vovqS8F1D+56O7h7/GDDnhgbK9BUiHpHuBGFarMpCfZIpEKbLR9cqR
	 jF3k1sb3ylWs/pJaxvK4qFd3BLrwNxFf3EszD1F+o4ySsBB4CzRA7T/1FLVO910dz6
	 tIppjm6t7pwBA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RBq-QZ; Mon, 29 Nov 2021 10:47:54 +0100
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
Subject: [PATCH v2 15/20] media: imx290: mark read reg function as __always_unused
Date: Mon, 29 Nov 2021 10:47:47 +0100
Message-Id: <2471c2ecdf023fc3014d1ad544f2b0e9436fc9ff.1638179135.git.mchehab+huawei@kernel.org>
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

 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bf7a6c37ca5d..99f2a50d39a4 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -363,7 +363,7 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 	return container_of(_sd, struct imx290, sd);
 }
 
-static inline int imx290_read_reg(struct imx290 *imx290, u16 addr, u8 *value)
+static inline int __always_unused imx290_read_reg(struct imx290 *imx290, u16 addr, u8 *value)
 {
 	unsigned int regval;
 	int ret;
-- 
2.33.1


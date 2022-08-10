Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C3318E
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 01:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B7DC433C1;
	Wed, 10 Aug 2022 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660093711;
	bh=gDpZ800zuPi6XDQp4C0dv++Rl8lv0u6lVZ0kAvYcyxo=;
	h=From:To:Cc:Subject:Date:From;
	b=I4WtNltDw7RjbFxENBifLW3+OiG8lw8/Jz0a0jrR+uwxaw+8zEaf9DLpCYzlDEyo6
	 5jRb7tJkSBdGG+a8nW3sSZ+Q3T3kMFgtjcb9J1yeP+FWTQRhLHNEUpvIc5AnKBMl7u
	 JB80tzys/ze1IShnCWVO/W02G11gRfQesIKCOx15HyD1QmW58+zF9hIs2O/1q0tprI
	 Uzt3W2bIPw9CPvO/tw0Yf6RJG0sFRjfGF7Q/33jrCgjb8TEW2abYzNs1xbMZrAM6+f
	 s3tsJt71azux//4MTS3/Bx9AE+SIHTPQwMKd7ghf7uPsw/2Z4KtuvS0OCz82nuCkze
	 SCdcuNkOjIGyQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
Date: Tue,  9 Aug 2022 18:08:09 -0700
Message-Id: <20220810010809.2024482-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change in clang strengthened its -Wbitfield-constant-conversion
to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
only be 0 or -1, not 1:

  sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
          dev->gclk_enabled = 1;
                            ^ ~
  1 error generated.

The actual value of the field is never checked, just that it is not
zero, so there is not a real bug here. However, it is simple enough to
silence the warning by making the bitfield unsigned, which matches the
mchp-spdifrx driver.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Link: https://github.com/ClangBuiltLinux/linux/issues/1686
Link: https://github.com/llvm/llvm-project/commit/82afc9b169a67e8b8a1862fb9c41a2cd974d6691
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 4850a177803d..ab2d7a791f39 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -196,7 +196,7 @@ struct mchp_spdiftx_dev {
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
-	int					gclk_enabled:1;
+	unsigned int				gclk_enabled:1;
 };
 
 static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)

base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
-- 
2.37.1


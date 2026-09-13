Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6662C21D9;
	Sun, 13 Sep 2026 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320575; cv=none; b=H3n+M+0Ypg97y/EA/e75rwwrxgBExOpuEJyzFOjzW4HBEG+dV2UrtqtqiCkicsBAtVPWqheKVff4LkesK43O+pgKNalIhwEw7zxKxW/Sbc46Wun7hrx/yd6RoklQ6UK1RJdmEPoflOdvS+1A7+9wXy9wDpw3GFO6wJXJG2JgETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320575; c=relaxed/simple;
	bh=lOrKYRaPl8XLl31+ffH36idveiWNwLMGGkj+ZDaIzbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9KQUOLJAmUo9BFcK3C6lZxWna1xd1nKMGoEn9p13MLFsp9N0OWvOEe6vrqZi0tBxZpobIjU5EalSRKquSBxgSYrR9L8wBs5EWyu0pk4DtLXr79WV8JWRplor4PvHdD5Td9eKPkz5JRej6GU1Jgj7iOIdR6CoRTDQG97yQAzO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoRr7LEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoRr7LEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2F21F000FF;
	Sun, 13 Sep 2026 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789320574;
	bh=QKvBVSZkpVAXfRFRpnE9flJzkDgDOAnlGZWWB7mxBu8=;
	h=From:To:Cc:Subject:Date;
	b=aoRr7LEqOK81q1v5DnMEB108n310fPmR+8lLaWhIec5oQJfU1qeo3pX2rgrV9fY0b
	 SYdZIY3y7cMZgiMN3Q7fb94EkMQiTFVaSpNE2mrPA9lx59EWYVXOoxAkuYh/hb5mAl
	 dBeo2C1SG5G+erEV0L71FiDPuDC9Dd0ID9YLFSZ3ADv2ium8x9yWe/aBbUwodzcVea
	 epdW6nDf/tWNCLNSU5ItyK5R6ZYUefIDseigB8joUMmW375wRTEJPYilqgThDMvm9T
	 I53q9W7GiKy1qLSfYXK9bEts7oDEKB489R9R73offLjHaEHJyy7LrbXLlZXYzXdH/w
	 Nlu7hfswihebw==
From: Sasha Levin <sashal@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] phy: phy-mtk-dp: Fix pdata array members initialized as pointers
Date: Sun, 13 Sep 2026 13:29:29 -0400
Message-ID: <20260913172930.1150324-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building arm/arm64/i386 allmodconfig with clang fails:

  drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: incompatible pointer
  to integer conversion initializing 'u16' (aka 'unsigned short') with
  an expression of type 'const u16[4]' [-Wint-conversion]
  drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: initializer element
  is not a compile-time constant
  drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: suggest braces around
  initialization of subobject [-Werror,-Wmissing-braces]

14 errors in total, one set per offending member.

off_ana_lane, off_dig_lane and driving_params are declared as arrays in
struct mtk_dp_phy_pdata:

	u16 off_ana_lane[MTK_DP_PHY_MAX_LANES];
	u16 off_dig_lane[MTK_DP_PHY_MAX_LANES];
	u32 driving_params[PHYD_DIG_NUM_DRV_PARA_REGS];

but the SoC data instances initialize them with compound literals. A
compound literal is an object, not an initializer list, so this is not
an array initializer: the member is initialized element-wise from a
scalar, the first element gets the address of the literal truncated to
u16/u32, and the remaining elements are zeroed. Hence the three
diagnostics above - the pointer-to-integer conversion, the address not
being a compile-time constant, and the missing braces.

Arrays are the right type here, since both members are indexed per lane
and driving_params is sized with ARRAY_SIZE(), so drop the casts and use
plain braced initializers.

Found by KernelCI builds of the linus-next tree.

Fixes: ae859204b519 ("phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata")
Fixes: 7cf38eb0ab59 ("phy: phy-mtk-dp: Add support for digital and analog calibration")
Fixes: 6fe4d5beac72 ("phy: phy-mtk-dp: Add support for MT8196 eDP PHY")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 7108b16d33a27..dbef4a4bd60a9 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -758,9 +758,9 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 
 static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.off_ana_glb = 0,
-	.off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
+	.off_ana_lane = { 0x100, 0x200, 0x300, 0x400 },
 	.off_dig_glb = 0x1000,
-	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
+	.off_dig_lane = { 0x1100, 0x1200, 0x1300, 0x1400 },
 	.regs_ana_glb = mt8195_phy_ana_glb_regs,
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
@@ -773,7 +773,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 		.pmos = 8,
 		.nmos = 8,
 	},
-	.driving_params = (const u32[]) {
+	.driving_params = {
 		[0] = 0,
 		[1] = 0,
 		[2] = 0,
@@ -788,9 +788,9 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 
 static const struct mtk_dp_phy_pdata mt8196_edp_phy_data = {
 	.off_ana_glb = 0x400,
-	.off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
+	.off_ana_lane = { 0x0, 0x100, 0x200, 0x300 },
 	.off_dig_glb = 0x1400,
-	.off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
+	.off_dig_lane = { 0x1000, 0x1100, 0x1200, 0x1300 },
 	.regs_ana_glb = mt8195_phy_ana_glb_regs,
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8196_phy_dig_glb_regs,
@@ -803,7 +803,7 @@ static const struct mtk_dp_phy_pdata mt8196_edp_phy_data = {
 		.pmos = 8,
 		.nmos = 8,
 	},
-	.driving_params = (const u32[]) {
+	.driving_params = {
 		[0] = 0,
 		[1] = 0,
 		[2] = 0,
-- 
2.53.0


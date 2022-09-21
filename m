Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9795CB4
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC2C43143;
	Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663775676;
	bh=xFoYiczSMpmkPDUMzBxSpprsVJENIuKg5r3Cj61wDmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IcKH+J2Eus6q+ZNUnO6YylwMuH8V+a4a0E5a8AKaEX1tX+r+c+o95s28x4uLHkT7x
	 U0/ejrbwyVctgsKkmilT9pg61lSX23DR+bvMT+Kzkp5Em9txwuwnLNqbWj4CdF34ey
	 feAQFP2G1uzHrupqvy2S5Q1tvfoPW7V1jDF1HOeu5FIzZeQoxwTJdDbG9RnvZx3ylo
	 +xwxH/ZHaCRgQAyMrnXhCsn0dkgQLrzIFV02SrMg7lpGl0WjjZwPudYmjW34dwav8e
	 WwaN4MDhxRzHdXBwA/dwAXsi+g5ixUbizF++KtVsogFDr/l3o1pXCfvpyMnR8YYDom
	 NfQFqt1/A9iuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sasha Levin <sashal@kernel.org>,
	hjc@rock-chips.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	ndesaulniers@google.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 7/7] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
Date: Wed, 21 Sep 2022 11:54:25 -0400
Message-Id: <20220921155425.235273-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155425.235273-1-sashal@kernel.org>
References: <20220921155425.235273-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit b0b9408f132623dc88e78adb5282f74e4b64bb57 ]

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
				     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cdn_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220913205555.155149-1-nhuck@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index dec54c70e008..857c47c69ef1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -276,8 +276,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
-				       struct drm_display_mode *mode)
+static enum drm_mode_status
+cdn_dp_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
 	struct drm_display_info *display_info = &dp->connector.display_info;
-- 
2.35.1


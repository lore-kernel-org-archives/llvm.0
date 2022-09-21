Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9D5C9C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 15:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4FFC43140;
	Wed, 21 Sep 2022 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663775688;
	bh=VwNcnLR2/LA/fz5sKeoJt9Vzelm+E+Rs4audF7yv7p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z1+yq/aofyxj8frjclUkVBNyjhJcUqhnKroNAlsY8Sf7VEGFkC4m6kPyeB83hOiQl
	 zhywn4TAzCJCS7KyMH3QvsC+YAloyXL46gtAb5uGDVE3Knq3gQLyr3Ve5oM8DVAdbM
	 3Rh74WhjpQHyyPY2H69VIb8Ex+7ONTD0zdikhqv3qvHCqmCyzl0kDOhFm9ZJh/52MO
	 OxzAob9OYqSwJw1ge8th/JBlviEiGh87GBVZ+56Zw0UdzAji3oPgr//C+aO14sstCn
	 cKvr7TxKqnWzA8V6FfQjcj5fkX37DDtysL1EGKZTsTk9/yVm1rv8MNF50rVioPXgmA
	 aPxMxn3wEWsYQ==
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
Subject: [PATCH AUTOSEL 4.19 3/3] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
Date: Wed, 21 Sep 2022 11:54:43 -0400
Message-Id: <20220921155444.235446-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155444.235446-1-sashal@kernel.org>
References: <20220921155444.235446-1-sashal@kernel.org>
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
index 3feab563e50a..3f992e5a75c9 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -284,8 +284,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
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


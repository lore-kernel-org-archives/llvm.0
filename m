Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B54662A
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 02:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D551FC433D6;
	Fri, 11 Nov 2022 02:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668134151;
	bh=PEHzwfO/VIiHVS3KPMtQeWVmGCOUzoW4YxeEJJBvGXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n9V/PkYJJK7PACBCCId5LBO/hqIq/J9/Efw+VKdMrtxQ6QnblPj+patptUnlwOpBn
	 cjgA6gjujhiwgEqUOaCI5sdNvdUSlom1gc7O9W9gGQhDLSBb9CUHzxl+iLWIo7L1PD
	 WwIHdWfSgpbkbBO6VKGv4ISHPzJ/Ie+/1H9gqewNLkHm1272ExQuN/zDx/ls5DdLOL
	 qYb6a9mVlnU/DYNM5ZvxKzV30lhhUwVq69jkXC9ux70HPHppViqGWFCryGzmr9wvlJ
	 swIeGqixgApxdE3SsYGcpeanNenc8dTOeeTuReeY+Zy4sTZOtLXAJ0OkqHDQ8DfJ0t
	 /9ZV9wKXoDeaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	daniel@ffwll.ch,
	shawnguo@kernel.org,
	ndesaulniers@google.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 3/5] drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
Date: Thu, 10 Nov 2022 21:35:43 -0500
Message-Id: <20221111023545.228051-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111023545.228051-1-sashal@kernel.org>
References: <20221111023545.228051-1-sashal@kernel.org>
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

[ Upstream commit fc007fb815ab5395c3962c09b79a1630b0fbed9c ]

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of imx_tve_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220913205544.155106-1-nhuck@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/imx/imx-tve.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index f91c3eb7697b..cc300ed456e1 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -237,8 +237,9 @@ static int imx_tve_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int imx_tve_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+imx_tve_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
 {
 	struct imx_tve *tve = con_to_tve(connector);
 	unsigned long rate;
-- 
2.35.1


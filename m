Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB31C2E
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 23:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BA9C433D7;
	Sun,  9 Oct 2022 23:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665359507;
	bh=e2MOGsW3Sw0izmu4mIRAI9u1xSXTQ8njfIvLl1YfdIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YFQYcqdEwKy8h4+rM/089iQt+SU0eqkPd0SMpzUR+XfzFDgTpojm+VBWlZLNwT+QE
	 kEoWcgasDeQDKEKvEK1KOVTAdY1yL158uXJ8X+hXwyeBPnnfKnMOIuHeBWGb5eqFfi
	 fmYmnYrAqF+/YsEUiJPg80igXqENueLQa2Q/wkqtB8sRZDgXfK4jV4QEsr66k8j80d
	 DOfxMM6U8mc6vb85t01Q5L4OWfobwcXhBA+Yy5XurgtR/rQdIrpr8R5hsuzRIUbwPk
	 uqnutixPaZqMy1sqFORtrIEo3F2rrScmYUO4a2/R/jq8RkIbUVUdoHDiNnFtmt84kW
	 P8KVyo/vb35xw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Inki Dae <inki.dae@samsung.com>,
	Sasha Levin <sashal@kernel.org>,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	krzysztof.kozlowski@linaro.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 38/44] drm/exynos: Fix return type for mixer_mode_valid and hdmi_mode_valid
Date: Sun,  9 Oct 2022 19:49:26 -0400
Message-Id: <20221009234932.1230196-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
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

[ Upstream commit 1261255531088208daeca818e2b486030b5339e5 ]

The field mode_valid in exynos_drm_crtc_ops is expected to be of type enum
drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
                                   const struct drm_display_mode *mode);

Likewise for mode_valid in drm_connector_helper_funcs.

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mixer_mode_valid and hdmi_mode_valid should be changed
from int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://protect2.fireeye.com/v1/url?k=3e644738-5fef521d-3e65cc77-
74fe485cbff6-36ad29bf912d3c9f&q=1&e=5cc06174-77dd-4abd-ab50-
155da5711aa3&u=https%3A%2F%2Fgithub.com%2FClangBuiltLinux%2Flinux%2Fissues%2F
1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 10b0036f8a2e..8453359c92e8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -922,8 +922,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	return -EINVAL;
 }
 
-static int hdmi_mode_valid(struct drm_connector *connector,
-			struct drm_display_mode *mode)
+static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
+					    struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 65260a658684..8d333db813b7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1045,7 +1045,7 @@ static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
+static enum drm_mode_status mixer_mode_valid(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *mode)
 {
 	struct mixer_context *ctx = crtc->ctx;
-- 
2.35.1


Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E72C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 03:11:15 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0V-m4t3W_1639624265;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0V-m4t3W_1639624265)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 16 Dec 2021 11:11:05 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: robdclark@gmail.com
Cc: sean@poorly.run,
	quic_abhinavk@quicinc.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/msm: remove variable set but not used
Date: Thu, 16 Dec 2021 11:11:03 +0800
Message-Id: <20211216031103.34146-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code that uses variable mdss has been removed, So the declaration 
and assignment of the variable can be removed.

Eliminate the following clang warning:
drivers/gpu/drm/msm/msm_drv.c:513:19: warning: variable 'mdss' set but
not used [-Wunused-but-set-variable]

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d94053..59e30192cdf6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -510,7 +510,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
-	struct msm_mdss *mdss;
 	int ret, i;
 
 	ddev = drm_dev_alloc(drv, dev);
@@ -521,8 +520,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	mdss = priv->mdss;
-
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
-- 
2.20.1.7.g153144c


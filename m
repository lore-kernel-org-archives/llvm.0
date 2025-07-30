Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3E21FF2B;
	Wed, 30 Jul 2025 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859501; cv=none; b=qwvucm7lvUFd8cd2DvAuhwsRB/YGqHvkk8RTDR7CjFPqoFpJXPOmA/2+bU1EcH5ysu4bgVaWhVSpf0TyOfH//N4cdVBSJkv9AszQXQFf8EXceR2vk5tSOJF9liFZ7xPkSe+QuVRIKa59SdXxPFKIsPOY3NUxXtm617skTSmZ4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859501; c=relaxed/simple;
	bh=lGANFSUGVJuOs7RkjlhNySfv8QsiOn3t9/P2gJicYgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsDN6aUafxHvhVidjJooUxlKzBiqglMT4fJ6vdYdzubX4PGeE0k2ucWNR6ZZAXiMJblAY4x1JCjvd316ASlL+tRI//kso7v7yd9h9SNMMpactAOATXDmoD0nR3RJId36XyuSgF65HzR6Cu4+GWFpdMaBgH/INJxMpKo0IejBSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201603.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202507301511303437;
        Wed, 30 Jul 2025 15:11:30 +0800
Received: from localhost.localdomain.com (10.94.10.113) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 15:11:27 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <lkp@intel.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Wed, 30 Jul 2025 15:09:18 +0800
Message-ID: <20250730071002.2697-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250730071002.2697-1-chuguangqing@inspur.com>
References: <202507300646.kTchyjvh-lkp@intel.com>
 <20250730071002.2697-1-chuguangqing@inspur.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20257301511302ee24eee9004cca4580053c0ddbd2814
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

We encountered the following errors while compiling drm_vram_helper.ko

ERROR: modpost: "drm_gem_ttm_print_info" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
ERROR: modpost: "drm_gem_ttm_mmap" [drivers/gpu/drm/drm_vram_helper.ko] undefined!

The functions drm_gem_ttm_mmap and drm_gem_ttm_print_info are defined in drm_gem_ttm_helper.c. This patch select CONFIG_DRM_TTM_HELPER on CONFIG_DRM_VRAM_HELPER to resolve the undefined symbol errors.

Signed-off-by: chuguangqing <chuguangqing@inspur.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..01a314fdc9a8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -226,6 +226,7 @@ config DRM_BUDDY
 config DRM_VRAM_HELPER
 	tristate
 	depends on DRM
+	select DRM_TTM_HELPER if DRM_VRAM_HELPER != n
 	help
 	  Helpers for VRAM memory management
 
-- 
2.43.5


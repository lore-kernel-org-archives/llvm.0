Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2A20E6;
	Wed, 30 Jul 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860687; cv=none; b=HJNT/yqiMzwMzMd2pUCwJ1fPb+6WadaPOF12iPxBAZzYNqWGIlUZDiwf25p/PWCBjCS/HwjPaGDwBwbE7FOq8ajYn5W1JDEBt5zsoei9A3mql0FBd1Sz1OMrTw0AplpIuse7MxL2jwb7YuCtp9LEaWC+NeTvqUdfQyW5JyMdpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860687; c=relaxed/simple;
	bh=lGANFSUGVJuOs7RkjlhNySfv8QsiOn3t9/P2gJicYgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIPteG1HgsgDdEv/pwt7lpbOmYUyN+CYbppslSVWxEKkjVAWjzZe2Op8fuoHAbc6TpLS6OTQ+QW0P0fGQt6OpfT7j3L3cfEYPibcjGXa65CNnJHL7F7m3t8vuHz6qmcPuIPLR06WT2y7E4AyawP8WUooYqcTZWvb67CLxb0ph4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201603.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202507301530076602;
        Wed, 30 Jul 2025 15:30:07 +0800
Received: from localhost.localdomain.com (10.94.10.113) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 15:30:06 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <lkp@intel.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Wed, 30 Jul 2025 15:29:19 +0800
Message-ID: <20250730072919.3720-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250729060728.82402-1-chuguangqing@inspur.com>
References: <20250729060728.82402-1-chuguangqing@inspur.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20257301530073bb4d7eec5c6854491af538e201b4cf4
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


Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE00839AE6;
	Mon, 12 Feb 2024 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740361; cv=none; b=HtQfQ174Ccabyg0c173GzjUOqmgINOi8tsCN9gnjFT6SpjYp5RiZNsvk8fu4QY6hB5rzym3nPcK3iHc+/TT/GIGqic7OsMGNSonEhXs50AIJB6PgsuRKuO58s803PdkQIyLF1ZYot9PlGb1Clqel/mZK4kpn6kapFjjOuHiq8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740361; c=relaxed/simple;
	bh=UrHdpAUoDCF3/dO6dBmOUoEegG4QZ4SF6CfSkDZeAzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KPRBlLzIdLYXEqW+vaVK3U/sN/czGOpKnxiTBVLVI7Oo7KTM0gE6NxhqDaPVneC17Fw7WHFcmNMrzuF99dppnPpWTyTgJy5uMA7Kw6VvYFl8AMNsL5dda7/+et5Tn4CHxA64wLjZRdOCQxosemV9efeSoTAtXbSKzGw1zLz9OrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,263,1705330800"; 
   d="scan'208";a="193658430"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2024 21:19:17 +0900
Received: from Ubuntu-22.. (unknown [10.226.92.152])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 606C741B7FFB;
	Mon, 12 Feb 2024 21:19:15 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: cip-dev@lists.cip-project.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 5.10.y-cip] cache: Kconfig: Add dependency for RISCV on AX45MP_L2_CACHE config
Date: Mon, 12 Feb 2024 12:19:14 +0000
Message-Id: <20240212121914.38493-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csr_write() is available only for RISC-V which caused build issues with
randconfig for ax45mp_cache.c. To avoid this issue add a RISCV dependency
on AX45MP_L2_CACHE config.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402101256.mOmaXuSb-lkp@intel.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/cache/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 400cb09f6bd4..aacc36685945 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,6 +3,7 @@ menu "Cache Drivers"
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
+	depends on RISCV
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SETUP_DMA_OPS
-- 
2.25.1


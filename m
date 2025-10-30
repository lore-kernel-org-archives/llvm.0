Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5D246333;
	Thu, 30 Oct 2025 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761803633; cv=none; b=B/pwqGn+DXejTrNwenpxVN0/NAvg4TUmaaEqXty3cT2h0tGqZf/S7s3CNjX7V+XzuzDTOMy4/yBTQcBZzWMfmw1V1QJFl5+8wowWO2TI9A3pK5CBz4RyCyad0ETO/3aTrNN0UCxG2ZkEQZq+dM1Th3TID9W99kI7ESVuhtCZwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761803633; c=relaxed/simple;
	bh=lS63mQ0sVekhVPxnz1X6xyqkuiY7F8witW7thbkJIWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+ERjm5yXWtT0RjFs0ZzRqCIo4PgwMX2MVMKD9YxFeiZmXqK5S0BPHCs4Tix8UUC3JedHAi63VUSwHhn5doKpmNeN1LrIoir1kKwpIp9RL8NN/3FcsCtrOqJk5zQsjDcFd+AEwqsElDuGXlz1t4lWwiDEPB/HFnh1Clhk0Zqyzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHonp3tP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHonp3tP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761803632; x=1793339632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lS63mQ0sVekhVPxnz1X6xyqkuiY7F8witW7thbkJIWY=;
  b=VHonp3tPa9iwlNUZHy7JwzgPcyz3/CZU/HzV0379mukSkVCwCzQHjrEm
   kuREp5q7lkCuT95o16qN8dgdl5hwMdkNHGpBKe5XWN07u1smFk1LkrZKb
   KYxe4JQ7TyXkjf8/R2rAZqCOakeER6bRFaSAeKHSPLur5HAJPMIg+yI74
   M31rPMUTTbq95+kVWmbGmJHZICS8Op7QnP2fUfe+u+CORwgsWgiPk3T5H
   u7bChNtmGQi3zyBMsgzabrSQIww8TOMow/faB5hWRPwSqsMk4PuvB53rz
   qv0Q5N7mZKyFxIvQOPfsH4JQHP4AkAYGkflDbvFjf3xF1fDVICOueF+vT
   Q==;
X-CSE-ConnectionGUID: VHq0mJe+RNiZFwf9/A1N6g==
X-CSE-MsgGUID: gvLObsJNRQ6g9UOT9lYmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67588093"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67588093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:53:51 -0700
X-CSE-ConnectionGUID: C1uv67hgQemyfespKnsR7w==
X-CSE-MsgGUID: I0XhVr+bQ9G0HGJRutvALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186210257"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 22:53:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vELbX-000LWC-1k;
	Thu, 30 Oct 2025 05:53:47 +0000
Date: Thu, 30 Oct 2025 13:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 3400/4731] ld.lld: error: undefined symbol:
 mbox_free_channel
Message-ID: <202510301311.TcOCnZ1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 1ff1f0db6aec80eae1639eff31b5875632d539c0 [3400/4731] pmdomain: mediatek: Add support for MFlexGraphics
config: arm64-randconfig-003-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301311.TcOCnZ1s-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301311.TcOCnZ1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301311.TcOCnZ1s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mbox_free_channel
   >>> referenced by mtk-mfg-pmdomain.c:998 (drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:998)
   >>>               vmlinux.o:(mtk_mfg_probe)
   >>> referenced by mtk-mfg-pmdomain.c:1000 (drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:1000)
   >>>               vmlinux.o:(mtk_mfg_probe)
   >>> referenced by mtk-mfg-pmdomain.c:1024 (drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:1024)
   >>>               vmlinux.o:(mtk_mfg_remove)
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: mbox_request_channel_byname
   >>> referenced by mtk-mfg-pmdomain.c:816 (drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:816)
   >>>               vmlinux.o:(mtk_mfg_init_mbox)
   >>> referenced by mtk-mfg-pmdomain.c:831 (drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:831)
   >>>               vmlinux.o:(mtk_mfg_init_mbox)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

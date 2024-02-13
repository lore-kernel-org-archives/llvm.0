Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE71D69B;
	Tue, 13 Feb 2024 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707852196; cv=none; b=d19R5B7PjLM/13vm5VZYbig/npshy0DGNnL67cjahzFOKNVWQPZXFXmLZZ+wqSvF/vIYLL+jQ3JZrMeACQFY1TsgaG81NGAsCea51eulXp0OiaGzzWIyW3sAFfxlhJJBUhL1FUEkrrgCF8v3nLqF/xjmDfPKMj45vpSNZn3993I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707852196; c=relaxed/simple;
	bh=T8LX06hU+fKY5LR3czaE//VC2pfABtqANfg5QAceH5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WWLPNdA1Ns3g5Wafp9XBmpdxIMYUirROLb6F6UsDHnCINltAm7QIqapi2dnoyP76NPSbgICqlRommu1SUto2r5ZqapAgKvWjJf3KDukBSAYXNUUy/hL2vN8pRIL58Icj4UDWih/CRZxh5TDs27Zm61X/yyM4Js6ym6bPaHZEz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dW0aOS3y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dW0aOS3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707852194; x=1739388194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8LX06hU+fKY5LR3czaE//VC2pfABtqANfg5QAceH5M=;
  b=dW0aOS3yQwFoG7f39/sCwn3WXdUAhucmDgSEB+3oF5jTUfIYkLmIlxFi
   tdrvjx4IDD0pyBRtFdZq45676OlurDdv9FBLM7pWkdJIw96FYH7VoAjoy
   uJfodJTdFyuInQqcp8Zi7/g/dYoSO3SqAjkSgdUEDAXUeqnfzafW0AcDg
   cCMKQmDI8xKjfNrnsXd6tmF6cLie2V7skzuAXg9TT3sWWYEnQkwbUkMt+
   7OLu3y5PG98kb93Eps9pfFEBoMSlqh9InxQrE4e386aenwGmm7brcNDd6
   erTqYfzGG8L8oxLmd/HwSsAdWxeDV7Tj6VfVkXajkY2dgLuEg9GQ34P8I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1758297"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1758297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 11:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7618618"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2024 11:23:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZyN3-00081U-1b;
	Tue, 13 Feb 2024 19:23:09 +0000
Date: Wed, 14 Feb 2024 03:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:hyperbus 1/7] drivers/mtd/hyperbus/hyperbus-sfdp.c:343:18:
 warning: no previous prototype for function 'hyperbus_sfdp_probe'
Message-ID: <202402140306.TBxeImg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day hyperbus
head:   a15251683a61e8502ebc06584861bf9f5d84823b
commit: b6d1b619a848f5a304ae59ed71a414058e8d3013 [1/7] mtd: hyperbus: Introduce SFDP probe
config: arm-randconfig-004-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140306.TBxeImg6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140306.TBxeImg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140306.TBxeImg6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/hyperbus/hyperbus-sfdp.c:6:
   In file included from include/linux/mtd/gen_probe.h:10:
   include/linux/mtd/flashchip.h:77:2: error: unknown type name 'wait_queue_head_t'
           wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
           ^
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:343:18: warning: no previous prototype for function 'hyperbus_sfdp_probe' [-Wmissing-prototypes]
   struct mtd_info *hyperbus_sfdp_probe(struct map_info *map)
                    ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct mtd_info *hyperbus_sfdp_probe(struct map_info *map)
   ^
   static 
   1 warning and 1 error generated.


vim +/hyperbus_sfdp_probe +343 drivers/mtd/hyperbus/hyperbus-sfdp.c

   342	
 > 343	struct mtd_info *hyperbus_sfdp_probe(struct map_info *map)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

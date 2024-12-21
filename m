Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895083201;
	Sat, 21 Dec 2024 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779072; cv=none; b=hxOpSg3+/CKa9MS3rGFRmRZhZZ07TuashhNtExt/7GJX8pJU80mOhIyM3M1ADMSuR20n2EvKfRWhprjCO5Y/PyTmtDTCEL96UMI/PmtRrh/MYqdqmKCQd6D4qb2wqs9zw2z80ZZ7fxeICXw4NtKI6rL69yjkjbHSvGVntgqc0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779072; c=relaxed/simple;
	bh=ES8Y72tN7tCHNq2hsEeiaznpfJMqN6LAm9ib+DuisM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ7HYM1y/8T9lPhsx32W0sueHUqNXcQn9UfvpbIwFi/ZpJFwYG8Yye75zdGrwgYA/ePf/OWCTxHaSvLCVR1XLPRN/5c43vB8kKBRtlRBDO71q+kYwExtWku5FpwruC4w8s6QcCSvU1qgOaKYjZkPd1lNPcEl0Bztv29CYd1UVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmAVfz5e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmAVfz5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734779070; x=1766315070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ES8Y72tN7tCHNq2hsEeiaznpfJMqN6LAm9ib+DuisM4=;
  b=LmAVfz5ebS24+5eUmdW/2PU+S/hkeXA9VY5TuS7UIEXqduf8fOTBXXcd
   +4cPjpsUAD+zqGpXs14K6f3aG9PupEcKbXMY0HBfTsLoeLMttxIYaE5T7
   ZCYUPthYmSYmIKe/EaFeqlGn0sVmi5jJcFxzwPJsDIOwUiKrBp1/1ae3K
   cdeDQ3F0sU/aMvJG9AawyCL0GY3ZW2wNtZOZOy8J+Lc+NDnWkZP7Ubo0L
   bYp6v8xmKcW8ObOQ7GGcJrXsGb67XnUrdYzZaVDNWhsh8Dwj3yyWEmaAD
   Ug5Bs1EW/Ne4I9jkWYvk5JvCEeztoVQOvmEUOGo4Wz7MIRC2sV2fMXvkm
   A==;
X-CSE-ConnectionGUID: rsQh4d+BR3iC08Hj684oZg==
X-CSE-MsgGUID: GmzvtpC9T2i7A7YsIMFFuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39253552"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="39253552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 03:04:29 -0800
X-CSE-ConnectionGUID: uFj1EdARQcqphn1GerJJrA==
X-CSE-MsgGUID: Lnl/soBsT22O45oTf0M77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="99145758"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 03:04:26 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOxHT-000295-2w;
	Sat, 21 Dec 2024 11:04:23 +0000
Date: Sat, 21 Dec 2024 19:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Crystal Guo <crystal.guo@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Message-ID: <202412211805.ulwSEmZa-lkp@intel.com>
References: <20241212090029.13692-2-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212090029.13692-2-crystal.guo@mediatek.com>

Hi Crystal,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-mem-ctrl/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crystal-Guo/memory-mediatek-Add-an-interface-to-get-current-DDR-data-rate/20241212-170306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241212090029.13692-2-crystal.guo%40mediatek.com
patch subject: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR data rate
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241221/202412211805.ulwSEmZa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211805.ulwSEmZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211805.ulwSEmZa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/memory/mediatek/mtk-dramc.c:300:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
     300 |         .remove = dramc_remove,
         |                   ^~~~~~~~~~~~
   1 error generated.


vim +300 drivers/memory/mediatek/mtk-dramc.c

   297	
   298	static struct platform_driver dramc_drv = {
   299		.probe = dramc_probe,
 > 300		.remove = dramc_remove,
   301		.driver = {
   302			.name = "dramc_drv",
   303			.owner = THIS_MODULE,
   304			.of_match_table = dramc_of_ids,
   305		},
   306	};
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

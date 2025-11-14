Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB44628727C;
	Fri, 14 Nov 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112439; cv=none; b=XikiJ7RZ2ElFEX/xiQWbIlVyIhUx9EovEqV/Paw05D3xwLO0/kSfVh8HZHkbzabI0rLlE73CuRSNBkq72dAMSAu2LJHHqrQn4WU1HFjld/w7/VltSgAgs0Os24CCRC7qxRJO7wZHf8qUSi6bwWZJVPV4Sbr3ZeakfOo9SZ8ED38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112439; c=relaxed/simple;
	bh=JvwgdzJBA9idd1jCbyhM6ONpoGLFdO53wS2/C8/bYQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epAmzw/KNU7uCO5EkAiUm9iyyr9oXnYav/fzmmrlBMxQknj8ilt1GAuYInWWd3543m8rfCCZeZ2snSA8IIA28FoskeEp9qD3jjvDPdy2KRUsslH4FNJVAQdzBN+2zU7pcQGrk49zxSFlUG1wpq0Z1TSM47AyWZWCbnl05/nxtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gInVdTfF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gInVdTfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763112438; x=1794648438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JvwgdzJBA9idd1jCbyhM6ONpoGLFdO53wS2/C8/bYQg=;
  b=gInVdTfFMRionR50ZIAGuiNx1oIehR4iKQs03Ku45j8mpMsy9oq4hHZF
   5IuzAOqPVcHpTgKU4icgPh6+k977KZhstK31EoqoiVnkWCymzjDw3ECam
   TI4vcnFM6mRnpiZKKB9f+otxan8IcexjXmiGt2na4OO1PSLpb0NLNZlgY
   cjksp8JgS05vx9ppXhxUmrt7XNqsWHNazEK9aeYpMxs7NNsI9wUwsI7xx
   ZturuvUk+vdLR2plk8QrjppdvUfD1A0nSxl585LpZUsQtLYAoPM1uKinc
   f/hDecsFWqSfPn7GxdoT0sQxAuXCiHMV1XSa4F8A/GJgBcMO1qFMtYcod
   g==;
X-CSE-ConnectionGUID: gbXZZxhmRhO6YvBoHI4rAQ==
X-CSE-MsgGUID: KAB9j63TRmaOg8PSCvOLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76306653"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="76306653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:27:17 -0800
X-CSE-ConnectionGUID: yEMDrp/CSGia7h7jsvCJgg==
X-CSE-MsgGUID: QUB4M+nzQdyI2uMdgt0J8Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2025 01:27:15 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJq5J-0006PB-0h;
	Fri, 14 Nov 2025 09:27:13 +0000
Date: Fri, 14 Nov 2025 17:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] spi: microchip: rename driver file and internal
 identifiers
Message-ID: <202511141734.5qstSNyR-lkp@intel.com>
References: <20251107122104.1389301-2-prajna.rajendrakumar@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107122104.1389301-2-prajna.rajendrakumar@microchip.com>

Hi Prajna,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-microchip-rename-driver-file-and-internal-identifiers/20251107-201844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20251107122104.1389301-2-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH v3 1/3] spi: microchip: rename driver file and internal identifiers
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251114/202511141734.5qstSNyR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141734.5qstSNyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141734.5qstSNyR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mpfs.c:620:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     620 |         .remove_new = mpfs_spi_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +620 drivers/spi/spi-mpfs.c

   612	
   613	static struct platform_driver mpfs_spi_driver = {
   614		.probe = mpfs_spi_probe,
   615		.driver = {
   616			.name = "microchip-spi",
   617			.pm = MICROCHIP_SPI_PM_OPS,
   618			.of_match_table = of_match_ptr(mpfs_spi_dt_ids),
   619		},
 > 620		.remove_new = mpfs_spi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

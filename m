Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92EF17BA1;
	Sun,  6 Jul 2025 01:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751764258; cv=none; b=QMsQQHlGm+oEAdwut9GO4/z9DrNzPE6u+KX9iMbP5IvlAN1cwUYGV/fFCaMPvPR++Doi3y8aM6rNhKOW984WShzSp06UpB8nP8g34NPhaVt3By3bolodDzxrzyzSAqWjAD/8Ygoby6iZ1Tpt5Hg492iDv2mhubEJc4Y5hunVrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751764258; c=relaxed/simple;
	bh=ENobFyjNHg0qUrbBlYZsDa3VL8C3AE3vNlcCubTGN6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOlgEIQroszDcdcE2zTEyqKP1Rge/iX5ThG/hqK/jHXcMLvMTWBMbC5ExsIbFmCOrEzkfEewXYqvLD6YeF8Cc6mYrCL1CP/uToN85lmnmGOVvGv5/qJZIHuUJQzpDBsPIEZtUo1b+yZkr2rtNL6TftbWYIPxElop+BUo/64KS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BywMsEns; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BywMsEns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751764256; x=1783300256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ENobFyjNHg0qUrbBlYZsDa3VL8C3AE3vNlcCubTGN6I=;
  b=BywMsEnsKY022Oqtv9jNFrKQnkT8W8El6Cp3u14uMDXQFOzSWVcYobxN
   ti/AXSvYEuCWDovq5ulLgVtNTPyk/IAlPl1lLWpcYFL5lQsuM13QiCjXJ
   lc3dRQYKY4HWvfKh+7GZ1Ltzptjlax7FcTfUbDx/AyfcmaxfLEArNyt5d
   t25f7Obav3bt1XnPYDESdPo2DoJPeza6OtInY/6Nn6vxvI18GOmV49cB3
   3EDl8017dq7Em29IC4fwxzQbJR3Ffha9O28CB0QuoDV+pJ57WTUxZBJZh
   AP2Y4KKiOam3o+wAQm1QVmp3syP7j4hJwiyTzWOgz1r0Wq+1UimZtBgF4
   g==;
X-CSE-ConnectionGUID: td4MlLghR0Cqje3O5CO6jA==
X-CSE-MsgGUID: zI/MRFukSzCkMDcnBmKdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53894650"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53894650"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 18:10:55 -0700
X-CSE-ConnectionGUID: MzCOyp4rQL6n4RB75TtXCg==
X-CSE-MsgGUID: Huoizr+NQcS2hODm6cOtBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="158930165"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2025 18:10:54 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYDu8-0004nj-0J;
	Sun, 06 Jul 2025 01:10:52 +0000
Date: Sun, 6 Jul 2025 09:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] greybus: cpc: add SPI driver
Message-ID: <202507060806.1rBpnamP-lkp@intel.com>
References: <20250705004036.3828-4-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-4-damien.riegel@silabs.com>

Hi Damien,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-move-host-controller-drivers-comment-in-Makefile/20250705-090138
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250705004036.3828-4-damien.riegel%40silabs.com
patch subject: [RFC 3/6] greybus: cpc: add SPI driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250706/202507060806.1rBpnamP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060806.1rBpnamP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060806.1rBpnamP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/greybus/cpc/spi.c:566:35: warning: unused variable 'cpc_spi_ids' [-Wunused-const-variable]
     566 | static const struct spi_device_id cpc_spi_ids[] = {
         |                                   ^~~~~~~~~~~
   1 warning generated.


vim +/cpc_spi_ids +566 drivers/greybus/cpc/spi.c

   565	
 > 566	static const struct spi_device_id cpc_spi_ids[] = {
   567		{ .name = "cpc-spi" },
   568		{},
   569	};
   570	MODULE_DEVICE_TABLE(spi, cpc_spi_ids);
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

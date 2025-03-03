Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF921323F;
	Mon,  3 Mar 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014367; cv=none; b=OVkqe5lh7++fDTTX3j+EymnuEZz3fp80OMPFSRXIxTHRzOMy5l8XV6pSdMX4VB37Jzz11ArFbkpAdSM+5wUWxgqcURi1gfxUBgXQsxHoJJKgYBp3JHYA0vbs7Y1SqMdfOvNOoNlkA1CdhEsVbB7f9NvuIAdzP7i5PUePysmmXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014367; c=relaxed/simple;
	bh=disuNk2jqDN9ewEpsE1y/bJZDemQDRRzm/NUW3oa98k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUwFDLt5X4JT8Mdc3ueM9jh14GjPs+dA7bMrDfpz+4iLo6wgRFPfPYsQnZ0z+nppS8pU+6rplZinGNq9U7zfLdTHwQeqtOjlFvx/RL+bPGxrveT46iqaBK1sVW288cepIbzmKIuRSwK48u/UjDnLmg7OS+l2nsdkTy9SZnIMWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1N/zcAR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1N/zcAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741014365; x=1772550365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=disuNk2jqDN9ewEpsE1y/bJZDemQDRRzm/NUW3oa98k=;
  b=N1N/zcARdEDk6p/3um/+tRFrD5DAzsJM1NM/iuD9lAndLYPCuopO11Bl
   Sg7xoxi3Kqph1YIlSqNADrn+ovhyjol5Z3pE3E+kB0TPWo3hCdVt/ZFRO
   HPA8hktMyup3WfEWzt9m+cJ1oFgyrWIydSPLvrbWTRVBWwJKgUBIPxGh/
   L+L6v6MwAmFaWczRct1DKUJYDjsNNieBbfb6DyrHSyaSk01SoTOAWYTSg
   cd0sluRgIfShf8GHSoE9qeHUSaee5q+tY8CzqMSETc93TVeFvGS1xpbU2
   WkquFefALeK7DxKl3tzu1QfFLgDsXj4uoas4YAyXfIIyoz8sfaj4+i+t6
   w==;
X-CSE-ConnectionGUID: cvJQdCZeTJ2q7TI6Y8NLhQ==
X-CSE-MsgGUID: cG4rknbqS/KvsAvaAny7Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52530134"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52530134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:06:04 -0800
X-CSE-ConnectionGUID: 1/GrhkcFRDSDSEtYNt/n8A==
X-CSE-MsgGUID: Hsr/re+LR2utUfDgB/YJWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122176463"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 07:06:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp7Mm-000Id1-1y;
	Mon, 03 Mar 2025 15:06:00 +0000
Date: Mon, 3 Mar 2025 23:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	linux-wireless@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	linux-devel@silabs.com,
	=?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Subject: Re: [PATCH v2 2/5] wifi: wfx: declare support for WoWLAN
Message-ID: <202503032232.o7HgZDMO-lkp@intel.com>
References: <20250302144731.117409-3-jerome.pouiller@silabs.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250302144731.117409-3-jerome.pouiller@silabs.com>

Hi Jérôme,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/J-r-me-Pouiller/wifi-wfx-align-declarations-between-bus_spi-c-and-bus_sdio-c/20250302-231700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250302144731.117409-3-jerome.pouiller%40silabs.com
patch subject: [PATCH v2 2/5] wifi: wfx: declare support for WoWLAN
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250303/202503032232.o7HgZDMO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032232.o7HgZDMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032232.o7HgZDMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/silabs/wfx/main.c:124:42: warning: unused variable 'wfx_wowlan_support' [-Wunused-const-variable]
     124 | static const struct wiphy_wowlan_support wfx_wowlan_support = {
         |                                          ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/wfx_wowlan_support +124 drivers/net/wireless/silabs/wfx/main.c

   123	
 > 124	static const struct wiphy_wowlan_support wfx_wowlan_support = {
   125		.flags = WIPHY_WOWLAN_ANY | WIPHY_WOWLAN_DISCONNECT,
   126	};
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

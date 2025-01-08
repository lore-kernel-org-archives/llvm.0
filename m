Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9041FDE09;
	Wed,  8 Jan 2025 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347051; cv=none; b=Jx2lm8AtNXOG0vwvPSBSTiZjx3f7csFxFZHXeIx1HWnEDKnTEfC5gjgX+QU2aVAKoM84k8UKbjdsLYiyPvmhhRW3qqnFzwwpZk4vRZaMOhXJ5DgO79dLzXKHZE+B+PMQuavY8Comc9KtPVCT0OEVkyf1cz/bAwC59+5Xur/X8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347051; c=relaxed/simple;
	bh=zMQd5Q3V9sn3h/BJ0+XSItuzZ2x8m7x43xFqCmhtiW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9rBuB/uGGoj58jimPKJsASCZD7Nu47RlW2dX/KM36giMmhSrWGyR3T7cDTiEEFk/sHsO/8GnFCGIYkRCmY49OzYwYtVB8higuRF96THC3tTA9OGOqUrUhn2NTvLDdnRyH+nXDbGKZnmp8SX6nV+4jYEHobg2Pt4f+AAxoVEYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbZ9WqS+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbZ9WqS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736347048; x=1767883048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zMQd5Q3V9sn3h/BJ0+XSItuzZ2x8m7x43xFqCmhtiW4=;
  b=gbZ9WqS+/1Tm8vCx/7tnUJwJnm5ezApTL2WRKKV5U1422rjxcV27kRU9
   jKlPBIuiDrMQ9d2RJQYSzhws+D1yOXcxFmMP/9qiFXj7RpTpUfph5Sgyk
   o8isi3dIj6bVYiSGyklYmhjuhwFuKpp1pAMCq8Scry+CDnAjrcOMkUchL
   rlc41BgryLJLbBXF5idMkxxwXUpdME2f+9gJw7ncnJsWGDPviPrlzZMwa
   Z6HFkAWUwboeZHDUq/6olYYrfCCHhLpEjcifZc7SKQixZbrAZHz3o3GSi
   6m8jPQS0CSpiEgEnapXHDcrhz6hbO5DTaSFnzuN6N2WfFwuxBDp5MB2uq
   g==;
X-CSE-ConnectionGUID: loUWd6rRTOuiZWFB6giPKQ==
X-CSE-MsgGUID: xltU1faiSu6Sa+PD+4W+7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36458584"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36458584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:37:28 -0800
X-CSE-ConnectionGUID: wmcM7VuUSjCMXGmJ+oqDnw==
X-CSE-MsgGUID: ZPTHOSS6S1CximYuf+ni/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140453223"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 06:37:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVXBS-000GDx-2X;
	Wed, 08 Jan 2025 14:37:22 +0000
Date: Wed, 8 Jan 2025 22:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>, xuwei5@hisilicon.com,
	yangyicong@hisilicon.com, Jonathan.Cameron@huawei.com,
	wangjie125@huawei.com, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	prime.zeng@hisilicon.com, fanghao11@huawei.com,
	wangyushan12@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 2/2] soc cache: L3 cache lockdown support for HiSilicon
 SoC
Message-ID: <202501082259.J9fBJZTQ-lkp@intel.com>
References: <20250107132907.3521574-3-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107132907.3521574-3-wangyushan12@huawei.com>

Hi Yushan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-Add-framework-driver-for-HiSilicon-SoC-cache/20250107-213022
base:   linus/master
patch link:    https://lore.kernel.org/r/20250107132907.3521574-3-wangyushan12%40huawei.com
patch subject: [PATCH 2/2] soc cache: L3 cache lockdown support for HiSilicon SoC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250108/202501082259.J9fBJZTQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082259.J9fBJZTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082259.J9fBJZTQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_soc_l3c.c:146: warning: Function parameter or struct member 'regset' not described in 'hisi_soc_l3c_free_lock_reg_set'
>> drivers/soc/hisilicon/hisi_soc_l3c.c:146: warning: Excess function parameter 'addr' description in 'hisi_soc_l3c_free_lock_reg_set'


vim +146 drivers/soc/hisilicon/hisi_soc_l3c.c

   136	
   137	/**
   138	 * hisi_soc_l3c_free_lock_reg_set - Free an allocated register set by locked
   139	 *				    address.
   140	 *
   141	 * @soc_l3c:	The L3C instance on which the register set is allocated.
   142	 * @addr:	The locked address.
   143	 */
   144	static void hisi_soc_l3c_free_lock_reg_set(struct hisi_soc_l3c *soc_l3c,
   145						   int regset)
 > 146	{
   147		if (regset < 0)
   148			return;
   149	
   150		xa_erase(&soc_l3c->lock_sets, regset);
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

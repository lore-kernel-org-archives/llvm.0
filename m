Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8A3D333C;
	Mon, 30 Mar 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877354; cv=none; b=T3w79a5H9z5exQtUMJZepxuOVhMCKyCKJZW90qRDTWPyflYpeax55UC4KLNULGV9YY7PsI/FsEVqzTe0207M3I9NhRbkalWuJ485JrFLcvGPRAErXVkw5jr6+lCd8IaWXaLVrT7jgpJlL6Wjk775O0rD+uW7wnHMha5R7iskSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877354; c=relaxed/simple;
	bh=c/H7eZzJCEUtEK5OvU2JaJguCWCJlKN99jebwrjoZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZOT7wsXpha556gF478q6/yRU2tG5do+hlx7t+86BTRF72vLU6w/r1ekSk19F4BtSbfFzVF+PLSfKR48q5rUx2RhanW2objoD7c+whrkbQ4awsf2yKg9uBVAHLl4maBh+ipxoqsqIsk72h660l4ufZxuPXaWpFXxvX6sCTYG+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjiREykZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjiREykZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774877354; x=1806413354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/H7eZzJCEUtEK5OvU2JaJguCWCJlKN99jebwrjoZGo=;
  b=kjiREykZ4ICvzgBjPnd9xFCHq3vyIsV1qSsg/qt57/76yknL0FRqNe6J
   ijuwKxE8pjCRtLFgd1viDL2tfykUvSOkhJ1xT2d6Xc8h9fIz4ky7GTq+A
   V6LkpW/4qBQrEIR7a6eT55NneQhWgfT1vrx1zLElPIWWMD78Kx9rXRHUy
   o9zj5s8xFfhsJ/0oJvlIgquTrdg7lRFP3ZaCc4WShPmwAydjSmfG++zu6
   Jv8FOsxAKabXw3mp6AfWf7152fjxbEWQkZ02uX5Et/Fz1wGw/sYAd5ycY
   XVP6Rgmoav/HIXHpQp8QsNmcQSRwqTJhGF8tKXCL3MFD5/9KHsYSHuA9N
   g==;
X-CSE-ConnectionGUID: 6J+6YzY0Rpmy5Kf5THXdiA==
X-CSE-MsgGUID: YifejAFIQLqV4Tl09nliuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75755423"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75755423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 06:29:14 -0700
X-CSE-ConnectionGUID: Ndcc8QuNR8OM/+QifztGaA==
X-CSE-MsgGUID: jusKlcyyTbmza3NTT4uAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="221186359"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2026 06:29:12 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Cg1-00000000193-3oKk;
	Mon, 30 Mar 2026 13:29:09 +0000
Date: Mon, 30 Mar 2026 21:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
Message-ID: <202603302143.tkiQ3kEk-lkp@intel.com>
References: <20260328100953.3441915-2-xiaqinxin@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328100953.3441915-2-xiaqinxin@huawei.com>

Hi Qinxin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qinxin-Xia/iommu-arm-smmu-v3-Add-basic-debugfs-framework/20260328-191149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260328100953.3441915-2-xiaqinxin%40huawei.com
patch subject: [RFC PATCH v2 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302143.tkiQ3kEk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302143.tkiQ3kEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302143.tkiQ3kEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:33 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'
>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:33 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81479373C1E;
	Mon, 30 Mar 2026 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887506; cv=none; b=r/5qyVUGl4IUaKx68oXALJd7HnBTQVlsy9DVvujDKDp7PhHExKxpbjuvbOrPp9VfY9VmBeuQjzPNbOK2QI0jsIbW97qjZ+8Zh49vxIHpAjA2XbJtvELRGJboYoOwmKYFlyI7wj5GlNro4vqTDJ1712SFw3bVZUUpfX0Rcw6CGIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887506; c=relaxed/simple;
	bh=CVjk9X8VXCkYgfPaVw7j7tM9MMRvliYDlZhN7SHzjGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efoh86Vp0DJq5Zp/plmtyryVFsJ+KXbNLYUlpbODPppwn7iOteNfio68/TV3mW+3pAlqWt76WVfkVGLKUtikIXck5k4Lvc6KRC7DRhPa1F81fIQH8Pknk1tCWPYnLtzScXkPpQ6J+e/h6+7xjIBcxshzAzzGFwEoawyD+Cbgt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwtQwENo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwtQwENo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774887504; x=1806423504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVjk9X8VXCkYgfPaVw7j7tM9MMRvliYDlZhN7SHzjGk=;
  b=fwtQwENoCdosxCuU3WWkS4l7XRPRWZKBoBpV5X6qqnn/sxzFBbWio6vj
   ZFlIRx6jatB6ydGC6MK6Y6tiDuzlTDovQfbvvy0HqbvfEOJDkZCVWBI+w
   aKMEFgLBoqgtl/MS8r9NrJ+pYBhkojWCrk47EVwZOMkVHaNBz0tomPVxT
   2JSD03OpSVy/dQbFDVw8mCLkWAJ94FKbR0i/7uMB4+0OjuGoSS2nl5z6g
   QGMya65/DDyFB83xpNCpo4o2NQhdV2T6GfrmGQ0n810SzetAUACpGBYUK
   D3DnuJVlOBTuAAyzlPC5i/tbcFseJ43HVlwSUC4VASIYO6oNQW2DM0IQO
   g==;
X-CSE-ConnectionGUID: QJlYnfEKR+iO13y+f4THwg==
X-CSE-MsgGUID: bT79Za7HRTmZli/e4cBW3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75996688"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75996688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:18:24 -0700
X-CSE-ConnectionGUID: B6h7tuptRpiz1Szw/Uocrw==
X-CSE-MsgGUID: 4cTMtpQtQdKFi0Qano92uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256598469"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 09:18:23 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7FJk-000000001KH-17Pk;
	Mon, 30 Mar 2026 16:18:20 +0000
Date: Tue, 31 Mar 2026 00:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] iommu/arm-smmu-v3: Add Stream Table Entry
 display to debugfs
Message-ID: <202603310057.rR6IZBTZ-lkp@intel.com>
References: <20260328100953.3441915-4-xiaqinxin@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328100953.3441915-4-xiaqinxin@huawei.com>

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
patch link:    https://lore.kernel.org/r/20260328100953.3441915-4-xiaqinxin%40huawei.com
patch subject: [RFC PATCH v2 3/5] iommu/arm-smmu-v3: Add Stream Table Entry display to debugfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310057.rR6IZBTZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310057.rR6IZBTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310057.rR6IZBTZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:46 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'
   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:111 function parameter 'unused' not described in 'smmu_debugfs_registers_show'
>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:179 function parameter 'unused' not described in 'smmu_debugfs_ste_show'
   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:46 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'
   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:111 function parameter 'unused' not described in 'smmu_debugfs_registers_show'
>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:179 function parameter 'unused' not described in 'smmu_debugfs_ste_show'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

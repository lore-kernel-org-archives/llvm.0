Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0B2E03F1;
	Mon, 30 Mar 2026 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881440; cv=none; b=d8DIJ9H2mDlpvtXz044BjvS6Vi8/3frvSJopWH7TtdvyU6wgmmlbY2ddWxccgdF5hkqqbyLJed+4ehy07iiDlkxnODVuTDu1//IdDX5pK3+XKkjHoRixJkORvaTBIAdg5+iDgf1s9JAWlcR3SSby+qLxZUXPCvgNdQQSNMddZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881440; c=relaxed/simple;
	bh=CxtORT4vZ8DoLpX+xgZNg+9MtD032dRr+Y9klRWyb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLadMnvreKzB4tXeLGCRLPG8WJScfK6jBH3+DqliRqTUOG3c0nqLi8jacupb5tf1OiQc8sOD4ES78iBe5URjrRk+UWJW7bglJgaxnh5xDP4sOyLjNp11vG2yZLaBezZSkTgSefmoRpXixyqH3CxTEKxsdVtTg+eUQoSd7MaMH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9t4r0hg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9t4r0hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774881438; x=1806417438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxtORT4vZ8DoLpX+xgZNg+9MtD032dRr+Y9klRWyb0Q=;
  b=c9t4r0hgk2MZWsIM3i0wbkgP2NZVi3TNrEgJc/J0PI0P+o1yzlaa+ARi
   pY6ucVxsPtA/wSyF3oA1mj2aS9EHRwXHjAR3w9Sl1YveMyUrGjylLPuB8
   5uBr6H8JL5N9REbFKCHjFGKmoLHR1PLz57PIes55LGmmguN4p1fUs+BVS
   Ym61bjxFaLLkoG9mKmyedpaVZLQp7/kW7hGCmzi/lAgWtMErF5sJAbXcH
   8WYW7WTQ5yUR1DeLiRWUb2ny9kgzlf84ZjiS0LE8gqWPZbFahDTmQDJ0J
   wV/nfcHqmrtUB/IAhBEUj2bv4euB0QKyhIgXIRhSr9j2mNy0QSk/jAxxe
   w==;
X-CSE-ConnectionGUID: TMF83ToiSa+rQV2bcrvWsw==
X-CSE-MsgGUID: O/rXrbQoSXmgL64/m5uGlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75770632"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75770632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 07:37:17 -0700
X-CSE-ConnectionGUID: kft0ZU5hStmC1IpaWUTXPA==
X-CSE-MsgGUID: qqqVb/9MTQKrhOIt1OhzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225245199"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2026 07:37:16 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Dju-000000001DP-0CBC;
	Mon, 30 Mar 2026 14:37:14 +0000
Date: Mon, 30 Mar 2026 22:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
Message-ID: <202603302250.vzn0FbYH-lkp@intel.com>
References: <20260328100953.3441915-3-xiaqinxin@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328100953.3441915-3-xiaqinxin@huawei.com>

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
patch link:    https://lore.kernel.org/r/20260328100953.3441915-3-xiaqinxin%40huawei.com
patch subject: [RFC PATCH v2 2/5] iommu/arm-smmu-v3: Add register display to debugfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302250.vzn0FbYH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302250.vzn0FbYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302250.vzn0FbYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:38 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'
>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:103 function parameter 'unused' not described in 'smmu_debugfs_registers_show'
   Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:38 function parameter 'unused' not described in 'smmu_debugfs_capabilities_show'
>> Warning: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c:103 function parameter 'unused' not described in 'smmu_debugfs_registers_show'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

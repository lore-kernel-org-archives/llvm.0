Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6242260C;
	Wed, 30 Jul 2025 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753844062; cv=none; b=Q+5eu+1gKiYE6ujbLjSMzGdN+dVDs5fNC/67+b4mGs55mlELsg5Mor7Tryppdz9BPr2CZN1SCJxh9yYsghbL1OV33fk+4GKcYADe1zXI77OM7NzBDS7DAPSv2jVFkz7oh1KBMUT4I0v5CSGpo+Yj+VGNhy9ckJ97RYiRxBnlmzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753844062; c=relaxed/simple;
	bh=qx/Md6R7UQwSiKILWdhcAaULuDkpdftTvCd4ZvIIk48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBALIk91zKrUzCh8dACoUMXCRbDWrj94m4pWEIPZSG9fcp8t4TTFrMczMR6xZZ9T5+J3XAJ2qZhUXtYs6WBdIVqFrGMB6zbuqDLtvE5/X030GsUhy8vHfiemtYEa5T84BMMLQQNFSUnGrYdA98Ehl6BNuovhSLnwFHYiJTVwiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V39vgscY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V39vgscY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753844060; x=1785380060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qx/Md6R7UQwSiKILWdhcAaULuDkpdftTvCd4ZvIIk48=;
  b=V39vgscYDDDeMnBt0Bth8eOMWS4Nkedzwhk0EqPqyvYhqBZWsTxSPFoo
   yX/ExiklPpdKkHCttLSbkdoF+167EmkBjDrhC2qlsGKeM8iyHOz87Wcl1
   VGR7bZxjMvZ9GUjjNNePEJkUNkcTHJBFnvAtNvWdAc9/V6UJ2947noK1N
   PfH07jgNtyqeLO7xE9PZ2+8If7CS1z6gbVfutOeKJv1+cF9IMKDvAWPof
   WXiLzKYdY4vMhUqa6eMFASqIrEgJ8GMDgTwDvR9WoLeR723HKEtiSHQZC
   axj3m8tsl8pXd6tT7lRLvelGE7lYW4Y0EgW7ktUv4KQRMDYmpZXsv5O+J
   g==;
X-CSE-ConnectionGUID: 0K1isxOWRVyi9sAJzYyGUQ==
X-CSE-MsgGUID: eDkaejM4RXmoDVv3xl0LaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55830658"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55830658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 19:54:18 -0700
X-CSE-ConnectionGUID: liT8IqIgTeODTJgfQU3R8w==
X-CSE-MsgGUID: u+X9x809Te6mSykan2WUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163644359"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 19:54:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugwxL-0001w2-0H;
	Wed, 30 Jul 2025 02:54:15 +0000
Date: Wed, 30 Jul 2025 10:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] ethtool: add FEC bins histogramm report
Message-ID: <202507301044.oMAZMVFS-lkp@intel.com>
References: <20250729102354.771859-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729102354.771859-1-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue net/main net-next/main linus/master v6.16 next-20250729]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/ethtool-add-FEC-bins-histogramm-report/20250729-182647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20250729102354.771859-1-vadfed%40meta.com
patch subject: [RFC PATCH] ethtool: add FEC bins histogramm report
config: loongarch-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301044.oMAZMVFS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project bcd0d972247154336dd1321f1fded818e46671d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301044.oMAZMVFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301044.oMAZMVFS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/ice_ethtool.c:4631 function parameter 'ranges' not described in 'ice_get_fec_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

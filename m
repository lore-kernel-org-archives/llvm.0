Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F020E33F;
	Wed, 18 Jun 2025 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228990; cv=none; b=PI3TWG+UALptsqEmG2IKZiqz6CdxAo2GWpbmsFzf6vyPrRVBnm6yy+ZS2WJg9I7/YiLsYzL4b3zT4XCu402F0tJN4GY7gUZ5FRNoVOqXrK6lgu+NVBcV3uGx91k4TpYDUh08U7Y5YMWLWSn33wJxN5imwsul3Imnx54K768x4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228990; c=relaxed/simple;
	bh=L3ZN00NFMkveaYYC58OdYNe9pMNOCKSg6yT4m3ES5UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjlt3NKTsTjEK7E6v5bui9P/x5WdV3uBW0ghLHV/q5/5GoujQZpywnaxDXw+KCUwokWdU54y+LNAgRG+fKIuhstjyEQkNSAsdyAkhhJu1ulqVZm7tuGAuASXofZLp0vzykSfZXb/7ulRO/Q/0AmWAIKLlq4p5i+qcDemkMly0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIxdlMO8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIxdlMO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750228989; x=1781764989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L3ZN00NFMkveaYYC58OdYNe9pMNOCKSg6yT4m3ES5UA=;
  b=cIxdlMO8uzzHAFE5trQqxUdvDyWFPNToGfA57K5V2dwbzBCJiQTr+20+
   z2jv/UXKP873gfbDSy8Yj/FgcvHFFRmnPBhR1DPrbgRh7ELLNubW5dfEd
   zFNEt9JsRNurg/j2+w9kcxEaQmB06Ht6/RdVgs4EFruNYSW/rPQnIMnO/
   27AM8V36nv87n0i4BNCfaQjbinJR9OYU6RWVHmtk5SOSIlFXt5aZXa+gn
   HrZ78IAhYSHZdDAsobJqMlizS09ZLou0YYMId3fedJxVJbLp0Fvd+A5gk
   QOoDeoxwSe9UHDOqbvaonyTET5Ao4bWeq3i0ANbJn3nom1ZJdvu2dJaFq
   Q==;
X-CSE-ConnectionGUID: c589RGpYR+yCQlEtqx2Qjg==
X-CSE-MsgGUID: Eti2tk2dTbSrfkrQQlViDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63853575"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63853575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 23:43:08 -0700
X-CSE-ConnectionGUID: JjCevs7/RgmbKCqzXKOKCg==
X-CSE-MsgGUID: h/yWjJ6RQBSHuWAjY8zr+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154851356"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2025 23:43:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRmVk-000JT8-1x;
	Wed, 18 Jun 2025 06:43:04 +0000
Date: Wed, 18 Jun 2025 14:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v4 05/11] vsock: add common code for vsock
 NS support
Message-ID: <202506181421.QjWYnEqo-lkp@intel.com>
References: <20250616-vsock-vmtest-v4-5-bdd1659c33fb@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-vsock-vmtest-v4-5-bdd1659c33fb@meta.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8909f5f4ecd551c2299b28e05254b77424c8c7dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/selftests-vsock-add-NS-tests-to-vmtest-sh/20250617-123800
base:   8909f5f4ecd551c2299b28e05254b77424c8c7dc
patch link:    https://lore.kernel.org/r/20250616-vsock-vmtest-v4-5-bdd1659c33fb%40meta.com
patch subject: [PATCH RFC net-next v4 05/11] vsock: add common code for vsock NS support
config: i386-buildonly-randconfig-004-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181421.QjWYnEqo-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181421.QjWYnEqo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181421.QjWYnEqo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:2741:1: warning: unused label 'err_sysctl' [-Wunused-label]
    2741 | err_sysctl:
         | ^~~~~~~~~~~
   1 warning generated.


vim +/err_sysctl +2741 net/vmw_vsock/af_vsock.c

  2738	
  2739		return 0;
  2740	
> 2741	err_sysctl:
  2742		vsock_sysctl_unregister(net);
  2743	out:
  2744		return -ENOMEM;
  2745	}
  2746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

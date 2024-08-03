Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733112B7F;
	Sat,  3 Aug 2024 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722707403; cv=none; b=mK6hVP6Q3dKCPqA+EarO7biQzWFuoVtH9/57z2noorkx+bQHQvYwieKdDU/S3QGl9/fItBrWs9tSzNCicShap6/3c4z3U9HXre1JJICvZfgeueKASBMAnQ9OkIyUEV37lz6vGJQgJ/PhkGlUVy+Ype881GDbCj+MS+2MzcdEoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722707403; c=relaxed/simple;
	bh=msKu4iAJHBCgFxAcuXQ2HaOOMd866e/jr8rtci9jz+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F21NaioxhwLwEEBQuQobv5/dDD6e6TqHCujVxcwA+Ji0IKT6KokJWQChowmJoc4/G55JubUNgULuTrh5BTjeSINcczpngIz44yFRqLZd5XwfQwbnS4thDTphdT812iDfAbfBp1gCF4jl+wRoN+wZab1Bu7HqnCwQnSAOO0loHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRxD7RaJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRxD7RaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722707402; x=1754243402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msKu4iAJHBCgFxAcuXQ2HaOOMd866e/jr8rtci9jz+w=;
  b=dRxD7RaJmTJ5nDSBMQlasXo58kDKCmcsWIHJ2iE210Qbh1cZkAgS/GC3
   wqfgz+jgpSS0P0NqX5fmUqfxPR7UIS1VMy/CqNnnmEOWiB6sm2DjaZezT
   i9WAj/d1ywPtB5Q6CW3INpdcSexgxdDdys/LP7mLBkQZz57aSeTjaDvEu
   sAQdkic1pWN2w6NK0DrYH6lQbm2AQFyznykVhgKG6pQwFD8MRWmKPDWao
   swLW9dJJ0wXtKnYs4TIbXJQAf86G4PU93DsldV9/6O0nDoEcdV3q8xA+Z
   rQVMOVfTds6jVO+Q+U7u1+KPTWe2kAzEwCLt7QtFUJ+sGArV7k0MJsC9S
   A==;
X-CSE-ConnectionGUID: Kdm0XAllTgCQrjj0PgeIiQ==
X-CSE-MsgGUID: I1/QGTZSSYKWZ5MH4VViiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20524866"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20524866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 10:49:59 -0700
X-CSE-ConnectionGUID: sN6LcBbUT5mKCiZCN+CPcg==
X-CSE-MsgGUID: lKjS8jwSQISuiUDcP8TeDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60752978"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2024 10:49:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saIt9-0000oE-1H;
	Sat, 03 Aug 2024 17:49:55 +0000
Date: Sun, 4 Aug 2024 01:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202408040107.P9hJ7MiY-lkp@intel.com>
References: <20240801100640.462606-4-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801100640.462606-4-jfalempe@redhat.com>

Hi Jocelyn,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bb99c51bdaa846bddb85a1e7acca3a3aa5e9f082]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Squash-of-pending-series/20240802-204640
base:   bb99c51bdaa846bddb85a1e7acca3a3aa5e9f082
patch link:    https://lore.kernel.org/r/20240801100640.462606-4-jfalempe%40redhat.com
patch subject: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: i386-buildonly-randconfig-006-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040107.P9hJ7MiY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040107.P9hJ7MiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040107.P9hJ7MiY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_log_register
   >>> referenced by drm_drv.c
   >>>               drivers/gpu/drm/drm_drv.o:(drm_dev_register) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

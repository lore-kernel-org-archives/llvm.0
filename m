Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27F481236;
	Tue, 12 May 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573524; cv=none; b=qUEGfDI0r0M9rg+sG+2rbSg1JzAibV5FfaKXVUd4lhWo+U75pmDQdoZDBTSh8mxulEyRXnSE1I5Yj8BAxaxH4zH/V3VN6NOr5l9/grdzxhneGVvWMmJl/3xrj1Y7RmOgWWVVlwCrjKe2O52c6mHIjaJ0q1jiDI9L5TfI6z4s8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573524; c=relaxed/simple;
	bh=Lyfw8ZHz86iOPtbqj1/0b4s8DTqbNY5GYz9wZ61yw8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYNnfrT+1eGBgsFQoDmdG/P4YZ0coEWJewuaA1QHKZ79qCIQFMqDxZcv1sjEusZiJuRrWyPHtZ/3EaHEYpq4MCHBEbLLvgjg2Iu0ytkxEqPB65vVF0vfBFUOh72dPJAclG7DZ532QtOAARkf0OS8Nv8EH/NhEPakcncFnmSt+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMPjOqFx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMPjOqFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778573522; x=1810109522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lyfw8ZHz86iOPtbqj1/0b4s8DTqbNY5GYz9wZ61yw8o=;
  b=SMPjOqFxDGqd5DmHMOPgPEHkiq2uhpfkCspU4+B3mEdlhMInG/Yb7bZT
   7POFoUFs0cYex28WQtGQXtnx8sNgQMUI9rtKjNiyffojXKwfcyRwPLtGv
   TeB3IvFLKxiKLRp/BHgJsKZtFZObxudkoWBXjow+WHdIqE7AyYh3hgnie
   pcAl6JLkf43rni398Vm5TctkcxT7j2mTrMHQB8oV2cIiJpdhMbCt8peuD
   2BIoOUgNyMjyPJ0sVTpvJE99Vcr4Gr4l1ZZGpbvjdvo7oZQyjyOATABJF
   cNUIr9N3J2OvOh729jWbHuoCtWgLfb/ZkUUEg1oAhLPvoj0xzDhxptGPm
   Q==;
X-CSE-ConnectionGUID: PEbdTf6pTMulkGXYWSA3VQ==
X-CSE-MsgGUID: V2hpuLzsT6axZ4OIgp/f3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90858886"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90858886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:12:01 -0700
X-CSE-ConnectionGUID: qt2ZnkRLT3OiIy0Dozx+2w==
X-CSE-MsgGUID: wdyrEXXSS4yuFb5eH6VODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235032968"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 01:12:00 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMiDe-000000001pW-11Ac;
	Tue, 12 May 2026 08:11:58 +0000
Date: Tue, 12 May 2026 16:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] xe/xe_mctp_mailbox: Add support for MCTP
 transport over mailbox
Message-ID: <202605121643.X4yOe0ng-lkp@intel.com>
References: <20260504193420.1232842-4-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504193420.1232842-4-badal.nilawar@intel.com>

Hi Badal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-misc/drm-misc-next drm-tip/drm-tip linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/xe-xe_mctp_mailbox-Add-support-for-MCTP-transport-over-mailbox/20260512-014830
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260504193420.1232842-4-badal.nilawar%40intel.com
patch subject: [RFC PATCH 1/1] xe/xe_mctp_mailbox: Add support for MCTP transport over mailbox
config: powerpc64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121643.X4yOe0ng-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121643.X4yOe0ng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121643.X4yOe0ng-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mctp_register_netdev
   >>> referenced by xe_mctp_mailbox.c:166 (drivers/gpu/drm/xe/xe_mctp_mailbox.c:166)
   >>>               drivers/gpu/drm/xe/xe_mctp_mailbox.o:(xe_mctp_mailbox_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mctp_unregister_netdev
   >>> referenced by xe_mctp_mailbox.c:147 (drivers/gpu/drm/xe/xe_mctp_mailbox.c:147)
   >>>               drivers/gpu/drm/xe/xe_mctp_mailbox.o:(xe_mctp_mailbox_init) in archive vmlinux.a
   >>> referenced by xe_mctp_mailbox.c:175 (drivers/gpu/drm/xe/xe_mctp_mailbox.c:175)
   >>>               drivers/gpu/drm/xe/xe_mctp_mailbox.o:(xe_mctp_mailbox_init) in archive vmlinux.a
   >>> referenced by xe_mctp_mailbox.c:147 (drivers/gpu/drm/xe/xe_mctp_mailbox.c:147)
   >>>               drivers/gpu/drm/xe/xe_mctp_mailbox.o:(xe_mctp_mailbox_fini) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

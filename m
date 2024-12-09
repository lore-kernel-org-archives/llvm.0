Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B4156225;
	Mon,  9 Dec 2024 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717349; cv=none; b=EIKFP9kUY0gdRrWG6kA1fgxQJ7l/FIelDRC5aJqNSLDEXt3ArMVP19B35/ITt6QUq3GtwIlcbAfIlLoizEMC0AijvEtRa5vtQKVGCeexgjSUFAFpwqnsihVJ2RWxk3z2oW2iwizXrHO1uRSm2cjQ6TD3Mqd5YMStf02jcx9ckK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717349; c=relaxed/simple;
	bh=xrZmHyVhHqVgg8cFS7rRfKkgS8mkCy5rG6DpzPss9qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5GiogoFCRlMruf2TN7kzqU/SYDo7o7o6SBGVeaTLxva/BnX4ljAHdWo8R/zefAGG+8mj8ix4UrBaDtEAO0+T3ab1BBou23ayx9VISEK0CwecoHgM55l62cyvWXkweK3eaETL1CPduXQeoanZ/1Wr5Ht4B4Y63YpczcOfZESgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0CGcrpc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0CGcrpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717348; x=1765253348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xrZmHyVhHqVgg8cFS7rRfKkgS8mkCy5rG6DpzPss9qs=;
  b=W0CGcrpcR5zq+Vtlvbvlr09HpWX+Q+SYreLaf688Pd4gt8aevN4CI0/n
   P3BY9RRLvmS5aDaTs+0EbtZQ0Cl76gSKU/Eh9qnKsXGif8LOXCBerO1z5
   CI8iKDSLwq8b8L+s8aE9rqPvDOiZpvRxb4ShaXbJ69qLCcI5maYLUd7KB
   pbpnmWXLEJAqOYbnBDrRApsBiKKvpzY8mQMOJQY1GB4h4+ooJVu7BwMp8
   L5nUmTmXskeEaK5fFpfqM+NtuzXMIyqNcnHkD+xz+K2Bn6Zz98MSontBW
   1fj6i+6WgVB7INJbPRjf2sfeN8Ph+niVFyzxAYcl8+FseZePWgkgDUaqD
   g==;
X-CSE-ConnectionGUID: kiallb0ZR9G5FNtPn8iLcg==
X-CSE-MsgGUID: KrLngKw/TJuqeTghx7j4RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36841932"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="36841932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:09:07 -0800
X-CSE-ConnectionGUID: YiaNnwr+Q82GI9GPwEeh2Q==
X-CSE-MsgGUID: Qz0yZqEnSOWTRrvj/ysL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95044952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:09:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV4x-0003nL-1u;
	Mon, 09 Dec 2024 04:09:03 +0000
Date: Mon, 9 Dec 2024 12:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the
 kstate's migration stream
Message-ID: <202412071334.DfaD5v3v-lkp@intel.com>
References: <20241002160722.20025-3-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002160722.20025-3-arbn@yandex-team.com>

Hi Andrey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master tip/x86/core v6.13-rc1]
[cannot apply to next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241206-032658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241002160722.20025-3-arbn%40yandex-team.com
patch subject: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the kstate's migration stream
config: x86_64-buildonly-randconfig-004-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071334.DfaD5v3v-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071334.DfaD5v3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071334.DfaD5v3v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_kexec_unprotect_crashkres
   >>> referenced by kexec_core.c:1051 (kernel/kexec_core.c:1051)
   >>>               vmlinux.o:(kernel_kexec)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14F31AABC;
	Mon, 28 Sep 2026 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573014; cv=none; b=SuDY/u4KzFcJG2L/aNzoDDaWLrAIZJdTqCKIEY6qnyRW8eLWRU5PS9xIVdrVXoGpX2WFZOfonjmC9JM5mj6T6HP/Ig++eUXqnOZj70f9sNgyPxHMpxuPBzks//LQBvbUJ4iNvY45DPDHL7itqEvoggo0QVVmqLvFxyrz28pOx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573014; c=relaxed/simple;
	bh=Fcf2iIHjsRRicCV3m07hib4lh/jRAWvO15ac/fC9YD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCI14My2VRqgJToGoaFKFhsdpecFHd7LP/a+Vujs2rDGOwsknr1gZOrs/VoL0vx1wbQrDxGc5ZmBUdZLDw0uE/H4HImCiI/D8tskex9kVW5UGWUzICkNvsl8UBEgVCxOcjThA98brVw+rn5TQzF2KtWCzyNZHHtYNeeIQ4o/cF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIq1fzLI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIq1fzLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790573012; x=1822109012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fcf2iIHjsRRicCV3m07hib4lh/jRAWvO15ac/fC9YD0=;
  b=OIq1fzLIRr/Wj7WRPzGseWq3AZ+xkj8DO0yCTtvWqEEQ+E0qQWjyMQmT
   uG2MIHBZyAo1zbALg2lpN8GE83KAoWf7hro0ats9/Rc4L48adaM+L1Pfz
   tJ75FbxeCzO28baaKydvfSoXA3swC8S+45vUHdbsPSeiskPq/8HBMlHgS
   chQwp8iMu/c86nnjF8WQXl+Ign4YVR13TqnfARqMuQYDge0E4K39pRMIG
   idxX579YgYAHc+9Vpx5biRQS9noXzix10ZhN45DLjTmryc+insO9ExvZb
   C/5rn13iW7OcK3ea/KFXamXWuQI07C1FCBOFXw9SKwqk+25cLaYfch1yt
   w==;
X-CSE-ConnectionGUID: adRR5XDAT5KxsGY9KtE78A==
X-CSE-MsgGUID: spx6Fr5YTUWe/pdrp494bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101921567"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101921567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 22:23:31 -0700
X-CSE-ConnectionGUID: NqVgcno9S6yrfHp2BkteSg==
X-CSE-MsgGUID: R+dO3/lsRimfHgFUmrl2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274998139"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2026 22:23:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB3po-00000000NZD-0AQp;
	Mon, 28 Sep 2026 05:23:28 +0000
Date: Mon, 28 Sep 2026 13:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] security: Allow dropping bounding set process-wide
Message-ID: <202609281347.3heKlnv9-lkp@intel.com>
References: <20260922095816.1191799-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922095816.1191799-1-ruanjinjie@huawei.com>

Hi Jinjie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on linus/master v7.3-rc4 next-20260925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/security-Allow-dropping-bounding-set-process-wide/20260922-175816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20260922095816.1191799-1-ruanjinjie%40huawei.com
patch subject: [RFC PATCH] security: Allow dropping bounding set process-wide
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260928/202609281347.3heKlnv9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281347.3heKlnv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281347.3heKlnv9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/commoncap.c:1399:22: error: call to undeclared function 'mk_kernel_cap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1399 |         kernel_cap_t mask = mk_kernel_cap((u32)low, (u32)high);
         |                             ^
>> security/commoncap.c:1399:15: error: initializing 'kernel_cap_t' with an expression of incompatible type 'int'
    1399 |         kernel_cap_t mask = mk_kernel_cap((u32)low, (u32)high);
         |                      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/mk_kernel_cap +1399 security/commoncap.c

  1396	
  1397	static int cap_prctl_drop_mask(unsigned long low, unsigned long high)
  1398	{
> 1399		kernel_cap_t mask = mk_kernel_cap((u32)low, (u32)high);
  1400	
  1401		if (cap_isclear(mask))
  1402			return 0;
  1403	
  1404		if (!ns_capable(current_user_ns(), CAP_SETPCAP))
  1405			return -EPERM;
  1406	
  1407		return cap_bset_drop_process(mask);
  1408	}
  1409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

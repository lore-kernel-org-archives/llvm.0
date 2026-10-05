Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6542E42C;
	Mon,  5 Oct 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191422; cv=none; b=R5xzC5JPumI80POCKen0TkgeC5hJW7qdNXnPX5tLjDevvi8srzZ9dm7HRgwm9uCZr0tA95gh3ndtxM8Noaq8BnDPY6pVthhIsn/lctQm85ZspvIAyhDcC/teHxDg9/CKVkaqfg0xVd8RLWVS8szxjSRt5oBg4ulBXpSk0YA5tdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191422; c=relaxed/simple;
	bh=283P06yt7bgvdEkCMw/3/0Fugjal+5cZX4SRBJ2HvWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YnR3w6uhj6qG5NZeRS7WRnD6OqOC1/uI0PDN+BjTLjkyFLwxK9J6eW3w42k95JHx3YyVve6NZ7Rnne9LlBhIiohoYnOCBKB+Vs6Mf66BrUwPPND/VNYaDcxQ7zeorhrU0xd7WFwqQYAUJpgoDda1/UxH1w2IU5eb0I/nTHhpuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXiECcZN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXiECcZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791191420; x=1822727420;
  h=date:from:to:cc:subject:message-id;
  bh=283P06yt7bgvdEkCMw/3/0Fugjal+5cZX4SRBJ2HvWY=;
  b=gXiECcZNsU4489objbV1SjQhZZEBoRwTkszczvKchsNBMm4OuZNGUsrt
   wvZeeND19KRtipQNSa8dePrrp1H0YWM6Kp6+XA1IIJV37vOcIYkzDwQdl
   HLeb8bKaIP/u7sPg9xatdG+DH/id7FEtw165mkHdjW1amQ3cQQffyMGlu
   uujxw+9eo3HPJacuM+DMpDnPp2X99V0brLYewSv0Cy9ioEfOzNo37XnLe
   x3L9RlKRoT55w6nBn0IaahHth4DwJp/FOT1rWC5qQ3MQAM4As78puc2RJ
   2oSNt5oHH/7F7Qx6Rl4zzAmfccJW+QZ6t3QqSuo5xnKD4fS7CPNy2yTgH
   A==;
X-CSE-ConnectionGUID: vuoMlkQ7RK64KZgBE3MnXw==
X-CSE-MsgGUID: OvNQeoX4QHiqW5bV1rhoxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="4355"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="4355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:10:20 -0700
X-CSE-ConnectionGUID: iLMMVLlWQ5Cs9d1BFZLs7A==
X-CSE-MsgGUID: Y4BBI0bqSdSUmpItMRY9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304717073"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2026 02:10:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDei7-0000000007D-3Jrd;
	Mon, 05 Oct 2026 09:10:15 +0000
Date: Mon, 05 Oct 2026 17:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-p3-wip 7/8] kernel/time/ntp.c:175:2:
 error: call to undeclared function 'pps_fit_reset'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610051707.7zfdNyut-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-p3-wip
head:   24b5bb6499c7dcc715bf50f768bc24b50f9cc631
commit: f04f156f18471fef43c99e5ef017165b43f34e7a [7/8] ntp: Estimate PPS frequency by least-squares fit over the interval
config: x86_64-buildonly-randconfig-1004-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051707.7zfdNyut-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051707.7zfdNyut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051707.7zfdNyut-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/ntp.c:175:2: error: call to undeclared function 'pps_fit_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |         pps_fit_reset(ntpdata);
         |         ^
>> kernel/time/ntp.c:1244:13: error: conflicting types for 'pps_fit_reset'
    1244 | static void pps_fit_reset(struct ntp_data *ntpdata)
         |             ^
   kernel/time/ntp.c:175:2: note: previous implicit declaration is here
     175 |         pps_fit_reset(ntpdata);
         |         ^
   2 errors generated.


vim +/pps_fit_reset +175 kernel/time/ntp.c

   162	
   163	/**
   164	 * pps_clear - Clears the PPS state variables
   165	 * @ntpdata:	Pointer to ntp data
   166	 */
   167	static inline void pps_clear(struct ntp_data *ntpdata)
   168	{
   169		pps_reset_freq_interval(ntpdata);
   170		ntpdata->pps_tf[0] = 0;
   171		ntpdata->pps_tf[1] = 0;
   172		ntpdata->pps_tf[2] = 0;
   173		ntpdata->pps_fbase.tv_sec = ntpdata->pps_fbase.tv_nsec = 0;
   174		ntpdata->pps_rawring_n = 0;
 > 175		pps_fit_reset(ntpdata);
   176		ntpdata->pps_freq = 0;
   177	}
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

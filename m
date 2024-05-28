Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDE15BB;
	Tue, 28 May 2024 03:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716866456; cv=none; b=CqkjuXdEvhBoWm2AEZ8GZ7IuQqQ4uuefVN32UFxuqTXP06omVc8xRCkhlyMJ/r2ZKkiPmECtU5L6QHs4ZInGmOTnXCHQCsu0O+aFLTgMoXQfd4VRsuSGebEeAQPYZWxZf/WUHimxSCBdDvyYlkPaQmSfk7I4fvCTqYtNe5Lq8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716866456; c=relaxed/simple;
	bh=v4G83oAY2vqZqJGU+MwQC4PZO2lKXl0QCTG4i02Glo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zej7hTmASGxL/CwPZTx56z2ZQ6Lc28D3XUOI7LSZkPvl4MFRtNlO0G8NK+IW0sojBHgo5IJO3nIUYhVwszoKqrqz1HPQ6Io8gIEyi5ExYNkvyuEEORGaSLPqjYUvCHxVxTmWexE/y+WQ2Kd2zA8o8zpiPe/85snV0So5T6l3h/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKTzbZ1D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKTzbZ1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716866455; x=1748402455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v4G83oAY2vqZqJGU+MwQC4PZO2lKXl0QCTG4i02Glo0=;
  b=MKTzbZ1DnEV4b9BKE97wDXF6gXIOoMzNMwF4Sknyb4mwF0NENtxHOVsn
   6i3tzsvg44bXWhw4f+514I4bGZqyyO0Q7Qj/DQgYXc78DBreSq04Xh7JO
   SxB9sOXOCTZUYCDP/r7LD5kB+csdWtklHcJNzRvCeonsqTJsESMPHYm8R
   gklPZ0jaLCX52WxnLCHm3IgVzX3UUAw+UYV5ksKagYsFXVOQ0wKze11mn
   XHFp1OtvFW6SXZK2VgucCx3epd9eW87iNqK18JHaHELJG8z/JU6jAgLan
   NWeXNyCghLwHk7GwUb0RQ5jtP4RWl5MJeQl1F2VmjsIZSmpWuEpEcTc/Z
   A==;
X-CSE-ConnectionGUID: E5Q3bzEcSruf1cYWs7VfSg==
X-CSE-MsgGUID: EkpjwCiOT7GE/O9bhUucbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24316114"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="24316114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 20:20:54 -0700
X-CSE-ConnectionGUID: xql3rC9lTdGZGMFD3oH6Sw==
X-CSE-MsgGUID: UV8bcWQfRdCuiQ3mieSD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34904067"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 20:20:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBnOL-000BPH-2H;
	Tue, 28 May 2024 03:20:49 +0000
Date: Tue, 28 May 2024 11:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC 2/3] pmdomain: core: Avoid earlycon power-down
Message-ID: <202405281126.rl6q4ObG-lkp@intel.com>
References: <7c5c0c8a10b8f755e5a75c7836b43cac63762eec.1716811405.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5c0c8a10b8f755e5a75c7836b43cac63762eec.1716811405.git.geert+renesas@glider.be>

Hi Geert,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus rafael-pm/linux-next rafael-pm/bleeding-edge geert-renesas-devel/next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/earlycon-Export-clock-and-PM-Domain-info-from-FDT/20240527-204346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/7c5c0c8a10b8f755e5a75c7836b43cac63762eec.1716811405.git.geert%2Brenesas%40glider.be
patch subject: [PATCH/RFC 2/3] pmdomain: core: Avoid earlycon power-down
config: arm64-randconfig-002-20240528 (https://download.01.org/0day-ci/archive/20240528/202405281126.rl6q4ObG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281126.rl6q4ObG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281126.rl6q4ObG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: earlycon_power_domains
   >>> referenced by core.c
   >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_simple) in archive vmlinux.a
   >>> referenced by core.c
   >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_simple) in archive vmlinux.a
   >>> referenced by core.c
   >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onecell) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: earlycon_power_domains_ncells
   >>> referenced by core.c
   >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onecell) in archive vmlinux.a
   >>> referenced by core.c
   >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onecell) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

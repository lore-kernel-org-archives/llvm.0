Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78661F5F5;
	Sun, 31 Mar 2024 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711898013; cv=none; b=FOHPFU9QiJR5CHBeW9Q620jr0YkGYLubKZu/UztZfg+LrgK9KaEjlUV/h6y+7vJlwKcrv8i/0gcyOO3P6l66rXGCJupmlMfELRREhCEx1eX4NIfYJlQ9bFOCQyBKq7EA3hbJllXJUDpW/dMdT+oOkG/cK5qASG7E4zeIf4sn+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711898013; c=relaxed/simple;
	bh=fbVPw+Q7OgGTSCcyR3QbM1cHNIni3p806Jps8VWiZ80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkCh1B6UWo4NyK3Sb6Pr2MIXQ2pGnYZJUMpAwGrZ3NhoD+nwQ/GiJRSulT1pH3UvgMLKtwxOt7S/DbbJNQ4nE6lOXA35Uvte254gDTCfFTyblvNG+DK07/vaKZLpxE78q/aQM0F07qHHp4gDLdvKWsa1wfajKSd7jVP4UYlA4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSSyqCPP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSSyqCPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711898011; x=1743434011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbVPw+Q7OgGTSCcyR3QbM1cHNIni3p806Jps8VWiZ80=;
  b=dSSyqCPPOTtI94+f1PkIhRb64pEhxTKkiMer4rmEaKKd3WcGlGE+oYqt
   Y0uYBiB0dEOFbr2lqH567ldIF8OQW1AGuT+Rz6csA4BSjUcOEW5bwzgNk
   tbz/sJLZcTkwgI0fMvUO017sLM/WoaIi0edsGKCu2Sk7UxvK1gss6VuSi
   7MBR9zbjSxDotU+CU1omH5LsRjAGfK+iD5WO3Y4TnQI8G00hbHf5ltVd2
   owoFj1GFyBvuLIzCMZwRJHrYMFb+geM3M6/h9JN9H69ttjfvzINkEWcES
   HNo04fHMCZ4511Lp7I9d7kTYX34CRErpnvpoRfq9vty7QFC+IEOwh2+/2
   A==;
X-CSE-ConnectionGUID: DGWXZq68RImNto6w33r/mw==
X-CSE-MsgGUID: xzeeVFTUR5OfNlcJSD+lYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7160594"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="7160594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 08:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17550090"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2024 08:13:30 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqwsB-0001Cu-2R;
	Sun, 31 Mar 2024 15:13:27 +0000
Date: Sun, 31 Mar 2024 23:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/6] cxl/core: introduce cxl_mem_report_poison()
Message-ID: <202403312204.7gaCjNCt-lkp@intel.com>
References: <20240329063614.362763-3-ruansy.fnst@fujitsu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329063614.362763-3-ruansy.fnst@fujitsu.com>

Hi Shiyang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master v6.9-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shiyang-Ruan/cxl-core-correct-length-of-DPA-field-masks/20240329-144850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20240329063614.362763-3-ruansy.fnst%40fujitsu.com
patch subject: [RFC PATCH v2 2/6] cxl/core: introduce cxl_mem_report_poison()
config: i386-buildonly-randconfig-002-20240331 (https://download.01.org/0day-ci/archive/20240331/202403312204.7gaCjNCt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403312204.7gaCjNCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403312204.7gaCjNCt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cxl_trace_hpa
   >>> referenced by mbox.c
   >>>               drivers/cxl/core/mbox.o:(cxl_mem_report_poison) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

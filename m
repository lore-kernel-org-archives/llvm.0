Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F380B286D73;
	Fri, 17 Apr 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776460639; cv=none; b=GZB645I6LnAkeHRrVDl62tvahpBtLMlMmthX16IGSGb5gdT48LICqLG1E/yMx/gyZn/TxZsZmWskRlTTECoU4EtnObgh5Ku/2298e9leiGdzC0PwkslyTUuW0ujmb4iZMScZtFNY09+nDaJbJ19vs0BPQRL9EIXk3d1ZgCOXzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776460639; c=relaxed/simple;
	bh=epwlFBsalxdWuyw5+up4ZTUPp6kN7di9A6zZ9iMpm/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qU8TqHSt4rNR89Hu45QDaNvGqA7y7O4/IzdSyw3BaQwBDcYrla5ZU7lgOc1MJ6bEiW79uIJH5MApFWTzRdFyCARGZza0YBlufGMu/gSX/xQZag7pSCExf9HdII0Zrk17pYOezH3YrG1Oa+FCQm4KjsqzzqqAVzNDpmJ7d3Qk7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HI/2s/ts; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HI/2s/ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776460637; x=1807996637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epwlFBsalxdWuyw5+up4ZTUPp6kN7di9A6zZ9iMpm/c=;
  b=HI/2s/tsZnj8GUIWZ+0NLFLxz8/dO79bxnvFBJbThThbtHD58BenYF1T
   rrBT1mG69CVOxpRROAbmynNHOmMZuXWf4xm6zFsax5UG/YYYjzQakofHw
   KbreLNukwteaqVyG9nm/YkCJqWj84iSpM+L0yXczKphw250YWJyK5fPEN
   kZzRAziYI1Svyh/+WR7P1xxQ8ubdK+1pm0wj7XLSqCC26r2xUMYp2D5vz
   +9IwEdFs6zVvK6KrFZ1EWAOYcrvLSMxclmjBkvWfMJT2GrsZBu404g4Is
   6/XJx779UB3QtTRrX7l5gIJytFchlLYNXUaAgQ+Ifzywr2GHSWxl8+45y
   A==;
X-CSE-ConnectionGUID: 0XktdZeXRrSJ0VF9Tzving==
X-CSE-MsgGUID: p3Ew25ljRb6FE92g4j40gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81359268"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="81359268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:17:16 -0700
X-CSE-ConnectionGUID: 5ASwowp/TbqcQytqdkzjPg==
X-CSE-MsgGUID: V+h3r/JcTpagkaHHqD2fsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="269156937"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 14:17:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDqYo-000000000hs-2thS;
	Fri, 17 Apr 2026 21:17:10 +0000
Date: Sat, 18 Apr 2026 05:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604180530.yvwobb0w-lkp@intel.com>
References: <20260415122939.77847-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415122939.77847-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260417-103458
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260415122939.77847-1-m32285159%40gmail.com
patch subject: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604180530.yvwobb0w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180530.yvwobb0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180530.yvwobb0w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/octeon/ethernet.c:23:
   In file included from drivers/staging/octeon/octeon-ethernet.h:41:
>> drivers/staging/octeon/octeon-stubs.h:1270:49: error: incomplete result type 'struct cvmx_helper_interface_mode' in function definition
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^
   drivers/staging/octeon/octeon-stubs.h:1270:22: note: forward declaration of 'struct cvmx_helper_interface_mode'
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^
>> drivers/staging/octeon/octeon-stubs.h:1273:9: error: returning 'int' from a function with incompatible result type 'struct cvmx_helper_interface_mode'
    1273 |         return 0;
         |                ^
   2 errors generated.


vim +1270 drivers/staging/octeon/octeon-stubs.h

  1269	
> 1270	static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
  1271									   interface)
  1272	{
> 1273		return 0;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951425C836;
	Mon,  5 May 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482961; cv=none; b=cSRqSF5AOanx9/wTL21VxknJUj1by2WlV/gkOo52dwVRxpv/usGowZMzbQLY7I9KbTIp/zayve7YZePadohrguoxlKGMG7834ULuL5Qo/SkcmyLS6lpJaU92UkUHLhCCk9Pmpl6Pe+UTN179GkciKM/fJQoh1hFx08QMXFZYwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482961; c=relaxed/simple;
	bh=5V6Q0IybOsq/r0l9ElfoRFpy+R+LZ1dRja9/RKg+xqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BK5zZidbpwXDj7uabHczHaqNwLzegPgHAfhgHylbX7UAuKjBIuyEHE8xP7qJ9G27YqVw/edm6glslHoHVYAjLKCPgHkQeAroIvg/d4gpNjdi5J/avT5UycXgDOSL8QRV/oEdxd7CkpDl3/kWpfBJveTZRRaAvP44rS+rcug2hR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJrcor2G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJrcor2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746482960; x=1778018960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5V6Q0IybOsq/r0l9ElfoRFpy+R+LZ1dRja9/RKg+xqI=;
  b=GJrcor2GBjvPz2lhlmlZt3R8uJphuZLGDds0D2RP3h6TZH8WcUtfUcEa
   5oPgkOCxi1ZhB7uQARYemN5MU5KurMvEgyFWC4PFNZG6efP7Z45nSOoy5
   +RCOq0GOcqomcRzJ6XmLTVNcjFTMkWe+X5fiOk6UlPpzTl8Nt5mRTeWfe
   riLO+JvZcBec3LWZb3LoO+tRitEMrx4ZS4SwsodnMxwJSm256L4SE0pt9
   3tRAmogNdG5jkZxMLaIbU9b8xeTIzF2b9gwYX65bxdBf1HcKCBf6f9Q3z
   zbiK60iFh8pa+j1LT3nlhleQLXX4Lezb+US9F68fAHMQ/QofzJFLAB6EZ
   g==;
X-CSE-ConnectionGUID: cGbwc1w5TqyugaICdCDIJA==
X-CSE-MsgGUID: VbZWQxDTQI+YUAbAAO4+Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48201466"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="48201466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 15:09:19 -0700
X-CSE-ConnectionGUID: amafLmUoQBSAbn1nimBBQA==
X-CSE-MsgGUID: dWWysA5+TsiLU9C8oF/cDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="158621951"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2025 15:09:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC3zu-00066P-31;
	Mon, 05 May 2025 22:09:14 +0000
Date: Tue, 6 May 2025 06:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <202505060531.xpSLGaPO-lkp@intel.com>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502080156.1672957-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-zblock-use-vmalloc-for-page-allocations/20250502-160411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250502080156.1672957-1-vitaly.wool%40konsulko.se
patch subject: [PATCH] mm/zblock: use vmalloc for page allocations
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250506/202505060531.xpSLGaPO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060531.xpSLGaPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060531.xpSLGaPO-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

mm/zblock.c:176: warning: Excess function parameter 'ops' description in 'zblock_create_pool'
>> mm/zblock.c:221: warning: Function parameter or struct member 'nid' not described in 'zblock_alloc'
--
>> ERROR: modpost: "try_alloc_pages_noprof" [mm/zblock.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F640B0FC;
	Thu, 13 Aug 2026 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599613; cv=none; b=BH31+WrIbqiZk9I56Io55Pr9FeLsPGcwev1at3gAm/RCnkixF4o1whF8cTnLWqKTz5XgD3KoAu9G1NwlnUbzbZ7fI11G6t1s7wJJc5yOcaaCSvOin2N0fla/gOBa637Bcfh57+e7KBfWuimzNvHgiWi1IGdPh1G5CwT5p/Q0gjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599613; c=relaxed/simple;
	bh=ixAiOVkhr76lZfMONmpSOHY53VHKrTWSKfeeqLQfnJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GOdDxYkDXfFtIJQ61447HKAM4oIa/mKR0ZEq9hQiwFG6Qn3iMPoKhlZj9khCYiKVXKVFEOsOt2Wh6jwEEtq1rRmnz5yDxw9E+tVaM861GCSgTMJppduIKS9JkMSHoUn6cF4IiV5ubeBqfqG3Uc52l7IwFOvAvAYm1NbwtNAZuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgZpdolO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgZpdolO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786599612; x=1818135612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixAiOVkhr76lZfMONmpSOHY53VHKrTWSKfeeqLQfnJU=;
  b=YgZpdolOiiRKuNKIETsmbEOW7u+xENva+KnGkU3w2u1/QxqDK+F5FGRr
   32PBHOUfORZfLaY1iTeErqzJPDYZxu5PCXl/fFaEkeV1GK4MWvYhtLjpY
   Es1F0qd85A/mMxP6xIC+vDmDhYGUHIiCVOD6zsU3PBsp7hpQi/sLLxH7m
   SIm3WFmAL8xZ73gKIfSja2hY8D8727gMSLFKhPFPr30L8S7CazA3ixvXs
   POcFn0qvtnDBd2Fftq1ghnO54DFbYWy/Xwi1nnJGLvPxRcJHIrvS+1A5N
   a7cScwmDzOAPLqWoerDLKEmrGSnuvV8ASySP7gs9htfLwK6Xj7gZFwyZJ
   w==;
X-CSE-ConnectionGUID: yn2k0KEuR9S6nX1qaaR4Vw==
X-CSE-MsgGUID: hxXxRjrfSAerIJLuAyKomQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98680431"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98680431"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:40:09 -0700
X-CSE-ConnectionGUID: 2sE7sjqMR6W5U8qfxdmdDw==
X-CSE-MsgGUID: 2hxLgKQlReSvXMDuoc06jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264425064"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 22:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOAf-00000000Swv-1MV2;
	Thu, 13 Aug 2026 05:40:05 +0000
Date: Thu, 13 Aug 2026 13:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-asm-generic-vsyscall-h 7/12]
 ld.lld: error: arch/sparc/vdso/vdso.lds:115: symbol not found: __VDSO_PAGES
Message-ID: <202608131306.RCwwT6nY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-asm-generic-vsyscall-h
head:   adcfde532be640a97064a7f9ecb20b6026a4c3d2
commit: 01fa4954564be77b8e5affd0825952e0a88d5bca [7/12] sparc
config: sparc64-randconfig-002-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131306.RCwwT6nY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131306.RCwwT6nY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131306.RCwwT6nY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/sparc/vdso/vdso.lds:115: symbol not found: __VDSO_PAGES
>> ld.lld: error: arch/sparc/vdso/vdso.lds:115: symbol not found: __VDSO_PAGES
>> ld.lld: error: arch/sparc/vdso/vdso.lds:115: symbol not found: __VDSO_PAGES

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

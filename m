Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E12F5A35;
	Fri, 14 Nov 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102888; cv=none; b=teePJtTowcw1CvWKduJGoeLDsun721erEiTKDyEpspq7gY+JL5Iou5qg0cBTIT6jiup02KvQo1EVsJk5SKJ1Vtz/XPJNwxV3rnBEL5pFghPkVFUV+jSkNg8fEK4wMHT/O/2qgBXnnFcGVJ59RknkLYb2ugckWuKIbCBRLnIubV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102888; c=relaxed/simple;
	bh=+zCUtEHlwlGcqEuffY9sp65l6z1c3WY5DFnFfsStfF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Ir5Pe0CJcttysOsKo/nX2w5U1m7qEj5ayIx7eeisLDMCabEnONbwFA5lDfwQwzl4+LKft9kgTyO7VMwCkqlwultVqAcHPd1JIXNPDEm1UtcYXcPBFCeWRTrT1wNToDIp+RT5GLIYRHWWZO+cVWDEMTl4fJLf7x4ugPieCwqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Syf5Mpjw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Syf5Mpjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102887; x=1794638887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zCUtEHlwlGcqEuffY9sp65l6z1c3WY5DFnFfsStfF4=;
  b=Syf5Mpjwp/FG4jxn10PXj0Uo2b+ie4oJfB1exqQRWRRFq8l4fzU/C5js
   54WIL7KxPnDkpXBwws5c3gh0/Jx5NtK+z7WZoRK+v/Fd/RFFmTPvyEHPl
   d4QGarAjBJSzhE92aNDYXO3ckutiwp3/W4+NpR+ipyIfWskJaFNYCbEYW
   1c0BNqDFs+NfD16VDyVZEhduZcgr9iKm9Eypcd3zaW064VB4gLzlazw7N
   VvAZTgfldnw1CyqHmIG/O+2ihJDIzOj3X9PxyIppZW07Dy8tTXQNtTgPm
   dsa9aofcuHaTYJFGehMflowJlqKXsPuITpWJEyVPGVihfFPtfoWEf/XHi
   g==;
X-CSE-ConnectionGUID: kfkT6e/2R8CCireUCAbslg==
X-CSE-MsgGUID: ppAZsSjIQpeWLbJY1WAjDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65132784"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65132784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:03 -0800
X-CSE-ConnectionGUID: mlRh87pLTPOZggC5iDu46Q==
X-CSE-MsgGUID: 28DOKFCdTM63Bw6uNNu2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189554983"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006G0-1e;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs
 via sed
Message-ID: <202511141322.LNGWwGBy-lkp@intel.com>
References: <20251111132021.22809-3-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111132021.22809-3-ddiss@suse.de>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5]
[cannot apply to next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Disseldorp/scripts-headers_install-move-config_leak_ignores-assignment/20251111-212423
base:   linus/master
patch link:    https://lore.kernel.org/r/20251111132021.22809-3-ddiss%40suse.de
patch subject: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs via sed
config: arm-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141322.LNGWwGBy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141322.LNGWwGBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141322.LNGWwGBy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/arm/include/uapi/asm/ptrace.h leak CONFIG_CPU_ENDIAN_BE8 to user-space
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/asm/ptrace.h] Error 1 shuffle=2824370977
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1379: headers] Error 2 shuffle=2824370977
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2824370977
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2824370977
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

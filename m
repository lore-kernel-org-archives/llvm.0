Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2A0288D6;
	Tue, 25 Nov 2025 04:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764045246; cv=none; b=abjUJ3v9gF2PH9Xg7R/X8LCB5FHB+jMPSNqp/nbDgNJRh6HrEO4FyLVdHkhVFiywnPLbvk30EJCi+givwHz0lasKfAm8cfnza5MVu2fkRy4O0YNRFcbxUU2hNLRAj9s9tAUmmzBZB5kDvSMLGXq5ryL+tMtIK1pUnX7yBki3rSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764045246; c=relaxed/simple;
	bh=hqbPFR7Jz9LKklk2aquiOUUvdWygbAlrGGPk+Ryfgzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNfM06X2gfPvFU9vmFH6jF3kFM5LqnCI9eWdv2IHwUvxw+qS+7PYz38ik3hGDSrzJ+1SpOl7zF8dW4HDn9vekaeMFFJn2zVFd1Y5oDcGY14zle5U/40VRWHaiuBNTgvlzPUB3CfbybrVj38aA8xhNZ9o/ht6Y2XWd8D8aGl/2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgAS5YNL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgAS5YNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764045244; x=1795581244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqbPFR7Jz9LKklk2aquiOUUvdWygbAlrGGPk+Ryfgzc=;
  b=bgAS5YNLTQTEaaLYgUcNtyUcx1esQkmEIzzrjHVR9XUDFNPxzbt1ODXb
   ikbyrbZc6/5HYX6an9Nm+NXz/eKW6T90+2R9a7SC64/hTeeBvvvLZsNk5
   blr313fhoV5h8ZSUcoBspzfJFHDRfBmzOHK7y/aRgnZTCfarFT7seC7cN
   iqV3HqTGrlDzW4LbZTMty5frr75hNFC55ONIegx7jYx3uF3xwMFHh4d8W
   wZGGowjfj8OOefLV31NLCGF9OH6OFretADVANDqd6UYd0oQ1QxXy9pcpY
   /vn5QNBHQaOkoIeQs1olE4AqEg+e48+qWzaPnKh6bVGcAAqyloigKSZkQ
   Q==;
X-CSE-ConnectionGUID: bD1bffLnTJaEGtJKVY5WcQ==
X-CSE-MsgGUID: AvO+Umx2T8aAVTvNkEUjcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76743150"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="76743150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 20:34:03 -0800
X-CSE-ConnectionGUID: 1oMYc2IpS0mwQJ7if/SF7w==
X-CSE-MsgGUID: ogBCCuPNQZ+KcCLsGeFZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192336736"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Nov 2025 20:34:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNkkZ-000000001NB-0Zpt;
	Tue, 25 Nov 2025 04:33:59 +0000
Date: Tue, 25 Nov 2025 12:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:old-ucode-platform 2/6]
 include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error:
 'asm/vfm.h' file not found
Message-ID: <202511251209.Y78F7F9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git old-ucode-platform
head:   13bb70ba267344f42129e7942104f056d44389b5
commit: 61c21b2d8b57e9b2d48b774618c1bd19ce7a3a59 [2/6] x86/cpu: Add missing #include
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251125/202511251209.Y78F7F9p-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251209.Y78F7F9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251209.Y78F7F9p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/peci/device.c:6:
   In file included from include/linux/peci-cpu.h:33:
>> include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error: 'asm/vfm.h' file not found
       5 | #include <asm/vfm.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +5 include/linux/../../arch/x86/include/asm/intel-family.h

     4	
   > 5	#include <asm/vfm.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

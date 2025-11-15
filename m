Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E92AE78;
	Sat, 15 Nov 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763193399; cv=none; b=KyYcIqQhN/ShMxayA7ofk8R5m7Am5fVX1lAwC4HW3sAnQJ+bduBJ0ntjtKY0mkbwz6hHlWDGH69SdCyLoAJijO2Qzqw1Efmnxpb7BUc3rqLT5KqCiWt1Et63c8TnuC87uQYZhCmrtuVoCM3u0HFvknvJwOHUue8EM/swWYCh5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763193399; c=relaxed/simple;
	bh=E1/7vDZDEBIJmnNNslgNxNNdGs3gtHMPMC0nw2GuryY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJX97DasKZTujKGgvFTd+i/p+ho55rmq08QQquTlqPh4iKvBbkzEsK5OxhXNJwVdX+gq+l6cD1xTNemAGsRC1+fLTEAHGYfts47Q57AKNZy2Fa0qk3jIw7IL6hiuISQSHC9R8x90DhDXAwO9efknQKOBdcLKyQl0mtvyQ0rNF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNG+h3e0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNG+h3e0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763193397; x=1794729397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1/7vDZDEBIJmnNNslgNxNNdGs3gtHMPMC0nw2GuryY=;
  b=PNG+h3e0eluCmh0BlmxG4U0E7qAjGRZexuC/0FLdQyCfdgIGWgqEZ4Ek
   jRHlXJ661YZ2V15w1fHcD8CubUIbIplZWtaZN3jPQAMIt7liKs2PdUkBU
   imqETpWsn/+joysWXk96kvHSVFWyQ2CYhb/xf7+0A2N9IG9g2wZhB39K5
   QUsWoOU0mF1Mqi8t8vmVDqdVkNLSArCWvtcpATQ1rmaBUmByuXDLlh2PY
   qK+9Nc57ttPBLoX0V2h78zjvQJtFLZiyzSzrmMFs7zJF8XcfLhvlpB+l0
   Vibk9j+HLVW6cqs4gp1+Fq9rvWlELVS9WKNaNkEr0dtqy6wP+nVXhSOxW
   A==;
X-CSE-ConnectionGUID: N/jzL2ACTsSM8H+JOcYUAw==
X-CSE-MsgGUID: GYMGyluFTqqt2MtIDSCulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65162496"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65162496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 23:56:36 -0800
X-CSE-ConnectionGUID: sJUjy0iHQme0QFMeikCrYQ==
X-CSE-MsgGUID: Z1fd5P6dQQ2xAq2fFhCSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="195128499"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 23:56:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKB97-0007nh-0e;
	Sat, 15 Nov 2025 07:56:33 +0000
Date: Sat, 15 Nov 2025 15:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:old-ucode-platform 2/7]
 include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error:
 'asm/vfm.h' file not found
Message-ID: <202511151534.EavsvsAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git old-ucode-platform
head:   19fb9a6d870e83926b240ba86a3e35870fa2e578
commit: a2e925d5405ec14de4721ada7fdbd066aa33028c [2/7] x86/cpu: Add missing #include
config: hexagon-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151534.EavsvsAr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151534.EavsvsAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151534.EavsvsAr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/peci/device.c:6:
   In file included from include/linux/peci-cpu.h:33:
>> include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error: 'asm/vfm.h' file not found
   #include <asm/vfm.h>
            ^~~~~~~~~~~
   1 error generated.


vim +5 include/linux/../../arch/x86/include/asm/intel-family.h

     4	
   > 5	#include <asm/vfm.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

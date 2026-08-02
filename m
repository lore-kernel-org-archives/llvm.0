Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32466390C9F;
	Sun,  2 Aug 2026 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676218; cv=none; b=K4OebugGlzAcsixyiDeQvM2HlAD0RK39NrNdvQoAxPp/KnFcYwYYVhtNI0QHJ3rDHCXlpGbnVMjcSrHLwYqzukxgp6YPVrkeDJsLTM4U7dj1zmXFwIj36EVvx4qWjeJWEmT7aqqYo4UgLwIPFU/pt/Twkw11nRVLdJOCqNjmeUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676218; c=relaxed/simple;
	bh=dOmWWZU4fycx5LEu6cAES1j5A+llF3/UCUS+TWvYGS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jqkuj0vXm11PZTgTYvaqiSx+JvgNxTrAKat+E3n6L4zHN7wWu0w/vq9MCkHSgo5ZIGgKUzPyyV89UJMStubUGFMAKyqc+Ectv/JsTKPTeI4ePoSFX6KvB4gaM5RaFKesFQJGg6bpp1dII8U8MUbi3zx/HyXlgZ3iay7Or6+GetI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afj0bou9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afj0bou9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785676217; x=1817212217;
  h=date:from:to:cc:subject:message-id;
  bh=dOmWWZU4fycx5LEu6cAES1j5A+llF3/UCUS+TWvYGS4=;
  b=afj0bou9LKHgNLy4qkn86BgOz+hyX7rdXY/YbxeobE/RkD91v2z6MnUX
   PMED+tIUywCQpc84DRM+3UeNApg66OjT4TSEhyVSvmj2HbfrfW7jDgF/g
   UujWDakBbPk5R+o9/9a9t4QZkdZNJwAKzBc66fIOo2Mn63eRFQlN2JO0P
   541DHG2fkvzhvVGmThUC8+50lsocExdvB7w371ki699fcwT7GB+dAj3Bk
   QW9wdAZx70Pu1bG24VnON99q7sZ66p+6BqppC58XJ+OrmOqu0ZG26shdY
   mPC5RU0J354XUym5t6mATqVhGFnDXHWws93aePhAJwGWunJ7sFTqS6bRx
   Q==;
X-CSE-ConnectionGUID: vza+ofh2TiKRRdAWuF1EsA==
X-CSE-MsgGUID: hkhj+w5CTqKTKduAOkQuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="97393500"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="97393500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 06:10:16 -0700
X-CSE-ConnectionGUID: dsjBPrdbRaqwZsnH4rHQ5w==
X-CSE-MsgGUID: ZYfqTI6FTw6KNJvvpVypKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="259760427"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2026 06:10:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqVxD-000000003fy-0cgl;
	Sun, 02 Aug 2026 13:10:11 +0000
Date: Sun, 02 Aug 2026 15:09:29 +0200
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Jared White <jaredwhite@microsoft.com>
Subject: ld.lld: error: undefined symbol: __start_bss_decrypted_gap
Message-ID: <202608021528.lNFgGeHY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/x86-mm-64-free-the-gap-between-BSS_MAIN-and-BSS_DECRYPTED/20260731-173801
head:   ddb58c4e7a281dab36ea61d09c54c5564f46265b
commit: ddb58c4e7a281dab36ea61d09c54c5564f46265b x86/mm/64: free the gap between BSS_MAIN and BSS_DECRYPTED
date:   2 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260802/202608021528.lNFgGeHY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021528.lNFgGeHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608021528.lNFgGeHY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __start_bss_decrypted_gap
   >>> referenced by init_64.c:0 (arch/x86/mm/init_64.c:0)
   >>>               vmlinux.o:(mark_rodata_ro)
--
>> ld.lld: error: undefined symbol: __start_bss_decrypted
   >>> referenced by init_64.c:0 (arch/x86/mm/init_64.c:0)
   >>>               vmlinux.o:(mark_rodata_ro)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E21925AB;
	Wed, 11 Jun 2025 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654302; cv=none; b=jxMBPPxhAcZzw9JBxQ3jGuEPUIlTqdRa60klLArQ5wiZetOdXqRuNqmfYDVBTSmIxngMy+K09CxAFwFVlwRJbK6PXjs5hQojyqfjA7vhNiPNpQzoa9uDXXq9jQHXR4zGabNT4dpkFHgi3mpa4TZafUOltZHiGofxoDS9XKBaU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654302; c=relaxed/simple;
	bh=WlS93W6OWyRwYU1kN0ggywH96AnoQ3/ha9CariWZAso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSUT/f5p/Devhkx1W9MW8xkMp2df+UNBMU/jRmxNY5/x0UA67EMQ7K+crauy2nMuHykfmknuRYLOA0HmuTkqRbdoEJ500CIESU26r4iyp+5RiS9PljcFeKa+mbhSAcvUOkLerbGzEGIoQpO2KDgPtSHchwWiItWkCrNWfunxuK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AduYZDtq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AduYZDtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654301; x=1781190301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlS93W6OWyRwYU1kN0ggywH96AnoQ3/ha9CariWZAso=;
  b=AduYZDtqVTFCYvC+lMJwh/Ln7DZrnkzuVH7BA19OY0ApYjTO47bCn/kA
   awxAtMNPzv1TNizVfvt6wR6+UsoLky7d0/Wx2gPXdRyiCN78UKzIRKbDz
   4y/pnhwRrrZVTDUo5Xb7PizexSDonUGeZ/QHbnunMco5G52l81M4+oYDK
   aCye6fWShBGotnsUWmqWuq3BHQLqtnSK3N5Jvg8uqJlKIr8FGkHkDEVgo
   SEerQqaD/EnWizr6gKrbsmelHKzgWjDgmTXYWl0c7tcEZA50Y/iRNMu63
   cP7sji/z09VTh93LBgbWy6mtELnDWRj0U+armMWFWtByxYHdmLEE/0fz+
   w==;
X-CSE-ConnectionGUID: 2A1qHldWRP6m++8w6C5Jjw==
X-CSE-MsgGUID: vMbR6HRxQuuThjSYJOe9tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55471718"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55471718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:05:01 -0700
X-CSE-ConnectionGUID: +RFbbpFsSrmYn7nltE/9Pg==
X-CSE-MsgGUID: vrCAwakmQ82p4zgoGtgdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="148128744"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2025 08:05:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPN0b-000AbS-0Z;
	Wed, 11 Jun 2025 15:04:57 +0000
Date: Wed, 11 Jun 2025 23:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 44/62] ld.lld: error:
 vmlinux.a(lib/siphash.o):(__ex_table): SHF_MERGE section size (24) must be a
 multiple of sh_entsize (16)
Message-ID: <202506112238.9WWwaUKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   c66d830416562a4215c64db8dae6b94bc2c31de7
commit: da5e44b23c0df6c867dac0c30c6bf8bc61099bd7 [44/62] x86/extable: Define ELF section entry size for exception table
config: um-randconfig-002-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112238.9WWwaUKe-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112238.9WWwaUKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112238.9WWwaUKe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(lib/siphash.o):(__ex_table): SHF_MERGE section size (24) must be a multiple of sh_entsize (16)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

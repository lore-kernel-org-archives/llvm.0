Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E22C149DE1;
	Wed,  3 Apr 2024 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712159268; cv=none; b=e9M6sbld4F96SoELBoKvfUfTBTasCxc6vJong9wkcMmfaYAwrQhV3NT+x6GGRSPPyOG/ktE86ttAsljs94ZLpnzL3GGLIDUKdLTGwz1vBad2SFJZdJzy2GlUfmC+5HNhZd4h0bmiHnSgfdD48299+fgo45Gxaxlj8UcR2JQJIdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712159268; c=relaxed/simple;
	bh=Mv2jyRsU575Q8ym9L421cwd+/ipzo0OLYjbFZQij8Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYz9F3zyNmyiAeRVFS6ESxLKVNNLMkYCYSv6zRZWff3PVyBGIeNIDWcZUQYNonS9GqvudR48+dAT97gfyAPjBOc1wjugH5kM5biXLBLHJEfA2KZUn5/TefBR9x9ce8QU6fKiFMsFyFEex5ydO4ZcoK/reuDIGuS8Vc9WJBZOp58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGeseyGz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGeseyGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712159266; x=1743695266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mv2jyRsU575Q8ym9L421cwd+/ipzo0OLYjbFZQij8Bo=;
  b=gGeseyGz1UAMq8OwLeGmXjTEcHnwO8MDnAjGOsJCx2HK84+fdJZFTHlo
   4Mqkr0xgDypjJ+7VIu1lsqRZF88VSpdcBP13q7DpyaN721b+avg0dUVcI
   pRxIV5C3cyFPulPq17tAmgo6SUnwyOnBOWDzwDgAM23KOq+E5LUfx8OQS
   BGybCQ+sz2RtCD7BXk5ujKozL5xN/XqiEqb++qK/Hl5rht5t5nRcl2y02
   GtjD3J7su/dTAlxZ0Ewwub+qp3vQb0gVcQMWPkDW6QpOBCki/dSW4PJie
   N96fqQjCYpyo0dCXmDhhaV+PcBo7bxvoX+aVYpOI47gjnDEdaeTcxLT6h
   w==;
X-CSE-ConnectionGUID: ihEDTp5mQ/q5PV/pvtQvuA==
X-CSE-MsgGUID: f5S3ujloT6+fOILlFdf29A==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18762170"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18762170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 08:47:45 -0700
X-CSE-ConnectionGUID: /rP7a0gjSH2yRDoIxWozIw==
X-CSE-MsgGUID: Esbof0l8QMuvXcrCmXCs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="55937201"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 08:47:42 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs2pM-0002M3-2b;
	Wed, 03 Apr 2024 15:47:12 +0000
Date: Wed, 3 Apr 2024 23:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-debug 4/4] arch/x86/coco/core.c:23:8: error: call
 to undeclared function 'get_option'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404032332.b7k80Bz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   90df00c4e488a8b5b6c837995706f3e101d75e9c
commit: 90df00c4e488a8b5b6c837995706f3e101d75e9c [4/4] x86/tdx: Add option to override prot values
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240403/202404032332.b7k80Bz6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404032332.b7k80Bz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404032332.b7k80Bz6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/coco/core.c:23:8: error: call to undeclared function 'get_option'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 |        get_option(&arg, &x86_cc_attr_override);
         |        ^
   1 error generated.


vim +/get_option +23 arch/x86/coco/core.c

    20	
    21	static int __init x86_cc_attr_override_setup(char *arg)
    22	{
  > 23	       get_option(&arg, &x86_cc_attr_override);
    24	
    25	       return 1;
    26	}
    27	__setup("x86_cc_attr_override=", x86_cc_attr_override_setup);
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

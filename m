Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82228468C;
	Tue,  6 May 2025 05:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746508732; cv=none; b=jOkqFZxenDJDD1PdA/L2jNCRgin3ya1XvtPKRWomszminyM4B8UpMANvMUnS+ur4laqC9N65YFvs2R4YTILkxB/I2XB4dZh8sP4+nOkZbHzjbKuy0zmfBXwHWvX7A9CHKx0kn3yNGpshWELJRM8ePIojs22cRAD6zWTG0cB7LPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746508732; c=relaxed/simple;
	bh=YgHtUzb1FxVMgXs4pOIXjwVScOdLnTM38u3lhECdzUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OoRqXnxuSx/ikMouE5Kcvbc2F/BKXHxBdUnsa//qwjBmexoDdUdpo874HStE9zznG2zejSiP7wu+G9f2oyzPA8J0Rzc/dZmhbv3OUrFIlQM/4enSrv494ewFVvckopC5grBJqXHvObP2AW/iRctAiNx9A+4GbBQOEAU8Mj6XvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lle5dwVq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lle5dwVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746508730; x=1778044730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YgHtUzb1FxVMgXs4pOIXjwVScOdLnTM38u3lhECdzUU=;
  b=lle5dwVqKVlg8BKKxIsP4f1J7h2f98JU/Sgaez1mp6CbWfWRBPornl+J
   8pWS0Flq8/OW3OnEjcpMB0Pz/dmQtgt5fzfj1Tgk2axtIPT4ntYkDXyp+
   NS2lAJ7ejCcLDHuLR9FSjNMwO5hWToU5H5+EeTI/W1ruj5ssQ/t4QNWZy
   /K3bfzk4GZC4Z2ZwNx9U+gfySq7ygjZZPVtST/aDunB2ORQisp9vizZmP
   tVaRid+3ZfhmLx4UjBUnObOVU2PloGLe+pckwayVPt0rGobtz5WFWDjpa
   11kSvkJG4WCjBbQwvWbRaBD8TODzHAuLHTW5XPBiwY+LZbZ2vOQLBEODi
   A==;
X-CSE-ConnectionGUID: R+h2W/jeRwi1ic6MpH0GyA==
X-CSE-MsgGUID: Qy+AFuG5QLSh7MzUMUS+3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59144918"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="59144918"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 22:18:48 -0700
X-CSE-ConnectionGUID: 2/0IaLntT9S2eRt5VWQ/gQ==
X-CSE-MsgGUID: pk3xRjWwTKKaJU9jL0QB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135460041"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2025 22:18:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCAhY-0006Fv-2f;
	Tue, 06 May 2025 05:18:44 +0000
Date: Tue, 6 May 2025 13:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next-test 32/41]
 arch/powerpc/platforms/pseries/htmdump.c:138:6: error: call to undeclared
 function 'is_kvm_guest'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505061324.elUl4njU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   5a821e2d69e26b51b7f3740b6b0c3462b8cacaff
commit: 6e204ef3b73e41e46784fdd298c3d81caed84873 [32/41] powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm operations
config: powerpc64-randconfig-003-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061324.elUl4njU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061324.elUl4njU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061324.elUl4njU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/htmdump.c:138:6: error: call to undeclared function 'is_kvm_guest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         if (is_kvm_guest()) {
         |             ^
   1 error generated.


vim +/is_kvm_guest +138 arch/powerpc/platforms/pseries/htmdump.c

   134	
   135	static int __init htmdump_init(void)
   136	{
   137		/* Disable on kvm guest */
 > 138		if (is_kvm_guest()) {
   139			pr_info("htmdump not supported inside KVM guest\n");
   140			return -EOPNOTSUPP;
   141		}
   142	
   143		if (htmdump_init_debugfs())
   144			return -ENOMEM;
   145	
   146		return 0;
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

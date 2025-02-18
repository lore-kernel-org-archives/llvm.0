Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFFF79E1;
	Tue, 18 Feb 2025 00:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739839016; cv=none; b=mL6WdFV+3CDGPvhSOepfmUIQswsGUUxmdrYaZVYoydUF6eN1Cuu4rh6yHGb3/M18gmMo8fBkDbiTWONRyOaO3czIId+DmUN7VYl+3iT5o69RPUMDowBC6FiFeOaUY9gyykiCnc/xWOAWlGC4qeSrgIbasY1XVfelHCjYygCgURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739839016; c=relaxed/simple;
	bh=ed7gJMoc14ksYAGv2CHJDR2c884AJd5/WFnNACNTC5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqaN6OE/fFN3kupRHXMCE545jVDOHztSbya0csrvNTDcHZMS6S2x/PE5rF+C5RkfW7mUeKF3zsMsP7iT5wBP7kdVXY8cZbDjniah5pVzwPsibh/SvQZvpus6HDj/AJcUX8sHdbvCc7uwTA1k/18Vyy18EVddnwqqhKsOqLsE/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naHa8UhQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naHa8UhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739839014; x=1771375014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ed7gJMoc14ksYAGv2CHJDR2c884AJd5/WFnNACNTC5c=;
  b=naHa8UhQoWZTm8XvpOZrlUxMJCTsiffz/kZFBOg0YSMFH18l5+IlBi6l
   z1PgJessYSU9rXKT1QT7Mz1M904FjNEU8h1+oi7nGgiJ9M11O2tl/IHFC
   SA+eLSzLHlqjvqlMgmihP8DXmyTw54gr1vpSEPwzUmPOxFJT1wavGX00N
   RnWZqTamFFHeul2K2wTwNWx+q4Nmf2Soy7rInP1Qas0zljlquyf5HxVjv
   uIj9E6XXjK1ehULZOeVCuaHz72BKQ8zm+vCyNRf4d0lp8/luxpRjuV00M
   1fPuokiQ20kE/np14Hj9lkhr+Mc7IUfR1Jrhcy6erTqUwH5C/NonoFhNU
   g==;
X-CSE-ConnectionGUID: ADNOypeNQSSbyomLbQnMZA==
X-CSE-MsgGUID: jQlYJ/3dTt2LHVgVuPMCUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="57925318"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="57925318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:36:53 -0800
X-CSE-ConnectionGUID: P6DV/xevTB2TVmpTMdoD6Q==
X-CSE-MsgGUID: 2AgFVpSOQPqdrWlflKexMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114221992"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2025 16:36:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkBbV-001DjE-1d;
	Tue, 18 Feb 2025 00:36:49 +0000
Date: Tue, 18 Feb 2025 08:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:merge-test 4/12] arch/powerpc/kernel/btext.o: warning:
 objtool: btext_map+0x14: unannotated intra-function call
Message-ID: <202502180818.XnFdv8I8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux merge-test
head:   542660f0783c3796c7ada3cb62211a3d2ac5e0ed
commit: a727152a90f22d2410b708c56d4152a500c99730 [4/12] powerpc/static_call: Implement inline static calls
config: powerpc-randconfig-003-20250218 (https://download.01.org/0day-ci/archive/20250218/202502180818.XnFdv8I8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180818.XnFdv8I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180818.XnFdv8I8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/btext.o: warning: objtool: btext_map+0x14: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

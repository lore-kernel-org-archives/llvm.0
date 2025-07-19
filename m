Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079072629C;
	Sat, 19 Jul 2025 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752925872; cv=none; b=ILboz37qAk6oCh2UAlaqaUiUSQzaslN52mqFGGw6Y4DDmw4Xz+m493Js+ZS91cHKHefad9vgh6kS1Rspysh2LFir3wDAE63fNIE2vn3pKRKQefAOiu7Hf+3iJks5mH5o3l8AcZ89vqtXwMVHPNvBzOQWks5ci68HJFdDsTYM5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752925872; c=relaxed/simple;
	bh=8k3hJfjWIw3JJXtIwJDQtU/Hy3fgSMhUAZxEqw/tfV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qa+xsV4nZwBhf29RBJ1KXxGlvOZISHDiwf7wilnCiEedzSSBs/kjXRE+wJPRxjGKN4fAPFVsnlSbWz7acxi5F/umxEio2i3G8eKRETJH08FhCTuEy18aI9DW8jrmwsX7U+mUpULr/j1juD5eWWeJ5TxmcwZiYTo8neBnFTx86lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1MkcU+p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1MkcU+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752925869; x=1784461869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8k3hJfjWIw3JJXtIwJDQtU/Hy3fgSMhUAZxEqw/tfV8=;
  b=Z1MkcU+pR/XVn8rvl9glVk+WFBQ5EFpTNDcBfhRYpc/PzAGl5Bde8hpr
   LO1NNrNB2Lp6yDRa1YcnLQPMesGmlcfCw4CWk3U/Uv/RqhEte43SNPGlP
   fv/l7YUEfonM5PL2G9PSsZeMNVxHnBAy8MsctAIQTXx99bf32N8yENW9F
   kmy6/Uhj8AsTxYEBIj6CrwpEqth36Y0IT0uBCye2B/dbxeX3ATDqhbtPq
   VZ7Y0obSLx+hjW1zmaUNL/obeR2tjbMjvyf84wq9RpkpAGvwOTaSwep+0
   Qu9Tl7IDUcFOmH8SblYQZ+24UUl/5SJyq1Q/0hwSuHtJKpZpcVBIPZVFT
   g==;
X-CSE-ConnectionGUID: NFmGqgeaQvS6yQV6x4jT8A==
X-CSE-MsgGUID: 4z6OKMFOQrG8Y/LUAN68UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55351641"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="55351641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 04:51:08 -0700
X-CSE-ConnectionGUID: YEOv4+r0QeKrcNvXLvYtqQ==
X-CSE-MsgGUID: lx9uFZkvQs6SfztQZsyQqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="189387255"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2025 04:51:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud65p-000FTT-19;
	Sat, 19 Jul 2025 11:51:05 +0000
Date: Sat, 19 Jul 2025 19:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.16-rc5 122/131]
 mm/memory_hotplug.c:221:6: error: redefinition of 'lockdep_assert_mems_held'
Message-ID: <202507191942.RK85Fqbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.16-rc5
head:   8c0e6855f422b15a5bfce352b703c51e69454d43
commit: 44b26ef1f0535659d2803b1118246ffb9a221c24 [122/131] mm,memory_hotplug: Add lockdep assertion helper
config: arm64-randconfig-002-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191942.RK85Fqbw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191942.RK85Fqbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191942.RK85Fqbw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory_hotplug.c:221:6: error: redefinition of 'lockdep_assert_mems_held'
     221 | void lockdep_assert_mems_held(void)
         |      ^
   include/linux/memory_hotplug.h:339:20: note: previous definition is here
     339 | static inline void lockdep_assert_mems_held(void) { }
         |                    ^
   1 error generated.


vim +/lockdep_assert_mems_held +221 mm/memory_hotplug.c

   220	
 > 221	void lockdep_assert_mems_held(void)
   222	{
   223		/* See lockdep_assert_cpus_held() */
   224		if (system_state < SYSTEM_RUNNING)
   225	                return;
   226	
   227		percpu_rwsem_assert_held(&mem_hotplug_lock);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

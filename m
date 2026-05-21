Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29C3DD532;
	Thu, 21 May 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370832; cv=none; b=LiPzCD9gYpLTIy2Mu/yfu+2OhnST15ZFR3YnjL5ygq/yhlp3O0Zv/Fi9Wz87D0KdcwopCKl7xQ0nmy4ar7ybMJkNEB/htvCkuQ9idOO4b1IftmFDoFoBY5/9bnfnyPpGzy0l3JOaxuF0kWc7sF1MT5vmBMdXGnn46nyVU/4u0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370832; c=relaxed/simple;
	bh=4b3VjQ2iyrt1GIGbeWv4CSwwlEN5+9VS1gnHI7YmBqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qScTh2K9yJReiwZJXr03Ow51Iwdi2yMPiwADwfyD3LEfeY19sLg4F+RN/EhGipDPPOoogISsiq+/3UTUR5A02IhANFc02KKXpak0aFO3duq+PZRKPXODh70RyiGBV/wVMRTrmdEH/r/C1D0JRcNnnD5vhfAylqc3p/Iy6mEaOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAuVAlAs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAuVAlAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779370830; x=1810906830;
  h=date:from:to:cc:subject:message-id;
  bh=4b3VjQ2iyrt1GIGbeWv4CSwwlEN5+9VS1gnHI7YmBqw=;
  b=HAuVAlAssxKOF7DhzBzYWwl1ktCczO7YQaq9a7PPP38xdroAfUXgpFsZ
   Krhypr+naBnZSuuwVZ5bKMvJBjTVKWc24w+sFKtv8KZbTgD2bFxWRR8iI
   ChwIs74008eZA2IaBg05r8nWlRSR4BlwBY8ErSZBd2FNBkA0aJmnT37d7
   0Qrdv/xusw5/L1UQfiCqyNUQ/vgtK1lmNRgbUuidADfukMyfiBRoK8zCQ
   nPInJOPBGLfHdiWschH3aIbMUfN/+LY1J+VuYCXkEJAL7rjO+1HnRFzLx
   ebQq2/02mj39SAxyCneiql70MPwsIhpixZ/Kjcnen8SHL+/Ad/78Uf9Vj
   w==;
X-CSE-ConnectionGUID: uOSNjZehSvybLvasLTw2tg==
X-CSE-MsgGUID: Euu83UT9Tz6MZ38eQqIf4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102962900"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="102962900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:40:30 -0700
X-CSE-ConnectionGUID: 8VTgN04uQiithsIpK27dIg==
X-CSE-MsgGUID: 5i/8IW3HTBaW7vvnqQ3bPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244519893"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 06:40:29 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3dS-000000000Mb-0QtZ;
	Thu, 21 May 2026 13:40:26 +0000
Date: Thu, 21 May 2026 21:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 52/1130]
 drivers/counter/counter-sysfs.c:711:34: warning: format specifies type
 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long'
Message-ID: <202605212105.bKD3IeWI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b83eb705701d2a1b492af6ef6e8fa2c403b55cef [52/1130] cheri: Apply automatic FixCapFormat clang-tidy changes
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605212105.bKD3IeWI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212105.bKD3IeWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212105.bKD3IeWI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/counter/counter-sysfs.c:711:34: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     711 |         return sysfs_emit(buf, "%zu\n", (unsigned long)id);
         |                                 ~~~     ^~~~~~~~~~~~~~~~~
         |                                 %lu
   1 warning generated.


vim +711 drivers/counter/counter-sysfs.c

   705	
   706	static ssize_t counter_comp_id_show(struct device *dev,
   707					    struct device_attribute *attr, char *buf)
   708	{
   709		const uintptr_t id = (uintptr_t)to_counter_attribute(attr)->comp.priv;
   710	
 > 711		return sysfs_emit(buf, "%zu\n", (unsigned long)id);
   712	}
   713	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

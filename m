Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125F2C3276;
	Sat,  8 Nov 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762571404; cv=none; b=MK5DUwqtmUQg25sa0Nmap3mVmbLMJ6rpSx6/bGMZAP6uqEf4OdJSMMh29Qm8nSyRa3XGpM03IadpQTbAFrapZDpmRqdI5fbBX63b94gB31MRGoLiVDghZ5zV594oxZiO78BkVeX6X87/zu0YjSC3bkJDLGNbA426IBjwitxQZbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762571404; c=relaxed/simple;
	bh=agZZYiY16HKfjSmAm4U4jVCROVDxK1HwhDMg2OprqN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLECtuKuynl1oi6S8bpaAbkx12DNtmtAxVZXGwiRfxIk6jrvGJDN4Q8wLLEHvv0T7heYzvy0xVRJmu/c22gB3xW3JhVFYr5bEgxh4iA9A+/dTn7xfehHcVZwx749RPXAixc+1YcI37Nln48jik1oKsKs25JzeH+VbzVZE+5Q0Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPk0XiKy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPk0XiKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762571402; x=1794107402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agZZYiY16HKfjSmAm4U4jVCROVDxK1HwhDMg2OprqN4=;
  b=MPk0XiKyhPHz1+Uw0Wpq6a65zeby6qYk/Ol36PSU3nNqeGxHDi73DiyZ
   tDYkChV8EsW41Wk4WsI1li45smUyXF+qdJ+oLAcRPKrTIkJO7GJyfh6Ij
   VJC4fHQcVQzeOMrj6Ltw6wIU/VcUJ0QDIios69ZL3AUMj9VXNDyHE+yPy
   SiFUjo5F6PB1fpGUf7fspkaBmAKcXom5oVcll+wEpEERFw9wsn3LmruMg
   yk2MDg29elAJ7aNMeqAyPXe8HeG1qVSxs4MAAxXYAGd94hy43KfXmBwuU
   oceuk5y/b0Awf21ameTPduhhJOjyOKV/VnwfkKL+eJvkjUVESMJeAnnkO
   g==;
X-CSE-ConnectionGUID: SD0hK9UBTOym84IG4CLpBw==
X-CSE-MsgGUID: rSjx0ibdQeSywgNWmQqpow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64628032"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64628032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 19:10:01 -0800
X-CSE-ConnectionGUID: Xsph2q3bRqutnhcH7e0mYg==
X-CSE-MsgGUID: 1qGAYL/ETxK8FXWB9vj52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="225452722"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2025 19:10:01 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHZKw-0000eZ-22;
	Sat, 08 Nov 2025 03:09:58 +0000
Date: Sat, 8 Nov 2025 11:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 4/8] arch/x86/kernel/uprobes.c:1457:36:
 warning: unused variable 'sub_xol_ops'
Message-ID: <202511081046.gtsGmuvJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: 7c946ecd37c7b9b7f90d3f722aac2f3a85486763 [4/8] emulate sub
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251108/202511081046.gtsGmuvJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081046.gtsGmuvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081046.gtsGmuvJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1453:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1453 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1457:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1457 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +/sub_xol_ops +1457 arch/x86/kernel/uprobes.c

  1456	
> 1457	static const struct uprobe_xol_ops sub_xol_ops = {
  1458		.emulate  = sub_emulate_op,
  1459	};
  1460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

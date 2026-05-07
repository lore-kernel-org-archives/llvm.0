Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F63B47C1;
	Thu,  7 May 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166436; cv=none; b=HqzC3dTLM148OBomm2E3PdJLPN+ClKkJXcflRCNFgCmWU6myXXwtLK4FoCaYvYJwR7rZB5D9qm1c45Zrsqnk/mpegYBe1pwYyXRQtd97I054lnoOc9AiQIqHHFz2iKu7CHTjSAz18sOKZM0MuDj4jzq9c/oZIXLm3/nQ4zoK1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166436; c=relaxed/simple;
	bh=hGepQNbqTldinQRuCbw7/OA/WkJ9VSSXE7Dh4qyyyXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ucbzgXgYp1EqQ7d/O7uy7haGDp5cB1/4HYnlfI289E9yyiUEQfjO4qhUDt/yQYl3N2Tk76J20jEzwGfcAiKKPvkLcfuz3NEo21GGBmewE7ww5MrzJnGytAbPXRaZxcnwb5zbRa71bzXLDPM6q31ms/Dbi2P8Ms/owkBinUNW4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNl5z8En; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNl5z8En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778166435; x=1809702435;
  h=date:from:to:cc:subject:message-id;
  bh=hGepQNbqTldinQRuCbw7/OA/WkJ9VSSXE7Dh4qyyyXs=;
  b=SNl5z8EnybirGxl8nWQPvvkjtrk2a8qCrn0OQ/SiAe8D9g1unHzJcnGg
   RtyfQoNzZcSqz6vo3YVMJwH+WaN6za4zov1rbZu48qjcSqpfyBEJcYCuh
   c+Jxs+OYM8EBwF0ww8trJM3mY1pTS/ubeqUuNTrudR+Q873yzdGa054nn
   +WPT5HAALPRvBjk59VH+LUqnh3xKsJ/sqhTCUi0NINuWymcAL6oseTx+d
   wKX5/XCCduBKLuInQVrYUIbqa1WOwWfpv9Y7C87TubmHNuvUGpCFL9JKk
   4cTDqAVuMDp48q1cjPDdmc7NBJtQxw31FR4Z1hWgS9exeaEsiF1ngjYI4
   A==;
X-CSE-ConnectionGUID: FhT7/AV0TD+oLxZWvLHiEg==
X-CSE-MsgGUID: nlBjxZdNQQG3yz8KmEpKMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78839326"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78839326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 08:07:12 -0700
X-CSE-ConnectionGUID: mMY7XSoiS/+j3ONurmII6w==
X-CSE-MsgGUID: agBnsJDRRfWnvh3Vno5cOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236599110"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2026 08:07:11 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL0Jg-000000000Br-1u8s;
	Thu, 07 May 2026 15:07:08 +0000
Date: Thu, 07 May 2026 23:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [frederic-dynticks:timers/core-v4 6/15]
 arch/s390/kernel/vtime.c:247:15: error: too few arguments to function call,
 single argument 'tsk' was not specified
Message-ID: <202605072254.m5zoMdRY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: 63c65224d76c60da9e25ae962223d2fd5565c45e [6/15] s390/time: Prepare to stop elapsing in dynticks-idle
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605072254.m5zoMdRY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072254.m5zoMdRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072254.m5zoMdRY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/vtime.c:247:15: error: too few arguments to function call, single argument 'tsk' was not specified
     247 |                 vtime_flush();
         |                 ~~~~~~~~~~~ ^
   arch/s390/kernel/vtime.c:203:6: note: 'vtime_flush' declared here
     203 | void vtime_flush(struct task_struct *tsk)
         |      ^           ~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:260:15: error: too few arguments to function call, single argument 'tsk' was not specified
     260 |                 vtime_flush();
         |                 ~~~~~~~~~~~ ^
   arch/s390/kernel/vtime.c:203:6: note: 'vtime_flush' declared here
     203 | void vtime_flush(struct task_struct *tsk)
         |      ^           ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/tsk +247 arch/s390/kernel/vtime.c

   241	
   242	void vtime_account_softirq(struct task_struct *tsk)
   243	{
   244		if (!__this_cpu_read(s390_idle.idle_dyntick))
   245			get_lowcore()->softirq_timer += vtime_delta();
   246		else
 > 247			vtime_flush();
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

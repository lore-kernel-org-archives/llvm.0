Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6630BF70;
	Thu, 21 May 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372816; cv=none; b=rnsQpcrQNOSaOMzkyrXZ29sBmzT1saQ4WHXY9uJPKWr/kiz71R9yiARA6niKRPYspH5t5FL+CzY4lt4jC+97NyXRbh92VF/VUH1k8pLaW0ik0DvrRxQUno12pMSIh4xUMFlYLCuUg2ppkTvjWA2OkmuwYScVn0DYrmnHBPH2LOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372816; c=relaxed/simple;
	bh=/M7HGzDXz2Q7eZqHF3KETFjtnLxTENLRkTiAoCjkR38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMjH4voZ59O7/kEW0fKYS4n0X5ZIcu4TK5nmbiZrgfEGV+NSptUhkMKjsTbrpEvbLlTGhTwMTg5ImpJaYVQAdDxWnGzCxSr/kmS/9J4lN20EOztYVTv2uQ5l/zcVqAHMl5ch9WQcg902jXp5G9XlBCn4LSps7kVVPAKXMMmx98s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNu4FI57; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNu4FI57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779372814; x=1810908814;
  h=date:from:to:cc:subject:message-id;
  bh=/M7HGzDXz2Q7eZqHF3KETFjtnLxTENLRkTiAoCjkR38=;
  b=bNu4FI57A0Ek4FFuLNr9su42Jp/+v1LpxQ8Sfpg6dPHuCwdSy3gtKLXB
   F4uN54b3YnPFwjAdhsFolpXVXjIq1zr+DnmrYqNfGst03E+B0SY624Tok
   e17tf1Oh0CZdOjc6aturgzdBTLTbdRXZMCbyy8LpWWRbqpERotQJFvL3q
   n09dpxqSFQrYEIF34oJ80j0XiNBKU63xPSVh+Dm2GnsVIq200Z22o8aX3
   oEbAki5Nr/zjoN9If2D4gYeKxZx89vjG/946oW6k+OY6O4OFAyGorGS57
   td9tRcgmheqHfgk7V6xmZGxSTD6vmMCMy2ZuNY358n9gBuaJ+JlIMHH2J
   w==;
X-CSE-ConnectionGUID: b5/iGnMUSOOHvD33/fhljQ==
X-CSE-MsgGUID: 3GNRZU5DRk21DnZbYykLuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91762025"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91762025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:13:34 -0700
X-CSE-ConnectionGUID: M1VKzgqJSrWmJ+BE/D+wJw==
X-CSE-MsgGUID: 9eWEUwAQSCKyMLVY8hRAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="278647360"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2026 07:13:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ49S-000000000PL-1HaX;
	Thu, 21 May 2026 14:13:30 +0000
Date: Thu, 21 May 2026 22:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 264/1130]
 fs/proc/base.c:1086:41: error: no member named 'auxv_size' in 'struct
 linux_binfmt'
Message-ID: <202605212250.gXFGh0xY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b8a1660e16020a9bce7c514779971652694d7eb3 [264/1130] [CHERRY-PICK] fs/binfmt_elf: Fix auxv parsing for compat ELF binaries in /proc/pid/auxv
config: x86_64-randconfig-005-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212250.gXFGh0xY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212250.gXFGh0xY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212250.gXFGh0xY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/base.c:1086:41: error: no member named 'auxv_size' in 'struct linux_binfmt'
    1086 |         if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
         |                                    ~~~~~~~~~~  ^
   fs/proc/base.c:1089:24: error: no member named 'auxv_size' in 'struct linux_binfmt'
    1089 |                                        mm->binfmt->auxv_size(mm));
         |                                        ~~~~~~~~~~  ^
   2 errors generated.


vim +1086 fs/proc/base.c

  1080	
  1081	static ssize_t auxv_read(struct file *file, char __user *buf,
  1082				size_t count, loff_t *ppos)
  1083	{
  1084		struct mm_struct *mm = file->private_data;
  1085	
> 1086		if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
  1087			return 0;
  1088		return simple_read_from_buffer(buf, count, ppos, mm->saved_auxv,
  1089					       mm->binfmt->auxv_size(mm));
  1090	}
  1091	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

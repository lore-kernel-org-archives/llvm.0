Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621CB1E8332;
	Mon, 30 Mar 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839143; cv=none; b=dCyuWEQkFu28yMR1nQdVCF4cy5ui7+DTIGQPvS2X1IO6msEUTzoXZ1vc80oixMU+QXS2vDZRUq05NBlNBQrDqRN/9C1Oy6clmuhxR83f9Eo/1g2MxkQZiFzniBl5d0m/DkD5V+3hjVOPKVLcfn6UVGWf+xxbG4LV1pB8Eq5oFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839143; c=relaxed/simple;
	bh=0b+p6It/xfuzuBhuNgIMDfQf6N5mmJ0krz6JQx4qrwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJvSbEG05Ld7HDkArQSI2tLw4e2F/70g0hsGTZae5hiGc1f5njxglFaHsl45n8BdiS0/P6fHXJNSHREYPvqj5K0UNi7Mw63mceKdxWVUntmk4pYII1GUnkM+hvRDd76I4luth6m7b93FkwZzBd6hiTWZ2OzvQhHlQRnQdLIV5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AON1YySf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AON1YySf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774839141; x=1806375141;
  h=date:from:to:cc:subject:message-id;
  bh=0b+p6It/xfuzuBhuNgIMDfQf6N5mmJ0krz6JQx4qrwI=;
  b=AON1YySfNkWtlPXoV6UjYtF56ZL0kpL3B6aSjbIUcfMYlBM3MRLQvWBO
   vUQQlPNtEnGIGlKJl9Vvy8KozqyCJxsYhI+8Q+XGcqVkGKKOmk6FSjtD/
   eAqcW5B2n2bDKyd5la28Y3YE3xoVMtLt8ID8gZLW8KWtjsY7ll7zcpomv
   NX5TW19C1Em7CKHGiVZI6acJEimy42CCc1y1dmD3Wbjp+oFm1KpmIDvmO
   a2w8NG/pUNGn0mXYhcgrTp9bpCUw+XDsJ5BrQBvj5KdqbWZ/lum0ICyZS
   M2G894Duo0PkcGnR+8AGwp+6AytoI0akEGlZBswqbEkoFU05BvscQ7FBq
   Q==;
X-CSE-ConnectionGUID: q9oPB2SyS/2T4PW3C+reOA==
X-CSE-MsgGUID: GEoC46BhQG+Y+pffMfWTmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75795815"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75795815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 19:52:21 -0700
X-CSE-ConnectionGUID: s/RwPV1PTMS1GV1NWdA2lw==
X-CSE-MsgGUID: nCFehX46TkS03kD9bvvtyg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Mar 2026 19:52:19 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w72jg-000000000a9-2r3J;
	Mon, 30 Mar 2026 02:52:16 +0000
Date: Mon, 30 Mar 2026 10:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: kernel/kprobes.c:520:28: warning: variable
 'kprobe_optimizer_task' set but not used
Message-ID: <202603301017.4Sho3F0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 73c12f209462d1712c5f55f3021a1b65b2e084c3 kprobes: Use dedicated kthread for kprobe optimizer
date:   8 weeks ago
config: powerpc64-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301017.4Sho3F0a-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301017.4Sho3F0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301017.4Sho3F0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kprobes.c:58:12: warning: variable 'kprobes_initialized' set but not used [-Wunused-but-set-global]
      58 | static int kprobes_initialized;
         |            ^
>> kernel/kprobes.c:520:28: warning: variable 'kprobe_optimizer_task' set but not used [-Wunused-but-set-global]
     520 | static struct task_struct *kprobe_optimizer_task;
         |                            ^
   2 warnings generated.


vim +/kprobe_optimizer_task +520 kernel/kprobes.c

   518	
   519	static void optimize_kprobe(struct kprobe *p);
 > 520	static struct task_struct *kprobe_optimizer_task;
   521	static wait_queue_head_t kprobe_optimizer_wait;
   522	static atomic_t optimizer_state;
   523	enum {
   524		OPTIMIZER_ST_IDLE = 0,
   525		OPTIMIZER_ST_KICKED = 1,
   526		OPTIMIZER_ST_FLUSHING = 2,
   527	};
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

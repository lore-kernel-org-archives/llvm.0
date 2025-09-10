Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061119AD89;
	Wed, 10 Sep 2025 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757548102; cv=none; b=YEGW6jUBozeFybnOKPshuS6n5hd8pnzND2wCcLVtHt3+7wnrHxcrDO1JU/yOD1kyVJU/n2ukMllvDCHGqE0keKGiQoqVXcp/2DgjOAelCwfCiJuxEf0v3ZHKg69IBa0nbYbyJp4vAf9xGcTiBhOCCzc7lCkE17e5c4Yd/LDcxkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757548102; c=relaxed/simple;
	bh=MvDo3YIvaCSJSKr3uXlosCV5OQtGOXuqq1aqb0bt5a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtsCXlJWY5ctJVtAK4xIsQ9RuhircWfLmTTl1IumYfcVFi2id9b4esUDo7/LcCFzVoIg9WM0g7fwwfsF4km0N9VdLOhUMbZA9yL2w52X7nioSQbPDlaNFBne1007jSIk2ThAWLdZHFjgXk6Cue8vUxzuhBETEmqIpnhrVW3TzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuLzqM3K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuLzqM3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757548100; x=1789084100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MvDo3YIvaCSJSKr3uXlosCV5OQtGOXuqq1aqb0bt5a0=;
  b=VuLzqM3KCP03jQm73YDvZOcIvbMrJf5TfeAXgHcZx61YpQhp8tRC6CIU
   L0V4oLrW4YqIMJFmNRkqmEz2Z3AmrzD6Rhq/uRpO+7aCGtul4WmVa1ZpL
   JiQBr3EpkDv3FzstBngIiyoS907Gozkw2B/v3qWr0jA9BETbY0ui8CVqt
   0vSQj3h7j5wCoLGUARzwxSRyqfFsM9N4du+ZQzOWerp8uDMRH3GQRSMoP
   ntxRnkSdDllPdMsFDI1a+8T8F58yspuFGQWi2DTOB6GABQEwU0R0SMeuB
   GgwSJVFsA4bNNHBkkW8ldGscRcuXotmxU0rX3H7tX8i/C4aNMvHnbdzny
   Q==;
X-CSE-ConnectionGUID: P/twDv8VTGq7nNEQ/rcROg==
X-CSE-MsgGUID: V5zZxu8lSbWObGVpPZuwEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59096115"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="59096115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:48:19 -0700
X-CSE-ConnectionGUID: T0PzXY1XTQ2e/3Q4LRjpGQ==
X-CSE-MsgGUID: O3lnNBiNRXew7hdFczKWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173602473"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 16:48:18 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwUXv-0006Mr-1I;
	Wed, 10 Sep 2025 23:48:15 +0000
Date: Thu, 11 Sep 2025 07:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v8r2 5/24] mm/slub.c:3922:27: error: a
 function declaration without a prototype is deprecated in all versions of C
Message-ID: <202509110717.ADqU4sTQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v8r2
head:   94fb419c7524b65e51b4c91b02ac8fb62bce25fc
commit: 18f47402bb9c248b6691dd8a531b2ea2c2ae5281 [5/24] slab: add sheaf support for batching kfree_rcu() operations
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250911/202509110717.ADqU4sTQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110717.ADqU4sTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110717.ADqU4sTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:3922:27: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    3922 | void flush_all_rcu_sheaves()
         |                           ^
         |                            void
   1 error generated.


vim +3922 mm/slub.c

  3919	
  3920	
  3921	/* needed for kvfree_rcu_barrier() */
> 3922	void flush_all_rcu_sheaves()
  3923	{
  3924		struct slub_percpu_sheaves *pcs;
  3925		struct slub_flush_work *sfw;
  3926		struct kmem_cache *s;
  3927		bool flushed = false;
  3928		unsigned int cpu;
  3929	
  3930		cpus_read_lock();
  3931		mutex_lock(&slab_mutex);
  3932	
  3933		list_for_each_entry(s, &slab_caches, list) {
  3934			if (!s->cpu_sheaves)
  3935				continue;
  3936	
  3937			mutex_lock(&flush_lock);
  3938	
  3939			for_each_online_cpu(cpu) {
  3940				sfw = &per_cpu(slub_flush, cpu);
  3941				pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
  3942	
  3943				if (!pcs->rcu_free || !pcs->rcu_free->size) {
  3944					sfw->skip = true;
  3945					continue;
  3946				}
  3947	
  3948				INIT_WORK(&sfw->work, flush_rcu_sheaf);
  3949				sfw->skip = false;
  3950				sfw->s = s;
  3951				queue_work_on(cpu, flushwq, &sfw->work);
  3952				flushed = true;
  3953			}
  3954	
  3955			for_each_online_cpu(cpu) {
  3956				sfw = &per_cpu(slub_flush, cpu);
  3957				if (sfw->skip)
  3958					continue;
  3959				flush_work(&sfw->work);
  3960			}
  3961	
  3962			mutex_unlock(&flush_lock);
  3963		}
  3964	
  3965		mutex_unlock(&slab_mutex);
  3966		cpus_read_unlock();
  3967	
  3968		if (flushed)
  3969			rcu_barrier();
  3970	}
  3971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

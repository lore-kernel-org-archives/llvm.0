Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C951487ED;
	Wed, 12 Mar 2025 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741746170; cv=none; b=R0z/dASV8xWVoUvoy7/DHleFGLU5TVFDDZgKCP4oC4ycUd2V5+fKujVDmAidQlZlcxwO3kMS0YHrSHKDrPEXYCB+4tR8QO7VGlhJHR9Qz+XiQhfCR7/cWK/SgJZKQa7pceXHbQOHdgAVG30tugw4m2vTd/+CROCsCNzj0KE2toc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741746170; c=relaxed/simple;
	bh=njEpVr6lkvNzm3bboWuqUb5YOQ7Bu3DrZ9NOslttHqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsrx6vHpd51KbkkwNIUQZfRQ5wMyer52LjkkmJSJsZyVYRtjQ7wdJITS1Xyf7Lat9UC5QUdox0tOBncPjq9w6Vpgr2joxZM188JwI210kmjbF2BSRH2Jty93Mfmr/Ej8bP+pz+qJHdp/9Rb3hEjeBqCYfS0M73vEMlmufdGFEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0wfYspO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0wfYspO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741746167; x=1773282167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njEpVr6lkvNzm3bboWuqUb5YOQ7Bu3DrZ9NOslttHqc=;
  b=I0wfYspOvWV1nIiOovFZaMTrYj+47nap2KIg4FidP31N8raCJ2ALI0U4
   5kqhlELQtnhnEjYBzoTYmYiw9+DnWEEhgB5YdlGMLwLYKVNcJqTQZEoHw
   UKlME3yHdUQKlmiHyHhGZKf1T5JKQ/gJzq7T7KP1tXF4vygXzWEe+ZfM8
   7K6uj5uGwTRTgeu4v6NoFL713WtlXLWcjqvD3I9mah3REBPabUqkR58hn
   4MFp7NC1UcwwupIkvWyCsiXQFEBSANRDa/PbMLAZs7m17z9sNgGBqFYdZ
   UhhAPqQ9C2GZqf9SMjOcfMOsqi3dW20qYhyl9OCLvtP1Wj0FOdUKd6d8E
   g==;
X-CSE-ConnectionGUID: zyfkENU4T+GFQdy1ZacNcQ==
X-CSE-MsgGUID: ww2olvqIRKChhc7Chn48Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53801767"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="53801767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:22:44 -0700
X-CSE-ConnectionGUID: UfyotK71RQSq/6RsPz2IlA==
X-CSE-MsgGUID: GsHMEQihT7Km9yawOUbfbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125683591"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2025 19:22:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsBk1-000838-0Z;
	Wed, 12 Mar 2025 02:22:41 +0000
Date: Wed, 12 Mar 2025 10:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:futex_local_v10 16/21] fork.c:undefined reference
 to `futex_hash_free'
Message-ID: <202503121056.u2KwsVBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v10
head:   1a9133756e6eeef39468a2076cf712331180694b
commit: ccbfa01ed2ba7957ac35cd762f8a26dbf3e1db97 [16/21] futex: Remove superfluous state
config: sh-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121056.u2KwsVBf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121056.u2KwsVBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121056.u2KwsVBf-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/fork.o: in function `mmput':
>> fork.c:(.text+0xe78): undefined reference to `futex_hash_free'
   sh4-linux-ld: kernel/fork.o: in function `copy_process':
>> fork.c:(.text+0x2090): undefined reference to `futex_hash_allocate_default'
   sh4-linux-ld: kernel/futex/core.o: in function `exit_pi_state_list':
   core.c:(.text+0x3d0): undefined reference to `futex_get_private_hash'
>> sh4-linux-ld: core.c:(.text+0x3f8): undefined reference to `futex_hash_put'
   sh4-linux-ld: core.c:(.text+0x4cc): undefined reference to `futex_hash_put'
   sh4-linux-ld: core.c:(.text+0x4d8): undefined reference to `futex_put_private_hash'
   sh4-linux-ld: kernel/futex/pi.o: in function `class_hb_destructor.isra.0':
>> pi.c:(.text+0x24c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/pi.o: in function `futex_lock_pi':
   pi.c:(.text+0xd08): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/pi.o: in function `futex_unlock_pi':
>> pi.c:(.text+0xf80): undefined reference to `futex_hash_get'
   sh4-linux-ld: kernel/futex/requeue.o: in function `requeue_pi_wake_futex':
>> requeue.c:(.text+0x1cc): undefined reference to `futex_hash_get'
   sh4-linux-ld: kernel/futex/requeue.o: in function `class_hb_destructor.isra.0':
>> requeue.c:(.text+0x21c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/requeue.o: in function `futex_wait_requeue_pi':
   requeue.c:(.text+0x98c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/waitwake.o: in function `class_hb_destructor.isra.0':
>> waitwake.c:(.text+0x10c): undefined reference to `futex_hash_put'
   sh4-linux-ld: kernel/futex/waitwake.o: in function `futex_wait_multiple_setup':
   waitwake.c:(.text+0x8b4): undefined reference to `futex_get_private_hash'
   sh4-linux-ld: waitwake.c:(.text+0x8bc): undefined reference to `futex_put_private_hash'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

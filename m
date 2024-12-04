Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9791922F5;
	Wed,  4 Dec 2024 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351097; cv=none; b=DfflIBI01UJ3UDx7WNZ6xLZlVoaLoHhYT/XD54iPjbKYb4Fr9EymvNo8SbcxCYpPeuQYvo0oIidcN2m8hAg/Ewhq+E31L3C7s42rAACynNoClmtVm+fjU9GcRXPs6TrFSuSoRlH0ifrSlTWloyYMBuXBEkQbfDkRIDG7e6iNvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351097; c=relaxed/simple;
	bh=wDCyRjRlNwi0gFjffrrek/qm8c7CiXnouzdY5r6Ca6I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLcD9odjAJFjwmNPj1Z9JIK85YMegtiha8n5dXhCRCyMpp3NLjxS7REaTtY131W5zFLgBPHgA+hzWxqBzaS1act9i2ZdLV8Aw5LvpC+7rKm9bcuxqi9MRFovmsYwCInF95RKWDrY8pf2RkLIXCvJNtrF1LXZG8p8za+EhgJoj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmnyYZpu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmnyYZpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733351095; x=1764887095;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wDCyRjRlNwi0gFjffrrek/qm8c7CiXnouzdY5r6Ca6I=;
  b=EmnyYZpufgwkDcqlDYUMSncjSE6jLN1/tFJgX6BovZzFF2e+s7ia/gt7
   yTr84IDpWYzAq82nkG09/qIgp3xHyzLO1rombl6U9k8KsvpNItNAePMoT
   Xz33KuGalJ0p4VEYB4bAXGB3vxDY6TsvgFaecEN7p0sak5DKg8vPFTI5f
   ewAQ8cS9t/drj/RrAyh1d5wVJ4umOdO24Q2QMZ2Po0lMz2V4+qw78ieXf
   g6gc5YBkdke/xSzuBdRHdcgi0d9sXGUJuqDghpv2tAaA5XuW8p5Cu8uWC
   BjvUWcuPMgoY57oyN0qvRmz3pgL5NOuBKjito1QX8ZIGHlYfTW0xxGKo8
   Q==;
X-CSE-ConnectionGUID: poo7/fygTvWrTCA+mNHGIA==
X-CSE-MsgGUID: 7ICpVhpfT1aAuaeH9OyepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33383048"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33383048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:24:54 -0800
X-CSE-ConnectionGUID: hSIM79c0TW+odudmU09N7Q==
X-CSE-MsgGUID: /PgKl1PHTQiAJuLGvSnSSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94257169"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2024 14:24:53 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIxne-0003YT-2x;
	Wed, 04 Dec 2024 22:24:50 +0000
Date: Thu, 5 Dec 2024 06:24:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: Workaround for ppc build failure
Message-ID: <202412050600.DxKMdqyT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20241204134736.6660-1-dpenkler@gmail.com>
References: <20241204134736.6660-1-dpenkler@gmail.com>
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Workaround-for-ppc-build-failure/20241204-220307
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241204134736.6660-1-dpenkler%40gmail.com
patch subject: [PATCH] staging: gpib: Workaround for ppc build failure
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412050600.DxKMdqyT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050600.DxKMdqyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050600.DxKMdqyT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/gpib/fmh_gpib/fmh_gpib.c:15:
   In file included from drivers/staging/gpib/fmh_gpib/fmh_gpib.h:9:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:162:45: warning: bitwise operation between different enumeration types ('enum fmh_gpib_auxmr_bits' and 'enum aux_reg_i_bits') [-Wenum-enum-conversion]
     162 |                 write_byte(&priv->nec7210_priv, AUX_I_REG | LOCAL_PPOLL_MODE_BIT, AUXMR);
         |                                                 ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +162 drivers/staging/gpib/fmh_gpib/fmh_gpib.c

8e4841a0888c74 Dave Penkler 2024-09-18  156  
8e4841a0888c74 Dave Penkler 2024-09-18  157  static void fmh_gpib_local_parallel_poll_mode(gpib_board_t *board, int local)
8e4841a0888c74 Dave Penkler 2024-09-18  158  {
8e4841a0888c74 Dave Penkler 2024-09-18  159  	struct fmh_priv *priv = board->private_data;
8e4841a0888c74 Dave Penkler 2024-09-18  160  
8e4841a0888c74 Dave Penkler 2024-09-18  161  	if (local) {
8e4841a0888c74 Dave Penkler 2024-09-18 @162  		write_byte(&priv->nec7210_priv, AUX_I_REG | LOCAL_PPOLL_MODE_BIT, AUXMR);
8e4841a0888c74 Dave Penkler 2024-09-18  163  	} else	{
8e4841a0888c74 Dave Penkler 2024-09-18  164  		/* For fmh_gpib_core, remote parallel poll config mode is unaffected by the
8e4841a0888c74 Dave Penkler 2024-09-18  165  		 * state of the disable bit of the parallel poll register (unlike the tnt4882).
8e4841a0888c74 Dave Penkler 2024-09-18  166  		 * So, we don't need to worry about that.
8e4841a0888c74 Dave Penkler 2024-09-18  167  		 */
8e4841a0888c74 Dave Penkler 2024-09-18  168  		write_byte(&priv->nec7210_priv, AUX_I_REG | 0x0, AUXMR);
8e4841a0888c74 Dave Penkler 2024-09-18  169  	}
8e4841a0888c74 Dave Penkler 2024-09-18  170  }
8e4841a0888c74 Dave Penkler 2024-09-18  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

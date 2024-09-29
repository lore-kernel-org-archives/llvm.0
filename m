Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0B13B5A0;
	Sun, 29 Sep 2024 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727599345; cv=none; b=d13T0U5LjoLxmSX6JHibyYjW2gtEuH8h+muxtfVOaIj0XAl6m/wN6rkIaBMueG5wuHozlVEvnqHkP1MEqNu/Uad/dZUu+UTWUWhMJhsNYdNcpWtIsHAJBp3EgzyICj8lX51VAwkgbl9tugfqC042+Uz8rZXNRq1knF1J6d1NV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727599345; c=relaxed/simple;
	bh=EnXPGzt1wO32BCqKlqAZpdkjc58uIzVzYdbYnzJGPYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oyg4C8KUOdJOa8M5Y9iWbvoLhin+POako/4GGk2hAj8+HS2ZrFm7CM964UF6oq7/LuxJ+9H0V4xi5s5Q1ayFxGcr+DeKjZn9iYX4FkYuT70q4QTEpkjOWN1OtfS1GFb4exYTcrxyxrx9ssNCS+oOVEXRLWjVAbt5Fw7ZllzuUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVBzvV/F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVBzvV/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727599343; x=1759135343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EnXPGzt1wO32BCqKlqAZpdkjc58uIzVzYdbYnzJGPYg=;
  b=mVBzvV/FQmI7tOxCxeCP0Va2Z/+tm0Ez8So9dnhpQO2zSCu/i0+YyMG7
   WMCqgsZQ3jUZ9g+SQDinmZcuTn3j1AY97BW+x7AE7EZsLUev2Aw/ZJiZp
   6ik+4+ybHHVB90hrTlCzpBAcczrBAE0zHZkC4xN2nzVRGdpLOsvvDcdrf
   X/DXLuFc2DKna0j0lsP6MlcHkmWvLgvQOUoE1UKQHO0BFTmGgFx7an7Kg
   YCSSVNhojioPhIotUZexTDoRDgr0IbdujIPIV8hYaygFv2U48shx5dlBS
   GCUUh93mfhRWLPPxg/YrTpBXjQfHDANoy43DkdLB/5sYP75aE/Q235YRY
   A==;
X-CSE-ConnectionGUID: WWqhwchvRyynR5MvE9xm8A==
X-CSE-MsgGUID: TGUgVwQATSKHJwYc3cLtaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26648487"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26648487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 01:42:21 -0700
X-CSE-ConnectionGUID: RUgdhPdzTiWElW+DR4qGoA==
X-CSE-MsgGUID: wUVMR3tWQBishDJkvHzqQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72559576"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 01:42:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1supVR-000O6x-2w;
	Sun, 29 Sep 2024 08:42:17 +0000
Date: Sun, 29 Sep 2024 16:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 184/447]
 drivers/platform/x86/intel/intel_plr_tpmi.c:255:1: error: use of undeclared
 identifier 'plr_status_write'
Message-ID: <202409291615.ne7UXp46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2a160886dc6861c50df03e043f2b5e6379fba22a
commit: bbd7be4bb168c74103fdbde67417c40b58b29e4e [184/447] drivers/platform: convert to ->read_iter and ->write_iter
config: x86_64-randconfig-161-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291615.ne7UXp46-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291615.ne7UXp46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291615.ne7UXp46-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 2a160886dc6861c50df03e043f2b5e6379fba22a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/intel_plr_tpmi.c:255:1: error: use of undeclared identifier 'plr_status_write'
     255 | DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
         | ^
   include/linux/seq_file.h:230:12: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write          = __name ## _write,                             \
         |                           ^
   <scratch space>:22:1: note: expanded from here
      22 | plr_status_write
         | ^
   1 error generated.


vim +/plr_status_write +255 drivers/platform/x86/intel/intel_plr_tpmi.c

811f67c51636d4 Tero Kristo 2024-05-27  223  
bbd7be4bb168c7 Jens Axboe  2024-04-04  224  static ssize_t plr_status_write_iter(struct kiocb *iocb, struct iov_iter *from)
811f67c51636d4 Tero Kristo 2024-05-27  225  {
bbd7be4bb168c7 Jens Axboe  2024-04-04  226  	struct seq_file *s = iocb->ki_filp->private_data;
811f67c51636d4 Tero Kristo 2024-05-27  227  	struct tpmi_plr_die *plr_die = s->private;
bbd7be4bb168c7 Jens Axboe  2024-04-04  228  	size_t count = iov_iter_count(from);
811f67c51636d4 Tero Kristo 2024-05-27  229  	bool val;
811f67c51636d4 Tero Kristo 2024-05-27  230  	int ret;
811f67c51636d4 Tero Kristo 2024-05-27  231  
bbd7be4bb168c7 Jens Axboe  2024-04-04  232  	ret = kstrtobool_from_iter(from, count, &val);
811f67c51636d4 Tero Kristo 2024-05-27  233  	if (ret)
811f67c51636d4 Tero Kristo 2024-05-27  234  		return ret;
811f67c51636d4 Tero Kristo 2024-05-27  235  
811f67c51636d4 Tero Kristo 2024-05-27  236  	if (val != 0)
811f67c51636d4 Tero Kristo 2024-05-27  237  		return -EINVAL;
811f67c51636d4 Tero Kristo 2024-05-27  238  
811f67c51636d4 Tero Kristo 2024-05-27  239  	plr_write(0, plr_die, PLR_DIE_LEVEL);
811f67c51636d4 Tero Kristo 2024-05-27  240  
9e9397a41b7b1d Tero Kristo 2024-05-27  241  	guard(mutex)(&plr_die->lock);
9e9397a41b7b1d Tero Kristo 2024-05-27  242  
9e9397a41b7b1d Tero Kristo 2024-05-27  243  	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
9e9397a41b7b1d Tero Kristo 2024-05-27  244  		if (plr_die->die_id != tpmi_get_power_domain_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  245  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  246  
9e9397a41b7b1d Tero Kristo 2024-05-27  247  		if (plr_die->package_id != topology_physical_package_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  248  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  249  
9e9397a41b7b1d Tero Kristo 2024-05-27  250  		plr_clear_cpu_status(plr_die, cpu);
9e9397a41b7b1d Tero Kristo 2024-05-27  251  	}
9e9397a41b7b1d Tero Kristo 2024-05-27  252  
811f67c51636d4 Tero Kristo 2024-05-27  253  	return count;
811f67c51636d4 Tero Kristo 2024-05-27  254  }
811f67c51636d4 Tero Kristo 2024-05-27 @255  DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
811f67c51636d4 Tero Kristo 2024-05-27  256  

:::::: The code at line 255 was first introduced by commit
:::::: 811f67c51636d43791995bf483c5c1904900b531 platform/x86/intel/tpmi: Add new auxiliary driver for performance limits

:::::: TO: Tero Kristo <tero.kristo@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

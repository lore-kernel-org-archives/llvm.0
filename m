Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B40D2AE6A;
	Fri,  5 Jul 2024 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720209786; cv=none; b=Xse0CpXRb176bJL64BpGDcduA812YTkIYcygtP/HUNG6XU65N5xsvjWfyBaNn9RHy/BZH/vuAXYzsENG7C55CRdVMlBVVfaBYjM/87rachEFE3N6NH8f6QcuGesyYszQq0u7YKzorv1JLkaId2iqvE1BjLhwhPiPtervL84W1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720209786; c=relaxed/simple;
	bh=vNY0WjeD+ZgQq9PV5NovSKyND5bsaQ7EN4YZfzPyRZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQROvExWfFD91MkDU3+f5d31p47hTNbi3Stws2zhz5cWL/wFrRr3n8baY/CowXNi0ccicnSgt30pwHbcuFQz2nSUSh5yNsm2FOFFp9nleL5Zp/llyqqzeSJx0ZShJ3CDxeY05Ec1Rjb9Kl5Pg8Y0nczzRkSiQp7rkttT/xD6UFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIHthIL4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIHthIL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720209784; x=1751745784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNY0WjeD+ZgQq9PV5NovSKyND5bsaQ7EN4YZfzPyRZU=;
  b=GIHthIL4AkBzxfWnOGl4IJ5Gput4OHk4TV+GMX4TccXDB26ZKka2EL/s
   35q/RZHaBiXmECK1YFPCC+a36gH/tacGkG8+X/mg/ikfPZXUrjr1FMMmg
   RCoX/MYjK7xChjlmF9JCZnzaKzMsUc4RzJzJWQBi+Q2kXMk6x5iU8PdjH
   Oixe16mOyjhxyyA4Vn+ylSKMXRepGrzWPu63EC1TPQJTB5mtpPxdw1NNy
   B2sDUdE+AfV/rrJ+Li3IDi70teHICjoAeIjzEfOQGGNf4LKtGD7xYlRUE
   2fLm6vGwyOpKcpLyBA5oqRarGWiNyRMP+gOCNIo8czInH3USx8LKCQPLb
   w==;
X-CSE-ConnectionGUID: SC9cIIzOTgWrnN8gTB5i7Q==
X-CSE-MsgGUID: NU+iPs2KSCqNfPrRKqDmFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17221573"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17221573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 13:03:04 -0700
X-CSE-ConnectionGUID: KNUdsSiNSjOFCEv+chHv3w==
X-CSE-MsgGUID: 8hpLQqBTRXmlhvQaxtRNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="46890003"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2024 13:03:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPp91-000Snk-2W;
	Fri, 05 Jul 2024 20:02:59 +0000
Date: Sat, 6 Jul 2024 04:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 11/11] kernel/events/uprobes.c:1775:32:
 error: incompatible pointer types passing 'struct callback_head *' to
 parameter of type 'task_work_func_t' (aka 'void (*)(struct callback_head
 *)')
Message-ID: <202407060337.GGKAMoWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   b9867ee7d141bc8791e501495bafdfdb97283196
commit: b9867ee7d141bc8791e501495bafdfdb97283196 [11/11] perf/uprobe: Add uretprobe timer
config: i386-buildonly-randconfig-003-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060337.GGKAMoWl-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060337.GGKAMoWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060337.GGKAMoWl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/uprobes.c:1775:32: error: incompatible pointer types passing 'struct callback_head *' to parameter of type 'task_work_func_t' (aka 'void (*)(struct callback_head *)') [-Werror,-Wincompatible-pointer-types]
    1775 |         task_work_cancel(utask->task, &utask->ri_task_work);
         |                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/task_work.h:33:78: note: passing argument to parameter here
      33 | struct callback_head *task_work_cancel(struct task_struct *, task_work_func_t);
         |                                                                              ^
   1 error generated.


vim +1775 kernel/events/uprobes.c

  1754	
  1755	/*
  1756	 * Called with no locks held.
  1757	 * Called in context of an exiting or an exec-ing thread.
  1758	 */
  1759	void uprobe_free_utask(struct task_struct *t)
  1760	{
  1761		struct uprobe_task *utask = t->utask;
  1762		struct return_instance *ri;
  1763	
  1764		if (!utask)
  1765			return;
  1766	
  1767		if (utask->active_uprobe)
  1768			srcu_read_unlock(&uretprobes_srcu, utask->active_srcu_idx);
  1769	
  1770		ri = utask->return_instances;
  1771		while (ri)
  1772			ri = free_ret_instance(ri);
  1773	
  1774		timer_delete_sync(&utask->ri_timer);
> 1775		task_work_cancel(utask->task, &utask->ri_task_work);
  1776		xol_free_insn_slot(t);
  1777		kfree(utask);
  1778		t->utask = NULL;
  1779	}
  1780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

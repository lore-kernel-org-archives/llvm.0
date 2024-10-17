Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D01D0178;
	Thu, 17 Oct 2024 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729166427; cv=none; b=ChZqJ7gAka3o074DJWzSADnmwJiH+rRRBOcr/hjOdmlRNagZdqQWDpAGWB+1uFsstv9IGHyn/BsEycPMEg3PELRLPZ2QMcUGxRKPV229EH0USbGYI//eVVyJyMtedRAX4/CmU7g2tmLcyhb0byr6yiJq6ZBj0aCrnfXibn82mS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729166427; c=relaxed/simple;
	bh=mOIYfK9t0cHWMBbiRDo6t8kif51Uul515SawUtUoAvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oq+4vuHvlwN6ZDj7071LfGMZNF5dHVg7wXacmZEeqqQLP9VYUp/SsXJbRsGcAnmQWLn2xAGPGeOR1p1GOucHAbtH2DCL2PZ0bhsOdtaY6mnWVaSwvPiLqzm9R7E0YTIx4VBQFHkozWuwF2GX1itwJyLu2qCQf+838cOn2cZhvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQajaj8l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQajaj8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729166423; x=1760702423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOIYfK9t0cHWMBbiRDo6t8kif51Uul515SawUtUoAvg=;
  b=LQajaj8lnQ2szq1HrXyDm2buy1BkXKa1qszNWRTvpXUC0bttY4iEaJG9
   dMADBy7eEw2e1NAvKBhg3EzwD0/pC+PHKRg3irm9MpxR6I2fJBR0tnUAp
   Z+G2GbF8SInvhFAp4+LJjhv/o2ENETY3/36Yh5YVNeQWmdjqAYFfgIk1I
   1/oXcK3wUt31EexcN9DQYX+mVPHXqhA8rvSAjFGmaK+OS3MEHHmHeOB92
   +F+g3mJ5aXap93dkB7dgsvqRHVsO1hlFTWYI5b1BSqOQD18uT/nCq/29l
   WTNr9KSZXj46uqfT16Rf3AaAp/jeb7Rs7AxkevVSboqsM7UeWHxBsKW/X
   w==;
X-CSE-ConnectionGUID: Jr9CAr2ITKmFSRnUSXpsDw==
X-CSE-MsgGUID: 8NRewuD2RhGrHHJnhkIBkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28853862"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28853862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 05:00:22 -0700
X-CSE-ConnectionGUID: jct9n2pZSJe95jBJ5N/FwA==
X-CSE-MsgGUID: T7sGHLQ4SNi2NdJHrlqqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="79354471"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Oct 2024 05:00:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1PAw-000MH3-1a;
	Thu, 17 Oct 2024 12:00:18 +0000
Date: Thu, 17 Oct 2024 19:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>
Subject: [linux-next:pending-fixes 347/442] fs/afs/rxrpc.c:152:37: error: no
 member named 'async_rx' in 'struct afs_call_type'
Message-ID: <202410171908.BN4oKt8H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   64efb084cd83f9812b15be9519a355d6c950741c
commit: dabae7218d1c5a658029cb9fb7c099bd39b2e48c [347/442] afs: Fix lock recursion
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20241017/202410171908.BN4oKt8H-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171908.BN4oKt8H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171908.BN4oKt8H-lkp@intel.com/

Note: the linux-next/pending-fixes HEAD 64efb084cd83f9812b15be9519a355d6c950741c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/afs/rxrpc.c:152:37: error: no member named 'async_rx' in 'struct afs_call_type'
           INIT_WORK(&call->async_work, type->async_rx ?: afs_process_async_call);
                                        ~~~~  ^
   include/linux/workqueue.h:308:24: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
                                 ^~~~~
   include/linux/workqueue.h:304:26: note: expanded from macro '__INIT_WORK'
                   __INIT_WORK_KEY(_work, _func, _onstack, &__key);        \
                                          ^~~~~
   include/linux/workqueue.h:296:20: note: expanded from macro '__INIT_WORK_KEY'
                   (_work)->func = (_func);                                \
                                    ^~~~~
   1 error generated.


vim +152 fs/afs/rxrpc.c

   133	
   134	/*
   135	 * Allocate a call.
   136	 */
   137	static struct afs_call *afs_alloc_call(struct afs_net *net,
   138					       const struct afs_call_type *type,
   139					       gfp_t gfp)
   140	{
   141		struct afs_call *call;
   142		int o;
   143	
   144		call = kzalloc(sizeof(*call), gfp);
   145		if (!call)
   146			return NULL;
   147	
   148		call->type = type;
   149		call->net = net;
   150		call->debug_id = atomic_inc_return(&rxrpc_debug_id);
   151		refcount_set(&call->ref, 1);
 > 152		INIT_WORK(&call->async_work, type->async_rx ?: afs_process_async_call);
   153		INIT_WORK(&call->work, call->type->work);
   154		INIT_WORK(&call->free_work, afs_deferred_free_worker);
   155		init_waitqueue_head(&call->waitq);
   156		spin_lock_init(&call->state_lock);
   157		call->iter = &call->def_iter;
   158	
   159		o = atomic_inc_return(&net->nr_outstanding_calls);
   160		trace_afs_call(call->debug_id, afs_call_trace_alloc, 1, o,
   161			       __builtin_return_address(0));
   162		return call;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

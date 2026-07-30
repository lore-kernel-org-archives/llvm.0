Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18939E16B;
	Thu, 30 Jul 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396896; cv=none; b=ZGaVDv5I7uo7IJBfPteffqr74ijPuIrsgEf6VygvSKQsSQgoUUTOuZcIjerYpRxECGH9C+PRI40ruwcwZ9n7UPcb7umF1KAO6sNEYdAbdQHN5xehlcZra/4k/XTF/DeOyY/zxtFVP/i55x5cw5DiPbmGxbv6/tz1ILwyeTqSjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396896; c=relaxed/simple;
	bh=0NnEL7t9mYliAl/90LxghoUM8VkO/IJ8DOhEM4Wt6tM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rWj16XoLWzG62JDEvBAbdtGa/bqL9LjfpluNyFVaXeYYFy4ZpnH5h343n7+B14T+KWQHrcsi/8lU90MZ439TdlaQ1RHJhIk0cLp25uuVbtjrGEwc4fJUkobxnaG8E3+ye5BzvoUDSkiEOLNaHGiq1ZO7lRUd7ViWYVaasYfEMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1Wj1jeg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1Wj1jeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785396895; x=1816932895;
  h=date:from:to:cc:subject:message-id;
  bh=0NnEL7t9mYliAl/90LxghoUM8VkO/IJ8DOhEM4Wt6tM=;
  b=K1Wj1jegl1fx0wCFzbBgeooFBYEu5PeRwZGtxVmQIgTW+3W8I/JO7nQa
   IloDJtoe3hNrknG4Fn9pzzufVfQm4V/2cGmRgXgF8ZtJzM4tGD0Rn2/rl
   v/sFmxHyLJPCB02KkL2nJyRTKrEQMPhvEDiF3Ndkx3/xPXJuEGqjl47fx
   gbiolD9VP7FnJZ/Nln5tLy3ptJFPqMJlBMTA/O8eLQ68MSb+TmBXYP9iD
   fAfPlACEU0TGPa6ca4Cnk3XxB3POD6RQX7/l0XggW3izTBYuIzPag6riw
   8JZU7yWMAI2Ow+mS7SHVDdzx7dlfZNwfEodurOQP/+Ff+kIaHXH5KtuwJ
   Q==;
X-CSE-ConnectionGUID: N7VQtKNGQw6SvgortiUElg==
X-CSE-MsgGUID: v7xmOEblQneKb9D5AqzsnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88548467"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="88548467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:34:54 -0700
X-CSE-ConnectionGUID: jrCWci+yTUO6OqEJ/WRZ+g==
X-CSE-MsgGUID: txRjD7hwThaisih5zObNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259649287"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Jul 2026 00:34:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpLHu-00000000gCQ-291x;
	Thu, 30 Jul 2026 07:34:44 +0000
Date: Thu, 30 Jul 2026 15:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>
Subject: [dhowells-fs:afs-sticky-2 8/14]
 fs/netfs/rolling_buffer.c:31:25: error: incomplete definition of type 'struct
 mempool'
Message-ID: <202607301453.QxDoO1xs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-sticky-2
head:   1c608665edb5162ebe8c59325c02049995458c42
commit: fc6965676202afb4e7a7c4975418b73918d4c5c3 [8/14] netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
config: s390-randconfig-001-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301453.QxDoO1xs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301453.QxDoO1xs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301453.QxDoO1xs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/rolling_buffer.c:31:25: error: incomplete definition of type 'struct mempool'
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                      ~~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:24:16: note: forward declaration of 'struct mempool'
      24 | typedef struct mempool mempool_t;
         |                ^
   fs/netfs/rolling_buffer.c:31:54: error: incomplete definition of type 'struct mempool'
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                                                   ~~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:24:16: note: forward declaration of 'struct mempool'
      24 | typedef struct mempool mempool_t;
         |                ^
   fs/netfs/rolling_buffer.c:33:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                      ^
   fs/netfs/rolling_buffer.c:33:6: error: incompatible integer to pointer conversion assigning to 'struct folio_queue *' from 'int' [-Wint-conversion]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/rolling_buffer.c:56:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         mempool_free(folioq, &netfs_folioq_pool);
         |         ^
   5 errors generated.


vim +31 fs/netfs/rolling_buffer.c

    15	
    16	/**
    17	 * netfs_folioq_alloc - Allocate a folio_queue struct
    18	 * @rreq_id: Associated debugging ID for tracing purposes
    19	 * @gfp: Allocation constraints
    20	 * @trace: Trace tag to indicate the purpose of the allocation
    21	 *
    22	 * Allocate, initialise and account the folio_queue struct and log a trace line
    23	 * to mark the allocation.
    24	 */
    25	struct folio_queue *netfs_folioq_alloc(unsigned int rreq_id, gfp_t gfp,
    26					       unsigned int /*enum netfs_folioq_trace*/ trace)
    27	{
    28		struct folio_queue *fq;
    29	
    30		if (gfp == GFP_KERNEL)
  > 31			fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
    32		else
    33			fq = mempool_alloc(&netfs_folioq_pool, gfp);
    34		if (fq) {
    35			netfs_stat(&netfs_n_folioq);
    36			folioq_init(fq, rreq_id);
    37			fq->debug_id = atomic_inc_return(&debug_ids);
    38			trace_netfs_folioq(fq, trace);
    39		}
    40		return fq;
    41	}
    42	EXPORT_SYMBOL(netfs_folioq_alloc);
    43	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

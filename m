Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB261361;
	Sat, 16 Mar 2024 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710570942; cv=none; b=fISvW6JnjiDF7fC4AZtI5AdmPMFKJ/k82MIi3A7rizWvtIIiQFmVfV2k/qzMot08QvMLsxMx715ORGmk/VvdpNU6nVG1Kv6sBbyEAXhkwaKaPssfbShzBU2NbtMwx4R6/Fx0cWKx6fekRnyhrH+joJTaB7PHS0+ryj7JT+NWipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710570942; c=relaxed/simple;
	bh=ZznboOtU7ZvgwyIZFBj78Y4vrlgG39GqFlQ9V+orzMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnX2P32Ek5UflM4BicbrfvQ6wKN1qnlj/vfuRbks9qVdxbA+6ap4FRGP9GoKTwR54S5m/pgVqvbZmmTj2zW9MQRrfQ66w3Bnh3ncidQOrlJoC9SZc1OOhOFn0HXD0BMhqK1Yp2DUqj1Iz5d19tZ0BsiZ4Actj1FfWqNfGBGZyQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fN1At5jE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fN1At5jE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710570940; x=1742106940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZznboOtU7ZvgwyIZFBj78Y4vrlgG39GqFlQ9V+orzMI=;
  b=fN1At5jE6gtz/G0HkGwCFv5URuVSvEUEaAMncmYQljlswF3XWEmtfce1
   14ggb2teSBT1GECMlnkGh8nMyb+guwdM7Rmsj2bqJy4g8XthfeSmVDPD6
   YsYN2gN9VVcdoYu69GrjEAsId17slkP0pL22IFsj4+9Mxl4g7HBjBnfn3
   4fFKsrxAH0D7M7rVLmKKzhN5Etw7br/fFJ7Y3XuHEB9TQr/Vy4zMH07nX
   TWy9ugs0NOP/Ngyc4y2jfGWpfu/f3YT6iNCNo/24lnw7sEXiOxzhPzMCW
   FxYhzxHxmY8LDaefvwfwCVydb00lcSe61my48v36wpTAG/umFxO6o08ti
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5312782"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5312782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 23:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17587281"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Mar 2024 23:35:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlNdn-000F8J-0Z;
	Sat, 16 Mar 2024 06:35:35 +0000
Date: Sat, 16 Mar 2024 14:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 10/12] fs/netfs/objects.c:25:36: error:
 incomplete definition of type 'struct mempool_s'
Message-ID: <202403161454.UrFEsP1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   be938ad004e7a8f28cc6fc8500c120c7687339f7
commit: 0361c7613ba8192cccf99a39007a8ce54ed1f562 [10/12] netfs: Use mempools for allocating requests and subrequests
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161454.UrFEsP1k-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161454.UrFEsP1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161454.UrFEsP1k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/netfs/objects.c:10:
   In file included from fs/netfs/internal.h:10:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/netfs/objects.c:25:36: error: incomplete definition of type 'struct mempool_s'
      25 |         struct kmem_cache *cache = mempool->pool_data;
         |                                    ~~~~~~~^
   include/linux/netfs.h:23:16: note: forward declaration of 'struct mempool_s'
      23 | typedef struct mempool_s mempool_t;
         |                ^
   fs/netfs/objects.c:33:10: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                 rreq = mempool_alloc(mempool, GFP_KERNEL);
         |                        ^
   fs/netfs/objects.c:33:8: error: incompatible integer to pointer conversion assigning to 'struct netfs_io_request *' from 'int' [-Wint-conversion]
      33 |                 rreq = mempool_alloc(mempool, GFP_KERNEL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/objects.c:61:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                         mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
         |                         ^
   fs/netfs/objects.c:97:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
         |         ^
   fs/netfs/objects.c:156:36: error: incomplete definition of type 'struct mempool_s'
     156 |         struct kmem_cache *cache = mempool->pool_data;
         |                                    ~~~~~~~^
   include/linux/netfs.h:23:16: note: forward declaration of 'struct mempool_s'
      23 | typedef struct mempool_s mempool_t;
         |                ^
   fs/netfs/objects.c:159:12: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |                 subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
         |                          ^
   fs/netfs/objects.c:159:10: error: incompatible integer to pointer conversion assigning to 'struct netfs_io_subrequest *' from 'int' [-Wint-conversion]
     159 |                 subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     160 |                                        GFP_KERNEL);
         |                                        ~~~~~~~~~~~
   fs/netfs/objects.c:194:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |         mempool_free(subreq, rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool);
         |         ^
   1 warning and 9 errors generated.


vim +25 fs/netfs/objects.c

  > 10	#include "internal.h"
    11	
    12	/*
    13	 * Allocate an I/O request and initialise it.
    14	 */
    15	struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
    16						     struct file *file,
    17						     loff_t start, size_t len,
    18						     enum netfs_io_origin origin)
    19	{
    20		static atomic_t debug_ids;
    21		struct inode *inode = file ? file_inode(file) : mapping->host;
    22		struct netfs_inode *ctx = netfs_inode(inode);
    23		struct netfs_io_request *rreq;
    24		mempool_t *mempool = ctx->ops->request_pool ?: &netfs_request_pool;
  > 25		struct kmem_cache *cache = mempool->pool_data;
    26		bool is_unbuffered = (origin == NETFS_UNBUFFERED_WRITE ||
    27				      origin == NETFS_DIO_READ ||
    28				      origin == NETFS_DIO_WRITE);
    29		bool cached = !is_unbuffered && netfs_is_cache_enabled(ctx);
    30		int ret;
    31	
    32		for (;;) {
    33			rreq = mempool_alloc(mempool, GFP_KERNEL);
    34			if (rreq)
    35				break;
    36			msleep(10);
    37		}
    38	
    39		memset(rreq, 0, kmem_cache_size(cache));
    40		rreq->start	= start;
    41		rreq->len	= len;
    42		rreq->upper_len	= len;
    43		rreq->origin	= origin;
    44		rreq->netfs_ops	= ctx->ops;
    45		rreq->mapping	= mapping;
    46		rreq->inode	= inode;
    47		rreq->i_size	= i_size_read(inode);
    48		rreq->debug_id	= atomic_inc_return(&debug_ids);
    49		INIT_LIST_HEAD(&rreq->subrequests);
    50		INIT_WORK(&rreq->work, NULL);
    51		refcount_set(&rreq->ref, 1);
    52	
    53		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
    54		if (cached)
    55			__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
    56		if (file && file->f_flags & O_NONBLOCK)
    57			__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
    58		if (rreq->netfs_ops->init_request) {
    59			ret = rreq->netfs_ops->init_request(rreq, file);
    60			if (ret < 0) {
    61				mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
    62				return ERR_PTR(ret);
    63			}
    64		}
    65	
    66		trace_netfs_rreq_ref(rreq->debug_id, 1, netfs_rreq_trace_new);
    67		netfs_proc_add_rreq(rreq);
    68		netfs_stat(&netfs_n_rh_rreq);
    69		return rreq;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

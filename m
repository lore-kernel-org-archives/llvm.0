Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B285A0E7;
	Fri, 15 Mar 2024 23:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710544113; cv=none; b=aT1ciUP2860hKu5S5zj/jSiPmNBch6VhStSlyS+Xjx11a0VRPPKgOQum3tPcFfKJhd6ARHC4BBkAgan6ahF4FkDefnHutyq7sULzwWYaLHQOjc26ji+zwuAWZ2yJtb2eP57/3WhLDDGoRZ0rRmixKxEUgSj/rfuo8ob++qBcoyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710544113; c=relaxed/simple;
	bh=sfWl3P1vGOkAgyEe79fsdBw9g9vnG5GgJZ6RNrrsDJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=COuF704x5WOcoABheBWv7UkGI8OIZaGFLILuzw2RuOJP8Unp6/WRHr35SiqvAIN5xzHYdNSxHV3lpWK6fSneYSp2vW5/V5veb+vIWX7GbBBigfwU2oAebrLyEKob1mju4b/rrz9gBvV6jxoASaZJF7K7EBExrGG56obMvJfxZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJMRSJoC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJMRSJoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710544110; x=1742080110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfWl3P1vGOkAgyEe79fsdBw9g9vnG5GgJZ6RNrrsDJk=;
  b=iJMRSJoChqKrfqWbtMJY2IaWIizoZOYzSZGjjVY+7pXyDBadWC5eqmEF
   NIvmBYVSyHr02xYiraYs3Flr91PfmqyWjWW+Qe8BCapXworIwFvNa6j+s
   uNJhRlDHREfch9ayPM/wVoRpUHReTouf69SjbLdy9VnJNa/Xq6eoNcljA
   Xymszd6iu9sfIkN/rYY6CUU30vZpMouDvdDKPJ68312SID/M+Boouns0w
   tlO1sB0yVn4bKR87QNkj4gL5eMQ6mbIx5DtshR42aSZecTka6gzQjP0HC
   nhJ8rC8Bj2AfJmb6mm7aOnWoi1vVZ8pZn1PMqkvFaey9CU11zpJ3WsIim
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5298292"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5298292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 16:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="43879791"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 16:08:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlGf0-000ErL-1q;
	Fri, 15 Mar 2024 23:08:22 +0000
Date: Sat, 16 Mar 2024 07:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 10/12] fs/netfs/main.c:113:6: error:
 call to undeclared function 'mempool_init_slab_pool'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202403160648.2OM4lIMG-lkp@intel.com>
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
commit: ada115ace095d0356bbe99f34838822434d0f2df [10/12] netfs: Use mempools for allocating requests and subrequests
config: i386-buildonly-randconfig-001-20240316 (https://download.01.org/0day-ci/archive/20240316/202403160648.2OM4lIMG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160648.2OM4lIMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160648.2OM4lIMG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/main.c:113:6: error: call to undeclared function 'mempool_init_slab_pool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |         if (mempool_init_slab_pool(&netfs_request_pool, 100, netfs_request_slab) < 0)
         |             ^
>> fs/netfs/main.c:146:2: error: call to undeclared function 'mempool_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         mempool_exit(&netfs_subrequest_pool);
         |         ^
   fs/netfs/main.c:162:2: error: call to undeclared function 'mempool_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |         mempool_exit(&netfs_subrequest_pool);
         |         ^
>> fs/netfs/main.c:28:11: error: tentative definition has type 'mempool_t' (aka 'struct mempool_s') that is never completed
      28 | mempool_t netfs_request_pool;
         |           ^
   include/linux/netfs.h:23:16: note: forward declaration of 'struct mempool_s'
      23 | typedef struct mempool_s mempool_t;
         |                ^
   fs/netfs/main.c:29:11: error: tentative definition has type 'mempool_t' (aka 'struct mempool_s') that is never completed
      29 | mempool_t netfs_subrequest_pool;
         |           ^
   include/linux/netfs.h:23:16: note: forward declaration of 'struct mempool_s'
      23 | typedef struct mempool_s mempool_t;
         |                ^
   5 errors generated.
--
>> fs/netfs/objects.c:31:10: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      31 |                 rreq = mempool_alloc(ctx->ops->request_pool ?: &netfs_request_pool, GFP_KERNEL);
         |                        ^
>> fs/netfs/objects.c:31:8: error: incompatible integer to pointer conversion assigning to 'struct netfs_io_request *' from 'int' [-Wint-conversion]
      31 |                 rreq = mempool_alloc(ctx->ops->request_pool ?: &netfs_request_pool, GFP_KERNEL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/objects.c:59:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |                         mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
         |                         ^
   fs/netfs/objects.c:95:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
         |         ^
   fs/netfs/objects.c:155:12: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |                 subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
         |                          ^
>> fs/netfs/objects.c:155:10: error: incompatible integer to pointer conversion assigning to 'struct netfs_io_subrequest *' from 'int' [-Wint-conversion]
     155 |                 subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                                        GFP_KERNEL);
         |                                        ~~~~~~~~~~~
   fs/netfs/objects.c:190:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |         mempool_free(subreq, rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool);
         |         ^
   7 errors generated.


vim +/mempool_init_slab_pool +113 fs/netfs/main.c

    25	
    26	static struct kmem_cache *netfs_request_slab;
    27	static struct kmem_cache *netfs_subrequest_slab;
  > 28	mempool_t netfs_request_pool;
    29	mempool_t netfs_subrequest_pool;
    30	
    31	#ifdef CONFIG_PROC_FS
    32	LIST_HEAD(netfs_io_requests);
    33	DEFINE_SPINLOCK(netfs_proc_lock);
    34	
    35	static const char *netfs_origins[nr__netfs_io_origin] = {
    36		[NETFS_READAHEAD]		= "RA",
    37		[NETFS_READPAGE]		= "RP",
    38		[NETFS_READ_FOR_WRITE]		= "RW",
    39		[NETFS_COPY_TO_CACHE]		= "CC",
    40		[NETFS_WRITEBACK]		= "WB",
    41		[NETFS_WRITETHROUGH]		= "WT",
    42		[NETFS_UNBUFFERED_WRITE]	= "UW",
    43		[NETFS_DIO_READ]		= "DR",
    44		[NETFS_DIO_WRITE]		= "DW",
    45	};
    46	
    47	/*
    48	 * Generate a list of I/O requests in /proc/fs/netfs/requests
    49	 */
    50	static int netfs_requests_seq_show(struct seq_file *m, void *v)
    51	{
    52		struct netfs_io_request *rreq;
    53	
    54		if (v == &netfs_io_requests) {
    55			seq_puts(m,
    56				 "REQUEST  OR REF FL ERR  OPS COVERAGE\n"
    57				 "======== == === == ==== === =========\n"
    58				 );
    59			return 0;
    60		}
    61	
    62		rreq = list_entry(v, struct netfs_io_request, proc_link);
    63		seq_printf(m,
    64			   "%08x %s %3d %2lx %4d %3d @%04llx %zx/%zx",
    65			   rreq->debug_id,
    66			   netfs_origins[rreq->origin],
    67			   refcount_read(&rreq->ref),
    68			   rreq->flags,
    69			   rreq->error,
    70			   atomic_read(&rreq->nr_outstanding),
    71			   rreq->start, rreq->submitted, rreq->len);
    72		seq_putc(m, '\n');
    73		return 0;
    74	}
    75	
    76	static void *netfs_requests_seq_start(struct seq_file *m, loff_t *_pos)
    77		__acquires(rcu)
    78	{
    79		rcu_read_lock();
    80		return seq_list_start_head(&netfs_io_requests, *_pos);
    81	}
    82	
    83	static void *netfs_requests_seq_next(struct seq_file *m, void *v, loff_t *_pos)
    84	{
    85		return seq_list_next(v, &netfs_io_requests, _pos);
    86	}
    87	
    88	static void netfs_requests_seq_stop(struct seq_file *m, void *v)
    89		__releases(rcu)
    90	{
    91		rcu_read_unlock();
    92	}
    93	
    94	static const struct seq_operations netfs_requests_seq_ops = {
    95		.start  = netfs_requests_seq_start,
    96		.next   = netfs_requests_seq_next,
    97		.stop   = netfs_requests_seq_stop,
    98		.show   = netfs_requests_seq_show,
    99	};
   100	#endif /* CONFIG_PROC_FS */
   101	
   102	static int __init netfs_init(void)
   103	{
   104		int ret = -ENOMEM;
   105	
   106		netfs_request_slab = kmem_cache_create("netfs_request",
   107						       sizeof(struct netfs_io_request), 0,
   108						       SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT,
   109						       NULL);
   110		if (!netfs_request_slab)
   111			goto error_req;
   112	
 > 113		if (mempool_init_slab_pool(&netfs_request_pool, 100, netfs_request_slab) < 0)
   114			goto error_reqpool;
   115	
   116		netfs_subrequest_slab = kmem_cache_create("netfs_subrequest",
   117							  sizeof(struct netfs_io_subrequest), 0,
   118							  SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT,
   119							  NULL);
   120		if (!netfs_subrequest_slab)
   121			goto error_subreq;
   122	
   123		if (mempool_init_slab_pool(&netfs_subrequest_pool, 100, netfs_subrequest_slab) < 0)
   124			goto error_subreqpool;
   125	
   126		if (!proc_mkdir("fs/netfs", NULL))
   127			goto error_proc;
   128		if (!proc_create_seq("fs/netfs/requests", S_IFREG | 0444, NULL,
   129				     &netfs_requests_seq_ops))
   130			goto error_procfile;
   131	#ifdef CONFIG_FSCACHE_STATS
   132		if (!proc_create_single("fs/netfs/stats", S_IFREG | 0444, NULL,
   133					netfs_stats_show))
   134			goto error_procfile;
   135	#endif
   136	
   137		ret = fscache_init();
   138		if (ret < 0)
   139			goto error_fscache;
   140		return 0;
   141	
   142	error_fscache:
   143	error_procfile:
   144		remove_proc_entry("fs/netfs", NULL);
   145	error_proc:
 > 146		mempool_exit(&netfs_subrequest_pool);
   147	error_subreqpool:
   148		kmem_cache_destroy(netfs_subrequest_slab);
   149	error_subreq:
   150		mempool_exit(&netfs_request_pool);
   151	error_reqpool:
   152		kmem_cache_destroy(netfs_request_slab);
   153	error_req:
   154		return ret;
   155	}
   156	fs_initcall(netfs_init);
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

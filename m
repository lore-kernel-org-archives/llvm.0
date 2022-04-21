Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF401FCD
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650564214; x=1682100214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQ+rneEE1x3jrND7Y9Wv3LGa2VxvPuk/c+WG8SdyEzQ=;
  b=CK9iwVbq/v9oQOrtuMVzuHh15sbiSU1AIbZhNHL0QmLOMqrb0r+04Lpg
   LLSArTUZMeUYWoNKO8aUp6IQVJty99/r8HIpm5Qz7+RwOOlfogGfVMa75
   ooeCJeepQXghXxBhmNG7+CayJOLP2BWAXhKuWxrcoHUj0Uspsp/aIEd8y
   DsquPbcQAxHDdWgCFcEOIoDbpj6oP/R8lGOuKTrtgzfF6lgj+tf8hemjI
   yX0+cpkBVqDJTf1rs1sJD/MvmuGSRYCkAQ6mfuEdnP+IDxO5yBuHUMdtd
   Ot2E1UzpHY/WElb/dDzWhGE0rucqhwXUofEuh7b87KfHKiJ+vG6jTaUKM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263902997"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="263902997"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 11:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="728116051"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Apr 2022 11:03:30 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhb9N-0008e7-O6;
	Thu, 21 Apr 2022 18:03:29 +0000
Date: Fri, 22 Apr 2022 02:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [dhowells-fs:netfs-lib 2/18] fs/netfs/objects.c:48:2: error: call to
 undeclared function 'netfs_proc_add_writeback'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202204220100.5rFjj0Qv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   5b166ee5742c8a13e2958bad90e4b3a5d9bb0426
commit: d2183d7d55ccea0042532727e540a4835aa0a266 [2/18] netfs: Add a procfile to list in-progress requests
config: hexagon-randconfig-r045-20220421 (https://download.01.org/0day-ci/archive/20220422/202204220100.5rFjj0Qv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=d2183d7d55ccea0042532727e540a4835aa0a266
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs netfs-lib
        git checkout d2183d7d55ccea0042532727e540a4835aa0a266
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/netfs/objects.c:48:2: error: call to undeclared function 'netfs_proc_add_writeback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           netfs_proc_add_writeback(rreq);
           ^
   fs/netfs/objects.c:48:2: note: did you mean 'netfs_proc_add_rreq'?
   fs/netfs/internal.h:51:20: note: 'netfs_proc_add_rreq' declared here
   static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
                      ^
>> fs/netfs/objects.c:80:2: error: call to undeclared function 'netfs_proc_del_writeback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           netfs_proc_del_writeback(rreq);
           ^
   fs/netfs/objects.c:80:2: note: did you mean 'netfs_proc_del_rreq'?
   fs/netfs/internal.h:52:20: note: 'netfs_proc_del_rreq' declared here
   static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq) {}
                      ^
   2 errors generated.


vim +/netfs_proc_add_writeback +48 fs/netfs/objects.c

    10	
    11	/*
    12	 * Allocate an I/O request and initialise it.
    13	 */
    14	struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
    15						     struct file *file,
    16						     loff_t start, size_t len,
    17						     enum netfs_io_origin origin)
    18	{
    19		static atomic_t debug_ids;
    20		struct inode *inode = file ? file_inode(file) : mapping->host;
    21		struct netfs_i_context *ctx = netfs_i_context(inode);
    22		struct netfs_io_request *rreq;
    23		int ret;
    24	
    25		rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
    26		if (!rreq)
    27			return ERR_PTR(-ENOMEM);
    28	
    29		rreq->start	= start;
    30		rreq->len	= len;
    31		rreq->origin	= origin;
    32		rreq->netfs_ops	= ctx->ops;
    33		rreq->mapping	= mapping;
    34		rreq->inode	= inode;
    35		rreq->i_size	= i_size_read(inode);
    36		rreq->debug_id	= atomic_inc_return(&debug_ids);
    37		INIT_LIST_HEAD(&rreq->subrequests);
    38		refcount_set(&rreq->ref, 1);
    39		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
    40		if (rreq->netfs_ops->init_request) {
    41			ret = rreq->netfs_ops->init_request(rreq, file);
    42			if (ret < 0) {
    43				kfree(rreq);
    44				return ERR_PTR(ret);
    45			}
    46		}
    47	
  > 48		netfs_proc_add_writeback(rreq);
    49		netfs_stat(&netfs_n_rh_rreq);
    50		return rreq;
    51	}
    52	
    53	void netfs_get_request(struct netfs_io_request *rreq, enum netfs_rreq_ref_trace what)
    54	{
    55		int r;
    56	
    57		__refcount_inc(&rreq->ref, &r);
    58		trace_netfs_rreq_ref(rreq->debug_id, r + 1, what);
    59	}
    60	
    61	void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
    62	{
    63		struct netfs_io_subrequest *subreq;
    64	
    65		while (!list_empty(&rreq->subrequests)) {
    66			subreq = list_first_entry(&rreq->subrequests,
    67						  struct netfs_io_subrequest, rreq_link);
    68			list_del(&subreq->rreq_link);
    69			netfs_put_subrequest(subreq, was_async,
    70					     netfs_sreq_trace_put_clear);
    71		}
    72	}
    73	
    74	static void netfs_free_request(struct work_struct *work)
    75	{
    76		struct netfs_io_request *rreq =
    77			container_of(work, struct netfs_io_request, work);
    78	
    79		trace_netfs_rreq(rreq, netfs_rreq_trace_free);
  > 80		netfs_proc_del_writeback(rreq);
    81		netfs_clear_subrequests(rreq, false);
    82		if (rreq->netfs_ops->free_request)
    83			rreq->netfs_ops->free_request(rreq);
    84		if (rreq->cache_resources.ops)
    85			rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
    86		kfree_rcu(rreq, rcu);
    87		netfs_stat_d(&netfs_n_rh_rreq);
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

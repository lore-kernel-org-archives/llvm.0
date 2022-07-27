Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C96A20
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 02:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658890002; x=1690426002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7bpB+Hp1gNN7XBCLvjoGGOyH5XEjePKbom+g8n/kSCQ=;
  b=B1nHsSinAghfAfyKV86iyqUQtw3101iTy5D4M3z9Q6aa2JXiif3XlD8j
   vW4r50fSbMNkFPsQUCT1gkew4+hCoYK4cHIc40tmp3Y2gz6m0dCxjDowE
   ncxfSJDlaUP4PhzF1jPxZi/B4g3yq4d9VJWmc9Kt9cMVnb66nmsa19tMr
   PiZiyCnarwbPDDYMTlUsVSr/K0BfPhqhlIHwAdEZ4JfnjlO/4iuPUsKBy
   WRldZ7YpboU5uPRC+vyI0B5OKm5QeqF7G2g5nIEV0jBU5vYjSjFniTzNA
   A1GlG/29YGyBfrSV5pT7oc5uo/YCr9IaQhHTgOoDbMFs0ldWih0WM7Se8
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="374428448"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="374428448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 19:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="742483864"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2022 19:46:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGX4H-0008Cc-2g;
	Wed, 27 Jul 2022 02:46:37 +0000
Date: Wed, 27 Jul 2022 10:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-5.20/io_uring-zerocopy-send 23/23]
 io_uring/notif.c:52:16: error: call to undeclared function
 'io_alloc_req_refill'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202207271019.xPvKdqmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-5.20/io_uring-zerocopy-send
head:   fbe6f6bc3210e853aab74f20da776c15c5b052fe
commit: fbe6f6bc3210e853aab74f20da776c15c5b052fe [23/23] io_uring/zc: notification completion optimisation
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220727/202207271019.xPvKdqmJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=fbe6f6bc3210e853aab74f20da776c15c5b052fe
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-5.20/io_uring-zerocopy-send
        git checkout fbe6f6bc3210e853aab74f20da776c15c5b052fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> io_uring/notif.c:52:16: error: call to undeclared function 'io_alloc_req_refill'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (unlikely(!io_alloc_req_refill(ctx)))
                         ^
   io_uring/notif.c:52:16: note: did you mean 'io_rsrc_refs_refill'?
   io_uring/rsrc.h:57:6: note: 'io_rsrc_refs_refill' declared here
   void io_rsrc_refs_refill(struct io_ring_ctx *ctx);
        ^
>> io_uring/notif.c:54:10: error: call to undeclared function 'io_alloc_req'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           notif = io_alloc_req(ctx);
                   ^
   io_uring/notif.c:54:10: note: did you mean 'xa_alloc_irq'?
   include/linux/xarray.h:913:32: note: 'xa_alloc_irq' declared here
   static inline int __must_check xa_alloc_irq(struct xarray *xa, u32 *id,
                                  ^
>> io_uring/notif.c:54:8: error: incompatible integer to pointer conversion assigning to 'struct io_kiocb *' from 'int' [-Wint-conversion]
           notif = io_alloc_req(ctx);
                 ^ ~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/io_alloc_req_refill +52 io_uring/notif.c

    44	
    45	struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx,
    46					struct io_notif_slot *slot)
    47		__must_hold(&ctx->uring_lock)
    48	{
    49		struct io_kiocb *notif;
    50		struct io_notif_data *nd;
    51	
  > 52		if (unlikely(!io_alloc_req_refill(ctx)))
    53			return NULL;
  > 54		notif = io_alloc_req(ctx);
    55		notif->opcode = IORING_OP_NOP;
    56		notif->flags = 0;
    57		notif->file = NULL;
    58		notif->task = current;
    59		io_get_task_refs(1);
    60		notif->rsrc_node = NULL;
    61		io_req_set_rsrc_node(notif, ctx, 0);
    62		notif->cqe.user_data = slot->tag;
    63		notif->cqe.flags = slot->seq++;
    64		notif->cqe.res = 0;
    65	
    66		nd = io_notif_to_data(notif);
    67		nd->account_pages = 0;
    68		nd->uarg.flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
    69		nd->uarg.callback = io_uring_tx_zerocopy_callback;
    70		/* master ref owned by io_notif_slot, will be dropped on flush */
    71		refcount_set(&nd->uarg.refcnt, 1);
    72		return notif;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

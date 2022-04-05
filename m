Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1B115A3
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 04:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649134127; x=1680670127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpn0ZrPmf93RnQGspQa2dAzZJvLCojxENpbVEQO/3bo=;
  b=ARY/5r2ndDl3qnuOgSgH+dEoBnbOoSKriDswsrVVLmB16gCxGu2FtNzo
   Q42VPs1VYo7j/Nmv3YmRU1GOuuHm0hxyRq1aEFHEDtUOmgmBZ5cS1QlNS
   j25CeDRJkN9agVvQO076suApR3kBMfhzjBlurT7UKRQQujgZPsYYLJopX
   IsPwJJqq7Zk4JOJCkE2TOk8j+3+Lq0gCPX06a47eKVEqJ3yWRN7OISF5i
   Nkre0IlG6w0VA82GYZPeKk9fbAWrgE3EPnXA1MV3+qrcTeTp/hcto12LA
   BsQhB3HGS4Kk88LWUNUh/f+Cs7trEiBbD3VX3reuV4NpHPOVsvPOrya52
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="240600788"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="240600788"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 21:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="721906095"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Apr 2022 21:48:44 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbb7U-0002dn-2p;
	Tue, 05 Apr 2022 04:48:44 +0000
Date: Tue, 5 Apr 2022 12:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 28/40]
 fs/netfs/direct_read.c:194:22: warning: mixing declarations and code is
 incompatible with standards before C99
Message-ID: <202204051244.41Wy7KP6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   674eea41fc70a740ff83ec590f9833f805852464
commit: 86ffcdd2a1cb7c858063208fdfb7abe941bc0b9e [28/40] netfs: Support decryption on DIO read
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220405/202204051244.41Wy7KP6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/86ffcdd2a1cb7c858063208fdfb7abe941bc0b9e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout 86ffcdd2a1cb7c858063208fdfb7abe941bc0b9e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/netfs/direct_read.c:193:3: error: expected expression
                   unsigned int min_bsize = 1ULL << ctx->min_bshift;
                   ^
   fs/netfs/direct_read.c:194:54: error: use of undeclared identifier 'min_bsize'
                   unsigned long long start = round_down(rreq->start, min_bsize);
                                                                      ^
   fs/netfs/direct_read.c:196:47: error: use of undeclared identifier 'min_bsize'
                                                  round_up(rreq->start + rreq->len, min_bsize),
                                                                                    ^
   fs/netfs/direct_read.c:196:47: error: use of undeclared identifier 'min_bsize'
>> fs/netfs/direct_read.c:194:22: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                   unsigned long long start = round_down(rreq->start, min_bsize);
                                      ^
   1 warning and 4 errors generated.


vim +194 fs/netfs/direct_read.c

   111	
   112	/**
   113	 * netfs_direct_read_iter - Perform a direct I/O read
   114	 * @iocb: The I/O control descriptor describing the read
   115	 * @iter: The output buffer (also specifies read length)
   116	 */
   117	ssize_t netfs_direct_read_iter(struct kiocb *iocb, struct iov_iter *iter)
   118	{
   119		struct netfs_io_request *rreq;
   120		struct netfs_i_context *ctx;
   121		ssize_t n, ret;
   122	
   123		_enter("");
   124	
   125		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   126					   iocb->ki_pos, iov_iter_count(iter),
   127					   NETFS_DIO_READ);
   128		if (IS_ERR(rreq))
   129			return PTR_ERR(rreq);
   130	
   131		ctx = netfs_i_context(rreq->inode);
   132		netfs_stat(&netfs_n_rh_dio_read);
   133		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   134	
   135		rreq->buffering = NETFS_DIRECT;
   136		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
   137			static const enum netfs_buffering buffering[2][2] = {
   138				/* [async][aligned] */
   139				[false][false]	= NETFS_BOUNCE_DEC_COPY,
   140				[false][true]	= NETFS_BOUNCE_DEC_TO_DIRECT,
   141				[true ][false]	= NETFS_BOUNCE_DEC_COPY_BV,
   142				[true ][true]	= NETFS_BOUNCE_DEC_TO_DIRECT_BV,
   143			};
   144			bool aligned = netfs_is_crypto_aligned(rreq, iter);
   145			bool async = !is_sync_kiocb(iocb);
   146	
   147			rreq->buffering = buffering[async][aligned];
   148		}
   149	
   150		kdebug("remote_i %llx %llx %llx",
   151		       ctx->remote_i_size, rreq->i_size, i_size_read(netfs_inode(ctx)));
   152	
   153		/* If this is an async op, we have to keep track of the destination
   154		 * buffer for ourselves as the caller's iterator will be trashed when
   155		 * we return.
   156		 *
   157		 * In such a case, extract an iterator to represent as much of the the
   158		 * output buffer as we can manage.  Note that the extraction might not
   159		 * be able to allocate a sufficiently large bvec array and may shorten
   160		 * the request.
   161		 */
   162		switch (rreq->buffering) {
   163		case NETFS_DIRECT:
   164		case NETFS_BOUNCE_DEC_TO_DIRECT:
   165		case NETFS_BOUNCE_DEC_COPY:
   166			rreq->direct_iter = *iter;
   167			rreq->len = iov_iter_count(&rreq->direct_iter);
   168			break;
   169		case NETFS_DIRECT_BV:
   170		case NETFS_BOUNCE_DEC_TO_DIRECT_BV:
   171		case NETFS_BOUNCE_DEC_COPY_BV:
   172			n = extract_iter_to_iter(iter, rreq->len, &rreq->direct_iter,
   173						 &rreq->direct_bv);
   174			if (n < 0) {
   175				ret = n;
   176				goto out;
   177			}
   178			rreq->direct_bv_count = n;
   179			rreq->len = iov_iter_count(&rreq->direct_iter);
   180			break;
   181		default:
   182			BUG();
   183		}
   184	
   185		/* If we're going to use a bounce buffer, we need to set it up.  We
   186		 * will then need to pad the request out to the minimum block size.
   187		 */
   188		switch (rreq->buffering) {
   189		case NETFS_BOUNCE_DEC_TO_DIRECT:
   190		case NETFS_BOUNCE_DEC_COPY:
   191		case NETFS_BOUNCE_DEC_TO_DIRECT_BV:
   192		case NETFS_BOUNCE_DEC_COPY_BV:
   193			unsigned int min_bsize = 1ULL << ctx->min_bshift;
 > 194			unsigned long long start = round_down(rreq->start, min_bsize);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

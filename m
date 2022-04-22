Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCA2900
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650667282; x=1682203282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8BliuVm2aG24BbkKnHi6+OIh0bwNHk5HwL4GQMptWY=;
  b=e57HSjh1UWSTK6IWBfkN3oauPQJqBPqiDNXZyqSvnoDS/JTpNYVpu1aw
   KxvDoFeqkCfcQh4EEcLcEWiNXPAWZ0goJxHrMkCibiTUZVUiFdB5xqvlA
   br3dhQgM/EFc3V+/ayx2slBrgGi/jG5WVQWPOo0z2xYM9+ecaPyAAsstr
   PZRNufjn6UDnBUrNTMBKU0xTPx+hrtfxk2oktTIAMBv+glrG9xxdastvw
   LepdcNFb/Hp/pT9UukHDheII38blt71OWWNhKUn6ItD6tpcjF4XniIq9j
   I4tTURdnJ32r+ZSJkV2SvsZfzPsBsgNfPgeOXAJUIQx7X4vIraDwSdByp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351254984"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="351254984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 15:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="806183651"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2022 15:41:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni1xn-000Ad4-Aq;
	Fri, 22 Apr 2022 22:41:19 +0000
Date: Sat, 23 Apr 2022 06:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 30/44]
 fs/netfs/direct_read.c:199:22: warning: mixing declarations and code is
 incompatible with standards before C99
Message-ID: <202204230625.XcIM7EPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   931e50676c6598d0eda1954ead465519ff91874d
commit: d1c47ebbbed8921181b4573ba5736595bc3b787c [30/44] netfs: Support decryption on DIO read
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220423/202204230625.XcIM7EPi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d1c47ebbbed8921181b4573ba5736595bc3b787c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout d1c47ebbbed8921181b4573ba5736595bc3b787c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/netfs/direct_read.c:198:3: error: expected expression
                   unsigned int min_bsize = 1ULL << ctx->min_bshift;
                   ^
   fs/netfs/direct_read.c:199:54: error: use of undeclared identifier 'min_bsize'
                   unsigned long long start = round_down(rreq->start, min_bsize);
                                                                      ^
   fs/netfs/direct_read.c:201:47: error: use of undeclared identifier 'min_bsize'
                                                  round_up(rreq->start + rreq->len, min_bsize),
                                                                                    ^
   fs/netfs/direct_read.c:201:47: error: use of undeclared identifier 'min_bsize'
>> fs/netfs/direct_read.c:199:22: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                   unsigned long long start = round_down(rreq->start, min_bsize);
                                      ^
   1 warning and 4 errors generated.


vim +199 fs/netfs/direct_read.c

   116	
   117	/**
   118	 * netfs_direct_read_iter - Perform a direct I/O read
   119	 * @iocb: The I/O control descriptor describing the read
   120	 * @iter: The output buffer (also specifies read length)
   121	 */
   122	ssize_t netfs_direct_read_iter(struct kiocb *iocb, struct iov_iter *iter)
   123	{
   124		struct netfs_io_request *rreq;
   125		struct netfs_i_context *ctx;
   126		ssize_t n, ret;
   127	
   128		_enter("");
   129	
   130		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   131					   iocb->ki_pos, iov_iter_count(iter),
   132					   NETFS_DIO_READ);
   133		if (IS_ERR(rreq))
   134			return PTR_ERR(rreq);
   135	
   136		ctx = netfs_i_context(rreq->inode);
   137		netfs_stat(&netfs_n_rh_dio_read);
   138		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   139	
   140		rreq->buffering = NETFS_DIRECT;
   141		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
   142			static const enum netfs_buffering buffering[2][2] = {
   143				/* [async][aligned] */
   144				[false][false]	= NETFS_BOUNCE_DEC_COPY,
   145				[false][true]	= NETFS_BOUNCE_DEC_TO_DIRECT,
   146				[true ][false]	= NETFS_BOUNCE_DEC_COPY_BV,
   147				[true ][true]	= NETFS_BOUNCE_DEC_TO_DIRECT_BV,
   148			};
   149			bool aligned = netfs_is_crypto_aligned(rreq, iter);
   150			bool async = !is_sync_kiocb(iocb);
   151	
   152			rreq->buffering = buffering[async][aligned];
   153		}
   154	
   155		kdebug("remote_i %llx %llx %llx",
   156		       ctx->remote_i_size, rreq->i_size, i_size_read(netfs_inode(ctx)));
   157	
   158		/* If this is an async op, we have to keep track of the destination
   159		 * buffer for ourselves as the caller's iterator will be trashed when
   160		 * we return.
   161		 *
   162		 * In such a case, extract an iterator to represent as much of the the
   163		 * output buffer as we can manage.  Note that the extraction might not
   164		 * be able to allocate a sufficiently large bvec array and may shorten
   165		 * the request.
   166		 */
   167		switch (rreq->buffering) {
   168		case NETFS_DIRECT:
   169		case NETFS_BOUNCE_DEC_TO_DIRECT:
   170		case NETFS_BOUNCE_DEC_COPY:
   171			rreq->direct_iter = *iter;
   172			rreq->len = iov_iter_count(&rreq->direct_iter);
   173			break;
   174		case NETFS_DIRECT_BV:
   175		case NETFS_BOUNCE_DEC_TO_DIRECT_BV:
   176		case NETFS_BOUNCE_DEC_COPY_BV:
   177			n = extract_iter_to_iter(iter, rreq->len, &rreq->direct_iter,
   178						 &rreq->direct_bv);
   179			if (n < 0) {
   180				ret = n;
   181				goto out;
   182			}
   183			rreq->direct_bv_count = n;
   184			rreq->len = iov_iter_count(&rreq->direct_iter);
   185			break;
   186		default:
   187			BUG();
   188		}
   189	
   190		/* If we're going to use a bounce buffer, we need to set it up.  We
   191		 * will then need to pad the request out to the minimum block size.
   192		 */
   193		switch (rreq->buffering) {
   194		case NETFS_BOUNCE_DEC_TO_DIRECT:
   195		case NETFS_BOUNCE_DEC_COPY:
   196		case NETFS_BOUNCE_DEC_TO_DIRECT_BV:
   197		case NETFS_BOUNCE_DEC_COPY_BV:
   198			unsigned int min_bsize = 1ULL << ctx->min_bshift;
 > 199			unsigned long long start = round_down(rreq->start, min_bsize);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

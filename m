Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1CECA;
	Sat, 29 Jul 2023 02:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690599169; x=1722135169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fHiUHQfNlAuiSNydQcO4hB1YYhFRBL1KTeAdOnD/E+0=;
  b=ivcUPua1q15ooM4WsLDg51bvbspCJGhf9EA0LT880TQQd7VTLr4rEB/G
   UyqPtcyE1JsIOrwwJp+hubfsNANE9tQGZDDhoqYxZOrHkSiXcnbahFcQe
   v9d9s33u5gzuObyGlyukE+RoT/EOgORlOSg9OJk9vtZKsVZEMzjiAuxEw
   YmByc05M04bUkCYZzDFeJCxdpc5BYcVpuePk/XxwNbXDUOM+Aq2y88yc9
   8aF8PgJDmWu+lDWhctxhchd4iMX9sUVuOXaqTLqYmbcwbDJicBesyfgZR
   Eb+d/z7ihuoycNTcalXuxv5P20AElQf40EAo9Mq2ymk2OPUjYxavVBQch
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366191988"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="366191988"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="841531417"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="841531417"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 19:52:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPa4T-0003mN-0Q;
	Sat, 29 Jul 2023 02:52:45 +0000
Date: Sat, 29 Jul 2023 10:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] io_uring: set plug tags for same file
Message-ID: <202307291056.pTo10sJT-lkp@intel.com>
References: <20230728201449.3350962-3-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728201449.3350962-3-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-split-req-prep-and-submit-loops/20230729-042238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230728201449.3350962-3-kbusch%40meta.com
patch subject: [PATCH 3/3] io_uring: set plug tags for same file
config: s390-randconfig-r022-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291056.pTo10sJT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291056.pTo10sJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291056.pTo10sJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> io_uring/io_uring.c:2229:17: error: no member named 'nr_ios' in 'struct blk_plug'
                                   state->plug.nr_ios++;
                                   ~~~~~~~~~~~ ^
   12 warnings and 1 error generated.


vim +2229 io_uring/io_uring.c

  2151	
  2152	static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
  2153			       const struct io_uring_sqe *sqe)
  2154		__must_hold(&ctx->uring_lock)
  2155	{
  2156		const struct io_issue_def *def;
  2157		unsigned int sqe_flags;
  2158		int personality;
  2159		u8 opcode;
  2160	
  2161		/* req is partially pre-initialised, see io_preinit_req() */
  2162		req->opcode = opcode = READ_ONCE(sqe->opcode);
  2163		/* same numerical values with corresponding REQ_F_*, safe to copy */
  2164		req->flags = sqe_flags = READ_ONCE(sqe->flags);
  2165		req->cqe.user_data = READ_ONCE(sqe->user_data);
  2166		req->file = NULL;
  2167		req->rsrc_node = NULL;
  2168		req->task = current;
  2169	
  2170		if (unlikely(opcode >= IORING_OP_LAST)) {
  2171			req->opcode = 0;
  2172			return -EINVAL;
  2173		}
  2174		def = &io_issue_defs[opcode];
  2175		if (unlikely(sqe_flags & ~SQE_COMMON_FLAGS)) {
  2176			/* enforce forwards compatibility on users */
  2177			if (sqe_flags & ~SQE_VALID_FLAGS)
  2178				return -EINVAL;
  2179			if (sqe_flags & IOSQE_BUFFER_SELECT) {
  2180				if (!def->buffer_select)
  2181					return -EOPNOTSUPP;
  2182				req->buf_index = READ_ONCE(sqe->buf_group);
  2183			}
  2184			if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
  2185				ctx->drain_disabled = true;
  2186			if (sqe_flags & IOSQE_IO_DRAIN) {
  2187				if (ctx->drain_disabled)
  2188					return -EOPNOTSUPP;
  2189				io_init_req_drain(req);
  2190			}
  2191		}
  2192		if (unlikely(ctx->restricted || ctx->drain_active || ctx->drain_next)) {
  2193			if (ctx->restricted && !io_check_restriction(ctx, req, sqe_flags))
  2194				return -EACCES;
  2195			/* knock it to the slow queue path, will be drained there */
  2196			if (ctx->drain_active)
  2197				req->flags |= REQ_F_FORCE_ASYNC;
  2198			/* if there is no link, we're at "next" request and need to drain */
  2199			if (unlikely(ctx->drain_next) && !ctx->submit_state.link.head) {
  2200				ctx->drain_next = false;
  2201				ctx->drain_active = true;
  2202				req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
  2203			}
  2204		}
  2205	
  2206		if (!def->ioprio && sqe->ioprio)
  2207			return -EINVAL;
  2208		if (!def->iopoll && (ctx->flags & IORING_SETUP_IOPOLL))
  2209			return -EINVAL;
  2210	
  2211		if (def->needs_file) {
  2212			req->cqe.fd = READ_ONCE(sqe->fd);
  2213	
  2214			/*
  2215			 * Plug now if we have more than 2 IO left after this, and the
  2216			 * target is potentially a read/write to block based storage.
  2217			 */
  2218			if (def->plug) {
  2219				struct io_submit_state *state = &ctx->submit_state;
  2220	
  2221				if (state->need_plug) {
  2222					state->plug_started = true;
  2223					state->need_plug = false;
  2224					state->fd = req->cqe.fd;
  2225					blk_start_plug(&state->plug);
  2226				} else if (state->plug_started &&
  2227					   state->fd == req->cqe.fd &&
  2228					   !state->link.head) {
> 2229					state->plug.nr_ios++;
  2230				}
  2231			}
  2232		}
  2233	
  2234		personality = READ_ONCE(sqe->personality);
  2235		if (personality) {
  2236			int ret;
  2237	
  2238			req->creds = xa_load(&ctx->personalities, personality);
  2239			if (!req->creds)
  2240				return -EINVAL;
  2241			get_cred(req->creds);
  2242			ret = security_uring_override_creds(req->creds);
  2243			if (ret) {
  2244				put_cred(req->creds);
  2245				return ret;
  2246			}
  2247			req->flags |= REQ_F_CREDS;
  2248		}
  2249	
  2250		return def->prep(req, sqe);
  2251	}
  2252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

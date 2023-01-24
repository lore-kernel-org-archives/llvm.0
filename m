Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374147C;
	Tue, 24 Jan 2023 02:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674526896; x=1706062896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8QPsTrgA+203DpJLqO/x1wyZ8hFz3p+n3D7vU6rDKrA=;
  b=YFWY49D1F8enBVATNhah91Rf9OC616qMyIHszHpGCT6T1pv8jZ11rbZw
   cBDNkgQlPdWDMiy/oYIE1+n9iXnY2q6dgWUaJkkpKi5aVaNXAo1YIaaCM
   VuHVD4Oy6AyrP4J19KUqSD2tAidYl41aTANSex9xsrc0zTCwZfQDVVuFE
   r72nqTuj38TWxoWl7jQkCmFMen+HEF3vBwn/1rCCdHS7XnuYpxdGQXaYa
   pR7cdUB+XIvV62+eEF2zL+pocKCjB/NTvSqNgmBSc+LhbioUa3CdgCZUT
   QsObysZWdr8x8POiim4HEZSg531rg2LDTcSqP4wLZjuMuST6ZQsQyg9uf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="326250492"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="326250492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 18:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692448397"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="692448397"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 18:21:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK8wG-00063M-0o;
	Tue, 24 Jan 2023 02:21:32 +0000
Date: Tue, 24 Jan 2023 10:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [ammarfaizi2-block:axboe/linux-block/for-6.3/io_uring 37/41]
 io_uring/io_uring.c:2373:8: warning: 'const' type qualifier on return type
 has no effect
Message-ID: <202301241033.tfDwmUdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-6.3/io_uring
head:   73b62ca46fe7e10334f601643c2ccd4fca4a4874
commit: d5a6846a1c5fc7b864b63e90d136a3af6034e37c [37/41] io_uring: improve io_get_sqe
config: hexagon-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241033.tfDwmUdO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d5a6846a1c5fc7b864b63e90d136a3af6034e37c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-6.3/io_uring
        git checkout d5a6846a1c5fc7b864b63e90d136a3af6034e37c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> io_uring/io_uring.c:2373:8: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   static const bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
          ^~~~~~
   7 warnings generated.


vim +/const +2373 io_uring/io_uring.c

  2364	
  2365	/*
  2366	 * Fetch an sqe, if one is available. Note this returns a pointer to memory
  2367	 * that is mapped by userspace. This means that care needs to be taken to
  2368	 * ensure that reads are stable, as we cannot rely on userspace always
  2369	 * being a good citizen. If members of the sqe are validated and then later
  2370	 * used, it's important that those reads are done through READ_ONCE() to
  2371	 * prevent a re-load down the line.
  2372	 */
> 2373	static const bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
  2374	{
  2375		unsigned head, mask = ctx->sq_entries - 1;
  2376		unsigned sq_idx = ctx->cached_sq_head++ & mask;
  2377	
  2378		/*
  2379		 * The cached sq head (or cq tail) serves two purposes:
  2380		 *
  2381		 * 1) allows us to batch the cost of updating the user visible
  2382		 *    head updates.
  2383		 * 2) allows the kernel side to track the head on its own, even
  2384		 *    though the application is the one updating it.
  2385		 */
  2386		head = READ_ONCE(ctx->sq_array[sq_idx]);
  2387		if (likely(head < ctx->sq_entries)) {
  2388			/* double index for 128-byte SQEs, twice as long */
  2389			if (ctx->flags & IORING_SETUP_SQE128)
  2390				head <<= 1;
  2391			*sqe = &ctx->sq_sqes[head];
  2392			return true;
  2393		}
  2394	
  2395		/* drop invalid entries */
  2396		ctx->cq_extra--;
  2397		WRITE_ONCE(ctx->rings->sq_dropped,
  2398			   READ_ONCE(ctx->rings->sq_dropped) + 1);
  2399		return false;
  2400	}
  2401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

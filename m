Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482CB3BB20;
	Fri, 29 Mar 2024 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711693420; cv=none; b=QezykpjPQ/bekCS9qczmTFldxKwdftzP1iroLHVUjv7xVPKmYrxp+1Bc9gxaExdcBLaePvJcYX32QqgvTFHk8I0qY4wJID96emGMwsBxpKfB82MFVjppg4UQxSKCllFfLZCmYO1vpgnw2p+3hnbx6zLVziDqk7jP+ONFHTntkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711693420; c=relaxed/simple;
	bh=p4kHE8rODr2xlL4ztKNqmeD3hDSVlddAYyyJwKKhQtQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y7sFSQlJqq/6LNbklPpBvmcpxUJThkfrf8mYpEeMzlYHG7FzXQkjXEH2rQup7nuNTcb5eolW1roDtNlpFQkPxptlY0vCPaWiZLpawayTeGWCgGT59yOIzSeSRSqkvQ0K1g95q/IehSP0tTceIi1U/rD4FxSHw811ft0983L8900=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2WCnPVL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2WCnPVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711693418; x=1743229418;
  h=date:from:cc:subject:message-id:mime-version;
  bh=p4kHE8rODr2xlL4ztKNqmeD3hDSVlddAYyyJwKKhQtQ=;
  b=i2WCnPVL0uaV230tlLX9JhLOTH/wuNeMxsy7bM2uLmtnD74vs7Uef9jE
   QoSBlMF9DWbEATmR+QjxxXRfHkyR5WvFHn3sjD73oT1tbV7VcNtmyV5d9
   PvC8/fk4WLy9V09AyYScewMb9v9xRIO3vSuUZXwt9N3GrUNvkWTqb+a2t
   uMyo0Hp58Z9mRwNhDQce+x5ZEExuCAfi7bHQxFzhJJR5x3XbJPIt0NSES
   4AMM15gjbs1Vhk9GbdbrBiC8Cw4cMiW+E7xZg/RCoJV33lGglNKgOUX6y
   KTV7PB9Lleo4xFNyC0m8IrbaLbCSJ4Dq3lqk0RhiMIyvBC06EqemahBTF
   g==;
X-CSE-ConnectionGUID: N6B9HNH7QnSffwnpHdVIMQ==
X-CSE-MsgGUID: Z9HIBqZZQWGf+4tq+ZcPjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18258240"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="18258240"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 23:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="21553061"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2024 23:23:36 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq5eI-0002ud-1R;
	Fri, 29 Mar 2024 06:23:34 +0000
Date: Fri, 29 Mar 2024 14:23:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [axboe-block:for-6.10/io_uring 42/42] io_uring/register.c:175:24:
 warning: arithmetic between different enumeration types ('enum
 io_uring_register_restriction_op' and 'enum io_uring_register_op')
Message-ID: <202403291458.6AjzdI64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Gabriel Krisman Bertazi <krisman@suse.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.10/io_uring
head:   2c1b098239d277b21a006cc0c8009ad7bf1b6189
commit: 2c1b098239d277b21a006cc0c8009ad7bf1b6189 [42/42] io_uring: Avoid anonymous enums in io_uring uapi
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240329/202403291458.6AjzdI64-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291458.6AjzdI64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291458.6AjzdI64-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/register.c:29:
   In file included from io_uring/napi.h:8:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from io_uring/register.c:29:
   In file included from io_uring/napi.h:8:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from io_uring/register.c:29:
   In file included from io_uring/napi.h:8:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> io_uring/register.c:175:24: warning: arithmetic between different enumeration types ('enum io_uring_register_restriction_op' and 'enum io_uring_register_op') [-Wenum-enum-conversion]
     175 |         if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/register.c:31:58: note: expanded from macro 'IORING_MAX_RESTRICTIONS'
      31 | #define IORING_MAX_RESTRICTIONS (IORING_RESTRICTION_LAST + \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~ ^
      32 |                                  IORING_REGISTER_LAST + IORING_OP_LAST)
         |                                  ~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.


vim +175 io_uring/register.c

c43203154d8ac5 Jens Axboe 2023-12-19  159  
c43203154d8ac5 Jens Axboe 2023-12-19  160  static __cold int io_register_restrictions(struct io_ring_ctx *ctx,
c43203154d8ac5 Jens Axboe 2023-12-19  161  					   void __user *arg, unsigned int nr_args)
c43203154d8ac5 Jens Axboe 2023-12-19  162  {
c43203154d8ac5 Jens Axboe 2023-12-19  163  	struct io_uring_restriction *res;
c43203154d8ac5 Jens Axboe 2023-12-19  164  	size_t size;
c43203154d8ac5 Jens Axboe 2023-12-19  165  	int i, ret;
c43203154d8ac5 Jens Axboe 2023-12-19  166  
c43203154d8ac5 Jens Axboe 2023-12-19  167  	/* Restrictions allowed only if rings started disabled */
c43203154d8ac5 Jens Axboe 2023-12-19  168  	if (!(ctx->flags & IORING_SETUP_R_DISABLED))
c43203154d8ac5 Jens Axboe 2023-12-19  169  		return -EBADFD;
c43203154d8ac5 Jens Axboe 2023-12-19  170  
c43203154d8ac5 Jens Axboe 2023-12-19  171  	/* We allow only a single restrictions registration */
c43203154d8ac5 Jens Axboe 2023-12-19  172  	if (ctx->restrictions.registered)
c43203154d8ac5 Jens Axboe 2023-12-19  173  		return -EBUSY;
c43203154d8ac5 Jens Axboe 2023-12-19  174  
c43203154d8ac5 Jens Axboe 2023-12-19 @175  	if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
c43203154d8ac5 Jens Axboe 2023-12-19  176  		return -EINVAL;
c43203154d8ac5 Jens Axboe 2023-12-19  177  
c43203154d8ac5 Jens Axboe 2023-12-19  178  	size = array_size(nr_args, sizeof(*res));
c43203154d8ac5 Jens Axboe 2023-12-19  179  	if (size == SIZE_MAX)
c43203154d8ac5 Jens Axboe 2023-12-19  180  		return -EOVERFLOW;
c43203154d8ac5 Jens Axboe 2023-12-19  181  
c43203154d8ac5 Jens Axboe 2023-12-19  182  	res = memdup_user(arg, size);
c43203154d8ac5 Jens Axboe 2023-12-19  183  	if (IS_ERR(res))
c43203154d8ac5 Jens Axboe 2023-12-19  184  		return PTR_ERR(res);
c43203154d8ac5 Jens Axboe 2023-12-19  185  
c43203154d8ac5 Jens Axboe 2023-12-19  186  	ret = 0;
c43203154d8ac5 Jens Axboe 2023-12-19  187  
c43203154d8ac5 Jens Axboe 2023-12-19  188  	for (i = 0; i < nr_args; i++) {
c43203154d8ac5 Jens Axboe 2023-12-19  189  		switch (res[i].opcode) {
c43203154d8ac5 Jens Axboe 2023-12-19  190  		case IORING_RESTRICTION_REGISTER_OP:
c43203154d8ac5 Jens Axboe 2023-12-19  191  			if (res[i].register_op >= IORING_REGISTER_LAST) {
c43203154d8ac5 Jens Axboe 2023-12-19  192  				ret = -EINVAL;
c43203154d8ac5 Jens Axboe 2023-12-19  193  				goto out;
c43203154d8ac5 Jens Axboe 2023-12-19  194  			}
c43203154d8ac5 Jens Axboe 2023-12-19  195  
c43203154d8ac5 Jens Axboe 2023-12-19  196  			__set_bit(res[i].register_op,
c43203154d8ac5 Jens Axboe 2023-12-19  197  				  ctx->restrictions.register_op);
c43203154d8ac5 Jens Axboe 2023-12-19  198  			break;
c43203154d8ac5 Jens Axboe 2023-12-19  199  		case IORING_RESTRICTION_SQE_OP:
c43203154d8ac5 Jens Axboe 2023-12-19  200  			if (res[i].sqe_op >= IORING_OP_LAST) {
c43203154d8ac5 Jens Axboe 2023-12-19  201  				ret = -EINVAL;
c43203154d8ac5 Jens Axboe 2023-12-19  202  				goto out;
c43203154d8ac5 Jens Axboe 2023-12-19  203  			}
c43203154d8ac5 Jens Axboe 2023-12-19  204  
c43203154d8ac5 Jens Axboe 2023-12-19  205  			__set_bit(res[i].sqe_op, ctx->restrictions.sqe_op);
c43203154d8ac5 Jens Axboe 2023-12-19  206  			break;
c43203154d8ac5 Jens Axboe 2023-12-19  207  		case IORING_RESTRICTION_SQE_FLAGS_ALLOWED:
c43203154d8ac5 Jens Axboe 2023-12-19  208  			ctx->restrictions.sqe_flags_allowed = res[i].sqe_flags;
c43203154d8ac5 Jens Axboe 2023-12-19  209  			break;
c43203154d8ac5 Jens Axboe 2023-12-19  210  		case IORING_RESTRICTION_SQE_FLAGS_REQUIRED:
c43203154d8ac5 Jens Axboe 2023-12-19  211  			ctx->restrictions.sqe_flags_required = res[i].sqe_flags;
c43203154d8ac5 Jens Axboe 2023-12-19  212  			break;
c43203154d8ac5 Jens Axboe 2023-12-19  213  		default:
c43203154d8ac5 Jens Axboe 2023-12-19  214  			ret = -EINVAL;
c43203154d8ac5 Jens Axboe 2023-12-19  215  			goto out;
c43203154d8ac5 Jens Axboe 2023-12-19  216  		}
c43203154d8ac5 Jens Axboe 2023-12-19  217  	}
c43203154d8ac5 Jens Axboe 2023-12-19  218  
c43203154d8ac5 Jens Axboe 2023-12-19  219  out:
c43203154d8ac5 Jens Axboe 2023-12-19  220  	/* Reset all restrictions if an error happened */
c43203154d8ac5 Jens Axboe 2023-12-19  221  	if (ret != 0)
c43203154d8ac5 Jens Axboe 2023-12-19  222  		memset(&ctx->restrictions, 0, sizeof(ctx->restrictions));
c43203154d8ac5 Jens Axboe 2023-12-19  223  	else
c43203154d8ac5 Jens Axboe 2023-12-19  224  		ctx->restrictions.registered = true;
c43203154d8ac5 Jens Axboe 2023-12-19  225  
c43203154d8ac5 Jens Axboe 2023-12-19  226  	kfree(res);
c43203154d8ac5 Jens Axboe 2023-12-19  227  	return ret;
c43203154d8ac5 Jens Axboe 2023-12-19  228  }
c43203154d8ac5 Jens Axboe 2023-12-19  229  

:::::: The code at line 175 was first introduced by commit
:::::: c43203154d8ac579537aa0c7802b77d463b1f53a io_uring/register: move io_uring_register(2) related code to register.c

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

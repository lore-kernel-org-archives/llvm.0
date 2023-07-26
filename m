Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7A9464;
	Wed, 26 Jul 2023 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690367589; x=1721903589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h9cDIkRskiVQXh87xL9ZrnaGSfs6uLGEiTL5FCnVunU=;
  b=SrFLie1+gN+3zkWG9QVihSJbLKkf5b0lupKUXnOk7AqhPcmj+c5oKACf
   IcvAej4tpj4eAV/QG5bu5oH4B3565iVUaWqZK6a69uTTLmMyQkPOECs4n
   5+zgNLdwPVEMBpNWMn8KNW4aoM7ZDHZw9orod9MicGBgkI46mF9sr2CNg
   SSZ++mGek2Z0QbSmVb7sV4ZR8x3/PmFdoHk2F4bHNxFbIC0XlxMoID4Gf
   G3msU+CfS5CEXOZlZcyqetqihX6OlnDaDwWSPEw1YjMsG8iWXcYlMPiBm
   nbRBGzWArUYkDjA0pcsqt7SNGwzShvbl6JHcUUdQnhybfuexpXEQjan4D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454354089"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454354089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 03:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726490341"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="726490341"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 03:33:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qObpH-0000te-1f;
	Wed, 26 Jul 2023 10:33:03 +0000
Date: Wed, 26 Jul 2023 18:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/6] block/mq-deadline: Only use zone locking if
 necessary
Message-ID: <202307261811.g5Zde96H-lkp@intel.com>
References: <20230726005742.303865-3-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726005742.303865-3-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Introduce-the-flag-REQ_NO_WRITE_LOCK/20230726-085936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230726005742.303865-3-bvanassche%40acm.org
patch subject: [PATCH v3 2/6] block/mq-deadline: Only use zone locking if necessary
config: s390-randconfig-r044-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261811.g5Zde96H-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261811.g5Zde96H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261811.g5Zde96H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/mq-deadline.c:19:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from block/mq-deadline.c:19:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from block/mq-deadline.c:19:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
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
>> block/mq-deadline.c:349:10: error: call to undeclared function 'blk_queue_no_zone_write_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |         return !blk_queue_no_zone_write_lock(rq->q) ||
         |                 ^
   block/mq-deadline.c:349:10: note: did you mean 'blk_req_zone_write_lock'?
   include/linux/blk-mq.h:1213:20: note: 'blk_req_zone_write_lock' declared here
    1213 | static inline void blk_req_zone_write_lock(struct request *rq)
         |                    ^
   12 warnings and 1 error generated.


vim +/blk_queue_no_zone_write_lock +349 block/mq-deadline.c

   340	
   341	/*
   342	 * Use write locking if either QUEUE_FLAG_NO_ZONE_WRITE_LOCK or
   343	 * REQ_NO_ZONE_WRITE_LOCK has not been set. Not using zone write locking is
   344	 * only safe if the submitter allocates and submit requests in LBA order per
   345	 * zone and if the block driver preserves the request order.
   346	 */
   347	static bool dd_use_write_locking(struct request *rq)
   348	{
 > 349		return !blk_queue_no_zone_write_lock(rq->q) ||
   350			!(rq->cmd_flags & REQ_NO_ZONE_WRITE_LOCK);
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

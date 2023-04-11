Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516515A5;
	Tue, 11 Apr 2023 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681217112; x=1712753112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZOT9g6rY6Km+KMJUrj8mfuPA4kkVF+PoC3Y7pESUPPk=;
  b=MDl680qPbJlLBDImF+2NBqGHgjhhUn82M5BM0Bnf/sfy1JRspLolNEan
   2rY8zdLs93MF+o3ts7MIU/a4csXnyxYrLyjxNsPpvAbHLzfHOo8dxKtDR
   I8uB+UKQh46f1wQtHtDN8cgRPLXQpD0SUzTLWQib8NT5n9m9zEuDePDw/
   wLPOETsV/WpCfQMpPbD/i2WuzqTUooxXe6zaZvCqXIdRVo6fc6DLDLgSC
   m8TzVM58mD03nHZusTQIBGYIToslqF8AXv71+8/pXId57rmW5W9w8JhmC
   jgIyeVw+NDfE22p/lBsZq6YpFN8Go0++SoimomEeY16K+sEXIqkv2e6gX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406431288"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="406431288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 05:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753119994"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="753119994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 05:45:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmDMz-000WIn-2w;
	Tue, 11 Apr 2023 12:45:09 +0000
Date: Tue, 11 Apr 2023 20:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv2 8/8] ext2: Add direct-io trace points
Message-ID: <202304112001.80k5FIhj-lkp@intel.com>
References: <f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on xfs-linux/for-next jack-fs/for_next linus/master v6.3-rc6 next-20230411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/ext2-dax-Fix-ext2_setsize-when-len-is-page-aligned/20230411-132421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/f9825fab612761bee205046ce6e6e4caf25642ee.1681188927.git.ritesh.list%40gmail.com
patch subject: [RFCv2 8/8] ext2: Add direct-io trace points
config: arm-randconfig-r024-20230409 (https://download.01.org/0day-ci/archive/20230411/202304112001.80k5FIhj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/4fff7c561c76e8ee730b2b5ec288aeeb65ca449d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ritesh-Harjani-IBM/ext2-dax-Fix-ext2_setsize-when-len-is-page-aligned/20230411-132421
        git checkout 4fff7c561c76e8ee730b2b5ec288aeeb65ca449d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112001.80k5FIhj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/ext2/trace.c:5:
   In file included from fs/ext2/trace.h:61:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> fs/ext2/trace.h:39:5: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                     __entry->count,
                     ^~~~~~~~~~~~~~~
   include/trace/stages/stage3_trace_output.h:6:17: note: expanded from macro '__entry'
   #define __entry field
                   ^
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from fs/ext2/trace.c:5:
   In file included from fs/ext2/trace.h:61:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> fs/ext2/trace.h:29:27: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   __entry->count = iter ? iov_iter_count(iter) : ret;
                                           ^
   In file included from fs/ext2/trace.c:5:
   In file included from fs/ext2/trace.h:61:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> fs/ext2/trace.h:29:27: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   __entry->count = iter ? iov_iter_count(iter) : ret;
                                           ^
   1 warning and 2 errors generated.


vim +/iov_iter_count +29 fs/ext2/trace.h

    10	
    11	DECLARE_EVENT_CLASS(ext2_dio_class,
    12		TP_PROTO(struct kiocb *iocb, struct iov_iter *iter, int ret),
    13		TP_ARGS(iocb, iter, ret),
    14		TP_STRUCT__entry(
    15			__field(dev_t,	dev)
    16			__field(ino_t,	ino)
    17			__field(loff_t, isize)
    18			__field(loff_t, pos)
    19			__field(size_t,	count)
    20			__field(int,	ki_flags)
    21			__field(int,	aio)
    22			__field(int,	ret)
    23		),
    24		TP_fast_assign(
    25			__entry->dev = file_inode(iocb->ki_filp)->i_sb->s_dev;
    26			__entry->ino = file_inode(iocb->ki_filp)->i_ino;
    27			__entry->isize = file_inode(iocb->ki_filp)->i_size;
    28			__entry->pos = iocb->ki_pos;
  > 29			__entry->count = iter ? iov_iter_count(iter) : ret;
    30			__entry->ki_flags = iocb->ki_flags;
    31			__entry->aio = !is_sync_kiocb(iocb);
    32			__entry->ret = iter ? ret : 0;
    33		),
    34		TP_printk("dev %d:%d ino 0x%lx isize 0x%llx pos 0x%llx count %ld flags %s aio %d ret=%d",
    35			  MAJOR(__entry->dev), MINOR(__entry->dev),
    36			  __entry->ino,
    37			  __entry->isize,
    38			  __entry->pos,
  > 39			  __entry->count,
    40			  __print_flags(__entry->ki_flags, "|", IOCB_STRINGS),
    41			  __entry->aio,
    42			  __entry->ret)
    43	)
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

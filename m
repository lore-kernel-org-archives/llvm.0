Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9228E1
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652184094; x=1683720094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B/brSZ8VA+fipg0JzPf7jPIOY8IaqogbgPAbk6Aa2r0=;
  b=MvQz/i0JMAq+HRQqYAOmIZ1sw55u5aYibe4iuVUP2OA56anbB13DWGIa
   Jmf1pegHoIA9r4zchEJzbXVlggw3UN89n6ekzmcIaqObryWrV8Q9zjCuM
   BxYvgjIZ0b0kKbZvEh+TGo4898/qY8QYmTrm2LcCj/aZpLvy7+9ubIpV+
   obzH9feLFe0vtqc2oWBKmMGoCyRdxBQ7w7Oke6aCJ3UBUrLaf+Wq+AF29
   hyDLtwV4jQNTQ/a+6koUzErSAiMWs0ZviekNOKdd6Jm7WtaWTLtM5gIxE
   MF9+5/65odzUyncDrMfLHtFCcILRYHox3L9o5GRM45Yar8hjtJwiH2zGC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355777397"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="355777397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 05:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="669845776"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2022 05:01:32 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noOYV-000Hqm-MJ;
	Tue, 10 May 2022 12:01:31 +0000
Date: Tue, 10 May 2022 20:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] ubd: add io_uring based userspace block driver
Message-ID: <202205101918.YlbroRMh-lkp@intel.com>
References: <20220509092312.254354-1-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509092312.254354-1-ming.lei@redhat.com>

Hi Ming,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/ubd-add-io_uring-based-userspace-block-driver/20220509-173452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: x86_64-randconfig-a003-20220509 (https://download.01.org/0day-ci/archive/20220510/202205101918.YlbroRMh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/898085c9876d078827ba8b3447e5d1ae4626d092
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/ubd-add-io_uring-based-userspace-block-driver/20220509-173452
        git checkout 898085c9876d078827ba8b3447e5d1ae4626d092
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ubd_cmd.h:69:2: error: unknown type name '__u16'
           __u16   nr_hw_queues;
           ^
   ./usr/include/linux/ubd_cmd.h:70:2: error: unknown type name '__u16'
           __u16   queue_depth;
           ^
   ./usr/include/linux/ubd_cmd.h:71:2: error: unknown type name '__u16'
           __u16   block_size;
           ^
   ./usr/include/linux/ubd_cmd.h:72:2: error: unknown type name '__u16'
           __u16   state;
           ^
>> ./usr/include/linux/ubd_cmd.h:74:2: error: unknown type name '__u32'
           __u32   rq_max_blocks;
           ^
   ./usr/include/linux/ubd_cmd.h:75:2: error: unknown type name '__u32'
           __u32   dev_id;
           ^
>> ./usr/include/linux/ubd_cmd.h:77:2: error: unknown type name '__u64'
           __u64   dev_blocks;
           ^
   ./usr/include/linux/ubd_cmd.h:78:2: error: unknown type name '__u64'
           __u64   flags;
           ^
   ./usr/include/linux/ubd_cmd.h:87:2: error: unknown type name '__u64'
           __u64   addr;
           ^
   ./usr/include/linux/ubd_cmd.h:88:2: error: unknown type name '__u32'
           __u32   len;
           ^
>> ./usr/include/linux/ubd_cmd.h:89:2: error: unknown type name '__s32'
           __s32   ubdsrv_pid;
           ^
   ./usr/include/linux/ubd_cmd.h:90:2: error: unknown type name '__u64'
           __u64   reserved0[2];
           ^
   ./usr/include/linux/ubd_cmd.h:119:2: error: unknown type name '__u32'
           __u32           op_flags;
           ^
   ./usr/include/linux/ubd_cmd.h:126:2: error: unknown type name '__u32'
           __u32           tag_blocks;
           ^
   ./usr/include/linux/ubd_cmd.h:129:2: error: unknown type name '__u64'
           __u64           start_block;
           ^
   ./usr/include/linux/ubd_cmd.h:132:2: error: unknown type name '__u64'
           __u64           addr;
           ^
>> ./usr/include/linux/ubd_cmd.h:135:19: error: unknown type name '__u8'
   static __inline__ __u8 ubdsrv_get_op(const struct ubdsrv_io_desc *iod)
                     ^
   ./usr/include/linux/ubd_cmd.h:140:19: error: unknown type name '__u32'
   static __inline__ __u32 ubdsrv_get_flags(const struct ubdsrv_io_desc *iod)
                     ^
   ./usr/include/linux/ubd_cmd.h:145:19: error: unknown type name '__u32'
   static __inline__ __u32 ubdsrv_get_blocks(const struct ubdsrv_io_desc *iod)
                     ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

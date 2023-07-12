Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBCD1F95D;
	Wed, 12 Jul 2023 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689185271; x=1720721271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yDkuMjZNGtdda7DZSvhyQbdXd+uBzDWAOBXe1xlhPQ=;
  b=Y0HW1pRXU2Va6SbUf9/AyY9Tl/LvHZzRKIIvB/qy6htahxJuFhHqbe9v
   5St+bQUKI6SI6DyhNeqN2c8sywQFf7iQunyr+Ll7nuxSkckCi9BHCoCqj
   k3PCLwOEoDNR2ULdHOZ3V1F8AviSSJwTG97m+7JUOtiiVAns1xyt1cZcj
   eBNJlahph9wR5gOhhbOyOYKKofDYnJqrnkTTCeir4QRZjEctth2yASVFh
   2HjjIvM4205gp1seffpxYczX8D7gu9Jqsu/0D7uS6ygD1D+Eoj8wZSBQ5
   1/XbJB7k2GNeNPBjS0O1vMVEUP3pJLHfUg4hKRfGnewqn19fEQg3aHeMM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364999529"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="364999529"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 11:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="845739443"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="845739443"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2023 11:06:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJeDz-0005u7-2V;
	Wed, 12 Jul 2023 18:06:03 +0000
Date: Thu, 13 Jul 2023 02:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 1/2] net/sched/cls_flow.c:64:52: warning:
 shift count >= width of type
Message-ID: <202307130250.0Crvg0Sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux net/defer-free
head:   bc14c0e28995a8d2a7c5c481a90973553861cbe2
commit: c3205b3c22a6b7d0147dd98c1c0a4888436efe73 [1/2] net/core: lockless defer free
config: i386-randconfig-i014-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130250.0Crvg0Sm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130250.0Crvg0Sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130250.0Crvg0Sm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sched/cls_flow.c:17:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
           u128    full;
           ^
>> net/sched/cls_flow.c:64:52: warning: shift count >= width of type [-Wshift-count-overflow]
           return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
                                                             ^  ~~
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/sfc/tx_tso.c:9:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
           u128    full;
           ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:246:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:246:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:246:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:246:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:245:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:245:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:245:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:252:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) >> (min - low))))
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:256:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
            ^
   drivers/net/ethernet/sfc/bitfield.h:245:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
             (((u64) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count is negative [-Wshift-count-negative]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:257:3: note: expanded from macro 'EFX_INSERT_NATIVE'
            EFX_INSERT_NATIVE32(min, max, low, high, value))
            ^
   drivers/net/ethernet/sfc/bitfield.h:251:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
             (((u32) (value)) << (low - min)) :            \
                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/net/ethernet/sfc/tx_tso.c:312:2: warning: shift count >= width of type [-Wshift-count-overflow]
           EFX_POPULATE_QWORD_5(buffer->option,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:430:2: note: expanded from macro 'EFX_POPULATE_QWORD_5'
           EFX_POPULATE_QWORD_6(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:428:2: note: expanded from macro 'EFX_POPULATE_QWORD_6'
           EFX_POPULATE_QWORD_7(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:426:2: note: expanded from macro 'EFX_POPULATE_QWORD_7'
           EFX_POPULATE_QWORD_8(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 17 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
..


vim +64 net/sched/cls_flow.c

e5dfb815181fcb Patrick McHardy 2008-01-31  59  
e5dfb815181fcb Patrick McHardy 2008-01-31  60  static inline u32 addr_fold(void *addr)
e5dfb815181fcb Patrick McHardy 2008-01-31  61  {
e5dfb815181fcb Patrick McHardy 2008-01-31  62  	unsigned long a = (unsigned long)addr;
e5dfb815181fcb Patrick McHardy 2008-01-31  63  
e5dfb815181fcb Patrick McHardy 2008-01-31 @64  	return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
e5dfb815181fcb Patrick McHardy 2008-01-31  65  }
e5dfb815181fcb Patrick McHardy 2008-01-31  66  

:::::: The code at line 64 was first introduced by commit
:::::: e5dfb815181fcb186d6080ac3a091eadff2d98fe [NET_SCHED]: Add flow classifier

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

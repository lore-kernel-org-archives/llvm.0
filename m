Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA251841
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663726097; x=1695262097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zC4viNa1Lr72rJ8M7hC3sVcUFvoe6/8OK8usu0m8Wr4=;
  b=QkMGb+fs8/I/efVwK7S/fkOgglp6vfH84nNMb+RBiCyiJGk9eeECCfBN
   tAiZJEGLWVJWeQUetTMzsQzZ+5uRtW/bgIJ8iZpGOyKc0ojwQVAmhb/JX
   eGVw/4Smc6PCn0b8cJZMiGOXhYWH+in5woby9I9cAcBlGvqXlmgvEHAtN
   jqdoVTMexBVOXtwrvxw2kuO+8amhG0HQ8nu1FiZRb1nHUuTsVLPyHnFRz
   S20YGJlvQGdp+FmzE6XNZ4Vg3zJJNvCI+EGHlZxRrljTAucd3NtB4SolX
   SsVi61q6JcMmyB5VoSe3ygXwPwQ9qP4J/PQ9/fvZ02ei2Wi68qtKue38z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282919068"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="282919068"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 19:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="794490059"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Sep 2022 19:08:15 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oap9q-00037p-1w;
	Wed, 21 Sep 2022 02:08:14 +0000
Date: Wed, 21 Sep 2022 10:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmytro Shytyi <dmytro@shytyi.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH mptcp-next v8 3/7] reuse tcp_sendmsg_fastopen()
Message-ID: <202209210945.AC7D79Qb-lkp@intel.com>
References: <20220920125243.2880-4-dmytro@shytyi.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920125243.2880-4-dmytro@shytyi.net>

Hi Dmytro,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[cannot apply to shuah-kselftest/next linus/master v6.0-rc6 next-20220920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmytro-Shytyi/mptcp-Fast-Open-Mechanism/20220920-205817
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: s390-randconfig-r035-20220921 (https://download.01.org/0day-ci/archive/20220921/202209210945.AC7D79Qb-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0196a0ed5930975013f9dc240d52b0b10e849b98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmytro-Shytyi/mptcp-Fast-Open-Mechanism/20220920-205817
        git checkout 0196a0ed5930975013f9dc240d52b0b10e849b98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:250:8: error: redefinition of 'mptcp_sock'
   struct mptcp_sock {
          ^
   include/net/mptcp.h:315:8: note: previous definition is here
   struct mptcp_sock { };
          ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:310:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:317:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:336:41: error: invalid operands to binary expression ('int' and 'void')
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:310:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:317:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/ipv4/tcp.c:284:
>> net/ipv4/../mptcp/protocol.h:348:9: error: returning 'void' from a function with incompatible result type 'struct mptcp_data_frag *'
           return READ_ONCE(msk->first_pending);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
   #define READ_ONCE(x)                                                    \
                                                                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   12 warnings and 20 errors generated.


vim +/mptcp_sock +250 net/ipv4/../mptcp/protocol.h

18b683bff89d46 Paolo Abeni      2020-03-27  248  
f870fa0b576884 Mat Martineau    2020-01-21  249  /* MPTCP connection sock */
f870fa0b576884 Mat Martineau    2020-01-21 @250  struct mptcp_sock {
f870fa0b576884 Mat Martineau    2020-01-21  251  	/* inet_connection_sock must be the first member */
f870fa0b576884 Mat Martineau    2020-01-21  252  	struct inet_connection_sock sk;
cec37a6e41aae7 Peter Krystad    2020-01-21  253  	u64		local_key;
cec37a6e41aae7 Peter Krystad    2020-01-21  254  	u64		remote_key;
6d0060f600adfd Mat Martineau    2020-01-21  255  	u64		write_seq;
eaa2ffabfc3558 Paolo Abeni      2020-11-16  256  	u64		snd_nxt;
6d0060f600adfd Mat Martineau    2020-01-21  257  	u64		ack_seq;
f3589be0c420a3 Paolo Abeni      2022-05-04  258  	atomic64_t	rcv_wnd_sent;
3721b9b64676b3 Mat Martineau    2020-07-28  259  	u64		rcv_data_fin_seq;
6511882cdd82d6 Paolo Abeni      2021-10-26  260  	int		rmem_fwd_alloc;
d5f49190def61c Paolo Abeni      2020-09-14  261  	struct sock	*last_snd;
d5f49190def61c Paolo Abeni      2020-09-14  262  	int		snd_burst;
ea4ca586b16ff2 Paolo Abeni      2020-11-19  263  	int		old_wspace;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  264  	u64		recovery_snd_nxt;	/* in recovery mode accept up to this seq;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  265  						 * recovery related fields are under data_lock
1e1d9d6f119c55 Paolo Abeni      2021-08-13  266  						 * protection
1e1d9d6f119c55 Paolo Abeni      2021-08-13  267  						 */
7439d687b79cbb Paolo Abeni      2020-11-27  268  	u64		snd_una;
7439d687b79cbb Paolo Abeni      2020-11-27  269  	u64		wnd_end;
b51f9b80c032e1 Paolo Abeni      2020-03-27  270  	unsigned long	timer_ival;
79c0949e9a09f6 Peter Krystad    2020-01-21  271  	u32		token;
879526030c8b5e Paolo Abeni      2020-11-27  272  	int		rmem_released;
648ef4b88673da Mat Martineau    2020-01-21  273  	unsigned long	flags;
e9d09baca67625 Paolo Abeni      2022-01-06  274  	unsigned long	cb_flags;
e9d09baca67625 Paolo Abeni      2022-01-06  275  	unsigned long	push_pending;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  276  	bool		recovery;		/* closing subflow write queue reinjected */
d22f4988ffecbe Christoph Paasch 2020-01-21  277  	bool		can_ack;
b93df08ccda326 Paolo Abeni      2020-07-23  278  	bool		fully_established;
3721b9b64676b3 Mat Martineau    2020-07-28  279  	bool		rcv_data_fin;
7279da6145bbb2 Mat Martineau    2020-07-28  280  	bool		snd_data_fin_enable;
50c504a20a754c Florian Westphal 2020-12-10  281  	bool		rcv_fastclose;
37198e93ced707 Davide Caratti   2020-10-06  282  	bool		use_64bit_ack; /* Set when we received a 64-bit DSN */
752e906732c694 Geliang Tang     2021-06-17  283  	bool		csum_enabled;
0530020a7c8f22 Geliang Tang     2022-04-22  284  	bool		allow_infinite_fallback;
3ad14f54bd7448 Paolo Abeni      2022-07-11  285  	u8		mpc_endpoint_id;
4f6e14bd19d6de Maxim Galaganov  2021-12-03  286  	u8		recvmsg_inq:1,
4f6e14bd19d6de Maxim Galaganov  2021-12-03  287  			cork:1,
4f6e14bd19d6de Maxim Galaganov  2021-12-03  288  			nodelay:1;
80992017150b4e Paolo Abeni      2020-02-26  289  	struct work_struct work;
ab174ad8ef7627 Paolo Abeni      2020-09-14  290  	struct sk_buff  *ooo_last_skb;
ab174ad8ef7627 Paolo Abeni      2020-09-14  291  	struct rb_root  out_of_order_queue;
879526030c8b5e Paolo Abeni      2020-11-27  292  	struct sk_buff_head receive_queue;
cec37a6e41aae7 Peter Krystad    2020-01-21  293  	struct list_head conn_list;
18b683bff89d46 Paolo Abeni      2020-03-27  294  	struct list_head rtx_queue;
f0e6a4cf11f164 Paolo Abeni      2020-11-16  295  	struct mptcp_data_frag *first_pending;
ec3edaa7ca6ce0 Peter Krystad    2020-03-27  296  	struct list_head join_list;
f870fa0b576884 Mat Martineau    2020-01-21  297  	struct socket	*subflow; /* outgoing connect/listener/!mp_capable */
8ab183deb26a3b Paolo Abeni      2020-01-21  298  	struct sock	*first;
1b1c7a0ef7f323 Peter Krystad    2020-03-27  299  	struct mptcp_pm_data	pm;
a6deddbeb5662f Geliang Tang     2022-09-20  300  	struct mptcp_sched_ops	*sched;
a6b118febbab3f Florian Westphal 2020-06-30  301  	struct {
a6b118febbab3f Florian Westphal 2020-06-30  302  		u32	space;	/* bytes copied in last measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  303  		u32	copied; /* bytes copied in this measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  304  		u64	time;	/* start time of measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  305  		u64	rtt_us; /* last maximum rtt of subflows */
a6b118febbab3f Florian Westphal 2020-06-30  306  	} rcvq_space;
df00b087da24c0 Florian Westphal 2021-04-15  307  
df00b087da24c0 Florian Westphal 2021-04-15  308  	u32 setsockopt_seq;
20b5759f21cf53 Paolo Abeni      2021-05-25  309  	char		ca_name[TCP_CA_NAME_MAX];
6aeed9045071f2 Paolo Abeni      2022-06-27  310  	struct mptcp_sock	*dl_next;
f870fa0b576884 Mat Martineau    2020-01-21  311  };
f870fa0b576884 Mat Martineau    2020-01-21  312  
879526030c8b5e Paolo Abeni      2020-11-27  313  #define mptcp_data_lock(sk) spin_lock_bh(&(sk)->sk_lock.slock)
879526030c8b5e Paolo Abeni      2020-11-27  314  #define mptcp_data_unlock(sk) spin_unlock_bh(&(sk)->sk_lock.slock)
879526030c8b5e Paolo Abeni      2020-11-27  315  
cec37a6e41aae7 Peter Krystad    2020-01-21  316  #define mptcp_for_each_subflow(__msk, __subflow)			\
cec37a6e41aae7 Peter Krystad    2020-01-21  317  	list_for_each_entry(__subflow, &((__msk)->conn_list), node)
5efbf6f7f076c6 Matthieu Baerts  2022-09-06  318  #define mptcp_for_each_subflow_safe(__msk, __subflow, __tmp)			\
5efbf6f7f076c6 Matthieu Baerts  2022-09-06  319  	list_for_each_entry_safe(__subflow, __tmp, &((__msk)->conn_list), node)
cec37a6e41aae7 Peter Krystad    2020-01-21  320  
3abc05d9ef6fe9 Florian Westphal 2021-02-04  321  static inline void msk_owned_by_me(const struct mptcp_sock *msk)
3abc05d9ef6fe9 Florian Westphal 2021-02-04  322  {
3abc05d9ef6fe9 Florian Westphal 2021-02-04  323  	sock_owned_by_me((const struct sock *)msk);
3abc05d9ef6fe9 Florian Westphal 2021-02-04  324  }
3abc05d9ef6fe9 Florian Westphal 2021-02-04  325  
f870fa0b576884 Mat Martineau    2020-01-21  326  static inline struct mptcp_sock *mptcp_sk(const struct sock *sk)
f870fa0b576884 Mat Martineau    2020-01-21  327  {
f870fa0b576884 Mat Martineau    2020-01-21  328  	return (struct mptcp_sock *)sk;
f870fa0b576884 Mat Martineau    2020-01-21  329  }
f870fa0b576884 Mat Martineau    2020-01-21  330  
ce599c516386f0 Paolo Abeni      2021-07-09  331  /* the msk socket don't use the backlog, also account for the bulk
ce599c516386f0 Paolo Abeni      2021-07-09  332   * free memory
ce599c516386f0 Paolo Abeni      2021-07-09  333   */
ce599c516386f0 Paolo Abeni      2021-07-09  334  static inline int __mptcp_rmem(const struct sock *sk)
ce599c516386f0 Paolo Abeni      2021-07-09  335  {
ce599c516386f0 Paolo Abeni      2021-07-09 @336  	return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
ce599c516386f0 Paolo Abeni      2021-07-09  337  }
ce599c516386f0 Paolo Abeni      2021-07-09  338  
ea4ca586b16ff2 Paolo Abeni      2020-11-19  339  static inline int __mptcp_space(const struct sock *sk)
ea4ca586b16ff2 Paolo Abeni      2020-11-19  340  {
ce599c516386f0 Paolo Abeni      2021-07-09  341  	return tcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf) - __mptcp_rmem(sk));
ea4ca586b16ff2 Paolo Abeni      2020-11-19  342  }
ea4ca586b16ff2 Paolo Abeni      2020-11-19  343  
f0e6a4cf11f164 Paolo Abeni      2020-11-16  344  static inline struct mptcp_data_frag *mptcp_send_head(const struct sock *sk)
f0e6a4cf11f164 Paolo Abeni      2020-11-16  345  {
f0e6a4cf11f164 Paolo Abeni      2020-11-16  346  	const struct mptcp_sock *msk = mptcp_sk(sk);
f0e6a4cf11f164 Paolo Abeni      2020-11-16  347  
f0e6a4cf11f164 Paolo Abeni      2020-11-16 @348  	return READ_ONCE(msk->first_pending);
f0e6a4cf11f164 Paolo Abeni      2020-11-16  349  }
f0e6a4cf11f164 Paolo Abeni      2020-11-16  350  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

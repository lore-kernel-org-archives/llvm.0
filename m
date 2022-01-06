Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19052168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641508415; x=1673044415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0hxPNB8lYSFLH56ZxJAo1cZH2PLI5TOJWjnmA+HpPE=;
  b=el0HZaZ96f83byP4RYw9+QeOcUwKaOIA1GG2CUwSAG9BZgF5DgcxwD6N
   /QdnxW+jWT1qvME0l5YL4PaKkXjeH01Cd4MVHmFTyaZLJR9v22vPzOiJC
   kjjoatFzwUNwmLHMZEnlV1N6zpN/BUoJjrtN6QenqomvlcSlNP5qAUvJC
   RYF7dbgf/m6/jei+lvxYjBJCD9ia5TLY22ZzZyRHr1eYzjLZ8+uECHRb2
   ezPS4Edl1ZqzuanDJvXayYZhJZjdiWvIE1pe3unKg8WvshOQFbmMdwx+k
   78N5t+LR3T0TC8tthP5ZBtDkGUIXbWWhe6eYS3Mv4qzKr7/sBfBDfxP1q
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242707490"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="242707490"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 14:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="621674464"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Jan 2022 14:33:32 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5bK8-000I2j-5U; Thu, 06 Jan 2022 22:33:32 +0000
Date: Fri, 7 Jan 2022 06:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: trix@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] netfilter: extend CONFIG_NF_CONNTRACK compile time checks
Message-ID: <202201070628.TYEi5Ci1-lkp@intel.com>
References: <20211225173744.3318250-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211225173744.3318250-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf-next/master]
[also build test WARNING on nf/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/trix-redhat-com/netfilter-extend-CONFIG_NF_CONNTRACK-compile-time-checks/20211226-013859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
config: riscv-randconfig-c006-20220102 (https://download.01.org/0day-ci/archive/20220107/202201070628.TYEi5Ci1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a827ea6de0cbe0f5faef4407552ede31d165c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/af999786d4f517635dbdb5f6d75e68bdcb5f7cb1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review trix-redhat-com/netfilter-extend-CONFIG_NF_CONNTRACK-compile-time-checks/20211226-013859
        git checkout af999786d4f517635dbdb5f6d75e68bdcb5f7cb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netfilter/nfnetlink_queue.c:393:23: warning: variable 'nfnl_ct' set but not used [-Wunused-but-set-variable]
           struct nfnl_ct_hook *nfnl_ct;
                                ^
   net/netfilter/nfnetlink_queue.c:1178:23: warning: variable 'nfnl_ct' set but not used [-Wunused-but-set-variable]
           struct nfnl_ct_hook *nfnl_ct;
                                ^
   2 warnings generated.


clang-analyzer warnings: (new ones prefixed by >>)
                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/staging/axis-fifo/axis-fifo.c:552:10: note: '?' condition is true
                   copy = min(words_to_write, WRITE_BUF_SIZE);
                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/staging/axis-fifo/axis-fifo.c:554:7: note: Calling 'copy_from_user'
                   if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >= 0
           if (unlikely(sz >= 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >= 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes', which participates in a condition later
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >= 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/staging/axis-fifo/axis-fifo.c:554:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/axis-fifo/axis-fifo.c:554:7: note: Assuming the condition is false
                   if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/axis-fifo/axis-fifo.c:554:3: note: Taking false branch
                   if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
                   ^
   drivers/staging/axis-fifo/axis-fifo.c:561:8: note: The value 0 is assigned to 'i'
                   for (i = 0; i < copy; i++)
                        ^~~~~
   drivers/staging/axis-fifo/axis-fifo.c:561:15: note: 'i' is < 'copy'
                   for (i = 0; i < copy; i++)
                               ^
   drivers/staging/axis-fifo/axis-fifo.c:561:3: note: Loop condition is true.  Entering loop body
                   for (i = 0; i < copy; i++)
                   ^
   drivers/staging/axis-fifo/axis-fifo.c:562:4: note: 1st function call argument is an uninitialized value
                           iowrite32(tmp_buf[i], fifo->base_addr +
                           ^         ~~~~~~~~~~
   include/asm-generic/io.h:759:19: note: expanded from macro 'iowrite32'
   #define iowrite32 iowrite32
                     ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> net/netfilter/nfnetlink_queue.c:446:2: warning: Value stored to 'nfnl_ct' is never read [clang-analyzer-deadcode.DeadStores]
           nfnl_ct = rcu_dereference(nfnl_ct_hook);
           ^
   net/netfilter/nfnetlink_queue.c:446:2: note: Value stored to 'nfnl_ct' is never read
   net/netfilter/nfnetlink_queue.c:1202:2: warning: Value stored to 'nfnl_ct' is never read [clang-analyzer-deadcode.DeadStores]
           nfnl_ct = rcu_dereference(nfnl_ct_hook);
           ^
   net/netfilter/nfnetlink_queue.c:1202:2: note: Value stored to 'nfnl_ct' is never read
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/netfilter/nfnetlink_log.c:574:45: warning: Access to field 'type' results in a dereference of a null pointer (loaded from field 'dev') [clang-analyzer-core.NullDereference]
                   if (nla_put_be16(inst->skb, NFULA_HWTYPE, htons(skb->dev->type)) ||
                                                             ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'htons'
   #define htons(x) ___htons(x)
                    ^        ~
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^             ~
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^         ~
   include/uapi/linux/swab.h:105:31: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
                                        ^~
   net/netfilter/nfnetlink_log.c:466:28: note: '?' condition is false
                              0, pf, NFNETLINK_V0, htons(inst->group_num));
                                                   ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'htons'
   #define htons(x) ___htons(x)
                    ^
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   net/netfilter/nfnetlink_log.c:464:8: note: Calling 'nfnl_msg_put'
           nlh = nfnl_msg_put(inst->skb, 0, 0,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:86:8: note: Calling 'nlmsg_put'
           nlh = nlmsg_put(skb, portid, seq, type, sizeof(struct nfgenmsg), flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:917:15: note: Assuming the condition is false
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/net/netlink.h:917:2: note: Taking false branch
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
           ^
   include/net/netlink.h:920:2: note: Returning pointer, which participates in a condition later
           return __nlmsg_put(skb, portid, seq, type, payload, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:86:8: note: Returning from 'nlmsg_put'
           nlh = nlmsg_put(skb, portid, seq, type, sizeof(struct nfgenmsg), flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:87:6: note: Assuming 'nlh' is non-null, which participates in a condition later
           if (!nlh)
               ^~~~
   include/linux/netfilter/nfnetlink.h:87:2: note: Taking false branch
           if (!nlh)
           ^
   include/linux/netfilter/nfnetlink.h:92:2: note: Returning pointer (loaded from 'nlh'), which participates in a condition later
           return nlh;
           ^~~~~~~~~~
   net/netfilter/nfnetlink_log.c:464:8: note: Returning from 'nfnl_msg_put'
           nlh = nfnl_msg_put(inst->skb, 0, 0,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nfnetlink_log.c:467:7: note: 'nlh' is non-null
           if (!nlh)
                ^~~
   net/netfilter/nfnetlink_log.c:467:2: note: Taking false branch
           if (!nlh)
           ^
   net/netfilter/nfnetlink_log.c:474:6: note: Assuming the condition is false
           if (nla_put(inst->skb, NFULA_PACKET_HDR, sizeof(pmsg), &pmsg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nfnetlink_log.c:474:2: note: Taking false branch
           if (nla_put(inst->skb, NFULA_PACKET_HDR, sizeof(pmsg), &pmsg))
           ^
   net/netfilter/nfnetlink_log.c:477:6: note: Assuming 'prefix' is null
           if (prefix &&
               ^~~~~~
   net/netfilter/nfnetlink_log.c:477:13: note: Left side of '&&' is false
           if (prefix &&
                      ^
   net/netfilter/nfnetlink_log.c:481:6: note: Assuming 'indev' is non-null
           if (indev) {
               ^~~~~
   net/netfilter/nfnetlink_log.c:481:2: note: Taking true branch
           if (indev) {
           ^
   net/netfilter/nfnetlink_log.c:484:6: note: '?' condition is false
                                    htonl(indev->ifindex)))
                                    ^
--
                                         ^
   include/linux/container_of.h:17:41: note: expanded from macro 'container_of'
   #define container_of(ptr, type, member) ({                              \
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:2190:13: note: Calling 'rt6_nexthop'
                   nexthop = rt6_nexthop(container_of(dst, struct rt6_info, dst),
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ip6_route.h:297:6: note: Access to field 'rt6i_flags' results in a dereference of a null pointer (loaded from variable 'rt')
           if (rt->rt6i_flags & RTF_GATEWAY)
               ^~
   net/core/filter.c:1736:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(to, 0, len);
           ^
   net/core/filter.c:10286:57: note: Passing value via 3rd parameter 'to'
           return ____bpf_skb_load_bytes(reuse_kern->skb, offset, to, len);
                                                                  ^~
   net/core/filter.c:10286:9: note: Calling '____bpf_skb_load_bytes'
           return ____bpf_skb_load_bytes(reuse_kern->skb, offset, to, len);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:1725:15: note: Assuming 'offset' is <= 65535
           if (unlikely(offset > 0xffff))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1725:2: note: Taking false branch
           if (unlikely(offset > 0xffff))
           ^
   net/core/filter.c:1729:15: note: Assuming 'ptr' is null
           if (unlikely(!ptr))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1729:2: note: Taking true branch
           if (unlikely(!ptr))
           ^
   net/core/filter.c:1730:3: note: Control jumps to line 1736
                   goto err_clear;
                   ^
   net/core/filter.c:1736:2: note: Null pointer passed as 1st argument to memory set function
           memset(to, 0, len);
           ^      ~~
   net/core/filter.c:1770:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(to, 0, len);
           ^      ~~
   net/core/filter.c:1756:15: note: Assuming 'offset' is <= 65535
           if (unlikely(offset > 0xffff))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1756:2: note: Taking false branch
           if (unlikely(offset > 0xffff))
           ^
   net/core/filter.c:1759:15: note: Assuming field 'skb' is non-null
           if (unlikely(!ctx->skb))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1759:2: note: Taking false branch
           if (unlikely(!ctx->skb))
           ^
   net/core/filter.c:1763:15: note: Assuming 'ptr' is null
           if (unlikely(!ptr))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1763:2: note: Taking true branch
           if (unlikely(!ptr))
           ^
   net/core/filter.c:1764:3: note: Control jumps to line 1770
                   goto err_clear;
                   ^
   net/core/filter.c:1770:2: note: Null pointer passed as 1st argument to memory set function
           memset(to, 0, len);
           ^      ~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/netfilter/nfnetlink.c:429:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err = -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:429:4: note: Value stored to 'err' is never read
                           err = -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:436:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = 0;
                   ^     ~
   net/netfilter/nfnetlink.c:436:3: note: Value stored to 'err' is never read
                   err = 0;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> net/netfilter/nfnetlink_queue.c:446:2: warning: Value stored to 'nfnl_ct' is never read [clang-analyzer-deadcode.DeadStores]
           nfnl_ct = rcu_dereference(nfnl_ct_hook);
           ^
   net/netfilter/nfnetlink_queue.c:446:2: note: Value stored to 'nfnl_ct' is never read
   net/netfilter/nfnetlink_queue.c:1202:2: warning: Value stored to 'nfnl_ct' is never read [clang-analyzer-deadcode.DeadStores]
           nfnl_ct = rcu_dereference(nfnl_ct_hook);
           ^
   net/netfilter/nfnetlink_queue.c:1202:2: note: Value stored to 'nfnl_ct' is never read
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/netfilter/nfnetlink_log.c:574:45: warning: Access to field 'type' results in a dereference of a null pointer (loaded from field 'dev') [clang-analyzer-core.NullDereference]
                   if (nla_put_be16(inst->skb, NFULA_HWTYPE, htons(skb->dev->type)) ||
                                                             ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'htons'
   #define htons(x) ___htons(x)
                    ^        ~
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^             ~
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^         ~
   include/uapi/linux/swab.h:105:31: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
                                        ^~
   net/netfilter/nfnetlink_log.c:466:28: note: '?' condition is false
                              0, pf, NFNETLINK_V0, htons(inst->group_num));
                                                   ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'htons'
   #define htons(x) ___htons(x)
                    ^
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   net/netfilter/nfnetlink_log.c:464:8: note: Calling 'nfnl_msg_put'
           nlh = nfnl_msg_put(inst->skb, 0, 0,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:86:8: note: Calling 'nlmsg_put'
           nlh = nlmsg_put(skb, portid, seq, type, sizeof(struct nfgenmsg), flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:917:15: note: Assuming the condition is false
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/net/netlink.h:917:2: note: Taking false branch
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
           ^
   include/net/netlink.h:920:2: note: Returning pointer, which participates in a condition later
           return __nlmsg_put(skb, portid, seq, type, payload, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:86:8: note: Returning from 'nlmsg_put'
           nlh = nlmsg_put(skb, portid, seq, type, sizeof(struct nfgenmsg), flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfilter/nfnetlink.h:87:6: note: Assuming 'nlh' is non-null, which participates in a condition later
           if (!nlh)
               ^~~~
   include/linux/netfilter/nfnetlink.h:87:2: note: Taking false branch
           if (!nlh)
           ^
   include/linux/netfilter/nfnetlink.h:92:2: note: Returning pointer (loaded from 'nlh'), which participates in a condition later
           return nlh;
           ^~~~~~~~~~
   net/netfilter/nfnetlink_log.c:464:8: note: Returning from 'nfnl_msg_put'
           nlh = nfnl_msg_put(inst->skb, 0, 0,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nfnetlink_log.c:467:7: note: 'nlh' is non-null
           if (!nlh)
                ^~~
   net/netfilter/nfnetlink_log.c:467:2: note: Taking false branch
           if (!nlh)
           ^
   net/netfilter/nfnetlink_log.c:474:6: note: Assuming the condition is false
           if (nla_put(inst->skb, NFULA_PACKET_HDR, sizeof(pmsg), &pmsg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nfnetlink_log.c:474:2: note: Taking false branch
           if (nla_put(inst->skb, NFULA_PACKET_HDR, sizeof(pmsg), &pmsg))
           ^
   net/netfilter/nfnetlink_log.c:477:6: note: Assuming 'prefix' is null
           if (prefix &&
               ^~~~~~
   net/netfilter/nfnetlink_log.c:477:13: note: Left side of '&&' is false
           if (prefix &&
                      ^
   net/netfilter/nfnetlink_log.c:481:6: note: Assuming 'indev' is non-null
           if (indev) {
               ^~~~~
   net/netfilter/nfnetlink_log.c:481:2: note: Taking true branch
           if (indev) {
           ^
   net/netfilter/nfnetlink_log.c:484:6: note: '?' condition is false
                                    htonl(indev->ifindex)))
                                    ^

vim +/nfnl_ct +393 net/netfilter/nfnetlink_queue.c

15824ab29f364ab net/netfilter/nfnetlink_queue.c      Stephane Bryant       2016-03-26  373  
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  374  static struct sk_buff *
7433268783eda21 net/netfilter/nfnetlink_queue_core.c Gao feng              2013-09-23  375  nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
5863702a3421b0d net/netfilter/nfnetlink_queue.c      Eric Dumazet          2011-07-19  376  			   struct nf_queue_entry *entry,
5863702a3421b0d net/netfilter/nfnetlink_queue.c      Eric Dumazet          2011-07-19  377  			   __be32 **packet_id_ptr)
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  378  {
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  379  	size_t size;
c5b0db3263b9252 net/netfilter/nfnetlink_queue.c      Florian Westphal      2016-02-18  380  	size_t data_len = 0, cap_len = 0;
af2806f8f90a150 net/netfilter/nfnetlink_queue_core.c Thomas Graf           2013-12-13  381  	unsigned int hlen = 0;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  382  	struct sk_buff *skb;
5863702a3421b0d net/netfilter/nfnetlink_queue.c      Eric Dumazet          2011-07-19  383  	struct nlattr *nla;
5863702a3421b0d net/netfilter/nfnetlink_queue.c      Eric Dumazet          2011-07-19  384  	struct nfqnl_msg_packet_hdr *pmsg;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  385  	struct nlmsghdr *nlh;
3e4ead4fe5d0d9f net/netfilter/nfnetlink_queue.c      Jesper Juhl           2006-01-05  386  	struct sk_buff *entskb = entry->skb;
3e4ead4fe5d0d9f net/netfilter/nfnetlink_queue.c      Jesper Juhl           2006-01-05  387  	struct net_device *indev;
3e4ead4fe5d0d9f net/netfilter/nfnetlink_queue.c      Jesper Juhl           2006-01-05  388  	struct net_device *outdev;
af999786d4f5176 net/netfilter/nfnetlink_queue.c      Tom Rix               2021-12-25  389  #if IS_ENABLED(CONFIG_NF_CONNTRACK)
9cb0176654a7dc3 net/netfilter/nfnetlink_queue.c      Pablo Neira Ayuso     2012-06-07  390  	struct nf_conn *ct = NULL;
b43c2793f5e9910 net/netfilter/nfnetlink_queue.c      Florian Westphal      2021-11-26  391  	enum ip_conntrack_info ctinfo = 0;
af999786d4f5176 net/netfilter/nfnetlink_queue.c      Tom Rix               2021-12-25  392  #endif
a4b4766c3cebb40 net/netfilter/nfnetlink_queue.c      Ken-ichirou MATSUZAWA 2015-10-05 @393  	struct nfnl_ct_hook *nfnl_ct;
496e4ae7dc944fa net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-29  394  	bool csum_verify;
ef493bd930ae482 net/netfilter/nfnetlink_queue_core.c Roman Kubiak          2015-06-12  395  	char *secdata = NULL;
ef493bd930ae482 net/netfilter/nfnetlink_queue_core.c Roman Kubiak          2015-06-12  396  	u32 seclen = 0;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  397  
573ce260b385a4d net/netfilter/nfnetlink_queue_core.c Hong zhi guo          2013-03-27  398  	size = nlmsg_total_size(sizeof(struct nfgenmsg))
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  399  		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hdr))
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  400  		+ nla_total_size(sizeof(u_int32_t))	/* ifindex */
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  401  		+ nla_total_size(sizeof(u_int32_t))	/* ifindex */
1109a90c01177e8 net/netfilter/nfnetlink_queue_core.c Pablo Neira Ayuso     2014-10-01  402  #if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  403  		+ nla_total_size(sizeof(u_int32_t))	/* ifindex */
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  404  		+ nla_total_size(sizeof(u_int32_t))	/* ifindex */
fbcd923c3e0c8ec net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  405  #endif
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  406  		+ nla_total_size(sizeof(u_int32_t))	/* mark */
df6fb868d611868 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2007-09-28  407  		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hw))
7237190df8c4129 net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-04-19  408  		+ nla_total_size(sizeof(u_int32_t))	/* skbinfo */
ae08ce0021087a5 net/netfilter/nfnetlink_queue_core.c Eric Dumazet          2013-03-17  409  		+ nla_total_size(sizeof(u_int32_t));	/* cap_len */
ae08ce0021087a5 net/netfilter/nfnetlink_queue_core.c Eric Dumazet          2013-03-17  410  
2456e855354415b net/netfilter/nfnetlink_queue.c      Thomas Gleixner       2016-12-25  411  	if (entskb->tstamp)
ae08ce0021087a5 net/netfilter/nfnetlink_queue_core.c Eric Dumazet          2013-03-17  412  		size += nla_total_size(sizeof(struct nfqnl_msg_packet_timestamp));
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  413  
15824ab29f364ab net/netfilter/nfnetlink_queue.c      Stephane Bryant       2016-03-26  414  	size += nfqnl_get_bridge_size(entry);
15824ab29f364ab net/netfilter/nfnetlink_queue.c      Stephane Bryant       2016-03-26  415  
1d1de89b9a4746f net/netfilter/nfnetlink_queue_core.c David S. Miller       2015-04-03  416  	if (entry->state.hook <= NF_INET_FORWARD ||
1d1de89b9a4746f net/netfilter/nfnetlink_queue_core.c David S. Miller       2015-04-03  417  	   (entry->state.hook == NF_INET_POST_ROUTING && entskb->sk == NULL))
496e4ae7dc944fa net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-29  418  		csum_verify = !skb_csum_unnecessary(entskb);
496e4ae7dc944fa net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-29  419  	else
496e4ae7dc944fa net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-29  420  		csum_verify = false;
496e4ae7dc944fa net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-29  421  
1d1de89b9a4746f net/netfilter/nfnetlink_queue_core.c David S. Miller       2015-04-03  422  	outdev = entry->state.out;
3e4ead4fe5d0d9f net/netfilter/nfnetlink_queue.c      Jesper Juhl           2006-01-05  423  
14cd5d4a0125f64 net/netfilter/nfnetlink_queue.c      Mark Rutland          2017-10-23  424  	switch ((enum nfqnl_config_mode)READ_ONCE(queue->copy_mode)) {
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  425  	case NFQNL_COPY_META:
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  426  	case NFQNL_COPY_NONE:
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  427  		break;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  428  
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  429  	case NFQNL_COPY_PACKET:
00bd1cc24a7dd29 net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-04-19  430  		if (!(queue->flags & NFQA_CFG_F_GSO) &&
00bd1cc24a7dd29 net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-04-19  431  		    entskb->ip_summed == CHECKSUM_PARTIAL &&
c463ac972315a0c net/netfilter/nfnetlink_queue.c      Eric Dumazet          2010-06-09  432  		    skb_checksum_help(entskb))
e7dfb09a3624a32 net/netfilter/nfnetlink_queue.c      Patrick McHardy       2005-09-06  433  			return NULL;
c463ac972315a0c net/netfilter/nfnetlink_queue.c      Eric Dumazet          2010-06-09  434  
14cd5d4a0125f64 net/netfilter/nfnetlink_queue.c      Mark Rutland          2017-10-23  435  		data_len = READ_ONCE(queue->copy_range);
9cefbbc9c8f9abe net/netfilter/nfnetlink_queue_core.c Florian Westphal      2013-06-04  436  		if (data_len > entskb->len)
3e4ead4fe5d0d9f net/netfilter/nfnetlink_queue.c      Jesper Juhl           2006-01-05  437  			data_len = entskb->len;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  438  
af2806f8f90a150 net/netfilter/nfnetlink_queue_core.c Thomas Graf           2013-12-13  439  		hlen = skb_zerocopy_headlen(entskb);
af2806f8f90a150 net/netfilter/nfnetlink_queue_core.c Thomas Graf           2013-12-13  440  		hlen = min_t(unsigned int, hlen, data_len);
ae08ce0021087a5 net/netfilter/nfnetlink_queue_core.c Eric Dumazet          2013-03-17  441  		size += sizeof(struct nlattr) + hlen;
6ee584be3ee30f7 net/netfilter/nfnetlink_queue_core.c Pablo Neira Ayuso     2012-09-24  442  		cap_len = entskb->len;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  443  		break;
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  444  	}
7af4cc3fa158ff1 net/netfilter/nfnetlink_queue.c      Harald Welte          2005-08-09  445  
a4b4766c3cebb40 net/netfilter/nfnetlink_queue.c      Ken-ichirou MATSUZAWA 2015-10-05 @446  	nfnl_ct = rcu_dereference(nfnl_ct_hook);
8e662164abb4a8f net/netfilter/nfnetlink_queue.c      Arnd Bergmann         2015-11-19  447  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

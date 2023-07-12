Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A2F20F85;
	Wed, 12 Jul 2023 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689181462; x=1720717462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuafpHlYzwuTvcNaokUQ/CjcoJ/4S/sB33nB0tPuJGE=;
  b=OeCmI7ZcRCneo1whBLfaLnwzdcIIuRVuB4k7pIPkLKZUHtM9I5gc17hj
   EphpXMfMzL6LVo6rS39pvOuSm6fgCtUSBWY5gZuz/6prqVrOuNYEGU7m3
   oUFQAq+8Sznp3s3nM/+Czqms0TitjhOGp256rrO1fipIvFbNmkspDEesS
   Tv5vuJhWxxHFKvY1Szf6XSCjfSzFV11bZNqE2ITCH864gckIFDMwdP1rm
   Ijq0zp7iMffjAwWFO5IodHMVOExy4gvKw614id9UhHH6SD6HoSDSyzRg6
   WAzG7yUcudJJdfGvkP4Dyi477MH22Gu9W3v4dLfr4naBK6E0WLyShfLKS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354857309"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="354857309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 10:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="756827506"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="756827506"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2023 10:03:01 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJdF0-0005rp-0P;
	Wed, 12 Jul 2023 17:03:02 +0000
Date: Thu, 13 Jul 2023 01:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 1/2] net/core/skbuff.c:6752:11: error:
 invalid argument type 'void' to unary expression
Message-ID: <202307130033.sW9UIMbM-lkp@intel.com>
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
config: i386-randconfig-i011-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130033.sW9UIMbM-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130033.sW9UIMbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130033.sW9UIMbM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/skbuff.c:45:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
           u128    full;
           ^
   net/core/skbuff.c:6752:12: error: expected ';' at end of declaration
           } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
                     ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:325:41: note: expanded from macro 'raw_try_cmpxchg128'
           typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
                                                  ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:326:2: note: expanded from macro 'raw_try_cmpxchg128'
           ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
           ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:327:15: note: expanded from macro 'raw_try_cmpxchg128'
           if (unlikely(___r != ___o)) \
                        ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:327:23: note: expanded from macro 'raw_try_cmpxchg128'
           if (unlikely(___r != ___o)) \
                                ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:328:12: note: expanded from macro 'raw_try_cmpxchg128'
                   *___op = ___r; \
                            ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:329:9: note: expanded from macro 'raw_try_cmpxchg128'
           likely(___r == ___o); \
                  ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
           raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:329:17: note: expanded from macro 'raw_try_cmpxchg128'
           likely(___r == ___o); \
                          ^
>> net/core/skbuff.c:6752:11: error: invalid argument type 'void' to unary expression
           } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 errors generated.


vim +/void +6752 net/core/skbuff.c

  6715	
  6716	/**
  6717	 * skb_attempt_defer_free - queue skb for remote freeing
  6718	 * @skb: buffer
  6719	 *
  6720	 * Put @skb in a per-cpu list, using the cpu which
  6721	 * allocated the skb/pages to reduce false sharing
  6722	 * and memory zone spinlock contention.
  6723	 */
  6724	void skb_attempt_defer_free(struct sk_buff *skb)
  6725	{
  6726		softnet_defer_list_t old, new = {};
  6727		int cpu = skb->alloc_cpu;
  6728		struct softnet_data *sd;
  6729		unsigned int defer_max;
  6730		bool kick;
  6731	
  6732		if (WARN_ON_ONCE(cpu >= nr_cpu_ids) ||
  6733		    !cpu_online(cpu) ||
  6734		    cpu == raw_smp_processor_id()) {
  6735	nodefer:	__kfree_skb(skb);
  6736			return;
  6737		}
  6738	
  6739		DEBUG_NET_WARN_ON_ONCE(skb_dst(skb));
  6740		DEBUG_NET_WARN_ON_ONCE(skb->destructor);
  6741	
  6742		sd = &per_cpu(softnet_data, cpu);
  6743		defer_max = READ_ONCE(sysctl_skb_defer_max);
  6744	
  6745		new.list = skb;
  6746		old = __READ_ONCE(sd->defer);
  6747		do {
  6748			if (old.count >= defer_max)
  6749				goto nodefer;
  6750			skb->next = old.list;
  6751			new.count = old.count + 1;
> 6752		} while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
  6753	
  6754		/* Send an IPI every time queue reaches half capacity. */
  6755		kick = old.count == (defer_max >> 1);
  6756	
  6757		/* Make sure to trigger NET_RX_SOFTIRQ on the remote CPU
  6758		 * if we are unlucky enough (this seems very unlikely).
  6759		 */
  6760		if (unlikely(kick) && !cmpxchg(&sd->defer_ipi_scheduled, 0, 1))
  6761			smp_call_function_single_async(cpu, &sd->defer_csd);
  6762	}
  6763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

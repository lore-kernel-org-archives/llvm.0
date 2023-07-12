Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3120FAA;
	Wed, 12 Jul 2023 19:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689190089; x=1720726089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xVBiTEF247DTyUog3lggi0Sh9AkWHXwbfC/VJGG80Eo=;
  b=c2PqBK10W+yx1rYQG/Mb/Tp6l38ZH0gM4CGOngfSe667t+4/YZWaevin
   qLyxbOfOPtj+rS72jmE+AsCbr7ZzU/8530N11bfDxrAlxNy6KwRiGD+xs
   TW/LiY9VK4lI6BiHumVJGnv6yVpZTglTY0tRaHug8eUwz0RKlBbzsRU5r
   lRnwvhdwS1XtS53u0jxOSLwa2BVW8PY/LwgRFXNQ+CnZbiq4Sq/bTBv2M
   ff6G9+7xTjsO0tq5/xAmeZqomI4Fpf22qq//SURvWdGutu3Nx+OO/MAg7
   MxrJglZXZeK0fPDNV+s0hDcY3HZs5Rfz94CUH1RCtDCTbEcBZ/6zJv1gY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395784559"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="395784559"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 12:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="698973598"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="698973598"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 12:28:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJfVN-0005wf-05;
	Wed, 12 Jul 2023 19:28:05 +0000
Date: Thu, 13 Jul 2023 03:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 1/2] net/core/skbuff.c:6752:12: error:
 assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned __int128') from
 incompatible type 'void'
Message-ID: <202307130353.NzR3tdxK-lkp@intel.com>
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
config: riscv-randconfig-r042-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130353.NzR3tdxK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130353.NzR3tdxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130353.NzR3tdxK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:6752:12: error: assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned __int128') from incompatible type 'void'
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:326:7: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> net/core/dev.c:6574:10: error: assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned __int128') from incompatible type 'void'
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:326:7: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +6752 net/core/skbuff.c

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

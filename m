Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6575358A4;
	Fri, 27 Oct 2023 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuTivgAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698416398; x=1729952398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3MjWdUu93UyGtsDfyNZphbPlJVBEtND/OXKFp3KrVY=;
  b=cuTivgAMVs9TG92s76u3BgifYEzpwKBRZWujNnacTFDz/fd+EtyjtQVz
   tCv9CvZWnv+vujP6tyWdqLMVAuZ9BhmXZK1+PL43vuihJMGJsJBec8RWZ
   lIfVc8+MxsdBRfWiAdNTJGFx0k3zaZH3ng1e27HZu8ovNg8TsCPHq9D5P
   N5oJu0moxHJ4xykZK9hPLyLOyuSio+UXTq5gc7JVOMJsgTm30W0opNpS4
   FJ5jfoOTeZI5BlyC3WsuQ793rmyGyTD4TlRO2un7Fn4Bh5QwE5bjp9lPW
   KZym72paKY8CLuDe4O6b0zz2MuBhTBnqaqr+1OhpsAPfkIkuySGIfDVC2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372831774"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="372831774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="883194016"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="883194016"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Oct 2023 07:19:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwNge-000Av9-0O;
	Fri, 27 Oct 2023 14:19:44 +0000
Date: Fri, 27 Oct 2023 22:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 14180/15478] lib/objpool.c:169:12: error: call to
 undeclared function 'arch_cmpxchg_local'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202310272207.tLPflya4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66f1e1ea3548378ff6387b1ce0b40955d54e86aa
commit: 49c19389876002dc46d0c1344c056a6366745d07 [14180/15478] lib,kprobes: using try_cmpxchg_local in objpool_push
config: hexagon-randconfig-r016-20230107 (https://download.01.org/0day-ci/archive/20231027/202310272207.tLPflya4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272207.tLPflya4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/objpool.c:169:12: error: call to undeclared function 'arch_cmpxchg_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           } while (!try_cmpxchg_local(&slot->tail, &tail, tail + 1));
                     ^
   include/linux/atomic/atomic-instrumented.h:4980:2: note: expanded from macro 'try_cmpxchg_local'
           raw_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:392:9: note: expanded from macro 'raw_try_cmpxchg_local'
           ___r = raw_cmpxchg_local((_ptr), ___o, (_new)); \
                  ^
   include/linux/atomic/atomic-arch-fallback.h:384:27: note: expanded from macro 'raw_cmpxchg_local'
   #define raw_cmpxchg_local arch_cmpxchg_local
                             ^
   1 error generated.


vim +/arch_cmpxchg_local +169 lib/objpool.c

   154	
   155	/* adding object to slot, abort if the slot was already full */
   156	static inline int
   157	objpool_try_add_slot(void *obj, struct objpool_head *pool, int cpu)
   158	{
   159		struct objpool_slot *slot = pool->cpu_slots[cpu];
   160		uint32_t head, tail;
   161	
   162		/* loading tail and head as a local snapshot, tail first */
   163		tail = READ_ONCE(slot->tail);
   164	
   165		do {
   166			head = READ_ONCE(slot->head);
   167			/* fault caught: something must be wrong */
   168			WARN_ON_ONCE(tail - head > pool->nr_objs);
 > 169		} while (!try_cmpxchg_local(&slot->tail, &tail, tail + 1));
   170	
   171		/* now the tail position is reserved for the given obj */
   172		WRITE_ONCE(slot->entries[tail & slot->mask], obj);
   173		/* update sequence to make this obj available for pop() */
   174		smp_store_release(&slot->last, tail + 1);
   175	
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

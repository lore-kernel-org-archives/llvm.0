Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CC1B7F4;
	Thu,  4 Apr 2024 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223948; cv=none; b=C8k8AMe8rslZp+yyr4J4HOII2Al3AdsLFtsywD9OQ5MmB52VtSpVqzv7fWfS3YOtut/Ofgi0pE+nGW+Il4syOuBHmuewLWBU2TXqPtfb6NAZt5PvZ4MF//IkLzFrFsNF+goGZfmw2j164jD1FfTkVitI6SnlkljKK5NugyggfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223948; c=relaxed/simple;
	bh=ZNsvkXRomYerq34crHWNdvfWo+v16Sx3UXWdt6+dtW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaiaC4f+2qDAwTH2V94jXXk+Ogc5ooaAH7om5XgGTEevLyuh6IeOyVW1hwjRO/LQgXXz6rCmZ+gb4MVd14LF6G6VQP+r3DECUzFgCfkGMMbJev6LcliI0+AQkVJzjwxtoVK1xoxJSuo9Zr+LNryO1037VNnnuf1yWFw8VROJmok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0FM3i+D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0FM3i+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712223946; x=1743759946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNsvkXRomYerq34crHWNdvfWo+v16Sx3UXWdt6+dtW4=;
  b=n0FM3i+DSfsOCo0+1GRR7i9MvQUlCS1yQRCl/u5ZrXZy+R4dLlyc+45g
   cVefQBpidHnSwe7+o4do0uiGQTLse5Ooum8FW4nBVd3wi4wcC65imtxBG
   +iuIf17wwEsMqubB24siFBfMxegAop31B1KWSbo9/AYgwBMNA4BW2Q5Ui
   LOweQr4/hY+4Eod6Lw5uOTxlMnXH2b7g0sSBL2Y2ZPTSCsEhmP3WzW4SZ
   ZqoX9PdChPRk7mB8CTQCA69Q3kY4Vg78MCDZWpI7dQM68DrpHLNaiw3l5
   SQb8qDqgffHTMlEWgPdAtWkypEFcaClhaojxu7I2pPhAuqJDDlyHpextc
   Q==;
X-CSE-ConnectionGUID: 71Mza5GAQxy8CZ0QupvT6Q==
X-CSE-MsgGUID: M0F0pXcASEmb5ISYDbPCGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7335344"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7335344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:45:43 -0700
X-CSE-ConnectionGUID: EwdYKYNHRiuhTAC67Xh7Bg==
X-CSE-MsgGUID: frmIUA9sR+Sk+J99vCR1iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23381692"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 02:45:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsJf8-0000sU-1m;
	Thu, 04 Apr 2024 09:45:38 +0000
Date: Thu, 4 Apr 2024 17:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 1084/1266] include/linux/mempool.h:105:9: error:
 '__section__' attribute only applies to functions, global variables,
 Objective-C methods, and Objective-C properties
Message-ID: <202404041707.4Bl4ifTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: ea7b8933f21b16bb974478ce7b08f2fafecc8280 [1084/1266] mempool: hook up to memory allocation profiling
config: s390-randconfig-002-20240328 (https://download.01.org/0day-ci/archive/20240404/202404041707.4Bl4ifTI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041707.4Bl4ifTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041707.4Bl4ifTI-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
>> include/linux/mempool.h:105:9: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     105 |         return mempool_init(pool, min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
         |                ^
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |         ^
   include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DUMMY_ATTRS'
      54 |         __section(".discard") __attribute__((unused))
         |         ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
     334 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
>> include/linux/mempool.h:105:9: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^
   <scratch space>:9:1: note: expanded from here
       9 | __pcpu_unique__alloc_tag_cntr
         | ^
   include/linux/mempool.h:105:9: note: previous declaration is here
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^
   <scratch space>:8:1: note: expanded from here
       8 | __pcpu_unique__alloc_tag_cntr
         | ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
>> include/linux/mempool.h:105:9: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     105 |         return mempool_init(pool, min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
         |                ^
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |         ^
   include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_ATTRS'
      50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |                                 ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
>> include/linux/mempool.h:105:9: error: non-extern declaration of '_alloc_tag_cntr' follows extern declaration
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   include/linux/mempool.h:105:9: note: previous declaration is here
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                                                          ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
>> include/linux/mempool.h:105:9: error: weak declaration cannot have internal linkage
     105 |         return mempool_init(pool, min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
         |                ^
   include/linux/mempool.h:48:2: note: expanded from macro 'mempool_init'
      48 |         alloc_hooks(mempool_init_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLOC_TAG'
      47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);      \
         |                ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                           ^
   include/linux/compiler_attributes.h:403:56: note: expanded from macro '__weak'
     403 | #define __weak                          __attribute__((__weak__))
         |                                                        ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
   include/linux/mempool.h:110:9: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     110 |         return mempool_create(min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
         |                ^
   include/linux/mempool.h:60:2: note: expanded from macro 'mempool_create'
      60 |         mempool_create_node(_min_nr, _alloc_fn, _free_fn, _pool_data,   \
         |         ^
   include/linux/mempool.h:57:2: note: expanded from macro 'mempool_create_node'
      57 |         alloc_hooks(mempool_create_node_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |         ^
   include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DUMMY_ATTRS'
      54 |         __section(".discard") __attribute__((unused))
         |         ^
   include/linux/compiler_attributes.h:334:56: note: expanded from macro '__section'
     334 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
   include/linux/mempool.h:110:9: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
   include/linux/mempool.h:60:2: note: expanded from macro 'mempool_create'
      60 |         mempool_create_node(_min_nr, _alloc_fn, _free_fn, _pool_data,   \
         |         ^
   include/linux/mempool.h:57:2: note: expanded from macro 'mempool_create_node'
      57 |         alloc_hooks(mempool_create_node_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^
   <scratch space>:18:1: note: expanded from here
      18 | __pcpu_unique__alloc_tag_cntr
         | ^
   include/linux/mempool.h:110:9: note: previous declaration is here
   include/linux/mempool.h:60:2: note: expanded from macro 'mempool_create'
      60 |         mempool_create_node(_min_nr, _alloc_fn, _free_fn, _pool_data,   \
         |         ^
   include/linux/mempool.h:57:2: note: expanded from macro 'mempool_create_node'
      57 |         alloc_hooks(mempool_create_node_noprof(__VA_ARGS__))
         |         ^
   include/linux/alloc_tag.h:164:2: note: expanded from macro 'alloc_hooks'
     164 |         DEFINE_ALLOC_TAG(_alloc_tag);                                   \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^
   <scratch space>:17:1: note: expanded from here
      17 | __pcpu_unique__alloc_tag_cntr
         | ^
   In file included from fs/btrfs/messages.c:3:
   In file included from fs/btrfs/fs.h:6:
   In file included from include/linux/blkdev.h:17:
   In file included from include/linux/bio.h:8:
   include/linux/mempool.h:110:9: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     110 |         return mempool_create(min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
         |                ^
   include/linux/mempool.h:60:2: note: expanded from macro 'mempool_create'
      60 |         mempool_create_node(_min_nr, _alloc_fn, _free_fn, _pool_data,   \
         |         ^
..


vim +/__section__ +105 include/linux/mempool.h

^1da177e4c3f41 Linus Torvalds    2005-04-16    7  
ea7b8933f21b16 Kent Overstreet   2024-03-21    8  #include <linux/sched.h>
ea7b8933f21b16 Kent Overstreet   2024-03-21   @9  #include <linux/alloc_tag.h>
^1da177e4c3f41 Linus Torvalds    2005-04-16   10  #include <linux/wait.h>
48a270554a3251 Rasmus Villemoes  2016-05-19   11  #include <linux/compiler.h>
^1da177e4c3f41 Linus Torvalds    2005-04-16   12  
fec433aaaae32a Matthew Dobson    2006-03-26   13  struct kmem_cache;
fec433aaaae32a Matthew Dobson    2006-03-26   14  
dd0fc66fb33cd6 Al Viro           2005-10-07   15  typedef void * (mempool_alloc_t)(gfp_t gfp_mask, void *pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16   16  typedef void (mempool_free_t)(void *element, void *pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16   17  
^1da177e4c3f41 Linus Torvalds    2005-04-16   18  typedef struct mempool_s {
^1da177e4c3f41 Linus Torvalds    2005-04-16   19  	spinlock_t lock;
^1da177e4c3f41 Linus Torvalds    2005-04-16   20  	int min_nr;		/* nr of elements at *elements */
^1da177e4c3f41 Linus Torvalds    2005-04-16   21  	int curr_nr;		/* Current nr of elements at *elements */
^1da177e4c3f41 Linus Torvalds    2005-04-16   22  	void **elements;
^1da177e4c3f41 Linus Torvalds    2005-04-16   23  
^1da177e4c3f41 Linus Torvalds    2005-04-16   24  	void *pool_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16   25  	mempool_alloc_t *alloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16   26  	mempool_free_t *free;
^1da177e4c3f41 Linus Torvalds    2005-04-16   27  	wait_queue_head_t wait;
^1da177e4c3f41 Linus Torvalds    2005-04-16   28  } mempool_t;
1946089a109251 Christoph Lameter 2005-06-23   29  
c1a67fefd0546a Kent Overstreet   2015-05-04   30  static inline bool mempool_initialized(mempool_t *pool)
c1a67fefd0546a Kent Overstreet   2015-05-04   31  {
c1a67fefd0546a Kent Overstreet   2015-05-04   32  	return pool->elements != NULL;
c1a67fefd0546a Kent Overstreet   2015-05-04   33  }
c1a67fefd0546a Kent Overstreet   2015-05-04   34  
6e4068a11413b9 Pavel Begunkov    2022-11-02   35  static inline bool mempool_is_saturated(mempool_t *pool)
6e4068a11413b9 Pavel Begunkov    2022-11-02   36  {
6e4068a11413b9 Pavel Begunkov    2022-11-02   37  	return READ_ONCE(pool->curr_nr) >= pool->min_nr;
6e4068a11413b9 Pavel Begunkov    2022-11-02   38  }
6e4068a11413b9 Pavel Begunkov    2022-11-02   39  
c1a67fefd0546a Kent Overstreet   2015-05-04   40  void mempool_exit(mempool_t *pool);
c1a67fefd0546a Kent Overstreet   2015-05-04   41  int mempool_init_node(mempool_t *pool, int min_nr, mempool_alloc_t *alloc_fn,
c1a67fefd0546a Kent Overstreet   2015-05-04   42  		      mempool_free_t *free_fn, void *pool_data,
c1a67fefd0546a Kent Overstreet   2015-05-04   43  		      gfp_t gfp_mask, int node_id);
ea7b8933f21b16 Kent Overstreet   2024-03-21   44  
ea7b8933f21b16 Kent Overstreet   2024-03-21   45  int mempool_init_noprof(mempool_t *pool, int min_nr, mempool_alloc_t *alloc_fn,
c1a67fefd0546a Kent Overstreet   2015-05-04   46  		 mempool_free_t *free_fn, void *pool_data);
ea7b8933f21b16 Kent Overstreet   2024-03-21   47  #define mempool_init(...)						\
ea7b8933f21b16 Kent Overstreet   2024-03-21   48  	alloc_hooks(mempool_init_noprof(__VA_ARGS__))
c1a67fefd0546a Kent Overstreet   2015-05-04   49  
^1da177e4c3f41 Linus Torvalds    2005-04-16   50  extern mempool_t *mempool_create(int min_nr, mempool_alloc_t *alloc_fn,
^1da177e4c3f41 Linus Torvalds    2005-04-16   51  			mempool_free_t *free_fn, void *pool_data);
ea7b8933f21b16 Kent Overstreet   2024-03-21   52  
ea7b8933f21b16 Kent Overstreet   2024-03-21   53  extern mempool_t *mempool_create_node_noprof(int min_nr, mempool_alloc_t *alloc_fn,
a91a5ac6858fbf Tejun Heo         2012-06-04   54  			mempool_free_t *free_fn, void *pool_data,
a91a5ac6858fbf Tejun Heo         2012-06-04   55  			gfp_t gfp_mask, int nid);
ea7b8933f21b16 Kent Overstreet   2024-03-21   56  #define mempool_create_node(...)					\
ea7b8933f21b16 Kent Overstreet   2024-03-21   57  	alloc_hooks(mempool_create_node_noprof(__VA_ARGS__))
ea7b8933f21b16 Kent Overstreet   2024-03-21   58  
ea7b8933f21b16 Kent Overstreet   2024-03-21   59  #define mempool_create(_min_nr, _alloc_fn, _free_fn, _pool_data)	\
ea7b8933f21b16 Kent Overstreet   2024-03-21   60  	mempool_create_node(_min_nr, _alloc_fn, _free_fn, _pool_data,	\
ea7b8933f21b16 Kent Overstreet   2024-03-21   61  			    GFP_KERNEL, NUMA_NO_NODE)
1946089a109251 Christoph Lameter 2005-06-23   62  
11d83360452ea2 David Rientjes    2015-04-14   63  extern int mempool_resize(mempool_t *pool, int new_min_nr);
^1da177e4c3f41 Linus Torvalds    2005-04-16   64  extern void mempool_destroy(mempool_t *pool);
ea7b8933f21b16 Kent Overstreet   2024-03-21   65  
ea7b8933f21b16 Kent Overstreet   2024-03-21   66  extern void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask) __malloc;
ea7b8933f21b16 Kent Overstreet   2024-03-21   67  #define mempool_alloc(...)						\
ea7b8933f21b16 Kent Overstreet   2024-03-21   68  	alloc_hooks(mempool_alloc_noprof(__VA_ARGS__))
ea7b8933f21b16 Kent Overstreet   2024-03-21   69  
37dcc69ad17a00 Andrey Konovalov  2023-12-19   70  extern void *mempool_alloc_preallocated(mempool_t *pool) __malloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16   71  extern void mempool_free(void *element, mempool_t *pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16   72  
^1da177e4c3f41 Linus Torvalds    2005-04-16   73  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16   74   * A mempool_alloc_t and mempool_free_t that get the memory from
e244c9e66f6197 David Rientjes    2015-04-15   75   * a slab cache that is passed in through pool_data.
e244c9e66f6197 David Rientjes    2015-04-15   76   * Note: the slab cache may not have a ctor function.
^1da177e4c3f41 Linus Torvalds    2005-04-16   77   */
dd0fc66fb33cd6 Al Viro           2005-10-07   78  void *mempool_alloc_slab(gfp_t gfp_mask, void *pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16   79  void mempool_free_slab(void *element, void *pool_data);
c1a67fefd0546a Kent Overstreet   2015-05-04   80  
ea7b8933f21b16 Kent Overstreet   2024-03-21   81  #define mempool_init_slab_pool(_pool, _min_nr, _kc)			\
ea7b8933f21b16 Kent Overstreet   2024-03-21   82  	mempool_init(_pool, (_min_nr), mempool_alloc_slab, mempool_free_slab, (void *)(_kc))
ea7b8933f21b16 Kent Overstreet   2024-03-21   83  #define mempool_create_slab_pool(_min_nr, _kc)			\
ea7b8933f21b16 Kent Overstreet   2024-03-21   84  	mempool_create((_min_nr), mempool_alloc_slab, mempool_free_slab, (void *)(_kc))
^1da177e4c3f41 Linus Torvalds    2005-04-16   85  
53184082b070df Matthew Dobson    2006-03-26   86  /*
bba78819548a59 Sage Weil         2009-09-21   87   * a mempool_alloc_t and a mempool_free_t to kmalloc and kfree the
bba78819548a59 Sage Weil         2009-09-21   88   * amount of memory specified by pool_data
53184082b070df Matthew Dobson    2006-03-26   89   */
53184082b070df Matthew Dobson    2006-03-26   90  void *mempool_kmalloc(gfp_t gfp_mask, void *pool_data);
53184082b070df Matthew Dobson    2006-03-26   91  void mempool_kfree(void *element, void *pool_data);
c1a67fefd0546a Kent Overstreet   2015-05-04   92  
ea7b8933f21b16 Kent Overstreet   2024-03-21   93  #define mempool_init_kmalloc_pool(_pool, _min_nr, _size)		\
ea7b8933f21b16 Kent Overstreet   2024-03-21   94  	mempool_init(_pool, (_min_nr), mempool_kmalloc, mempool_kfree,	\
ea7b8933f21b16 Kent Overstreet   2024-03-21   95  		     (void *)(unsigned long)(_size))
ea7b8933f21b16 Kent Overstreet   2024-03-21   96  #define mempool_create_kmalloc_pool(_min_nr, _size)			\
ea7b8933f21b16 Kent Overstreet   2024-03-21   97  	mempool_create((_min_nr), mempool_kmalloc, mempool_kfree,	\
ea7b8933f21b16 Kent Overstreet   2024-03-21   98  		       (void *)(unsigned long)(_size))
53184082b070df Matthew Dobson    2006-03-26   99  
0225bdfafd818f Kent Overstreet   2024-02-01  100  void *mempool_kvmalloc(gfp_t gfp_mask, void *pool_data);
0225bdfafd818f Kent Overstreet   2024-02-01  101  void mempool_kvfree(void *element, void *pool_data);
0225bdfafd818f Kent Overstreet   2024-02-01  102  
0225bdfafd818f Kent Overstreet   2024-02-01  103  static inline int mempool_init_kvmalloc_pool(mempool_t *pool, int min_nr, size_t size)
0225bdfafd818f Kent Overstreet   2024-02-01  104  {
0225bdfafd818f Kent Overstreet   2024-02-01 @105  	return mempool_init(pool, min_nr, mempool_kvmalloc, mempool_kvfree, (void *) size);
0225bdfafd818f Kent Overstreet   2024-02-01  106  }
0225bdfafd818f Kent Overstreet   2024-02-01  107  

:::::: The code at line 105 was first introduced by commit
:::::: 0225bdfafd818f895fa4a4512f124a1614e011e2 mempool: kvmalloc pool

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399617D2;
	Fri, 20 Jan 2023 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674205013; x=1705741013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0EiUqJKyGdo+CBGauw4XBwRy7+EsKkUqFraUhfQ9ak=;
  b=bWZLOgcPy6iyWsBS3rn6T5rE6LgBFW2jHT6MhHIkhImKSh97HaTW2HqG
   1n5nmJEZPzWO8V4nOot9ayppwnaRpFWC4K7FNvXdV+XYRWwQEBmdwP7WZ
   pY/eTdVxwq/+NbZM9bu3hbE+UVGmqW8mUcMR/gbtgXAJ7DlUgczqd4OY7
   h+e7MYf4M07ZPc6IFlhMy+EcDnug8B0oNQDa1OUqtZCWKZYXxLR/57uZ5
   2FI3mGcH7xiUNdyo6+Gt32nkpaZ1Uy2oswTi9X6gGSfbSwtSr1IxocUzD
   P9thyRStWJz9AH0e8w1m8W2dHNEfBSpDg2cB/D04SZS2iGQbFH7dyFIUC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327632199"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327632199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 00:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638094077"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="638094077"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 00:56:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pInCc-0002P8-2b;
	Fri, 20 Jan 2023 08:56:50 +0000
Date: Fri, 20 Jan 2023 16:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: [madvenka786:orc_v3 20/21] arch/x86/events/intel/pt.c:719:2:
 warning: array index -1 is before the beginning of the array
Message-ID: <202301201656.DVmzLjlG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   a0c212ed0823caa5a7ec431d3a5ec07b46964384
commit: 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738 [20/21] arm64: Miscellaneous changes required for enabling livepatch
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230120/202301201656.DVmzLjlG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/madvenka786/linux/commit/1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/pt.c:27:
   In file included from arch/x86/events/intel/../perf_event.h:15:
   In file included from include/linux/perf_event.h:52:
   include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from arch/x86/events/intel/pt.c:27:
   In file included from arch/x86/events/intel/../perf_event.h:15:
   In file included from include/linux/perf_event.h:52:
   include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
>> arch/x86/events/intel/pt.c:719:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
           TOPA_ENTRY(last, -1)->base = topa_pfn(topa);
           ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:720:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
           TOPA_ENTRY(last, -1)->end = 1;
           ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:769:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
           TOPA_ENTRY(topa, -1)->base = page_to_phys(p) >> TOPA_SHIFT;
           ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:770:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
           TOPA_ENTRY(topa, -1)->size = order;
           ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:773:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
                   TOPA_ENTRY(topa, -1)->intr = 1;
                   ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:774:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
                   TOPA_ENTRY(topa, -1)->stop = 1;
                   ^                ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:1235:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
                   TOPA_ENTRY(buf->last, -1)->base = topa_pfn(buf->first);
                   ^                     ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   arch/x86/events/intel/pt.c:1236:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
                   TOPA_ENTRY(buf->last, -1)->end = 1;
                   ^                     ~~
   arch/x86/events/intel/pt.c:619:6: note: expanded from macro 'TOPA_ENTRY'
                   : &topa_to_page(t)->table[(i)])
                      ^                       ~
   arch/x86/events/intel/pt.c:596:2: note: array 'table' declared here
           struct topa_entry       table[TENTS_PER_PAGE];
           ^
   8 warnings and 2 errors generated.


vim +719 arch/x86/events/intel/pt.c

52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  690  
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  691  /**
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  692   * topa_insert_table() - insert a ToPA table into a buffer
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  693   * @buf:	 PT buffer that's being extended.
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  694   * @topa:	 New topa table to be inserted.
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  695   *
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  696   * If it's the first table in this buffer, set up buffer's pointers
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  697   * accordingly; otherwise, add a END=1 link entry to @topa to the current
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  698   * "last" table and adjust the last table pointer to @topa.
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  699   */
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  700  static void topa_insert_table(struct pt_buffer *buf, struct topa *topa)
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  701  {
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  702  	struct topa *last = buf->last;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  703  
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  704  	list_add_tail(&topa->list, &buf->tables);
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  705  
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  706  	if (!buf->first) {
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  707  		buf->first = buf->last = buf->cur = topa;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  708  		return;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  709  	}
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  710  
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  711  	topa->offset = last->offset + last->size;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  712  	buf->last = topa;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  713  
f6d079ce867d67 arch/x86/events/intel/pt.c                Chao Peng          2018-10-24  714  	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  715  		return;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  716  
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  717  	BUG_ON(last->last != TENTS_PER_PAGE - 1);
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  718  
91feca5e2ecc97 arch/x86/events/intel/pt.c                Alexander Shishkin 2019-08-21 @719  	TOPA_ENTRY(last, -1)->base = topa_pfn(topa);
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  720  	TOPA_ENTRY(last, -1)->end = 1;
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  721  }
52ca9ced3f7077 arch/x86/kernel/cpu/perf_event_intel_pt.c Alexander Shishkin 2015-01-30  722  

:::::: The code at line 719 was first introduced by commit
:::::: 91feca5e2ecc9752894d57c9a72c2645471929c3 perf/x86/intel/pt: Free up space in a ToPA descriptor

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

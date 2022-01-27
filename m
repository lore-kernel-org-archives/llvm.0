Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D422CA2
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 01:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643248354; x=1674784354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGLShA0tdarHhBN2Mw2kO/f1A6Hwui5VClVfAkM7MNM=;
  b=QA+SWoZrimSbwcCSUesAzXgSWN3GTPleDX8AGM1EOPQwEgyaBh5fvVg4
   whyzDiM7JSacpZdYpspSclSo+QE910ff05Y1hrMfmYk5yjjfJyB0BtXx9
   wTPVeHVZ9i1t4Tf7FFEUQ3FivDuqE7xDWN/mgWaMjCH25fwQhIgSOAWoL
   gbZlMfhAczd3x2WLSRcIee6neRG/1V7nJ0iUxrOdFGIDi96ZfVyHzf9a/
   /RMb8UYWjlcwrQTONoJO4YG3esHRUfcE8yxUxPeR9M9zL5Dor9BsyJJvP
   A9P0Xdux5G/vFfBwbSxZjbvGUVk6eFBUC8NuEAmlUrsSr7DNuEZkuhNrJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="271170341"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="271170341"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 17:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="581305609"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2022 17:52:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCtxd-000Lxa-8X; Thu, 27 Jan 2022 01:52:29 +0000
Date: Thu, 27 Jan 2022 09:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10
 2289/9999] kernel/sched/psi.c:538:3: error: implicit declaration of function
 'trace_android_vh_psi_event'
Message-ID: <202201270959.49bfLJfz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10
head:   b0d13db791b8774617b72c9242a7cf49f67720b2
commit: b79d1815c400c3929bb78a209b6e51a38d6ffcb2 [2289/9999] ANDROID: psi: Add vendor hooks for PSI tracing
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270959.49bfLJfz-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b79d1815c400c3929bb78a209b6e51a38d6ffcb2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10
        git checkout b79d1815c400c3929bb78a209b6e51a38d6ffcb2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the ammarfaizi2-block/google/android/kernel/common/android12-5.10 HEAD b0d13db791b8774617b72c9242a7cf49f67720b2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/sched/psi.c:538:3: error: implicit declaration of function 'trace_android_vh_psi_event' [-Werror,-Wimplicit-function-declaration]
                   trace_android_vh_psi_event(t);
                   ^
>> kernel/sched/psi.c:546:2: error: implicit declaration of function 'trace_android_vh_psi_group' [-Werror,-Wimplicit-function-declaration]
           trace_android_vh_psi_group(group);
           ^
   2 errors generated.


vim +/trace_android_vh_psi_event +538 kernel/sched/psi.c

   503	
   504	static u64 update_triggers(struct psi_group *group, u64 now)
   505	{
   506		struct psi_trigger *t;
   507		bool new_stall = false;
   508		u64 *total = group->total[PSI_POLL];
   509	
   510		/*
   511		 * On subsequent updates, calculate growth deltas and let
   512		 * watchers know when their specified thresholds are exceeded.
   513		 */
   514		list_for_each_entry(t, &group->triggers, node) {
   515			u64 growth;
   516	
   517			/* Check for stall activity */
   518			if (group->polling_total[t->state] == total[t->state])
   519				continue;
   520	
   521			/*
   522			 * Multiple triggers might be looking at the same state,
   523			 * remember to update group->polling_total[] once we've
   524			 * been through all of them. Also remember to extend the
   525			 * polling time if we see new stall activity.
   526			 */
   527			new_stall = true;
   528	
   529			/* Calculate growth since last update */
   530			growth = window_update(&t->win, now, total[t->state]);
   531			if (growth < t->threshold)
   532				continue;
   533	
   534			/* Limit event signaling to once per window */
   535			if (now < t->last_event_time + t->win.size)
   536				continue;
   537	
 > 538			trace_android_vh_psi_event(t);
   539	
   540			/* Generate an event */
   541			if (cmpxchg(&t->event, 0, 1) == 0)
   542				wake_up_interruptible(&t->event_wait);
   543			t->last_event_time = now;
   544		}
   545	
 > 546		trace_android_vh_psi_group(group);
   547	
   548		if (new_stall)
   549			memcpy(group->polling_total, total,
   550					sizeof(group->polling_total));
   551	
   552		return now + group->poll_min_period;
   553	}
   554	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

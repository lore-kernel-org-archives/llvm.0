Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A231FBA
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 00:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650586779; x=1682122779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZoyI79D0FRAYPwiOPoH7VGo/scDwJJskX7sGF6ZBJ9U=;
  b=mV/puR8lBLhenPE8wostLWLUZaYego3gDoW3YwYiaaRt658ZeO5VM2/u
   DtyTbLCp/Aut+ueaH2qwYogJbaZumrrQ034ZI/u60zwiUXBFV0xB/xCNO
   +CcLAjzXQ0+QeAVtv2mrMxu8hFNuicO0749eTe9O7+qHE/+dIUMVljsHT
   ae7CxUL/wnZ8L1oxiw9Sf9ezpHDnrkzfDTKmKGdiirSdfw+Pb/t0imgAb
   B9m5OAldhhN0DUIJC1hwtCgjrbF6z4clT9x3NqNQGoxyjMAWnXFnUqhwo
   yeFTcs5tiBi/xfNzljXHFJEGtgLZERlviW71KhAAqS+73N2i5hFiStJR+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264297141"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="264297141"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 17:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="703305696"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2022 17:19:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhh1E-00090E-04;
	Fri, 22 Apr 2022 00:19:28 +0000
Date: Fri, 22 Apr 2022 08:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 2/3] futex: exit: Print a warning when futex_cleanup fails
Message-ID: <202204220841.5b2XtG9h-lkp@intel.com>
References: <20220421190533.1601879-3-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421190533.1601879-3-npache@redhat.com>

Hi Nico,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/next]
[also build test ERROR on tip/locking/core linus/master v5.18-rc3]
[cannot apply to hnaz-mm/master linux/master next-20220421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/Slight-improvements-for-OOM-Futex/20220422-030740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: hexagon-randconfig-r025-20220421 (https://download.01.org/0day-ci/archive/20220422/202204220841.5b2XtG9h-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cd9fef152153fe60c67bb633118dd8adef51cadc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nico-Pache/Slight-improvements-for-OOM-Futex/20220422-030740
        git checkout cd9fef152153fe60c67bb633118dd8adef51cadc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:774:7: error: use of undeclared identifier 'futex_cmpxchg_enabled'
           if (!futex_cmpxchg_enabled)
                ^
   1 error generated.


vim +/futex_cmpxchg_enabled +774 kernel/futex/core.c

   758	
   759	/*
   760	 * Walk curr->robust_list (very carefully, it's a userspace list!)
   761	 * and mark any locks found there dead, and notify any waiters.
   762	 *
   763	 * We return false on any sign of list-walking problem.
   764	 */
   765	static bool exit_robust_list(struct task_struct *curr)
   766	{
   767		struct robust_list_head __user *head = curr->robust_list;
   768		struct robust_list __user *entry, *next_entry, *pending;
   769		unsigned int limit = ROBUST_LIST_LIMIT, pi, pip;
   770		unsigned int next_pi;
   771		unsigned long futex_offset;
   772		int rc;
   773	
 > 774		if (!futex_cmpxchg_enabled)
   775			return false;
   776		/*
   777		 * Fetch the list head (which was registered earlier, via
   778		 * sys_set_robust_list()):
   779		 */
   780		if (fetch_robust_entry(&entry, &head->list.next, &pi))
   781			return false;
   782		/*
   783		 * Fetch the relative futex offset:
   784		 */
   785		if (get_user(futex_offset, &head->futex_offset))
   786			return false;
   787		/*
   788		 * Fetch any possibly pending lock-add first, and handle it
   789		 * if it exists:
   790		 */
   791		if (fetch_robust_entry(&pending, &head->list_op_pending, &pip))
   792			return false;
   793	
   794		next_entry = NULL;	/* avoid warning with gcc */
   795		while (entry != &head->list) {
   796			/*
   797			 * Fetch the next entry in the list before calling
   798			 * handle_futex_death:
   799			 */
   800			rc = fetch_robust_entry(&next_entry, &entry->next, &next_pi);
   801			/*
   802			 * A pending lock might already be on the list, so
   803			 * don't process it twice:
   804			 */
   805			if (entry != pending) {
   806				if (handle_futex_death((void __user *)entry + futex_offset,
   807							curr, pi, HANDLE_DEATH_LIST))
   808					return false;
   809			}
   810			if (rc)
   811				return false;
   812			entry = next_entry;
   813			pi = next_pi;
   814			/*
   815			 * Avoid excessively long or circular lists:
   816			 */
   817			if (!--limit)
   818				break;
   819	
   820			cond_resched();
   821		}
   822	
   823		if (pending) {
   824			return handle_futex_death((void __user *)pending + futex_offset,
   825					   curr, pip, HANDLE_DEATH_PENDING);
   826		}
   827		return true;
   828	}
   829	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

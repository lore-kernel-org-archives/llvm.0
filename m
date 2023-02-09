Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B62107;
	Thu,  9 Feb 2023 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675925979; x=1707461979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdrHO+VSYfV2Ou3gjnq+xVe6aB7VpeMzT15JHrXiYLs=;
  b=KTF20IiAsHCBMlDxwDQ63nH53wUqmoxQRPM8fgwh2XkU3iqyvDgjSbW6
   3m1UF1C0oWOephNLtycyNu0tWCmUVNjhmaRO3DcL8/E9YlR0QCWFsRfRN
   2xTyRBHL0UeEuRyvHbfxcM7t/G5jueQTOLUYkwh7QURj6kdh45XcVlA3B
   zCVCuDrgyqf2BP+3bzrdjuUuJfGe/10vm72/Nhh+P7Mfto1KDWNoaDEpd
   yGC7d/HcOqFWjaUY2WnRQYsbFrXMEY2mmmlFLKSjqb4Nl54b9akI5NAf+
   ZdSXqzs9dhPh4+BDYQCamq0RKXVRHjtAdJtE2KmO5WzTPp9EetOQNmp7Z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394625703"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="394625703"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 22:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697920746"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697920746"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 22:59:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ0tz-0004tS-1k;
	Thu, 09 Feb 2023 06:59:27 +0000
Date: Thu, 9 Feb 2023 14:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ashok Raj <ashok.raj@intel.com>
Subject: [daveh-devel:ucode-for-ashok 11/16]
 arch/x86/kernel/cpu/microcode/core.c:414:25: warning: unused variable 'uci'
Message-ID: <202302091405.orY3hwat-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9 [11/16] x86/microcode: Do not call apply_microcode() on sibling threads
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230209/202302091405.orY3hwat-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091405.orY3hwat-lkp@intel.com

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c:383:50: error: too few arguments to function call, expected 1, have 0
           u32 rev = microcode_ops->get_microcode_revision();
                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kernel/cpu/microcode/core.c:395:18: warning: no previous prototype for function 'apply_microcode' [-Wmissing-prototypes]
   enum ucode_state apply_microcode(int cpu)
                    ^
   arch/x86/kernel/cpu/microcode/core.c:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum ucode_state apply_microcode(int cpu)
   ^
   static 
>> arch/x86/kernel/cpu/microcode/core.c:414:25: warning: unused variable 'uci' [-Wunused-variable]
           struct ucode_cpu_info *uci;
                                  ^
   arch/x86/kernel/cpu/microcode/core.c:588:17: error: no member named 'collect_cpu_info' in 'struct microcode_ops'
           microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
           ~~~~~~~~~~~~~  ^
   2 warnings and 2 errors generated.


vim +/uci +414 arch/x86/kernel/cpu/microcode/core.c

   405	
   406	/*
   407	 * Returns:
   408	 * < 0 - on error
   409	 *   0 - success (no update done or microcode was updated)
   410	 */
   411	static int __reload_late(void *info)
   412	{
   413		int cpu = smp_processor_id();
 > 414		struct ucode_cpu_info *uci;
   415		enum ucode_state err;
   416		bool lead_thread;
   417		int ret = 0;
   418	
   419		/*
   420		 * Wait for all CPUs to arrive. A load will not be attempted unless all
   421		 * CPUs show up.
   422		 * */
   423		if (__wait_for_cpus(&late_cpus_in, NSEC_PER_SEC))
   424			return -1;
   425	
   426		/*
   427		 * On an SMT system, it suffices to load the microcode on one sibling of
   428		 * the core because the microcode engine is shared between the threads.
   429		 * Synchronization still needs to take place so that no concurrent
   430		 * loading attempts happen on multiple threads of an SMT core. See
   431		 * below.
   432		 */
   433		if (cpumask_first(topology_sibling_cpumask(cpu)) == cpu) {
   434			lead_thread = true;
   435			err = apply_microcode(cpu);
   436		} else {
   437			lead_thread = false;
   438			goto wait_for_siblings;
   439		}
   440	
   441		if (err >= UCODE_NFOUND) {
   442			if (err == UCODE_ERROR)
   443				pr_warn("Error reloading microcode on CPU %d\n", cpu);
   444	
   445			ret = -1;
   446		}
   447	
   448	wait_for_siblings:
   449		if (__wait_for_cpus(&late_cpus_out, NSEC_PER_SEC))
   450			panic("Timeout during microcode update!\n");
   451	
   452		/*
   453		 * For non-lead threads where microcode was not applied, unconditionally
   454		 * update the per-cpu metadata.  This can tolerate the lead thread
   455		 * either succeeding or failing the update.
   456		 */
   457		if (!lead_thread)
   458			update_microcode_version_cache(cpu);
   459	
   460		return ret;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

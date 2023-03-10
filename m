Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7767E6;
	Fri, 10 Mar 2023 02:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678414670; x=1709950670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a8tUgxwMUUusAh+tTV0J7aU8OBh0gR2gGK+YmcteLOA=;
  b=XQIOMtKqq4zknAF/50h4z8zaoO8gRncG0dTItAQl4i2yKMAZ08YNEBTQ
   ldnT7d+ppf+oEMqrYKqAhaLpyy48IuPkMMrSA9W8+vO8VjlN6JZuBwKq/
   IbHTcmf4Y68uwpofcxejd8As0MibacXaIwSB0CJyAE754wAp+IsPoQqJN
   nsfz1ZwJk4WieKZvZtppoSB3czNcbV5iYQVbdr0CkZ6BeHlU8Fxb3edjr
   qK+FihEArueCNW/U6E2cXkuaNXg0O+xEFYRSsvSygD+2sOR3Okqv52avA
   VMmDSZjXA17xYS4G9j7ZVuugT6B0Ozj3+aXGAsXwDL7/2ZV8AI/vR4clu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="320481002"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="320481002"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 18:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="680043667"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="680043667"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 18:17:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paSKJ-0003NZ-1t;
	Fri, 10 Mar 2023 02:17:47 +0000
Date: Fri, 10 Mar 2023 10:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [selinuxproject-selinux:pr/64 2/2] security/selinux/ima.c:77:2:
 error: member reference type 'struct mutex' is not a pointer; did you mean
 to use '.'?
Message-ID: <202303101057.mZ3Gv5fK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/SELinuxProject/selinux-kernel pr/64
head:   e619414065da38197e0148bb7b00d0a6997de5f1
commit: e619414065da38197e0148bb7b00d0a6997de5f1 [2/2] selinux: stop passing selinux_state pointers and their offspring
config: hexagon-randconfig-r045-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101057.mZ3Gv5fK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/SELinuxProject/selinux-kernel/commit/e619414065da38197e0148bb7b00d0a6997de5f1
        git remote add selinuxproject-selinux https://github.com/SELinuxProject/selinux-kernel
        git fetch --no-tags selinuxproject-selinux pr/64
        git checkout e619414065da38197e0148bb7b00d0a6997de5f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101057.mZ3Gv5fK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/selinux/ima.c:11:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from security/selinux/ima.c:11:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from security/selinux/ima.c:11:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> security/selinux/ima.c:77:2: error: member reference type 'struct mutex' is not a pointer; did you mean to use '.'?
           lockdep_assert_held(selinux_state.policy_mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:319:17: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:286:52: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                               ^
   include/linux/lockdep.h:313:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
>> security/selinux/ima.c:77:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
           lockdep_assert_held(selinux_state.policy_mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:319:17: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:286:45: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                        ^
   include/linux/lockdep.h:313:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   6 warnings and 2 errors generated.


vim +77 security/selinux/ima.c

    66	
    67	/*
    68	 * selinux_ima_measure_state_locked - Measure SELinux state and hash of policy
    69	 */
    70	void selinux_ima_measure_state_locked(void)
    71	{
    72		char *state_str = NULL;
    73		void *policy = NULL;
    74		size_t policy_len;
    75		int rc = 0;
    76	
  > 77		lockdep_assert_held(selinux_state.policy_mutex);
    78	
    79		state_str = selinux_ima_collect_state();
    80		if (!state_str) {
    81			pr_err("SELinux: %s: failed to read state.\n", __func__);
    82			return;
    83		}
    84	
    85		ima_measure_critical_data("selinux", "selinux-state",
    86					  state_str, strlen(state_str), false,
    87					  NULL, 0);
    88	
    89		kfree(state_str);
    90	
    91		/*
    92		 * Measure SELinux policy only after initialization is completed.
    93		 */
    94		if (!selinux_initialized())
    95			return;
    96	
    97		rc = security_read_state_kernel(&policy, &policy_len);
    98		if (rc) {
    99			pr_err("SELinux: %s: failed to read policy %d.\n", __func__, rc);
   100			return;
   101		}
   102	
   103		ima_measure_critical_data("selinux", "selinux-policy-hash",
   104					  policy, policy_len, true,
   105					  NULL, 0);
   106	
   107		vfree(policy);
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

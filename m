Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE5EC0;
	Tue, 29 Aug 2023 04:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693282139; x=1724818139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JelNIEqHQVyEPPElaNX+PFjZlpmd2RjQ2b1G8zTUt6A=;
  b=hDl83JlCoF0GVSX9HCbTVR0OMa4Tkebh3TgsXuhBcycY9Ap+sXVGtYzu
   fcyXRtJilusgrka/EDV4B6oH2Xt3KHzX0JwK6RbvleRTiPN0Jcj09tCzB
   hU+SCDtHOjcR8mtML7WUbzHLFTMhvCZYFg1W7G4jofKT91t8HaBubcaqE
   WGJ/n/AuxZo/Da885d0BG0jvL1yDvn5pXnHFt+KJWmUt/LSoshcaqBK6Y
   /UiIixWNdyq7Fo6DofzEY7LdGTZj7Dx+xTfBuC9/u4JJzS6Qar6uvxb3y
   eF6WdBwacVfL3ASDk2GwJn4xL0tKu+AFQ5xVF13RkO6iFR+jD8T4uymI7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="379046311"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="379046311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 21:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808524340"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="808524340"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2023 21:08:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaq2C-0008N5-0n;
	Tue, 29 Aug 2023 04:08:56 +0000
Date: Tue, 29 Aug 2023 12:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/x86/kernel/cpu/amd.c:1289:6: warning: no previous prototype for
 function 'amd_check_microcode'
Message-ID: <202308291220.DOn00Y1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c59d383390f970b891b503b7f79b63a02db2ec5
commit: 522b1d69219d8f083173819fde04f994aa051a98 x86/cpu/amd: Add a Zenbleed fix
date:   6 weeks ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230829/202308291220.DOn00Y1A-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291220.DOn00Y1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291220.DOn00Y1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/open.c:1167: warning: Function parameter or member 'real_path' not described in 'backing_file_open'
   fs/open.c:1561: warning: expecting prototype for close_range(). Prototype was for sys_close_range() instead
--
>> fs/namespace.c:3046: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'
--
>> arch/x86/kernel/cpu/amd.c:1289:6: warning: no previous prototype for function 'amd_check_microcode' [-Wmissing-prototypes]
   void amd_check_microcode(void)
        ^
   arch/x86/kernel/cpu/amd.c:1289:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void amd_check_microcode(void)
   ^
   static 
   1 warning generated.
--
>> arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'var' not described in 'mtrr_overwrite_state'
>> arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'num_var' not described in 'mtrr_overwrite_state'
>> arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'def_type' not described in 'mtrr_overwrite_state'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'start' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'end' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'uniform' not described in 'mtrr_type_lookup'
--
>> fs/exportfs/expfs.c:395: warning: Function parameter or member 'parent' not described in 'exportfs_encode_inode_fh'


vim +/amd_check_microcode +1289 arch/x86/kernel/cpu/amd.c

  1288	
> 1289	void amd_check_microcode(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

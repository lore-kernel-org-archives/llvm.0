Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4917F8;
	Wed,  4 Oct 2023 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696400495; x=1727936495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0zTjI59RLPGR2406pc3HlGg5WbitJiftFZfWUeb9lA=;
  b=eth8vRC+ef4z3VoZyrEwFHv2uxsmxKl8lYSUXzwdsXYK9Fv0kdB3Qker
   BOI7PNKXJEYgLEa8nWb3QpDEOX0pEp8a0TxKUiSsvvZPSXTjwiNPF5ko/
   j/nyiWjYMqIh14dnd4H+KttI4w8nMO3exbfaahDrIXpEn07DKNfmAhQhU
   m3S35gs85WNBbWW8vqN1gSrbGKmlLUFKesDVSNknrynuf28Dc8P1MQVDf
   /NMpS0fWkcsH0Jt/FYOK/c80+CwgsEZV5pF4f5A9tgXSV2vcGepLJdLvd
   eH1ykdDET/fPGRESmtGGh+PrrZJhmRAn1f1ZmFu5w5GJ3Lrkwm4PHbIEz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386941195"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="386941195"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 23:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727891060"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="727891060"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 23:21:33 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnvGF-000Czm-0t;
	Wed, 04 Oct 2023 06:21:31 +0000
Date: Wed, 4 Oct 2023 14:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8396/9381]
 arch/powerpc/platforms/cell/spufs/coredump.c:79:6: warning: variable 'ctx'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202310041442.iukUNRze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c9f2baaa18b5ea8f006a2b3a616da9597c71d15e
commit: af66b51563ad7e625602809a0f4c45154df063d1 [8396/9381] file: convert to SLAB_TYPESAFE_BY_RCU
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231004/202310041442.iukUNRze-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041442.iukUNRze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041442.iukUNRze-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/cell/spufs/coredump.c:79:6: warning: variable 'ctx' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      79 |         if (file) {
         |             ^~~~
   arch/powerpc/platforms/cell/spufs/coredump.c:85:9: note: uninitialized use occurs here
      85 |         return ctx;
         |                ^~~
   arch/powerpc/platforms/cell/spufs/coredump.c:79:2: note: remove the 'if' if its condition is always true
      79 |         if (file) {
         |         ^~~~~~~~~~
   arch/powerpc/platforms/cell/spufs/coredump.c:69:25: note: initialize the variable 'ctx' to silence this warning
      69 |         struct spu_context *ctx;
         |                                ^
         |                                 = NULL
   1 warning generated.


vim +79 arch/powerpc/platforms/cell/spufs/coredump.c

    54	
    55	/*
    56	 * The additional architecture-specific notes for Cell are various
    57	 * context files in the spu context.
    58	 *
    59	 * This function iterates over all open file descriptors and sees
    60	 * if they are a directory in spufs.  In that case we use spufs
    61	 * internal functionality to dump them without needing to actually
    62	 * open the files.
    63	 */
    64	/*
    65	 * descriptor table is not shared, so files can't change or go away.
    66	 */
    67	static struct spu_context *coredump_next_context(int *fd)
    68	{
    69		struct spu_context *ctx;
    70		struct file *file;
    71		int n = iterate_fd(current->files, *fd, match_context, NULL);
    72		if (!n)
    73			return NULL;
    74		*fd = n - 1;
    75	
    76		rcu_read_lock();
    77		file = lookup_fdget_rcu(*fd);
    78		rcu_read_unlock();
  > 79		if (file) {
    80			ctx = SPUFS_I(file_inode(file))->i_ctx;
    81			get_spu_context(ctx);
    82			fput(file);
    83		}
    84	
    85		return ctx;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

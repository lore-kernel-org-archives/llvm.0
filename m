Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075FF7F;
	Wed, 13 Sep 2023 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694563782; x=1726099782;
  h=date:from:cc:subject:message-id:mime-version;
  bh=f+FNSsiZ5wvm3ye69WUlJV/gyGvXQGp0YWqfZjvJtks=;
  b=H2Whka8ET1GQzvAWe34+y7LgZzeGvVMnAxWLw0bcgBJnNhf41o9gHH94
   u3WbsDEEv0iMd1Xu/x5Es3fIljO7npdOgFTZO8WbmMufs+PbX/URA9huI
   4yqVgOygh3syf4NAgs+rQnInR2RDgCuavI92Tbn+Zx4z79QHvQWkWqwc3
   e6NwC15T6ZMBsqehCkTmnB5YLirsnPTKgvBo1uUD4M/Y8bBLrpWDopKBZ
   vMhUsz1j43RHmdj3ZyxMMyu1LnTXJu3SWO0Wo8MjmvH9B5hAvO3ojM4pp
   DUwlhtLt1B1lahLBy44gP96g5PcQTqC/5b+xYj08MPW5oQSymAcWGPiHS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378439291"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="378439291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 17:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887138223"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="887138223"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 17:08:49 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgDRT-0000Ut-0f;
	Wed, 13 Sep 2023 00:09:15 +0000
Date: Wed, 13 Sep 2023 08:08:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/jffs2/erase.o: warning: objtool: jffs2_erase_pending_blocks()
 falls through to next function __cfi_jffs2_free_jeb_node_refs()
Message-ID: <202309130840.8WQl5Kyz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Kees Cook <keescook@chromium.org>

Hi Sami,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3669558bdf354cd352be955ef2764cde6a9bf5ec
commit: 3c516f89e17e56b4738f05588e51267e295b5e63 x86: Add support for CONFIG_CFI_CLANG
date:   12 months ago
config: x86_64-randconfig-001-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130840.8WQl5Kyz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130840.8WQl5Kyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130840.8WQl5Kyz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jffs2/erase.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function __cfi_jffs2_free_jeb_node_refs()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

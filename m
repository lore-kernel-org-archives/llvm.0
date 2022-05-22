Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B93D66
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653262988; x=1684798988;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6HPVYEYJ4PXExcAbSEpdnO3x6A74dwhZ2wx9pgI6q60=;
  b=X0ndlq65NRld19T1+XayMWT8CaRTVw71zS/hXaaElJ83U2KrzA1ie4+1
   Pur0NnbZ4hoZofH1Bn+/Q0BY9msb86B8TA/JevPqOP8AmCmuHzaAVhbRp
   aCm0ks+j2hffiDhuB11HmY7PbCNVqBSofEysPaDtIdgoQ92oyuzkQFwhG
   1mAXVRhxRgJXej6YqxKgifBStb4AB/LAmG0IxGCqgDK4O1iBWbKiVYogy
   O00amwSRlvYgeF8ttXBRYBZkY6sjXFDvyRIK3LpUFtEaLPoUBmzkD1akc
   Ip6AePgsJ5hYsaqRrC+mm/niNnuZ2r7a9aU+buCJdjLuO4fWHKqDCkf4c
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="253562152"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="253562152"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 16:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="900276591"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 May 2022 16:43:06 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsvE2-0000iZ-8K;
	Sun, 22 May 2022 23:43:06 +0000
Date: Mon, 23 May 2022 07:42:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/bpf/local_storage.o: warning: objtool: gelf_update_symshndx:
 invalid section index
Message-ID: <202205230731.FRo1rt08-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b0986a3613c92f4ec1bdc7f60ec66fea135991f
commit: 4abff6d48dbcea8200c7ea35ba70c242d128ebf3 objtool: Fix code relocs vs weak symbols
date:   4 weeks ago
config: x86_64-randconfig-a013-20220523 (https://download.01.org/0day-ci/archive/20220523/202205230731.FRo1rt08-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443dbaba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4abff6d48dbcea8200c7ea35ba70c242d128ebf3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4abff6d48dbcea8200c7ea35ba70c242d128ebf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/local_storage.o: warning: objtool: no non-local symbols !?
>> kernel/bpf/local_storage.o: warning: objtool: gelf_update_symshndx: invalid section index

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

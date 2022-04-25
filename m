Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457772562
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650901399; x=1682437399;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ncHMbBZ4m83sEc5SDGrjDhVdY42YZNX4BucyWDrc6kw=;
  b=kmEZVHrfozihcs774f3dYiv7kFuHR6r14Cmdvfi0TfwRxvBFJvGtS2VJ
   jtznvAvK+mjDZN3YYp01HK2qgvneO0394t13WXKMW0R1eFLgadmXlj70g
   LEVgVYzG+WpxdE1MhyAf/q3xVZxQ2Cj3372Pw3hi47McPiOkOP9IOCHqZ
   fdcQtfrIXzSEobtKRdSzUYIldZKkaWadtqC1eupxsSTrLFpPhBI04Rm5c
   tIVqD/hFshHhFJeKcaXo4Oelji2607/CzJN00d6yZKSdkVpHSccAqXJw9
   fsycRl4ybFpbkCSdkwK8A0Wg/aLqRLBpyQgVPLtrDbTfFjvNfbm09vjmr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265085539"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; 
   d="scan'208";a="265085539"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 08:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; 
   d="scan'208";a="537645272"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2022 08:43:17 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nj0rt-0002dP-4P;
	Mon, 25 Apr 2022 15:43:17 +0000
Date: Mon, 25 Apr 2022 23:42:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: fs/jffs2/erase.o: warning: objtool: jffs2_erase_pending_blocks()
 falls through to next function jffs2_free_jeb_node_refs()
Message-ID: <202204252337.y1E8EFDh-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af2d861d4cd2a4da5137f795ee3509e6f944a25b
commit: e6f393bc939d566ce3def71232d8013de9aaadde objtool: Fix function fallthrough detection
date:   2 years, 11 months ago
config: x86_64-randconfig-a005-20220425 (https://download.01.org/0day-ci/archive/20220425/202204252337.y1E8EFDh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e6f393bc939d566ce3def71232d8013de9aaadde
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e6f393bc939d566ce3def71232d8013de9aaadde
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/jffs2/erase.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function jffs2_free_jeb_node_refs()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

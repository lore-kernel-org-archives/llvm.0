Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24281C2CC;
	Mon, 19 Jun 2023 23:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687216022; x=1718752022;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/tA/j+6qNbrNUsZI+0oHYyb58DsNBMmP5NdrzMdWXdc=;
  b=I1R5X0ptNr1xyYtPWEZO3lVO/E+HHkwz4cmgws7luKtBYJQZWXv+WWq5
   IagcTx3M8GyrUtkbTGqzf+ZAt+pb8Jb0k/bqreB/5PUN+jvrqYWmD9EXG
   F8w5eEdubEoKhVmTh3Px87wCetY4kIXZNE+wg8FZNBJBJEp1XbkYN4N8v
   sZrM332Hz/lqDYgNKZW7qrIWJCuzH4PfbXldEmFn3dXJnrxlbupTEzj0t
   6IR5CT3MN7zqysXou5BMu/i8Gsc93cr9XCJVBvTPSsXAdwEfAOX/lKIlW
   ZGqbaafTFXKoQkr6Jvtz3TkavAbJTRRDKCUyJm6+cbmG8SJm244s+UImg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423391447"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="423391447"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 16:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858351582"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="858351582"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2023 16:06:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBNxT-0005E8-1D;
	Mon, 19 Jun 2023 23:06:51 +0000
Date: Tue, 20 Jun 2023 07:06:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/input/mouse/cyapatp.o: warning: objtool:
 .text.cyapa_update_fw_store: unexpected end of section
Message-ID: <202306200713.V6WGA5GA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

Hi Vlastimil,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dbad9ce9397ef7f891b4ff44bad694add673c1a1
commit: e240e53ae0abb0896e0f399bdfef41c69cec3123 mm, slub: add CONFIG_SLUB_TINY
date:   7 months ago
config: x86_64-randconfig-a001-20230620 (https://download.01.org/0day-ci/archive/20230620/202306200713.V6WGA5GA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200713.V6WGA5GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200713.V6WGA5GA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/mouse/cyapatp.o: warning: objtool: .text.cyapa_update_fw_store: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

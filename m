Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03FB37F;
	Sat, 26 Aug 2023 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693011592; x=1724547592;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JmNOP+v4XV4AbxwXbPZJZ+ZGME+6wo5jD/+VE/v48vg=;
  b=hr7UBMhWvcAX9R5LXFswvNdUI1mQZmVfwf33ko2/H6Yom5ijrrDgxNlY
   AexHfYkRNi9Am9YSvqEwg7FGzCcQuUvyhyqlHLcdc6PgeLknJGPFGWkmW
   ZAWcQWIAWO4lgC0JFrR5ha4BfGRpj/6jsbmhXn0Kn7ijK+zRIneYOoanW
   WjF9Qob5oCIhA6dK/KElrMGVdbyF36ivQxWQ9uAFrEUzZFE3QATi7yuQu
   pjoL0wQuZr0nYp2Qiw2oCJRlV5/E9tzPU/0CKg+1sBaOKTktmFr49f9dU
   7lOrwshQZbw5fvbmbjBOCgACGCuyLmQLqAoxwX+qseGkyM0ZKrQH7MJSr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461198296"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="461198296"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="737650196"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="737650196"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2023 17:59:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZheX-0004Bn-2r;
	Sat, 26 Aug 2023 00:59:49 +0000
Date: Sat, 26 Aug 2023 08:59:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/jffs2/jffs2.o: warning: objtool: jffs2_erase_pending_blocks()
 falls through to next function jffs2_free_jeb_node_refs()
Message-ID: <202308260800.yVGjNA9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: Sami Tolvanen <samitolvanen@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   382d4cd1847517ffcb1800fd462b625db7b2ebea
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   1 year, 3 months ago
config: x86_64-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260800.yVGjNA9H-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260800.yVGjNA9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260800.yVGjNA9H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jffs2/jffs2.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function jffs2_free_jeb_node_refs()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

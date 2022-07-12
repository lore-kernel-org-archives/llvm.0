Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E84699
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657649191; x=1689185191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OY3Eq99+maed0wT5vsCAhmiHbzhccXIeGcTBur8GH8=;
  b=SanwA6FU0gYriI0gDVL4q5kqD01hn4ucUwguVohe/o5C2bIjxGSAF/Od
   qQ6imz79P4N2C6DlXivnH+szKtCqLw8W/iKALLMf9IaupD48veqPpGBp4
   d/SuRlhtYzZ3vuc1RW/UBrpkfKZkSDrs7WIyn1u5T6UuCwFda30XqNad0
   OrBYW0elP/qSvXtX2gj66L6FTKSgD37VgyImcLGZGHJOndcp8MN/Z3oRN
   rk1pkfoqBgsrcGjDX/Hxf6dh2VoGYookMDSSP0YEFLhkv8YoUMCHx/Qyb
   wNSOUZWQXaWZRJC5lw3hD4z7y4SQoJwUBb29uqcbKHihJNgrxTq4gv2Yt
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="265419769"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="265419769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 11:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="622609782"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 11:06:29 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBKHE-0002YZ-E2;
	Tue, 12 Jul 2022 18:06:28 +0000
Date: Wed, 13 Jul 2022 02:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [martinetd:9p-next 11/11] net/9p/trans_fd.c:275:12: warning: unused
 variable 'failme'
Message-ID: <202207130211.3Gyzsvmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/martinetd/linux.git 9p-next
head:   c249fb4f91931b9f010849134e95d33e388c375b
commit: c249fb4f91931b9f010849134e95d33e388c375b [11/11] 9p: roll p9_tag_remove into p9_req_put
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220713/202207130211.3Gyzsvmp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/martinetd/linux/commit/c249fb4f91931b9f010849134e95d33e388c375b
        git remote add martinetd https://github.com/martinetd/linux.git
        git fetch --no-tags martinetd 9p-next
        git checkout c249fb4f91931b9f010849134e95d33e388c375b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/9p/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/9p/trans_fd.c:275:12: warning: unused variable 'failme' [-Wunused-variable]
   static int failme;
              ^
   1 warning generated.


vim +/failme +275 net/9p/trans_fd.c

   268	
   269	/**
   270	 * p9_read_work - called when there is some data to be read from a transport
   271	 * @work: container of work to be done
   272	 *
   273	 */
   274	
 > 275	static int failme;
   276	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

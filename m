Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8643E8
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655995727; x=1687531727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+M6xTI8fcv0XoP4gDaiPmN5PUSrKQKhNoe1i4lIUXU=;
  b=f8VwdEuQxbYQwW28dFb9CERykyqf91wuBYqyzi1BuO679YLpQxE+zQMC
   8q8DmuqyEAmha2wUnqiSWjUHSrOap14rEfWNIxDcqM0ugsQIqjVQoLvek
   yaU5tnAukR0mZ+ob0/yaOuySPysmz634O9ZCAMJpNHLtLWCyAbWoz6KsR
   q2TwTSDRX+1yGWCOZsnFfLDJz7x8d5tTLHYtxHkmBORLiDaGQ8kBDOJH2
   1Q5h1vK7gPa2HqNUc6IeLUZM283Irx08a/NxXGQfrLqAtMe8Kc8l6xaQQ
   58TE0z0dCjECMfAMKAw6cbOT2SP1M5AdODJAh1RHTQ7ISBG1A47GamJwt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="261170031"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="261170031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 07:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="588645360"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Jun 2022 07:48:45 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4O8S-0001QH-Lz;
	Thu, 23 Jun 2022 14:48:44 +0000
Date: Thu, 23 Jun 2022 22:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:bpf/tramp_11 19/21] kernel/bpf/trampoline.c:81:17:
 warning: address of stack memory associated with parameter 'id' returned
Message-ID: <202206232231.u4YhpRYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tramp_11
head:   c807110aa605281263da02a78af57847f5c4275e
commit: a2660a85cc98b2db2577fd844985884cff0e5cae [19/21] bpf: Add support to store multiple ids in bpf_tramp_id object
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220623/202206232231.u4YhpRYy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=a2660a85cc98b2db2577fd844985884cff0e5cae
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tramp_11
        git checkout a2660a85cc98b2db2577fd844985884cff0e5cae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:81:17: warning: address of stack memory associated with parameter 'id' returned [-Wreturn-stack-address]
                   return (u64) &id;
                                 ^~
   1 warning generated.


vim +/id +81 kernel/bpf/trampoline.c

    77	
    78	static u64 bpf_tramp_id_key(struct bpf_tramp_id *id)
    79	{
    80		if (bpf_tramp_id_is_multi(id))
  > 81			return (u64) &id;
    82		else
    83			return ((u64) id->obj_id << 32) | id->id[0];
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF57E;
	Tue,  5 Sep 2023 04:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693886475; x=1725422475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kX4sm+yjgjdwEFP7CXKf6wXFfzDDNaNHzKbZiCCojNc=;
  b=JQnqxZsEwxdo913bpUWuIc4NjRM2xFw33YDs84QgBr82fFdyJEESa0Hv
   hqjUxD1LPOmKm1WrEtd7rYY7Dnw33xe8NWJ2glTbzD4gqD1FxYRgVmF22
   LcZ4QNx3ZiV85e8BCT3jTRO8B5MEhTg0V0MsMgdSCbXnUjsmPS+KbW/gm
   O9hhcyjFjULwez/PTu7sEity13s1yvpvePr8YCxeaZtS0dQEzQI2ubdsf
   OTfz/D9I0sJrauzWM0e8o5U5PwxB3YUA01wM8ER9tQVvZ7I9vn8My5T8A
   4l/yCN++N2h5dxppVtDXNq4JGyZ4qeDP8RRa9dGZRYYPE4fL6KJJ6gMDv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356186884"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356186884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 21:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="744127071"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="744127071"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Sep 2023 21:01:03 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdNFN-0001Db-19;
	Tue, 05 Sep 2023 04:01:01 +0000
Date: Tue, 5 Sep 2023 12:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:v6.5-pks-core 17/34] include/linux/stddef.h:10:7: error:
 Expected an identifier after {
Message-ID: <202309051156.S7BqDAQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git v6.5-pks-core
head:   1333a49c014b15a2cf7584b4a3641f03e0602a40
commit: 3ee964a4772cd93458d8dbf48f2fd97b8b65551d [17/34] FIXME x86/entry: Add auxiliary pt_regs space
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230905/202309051156.S7BqDAQ8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051156.S7BqDAQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051156.S7BqDAQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/stddef.h:10:7: error: Expected an identifier after {
   enum {
         ^
>> include/linux/stddef.h:11:11: error: expected newline
    false = 0,
             ^
>> include/linux/stddef.h:13:1: error: invalid instruction mnemonic '}'
   };
   ^


vim +10 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30   9  
6e218287432472 Richard Knutsson 2006-09-30 @10  enum {
6e218287432472 Richard Knutsson 2006-09-30 @11  	false	= 0,
6e218287432472 Richard Knutsson 2006-09-30  12  	true	= 1
6e218287432472 Richard Knutsson 2006-09-30 @13  };
6e218287432472 Richard Knutsson 2006-09-30  14  

:::::: The code at line 10 was first introduced by commit
:::::: 6e21828743247270d09a86756a0c11702500dbfb [PATCH] Generic boolean

:::::: TO: Richard Knutsson <ricknu-0@student.ltu.se>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

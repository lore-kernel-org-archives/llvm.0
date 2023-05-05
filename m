Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EC7E;
	Fri,  5 May 2023 02:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683253742; x=1714789742;
  h=date:from:cc:subject:message-id:mime-version;
  bh=M5nyEpGjpvE+AA6AA5PM78a92mwPYSJnVCV4LkRnUk8=;
  b=hyCLKd+k+VKUDKNSByOKltqGXb/P7pKQUy3MSMkOqSox4084sIi+e2YK
   HPk2IRnM+M9ZF7DE0k3GLRj5yEM6LSyNn71MiFvc0i1Dpcv47uBLoIB6V
   xa8CoJ+zWBK2fQuPm8XyIHd0Ivh2qYUx4igDEGL4W76mRhlV039p4Q001
   B2iopN5Bd1EA+ellIn2ArTzqN0fFn3xbMhx7Gwe5d3eHlraKldE2GKTmR
   njcNc+4/pMfnrD90vChL2LdQIno2gVlceBQZWmTw1siUpLxprhwC9moko
   RrTEzjE4/A2EVpQR4nuhJvhq1Gkg2EyANNvYa6oJ1WH7JeqlHMbP/euj5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="352142540"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="352142540"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 19:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="700164949"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="700164949"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 May 2023 19:28:49 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pulBg-00001h-2e;
	Fri, 05 May 2023 02:28:48 +0000
Date: Fri, 5 May 2023 10:28:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	matthieu.baerts@tessares.net
Subject: [matttbe-net-next:b4/mptcp-issue-368-selftests-old-kernels
 17827/30000] .topdeps: warning: ignored by one of the .gitignore files
Message-ID: <202305051041.QtaLXJQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jenkins,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git b4/mptcp-issue-368-selftests-old-kernels
head:   71ffa0bf649c2228f63bcb4633c8b02bb2b266af
commit: e8a6a7e84c5b102e6d35e436f83832915f6022ee [17827/30000] tgupdate: merge t/upstream base into t/upstream
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051041.QtaLXJQ4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git/commit/?id=e8a6a7e84c5b102e6d35e436f83832915f6022ee
        git remote add matttbe-net-next https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git
        git fetch --no-tags matttbe-net-next b4/mptcp-issue-368-selftests-old-kernels
        git checkout e8a6a7e84c5b102e6d35e436f83832915f6022ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051041.QtaLXJQ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .b4-config: warning: ignored by one of the .gitignore files
   .cirrus.yml: warning: ignored by one of the .gitignore files
   .git_markup: warning: ignored by one of the .gitignore files
   .github/workflows/build-validation.yml: warning: ignored by one of the .gitignore files
   .github/workflows/checkpatch.yml: warning: ignored by one of the .gitignore files
   .github/workflows/notif.yml: warning: ignored by one of the .gitignore files
   .github/workflows/update-tg-tree.yml: warning: ignored by one of the .gitignore files
>> .topdeps: warning: ignored by one of the .gitignore files
>> .topmsg: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

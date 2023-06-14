Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59FE8463;
	Wed, 14 Jun 2023 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686744052; x=1718280052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDjUpYasRxyrhlL0uWcijIk60YRM1SQaCp/n9Qm4DMk=;
  b=HcSbqT7QWehzG3Oqseq781rhu/ftrjXOGiNV3Zu+Y0VLzgnTT0s7Qce/
   3b1SpsDlULrHhFUcRAwTWG8IXxpaqAwFvX47gfA1XR2S5xLegru7VXE74
   +VID0bgOMRjdZmi5QDZOSTzWqU4v6FSaHtamjSSk8Ci2I/F5vRTVaaWVN
   8oMuKI+6pf4i015k9auE6EgDzoWtukYN22zMJMPnG7SuRa4HMhy2LUNcB
   TPMyyydZc6+0NFZo44QNvXlFwKUTtughYUReGtun4AHHfofUx68W5fugD
   TCtmsixoaTR0tVHJ2zO4Eulr147rHKxrjy6rsstOGm7eXH2i5Ubr+cArY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="356084520"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="356084520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1042181936"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="1042181936"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2023 05:00:38 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9PAz-0000bB-1g;
	Wed, 14 Jun 2023 12:00:37 +0000
Date: Wed, 14 Jun 2023 19:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jon Tourville <jontourville@me.com>
Subject: [linux-next:master 8650/9793]
 security/apparmor/policy_unpack.c:1144: warning: expecting prototype for
 verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index()
 instead
Message-ID: <202306141934.UKmM9bFX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b16049b21162bb649cdd8519642a35972b7910fe
commit: bd1f4873db0451a3f004062f9ca09a978605943a [8650/9793] apparmor: fix profile verification and enable it
config: i386-randconfig-i001-20230614 (https://download.01.org/0day-ci/archive/20230614/202306141934.UKmM9bFX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bd1f4873db0451a3f004062f9ca09a978605943a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bd1f4873db0451a3f004062f9ca09a978605943a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash security/apparmor/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141934.UKmM9bFX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/policy_unpack.c:1144: warning: Function parameter or member 'table_size' not described in 'verify_dfa_accept_index'
>> security/apparmor/policy_unpack.c:1144: warning: expecting prototype for verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index() instead


vim +1144 security/apparmor/policy_unpack.c

736ec752d95e91 John Johansen 2010-07-29  1137  
bd1f4873db0451 John Johansen 2023-04-17  1138  /**
bd1f4873db0451 John Johansen 2023-04-17  1139   * verify_dfa_accept_xindex - verify accept indexes are in range of perms table
bd1f4873db0451 John Johansen 2023-04-17  1140   * @dfa: the dfa to check accept indexes are in range
bd1f4873db0451 John Johansen 2023-04-17  1141   * table_size: the permission table size the indexes should be within
bd1f4873db0451 John Johansen 2023-04-17  1142   */
bd1f4873db0451 John Johansen 2023-04-17  1143  static bool verify_dfa_accept_index(struct aa_dfa *dfa, int table_size)
736ec752d95e91 John Johansen 2010-07-29 @1144  {
736ec752d95e91 John Johansen 2010-07-29  1145  	int i;
736ec752d95e91 John Johansen 2010-07-29  1146  	for (i = 0; i < dfa->tables[YYTD_ID_ACCEPT]->td_lolen; i++) {
bd1f4873db0451 John Johansen 2023-04-17  1147  		if (ACCEPT_TABLE(dfa)[i] >= table_size)
e37986097ba63c Zou Wei       2020-04-28  1148  			return false;
736ec752d95e91 John Johansen 2010-07-29  1149  	}
e37986097ba63c Zou Wei       2020-04-28  1150  	return true;
736ec752d95e91 John Johansen 2010-07-29  1151  }
736ec752d95e91 John Johansen 2010-07-29  1152  

:::::: The code at line 1144 was first introduced by commit
:::::: 736ec752d95e91e77cc0e8c97c057ab076ac2f51 AppArmor: policy routines for loading and unpacking policy

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

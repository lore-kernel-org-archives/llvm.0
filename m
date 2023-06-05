Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25525256;
	Mon,  5 Jun 2023 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686005311; x=1717541311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gG4UZz+H3FxxUASHJuEkzYCv8IA0IqjTmFp3k4VLKng=;
  b=hSYx+fwDT3E3aPdxhKmm9ydhSEvo16yuG8RO+MKu96L5K0AN3ayCbnhy
   1aWIWNbAt8Qdfj8a4zYsMj83uDc+MGLaSSBcIn+4/3FKNUUJ5/O44Adwf
   EmGlfAAUB842Q1rDouen1gH/HB+oT+wZaOiUVqIbop6vSbUslKmSICdio
   7Ovc+KqUwKODnxVDERymy6uLFlbMI3xJsCOxfQ3mKYPZLygK2IbtN6OZQ
   scpxvnS4x4zmkemQInUWUHMzOoZpPnNuJYz87Kf42pHALFAZPg2whiRUd
   brS+zmK3iRcV1IEYK1JryaWkqdwriptn/Lwf5nmHQQ8jlOZIUvBvRhZFY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422329150"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="422329150"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 15:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659286949"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="659286949"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2023 15:48:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6J00-0004VH-2R;
	Mon, 05 Jun 2023 22:48:28 +0000
Date: Tue, 6 Jun 2023 06:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: [mic:next 8/12] security/landlock/net.c:165:50: error: expected ';'
 after top level declarator
Message-ID: <202306060602.Grdt8eev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   33ccf2aa61758ef2887862301b574f5d9a77553c
commit: 6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27 [8/12] landlock: Add network rules and TCP hooks support
config: x86_64-randconfig-a001-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060602.Grdt8eev-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git/commit/?id=6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27
        git remote add mic git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
        git fetch --no-tags mic next
        git checkout 6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060602.Grdt8eev-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/landlock/net.c:165:50: error: expected ';' after top level declarator
   static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
                                                    ^
                                                    ;
>> security/landlock/net.c:172:37: error: invalid application of 'sizeof' to an incomplete type 'struct security_hook_list[]'
           security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   security/landlock/net.c:165:34: warning: tentative array definition assumed to have one element
   static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
                                    ^
   1 warning and 2 errors generated.


vim +165 security/landlock/net.c

   164	
 > 165	static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
   166		LSM_HOOK_INIT(socket_bind, hook_socket_bind),
   167		LSM_HOOK_INIT(socket_connect, hook_socket_connect),
   168	};
   169	
   170	__init void landlock_add_net_hooks(void)
   171	{
 > 172		security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

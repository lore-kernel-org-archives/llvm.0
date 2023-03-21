Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392DD30A;
	Tue, 21 Mar 2023 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679421854; x=1710957854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWnKpoXH9LJKGtKfB4Tf/lY7B46BCYh21/k0WHftRn4=;
  b=hpqlRIq97rwk0KDSiBAcDvEZJF1fIOYouTcJQhlcEq+du+Bsme2sgt1n
   w+5PwtlMYeEkk6ZvJNrprbMMR1pnbciIfD5fLQjxcvtxX2mFuCLfn6GMT
   RJd+uK5ybsfkC6wsw0sARsiA1yRvO11hwK8DjsnUTJmrsdhpf+7Iu/TEr
   J08q0ta5pxkZpRCOhvmIGev2Llz6iuE2Bc+hGli42V09TQ85iWn8He0ix
   hpSA3+sA7emUMR6T83e1vy5eLQOkuZvZUHjQl1nBtiZ89SMJnDgwsyxCF
   tWBUTrPYvJ+oWbZ9zWdSXNDqQ/mCe71yYrG07OxpjbEzUFl0cp96SgF7U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401591105"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="401591105"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792197649"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792197649"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 11:03:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegKm-000CEv-0A;
	Tue, 21 Mar 2023 18:03:44 +0000
Date: Wed, 22 Mar 2023 02:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 3/20]
 drivers/nvme/common/keyring.c:14:5: warning: no previous prototype for
 function 'nvme_keyring_init'
Message-ID: <202303220128.ky1IoKee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: e9b1071a27a0122e041829e87e86852c8b80c04a [3/20] nvme-keyring: register '.nvme' keyring
config: mips-randconfig-r001-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220128.ky1IoKee-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=e9b1071a27a0122e041829e87e86852c8b80c04a
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout e9b1071a27a0122e041829e87e86852c8b80c04a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/nvme/common/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220128.ky1IoKee-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/common/keyring.c:16:6: warning: unused variable 'err' [-Wunused-variable]
           int err;
               ^
>> drivers/nvme/common/keyring.c:14:5: warning: no previous prototype for function 'nvme_keyring_init' [-Wmissing-prototypes]
   int nvme_keyring_init(void)
       ^
   drivers/nvme/common/keyring.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_keyring_init(void)
   ^
   static 
>> drivers/nvme/common/keyring.c:31:6: warning: no previous prototype for function 'nvme_keyring_exit' [-Wmissing-prototypes]
   void nvme_keyring_exit(void)
        ^
   drivers/nvme/common/keyring.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void nvme_keyring_exit(void)
   ^
   static 
   3 warnings generated.


vim +/nvme_keyring_init +14 drivers/nvme/common/keyring.c

    13	
  > 14	int nvme_keyring_init(void)
    15	{
    16		int err;
    17	
    18		nvme_keyring = keyring_alloc(".nvme",
    19					     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
    20					     current_cred(),
    21					     (KEY_POS_ALL & ~KEY_POS_SETATTR) |
    22					     (KEY_USR_ALL & ~KEY_USR_SETATTR),
    23					     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
    24		if (IS_ERR(nvme_keyring))
    25			return PTR_ERR(nvme_keyring);
    26	
    27		return 0;
    28	}
    29	EXPORT_SYMBOL_GPL(nvme_keyring_init);
    30	
  > 31	void nvme_keyring_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

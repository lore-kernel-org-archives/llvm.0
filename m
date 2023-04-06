Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35958320B;
	Thu,  6 Apr 2023 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680799156; x=1712335156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RLhrMy7wRgg6njg69Hr+mSGX1C74fNM5cukPqWsViDo=;
  b=VlZ7A+oHzqOWOhGqyXMZk5E50BsdZhMMdQlC1/IDzb1WyVC61AHV97NG
   rlEpYoiwlRWngbO1w+gjvmDAG99nDcYGmIYz1ULZQCo6ZAEaXqkGZ05Qq
   Aqth47PrsW3PfWYDWrCeiybiAZN2BFicJjvud8DlH11Yp4gT7tnOdMs97
   gguSD5/EEFs3fD6/PSSccYFem6X9OAgqqAYZl0VIaJW12FJiqtUx3OB3u
   Jnr8ttds1BNaUSA9hBMKHEG67o9MhB95E0OySmJDMyBAoV/MOEvwMWZjd
   k2lnka4cfaceY54QegdNsTyg5t4G4jBTCR0wZbKw6R4CYogqNuK2+u4zx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429074484"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="429074484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 09:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811065658"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="811065658"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2023 09:39:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkSdW-000RW6-2w;
	Thu, 06 Apr 2023 16:38:58 +0000
Date: Fri, 7 Apr 2023 00:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@redhat.com>, linux-nfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anna.Schumaker@netapp.com, Olga.Kornievskaia@netapp.com
Subject: Re: [PATCH 3/6] NFS: add superblock sysfs entries
Message-ID: <202304070036.ohHbkfab-lkp@intel.com>
References: <706fb7c1e5bfd869165a61a51663427104567c49.1680786859.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <706fb7c1e5bfd869165a61a51663427104567c49.1680786859.git.bcodding@redhat.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/NFS-rename-nfs_client_kset-to-nfs_kset/20230406-221247
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/706fb7c1e5bfd869165a61a51663427104567c49.1680786859.git.bcodding%40redhat.com
patch subject: [PATCH 3/6] NFS: add superblock sysfs entries
config: i386-randconfig-a004-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070036.ohHbkfab-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d1dbf0643a167363732daa337b0e519f44190733
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Coddington/NFS-rename-nfs_client_kset-to-nfs_kset/20230406-221247
        git checkout d1dbf0643a167363732daa337b0e519f44190733
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070036.ohHbkfab-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/sysfs.c:213:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +213 fs/nfs/sysfs.c

   210	
   211	void nfs_sysfs_add_server(struct nfs_server *server)
   212	{
 > 213		int ret;
   214		ret = kobject_init_and_add(&server->kobj, &nfs_sb_ktype,
   215					&nfs_kset->kobj, "server-%d", server->s_sysfs_id);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624029CA
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642347483; x=1673883483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRQRfxDj7ZKfHbEj/AsMl41WqOilGgjxJMPYxRMOKkE=;
  b=FGZ2PBS3qyiCFwCVrS7ZvU75LOjJKKkbt+WTXbxzHJ0ETbsvg+iltYe+
   dZjZ0pNUssLo1lOsLytoVUD8cUYxoNE7pverj4GsOnhBHDTrQd9BX5NS7
   YGeF5bj326wGPnF3imRoxJOh6QT+/nwVtOnR8Si/G/nVTvNk1Wg3J1EuV
   iAbwLkMMa6uirEmVvsyucJB5bHMDarxGZVYCnaqWvo7P/C3jn+A5B0WLf
   +h+DJSxnuLszhsJqfykE6uYyMKL0GHGqgCmpVstgoRskuPZqxjuMpLXVW
   T0nEbBXsM/I8NfvlLj04uTfnKDJDB/ims6gEs9cQDzo4crzzY8viKTAyH
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="268870614"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="268870614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 07:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="692808092"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jan 2022 07:38:01 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n97bV-000AoE-63; Sun, 16 Jan 2022 15:38:01 +0000
Date: Sun, 16 Jan 2022 23:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [bvanassche:scsi-move-scsi-pointer 16/18]
 drivers/scsi/fdomain.c:122:22: warning: no previous prototype for function
 'fdomain_scsi_pointer'
Message-ID: <202201162349.t2n6wgaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/bvanassche/linux scsi-move-scsi-pointer
head:   7173550f8dd7130891118452742bb6e99b63fd27
commit: 6eea006091e2b2b428a910feb8041bbb99aa707d [16/18] fdomain: Move the SCSI pointer to private command data
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220116/202201162349.t2n6wgaH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a3175c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/6eea006091e2b2b428a910feb8041bbb99aa707d
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-move-scsi-pointer
        git checkout 6eea006091e2b2b428a910feb8041bbb99aa707d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/fdomain.c:122:22: warning: no previous prototype for function 'fdomain_scsi_pointer' [-Wmissing-prototypes]
   struct scsi_pointer *fdomain_scsi_pointer(struct scsi_cmnd *cmd)
                        ^
   drivers/scsi/fdomain.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct scsi_pointer *fdomain_scsi_pointer(struct scsi_cmnd *cmd)
   ^
   static 
   1 warning generated.


vim +/fdomain_scsi_pointer +122 drivers/scsi/fdomain.c

   121	
 > 122	struct scsi_pointer *fdomain_scsi_pointer(struct scsi_cmnd *cmd)
   123	{
   124		struct fdomain_priv *fcmd = scsi_cmd_priv(cmd);
   125	
   126		return &fcmd->scsi_pointer;
   127	}
   128	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

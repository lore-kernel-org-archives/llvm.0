Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B82C82
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642000797; x=1673536797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8ls+oVuaFbFTtUpRnfkoRc16g9QZfj/QoL+F0BHQ/Q=;
  b=Xtm6cmg0C5Mr8LqJwlZ7Go9MgDwAxKroo2Wg1Chodbo0YYy/sQWkZssD
   EWKfcAos96gddQUj+9fi0b4VvsSBGKMhgZKS3lW0HJK+u+wmazS1daV3P
   cYrVBku+9gd4CMBKo9az7aZFW7v5nuiD7j2EjHAEQwI1k/Xx87qzDgFPy
   So8bXq/IZ23w6XWuDdPczKfW9vkdtSDq+eWk2ZLPNqH281wblLlC204nL
   GnlDQOTnbgp1oXxkKeHAF7aZb+tu9ZxbtGs9asDy6uooCtLFrjXx0Bbnc
   +isM5nxBmhAET+Y0J240Xb/h4u4b4ceuuNJdulyXtrVvuc5LaFtVarqgF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="224449698"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="224449698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 07:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="576575950"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2022 07:19:55 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7fPm-00060T-TQ; Wed, 12 Jan 2022 15:19:54 +0000
Date: Wed, 12 Jan 2022 23:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [dlemoal-libata:for-next 85/106] drivers/ata/ahci_st.c:233:34:
 warning: unused variable 'st_ahci_match'
Message-ID: <202201122335.B7ADTynl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Damien,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git for-next
head:   7914e9624dd7ce17d3d3b1dcd6c3fe5d366b228c
commit: 3e7a673b5674512efdcd9ec5ff154ee697c3f7ef [85/106] ata: ahci_st: add compile test support
config: hexagon-buildonly-randconfig-r005-20220112 (https://download.01.org/0day-ci/archive/20220112/202201122335.B7ADTynl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git/commit/?id=3e7a673b5674512efdcd9ec5ff154ee697c3f7ef
        git remote add dlemoal-libata git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git
        git fetch --no-tags dlemoal-libata for-next
        git checkout 3e7a673b5674512efdcd9ec5ff154ee697c3f7ef
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ata/ahci_st.c:233:34: warning: unused variable 'st_ahci_match' [-Wunused-const-variable]
   static const struct of_device_id st_ahci_match[] = {
                                    ^
   1 warning generated.


vim +/st_ahci_match +233 drivers/ata/ahci_st.c

76884cb2f7da52 Lee Jones    2014-02-26  232  
09de99db23df55 Kiran Padwal 2014-07-22 @233  static const struct of_device_id st_ahci_match[] = {
76884cb2f7da52 Lee Jones    2014-02-26  234  	{ .compatible = "st,ahci", },
76884cb2f7da52 Lee Jones    2014-02-26  235  	{},
76884cb2f7da52 Lee Jones    2014-02-26  236  };
76884cb2f7da52 Lee Jones    2014-02-26  237  MODULE_DEVICE_TABLE(of, st_ahci_match);
76884cb2f7da52 Lee Jones    2014-02-26  238  

:::::: The code at line 233 was first introduced by commit
:::::: 09de99db23df55c7415d110f6c62281dedd77384 ahci: st: Make of_device_id array const

:::::: TO: Kiran Padwal <kiran.padwal21@gmail.com>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648F186B;
	Wed, 29 Mar 2023 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680083327; x=1711619327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1/PCtua1FgqA5pURoeCAlIQkLu+Pipahz2ihL2krkg=;
  b=YQ6HcUJwTFnrEU+CirVivgmw5WPOqN9yL6D1TufRRyQGdkUl6ZLG2HGE
   J3psJdX+K/20twhC/ueXSFJKSF83g891wNZOHjY2GG1sQAH1LukkmKa8c
   MZzpTgqqJoUGiSdgy36NzMfuuvjsaLYbhRtKcf1A//itE6BNqUy68yb92
   E2mdbgmZxfB2KwT68BRViRc+FyzqaSdecbdpXqVu2a7iCDJ0C78VZ/LTS
   EeNpgX9gFRIPsVrDABK1F1508/tp6sOvmyALcJ5aoFI1Mrt2ONQJ2g5se
   jiaiROen67Sc5qrU2Ok4fJSSkpAmm85XQAtio5YWOZdHeUcFW9+2q8qDU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342425578"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="342425578"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 02:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677725091"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="677725091"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2023 02:48:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phSQ9-000JPi-08;
	Wed, 29 Mar 2023 09:48:45 +0000
Date: Wed, 29 Mar 2023 17:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 14/20] drivers/ata/sata_svw.c:323:7: error:
 implicit declaration of function 'of_property_read_reg' is invalid in C99
Message-ID: <202303291738.r5WMDwCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: 093a93c8acb9c1667e13b77a96983c15e4c6fc32 [14/20] ata: Use of_property_read_reg()
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230329/202303291738.r5WMDwCb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=093a93c8acb9c1667e13b77a96983c15e4c6fc32
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout 093a93c8acb9c1667e13b77a96983c15e4c6fc32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/ata/ drivers/fsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291738.r5WMDwCb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ata/sata_svw.c:323:7: error: implicit declaration of function 'of_property_read_reg' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (of_property_read_reg(np, 0, &reg, NULL))
                       ^
   1 error generated.


vim +/of_property_read_reg +323 drivers/ata/sata_svw.c

   302	
   303	static int k2_sata_show_info(struct seq_file *m, struct Scsi_Host *shost)
   304	{
   305		struct ata_port *ap;
   306		struct device_node *np;
   307		int index;
   308	
   309		/* Find  the ata_port */
   310		ap = ata_shost_to_port(shost);
   311		if (ap == NULL)
   312			return 0;
   313	
   314		/* Find the OF node for the PCI device proper */
   315		np = pci_device_to_OF_node(to_pci_dev(ap->host->dev));
   316		if (np == NULL)
   317			return 0;
   318	
   319		/* Match it to a port node */
   320		index = (ap == ap->host->ports[0]) ? 0 : 1;
   321		for (np = np->child; np != NULL; np = np->sibling) {
   322			u64 reg;
 > 323			if (of_property_read_reg(np, 0, &reg, NULL))
   324				continue;
   325			if (index == reg) {
   326				seq_printf(m, "devspec: %pOF\n", np);
   327				break;
   328			}
   329		}
   330		return 0;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

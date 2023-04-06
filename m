Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0A2F50;
	Thu,  6 Apr 2023 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680775735; x=1712311735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AS6IF4ugLdcPyMI8SEZisJJpmDNET0nTZY9s8WqA3zA=;
  b=n+fn8MNRf7dDFaRkQYkdFEm8DekmnLU5Bm/dZzR284mod/L9bS+5wPiT
   Y+cl7R9Y0WDf4ldIvqjnlakSMRRMtTfEnl+gNkcMZ4Y9VxcVgRNEyoJpI
   +O/vPZZgjxah39m1atp9VdztucFuD1Tm33UXwyZ+Uzdy15n0aTtBYKb5C
   +KHx2D/bpdSDtKHUS+Qn1Jtz5FwCVh/x4Gsy/DPGJv75Q06rwwp/cj0Zy
   /adi6cUNLFQ3iQYC1P7wXTSYdpAhpgousukSQGCk3QgCmSHgM8eC6UTIw
   1ndgjZX75CIX6UEiEeb54mKWiYm1lvboCdRmcS12kriu7VZdxPrzAcZ6Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323074871"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323074871"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 03:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717399803"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="717399803"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Apr 2023 03:08:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkMXv-000RI0-0r;
	Thu, 06 Apr 2023 10:08:47 +0000
Date: Thu, 6 Apr 2023 18:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 7065/9787] drivers/bluetooth/hci_qca.c:1894:37:
 warning: unused variable 'qca_soc_data_wcn6855'
Message-ID: <202304061839.hi01VPl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: e5a3f2af003660934e660d53cdc6302c6b94a70d [7065/9787] Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
config: hexagon-randconfig-r041-20230404 (https://download.01.org/0day-ci/archive/20230406/202304061839.hi01VPl1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e5a3f2af003660934e660d53cdc6302c6b94a70d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e5a3f2af003660934e660d53cdc6302c6b94a70d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061839.hi01VPl1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/bluetooth/hci_qca.c:1894:37: warning: unused variable 'qca_soc_data_wcn6855' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_wcn6855 = {
                                       ^
   7 warnings generated.


vim +/qca_soc_data_wcn6855 +1894 drivers/bluetooth/hci_qca.c

  1893	
> 1894	static const struct qca_device_data qca_soc_data_wcn6855 = {
  1895		.soc_type = QCA_WCN6855,
  1896		.vregs = (struct qca_vreg []) {
  1897			{ "vddio", 5000 },
  1898			{ "vddbtcxmx", 126000 },
  1899			{ "vddrfacmn", 12500 },
  1900			{ "vddrfa0p8", 102000 },
  1901			{ "vddrfa1p7", 302000 },
  1902			{ "vddrfa1p2", 257000 },
  1903		},
  1904		.num_vregs = 6,
  1905		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1906	};
  1907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

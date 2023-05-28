Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6A366;
	Sun, 28 May 2023 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685251438; x=1716787438;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CGVBXEjzT+mOl/vxownxAkK/LkLBt94tb6YF690Gk9U=;
  b=JI0+iG1cQOEGUwBJY002L1quwEgbJPk1UD+4wP2++fTujzbAm5wXxw3o
   91nzws2x8UqIecEsMXu8chLemIr218jPiOG1RBMFB0IHJG/uC7IAbttSI
   u7imt4uJ+hJaseR1WLPkPPU9G23Sw5sjnvDwRjVe9h88CSWA3iUWjejOy
   GQ1UrtQTtVdj9O4bhWEwyZqGHQkWt2QdtFALW601/wQI4qnz13Vbo0M1G
   kM8aa1tW8YuVXsrsjCF7X3+u0fGt7iSs8/epXIsJ9hu3xfVxYLkuG91Xq
   ELhsLWW6MMMdpP4TxQs7hVUfVdg/qIBkpv/bjgJ6oBDO7Ne/5YX99LZdc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="351986369"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="351986369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="738724129"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="738724129"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2023 22:23:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q38sk-000KRq-2j;
	Sun, 28 May 2023 05:23:54 +0000
Date: Sun, 28 May 2023 13:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/asahi-base-6.4 9/19]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1842:35: warning:
 unused variable 'footer'
Message-ID: <202305281352.NAc3nr7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.4
head:   7333165f9eb8694e854bdfb887ce358f501f1d3d
commit: 13de34d5091d4258c8c24cda5367c06bd95a5d18 [9/19] Merge remote-tracking branch 'asahi/bits/080-wifi' into kvm-asm64/asahi-base-6.4
config: x86_64-randconfig-x055-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281352.NAc3nr7T-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=13de34d5091d4258c8c24cda5367c06bd95a5d18
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/asahi-base-6.4
        git checkout 13de34d5091d4258c8c24cda5367c06bd95a5d18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281352.NAc3nr7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1842:35: warning: unused variable 'footer' [-Wunused-variable]
                   struct brcmf_random_seed_footer footer = {
                                                   ^
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1846:9: warning: unused variable 'randbuf' [-Wunused-variable]
                   void *randbuf;
                         ^
   2 warnings generated.


vim +/footer +1842 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1810  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1811  static int brcmf_pcie_download_fw_nvram(struct brcmf_pciedev_info *devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1812  					const struct firmware *fw, void *nvram,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1813  					u32 nvram_len)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1814  {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  1815  	struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1816  	u32 sharedram_addr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1817  	u32 sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1818  	u32 loop_counter;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1819  	int err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1820  	u32 address;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1821  	u32 resetintr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1822  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1823  	brcmf_dbg(PCIE, "Halt ARM.\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1824  	err = brcmf_pcie_enter_download_state(devinfo);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1825  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1826  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1827  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1828  	brcmf_dbg(PCIE, "Download FW %s\n", devinfo->fw_name);
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  1829  	memcpy_toio(devinfo->tcm + devinfo->ci->rambase,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1830  		    (void *)fw->data, fw->size);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1831  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1832  	resetintr = get_unaligned_le32(fw->data);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1833  	release_firmware(fw);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1834  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1835  	/* reset last 4 bytes of RAM address. to be used for shared
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1836  	 * area. This identifies when FW is running
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1837  	 */
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1838  	brcmf_pcie_write_ram32(devinfo, devinfo->ci->ramsize - 4, 0);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1839  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1840  	if (nvram) {
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1841  		size_t rand_len = BRCMF_RANDOM_SEED_LENGTH;
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23 @1842  		struct brcmf_random_seed_footer footer = {
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1843  			.length = cpu_to_le32(rand_len),
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1844  			.magic = cpu_to_le32(BRCMF_RANDOM_SEED_MAGIC),
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1845  		};
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23 @1846  		void *randbuf;
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1847  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1848  		brcmf_dbg(PCIE, "Download NVRAM %s\n", devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1849  		address = devinfo->ci->rambase + devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1850  			  nvram_len;
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  1851  		memcpy_toio(devinfo->tcm + address, nvram, nvram_len);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1852  		brcmf_fw_nvram_free(nvram);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1853  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1854  		if (devinfo->otp.valid) {
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1855  			size_t rand_len = BRCMF_RANDOM_SEED_LENGTH;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1856  			struct brcmf_random_seed_footer footer = {
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1857  				.length = cpu_to_le32(rand_len),
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1858  				.magic = cpu_to_le32(BRCMF_RANDOM_SEED_MAGIC),
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1859  			};
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1860  			void *randbuf;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1861  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1862  			/* Some Apple chips/firmwares expect a buffer of random
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1863  			 * data to be present before NVRAM
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1864  			 */
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1865  			brcmf_dbg(PCIE, "Download random seed\n");
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1866  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1867  			address -= sizeof(footer);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1868  			memcpy_toio(devinfo->tcm + address, &footer,
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1869  				    sizeof(footer));
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1870  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1871  			address -= rand_len;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1872  			randbuf = kzalloc(rand_len, GFP_KERNEL);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1873  			get_random_bytes(randbuf, rand_len);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1874  			memcpy_toio(devinfo->tcm + address, randbuf, rand_len);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1875  			kfree(randbuf);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1876  		}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1877  	} else {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1878  		brcmf_dbg(PCIE, "No matching NVRAM file found %s\n",
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1879  			  devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1880  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1881  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1882  	sharedram_addr_written = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1883  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1884  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1885  	brcmf_dbg(PCIE, "Bring ARM in running state\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1886  	err = brcmf_pcie_exit_download_state(devinfo, resetintr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1887  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1888  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1889  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1890  	brcmf_dbg(PCIE, "Wait for FW init\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1891  	sharedram_addr = sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1892  	loop_counter = BRCMF_PCIE_FW_UP_TIMEOUT / 50;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1893  	while ((sharedram_addr == sharedram_addr_written) && (loop_counter)) {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1894  		msleep(50);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1895  		sharedram_addr = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1896  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1897  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1898  		loop_counter--;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1899  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1900  	if (sharedram_addr == sharedram_addr_written) {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  1901  		brcmf_err(bus, "FW failed to initialize\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1902  		return -ENODEV;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1903  	}
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1904  	if (sharedram_addr < devinfo->ci->rambase ||
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1905  	    sharedram_addr >= devinfo->ci->rambase + devinfo->ci->ramsize) {
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1906  		brcmf_err(bus, "Invalid shared RAM address 0x%08x\n",
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1907  			  sharedram_addr);
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1908  		return -ENODEV;
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1909  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1910  	brcmf_dbg(PCIE, "Shared RAM addr: 0x%08x\n", sharedram_addr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1911  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1912  	return (brcmf_pcie_init_share_ram_info(devinfo, sharedram_addr));
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1913  }
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1914  

:::::: The code at line 1842 was first introduced by commit
:::::: 9587fcd02f3ed021ff3b81f3b18db5f54ce8f663 brcmfmac: pcie: Provide a buffer of random bytes to the device

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B7630;
	Mon,  6 Nov 2023 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2GJ1CZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237698; x=1730773698;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OYie6v46NDOXnoVxp//C1yTzNr+vpp5RK/WLWX0N5Ck=;
  b=Q2GJ1CZvfURe39EL6eYpgOFrFC6L2YB8EtjD+ZPSGLblIfCVrIAdkgLg
   anTOGhhpzg+IQjzq4WhSZD+L875U3RxXNwCv2W+BKZTgznjGuoEtnTwgf
   OxW9fd7sFwDjBLCbdv1dYpFM1C1ZYR7rLqBSOhCifI5Qmr51RrLt//oMU
   U+xC8UpBB05IM1VMWBgsDRWyvHzimdzPj8vKSUN9l7nueMeR+LZNPkDJz
   QEi2UmawEOyzmrTIAiofDT7DbMxxF6yT2NQplbD8l9jO+Bh8oD6ef7soV
   nBjg+4blPN9OZCc6YpIZ32+Ch0/XKOtAh6VsH9KEm28MFO4s4B1c3mtoJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="7828272"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="7828272"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905913972"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="905913972"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 18:27:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpLD-00061G-16;
	Mon, 06 Nov 2023 02:27:51 +0000
Date: Mon, 6 Nov 2023 10:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 13/35]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1998:6: warning:
 variable 'address' is used uninitialized whenever 'if' condition is false
Message-ID: <202311061004.NbdeF1wR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   fc17dc4d1d5bd0baeb8f84a3d9876c17b9f78461
commit: 9ec7838a91c508bba18a68f0f524379549d33db5 [13/35] wifi: brcmfmac: Add support for firmware signatures
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061004.NbdeF1wR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061004.NbdeF1wR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061004.NbdeF1wR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1998:6: warning: variable 'address' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1998 |         if (nvram) {
         |             ^~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:2020:8: note: uninitialized use occurs here
    2020 |                   0, address - devinfo->fw_size - devinfo->ci->rambase);
         |                      ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1998:2: note: remove the 'if' if its condition is always true
    1998 |         if (nvram) {
         |         ^~~~~~~~~~~
    1999 |                 brcmf_dbg(PCIE, "Download NVRAM %s\n", devinfo->nvram_name);
    2000 |                 address = devinfo->ci->rambase + devinfo->ci->ramsize -
    2001 |                           nvram_len;
    2002 |                 memcpy_toio(devinfo->tcm + address, nvram, nvram_len);
    2003 |                 brcmf_fw_nvram_free(nvram);
    2004 | 
    2005 |                 err = brcmf_pcie_populate_footers(devinfo, &address, fwsig);
    2006 |                 if (err)
    2007 |                         brcmf_err(bus, "failed to populate firmware footers err=%d\n", err);
    2008 |         } else {
         |          ~~~~~~~
    2009 |                 brcmf_dbg(PCIE, "No matching NVRAM file found %s\n",
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2010 |                           devinfo->nvram_name);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2011 |         }
         | ~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1977:13: note: initialize the variable 'address' to silence this warning
    1977 |         u32 address;
         |                    ^
         |                     = 0
   1 warning generated.


vim +1998 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1966  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1967  static int brcmf_pcie_download_fw_nvram(struct brcmf_pciedev_info *devinfo,
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1968  					const struct firmware *fw,
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1969  					const struct firmware *fwsig,
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1970  					void *nvram, u32 nvram_len)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1971  {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  1972  	struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1973  	u32 sharedram_addr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1974  	u32 sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1975  	u32 loop_counter;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1976  	int err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1977  	u32 address;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1978  	u32 resetintr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1979  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1980  	brcmf_dbg(PCIE, "Halt ARM.\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1981  	err = brcmf_pcie_enter_download_state(devinfo);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1982  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1983  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1984  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1985  	brcmf_dbg(PCIE, "Download FW %s\n", devinfo->fw_name);
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  1986  	memcpy_toio(devinfo->tcm + devinfo->ci->rambase,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1987  		    (void *)fw->data, fw->size);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1988  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1989  	resetintr = get_unaligned_le32(fw->data);
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1990  	devinfo->fw_size = fw->size;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1991  	release_firmware(fw);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1992  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1993  	/* reset last 4 bytes of RAM address. to be used for shared
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1994  	 * area. This identifies when FW is running
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1995  	 */
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1996  	brcmf_pcie_write_ram32(devinfo, devinfo->ci->ramsize - 4, 0);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1997  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30 @1998  	if (nvram) {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1999  		brcmf_dbg(PCIE, "Download NVRAM %s\n", devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2000  		address = devinfo->ci->rambase + devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2001  			  nvram_len;
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  2002  		memcpy_toio(devinfo->tcm + address, nvram, nvram_len);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2003  		brcmf_fw_nvram_free(nvram);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  2004  
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2005  		err = brcmf_pcie_populate_footers(devinfo, &address, fwsig);
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2006  		if (err)
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2007  			brcmf_err(bus, "failed to populate firmware footers err=%d\n", err);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2008  	} else {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2009  		brcmf_dbg(PCIE, "No matching NVRAM file found %s\n",
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2010  			  devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2011  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2012  
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2013  	release_firmware(fwsig);
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2014  
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2015  	/* Clear free TCM. This isn't really necessary, but it
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2016  	 * makes debugging memory dumps a lot easier since we
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2017  	 * don't get a bunch of junk filling up the free space.
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2018  	 */
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2019  	memset_io(devinfo->tcm + devinfo->ci->rambase + devinfo->fw_size,
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2020  		  0, address - devinfo->fw_size - devinfo->ci->rambase);
9ec7838a91c508 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  2021  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2022  	sharedram_addr_written = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2023  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2024  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2025  	brcmf_dbg(PCIE, "Bring ARM in running state\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2026  	err = brcmf_pcie_exit_download_state(devinfo, resetintr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2027  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2028  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2029  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2030  	brcmf_dbg(PCIE, "Wait for FW init\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2031  	sharedram_addr = sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2032  	loop_counter = BRCMF_PCIE_FW_UP_TIMEOUT / 50;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2033  	while ((sharedram_addr == sharedram_addr_written) && (loop_counter)) {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2034  		msleep(50);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2035  		sharedram_addr = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2036  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2037  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2038  		loop_counter--;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2039  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2040  	if (sharedram_addr == sharedram_addr_written) {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  2041  		brcmf_err(bus, "FW failed to initialize\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2042  		return -ENODEV;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2043  	}
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2044  	if (sharedram_addr < devinfo->ci->rambase ||
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2045  	    sharedram_addr >= devinfo->ci->rambase + devinfo->ci->ramsize) {
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2046  		brcmf_err(bus, "Invalid shared RAM address 0x%08x\n",
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2047  			  sharedram_addr);
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2048  		return -ENODEV;
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  2049  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2050  	brcmf_dbg(PCIE, "Shared RAM addr: 0x%08x\n", sharedram_addr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2051  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2052  	return (brcmf_pcie_init_share_ram_info(devinfo, sharedram_addr));
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2053  }
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  2054  

:::::: The code at line 1998 was first introduced by commit
:::::: 9e37f045d5e7f33450515f237c2f6f6bfee137dd brcmfmac: Adding PCIe bus layer support.

:::::: TO: Hante Meuleman <meuleman@broadcom.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

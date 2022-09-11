Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC657F
	for <llvm@lists.linux.dev>; Sun, 11 Sep 2022 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662925747; x=1694461747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPdh+j+RgUpvFm6gClNzqW5bpsIFdqhG/q9wYI9EglE=;
  b=MiEMTQ21iFEIpmdKgxCohrAYEikH+4DvzaXYhZC+uOIep6+ccQgLrPWI
   eV6iF2hsGkA0O2iFbZskHPDk57jOlu6qvVm4JgEYoCDASKMy7PhQ7J29K
   WrBr0Q99/YsQxnnPLhdznGwVDVXKbRGNIgcUoQV8S54wO6RvnS12OPaw+
   hqv1Q0XkllSlb/gSAQlNe4AURkku3hTZMSLSfH+UGTS1q1DYuByABQot3
   fVx7/Y3/rUMHJfoj7+ovH0vWjZBodrH4D3zrM69f0bkZ9RJVo1Yj8DInM
   4bReD/r4yIlBB5QuASL39NRApdkVFgZTCQ//DMTqHRUlZyNCrym7hcnCo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="298548705"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="298548705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2022 12:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="646205938"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2022 12:49:05 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXSwz-0001k3-0v;
	Sun, 11 Sep 2022 19:49:05 +0000
Date: Mon, 12 Sep 2022 03:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 05/12] brcmfmac: pcie: Read Apple OTP information
Message-ID: <202209120321.F2RQtXwO-lkp@intel.com>
References: <E1oVpn4-005LBk-Pj@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVpn4-005LBk-Pj@rmk-PC.armlinux.org.uk>

Hi Russell,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King/dt-bindings-net-bcm4329-fmac-Add-Apple-properties-chips/20220907-155138
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 2786bcff28bd88955fc61adf9cb7370fbc182bad
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220912/202209120321.F2RQtXwO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aa178c0c54196b50f8b3bf0fbb2a806fbb91f0d7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Russell-King/dt-bindings-net-bcm4329-fmac-Add-Apple-properties-chips/20220907-155138
        git checkout aa178c0c54196b50f8b3bf0fbb2a806fbb91f0d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/auxdisplay/ drivers/bus/ drivers/gpu/drm/i915/ drivers/net/ethernet/stmicro/stmmac/ drivers/net/wireless/broadcom/brcm80211/brcmfmac/ drivers/usb/core/ drivers/vdpa/ drivers/vfio/ fs/cifs/ net/mptcp/ net/netfilter/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1849:42: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           brcmf_dbg(PCIE, "parse_otp size=%ld\n", size);
                                           ~~~     ^~~~
                                           %zu
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h:77:14: note: expanded from macro 'brcmf_dbg'
                       fmt, ##__VA_ARGS__);                        \
                       ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1849 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

  1842	
  1843	static int
  1844	brcmf_pcie_parse_otp(struct brcmf_pciedev_info *devinfo, u8 *otp, size_t size)
  1845	{
  1846		int p = 0;
  1847		int ret = -EINVAL;
  1848	
> 1849		brcmf_dbg(PCIE, "parse_otp size=%ld\n", size);
  1850	
  1851		while (p < (size - 1)) {
  1852			u8 type = otp[p];
  1853			u8 length = otp[p + 1];
  1854	
  1855			if (type == 0)
  1856				break;
  1857	
  1858			if ((p + 2 + length) > size)
  1859				break;
  1860	
  1861			switch (type) {
  1862			case BRCMF_OTP_SYS_VENDOR:
  1863				brcmf_dbg(PCIE, "OTP @ 0x%x (%d): SYS_VENDOR\n",
  1864					  p, length);
  1865				ret = brcmf_pcie_parse_otp_sys_vendor(devinfo,
  1866								      &otp[p + 2],
  1867								      length);
  1868				break;
  1869			case BRCMF_OTP_BRCM_CIS:
  1870				brcmf_dbg(PCIE, "OTP @ 0x%x (%d): BRCM_CIS\n",
  1871					  p, length);
  1872				break;
  1873			default:
  1874				brcmf_dbg(PCIE, "OTP @ 0x%x (%d): Unknown type 0x%x\n",
  1875					  p, length, type);
  1876				break;
  1877			}
  1878	
  1879			p += 2 + length;
  1880		}
  1881	
  1882		return ret;
  1883	}
  1884	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

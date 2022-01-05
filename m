Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F62C9C
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 23:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641425938; x=1672961938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwKSTHfDu265J2P8HSUosd3Do127eVlRiq8ycaDaWDE=;
  b=lB+nsgjtxQ7NQ/TdEW1wozN1w9PTLDpCi5Dy5ss7ZjnTWR4RwJcKwlrZ
   WVWIBwzVgqNcIEvlFd1ASQ0kgstTlas530HGcfSAQrGGGSnv/VSd6yKmA
   fanEXmWpbKVklaafY2GDlaE4/ipQFl7UXZTs/o05tyfI68v0DlqPPuf0g
   6NN8RyxX5TevNvxn4llZbu7IzyoHkSeQTxhTp33+6HC/m1+H9S1Kj19dW
   KQifBKgvh/7yD8X06SBWcGm5HCaHBhXXtRz0lmznbsz2pCKmlbgYslml6
   Yw4r7leUcgS17UOg7gfbmpJmSTSiSXQVI84loXuH7tsyIlTIDfsE6X6HZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303305594"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="303305594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 15:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="526746918"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 15:38:56 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5Frs-000H87-2I; Wed, 05 Jan 2022 23:38:56 +0000
Date: Thu, 6 Jan 2022 07:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 07/35] brcmfmac: pcie: Read Apple OTP information
Message-ID: <202201060758.hCG39IaN-lkp@intel.com>
References: <20220104072658.69756-8-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104072658.69756-8-marcan@marcan.st>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hector,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kvalo-wireless-drivers-next/master]
[also build test WARNING on kvalo-wireless-drivers/master rafael-pm/linux-next net-next/master net/master robh/for-next linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hector-Martin/brcmfmac-Support-Apple-T2-and-M1-platforms/20220104-153413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: x86_64-randconfig-r024-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060758.hCG39IaN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e81f1e021ca0e590a603102125ba1ad03dfff42c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hector-Martin/brcmfmac-Support-Apple-T2-and-M1-platforms/20220104-153413
        git checkout e81f1e021ca0e590a603102125ba1ad03dfff42c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1863:20: warning: address of array 'devinfo->otp.version' will always evaluate to 'true' [-Wpointer-bool-conversion]
               !devinfo->otp.version)
               ~~~~~~~~~~~~~~^~~~~~~
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1862:20: warning: address of array 'devinfo->otp.vendor' will always evaluate to 'true' [-Wpointer-bool-conversion]
               !devinfo->otp.vendor ||
               ~~~~~~~~~~~~~~^~~~~~
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1861:20: warning: address of array 'devinfo->otp.module' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (!devinfo->otp.module ||
               ~~~~~~~~~~~~~~^~~~~~
   3 warnings generated.


vim +1863 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

  1785	
  1786	static int
  1787	brcmf_pcie_parse_otp_sys_vendor(struct brcmf_pciedev_info *devinfo,
  1788					u8 *data, size_t size)
  1789	{
  1790		int idx = 4;
  1791		const char *chip_params;
  1792		const char *board_params;
  1793		const char *p;
  1794	
  1795		/* 4-byte header and two empty strings */
  1796		if (size < 6)
  1797			return -EINVAL;
  1798	
  1799		if (get_unaligned_le32(data) != BRCMF_OTP_VENDOR_HDR)
  1800			return -EINVAL;
  1801	
  1802		chip_params = &data[idx];
  1803	
  1804		/* Skip first string, including terminator */
  1805		idx += strnlen(chip_params, size - idx) + 1;
  1806		if (idx >= size)
  1807			return -EINVAL;
  1808	
  1809		board_params = &data[idx];
  1810	
  1811		/* Skip to terminator of second string */
  1812		idx += strnlen(board_params, size - idx);
  1813		if (idx >= size)
  1814			return -EINVAL;
  1815	
  1816		/* At this point both strings are guaranteed NUL-terminated */
  1817		brcmf_dbg(PCIE, "OTP: chip_params='%s' board_params='%s'\n",
  1818			  chip_params, board_params);
  1819	
  1820		p = board_params;
  1821		while (*p) {
  1822			char tag = *p++;
  1823			const char *end;
  1824			size_t len;
  1825	
  1826			if (tag == ' ') /* Skip extra spaces */
  1827				continue;
  1828	
  1829			if (*p++ != '=') /* implicit NUL check */
  1830				return -EINVAL;
  1831	
  1832			/* *p might be NUL here, if so end == p and len == 0 */
  1833			end = strchrnul(p, ' ');
  1834			len = end - p;
  1835	
  1836			/* leave 1 byte for NUL in destination string */
  1837			if (len > (BRCMF_OTP_MAX_PARAM_LEN - 1))
  1838				return -EINVAL;
  1839	
  1840			/* Copy len characters plus a NUL terminator */
  1841			switch (tag) {
  1842			case 'M':
  1843				strscpy(devinfo->otp.module, p, len + 1);
  1844				break;
  1845			case 'V':
  1846				strscpy(devinfo->otp.vendor, p, len + 1);
  1847				break;
  1848			case 'm':
  1849				strscpy(devinfo->otp.version, p, len + 1);
  1850				break;
  1851			}
  1852	
  1853			/* Skip to space separator or NUL */
  1854			p = end;
  1855		}
  1856	
  1857		brcmf_dbg(PCIE, "OTP: module=%s vendor=%s version=%s\n",
  1858			  devinfo->otp.module, devinfo->otp.vendor,
  1859			  devinfo->otp.version);
  1860	
> 1861		if (!devinfo->otp.module ||
> 1862		    !devinfo->otp.vendor ||
> 1863		    !devinfo->otp.version)
  1864			return -EINVAL;
  1865	
  1866		devinfo->otp.valid = true;
  1867		return 0;
  1868	}
  1869	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59DD2F0;
	Wed,  6 Dec 2023 04:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPdobh5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836680; x=1733372680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h4+9QXz80nPqdIE6m1NyWQGvcxtDrnbM7zgzhRzWAXo=;
  b=dPdobh5HWF4Xv6MvGVdKKYmR/ymBQjSpLYE2/dfaQkRL0GU/Fs7jEDgW
   /y8wxheip2MlUGT1la5V++kEX7mMsGMDxxN2dLn/ukCFkWwLum+oJxNHw
   XMImInfumIIsYgZI4gNFq/k+PnuiYOw5T+KmfcCo5CbOK+hLqFyACj5MM
   koCYlo0XDW/BWiqZ5MTpb1nZYT5G6B/BrzEt0VaZmeQXL6qzkPUaxlWCd
   SezOIAsn7PTxvTpG2Xo9ZYL4LAi/v9F+9/0Bt+5Yn9Ogykit59wstEOvM
   bq7VgOOcm93IA7ueNQ5QDZzA1SnYnrk5pN9w0xqAohsbQTDYwj70mPtt0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396794384"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="396794384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837189478"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="837189478"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 20:24:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjSb-000AFa-0c;
	Wed, 06 Dec 2023 04:24:33 +0000
Date: Wed, 6 Dec 2023 12:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
	lenb@kernel.org, hdegoede@redhat.com, johannes@sipsolutions.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, alexander.deucher@amd.com, Lijo.Lazar@amd.com,
	mario.limonciello@amd.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, majun@amd.com,
	Evan Quan <quanliangl@hotmail.com>, Ma Jun <Jun.Ma2@amd.com>
Subject: Re: [PATCH v14 4/9] wifi: mac80211: Add support for WBRF features
Message-ID: <202312061221.VlhfjRyI-lkp@intel.com>
References: <20231129091348.3972539-5-Jun.Ma2@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129091348.3972539-5-Jun.Ma2@amd.com>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc1]
[also build test ERROR on next-20231205]
[cannot apply to drm-misc/drm-misc-next wireless-next/main wireless/main linus/master v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Jun/Documentation-driver-api-Add-document-about-WBRF-mechanism/20231129-181516
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231129091348.3972539-5-Jun.Ma2%40amd.com
patch subject: [PATCH v14 4/9] wifi: mac80211: Add support for WBRF features
config: hexagon-randconfig-002-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061221.VlhfjRyI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061221.VlhfjRyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061221.VlhfjRyI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/mac80211/wbrf.c:10:
   In file included from include/net/cfg80211.h:13:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/mac80211/wbrf.c:10:
   In file included from include/net/cfg80211.h:13:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/mac80211/wbrf.c:10:
   In file included from include/net/cfg80211.h:13:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/mac80211/wbrf.c:79:2: error: call to undeclared function 'acpi_amd_wbrf_add_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         acpi_amd_wbrf_add_remove(dev, WBRF_RECORD_ADD, &ranges_in);
         |         ^
   net/mac80211/wbrf.c:94:2: error: call to undeclared function 'acpi_amd_wbrf_add_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         acpi_amd_wbrf_add_remove(dev, WBRF_RECORD_REMOVE, &ranges_in);
         |         ^
   6 warnings and 2 errors generated.


vim +/acpi_amd_wbrf_add_remove +79 net/mac80211/wbrf.c

    66	
    67	void ieee80211_add_wbrf(struct ieee80211_local *local, struct cfg80211_chan_def *chandef)
    68	{
    69		struct wbrf_ranges_in_out ranges_in = {0};
    70		struct device *dev;
    71	
    72		if (!local->wbrf_supported)
    73			return;
    74	
    75		dev = local->hw.wiphy->dev.parent;
    76	
    77		get_ranges_from_chandef(chandef, &ranges_in);
    78	
  > 79		acpi_amd_wbrf_add_remove(dev, WBRF_RECORD_ADD, &ranges_in);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

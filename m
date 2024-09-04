Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F171DFE1C;
	Wed,  4 Sep 2024 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466894; cv=none; b=Fl2/CWeaIk+Y5870p4//69DFSH3L6Tu1HrCzego3H7scMb3FGOHQr5tV9UntsKSOFNcNhmRwHiV8IWgqMdUF/3cyTV5zVMQ+zg5QvaJeE2DhUcwT08TvuYqA0xwB9SKFxJAvbdpM0qIq7UcxvpFlK4+83aWcSizp7YxneTdL5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466894; c=relaxed/simple;
	bh=A5zwu4FYrlyGiAmGJyTVND7rU4XlLqBS2QrueIEJW5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0xUr+t0vnOIUcMSY6lFU7P+6GGUAtAsPo5EYC0tD4osw1VzJ6RusUX1NwFohgwsONQIjaYqxL+THFXLFg8j8vof1qGqeR6TaxhbnpQKMP28+N5qCR2uOnxoGA/35x1Bu2glL4+cMZNN+mUrS1MZEEJNV2ArLzfwugNQQLnbt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXUuBw/8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXUuBw/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725466892; x=1757002892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5zwu4FYrlyGiAmGJyTVND7rU4XlLqBS2QrueIEJW5g=;
  b=SXUuBw/8ZCmOkq5D4Agw/uNf56fAMqGAM5j+1eVp60DsN4h4tyZO7v8S
   m5TiVlSLrNrA8jwWLT/e9WDZdHwHLgDzrkA68dIuaygxd5LxI5CPuU8dP
   YVuoHRJW5676L8IwpAdTJgjEb42siEtXvLipBCLKwCCGvuolt42fcn9W8
   +DTo18NNqT2YE60Tb0iPvWbqmeaMZ0ugFBSiD8ujYWbB/gVsMPNr1tmRE
   IXZctia+C13c02UYQkvt8Pz9KblZSdb6hU/+O4j2OEZ9Q2ctrQl3UzLNZ
   bEXghENA/wDuPGKMF7zVCsAWIYDQs4L7iJXr7gnxqTgAMXTyCvQRwuBXw
   g==;
X-CSE-ConnectionGUID: jdFPIPYmTl2s1m2p9cTjUQ==
X-CSE-MsgGUID: baYUzWj7RjiNHk9xt5ECIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41641270"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="41641270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 09:21:32 -0700
X-CSE-ConnectionGUID: ZBMehz5qQqqwaLmPdRGgtg==
X-CSE-MsgGUID: M6tDGGtyQP63oe5kI/XLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="70211918"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 09:21:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slsl4-0008Jr-2X;
	Wed, 04 Sep 2024 16:21:26 +0000
Date: Thu, 5 Sep 2024 00:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>, adrian.hunter@intel.com,
	ulf.hansson@linaro.org, kees@kernel.org, gustavoars@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org,
	lihongbo22@huawei.com
Subject: Re: [PATCH -next] mmc: sdhci-cadence: Annotate struct
 sdhci_cdns_phy_param with __counted_by()
Message-ID: <202409042358.dwEQMShp-lkp@intel.com>
References: <20240904014636.2033138-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904014636.2033138-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240903]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/mmc-sdhci-cadence-Annotate-struct-sdhci_cdns_phy_param-with-__counted_by/20240904-094207
base:   next-20240903
patch link:    https://lore.kernel.org/r/20240904014636.2033138-1-lihongbo22%40huawei.com
patch subject: [PATCH -next] mmc: sdhci-cadence: Annotate struct sdhci_cdns_phy_param with __counted_by()
config: arm-randconfig-003-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042358.dwEQMShp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042358.dwEQMShp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042358.dwEQMShp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-cadence.c:11:
   In file included from include/linux/mmc/host.h:19:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2202:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mmc/host/sdhci-cadence.c:76:56: error: use of undeclared identifier 'count'
      76 |         struct sdhci_cdns_phy_param phy_params[] __counted_by(count);
         |                                                               ^
   1 warning and 1 error generated.


vim +/count +76 drivers/mmc/host/sdhci-cadence.c

    67	
    68	struct sdhci_cdns_priv {
    69		void __iomem *hrs_addr;
    70		void __iomem *ctl_addr;	/* write control */
    71		spinlock_t wrlock;	/* write lock */
    72		bool enhanced_strobe;
    73		void (*priv_writel)(struct sdhci_cdns_priv *priv, u32 val, void __iomem *reg);
    74		struct reset_control *rst_hw;
    75		unsigned int nr_phy_params;
  > 76		struct sdhci_cdns_phy_param phy_params[] __counted_by(count);
    77	};
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

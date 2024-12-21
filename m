Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926013B29B;
	Sat, 21 Dec 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734796557; cv=none; b=qZBuZrff4OCIhsZXFICn3AyOS/v3yZHifWE2PFerZaOz/VtroNML2joFPFefj7KiLA2p4iW030SCMLeTriHA0PgtBd8+Ay+FrmCoCOuLr9+MeDte5qhjZh9N7g5TSA49Ly7XTlyP34K9MdUjlMYtVXP/fjPQ7rGZsiCvIjzgJN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734796557; c=relaxed/simple;
	bh=qjv1kSO25m5IYA7zsVCFqc/8ZzhFUz+THd5Sm1jxvAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAhvCYl1IvcbrlEnppCbpD+KS0lZ+w9TAaCq88guaogoyOtF09R5TPfD48WWiv0REMEOfer1r946WEhPCCsMJ+21cSqf+BWEiz9bXumPdjcKpJfz9Kaipl0G8GDZhIW/TxSpxBPUCEHWTlvVToIJhuM/7pne+oS7Yu6ZFUTFSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP8W3g0H; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP8W3g0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734796556; x=1766332556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjv1kSO25m5IYA7zsVCFqc/8ZzhFUz+THd5Sm1jxvAk=;
  b=GP8W3g0HlonAWg1K9gW9G1wPhDtOlA2AA8M6BedhtgtXFQdflK6yPcJZ
   tgWF7b9ppr0OFzuFPCEuSdLYr0RPCocUgo7e0htwiF+NoHy8E/teg5ZE3
   wG0ZHsGLDeg8ve4gteMhMzyDrZIUmDA8GgkVLbroD41DcUJq6qF6CpjYu
   BzbDqS303/rUBFqVXkqe3Zq4pEoJ81M3CpUGZroR6NkEykk9lNJtr/tw1
   bEH+SBlVmNDzQHelMAbF6D6msyoCHqFHVac2ve0HuZ09mPVQ3TPz1O2Wz
   htFflpuTncgCG+aC4/vilJHCr+Kg6g3gXpqZwTpEnNDuagJ8d6gy92PxX
   A==;
X-CSE-ConnectionGUID: ywjhJ75NQdSdTUcZKUqLSA==
X-CSE-MsgGUID: /XO4nXJGRBql/teFJvx5pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39009082"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="39009082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 07:55:55 -0800
X-CSE-ConnectionGUID: pH1UfnrSRqGd9kpOt1fNRA==
X-CSE-MsgGUID: zhXUlBamSkqIqMVnkc7h6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98564721"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 07:55:52 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP1pX-0002Fr-1Z;
	Sat, 21 Dec 2024 15:55:51 +0000
Date: Sat, 21 Dec 2024 23:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 5/5] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <202412212328.Oqxrd8yj-lkp@intel.com>
References: <20241220201506.2791940-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220201506.2791940-6-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-common-Make-BaseT-a-4-lanes-mode/20241221-041758
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241220201506.2791940-6-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next RFC 5/5] net: phy: dp83822: Add support for phy_port representation
config: i386-buildonly-randconfig-005-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212328.Oqxrd8yj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212328.Oqxrd8yj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212328.Oqxrd8yj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/dp83822.c:7:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/phy/dp83822.c:735:17: warning: unused variable 'dev' [-Wunused-variable]
     735 |         struct device *dev = &phydev->mdio.dev;
         |                        ^~~
   2 warnings generated.


vim +/dev +735 drivers/net/phy/dp83822.c

   731	
   732	static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
   733	{
   734		struct dp83822_private *dp83822 = phydev->priv;
 > 735		struct device *dev = &phydev->mdio.dev;
   736		int ret;
   737	
   738		if (port->mediums) {
   739			if (phy_port_is_fiber(port) ||
   740			    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
   741				dp83822->fx_enabled = true;
   742		} else {
   743			ret = dp83822_read_straps(phydev);
   744			if (ret)
   745				return ret;
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

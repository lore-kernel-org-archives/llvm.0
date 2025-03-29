Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABE1C460A;
	Sat, 29 Mar 2025 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285031; cv=none; b=oIYyuHT7SfdlvEPT6Dy7mCSWEX/iYI1deRg1hoUjfbhP7/h5FexDN+wP4FlFVyF0hepOkribiNmORwRRwY/AIkpCqsMqwgZ+9M/UKXOuH8eqagLiKNIAjmRle+TltUDM6XYQz8qp9EsDTNECw55v7hXGbqKZZ6A4rkD5bnu66UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285031; c=relaxed/simple;
	bh=iPxZ8Ldb6PYOZVa90GDdFztH1FU38pAny2gaWtOz47w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maP//ZW4pnk7eUPqBObpJz1atrF7IlCBp2KtXTzeTZjag8vRF5NTYbf47XNHtiKPPj6DMfDWpRlQTSJO3R6Xgzalyfi5L5SZt1+tTkJjFv6MMs6oV8V2mqqr51kICc88Ye9NsVgBt4yFrjYovPGcmwyTa93JhEKIEAaTaFetLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLCzGBTu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLCzGBTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743285029; x=1774821029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iPxZ8Ldb6PYOZVa90GDdFztH1FU38pAny2gaWtOz47w=;
  b=CLCzGBTurQRs2MuYAWbOuNp9Eb05NLPBOhNGCsRQcTGa5US17x6ecpwh
   tWBqXxlEl2bXN5dctfgnhepCdWdQFMeX7pMldwedQsxaEMqXxSQllxBcH
   5ENCMloJoa2zZYRcijs3qSmxdbSkq3tvc3ziXjkeQthCYuG/PB6FFuMu6
   8P3XewR5V6eBCJrSHN9/LdXekoYfhrEzfaWKHRwX4BPkZzK9JNQcSGLeM
   C3AMdZZDxN8AWz+VOEaKyNHT7JuXMhC1/sGKjZK7e67MvNpAE49KCBhGN
   zeTtBdfgUknEW1kTpUYo9aWiHLDCW2DJ3jiXjLthGEukxTmlTaS9Pc9b1
   w==;
X-CSE-ConnectionGUID: TwVM1iwyT9+j3YDCCwf0fw==
X-CSE-MsgGUID: Qd3v+58FQH2CyLMwUezorw==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="62011075"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="62011075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 14:50:29 -0700
X-CSE-ConnectionGUID: J3P1M3csQLirtuyqwSQyIg==
X-CSE-MsgGUID: DPKxeR4sQ3SiXpkalLyorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125749777"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2025 14:50:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tye4N-0008Ne-27;
	Sat, 29 Mar 2025 21:50:23 +0000
Date: Sun, 30 Mar 2025 05:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, Cosmin Ratiu <cratiu@nvidia.com>
Subject: Re: [PATCH net v3 01/11] net: switch to netif_disable_lro in
 inetdev_init
Message-ID: <202503300552.i2jDOcpl-lkp@intel.com>
References: <20250329185704.676589-2-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329185704.676589-2-sdf@fomichev.me>

Hi Stanislav,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/net-switch-to-netif_disable_lro-in-inetdev_init/20250330-030132
base:   net/main
patch link:    https://lore.kernel.org/r/20250329185704.676589-2-sdf%40fomichev.me
patch subject: [PATCH net v3 01/11] net: switch to netif_disable_lro in inetdev_init
config: s390-randconfig-002-20250330 (https://download.01.org/0day-ci/archive/20250330/202503300552.i2jDOcpl-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503300552.i2jDOcpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503300552.i2jDOcpl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/dev.c:1774:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   EXPORT_IPV6_MOD(netif_disable_lro);
   ^
   int
>> net/core/dev.c:1774:17: error: a parameter list without types is only allowed in a function definition
   EXPORT_IPV6_MOD(netif_disable_lro);
                   ^
   2 errors generated.


vim +/int +1774 net/core/dev.c

  1756	
  1757	void netif_disable_lro(struct net_device *dev)
  1758	{
  1759		struct net_device *lower_dev;
  1760		struct list_head *iter;
  1761	
  1762		dev->wanted_features &= ~NETIF_F_LRO;
  1763		netdev_update_features(dev);
  1764	
  1765		if (unlikely(dev->features & NETIF_F_LRO))
  1766			netdev_WARN(dev, "failed to disable LRO!\n");
  1767	
  1768		netdev_for_each_lower_dev(dev, lower_dev, iter) {
  1769			netdev_lock_ops(lower_dev);
  1770			netif_disable_lro(lower_dev);
  1771			netdev_unlock_ops(lower_dev);
  1772		}
  1773	}
> 1774	EXPORT_IPV6_MOD(netif_disable_lro);
  1775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

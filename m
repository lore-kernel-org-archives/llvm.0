Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47A46426;
	Tue, 13 May 2025 04:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109106; cv=none; b=MJVIkYixq4L9JhNNg75675VDtvVBFNhm0o4EONPoOXp2fD0MaSD8CAZU0arH0vekovprgbN/r/SK3yoI0YDl8EhL8eATlgEt6rinR20ZnCFKPJA8GmFZBjjt0cJ9s+UWUUkT0FnRSVVdxP+WKZ+sbnKHBzOa4qUOeu6MTJIv6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109106; c=relaxed/simple;
	bh=W2gamIQfxe7mPdviO9TnmkklckNqnKKbQSW3CGImP+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iS+NmhYsZKkr6HS4btWIm3We9jUge3XIwI9GGWdxcDaLqxSb2EK+7HGUJY2J4ZYaO9CidrlHofvFmErnJD0dVEoRhNgfl+8GMPPjZe9WTPAQULZYqFBSbioBTV0HoYO8px1E7cINEpL9DvVqxTJkhmydxQjIbFPZIfq7qCapKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLUUHS6m; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLUUHS6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747109104; x=1778645104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2gamIQfxe7mPdviO9TnmkklckNqnKKbQSW3CGImP+o=;
  b=aLUUHS6miq/8xcDebxehXQK2Nvo+Ub6PtWzCA9HqAGxWfBlTVBNq1Amq
   cVBVycsz7pkI5i3JqAVXrHMLZKQk1XiUe6AXEgicHrqCy/w227DyaGBOj
   AErfaMYDVquioUfV6Qx5Ms+8bTcx5hvoUIpR+zCKV5qduUhWb7iaQC9jW
   cnvX5JTePhM45R1O88y+1+XkDejo7c7L1yiML6JlehRItE3OVL27MKZNr
   sOU2JmJlC55rPGU65nq3941dW7Cpm45Pso1yjLqu3hBnzL+D42KGwORtQ
   SwaPwcUGn/CrVWvoB2SADzjDl5t8C4YhtBGtnDxbcefg/X1WZVwQEQsUD
   g==;
X-CSE-ConnectionGUID: 1P5yMGIuQLWaVV0DSs9SDg==
X-CSE-MsgGUID: 2DdmkmxJSj2Q8IFklsN4GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36560159"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="36560159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:05:03 -0700
X-CSE-ConnectionGUID: /892fIn1QRuLjYwLPPRaTQ==
X-CSE-MsgGUID: 1fEZnNeUTxO0E6OytlCC+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="160851486"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2025 21:05:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEgt2-000FdT-08;
	Tue, 13 May 2025 04:05:00 +0000
Date: Tue, 13 May 2025 12:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v4 10/11] net: pcs: airoha: add PCS driver for
 Airoha SoC
Message-ID: <202505131153.guojEpVn-lkp@intel.com>
References: <20250511201250.3789083-11-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511201250.3789083-11-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-introduce-phy_interface_copy-helper/20250512-041835
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250511201250.3789083-11-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v4 10/11] net: pcs: airoha: add PCS driver for Airoha SoC
config: x86_64-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131153.guojEpVn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131153.guojEpVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131153.guojEpVn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phylink_mii_c22_pcs_decode_state
   >>> referenced by pcs-airoha.c:2314 (drivers/net/pcs/pcs-airoha.c:2314)
   >>>               vmlinux.o:(airoha_pcs_get_state)
--
>> ld.lld: error: undefined symbol: phylink_decode_usxgmii_word
   >>> referenced by pcs-airoha.c:2333 (drivers/net/pcs/pcs-airoha.c:2333)
   >>>               vmlinux.o:(airoha_pcs_get_state)
--
>> ld.lld: error: undefined symbol: phylink_mii_c22_pcs_encode_advertisement
   >>> referenced by pcs-airoha.c:2485 (drivers/net/pcs/pcs-airoha.c:2485)
   >>>               vmlinux.o:(airoha_pcs_config)
--
>> ld.lld: error: undefined symbol: phylink_release_pcs
   >>> referenced by pcs-airoha.c:2890 (drivers/net/pcs/pcs-airoha.c:2890)
   >>>               vmlinux.o:(airoha_pcs_remove)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

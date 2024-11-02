Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C24F9FE;
	Sat,  2 Nov 2024 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730556943; cv=none; b=ViNdURe7w17mFyg+fCtfCthoCnrOS5CFODn64ZlR/htzRQYNb/7amTE+nFzcSzqu54VSBDhPVovC3U2rYFRxnU/F6wpYUVZyNnCmPcTCA5TXB50H4G9M5XirCdc/fQ6GfeVo/UkzjRh2R94Rxfu38DvJKzfRIS9L0VFEiJWsjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730556943; c=relaxed/simple;
	bh=+vcw9TPFnVyVrMHj636ZLQi3c0KIDHN/MFC+/Xxx7ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsW/vq4ej2+Ie6LTxunwfkxAtqBzUA7UKdpz+FZQTY5Yg/FNs2beDLADXaEOWgHKTMl331Jub/ifGxuw+ID9AxB0MoDxnzXcED1/EFXh/4UTVMSY11FtYsRfSLYDslwpfhwSxO4Cz6+tVEV3ezqYsRmGN3EncmFBMFp3ui1NAzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYrda0Wx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYrda0Wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730556941; x=1762092941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vcw9TPFnVyVrMHj636ZLQi3c0KIDHN/MFC+/Xxx7ZA=;
  b=aYrda0WxXHKjuUwP68XJq0lMqisltmkT3L9rCgAL46mtBsdvSOBM4h/1
   Sjba+m1RVfAnegmVJKTFgffEJYSvJTRUFyIIUmXDMdnhxCNWonhjV6pYO
   JJBhbKqeo8YvAl17CDRlI7XFgq+d9kQSDFoCPrhwN2SYHRX4ywVQuMtYU
   KucViD23AwSa26x0LN9OsmNCCt1CznJGM/HfAZ+SUYsz7Vv+LNfTR9Av1
   wUgQOPbyIOJWgxp6XSbqxHWHcFoQgyMgrUU95YqhpwjH3GuCeZZvf9dZC
   ZthAM/Vk59kis+yzo1Baw/NvM3kNy8GMRmVJErpfrqRG2v+mZ3xFCGN4o
   Q==;
X-CSE-ConnectionGUID: BwQVbPD5QQq/VtHP9uGyCg==
X-CSE-MsgGUID: TPm0ndQNQfmCtYgLABaoLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30485190"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30485190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 07:15:40 -0700
X-CSE-ConnectionGUID: nKvfGQyATwupdpdSDhO6VA==
X-CSE-MsgGUID: BCd93tVqSJuZhVYov2OC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="114037551"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2024 07:15:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Euf-000j3J-1n;
	Sat, 02 Nov 2024 14:15:37 +0000
Date: Sat, 2 Nov 2024 22:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-arm-ci 1/19] drivers/of/property.c:53:27: error:
 extraneous ')' after condition, expected a statement
Message-ID: <202411022220.DrBPdaj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-arm-ci
head:   507503e336db5bc3e47ee6a4d79e9d883f3fc824
commit: 09adca1c46b0c6e6ee7b3a5041326060bb29af09 [1/19] properties: Split property reading bool and present test
config: arm-multi_v4t_defconfig (https://download.01.org/0day-ci/archive/20241102/202411022220.DrBPdaj5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022220.DrBPdaj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022220.DrBPdaj5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/property.c:53:27: error: extraneous ')' after condition, expected a statement
      53 |         if (prop && prop->length))
         |                                  ^
   1 error generated.


vim +53 drivers/of/property.c

    33	
    34	/**
    35	 * of_property_read_bool - Find a property
    36	 * @np:		device node from which the property value is to be read.
    37	 * @propname:	name of the property to be searched.
    38	 *
    39	 * Search for a boolean property in a device node. Usage on non-boolean
    40	 * property types is deprecated.
    41	 *
    42	 * Return: true if the property exists false otherwise.
    43	 */
    44	bool of_property_read_bool(const struct device_node *np, const char *propname)
    45	{
    46		struct property *prop = of_find_property(np, propname, NULL);
    47	
    48		/*
    49		 * Boolean properties should not have a value. Testing for property
    50		 * presence should either use of_property_present() or just read the
    51		 * property value and check the returned error code.
    52		 */
  > 53		if (prop && prop->length))
    54			pr_warn("%pOF: Read of boolean property '%s' with a value.\n", np, propname);
    55	
    56		return prop ? true : false;
    57	}
    58	EXPORT_SYMBOL(of_property_read_bool);
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD06205E31;
	Fri, 10 Jan 2025 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518775; cv=none; b=FZPxIyBsC3MHE72Np0+JwmNHngVaoP6gsc1YUFEnwECj6yzdeopvTpSagKEoUaHuPiIzjNELBrj/lB/ebPdf9TqATI9zvFQ86B5WDjcfW8122uDRJQ4dBXzNCIMkX85ZKzBMddxHwGoQbegg/QM6JUKtCQOwHwtKV5KkbLE50Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518775; c=relaxed/simple;
	bh=O+/fUgorR4ralt72sR1rLQz5c9YDH4R8PLzV21B4ZQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvkklAz+5GqG+z+pfgmm3pot+GdUEdQY2MAL0FaG9r46FM5S1SklGMDyrLEY5TSdl3GYiq8phzLweAU2CXl91RIG0sPFq0rHQdlcJe0d2BYLNHHa0qTA+yN1GmU3LdZERdPlkX/bPxKeNqkEyjVP5OScmarDMeSIyCpTo3HurPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JByV1v1f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JByV1v1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736518772; x=1768054772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+/fUgorR4ralt72sR1rLQz5c9YDH4R8PLzV21B4ZQE=;
  b=JByV1v1fmes4jf8HSYZ5Q+x5UetoCUlgCwH6qKSllIUW74/nj63Me4wa
   2FFXqbWDXY2C3Hz27R2AOxAXqZqFOeJR8/blfMvn13pA6IJYftxVr0+WK
   DOb23xepN5SenL/uGBHbPevJyvU9b30g6JiqaaLOgS8UYqma/IuZ8OV0D
   zO+3/EXnfg5TEEwQjlECQZ/rTX3vrnvuzRQc8Q/AZL/GkowmgiZVGQUQD
   q1XwLzAmztN6+1NkhzaW7d494jcPN2Zp5yACb3lPY68OqdVKyMBOlIODL
   /UXr+UcLhb2afTsiXoGgKM9ltyeFbFkqR2i1LYizbkm9cUVWdI3WjoShL
   g==;
X-CSE-ConnectionGUID: 8LktqwlPRbSSLbMCEBRSpQ==
X-CSE-MsgGUID: Y5jOogmKQmaVGD/OMTk5tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62184243"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="62184243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:19:19 -0800
X-CSE-ConnectionGUID: Q4QAwxSBQeCZM1WThWQW8A==
X-CSE-MsgGUID: ZMg2kWveT56ZFv+rwsdsKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108786324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2025 06:19:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWFr0-000JLv-1Y;
	Fri, 10 Jan 2025 14:19:14 +0000
Date: Fri, 10 Jan 2025 22:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [bluetooth-next:master 78/83] drivers/bluetooth/btbcm.c:557:10:
 error: incompatible integer to pointer conversion returning 'int' from a
 function with result type 'const char *'
Message-ID: <202501102245.kuCKXaOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   a5d2ee08adc1d98647679c4e4c73223464d5d936
commit: 52d2af10759262ab95162ddc1a56faa8fe3aabde [78/83] Bluetooth: btbcm: Fix NULL deref in btbcm_get_board_name()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250110/202501102245.kuCKXaOP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102245.kuCKXaOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102245.kuCKXaOP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btbcm.c:557:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'const char *' [-Wint-conversion]
                   return -ENOMEM;
                          ^~~~~~~
   1 error generated.


vim +557 drivers/bluetooth/btbcm.c

   536	
   537	/*
   538	 * This currently only looks up the device tree board appendix,
   539	 * but can be expanded to other mechanisms.
   540	 */
   541	static const char *btbcm_get_board_name(struct device *dev)
   542	{
   543	#ifdef CONFIG_OF
   544		struct device_node *root __free(device_node) = of_find_node_by_path("/");
   545		char *board_type;
   546		const char *tmp;
   547	
   548		if (!root)
   549			return NULL;
   550	
   551		if (of_property_read_string_index(root, "compatible", 0, &tmp))
   552			return NULL;
   553	
   554		/* get rid of any '/' in the compatible string */
   555		board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
   556		if (!board_type)
 > 557			return -ENOMEM;
   558	
   559		strreplace(board_type, '/', '-');
   560	
   561		return board_type;
   562	#else
   563		return NULL;
   564	#endif
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

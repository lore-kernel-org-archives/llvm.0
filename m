Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5236C1E7C2E;
	Fri, 23 Jan 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208638; cv=none; b=iV7utqZANg3/qnqb50L831ynOOPEhKosVTDlkvoCyltUB+rwKCiCj2Ltx3Cv8gpHtSxdpefLvRRk4Owmcp/a5aXwXN8lhu7DooZQf27QM8BnIKxr+fVmg0R54eQUNfVjEMjJ/Tbhoq5e8PQs1dsSqsWsT2a/45RIrjyz8w+F8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208638; c=relaxed/simple;
	bh=z+l/Iumm08O54OJsNbQka8X+9Q72qsZNUebKuOgH+/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBGYHlae1AHtQZrIWhJwllX5E4d2BmZ0sUfK9UT3qVXFfS8c6pLOLQnzTNhNT+n9Ype1LX++2BVSwgsteqltDsVJhfKt1csb+/NCJfMl1OuyC+B0TteP0HrVifEUKRNqH6pyLRHyPKOP01sRw4LjlhX9ZoKjMmk+Nb4mYrJn7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQOlM4Sw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQOlM4Sw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769208637; x=1800744637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+l/Iumm08O54OJsNbQka8X+9Q72qsZNUebKuOgH+/4=;
  b=FQOlM4Swp35XoXeLSY/QsHBp2xikbc94/Za0498A4P5KfDGEBEg1Hwov
   L3zZhYz5LFi0OT6wi+QBeH18MQul62ZpGycbbtqowTXKBFJwi5I3yFZaA
   2dKnPkC0wYRik6I7gV8jvsb+pSus5Q6Ybw7nTqn9gyRm9gdss5/X09SoF
   LkQU9OPLz1qQTf0dw0P1HLV1dhOPk5TEYs9QDOgbDvhB8AWDlyt+XlIPL
   ahzu3WgUjME/0b2DCNC0p7sIdfbOwqEqOsyRZM03Ti4bgThxfJjijzscy
   28ocPspfy0Qgn0ghZfJ+B0DMJzBXnW+BuCJ4qWmuRp3rxWszdipgcNEKb
   Q==;
X-CSE-ConnectionGUID: MDniN2v3Tcyncu8IFVT0VA==
X-CSE-MsgGUID: YdywP7FiRI6jdHuc3rp6OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70515842"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70515842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:50:35 -0800
X-CSE-ConnectionGUID: 1tqy6JmdQH6dK7zPWXXK8A==
X-CSE-MsgGUID: TK0Z7lPeR1ypTpwa1GDYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211996524"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2026 14:50:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjPz1-00000000UYK-1voE;
	Fri, 23 Jan 2026 22:50:27 +0000
Date: Sat, 24 Jan 2026 06:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
	pmohan@couthit.com, basharath@couthit.com, afd@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
	horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com
Subject: Re: [PATCH net-next v12 1/3] net: ti: icssm-prueth: Add helper
 functions to configure and maintain FDB
Message-ID: <202601240625.YSMR8XyP-lkp@intel.com>
References: <20260123135932.535735-2-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123135932.535735-2-parvathi@couthit.com>

Hi Parvathi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Parvathi-Pudi/net-ti-icssm-prueth-Add-helper-functions-to-configure-and-maintain-FDB/20260123-220750
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260123135932.535735-2-parvathi%40couthit.com
patch subject: [PATCH net-next v12 1/3] net: ti: icssm-prueth: Add helper functions to configure and maintain FDB
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260124/202601240625.YSMR8XyP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240625.YSMR8XyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240625.YSMR8XyP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:570:20: error: call to undeclared function 'kmalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     570 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                           ^
>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:570:18: error: incompatible integer to pointer conversion assigning to 'struct fdb_tbl *' from 'int' [-Wint-conversion]
     570 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kmalloc_obj +570 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c

   564	
   565	int icssm_prueth_sw_init_fdb_table(struct prueth *prueth)
   566	{
   567		if (prueth->emac_configured)
   568			return 0;
   569	
 > 570		prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
   571		if (!prueth->fdb_tbl)
   572			return -ENOMEM;
   573	
   574		icssm_prueth_sw_fdb_tbl_init(prueth);
   575	
   576		return 0;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

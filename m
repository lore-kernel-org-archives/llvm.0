Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2324749EA;
	Fri, 31 Jul 2026 19:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524988; cv=none; b=IipH/0n7aATgW0QUiNG3EFYNScHCVSPWwjtFT0oL7ZBNXRi9KFuRte0bOOtV8Q9be/O4mMQJw5NfdifAYvAv8ic0cy9nqOLOEdycm8MdtD6ykm69D569ySg3vdFzUErjKqd0OROsBoOj2xpg807R7X+YFfAYDtSZSa1/GPDyzmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524988; c=relaxed/simple;
	bh=VbXw4GQUJot4BGaDBXmYGWh6j6tjoUxtUmTOat8IXZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0JPm3uMAl0fTDXJa9oI8Kf6XQe1LqMffEtgScLqqNxshlP6zqGLhbgVk7hXnFOokvwYevUfjqBSvj8OtJJmmzsjld6cdOOH0i7kUOIdT0SgpYDVrccGCuTFhPRc6/MqX6/w019X7CJmnNC8CZCxYavQCR/Jo4tEnUYHCo8TFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmGp/vkf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmGp/vkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785524987; x=1817060987;
  h=date:from:to:cc:subject:message-id;
  bh=VbXw4GQUJot4BGaDBXmYGWh6j6tjoUxtUmTOat8IXZs=;
  b=nmGp/vkfV9Y0UH5yesPMBq+u73NcLCyX7WfW+LUOcubpAFEI4Lfjtvvz
   ig11R/z4+spDwGe6YhXc8icN30OqUwUki07ZQu/XnDu5QV/PutODRs+A3
   jlGsNeA3rhX5u0NXjk+8G8kKajDY7yjnQHc5pn8RBRYr/iIqlASyuro3c
   8X0T/sUwXPNcz15O9a2o4e++YbAGwTBVzLfyS4aYjfbnlNMj/eBRQLImV
   W8ujDyop9j0sorEWZwiyEDGScodNbRXw3zgPfcwgmVfpXzjTJccxCPDrA
   iYoq5IXym8tPzf6SlR6j3bJwncvzN72hFdZYaE67Uy0XzUS3HvmGzkS9B
   A==;
X-CSE-ConnectionGUID: iBFcbwd7QeqzpfSK2MTEag==
X-CSE-MsgGUID: a4lMkt0DSNy+i6BU6pxlfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96741272"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="96741272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 12:09:46 -0700
X-CSE-ConnectionGUID: 905rRuZrSyuSqLNSokZRyw==
X-CSE-MsgGUID: Pu6jDqIFQp+mifynjbs8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="262607912"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2026 12:09:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpsbj-0000000023U-25Wg;
	Fri, 31 Jul 2026 19:09:23 +0000
Date: Sat, 01 Aug 2026 03:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:djhacks 18/38] mm/gup.c:2418:7: error: call
 to undeclared function 'folio_longterm_pin_forbidden'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202608010245.2xosUIRm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux djhacks
head:   09de2580129cf36e7ed3de65282a91fe3cc29e24
commit: b44aca34818ebf7e2ef962e85b23c05bb7882c05 [18/38] mm: add N_MEMORY_LTPIN node state for longterm-pin eligible nodes
config: hexagon-randconfig-002-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010245.2xosUIRm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010245.2xosUIRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010245.2xosUIRm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/gup.c:2418:7: error: call to undeclared function 'folio_longterm_pin_forbidden'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2418 |                 if (folio_longterm_pin_forbidden(folio))
         |                     ^
   1 error generated.


vim +/folio_longterm_pin_forbidden +2418 mm/gup.c

  2409	
  2410	/* True if any folio sits on a node that doesn't support longterm pinning */
  2411	static bool pofs_has_ltpin_forbidden(struct pages_or_folios *pofs)
  2412	{
  2413		struct folio *folio;
  2414		long i = 0;
  2415	
  2416		for (folio = pofs_get_folio(pofs, i); folio;
  2417		     folio = pofs_next_folio(folio, pofs, &i)) {
> 2418			if (folio_longterm_pin_forbidden(folio))
  2419				return true;
  2420		}
  2421		return false;
  2422	}
  2423	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

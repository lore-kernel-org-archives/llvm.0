Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A3683CA0;
	Fri, 11 Oct 2024 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659423; cv=none; b=VD9DXehAt4O/DIVJwk+Rz8cArKLRWxYAboi1irqR9IzbC9LpoQTlfUKpXt0Ix8GECl8HjKYLB3uam/fUORIc1IjxmDyXd4YaSoYquOJ59r2eWnwkxIXQ+tRC+HN36WYYbRgJYW5nbYgw62xyt2jGGaI24xVeeouZfOMicdKgPPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659423; c=relaxed/simple;
	bh=BITzZWOBYiKSQs7RO3y9Qo2D6+NZ9/R64VIoSIBuWpQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMTKuDpxQxrvfxvWVVQnXErHWey4Mmq/FGM0qq84c4NYy281VZYi2yIvwHTVhrOg/8xTAWVtLEc6riY3Uhe7rn4TmO58hN2mehQCU0A3yBi9Uv1fOEfNUFAT5PpZce0oKY6EBexfQbKlOl1+17Il0vbKNSfh7B3YG0IPH7dbhwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PboKjhT+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PboKjhT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728659422; x=1760195422;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BITzZWOBYiKSQs7RO3y9Qo2D6+NZ9/R64VIoSIBuWpQ=;
  b=PboKjhT+UJoCqvSQtnt+nKbyfMJJqN6mglkvGEwlckyzzA20xQGQLWdW
   HUs/8z32JwJppo+mIFT9JwVUBi1MaNHRJPEgg6pxtAu/b/SY9pNxous9C
   Zgm6a7iVX416BlGFaCTIFf/2ShQMObmuj7Dnc3o+at2SM3r8D48CMKx12
   1YCXyy/MvZlngXa82L5wo8jEaZWxjOnkluKlmorbJBcyicf6UHlKglsZY
   08CPxfY9GvX1iexeDaIluR5964aXvGWn+14vtRzJYG8T0I9DAfweL4MiC
   Y08+RoLwylzGflSfBXh6IelJO0Pru56POE0pdsogEbVrqXRZrqAGtXN1/
   Q==;
X-CSE-ConnectionGUID: uHoffNujQPWDRE1oZvCbQg==
X-CSE-MsgGUID: iYelENNbSXe1juLV2mEbIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27869677"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="27869677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 08:10:21 -0700
X-CSE-ConnectionGUID: 9A3dWHrxSK2EIL2kr6r6cw==
X-CSE-MsgGUID: dpPXcyOGTnC2hoY0iYu+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81482253"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Oct 2024 08:10:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szHHW-000CQ3-0S;
	Fri, 11 Oct 2024 15:10:18 +0000
Date: Fri, 11 Oct 2024 23:09:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3809/4143] clang: error: unknown argument: '-n'
Message-ID: <202410112358.PQKsOin2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 32e8eaf263d9be014ba1970444f745682fa9c6c0 [3809/4143] um: use execveat to create userspace MMs
config: um-defconfig (https://download.01.org/0day-ci/archive/20241011/202410112358.PQKsOin2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410112358.PQKsOin2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410112358.PQKsOin2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-n'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43376025;
	Mon, 22 Jun 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159384; cv=none; b=eJy7fJbCBDjAICQ0MWkp9H/pFXNe5m1/OtyqoN6yA/1G4sWVOyAoiqEsX034OEHcGmVN5eAvrvMmci44JJwavwts0xi8HtF3SaADo4TgAwAHqnKrzruid27/Tj6OFTPvzZXtUxDouP6XZddHE4ukavCn48zsJD7GcNF6XclAaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159384; c=relaxed/simple;
	bh=efwoTg1ClOEGWe6psPlZBwBpwmDKpo08TesXjsjAz+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yy/QW1AgMpHXqSV7+8kuO8VTCN6xUQ4Wffs5D1CJDibYQVVXdSiIvNn0vLfb1FmhFadbWF+P6TssRk+7TGJYXgHL19xNJtZf2/cAqKhdnONx9JaDq0sTgce9d5G33NLWGksltEakYD1MDsZCbMThCAntAmVQxMvHnh22EHhbpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrPiJJSP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrPiJJSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782159382; x=1813695382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efwoTg1ClOEGWe6psPlZBwBpwmDKpo08TesXjsjAz+E=;
  b=WrPiJJSPVt3eLKf5PzplEYKZAZmmu/+uZ/pRO/FQaPpvA9omnxVtWnr/
   E/dK04bz93U9C/dtxbFciLYL3Xm8oDRkDg9alzcFJyH0yH4xHkPRXDt+s
   boa4b3Iu0nSc1ug0L5Ta5iXfNTyk8z/AlsO2Je6lLqQXHthDEYIC+4lU5
   O8XoIFFvafTc18b2JCLA9Fkr74q+e7bhIhCR7gxJuvhaSLhEgNNCZXjc4
   M9hBCXCtq5fdhO/niXdme+aVl8v9x6WogVOmmPedSOmDBSultEfDARYVG
   Lq4NTdnC1XK0Ss9yhBYdA6PlhhgD/kUzruIXoCMElsqFnq1NN6oUjdXdB
   g==;
X-CSE-ConnectionGUID: xlovo8HvSv+j3foPI/f8qg==
X-CSE-MsgGUID: 1enp2u0SR/2sM2/fYNfDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82938771"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82938771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 13:16:22 -0700
X-CSE-ConnectionGUID: t3H+DQ8ZSCKY080eQOlphw==
X-CSE-MsgGUID: pRXYbWUeRKiULameiy3bKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249361095"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 13:16:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbl46-000000001r3-0vcg;
	Mon, 22 Jun 2026 20:16:18 +0000
Date: Tue, 23 Jun 2026 04:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 10/124]
 drivers/clk/zte/clk-zx297520v3.c:644:27: warning: unused variable
 'tdm_lsp_sel'
Message-ID: <202606230452.G9fg4Zmp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 7b95ce97d9a13b0d3b2ca1c45b6bacc090309344 [10/124] clk: zte: Introduce a driver for zx297520v3 LSP clocks
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230452.G9fg4Zmp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230452.G9fg4Zmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230452.G9fg4Zmp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/zte/clk-zx297520v3.c:644:27: warning: unused variable 'tdm_lsp_sel' [-Wunused-const-variable]
     644 | static const char * const tdm_lsp_sel[] = {
         |                           ^~~~~~~~~~~
   1 warning generated.


vim +/tdm_lsp_sel +644 drivers/clk/zte/clk-zx297520v3.c

   643	
 > 644	static const char * const tdm_lsp_sel[] = {
   645		"lsp_tdm_wclk",
   646	};
   647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

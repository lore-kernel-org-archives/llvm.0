Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F86642;
	Thu, 14 Dec 2023 02:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tx6Lp8FQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702520365; x=1734056365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FElVasb2JyPiBShkrgXhSEWO3eoTNyC+MpcYkkfWdys=;
  b=Tx6Lp8FQpYEs5bUKrj8k8AGAgb71tm/WkSOC4yyeExjzhaA41MFZjWkE
   B6ELuNjvhpWl0gS9BY43hVJ1vze1DFoFZl0f+wPXcj2FCZTogKc2TSkXS
   /BHS+pw4D/N3awiRl/YraG2OUh1u97W20xsAcQL4s2hARUAbz/N/soA3+
   GuWP1495//0hplhznUmfhvZ4DuH8PsDfo6RLhEyR0gbl8grCnkEQ4XIr9
   pfvb/jhN25PRtOVeCq51lcM3WsmJuX14ONb9TzuX5lCDYfoufJYpGpLGo
   Y/5mRCQlgSZyg/qQp2FVYipreTNoJmNj7u6mOw4QxkMlbcz9ciN3a8QkN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1909042"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1909042"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 18:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947395914"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="947395914"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 18:19:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDbJo-000LQh-1E;
	Thu, 14 Dec 2023 02:19:20 +0000
Date: Thu, 14 Dec 2023 10:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/6] block: partitions: efi: Move GPT-specific code
 to a new library
Message-ID: <202312140949.NDLEVBGx-lkp@intel.com>
References: <20231211151244.289349-5-romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211151244.289349-5-romain.gantois@bootlin.com>

Hi Romain,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.7-rc5]
[cannot apply to next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/block-partitions-efi-Move-efi-h-header-to-include-linux-gpt-h/20231211-231331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231211151244.289349-5-romain.gantois%40bootlin.com
patch subject: [RFC PATCH 4/6] block: partitions: efi: Move GPT-specific code to a new library
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231214/202312140949.NDLEVBGx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140949.NDLEVBGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140949.NDLEVBGx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crc32_le
   >>> referenced by gpt.c
   >>>               lib/gpt.o:(gpt_validate_header) in archive vmlinux.a
   >>> referenced by gpt.c
   >>>               lib/gpt.o:(gpt_check_pte_array_crc) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

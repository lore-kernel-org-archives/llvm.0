Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38904330337;
	Fri, 30 Jan 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769787683; cv=none; b=mafNVu+Gmi1KDtvP3MfwRq6PcJJWJCseaYqjSccEddGI1wSYIHnxLcudi4/K/6Nw2WKcnz1VdHazFHej3l8U62HupiBm+n5MW/GhqVtOoqLXeWKIJXuh1i6RISd44zdPibNZ7M7Lzo3QSAyUfPVB2ZbLXpkZ8sP5ip/3n1koGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769787683; c=relaxed/simple;
	bh=0fUdsb6jhco8U17L+sRji5MQQAjibveGNe+u+9iEdOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTnfgY4mbNECAgGKd4EDSrq52DwO0TaycYoHQBhKr5rv+pdevv6hzFFYnvZhEG+JyHa9U9z8q5VnCl1FeNmmBA5THjOox4csS6iXjPyjSdwO8YHQ8Yv2ffF3RnTPewsUf+KWSGT/868q/6eGKL0r7PPwikAVzZmdzOjXMXj3JU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0dDCbXF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0dDCbXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769787682; x=1801323682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fUdsb6jhco8U17L+sRji5MQQAjibveGNe+u+9iEdOI=;
  b=c0dDCbXF0Rj1HcI8PVrKiziyaSfb3yHORtJ1Un9ChP3Fv9yArWK5peK/
   Ysc3KTUHRbd7h1Y8ql4ueVyiHpu9SE4uKAtE7jRPzPrl5dQBxQtJdQdvR
   nbiJIjTk/U+AoMbDx1khk/ouvLyV6HOh8lSmJz6z7SO0wdARwRiwS8UXh
   zC7D4B/7mBszdMRCIkFtdM4RZo/KmwNLStY3Uw82T7Vaf4utihkmT4xWF
   hhKw/65ZnlKD9yVCi0moU4bsEC9j0w1oc0KrE9eSeNHIc0fjC0WVuWvw0
   bN+kCwaqnT5zjVL0JC2jD5/CzWKSO1CYzHGfuPLJdsDlcVxn+OQyq/Pc/
   A==;
X-CSE-ConnectionGUID: jHbUSz2KQmavACFLZ5jkBQ==
X-CSE-MsgGUID: /TqV74vrSOKjQEOQPMWLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71125049"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71125049"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:41:21 -0800
X-CSE-ConnectionGUID: noZ1Jk5fQzSqQ6+IGSaHug==
X-CSE-MsgGUID: Rj9qDFhgQE2Yha4/nq5xzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208989560"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jan 2026 07:41:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlqcV-00000000d5k-2BNW;
	Fri, 30 Jan 2026 15:41:15 +0000
Date: Fri, 30 Jan 2026 23:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
Message-ID: <202601302312.JXeQH3ao-lkp@intel.com>
References: <20260130092349.621034-2-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130092349.621034-2-linchengming884@gmail.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc7]
[also build test WARNING on linus/master next-20260129]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nand-Add-support-for-randomizer/20260130-173004
base:   v6.19-rc7
patch link:    https://lore.kernel.org/r/20260130092349.621034-2-linchengming884%40gmail.com
patch subject: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
config: s390-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601302312.JXeQH3ao-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302312.JXeQH3ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302312.JXeQH3ao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:1234:4: warning: void function 'spinand_randomizer_init' should not return a value [-Wreturn-mismatch]
    1234 |                         return ret;
         |                         ^      ~~~
   drivers/mtd/nand/spi/core.c:1237:2: warning: void function 'spinand_randomizer_init' should not return a value [-Wreturn-mismatch]
    1237 |         return 0;
         |         ^      ~
   2 warnings generated.


vim +/spinand_randomizer_init +1234 drivers/mtd/nand/spi/core.c

  1226	
  1227	static void spinand_randomizer_init(struct spinand_device *spinand)
  1228	{
  1229		int ret;
  1230	
  1231		if (spinand->set_randomizer) {
  1232			ret = spinand_randomizer_enable(spinand, true);
  1233			if (ret)
> 1234				return ret;
  1235		}
  1236	
  1237		return 0;
  1238	}
  1239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

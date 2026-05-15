Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18E3F5BD1;
	Fri, 15 May 2026 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883836; cv=none; b=CMp8ty6MadOG6Ph7H0JlvmUcJRMrh4xTarrmqzCajWrRYHktwdT1SdhRY31ZwE6yh8D5O3na51EA+8sdQiWIF9zRgS7ivkpL7BO9Lhafo74UIrMqUSgxujMO/+YZKjLUYXD5i4PMvMTn9Y+s5eNOtsO8vnoSRgFVvbIDCEgfUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883836; c=relaxed/simple;
	bh=vwAEd3sAXOUyqvQSnFtAGdt9oNcMifr3hhORpPVkPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMdAKaJiAh9ywxL5ha6GYIGBgBiYWbtuZxFBw0VBKYzxqwtN0jOYR4n6HlbBV1KSe7+ve8uK63NLOFB+PToCIZO71vIBZjO4AzXVzPuOqxA/8tRK6q7SLa+p61uqXHdVeGK4ncOcKtukRc7tIWKoKJpPphHJYqilsP777EEOwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufgy8eB2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufgy8eB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883835; x=1810419835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwAEd3sAXOUyqvQSnFtAGdt9oNcMifr3hhORpPVkPjI=;
  b=Ufgy8eB2Rp+feu0ASEr9S46NeDpWqrl9UR8RdysqI+NHe+hPpUN3ptAA
   J4kaxpPetEvec6Iu02JUc4t9hgPWdO0jKslLlB7AcJvJWBJC5pF+aj1/8
   Pip/5ye4+YY0J2cdSsyWgB6EI1v/yndafya0eNR2kKYmI01tuIbzd+3MK
   q7oGdrWetOdbfIWWpKfu/miOZO2FWBmYT7mcq/iC/KOabDPet6sQZTMGI
   I48s+jraBK4VpPq54RMky4bIQIiRQlZooycgUIs3JTvepHbPFYIWZvZzS
   Xu8iQdPiU6ra8R5pE/V01fR/khVhtM2o1Zt2Jb9aQmRWtf6K3MwrqvYZ8
   Q==;
X-CSE-ConnectionGUID: Aw5Z8E/wTomfaaT8C3/F+A==
X-CSE-MsgGUID: Uqlp6LqRQkqFncNrdJzKyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79737296"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79737296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:54 -0700
X-CSE-ConnectionGUID: C/kaFx2XTEqXL0vdgDaa7g==
X-CSE-MsgGUID: XV2MPQ8SRQO8XsnCB0FJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243787352"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2026 15:23:51 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0we-0000000009x-1tq6;
	Fri, 15 May 2026 22:23:48 +0000
Date: Sat, 16 May 2026 06:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hongling Zeng <zenghongling@kylinos.cn>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, dominik.karol.piatkowski@protonmail.com,
	adam.quandour@gmail.com, kees@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
Message-ID: <202605160620.ReBOadPX-lkp@intel.com>
References: <20260515073952.54359-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515073952.54359-1-zenghongling@kylinos.cn>

Hi Hongling,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongling-Zeng/gpib-cb7210-Fix-region-leak-when-request_irq-fails/20260515-222229
base:   linus/master
patch link:    https://lore.kernel.org/r/20260515073952.54359-1-zenghongling%40kylinos.cn
patch subject: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
config: x86_64-randconfig-076-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160620.ReBOadPX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160620.ReBOadPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160620.ReBOadPX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpib/cb7210/cb7210.c:1066:3: error: use of undeclared identifier 'ret'
    1066 |                 ret = -EBUSY;
         |                 ^
   1 error generated.


vim +/ret +1066 drivers/gpib/cb7210/cb7210.c

  1035	
  1036	static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
  1037	{
  1038		int isr_flags = 0;
  1039		struct cb7210_priv *cb_priv;
  1040		struct nec7210_priv *nec_priv;
  1041		unsigned int bits;
  1042		int retval;
  1043	
  1044		retval = cb7210_generic_attach(board);
  1045		if (retval)
  1046			return retval;
  1047		cb_priv = board->private_data;
  1048		nec_priv = &cb_priv->nec7210_priv;
  1049		if (!request_region(config->ibbase, cb7210_iosize, DRV_NAME)) {
  1050			dev_err(board->gpib_dev, "ioports starting at 0x%x are already in use\n",
  1051				config->ibbase);
  1052			retval = -EBUSY;
  1053			goto err_release_region;
  1054		}
  1055		nec_priv->iobase = config->ibbase;
  1056		cb_priv->fifo_iobase = nec7210_iobase(cb_priv);
  1057	
  1058		bits = irq_bits(config->ibirq);
  1059		if (bits == 0)
  1060			dev_err(board->gpib_dev, "board incapable of using irq %i, try 2-5, 7, 10, or 11\n",
  1061				config->ibirq);
  1062	
  1063		// install interrupt handler
  1064		if (request_irq(config->ibirq, cb7210_interrupt, isr_flags, DRV_NAME, board)) {
  1065			dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", config->ibirq);
> 1066			ret = -EBUSY;
  1067			goto err_release_region;
  1068		}
  1069		cb_priv->irq = config->ibirq;
  1070	
  1071		return cb7210_init(cb_priv, board);
  1072	
  1073	err_release_region:
  1074		release_region(nec7210_iobase(cb_priv), cb7210_iosize);
  1075		return retval;
  1076	}
  1077	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

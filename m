Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8273A5E7D;
	Thu,  5 Mar 2026 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723785; cv=none; b=agVOExG7JI4bZz2FSOvJkqHVdOz4xU3YNFenbAlbuptnJlq58oEso4AnPtrqdOmKZLlY2opz/An5bnVnbejNPMfEhOgyDF+F3HE3n8nj+k4eZA4ttWK6SugFWZtraveTfF19umpdHg3AHqVBA4b8IK3rxE4jbMuftfmdeARXu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723785; c=relaxed/simple;
	bh=eZmQhiWbD0f8AfVQGd8lMY52vNGUz50WQbm9XzkWB5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HyD9mBrPV5SqOln5JIx/yit/rCHkRBMm8i/xegP4LcfIv/QT+TpV2VMo0Us+jTbQZbDu1fUDQoVyirBH1GFcO00/FRs1TP5eexMdGGsXEA/JEsq/vbln+5QJ+renM3hQd62CYBhLbqku+D0FALfbRwVvN8Kce7/Ns4SFDCup/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gt073bVp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gt073bVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772723783; x=1804259783;
  h=date:from:to:cc:subject:message-id;
  bh=eZmQhiWbD0f8AfVQGd8lMY52vNGUz50WQbm9XzkWB5Y=;
  b=Gt073bVpNF9zuvjGYk2moSsgUkjoQ/EC4U2ezfGT0hmDHdiSvwT6hgUx
   iU2ZlgiBKUvhEVMuF9NELotcWfeg90uWqaIjycfKVSB5erFtzWJ38Ebzl
   at9FE7iuDRCINnPRprYgGvfCqGurVlScT3XI4l9uHyECPPJ83ip2+0DoN
   o5N5e9tXJXGK5D+XH6cFwwoAMmiq82oxydBhj+eRAful0x/tzOqM67glg
   1BgS5vTebeBWBPY/gq/VZP4C43+aaL4ueI3gyTZBRL297ouDbva/52pSw
   fGfv763czquTKHz2OVoKmRgw/F1gfzjYSDpVzR606xSI9nZ+/on5LY4VY
   A==;
X-CSE-ConnectionGUID: YooeYIyhTZaBPXZb2ptKpA==
X-CSE-MsgGUID: UgZt4fwcS4y47zR0ygdg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96430997"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96430997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:16:14 -0800
X-CSE-ConnectionGUID: CtsovkLdQ0CqBs4BQ1tMRA==
X-CSE-MsgGUID: Yc+EvXnpQQuIfrj5w4MUcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223667080"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 07:16:12 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAQs-000000000oW-2Qpb;
	Thu, 05 Mar 2026 15:16:10 +0000
Date: Thu, 05 Mar 2026 23:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 16/467] include/linux/nsc_gpio.h:34:36:
 warning: declaration of 'struct kiocb' will not be visible outside of this
 function
Message-ID: <202603052323.iiW1JceV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 75d39a3ceebf5341f422373a3098aee1d54fb7f1 [16/467] char/nsc_gpio: convert to read/write iterators
config: i386-randconfig-004-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052323.iiW1JceV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052323.iiW1JceV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052323.iiW1JceV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-net48xx.c:16:
>> include/linux/nsc_gpio.h:34:36: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      34 | ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);
         |                                    ^
   include/linux/nsc_gpio.h:35:35: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      35 | ssize_t nsc_gpio_read_iter(struct kiocb *iocb, struct iov_iter *to);
         |                                   ^
   2 warnings generated.


vim +34 include/linux/nsc_gpio.h

    33	
  > 34	ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

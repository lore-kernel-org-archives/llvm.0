Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0071FC0E3;
	Fri,  7 Mar 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340340; cv=none; b=T5tFAG4xzLcOcYvDlF8RXZGs1Sj7JgQPLKol+UQGA6Q5hyePBMkBhigw6gylZ311WuUo/i71H6szeK94X3ms/EIJeq6YiMsv1tKHwTKvNoT5qBOc2P0NxSxgHq5kfxFFvrT/dSd6HkCORWij02hUURvQxi6A2mMlcZ1gBBQW4cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340340; c=relaxed/simple;
	bh=rLs1wzqH52S/8SS8AdvefAUT8BlMKmSH93vnAmNwPS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmYJ6TuLdiClcXuv4BuHa3akEbvEkqYuZg55PkchdiVSC9/rEkQA9t+RLmtK76kdjf1wJGZpi1RiM5YbCuTGUFgizcLy8ZTAoCTud666KozjIgzvT18AqZMrBVdTu/vCPnsft7EsvF4YTDe1RtyLOEaVRAlvNgmP3Rl0gRgQ0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGvWBw4Y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGvWBw4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741340338; x=1772876338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLs1wzqH52S/8SS8AdvefAUT8BlMKmSH93vnAmNwPS0=;
  b=QGvWBw4YC53BMSxnaDs4ccKNfkr28IcuxkI+zbkGO8IKaKH25eRgWiS3
   Rknh5+oexAI2ChZPYIYsZ0qr+ELvUtnIK6YOZZgJA5VUKba14d7Cz/Z0U
   NdjaonY6Z0V2OGWri5pwNNFTplXgqzuIpgSkLMxA3gBk+3PyuEQ4u+aag
   laQZxCn1rVV2rGasZXtkFfFP6TFh8luHXmNMEbnO51gR+vrlTO95QfVnB
   v8brVxyLJrHXHofl/oJmLVikBhr/unadXYc/3tLI3YIqOd+A/d9J8Um5t
   x6P2Nvh3ZZ3U4Eq4KrOSP/tHuMDuiag9i1u1Mc3yG4Y4xCWUAJwyhXiAa
   g==;
X-CSE-ConnectionGUID: jNEJjkbGSkqOmGZdd1pyEQ==
X-CSE-MsgGUID: PDGck74pTdmslB51GqqAZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46161766"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46161766"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:38:57 -0800
X-CSE-ConnectionGUID: kGyra7qNQN2eoeVm9SqYaw==
X-CSE-MsgGUID: xgQLYtAcTSmA84/tKBk4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124371050"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Mar 2025 01:38:54 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqUAO-0000Eh-1j;
	Fri, 07 Mar 2025 09:38:52 +0000
Date: Fri, 7 Mar 2025 17:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiayi Li <lijiayi@kylinos.cn>, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, stefan.eichenberger@toradex.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jiayi_dec@163.com,
	Jiayi Li <lijiayi@kylinos.cn>
Subject: Re: [PATCH v1] usb: core: Add boot delay for DH34 board in restore
 mode
Message-ID: <202503071748.Paav3L6j-lkp@intel.com>
References: <20250306061749.1502029-1-lijiayi@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306061749.1502029-1-lijiayi@kylinos.cn>

Hi Jiayi,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayi-Li/usb-core-Add-boot-delay-for-DH34-board-in-restore-mode/20250306-141857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250306061749.1502029-1-lijiayi%40kylinos.cn
patch subject: [PATCH v1] usb: core: Add boot delay for DH34 board in restore mode
config: arm64-randconfig-002-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071748.Paav3L6j-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071748.Paav3L6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071748.Paav3L6j-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "saved_command_line" [drivers/usb/core/usbcore.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

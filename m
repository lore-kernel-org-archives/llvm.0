Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5781BC57;
	Thu,  4 Apr 2024 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712242380; cv=none; b=qErica9o1xpQj3uanTMN9Q4eu+N6vpz5rQGAVWA4iX/BG+7/Ia8ELJchxpFXG0SA2CsPKCV+1d4LKvoAY7eJ0X6YtRuScnqb4Iz0wRs6BTndbl29aUGdNPSdTfuk3/jPjFNNnrW7fRzdv9qP6U3Q7QRi4mjBU9FbWEnjKtGLEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712242380; c=relaxed/simple;
	bh=5gPtLGZZHXTkeKBzZGN8PF0oWPkX9s7yVOhL6fXJnwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7Vj9b36vSHuFNIkhZzeiVXMy4hHcXcvG50hxbo/qq48QVPQn/JERALQA9LrUpdYTOn97EJem0ysXugdHZFfCm4Y+wP0uI5NzO0DVUhxsZmS7fG9Uxrl0GkjARTBGIlJTAZiiaNAg5O82IybdQ3Q3gmc413hdbf7k7GyLK7ks+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnV4ZJEO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnV4ZJEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712242379; x=1743778379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gPtLGZZHXTkeKBzZGN8PF0oWPkX9s7yVOhL6fXJnwI=;
  b=BnV4ZJEOGZdDa3KmCdvqUYZDsmi30uSUPPfHHshG3BPhyWGbM5i60WqB
   kiMY5g4RGVzK51LP3CGDbU2teg3x+EJYWuZZF1jaBoVPjqMnyj6khZQPe
   hJlIsWviemi8eLdxgP0dSjjelCXPFwPArKYYCUNIB9mUkEsgkjOzf4c/7
   bZ/A2GI/5HEvv9IFY2i1avuWTbaftYEJZAtgSTLrkrQGPW8cq5f542e3K
   Wm7phm/9WXtiwI0Y/W25cXCpoUasikqmxc0h4u9gXL2z6T6Qth/Yb1jVV
   Yy4er5vwfYYQRd9TuWK3R0eO1dv9ZuCuAJrQwRsFcHm79HzSBa/R5dqxo
   g==;
X-CSE-ConnectionGUID: cOQWleMETPqxKa9QEbuy3w==
X-CSE-MsgGUID: 8NTtMd1XQLCNhQxlgquK8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18260336"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18260336"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 07:52:57 -0700
X-CSE-ConnectionGUID: KGYFFwrKRuimuUf9A1x5dw==
X-CSE-MsgGUID: zfk0vGRkTAy3xL5xlSDlBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19249923"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2024 07:52:56 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsOST-0001C6-1c;
	Thu, 04 Apr 2024 14:52:53 +0000
Date: Thu, 4 Apr 2024 22:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [linux-next:master 3790/3921] ld.lld: error: undefined symbol:
 i2c_root_adapter
Message-ID: <202404042206.MjAQC32x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: 71b494e043d2cb567f4f4748bcb0b6fb7bc32a01 [3790/3921] i2c: i801: Call i2c_register_spd for muxed child segments
config: i386-buildonly-randconfig-005-20240404 (https://download.01.org/0day-ci/archive/20240404/202404042206.MjAQC32x-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404042206.MjAQC32x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_root_adapter
   >>> referenced by i2c-i801.c
   >>>               drivers/i2c/busses/i2c-i801.o:(i801_notifier_call) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

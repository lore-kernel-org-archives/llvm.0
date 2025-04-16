Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43099242930;
	Wed, 16 Apr 2025 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845908; cv=none; b=Yo6o/VRxa1vQ6kOEsn3gH4XsJsY2j35S3CEjJpYiJjy38UJCCZpbicVYaPQObL+OFrw6aONbhu5+sFe6Ij/+5p8g8NgeYfaCsFm5pQqzuB6lZCY7yRr+6/l/f4EdCSQnIDCVU418VhSJ+2s4aYrrJMkgsASys93KOscABcjEgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845908; c=relaxed/simple;
	bh=IxtXOMnY6EX4iLYnbxrBI9tgWv+kilLamY4zLaHlROE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYkcEbolm8kr0bVKHXBbkdcB6VEKEaBpG36ZWp91fTlZM/IeWHg4SvxDEi3IlNG/VdPzRtYXjHkpbzCzRzQqRL8Czy4YLK2N4O/6dJkIaNStkgUehXMWOu0FtYHMLsTPj+ZDPutR2y4QpG7V7LBW4NoTzjBQT8mnkQMnS6uHmc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JF6nX9TJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JF6nX9TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744845906; x=1776381906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxtXOMnY6EX4iLYnbxrBI9tgWv+kilLamY4zLaHlROE=;
  b=JF6nX9TJUact3tab9ytgFq/12DCFzPwU8KAEGqwZrJW0Ls6jnYasrbId
   R6qY0soqoCnJ9UtVU+24voDIcqUY2qPlb63nOBFxdxvVS3UyIrZC867xN
   6BDrf8pwsHGxC58uYN2zLV8mct4uUdI1NEFlS8nnwaxEM6sM0vvyJpdyS
   QOwKUpzlwAD3o70gtCvrhtJ+12iusx3nXCvRLiF4VuinxsNliR/z8huvV
   VQT+yyv9yyUNXaJd808zDAWKJoqpMnqWCE0OP6Uj9HTuPhzSgn2kKhBiY
   dkRGh+sh/Lb4Hy/hriQBxTG6RCT5zytgtAmzzUFeCJeFlqan/hz0n34I5
   g==;
X-CSE-ConnectionGUID: abIu6E6bS8a3u7UderrfQw==
X-CSE-MsgGUID: cnf7QEgySEKvPDP0pPCFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57059111"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="57059111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 16:25:02 -0700
X-CSE-ConnectionGUID: FRzL9G4CQFCDTuhcVK6eGA==
X-CSE-MsgGUID: 58okQ/akTqSgn4K0qTQG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="130600757"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2025 16:25:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5C7m-000KRk-19;
	Wed, 16 Apr 2025 23:24:58 +0000
Date: Thu, 17 Apr 2025 07:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 4325/4528] s390x-linux-ld:
 pinctrl-sx150x.c:undefined reference to `i2c_smbus_write_byte_data'
Message-ID: <202504170707.IBFj7H28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f660850bc246fef15ba78c81f686860324396628
commit: c4d1b2ee4407b0b12e0dade40361eb86c1c710ed [4325/4528] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250417/202504170707.IBFj7H28-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170707.IBFj7H28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170707.IBFj7H28-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_probe':
   pinctrl-sx150x.c:(.text+0x15e): undefined reference to `i2c_get_match_data'
>> s390x-linux-ld: pinctrl-sx150x.c:(.text+0x39e): undefined reference to `i2c_smbus_write_byte_data'
   s390x-linux-ld: pinctrl-sx150x.c:(.text+0x432): undefined reference to `i2c_smbus_write_byte_data'
   s390x-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_read':
   pinctrl-sx150x.c:(.text+0x2ba0): undefined reference to `i2c_smbus_read_byte_data'
   s390x-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_write':
   pinctrl-sx150x.c:(.text+0x317c): undefined reference to `i2c_smbus_write_byte_data'
   s390x-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_init':
   pinctrl-sx150x.c:(.init.text+0x32): undefined reference to `i2c_register_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

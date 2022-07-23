Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B433C5
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 22:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658616719; x=1690152719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CcMzN1ngFwzFBUCgmHF+q1Wx9bfh8y0odjoQnUGTIPc=;
  b=gnwTXKN2VOAS9rl+nMf0gtJdpxXF7J8p0+66iQ/VH+6utP1qtxTUlCmg
   POjEM4xydXV/CI50jvFk8VC5Ou2TFN/J1wGYOGKjuF48j+zxfvbHkm4ii
   yt3bbM1PNGf82tFdi0MJ1R5FMJo63efN9/LMU8WoMN02+BSS3kuY0Jw7b
   AXwM1PemUwFXmeaLjj7LuL60/jzXOq0Nzr1GDy8zfcs8IYVmBvw6Y+m03
   zYdAkzErcAAZZZcOb7tQ9hIDrtfu00RuQkZ+4Td4zf1lTj79McRHJwXia
   BkwdupomSHZF1gf8zEs1SqM+h3q10Q5qqE4HlCA1nKy26PGEM/r7XD9+i
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="274356757"
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="274356757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 15:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="688648014"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2022 15:51:55 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFNyU-0003C5-1x;
	Sat, 23 Jul 2022 22:51:54 +0000
Date: Sun, 24 Jul 2022 06:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, linux-iio@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] iio: pressure: bmp280: Add support for BMP380
 sensor family
Message-ID: <202207240654.c7cPESiE-lkp@intel.com>
References: <50841287411a4e459487cc94a05bc6de66be4acf.1658597501.git.ang.iglesiasg@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50841287411a4e459487cc94a05bc6de66be4acf.1658597501.git.ang.iglesiasg@gmail.com>

Hi Angel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 180c6cb6b9b79c55b79e8414f4c0208f2463af7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Angel-Iglesias/Add-support-for-pressure-sensor-Bosch-BMP380/20220724-014146
base:   180c6cb6b9b79c55b79e8414f4c0208f2463af7d
config: arm-buildonly-randconfig-r003-20220724 (https://download.01.org/0day-ci/archive/20220724/202207240654.c7cPESiE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/eb385b5ff634acc29a3d9f20847e62ec73484fcb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Angel-Iglesias/Add-support-for-pressure-sensor-Bosch-BMP380/20220724-014146
        git checkout eb385b5ff634acc29a3d9f20847e62ec73484fcb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by bmp280-core.c:887 (drivers/iio/pressure/bmp280-core.c:887)
   >>> iio/pressure/bmp280-core.o:(bmp380_read_press) in archive drivers/built-in.a
   >>> did you mean: __aeabi_idivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)
   pahole: .tmp_vmlinux.btf: No such file or directory
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

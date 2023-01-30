Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A773746A;
	Mon, 30 Jan 2023 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675105939; x=1706641939;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cWtOhNiaAObZW4YCs4abp4gyC90HqLq97l8kJYhGTxM=;
  b=IxqvvxlQykKCAo3Bqut5Yy+bhZhx3I9J86tMzvVRVhN/ecZNIlpweqa7
   5s5F2DNTdjwB18Gv6XjxAnkdyu6rBh8e56l0N5PQgTdoaNf41W4tON+CP
   dUavVCXZjub/TTMFe/r8EDuORk6tBGvmAkHwoz9D9m7uDyNzN/dPXd8zl
   77h3gIt+kND1qeLtmkVghC8n+C36ZuUuRKup6a0XHFWFlQNfKT/oDeUND
   uhXVsKsFv+nvFGxg5WqcYehe3Pd2AmNGded6C9c99BVRuh9itTP8bn6K9
   KWTUT3ZpM1AqCNNRZ4jbRcN1/AeK+gUnrM5cvoigj+4B+TdlqRNZ+NBxj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311271791"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="311271791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 11:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838074627"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="838074627"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 11:12:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMZZh-0003qc-01;
	Mon, 30 Jan 2023 19:12:17 +0000
Date: Tue, 31 Jan 2023 03:12:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement workaround for CDCLK PLL
 disable/enable
Message-ID: <202301310350.jHMcPi8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230130135836.12738-1-stanislav.lisovskiy@intel.com>
References: <20230130135836.12738-1-stanislav.lisovskiy@intel.com>
TO: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
TO: intel-gfx@lists.freedesktop.org

Hi Stanislav,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Lisovskiy/drm-i915-Implement-workaround-for-CDCLK-PLL-disable-enable/20230130-220112
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230130135836.12738-1-stanislav.lisovskiy%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915: Implement workaround for CDCLK PLL disable/enable
config: riscv-randconfig-r024-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310350.jHMcPi8m-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cc7224639fed7ecf93932d5e2458f5fbf1ebc0bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stanislav-Lisovskiy/drm-i915-Implement-workaround-for-CDCLK-PLL-disable-enable/20230130-220112
        git checkout cc7224639fed7ecf93932d5e2458f5fbf1ebc0bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/media/dvb-frontends/bcm3510.o):(function bcm3510_attach: .text+0x3c): relocation R_RISCV_HI20 out of range: 531352 is not in [-524288, 524287]; references kmalloc_caches
   >>> referenced by bcm3510.c:798 (drivers/media/dvb-frontends/bcm3510.c:798)
   >>> defined in vmlinux.a(mm/slab_common.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

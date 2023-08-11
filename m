Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F0911700;
	Fri, 11 Aug 2023 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691789754; x=1723325754;
  h=date:from:cc:subject:message-id:mime-version;
  bh=AsTreZV9JX4FvUtE53B5NgLL9TmzN1qmlayFtHIss94=;
  b=TniCOIxuQQI7CK3L27XFXEjSK7Bqx4LFjTFo2ZKXvm0/8UG8Oup/BlV3
   hdG0a2qCmzOwut2JbNdBriyWZ64Aug4pyzPrsWmPGCPWYPocbp4K6krmy
   dNt2djzdXTy7J2UnWb+Z1FbEthy3ER4Tp8XNy7DXmGTPSqgnJOd9VYGpm
   H2ObgMI9zzEj3MAwEaDrLCRRcA5o6DxCIKGh0hOuk3B5vMtqtCDW6B5Dj
   9BzBSMa7JO7mnFqNNHJGDFT20YFaRY4fGSjh//TAwRBfW3Q/sb24NpoGj
   OXyD0LJjFlm7VTYWl3OlRin0HxT8FPtwvFnPCGq4U9SF6E/4Foq1Jj1vl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375480880"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="375480880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682661731"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682661731"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 14:35:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZnU-00083M-0o;
	Fri, 11 Aug 2023 21:35:52 +0000
Date: Sat, 12 Aug 2023 05:35:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [broonie-spi:for-6.6 14/42] drivers/spi/spi-amd.o: warning: objtool:
 amd_spi_host_transfer() falls through to next function
 __cfi_amd_spi_max_transfer_size()
Message-ID: <202308120546.csT3g5y0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-spi@vger.kernel.org
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Mark Brown <broonie@kernel.org>

Hi Yang,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-6.6
head:   ddaec4e44d4e2a556b51159d48788a85ff67179d
commit: e9759d403baaeda9ea4d61d64c3151e214561217 [14/42] spi: amd: switch to use modern name
config: x86_64-randconfig-x006-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120546.csT3g5y0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120546.csT3g5y0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120546.csT3g5y0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-amd.c:401:21: warning: cast to smaller integer type 'enum amd_spi_versions' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           amd_spi->version = (enum amd_spi_versions) device_get_match_data(dev);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/spi/spi-amd.o: warning: objtool: amd_spi_host_transfer() falls through to next function __cfi_amd_spi_max_transfer_size()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

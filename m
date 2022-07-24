Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2733C3
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658678409; x=1690214409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgdIGPLyDzUOsrD9UfYxcTSqeDlVVstMa2snaNPaE3o=;
  b=S4GkUZUM7w+A2VpL6EGBUDIJ3pfpRY8FF3QBNa5y+FZDWgWu+sJOtRN4
   gLgmCZY7a6APUF0qj63gxW7uUC52qn/tb7U0hhOJFW/9Cj7yCwbwikHJw
   uueALsUfmhJwzk2e1wBscPH4Og8Lz9iPUoWEcm01lyIH5qo0vv9UbUAHY
   4YIs+ACB6/XRhCMpuLO9Jmi5herAZY6a6b2ztqUVDbsgH7YMj7+LiLwyo
   Us78Yy1N7qnAH/Fyrt4Lc9snotT/51VxrqdkjYBLwsVTmg828hn/R6vTC
   /pMmHRCKAs0ktxvus+EQTNlJgEYjCcHVHpB8e1/bllSJleOf1t7ohMhAi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="267328578"
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="267328578"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 09:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="926614066"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2022 09:00:06 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFe1V-0003zf-3D;
	Sun, 24 Jul 2022 16:00:06 +0000
Date: Sun, 24 Jul 2022 23:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Jander <david@protonic.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4882/12552] drivers/iio/adc/ti-adc108s102.c:59:8:
 warning: Excessive padding in 'struct adc108s102_state' (56 padding bytes,
 where 24 is optimal). Optimal fields order: rx_buf, spi, reg, va_millivolt,
 tx_buf, ring_msg, scan_single_msg, ring_xfer, scan_single_xfer, co...
Message-ID: <202207242337.HY6svWLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 1714582a3a087eda8786d5a1b32b2ec86ca8a303 [4882/12552] spi: Move ctlr->cur_msg_prepared to struct spi_message
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archive/20220724/202207242337.HY6svWLM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1714582a3a087eda8786d5a1b32b2ec86ca8a303
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1714582a3a087eda8786d5a1b32b2ec86ca8a303
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/accel/adxl313_core.c:46:8: note: Excessive padding in 'struct adxl313_data' (46 padding bytes, where 14 is optimal). Optimal fields order: transf_buf, regmap, lock, consider reordering the fields or adding explicit padding members
   struct adxl313_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/iio/magnetometer/ak8974.c:477:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tab, 0xFF, tab_size);
                   ^~~~~~
   drivers/iio/magnetometer/ak8974.c:477:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(tab, 0xFF, tab_size);
                   ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/iio/dac/ad5064.c:105:8: warning: Excessive padding in 'struct ad5064_state' (35 padding bytes, where 3 is optimal). Optimal fields order: data, dev, chip_info, write, lock, dac_cache, vref_reg, use_internal_vref, pwr_down, pwr_down_mode, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5064.c:105:8: note: Excessive padding in 'struct ad5064_state' (35 padding bytes, where 3 is optimal). Optimal fields order: data, dev, chip_info, write, lock, dac_cache, vref_reg, use_internal_vref, pwr_down, pwr_down_mode, consider reordering the fields or adding explicit padding members
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/iio/adc/ti-adc12138.c:38:8: warning: Excessive padding in 'struct adc12138' (36 padding bytes, where 4 is optimal). Optimal fields order: tx_buf, rx_buf, spi, data, id, cclk, vref_p, vref_n, acquisition_time, lock, complete, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adc12138 {
   ~~~~~~~^~~~~~~~~~
   drivers/iio/adc/ti-adc12138.c:38:8: note: Excessive padding in 'struct adc12138' (36 padding bytes, where 4 is optimal). Optimal fields order: tx_buf, rx_buf, spi, data, id, cclk, vref_p, vref_n, acquisition_time, lock, complete, consider reordering the fields or adding explicit padding members
   struct adc12138 {
   ~~~~~~~^~~~~~~~~~
   drivers/iio/adc/ti-adc12138.c:148:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rx_buf, adc->rx_buf, len);
           ^~~~~~
   drivers/iio/adc/ti-adc12138.c:148:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rx_buf, adc->rx_buf, len);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
>> drivers/iio/adc/ti-adc108s102.c:59:8: warning: Excessive padding in 'struct adc108s102_state' (56 padding bytes, where 24 is optimal). Optimal fields order: rx_buf, spi, reg, va_millivolt, tx_buf, ring_msg, scan_single_msg, ring_xfer, scan_single_xfer, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adc108s102_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-adc108s102.c:59:8: note: Excessive padding in 'struct adc108s102_state' (56 padding bytes, where 24 is optimal). Optimal fields order: rx_buf, spi, reg, va_millivolt, tx_buf, ring_msg, scan_single_msg, ring_xfer, scan_single_xfer, consider reordering the fields or adding explicit padding members
   struct adc108s102_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/iio/dac/mcp4922.c:27:8: warning: Excessive padding in 'struct mcp4922_state' (42 padding bytes, where 10 is optimal). Optimal fields order: mosi, spi, vref_mv, vref_reg, value, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct mcp4922_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/mcp4922.c:27:8: note: Excessive padding in 'struct mcp4922_state' (42 padding bytes, where 10 is optimal). Optimal fields order: mosi, spi, vref_mv, vref_reg, value, consider reordering the fields or adding explicit padding members
   struct mcp4922_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/iio/dac/ti-dac5571.c:44:8: warning: Excessive padding in 'struct dac5571_data' (41 padding bytes, where 9 is optimal). Optimal fields order: buf, powerdown, powerdown_mode, client, id, vref, spec, dac5571_cmd, dac5571_pwrdwn, lock, val, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct dac5571_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ti-dac5571.c:44:8: note: Excessive padding in 'struct dac5571_data' (41 padding bytes, where 9 is optimal). Optimal fields order: buf, powerdown, powerdown_mode, client, id, vref, spec, dac5571_cmd, dac5571_pwrdwn, lock, val, consider reordering the fields or adding explicit padding members
   struct dac5571_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (31 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev = req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' during its initialization is never read
           struct media_device *mdev = req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:331:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
           ^~~~~~~~
   drivers/media/mc/mc-request.c:331:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
           ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/media/v4l2-core/v4l2-async.c:478:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:478:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev =
                          ^~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/bcma/scan.c:450:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(chip_id, ARRAY_SIZE(chip_id),
           ^~~~~~~~
   drivers/bcma/scan.c:450:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(chip_id, ARRAY_SIZE(chip_id),
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +59 drivers/iio/adc/ti-adc108s102.c

7e87d11c9bda75 Jan Kiszka       2017-05-17  58  
7e87d11c9bda75 Jan Kiszka       2017-05-17 @59  struct adc108s102_state {
7e87d11c9bda75 Jan Kiszka       2017-05-17  60  	struct spi_device		*spi;
7e87d11c9bda75 Jan Kiszka       2017-05-17  61  	struct regulator		*reg;
7e87d11c9bda75 Jan Kiszka       2017-05-17  62  	u32				va_millivolt;
7e87d11c9bda75 Jan Kiszka       2017-05-17  63  	/* SPI transfer used by triggered buffer handler*/
7e87d11c9bda75 Jan Kiszka       2017-05-17  64  	struct spi_transfer		ring_xfer;
7e87d11c9bda75 Jan Kiszka       2017-05-17  65  	/* SPI transfer used by direct scan */
7e87d11c9bda75 Jan Kiszka       2017-05-17  66  	struct spi_transfer		scan_single_xfer;
7e87d11c9bda75 Jan Kiszka       2017-05-17  67  	/* SPI message used by ring_xfer SPI transfer */
7e87d11c9bda75 Jan Kiszka       2017-05-17  68  	struct spi_message		ring_msg;
7e87d11c9bda75 Jan Kiszka       2017-05-17  69  	/* SPI message used by scan_single_xfer SPI transfer */
7e87d11c9bda75 Jan Kiszka       2017-05-17  70  	struct spi_message		scan_single_msg;
7e87d11c9bda75 Jan Kiszka       2017-05-17  71  
7e87d11c9bda75 Jan Kiszka       2017-05-17  72  	/*
7e87d11c9bda75 Jan Kiszka       2017-05-17  73  	 * SPI message buffers:
7e87d11c9bda75 Jan Kiszka       2017-05-17  74  	 *  tx_buf: |C0|C1|C2|C3|C4|C5|C6|C7|XX|
7e87d11c9bda75 Jan Kiszka       2017-05-17  75  	 *  rx_buf: |XX|R0|R1|R2|R3|R4|R5|R6|R7|tt|tt|tt|tt|
7e87d11c9bda75 Jan Kiszka       2017-05-17  76  	 *
7e87d11c9bda75 Jan Kiszka       2017-05-17  77  	 *  tx_buf: 8 channel read commands, plus 1 dummy command
cbe5c697760411 Jonathan Cameron 2021-06-13  78  	 *  rx_buf: 1 dummy response, 8 channel responses
7e87d11c9bda75 Jan Kiszka       2017-05-17  79  	 */
cbe5c697760411 Jonathan Cameron 2021-06-13  80  	__be16				rx_buf[9] ____cacheline_aligned;
7e87d11c9bda75 Jan Kiszka       2017-05-17  81  	__be16				tx_buf[9] ____cacheline_aligned;
7e87d11c9bda75 Jan Kiszka       2017-05-17  82  };
7e87d11c9bda75 Jan Kiszka       2017-05-17  83  

:::::: The code at line 59 was first introduced by commit
:::::: 7e87d11c9bda75816ced8d0895e8d24e5c52833a iio: adc: Add support for TI ADC108S102 and ADC128S102

:::::: TO: Jan Kiszka <jan.kiszka@siemens.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

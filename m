Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D963B
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658748624; x=1690284624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GPWfOIa16ZnEnlEWoqMq+aNPxqOXCxj7erAjQJ2kUQ=;
  b=iX6mjt2aY+kSe0Ry2KHFrEkLQmK1aYE5c1irluCca7jTG3LYymhzYdmm
   Xs+nqMb/kgyVU76cFKqRpHVJq7a1MHd2itVjSrOBB4OHkP1bKiqu5kT1e
   qCbxujk4k2rYlqL+FFIqhis6xNPQvVVmBY9yFEPrFQnAulor2mr/kNY7m
   WhMdFfEz1+Mp7r8bRKZNlRIo3/w+K/pXMQCquKtYc9yZvag4BcgoAr5b+
   L/L7at1PJ+YAv7ssF1+nlNuERz+SO45R2tZdK3nbIZ2gT491/DP89KAcy
   fc+mdDKMkDPvDwORE3UiH/jQYxvdA8vqu35QOTgSfos5n0/UyaHG/Eo0n
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="270711060"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="270711060"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 04:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="575017768"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2022 04:30:22 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFwI1-000545-2y;
	Mon, 25 Jul 2022 11:30:21 +0000
Date: Mon, 25 Jul 2022 19:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/frequency/admv1013.c:93:8: warning: Excessive padding in
 'struct admv1013_state' (48 padding bytes, where 16 is optimal). Optimal
 fields order: data, det_en, spi, clkin, reg, input_mode, quad_se_mode, lock,
 nb, consider reordering the fields o...
Message-ID: <202207251934.yeNP5kb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: da35a7b526d9b258a2cb8b7816f736a41b32176b iio: frequency: admv1013: add support for ADMV1013
date:   7 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archive/20220725/202207251934.yeNP5kb4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da35a7b526d9b258a2cb8b7816f736a41b32176b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da35a7b526d9b258a2cb8b7816f736a41b32176b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   drivers/misc/eeprom/at25.c:438:6: note: Left side of '||' is false
   drivers/misc/eeprom/at25.c:438:16: note: Assuming the condition is false
           if (sr < 0 || sr & AT25_SR_nRDY) {
                         ^~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:438:2: note: Taking false branch
           if (sr < 0 || sr & AT25_SR_nRDY) {
           ^
   drivers/misc/eeprom/at25.c:443:2: note: Loop condition is false.  Exiting loop
           mutex_init(&at25->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/misc/eeprom/at25.c:444:12: note: Access to field 'spi' results in a dereference of a null pointer (loaded from variable 'at25')
           at25->spi = spi;
           ~~~~      ^
   4 warnings generated.
   drivers/misc/eeprom/idt_89hpesx.c:946:3: warning: Value stored to 'csraddr_len' is never read [clang-analyzer-deadcode.DeadStores]
                   csraddr_len = strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/idt_89hpesx.c:946:3: note: Value stored to 'csraddr_len' is never read
                   csraddr_len = strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/fscache/page.c:403:32: warning: Value stored to 'state' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   enum fscache_operation_state state = op->state;
                                                ^~~~~   ~~~~~~~~~
   fs/fscache/page.c:403:32: note: Value stored to 'state' during its initialization is never read
                   enum fscache_operation_state state = op->state;
                                                ^~~~~   ~~~~~~~~~
   fs/fscache/page.c:992:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:992:2: note: Value stored to 'ret' is never read
           ret = -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1074:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1074:2: note: Value stored to 'ret' is never read
           ret = -ENOBUFS;
           ^     ~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/i2c/et8ek8/et8ek8_driver.c:531:3: warning: Value stored to 'list' is never read [clang-analyzer-deadcode.DeadStores]
                   list = meta->reglist[nlists].ptr;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/et8ek8/et8ek8_driver.c:531:3: note: Value stored to 'list' is never read
                   list = meta->reglist[nlists].ptr;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   drivers/bus/mhi/core/main.c:284:2: warning: Value stored to 'mhi_cntrl' is never read [clang-analyzer-deadcode.DeadStores]
           mhi_cntrl = mhi_dev->mhi_cntrl;
           ^           ~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:284:2: note: Value stored to 'mhi_cntrl' is never read
           mhi_cntrl = mhi_dev->mhi_cntrl;
           ^           ~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:467:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:467:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1047:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1047:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1525:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1525:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/frequency/adf4350.c:33:8: warning: Excessive padding in 'struct adf4350_state' (36 padding bytes, where 4 is optimal). Optimal fields order: val, spi, freq_req, reg, lock_detect_gpiod, pdata, clk, clkin, chspc, fpfd, min_out_freq, r0_fract, r0_int, r1_mod, r4_rf_div_sel, lock, regs, regs_hw, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adf4350_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4350.c:33:8: note: Excessive padding in 'struct adf4350_state' (36 padding bytes, where 4 is optimal). Optimal fields order: val, spi, freq_req, reg, lock_detect_gpiod, pdata, clk, clkin, chspc, fpfd, min_out_freq, r0_fract, r0_int, r1_mod, r4_rf_div_sel, lock, regs, regs_hw, consider reordering the fields or adding explicit padding members
   struct adf4350_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/iio/frequency/admv1013.c:93:8: warning: Excessive padding in 'struct admv1013_state' (48 padding bytes, where 16 is optimal). Optimal fields order: data, det_en, spi, clkin, reg, input_mode, quad_se_mode, lock, nb, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct admv1013_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/frequency/admv1013.c:93:8: note: Excessive padding in 'struct admv1013_state' (48 padding bytes, where 16 is optimal). Optimal fields order: data, det_en, spi, clkin, reg, input_mode, quad_se_mode, lock, nb, consider reordering the fields or adding explicit padding members
   struct admv1013_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   4 warnings generated.
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: warning: Value stored to 'bufferspace' is never read [clang-analyzer-deadcode.DeadStores]
                   bufferspace -= count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: note: Value stored to 'bufferspace' is never read
                   bufferspace -= count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:680:19: warning: Value stored to 'udc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xusb_udc *udc = ep->udc;
                            ^~~   ~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:680:19: note: Value stored to 'udc' during its initialization is never read
           struct xusb_udc *udc = ep->udc;
                            ^~~   ~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:695:14: warning: Although the value stored to 'is_short' is used in the enclosing expression, the value is never actually read from 'is_short' [clang-analyzer-deadcode.DeadStores]
                           is_last = is_short = 1;
                                     ^          ~
   drivers/usb/gadget/udc/udc-xilinx.c:695:14: note: Although the value stored to 'is_short' is used in the enclosing expression, the value is never actually read from 'is_short'
                           is_last = is_short = 1;
                                     ^          ~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: warning: Value stored to 'req' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xusb_req *req    = to_xusb_req(_req);
                            ^~~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: note: Value stored to 'req' during its initialization is never read
           struct xusb_req *req    = to_xusb_req(_req);
                            ^~~
   3 warnings generated.
   lib/radix-tree.c:1046:3: warning: 4th function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   lib/radix-tree.c:1032:2: note: 'offset' declared without an initial value
           int offset;
           ^~~~~~~~~~
   lib/radix-tree.c:1035:6: note: Assuming 'index' is <= 'maxindex'
           if (index > maxindex)
               ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1035:2: note: Taking false branch
           if (index > maxindex)
           ^
   lib/radix-tree.c:1040:2: note: Loop condition is false. Execution continues on line 1045
           while (radix_tree_is_internal_node(node)) {
           ^
   lib/radix-tree.c:1045:6: note: Assuming 'node' is non-null
           if (node)
               ^~~~
   lib/radix-tree.c:1045:2: note: Taking true branch
           if (node)
           ^
   lib/radix-tree.c:1046:3: note: 4th function call argument is an uninitialized value
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/most/most_usb.c:951:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &usb_dev->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/most/most_usb.c:951:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &usb_dev->dev;
                          ^~~   ~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/power/supply/wm831x_power.c:487:17: warning: Value stored to 'wm831x' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct wm831x *wm831x = wm831x_power->wm831x;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/wm831x_power.c:487:17: note: Value stored to 'wm831x' during its initialization is never read
           struct wm831x *wm831x = wm831x_power->wm831x;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/wm831x_power.c:519:17: warning: Value stored to 'wm831x' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct wm831x *wm831x = wm831x_power->wm831x;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/wm831x_power.c:519:17: note: Value stored to 'wm831x' during its initialization is never read
           struct wm831x *wm831x = wm831x_power->wm831x;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/power/supply/88pm860x_battery.c:197:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = ((buf[4] >> 6) << 10) | ((buf[3] >> 6) << 8)
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/88pm860x_battery.c:197:3: note: Value stored to 'ret' is never read
                   ret = ((buf[4] >> 6) << 10) | ((buf[3] >> 6) << 8)
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/adc/ti-ads124s08.c:96:8: warning: Excessive padding in 'struct ads124s_private' (43 padding bytes, where 11 is optimal). Optimal fields order: data, buffer, chip_info, reset_gpio, spi, lock, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads124s08.c:96:8: note: Excessive padding in 'struct ads124s_private' (43 padding bytes, where 11 is optimal). Optimal fields order: data, buffer, chip_info, reset_gpio, spi, lock, consider reordering the fields or adding explicit padding members
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.

vim +93 drivers/iio/frequency/admv1013.c

    92	
  > 93	struct admv1013_state {
    94		struct spi_device	*spi;
    95		struct clk		*clkin;
    96		/* Protect against concurrent accesses to the device and to data */
    97		struct mutex		lock;
    98		struct regulator	*reg;
    99		struct notifier_block	nb;
   100		unsigned int		input_mode;
   101		unsigned int		quad_se_mode;
   102		bool			det_en;
   103		u8			data[3] ____cacheline_aligned;
   104	};
   105	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

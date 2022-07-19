Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82D53A7
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 22:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658269240; x=1689805240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vd5bKQ5CnHAOr4fkHEWAQB506aXg5L9ThvusYbhdSc4=;
  b=hQU/qQj85Zpw3vjfZpBkcrPeOZQHskpoRLP24YFbadlWL0rKgYX7cVFb
   sVY5fYdo8ziTHm9sbVwil9oFvUX8NeDfobZXIilX4uOVIExUJOyCDBg92
   YzWjEe7tTZaOKBDI+S25ltEQQ5cWQc0gTLx1toC1sXe3wyWIAdZwOxebx
   RZ5Fx8kGB/zMSep6JNACc7XyG9h3eXZiDFJNjv8ExLyGi8ZSx1zSALY99
   LQQ7t9HZbuRf+3Y+FY4W227Ra4iGJPCxMa58KqpWMjnKqTl9sS73Zd1uq
   yv5SCSgMIcremuX6uUVebHlRsiGVsk/JHKR0VcoLsDXkfOkSwRDW/RbQk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273457419"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="273457419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 15:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="687284806"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2022 15:20:36 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDvZz-0006AB-UG;
	Tue, 19 Jul 2022 22:20:35 +0000
Date: Wed, 20 Jul 2022 06:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: drivers/iio/imu/adis16480.c:169:8: warning: Excessive padding in
 'struct adis16480' (40 padding bytes, where 8 is optimal). Optimal fields
 order: adis, data, chip_info, ext_clk, clk_mode, clk_freq, consider
 reordering the fields or adding explicit padding...
Message-ID: <202207200602.aZBLNvbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 941f130881fa9073a32944e69c26cdc15a554d96 iio: adis16480: support burst read function
date:   1 year, 2 months ago
config: arm-randconfig-c002-20220717 (https://download.01.org/0day-ci/archive/20220720/202207200602.aZBLNvbn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f8fbf61284839c739807c2da2e2505661eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=941f130881fa9073a32944e69c26cdc15a554d96
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 941f130881fa9073a32944e69c26cdc15a554d96
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/nfc/digital_dep.c:1199:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = 0;
                   ^    ~
   net/nfc/digital_dep.c:1199:3: note: Value stored to 'rc' is never read
                   rc = 0;
                   ^    ~
   net/nfc/digital_dep.c:1407:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1407:3: note: Value stored to 'rc' is never read
                   rc = PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1429:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = -EIO;
                   ^    ~~~~
   net/nfc/digital_dep.c:1429:3: note: Value stored to 'rc' is never read
                   rc = -EIO;
                   ^    ~~~~
   net/nfc/digital_dep.c:1454:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = -EINVAL;
                   ^    ~~~~~~~
   net/nfc/digital_dep.c:1454:3: note: Value stored to 'rc' is never read
                   rc = -EINVAL;
                   ^    ~~~~~~~
   net/nfc/digital_dep.c:1461:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = digital_tg_send_psl_res(ddev, psl_req->did, rf_tech);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1461:2: note: Value stored to 'rc' is never read
           rc = digital_tg_send_psl_res(ddev, psl_req->did, rf_tech);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/iio/imu/adis16400.c:179:8: warning: Excessive padding in 'struct adis16400_state' (48 padding bytes, where 16 is optimal). Optimal fields order: adis, variant, filt_int, avail_scan_mask, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16400_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/imu/adis16400.c:179:8: note: Excessive padding in 'struct adis16400_state' (48 padding bytes, where 16 is optimal). Optimal fields order: adis, variant, filt_int, avail_scan_mask, consider reordering the fields or adding explicit padding members
   struct adis16400_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/imu/adis16475.c:100:8: warning: Excessive padding in 'struct adis16475' (41 padding bytes, where 9 is optimal). Optimal fields order: adis, data, info, clk_freq, lsb_flag, sync_mode, burst32, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16475 {
   ~~~~~~~^~~~~~~~~~~
   drivers/iio/imu/adis16475.c:100:8: note: Excessive padding in 'struct adis16475' (41 padding bytes, where 9 is optimal). Optimal fields order: adis, data, info, clk_freq, lsb_flag, sync_mode, burst32, consider reordering the fields or adding explicit padding members
   struct adis16475 {
   ~~~~~~~^~~~~~~~~~~
   1 warning generated.
>> drivers/iio/imu/adis16480.c:169:8: warning: Excessive padding in 'struct adis16480' (40 padding bytes, where 8 is optimal). Optimal fields order: adis, data, chip_info, ext_clk, clk_mode, clk_freq, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16480 {
   ~~~~~~~^~~~~~~~~~~
   drivers/iio/imu/adis16480.c:169:8: note: Excessive padding in 'struct adis16480' (40 padding bytes, where 8 is optimal). Optimal fields order: adis, data, chip_info, ext_clk, clk_mode, clk_freq, consider reordering the fields or adding explicit padding members
   struct adis16480 {
   ~~~~~~~^~~~~~~~~~~
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/usb/ax88179_178a.c:378:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = ax88179_write_cmd(dev, AX_ACCESS_PHY, AX88179_PHY_ID,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/ax88179_178a.c:378:2: note: Value stored to 'ret' is never read
           ret = ax88179_write_cmd(dev, AX_ACCESS_PHY, AX88179_PHY_ID,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/ax88179_178a.c:382:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = ax88179_write_cmd(dev, AX_ACCESS_PHY, AX88179_PHY_ID,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/ax88179_178a.c:382:2: note: Value stored to 'ret' is never read
           ret = ax88179_write_cmd(dev, AX_ACCESS_PHY, AX88179_PHY_ID,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/netfilter/xt_policy.c:139:3: warning: Value stored to 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg = "output policy not valid in PREROUTING and INPUT";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_policy.c:139:3: note: Value stored to 'errmsg' is never read
                   errmsg = "output policy not valid in PREROUTING and INPUT";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_policy.c:144:3: warning: Value stored to 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg = "input policy not valid in POSTROUTING and OUTPUT";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_policy.c:144:3: note: Value stored to 'errmsg' is never read
                   errmsg = "input policy not valid in POSTROUTING and OUTPUT";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_policy.c:148:3: warning: Value stored to 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg = "too many policy elements";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_policy.c:148:3: note: Value stored to 'errmsg' is never read
                   errmsg = "too many policy elements";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
--
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during its initialization is never read
           int minor_base = class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/input/touchscreen/cyttsp4_core.c:620:26: warning: Value stored to 'si' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cyttsp4_sysinfo *si = &cd->sysinfo;
                                   ^~   ~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:620:26: note: Value stored to 'si' during its initialization is never read
           struct cyttsp4_sysinfo *si = &cd->sysinfo;
                                   ^~   ~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:806:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:806:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: warning: Value stored to 'hst_mode' is never read [clang-analyzer-deadcode.DeadStores]
           hst_mode = si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: note: Value stored to 'hst_mode' is never read
           hst_mode = si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/arcnet/rfc1201.c:348:4: warning: Value stored to 'soft' is never read [clang-analyzer-deadcode.DeadStores]
                           soft = &pkt->soft.rfc1201;
                           ^      ~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/rfc1201.c:348:4: note: Value stored to 'soft' is never read
                           soft = &pkt->soft.rfc1201;
                           ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/iio/imu/adis16400.c:179:8: warning: Excessive padding in 'struct adis16400_state' (48 padding bytes, where 16 is optimal). Optimal fields order: adis, variant, filt_int, avail_scan_mask, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16400_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/imu/adis16400.c:179:8: note: Excessive padding in 'struct adis16400_state' (48 padding bytes, where 16 is optimal). Optimal fields order: adis, variant, filt_int, avail_scan_mask, consider reordering the fields or adding explicit padding members
   struct adis16400_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/imu/adis16475.c:100:8: warning: Excessive padding in 'struct adis16475' (41 padding bytes, where 9 is optimal). Optimal fields order: adis, data, info, clk_freq, lsb_flag, sync_mode, burst32, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16475 {
   ~~~~~~~^~~~~~~~~~~
   drivers/iio/imu/adis16475.c:100:8: note: Excessive padding in 'struct adis16475' (41 padding bytes, where 9 is optimal). Optimal fields order: adis, data, info, clk_freq, lsb_flag, sync_mode, burst32, consider reordering the fields or adding explicit padding members
   struct adis16475 {
   ~~~~~~~^~~~~~~~~~~
   1 warning generated.
>> drivers/iio/imu/adis16480.c:169:8: warning: Excessive padding in 'struct adis16480' (40 padding bytes, where 8 is optimal). Optimal fields order: adis, data, chip_info, ext_clk, clk_mode, clk_freq, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct adis16480 {
   ~~~~~~~^~~~~~~~~~~
   drivers/iio/imu/adis16480.c:169:8: note: Excessive padding in 'struct adis16480' (40 padding bytes, where 8 is optimal). Optimal fields order: adis, data, chip_info, ext_clk, clk_mode, clk_freq, consider reordering the fields or adding explicit padding members
   struct adis16480 {
   ~~~~~~~^~~~~~~~~~~
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/wireless/lib80211_crypt_tkip.c:335:25: warning: Value stored to 'hdr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
                                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/lib80211_crypt_tkip.c:335:25: note: Value stored to 'hdr' during its initialization is never read
                   struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
                                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/net/wireless/ti/wlcore/debugfs.c:949:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = wl1271_acx_beacon_filter_opt(wl, wlvif, !!value);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:949:3: note: Value stored to 'ret' is never read
                   ret = wl1271_acx_beacon_filter_opt(wl, wlvif, !!value);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:1266:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = wl12xx_cmd_config_fwlog(wl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:1266:2: note: Value stored to 'ret' is never read
           ret = wl12xx_cmd_config_fwlog(wl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/nfc/digital_dep.c:1199:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = 0;
                   ^    ~
   net/nfc/digital_dep.c:1199:3: note: Value stored to 'rc' is never read
                   rc = 0;
                   ^    ~
   net/nfc/digital_dep.c:1407:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1407:3: note: Value stored to 'rc' is never read
                   rc = PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1429:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = -EIO;
                   ^    ~~~~
   net/nfc/digital_dep.c:1429:3: note: Value stored to 'rc' is never read
                   rc = -EIO;
                   ^    ~~~~
   net/nfc/digital_dep.c:1454:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = -EINVAL;
                   ^    ~~~~~~~
   net/nfc/digital_dep.c:1454:3: note: Value stored to 'rc' is never read
                   rc = -EINVAL;
                   ^    ~~~~~~~
   net/nfc/digital_dep.c:1461:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = digital_tg_send_psl_res(ddev, psl_req->did, rf_tech);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1461:2: note: Value stored to 'rc' is never read
           rc = digital_tg_send_psl_res(ddev, psl_req->did, rf_tech);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

vim +169 drivers/iio/imu/adis16480.c

326e2357553d39 Stefan Popa        2019-03-11  168  
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20 @169  struct adis16480 {
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20  170  	const struct adis16480_chip_info *chip_info;
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20  171  
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20  172  	struct adis adis;
326e2357553d39 Stefan Popa        2019-03-11  173  	struct clk *ext_clk;
326e2357553d39 Stefan Popa        2019-03-11  174  	enum adis16480_clock_mode clk_mode;
326e2357553d39 Stefan Popa        2019-03-11  175  	unsigned int clk_freq;
941f130881fa90 Nuno Sa            2021-04-22  176  	/* Alignment needed for the timestamp */
941f130881fa90 Nuno Sa            2021-04-22  177  	__be16 data[ADIS16495_BURST_MAX_DATA] __aligned(8);
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20  178  };
2f3abe6cbb6c96 Lars-Peter Clausen 2012-11-20  179  

:::::: The code at line 169 was first introduced by commit
:::::: 2f3abe6cbb6c963ac790b40936b6761c9f0497b4 iio:imu: Add support for the ADIS16480 and similar IMUs

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6BE28F3
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658657635; x=1690193635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ryy2EMCYYiIeVNQ3AC8OKPJ4BW2C1M6cnMFEnMbS74o=;
  b=jpQ4NmuH66drgtzxiUB3oIfq68L9uaV9LcUB2fxlAA4A7ThA/JawxPtl
   U9oWLYLv2aJDGURCqWypEzGQqDsMnRrhHbX31jGJMyh6QXWSmvU8HQMs7
   TaOK2s9QXpGJz3ROp+fH3Ec5v1y7oxXYVYgmH39JzX5tYKDfiWns53+5o
   kWC+37W6mtxY72R9YumsCcgFIequ9kRnP0H/6U4Phpw/iO+GL8XwGUXbB
   ciaKW6mHlCao6hWzrX3iTPhDTzp5vI6Ta68s9/r9dqCUGdQAaxdwWiN+u
   Eqq16Eu93lbMGfqIchQ6FYr0d7wkEYWmDXMszYATPjjRXFmKxTMlUiMk6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="288290719"
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="288290719"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 03:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="574693086"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2022 03:13:53 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFYcS-0003nN-0t;
	Sun, 24 Jul 2022 10:13:52 +0000
Date: Sun, 24 Jul 2022 18:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Tomas Melin <tomas.melin@vaisala.com>
Subject: [linux-next:master 2450/12552] drivers/iio/accel/sca3300.c:162:8:
 warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes,
 where 1 is optimal). Optimal fields order: name, scan_masks, channels,
 accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, f...
Message-ID: <202207241857.Z2woeEfC-lkp@intel.com>
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
commit: 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53 [2450/12552] iio: accel: sca3300: Add inclination channels
config: s390-randconfig-c005-20220721 (https://download.01.org/0day-ci/archive/20220724/202207241857.Z2woeEfC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                   for (tile = 0; tile < 8; tile++) {
                   ^
   drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
                           if (!fbdata->force && !picolcd_fb_update_tile(
                               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
   drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_tile'
                           if (!fbdata->force && !picolcd_fb_update_tile(
                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is equal to 1
           if (bpp == 1) {
               ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:2: note: Taking true branch
           if (bpp == 1) {
           ^
   drivers/hid/hid-picolcd_fb.c:149:3: note: Loop condition is true.  Entering loop body
                   for (b = 7; b >= 0; b--) {
                   ^
   drivers/hid/hid-picolcd_fb.c:151:9: note: The value 0 is assigned to 'i'
                           for (i = 0; i < 64; i++) {
                                ^~~~~
   drivers/hid/hid-picolcd_fb.c:151:4: note: Loop condition is true.  Entering loop body
                           for (i = 0; i < 64; i++) {
                           ^
   drivers/hid/hid-picolcd_fb.c:152:14: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
                                   tdata[i] <<= 1;
                                   ~~~~~~~~ ^
   drivers/hid/hid-picolcd_fb.c:160:14: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                                   tdata[i] <<= 1;
                                            ^
   drivers/hid/hid-picolcd_fb.c:438:2: note: Calling 'picolcd_fb_update'
           picolcd_fb_update(info);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is not equal to 0
           if (!fbdata->ready && fbdata->picolcd)
               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
           if (!fbdata->ready && fbdata->picolcd)
                              ^
   drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  Entering loop body
           for (chip = 0; chip < 4; chip++)
           ^
   drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  Entering loop body
                   for (tile = 0; tile < 8; tile++) {
                   ^
   drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
                           if (!fbdata->force && !picolcd_fb_update_tile(
                               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
   drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_tile'
                           if (!fbdata->force && !picolcd_fb_update_tile(
                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is not equal to 1
           if (bpp == 1) {
               ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:2: note: Taking false branch
           if (bpp == 1) {
           ^
   drivers/hid/hid-picolcd_fb.c:156:13: note: Assuming 'bpp' is equal to 8
           } else if (bpp == 8) {
                      ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:156:9: note: Taking true branch
           } else if (bpp == 8) {
                  ^
   drivers/hid/hid-picolcd_fb.c:157:3: note: Loop condition is true.  Entering loop body
                   for (b = 7; b >= 0; b--) {
                   ^
   drivers/hid/hid-picolcd_fb.c:159:9: note: The value 0 is assigned to 'i'
                           for (i = 0; i < 64; i++) {
                                ^~~~~
   drivers/hid/hid-picolcd_fb.c:159:4: note: Loop condition is true.  Entering loop body
                           for (i = 0; i < 64; i++) {
                           ^
   drivers/hid/hid-picolcd_fb.c:160:14: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
                                   tdata[i] <<= 1;
                                   ~~~~~~~~ ^
   drivers/hid/hid-picolcd_fb.c:481:6: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           i = sscanf(buf, "%u", &u);
               ^~~~~~
   drivers/hid/hid-picolcd_fb.c:481:6: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
           i = sscanf(buf, "%u", &u);
               ^~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
>> drivers/iio/accel/sca3300.c:162:8: warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, angle_supported, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct sca3300_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:162:8: note: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, angle_supported, consider reordering the fields or adding explicit padding members
   struct sca3300_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:191:8: warning: Excessive padding in 'struct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields order: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct sca3300_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:191:8: note: Excessive padding in 'struct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields order: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or adding explicit padding members
   struct sca3300_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/hwmon/emc6w201.c:186:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/emc6w201.c:186:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/emc6w201.c:225:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
                  ^~~~~~~
   drivers/hwmon/emc6w201.c:225:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
                  ^~~~~~~
   drivers/hwmon/emc6w201.c:270:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", rpm);
                  ^~~~~~~
   drivers/hwmon/emc6w201.c:270:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", rpm);
                  ^~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/hwmon/f71882fg.c:1382:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1382:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1391:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1391:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1424:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1424:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1426:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1426:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1460:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1460:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1462:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1462:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1471:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->in[nr] * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1471:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->in[nr] * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1479:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->in1_max * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1479:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->in1_max * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1514:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");

vim +162 drivers/iio/accel/sca3300.c

38d5cd1e7ee0b3 LI Qingwu 2022-05-29  161  
ad985d4d38d7ad LI Qingwu 2022-05-29 @162  struct sca3300_chip_info {
ad985d4d38d7ad LI Qingwu 2022-05-29  163  	const char *name;
ad985d4d38d7ad LI Qingwu 2022-05-29  164  	const unsigned long *scan_masks;
ad985d4d38d7ad LI Qingwu 2022-05-29  165  	const struct iio_chan_spec *channels;
ad985d4d38d7ad LI Qingwu 2022-05-29  166  	u8 num_channels;
ad985d4d38d7ad LI Qingwu 2022-05-29  167  	u8 num_accel_scales;
ad985d4d38d7ad LI Qingwu 2022-05-29  168  	const int (*accel_scale)[2];
ad985d4d38d7ad LI Qingwu 2022-05-29  169  	const int *accel_scale_map;
38d5cd1e7ee0b3 LI Qingwu 2022-05-29  170  	const int (*incli_scale)[2];
38d5cd1e7ee0b3 LI Qingwu 2022-05-29  171  	const int *incli_scale_map;
38d5cd1e7ee0b3 LI Qingwu 2022-05-29  172  	u8 num_incli_scales;
ad985d4d38d7ad LI Qingwu 2022-05-29  173  	u8 num_freqs;
ad985d4d38d7ad LI Qingwu 2022-05-29  174  	const int *freq_table;
ad985d4d38d7ad LI Qingwu 2022-05-29  175  	const int *freq_map;
ad985d4d38d7ad LI Qingwu 2022-05-29  176  	const int *avail_modes_table;
ad985d4d38d7ad LI Qingwu 2022-05-29  177  	u8 num_avail_modes;
ad985d4d38d7ad LI Qingwu 2022-05-29  178  	u8 chip_id;
38d5cd1e7ee0b3 LI Qingwu 2022-05-29  179  	bool angle_supported;
ad985d4d38d7ad LI Qingwu 2022-05-29  180  };
ad985d4d38d7ad LI Qingwu 2022-05-29  181  

:::::: The code at line 162 was first introduced by commit
:::::: ad985d4d38d7ad8a83b0ff428ea51a2f41ce12e1 iio: accel: sca3300: modified to support multi chips

:::::: TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

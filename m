Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAD1C8A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645629715; x=1677165715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W91DoE6TL+4OKbeiMkBnlrkBiN+4cw0JCGKbCFOg1FI=;
  b=JH2NZdXJAAePzxAL9IRUXeYdhwhXXXqL4yS37v5nSkspDgOsqzciggBc
   ZqeJdRP6X+6wa6KpMRBCM7VSGfstWfvsLZhzUYi4u0Uooo0NT0EJYA5E9
   witBFvDTGdlqThhl9BgJmVDcnDV1CnMiVRB79s5xeaD8fXX2YE2k/Dlu1
   8kxxlLwhlKOlXqC3fLtFzR9QjKO+WBxXO9OAD8lmnBYo3e+nuKE6l3/r2
   xg/oK3JYexSLaegDnPeLOYmlrZAcU9OSKIUMdhwzfF/JeZx1ghrxAbnLK
   wEhTmnK6olX2PAi6IslWI/YA4nq8iyqq1vdKLR3pt64/tnFtjOzWhUbGp
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232606610"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="232606610"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:21:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="591734433"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2022 07:21:36 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMtSR-0001Yf-HT; Wed, 23 Feb 2022 15:21:35 +0000
Date: Wed, 23 Feb 2022 23:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [chenxing:msc313_mainlining 36/93]
 drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: warning: unannotated
 fall-through between switch labels
Message-ID: <202202232310.hUaNIAYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   99a396728dcff78ca3eddcbd2085f11eeb8a01b8
commit: 05d00d7581ff240f6293cebf5f0e58f743aeea4b [36/93] pinctrl: mstar: msc313 pinctrl driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202232310.hUaNIAYU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/linux-chenxing/linux/commit/05d00d7581ff240f6293cebf5f0e58f743aeea4b
        git remote add chenxing git://github.com/linux-chenxing/linux.git
        git fetch --no-tags chenxing msc313_mainlining
        git checkout 05d00d7581ff240f6293cebf5f0e58f743aeea4b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/imx/ drivers/irqchip/ drivers/pinctrl/mstar/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:36:27: warning: unused variable 'pm_uart_groups' [-Wunused-const-variable]
   static const char * const pm_uart_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:40:27: warning: unused variable 'pm_spi_groups' [-Wunused-const-variable]
   static const char * const pm_spi_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:44:27: warning: unused variable 'pm_irin_groups' [-Wunused-const-variable]
   static const char * const pm_irin_groups[] = {
                             ^
   3 warnings generated.
--
>> drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                           default:
                           ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:1339:4: note: insert 'break;' to avoid fall-through
                           default:
                           ^
                           break; 
>> drivers/pinctrl/mstar/pinctrl-msc313.c:37:27: warning: unused variable 'i2c0_groups' [-Wunused-const-variable]
   static const char * const i2c0_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:40:18: warning: unused variable 'i2c0_values' [-Wunused-const-variable]
   static const u16 i2c0_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:44:27: warning: unused variable 'i2c1_groups' [-Wunused-const-variable]
   static const char * const i2c1_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:47:18: warning: unused variable 'i2c1_values' [-Wunused-const-variable]
   static const u16 i2c1_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:51:27: warning: unused variable 'fuart_groups' [-Wunused-const-variable]
   static const char * const fuart_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:55:18: warning: unused variable 'fuart_values' [-Wunused-const-variable]
   static const u16 fuart_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:60:27: warning: unused variable 'uart0_groups' [-Wunused-const-variable]
   static const char * const uart0_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:64:27: warning: unused variable 'uart1_groups' [-Wunused-const-variable]
   static const char * const uart1_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:68:18: warning: unused variable 'uart1_values' [-Wunused-const-variable]
   static const u16 uart1_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:73:27: warning: unused variable 'usb_groups' [-Wunused-const-variable]
   static const char * const usb_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:76:27: warning: unused variable 'usb1_groups' [-Wunused-const-variable]
   static const char * const usb1_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:80:27: warning: unused variable 'pwm0_groups' [-Wunused-const-variable]
   static const char * const pwm0_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:83:18: warning: unused variable 'pwm0_values' [-Wunused-const-variable]
   static const u16 pwm0_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:87:27: warning: unused variable 'pwm1_groups' [-Wunused-const-variable]
   static const char * const pwm1_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:90:18: warning: unused variable 'pwm1_values' [-Wunused-const-variable]
   static const u16 pwm1_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:94:27: warning: unused variable 'pwm2_groups' [-Wunused-const-variable]
   static const char * const pwm2_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:97:18: warning: unused variable 'pwm2_values' [-Wunused-const-variable]
   static const u16 pwm2_values[] = {
                    ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:101:27: warning: unused variable 'pwm3_groups' [-Wunused-const-variable]
   static const char * const pwm3_groups[] = {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313.c:104:18: warning: unused variable 'pwm3_values' [-Wunused-const-variable]
   static const u16 pwm3_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:108:27: warning: unused variable 'pwm4_groups' [-Wunused-const-variable]
   static const char * const pwm4_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:111:18: warning: unused variable 'pwm4_values' [-Wunused-const-variable]
   static const u16 pwm4_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:115:27: warning: unused variable 'pwm5_groups' [-Wunused-const-variable]
   static const char * const pwm5_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:118:18: warning: unused variable 'pwm5_values' [-Wunused-const-variable]
   static const u16 pwm5_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:122:27: warning: unused variable 'pwm6_groups' [-Wunused-const-variable]
   static const char * const pwm6_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:125:18: warning: unused variable 'pwm6_values' [-Wunused-const-variable]
   static const u16 pwm6_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:129:27: warning: unused variable 'pwm7_groups' [-Wunused-const-variable]
   static const char * const pwm7_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:132:18: warning: unused variable 'pwm7_values' [-Wunused-const-variable]
   static const u16 pwm7_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:136:27: warning: unused variable 'eth_groups' [-Wunused-const-variable]
   static const char * const eth_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:139:18: warning: unused variable 'eth_values' [-Wunused-const-variable]
   static const u16 eth_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:143:27: warning: unused variable 'jtag_groups' [-Wunused-const-variable]
   static const char * const jtag_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:147:27: warning: unused variable 'spi0_groups' [-Wunused-const-variable]
   static const char * const spi0_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:151:18: warning: unused variable 'spi0_values' [-Wunused-const-variable]
   static const u16 spi0_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:155:27: warning: unused variable 'spi1_groups' [-Wunused-const-variable]
   static const char * const spi1_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:158:18: warning: unused variable 'spi1_values' [-Wunused-const-variable]
   static const u16 spi1_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:161:27: warning: unused variable 'sdio_groups' [-Wunused-const-variable]
   static const char * const sdio_groups[] = {
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:164:18: warning: unused variable 'sdio_values' [-Wunused-const-variable]
   static const u16 sdio_values[] = {
                    ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:201:27: warning: unused variable 'sd_drivestrengths' [-Wunused-const-variable]
   static const unsigned int sd_drivestrengths[] = {4, 8};
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:215:27: warning: unused variable 'spi0_drivestrengths' [-Wunused-const-variable]
   static const unsigned int spi0_drivestrengths[] = {4, 8, 12, 16};
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:225:27: warning: unused variable 'i2c_drivestrengths' [-Wunused-const-variable]
   static const unsigned int i2c_drivestrengths[] = {4, 8};
                             ^
   drivers/pinctrl/mstar/pinctrl-msc313.c:233:27: warning: unused variable 'sr_drivestrengths' [-Wunused-const-variable]
   static const unsigned int sr_drivestrengths[] = {4, 8};
                             ^
   41 warnings generated.


vim +1339 drivers/pinctrl/mstar/pinctrl-msc313.c

  1318	
  1319	static int mstar_set_config(struct msc313_pinctrl *pinctrl, int pin, unsigned long config)
  1320	{
  1321		enum pin_config_param param = pinconf_to_config_param(config);
  1322		u32 arg = pinconf_to_config_argument(config);
  1323		int i;
  1324		unsigned int mask;
  1325		const struct msc313_pinctrl_pinconf *confpin;
  1326	
  1327		dev_dbg(pinctrl->dev, "setting %d:%u on pin %d\n", (int)config, (unsigned int)arg, pin);
  1328		for (i = 0; i < pinctrl->info->npinconfs; i++) {
  1329			if (pinctrl->info->pinconfs[i].pin == pin) {
  1330				confpin = &pinctrl->info->pinconfs[i];
  1331				switch (param) {
  1332				case PIN_CONFIG_BIAS_PULL_UP:
  1333					if (confpin->pull_en_reg != -1) {
  1334						dev_dbg(pinctrl->dev, "setting pull up %d on pin %d\n", (int) arg, pin);
  1335						mask = 1 << confpin->pull_en_bit;
  1336						regmap_update_bits(pinctrl->regmap, confpin->pull_en_reg, mask, arg ? mask : 0);
  1337					} else
  1338						dev_info(pinctrl->dev, "pullup reg/bit isn't known for pin %d\n", pin);
> 1339				default:
  1340					break;
  1341				}
  1342				return 0;
  1343			}
  1344		}
  1345		return 0;
  1346	}
  1347	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

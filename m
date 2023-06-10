Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA62C8E3;
	Sat, 10 Jun 2023 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686414591; x=1717950591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BrSFLtlzuqPtV1oR/Y5C0G/kUggPS1rU3IEj7/Snh9U=;
  b=hTWpWUTJk1wGaQ57Igy2WMsnSI1iAllYnngAfob2+mv7gRTr+purCjFb
   af5vUqn74MuVndmP+qK+mD73uSzVzIRM0GA+STsZYgGDJGUIlpXjjgEq9
   t9C+tvJ/SWRVtaD9uBsBXYGTQ2VIM6TUOwjJVzlWaDMYRaH1YwGT3OOKd
   /cW2TL0aZL8xGON2Ujf7vZ6XykSHDTHNHVnwr8X/L4/KzwhaePa2vYzpg
   64cYvPGp0T60Qw8GL8lQnYSS3la0PDrdQCVpoQqo5tsFUczerZy8ZyzIt
   NRbRlRNXXu8Z1vhiyqXaZ2CWyKVnUbtnFviHKaTsjprcsAqcts2oSPRxY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444152591"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="444152591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 09:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855084192"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="855084192"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 09:29:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q81TG-000AEO-39;
	Sat, 10 Jun 2023 16:29:46 +0000
Date: Sun, 11 Jun 2023 00:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
Message-ID: <202306110018.Ir9UVvn9-lkp@intel.com>
References: <20230610091320.1054554-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610091320.1054554-9-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on next-20230609]
[cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm/linux-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Revert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230610-171620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy%40kernel.org
patch subject: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
config: s390-randconfig-r003-20230610 (https://download.01.org/0day-ci/archive/20230611/202306110018.Ir9UVvn9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch masahiroy-kbuild for-next
        git checkout masahiroy-kbuild/for-next
        b4 shazam https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110018.Ir9UVvn9-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x24): undefined reference to `of_iomap'
>> s390x-linux-ld: irq-al-fic.c:(.init.text+0x1f0): undefined reference to `iounmap'
--
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/amd.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-imon-pad.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/input/rmi4/rmi_smbus.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/health/max30100.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/ir-nec-decoder.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/dp83848.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/power/supply/bq2415x_charger.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-nebula.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/davicom.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/common/st_sensors/st_sensors.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'fs/nls/mac-centeuro.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/proximity/vl53l0x-i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/misc/isl29003.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/comedi/comedi.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/accel/mma7660.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/adc/envelope-detector.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/raid_class.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/light/veml6070.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/input/misc/pwm-vibra.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-pine64.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-dreambox.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/nfc/pn544/pn544.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/dac/dpot-dac.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-dib0700-nec.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/light/apds9960.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/national.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/qsemi.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-beelink-gs1.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/virtio/virtio_input.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/leds-tlc591xx.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/temperature/tsys01.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/magnetometer/hmc5843_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'fs/befs/befs.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/magnetometer/mmc35240.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/staging/most/net/most_net.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-tevii-nec.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/nfc/pn544/pn544_i2c.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/pressure/mpl3115.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-zx-irdec.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/trigger/ledtrig-pattern.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'kernel/kheaders.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/scsi_transport_fc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/base/regmap/regmap-i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/misc/lis3lv02d/lis3lv02d.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-astrometa-t2hybrid.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/misc/echo/echo.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/most/most_cdev.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/slimbus/slimbus.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/s390/char/con3270.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/microchip_t1.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/regulator/sy8106a-regulator.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-hauppauge.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/light/adux1020.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/pps/clients/pps-ktimer.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/iio/industrialio-sw-trigger.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-xbox-dvd.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/power/supply/ltc2941-battery-gauge.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/crc64-rocksoft.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-technisat-usb2.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/target/target_core_pscsi.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/mscc/mscc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'fs/nls/nls_euc-jp.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/dac/max517.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/notifier-error-inject.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/buffer/industrialio-buffer-dma.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/sm_ftl.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/nfc/microread/microread_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-budget-ci-old.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-pixelview-new.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/proximity/sx_common.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-flydvb.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/common/st_sensors/st_sensors_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/accel/mma7455_core.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'fs/cachefiles/cachefiles.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/hwtracing/stm/dummy_stm.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/hid/hid-cypress.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/hid/hid-led.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/scsi_transport_iscsi.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/pressure/st_pressure.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/device_handler/scsi_dh_emc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/md4.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/power/supply/bq25890_charger.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/regulator/ltc3589.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/accel/adxl345_core.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-anysee.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/kunit/kunit-test.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/of-reconfig-notifier-error-inject.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/trigger/ledtrig-activity.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/light/isl29028.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/imu/inv_mpu6050/inv-mpu6050-i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/nftl.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/power/supply/smb347-charger.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-kaiomy.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/tests/mtd_readtest.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/light/al3320a.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/hid/hid-keytouch.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/leds-is31fl319x.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-wetek-play2.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-avermedia-m135a.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/chemical/ams-iaq-core.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/wan/hdlc_raw.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/accel/dmard06.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/regulator/vctrl-regulator.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/misc/eeprom/ee1004.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/regulator/mpq7920.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/tests/mtd_subpagetest.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/leds-pwm.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/proximity/sx9310.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/target/tcm_fc/tcm_fc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/ubi/ubi.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'arch/s390/net/pnet.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/magnetometer/bmc150_magn.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/eql.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/vfio/vfio.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/light/si1133.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/nand/raw/nandsim.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/accel/dmard09.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/dac/ad5592r-base.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-beelink-mxiii.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/staging/most/i2c/most_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'net/netlink/netlink_diag.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/spmi/spmi.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/devfreq/governor_userspace.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/nvmem/nvmem_qcom-spmi-sdam.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'net/unix/unix_diag.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/pcbc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/cast_common.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-pinnacle-grey.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/humidity/hdc100x.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-msi-digivox-ii.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/chemical/scd30_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/magnetometer/hmc5843_core.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/mdio/fwnode_mdio.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/phy/et1011c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/scsi_debug.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'net/unix/unix.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/i2c/muxes/i2c-mux-pca954x.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/mdio/mdio-mux.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/mtd/chips/map_absent.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/wan/hdlc_cisco.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/wan/hdlc_ppp.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/scsi/sd_mod.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/hid/hid-monterey.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/lzo-rle.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/kunit/kunit-example-test.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/power/supply/cw2015_battery.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/input/misc/drv2667.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/imu/fxos8700_i2c.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/media/rc/keymaps/rc-twinhan1027.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/s390/net/smsgiucv.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/pressure/ms5637.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'fs/fuse/virtiofs.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/dac/ad5686.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/adc/qcom-spmi-adc5.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/target/target_core_user.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/leds/leds-lm3530.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/iio/accel/da311.ko', needed by '__modfinal'.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

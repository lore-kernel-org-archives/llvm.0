Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60413D76
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657904439; x=1689440439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3VKXAnq32O/MiYuI7amCRRN/Y85H/Ky2ZStbfVc93M=;
  b=Org0aprcwd7T5UMqsOnWRmof/tv8429IoQBaRg9U7R7q9gJYiYVg3uYS
   JhoLYsAt8EBho8bQcKUWrTL2jOQpagLJ+6nTTS/v/H9E29SJ16FvDlPP0
   4c3/TRDUBxCD6GMWAsCG7WScikDlWVWoirUdc1IeQzMS9UkuCe6LkndEz
   vMTdjMKy0FjS9F7l9h2djUkxVoaahZGu1yPh0hiYmqkb0GT+loSJZ/0v6
   rjT33XsWz/ORFd4zUkQelBkd7LcSntYEGj0OmnA5IKCc8QHowemHRgUm1
   doFBypYmhDlaD6GaZjOqaSJGVdHxrnZp238sF5pF3CBd+bVdr8aGsOd+7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="265631238"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="265631238"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 10:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="723141480"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2022 10:00:37 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCOg8-0000W0-BV;
	Fri, 15 Jul 2022 17:00:36 +0000
Date: Sat, 16 Jul 2022 01:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 11/18]
 drivers/hid/spi-hid/spi-hid-apple-core.c:259:22: warning: no previous
 prototype for function 'spihid_get_data'
Message-ID: <202207160028.MFKQvcjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   2902ed1bd2d6ac439a835c53841122c7f3455a6c
commit: caee9bbb3f5dd71fbcc4690a7c2e97ff6964ab92 [11/18] WIP: HID: transport: spi: add Apple SPI transport
config: arm64-randconfig-r014-20220715 (https://download.01.org/0day-ci/archive/20220716/202207160028.MFKQvcjJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/caee9bbb3f5dd71fbcc4690a7c2e97ff6964ab92
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout caee9bbb3f5dd71fbcc4690a7c2e97ff6964ab92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/hid/spi-hid/ drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-apple-core.c:259:22: warning: no previous prototype for function 'spihid_get_data' [-Wmissing-prototypes]
   struct spihid_apple *spihid_get_data(struct spihid_interface *idev)
                        ^
   drivers/hid/spi-hid/spi-hid-apple-core.c:259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct spihid_apple *spihid_get_data(struct spihid_interface *idev)
   ^
   static 
   drivers/hid/spi-hid/spi-hid-apple-core.c:56:17: warning: variable 'spi_hid_apple_status_ok' is not needed and will not be emitted [-Wunneeded-internal-declaration]
   static const u8 spi_hid_apple_status_ok[4] = { 0xac, 0x27, 0x68, 0xd5 };
                   ^
   2 warnings generated.
--
>> drivers/hid/spi-hid/spi-hid-apple-of.c:24:5: warning: no previous prototype for function 'spihid_apple_of_power_on' [-Wmissing-prototypes]
   int spihid_apple_of_power_on(struct spihid_apple_ops *ops)
       ^
   drivers/hid/spi-hid/spi-hid-apple-of.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spihid_apple_of_power_on(struct spihid_apple_ops *ops)
   ^
   static 
>> drivers/hid/spi-hid/spi-hid-apple-of.c:40:5: warning: no previous prototype for function 'spihid_apple_of_power_off' [-Wmissing-prototypes]
   int spihid_apple_of_power_off(struct spihid_apple_ops *ops)
       ^
   drivers/hid/spi-hid/spi-hid-apple-of.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spihid_apple_of_power_off(struct spihid_apple_ops *ops)
   ^
   static 
>> drivers/hid/spi-hid/spi-hid-apple-of.c:50:5: warning: no previous prototype for function 'spihid_apple_of_enable_irq' [-Wmissing-prototypes]
   int spihid_apple_of_enable_irq(struct spihid_apple_ops *ops)
       ^
   drivers/hid/spi-hid/spi-hid-apple-of.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spihid_apple_of_enable_irq(struct spihid_apple_ops *ops)
   ^
   static 
>> drivers/hid/spi-hid/spi-hid-apple-of.c:59:5: warning: no previous prototype for function 'spihid_apple_of_disable_irq' [-Wmissing-prototypes]
   int spihid_apple_of_disable_irq(struct spihid_apple_ops *ops)
       ^
   drivers/hid/spi-hid/spi-hid-apple-of.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spihid_apple_of_disable_irq(struct spihid_apple_ops *ops)
   ^
   static 
   4 warnings generated.


vim +/spihid_get_data +259 drivers/hid/spi-hid/spi-hid-apple-core.c

   258	
 > 259	struct spihid_apple *spihid_get_data(struct spihid_interface *idev)
   260	{
   261		switch (idev->id) {
   262		case SPIHID_DEVICE_ID_KBD:
   263			return container_of(idev, struct spihid_apple, kbd);
   264		case SPIHID_DEVICE_ID_TP:
   265			return container_of(idev, struct spihid_apple, tp);
   266		default:
   267			return NULL;
   268		}
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F621C01;
	Tue,  2 May 2023 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683049054; x=1714585054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bgl7jfMhMwCSv8N4mlJtlrwRY/5SidkPVY0AVyh3p7k=;
  b=PByRcTSpLqJgFJZ/WfrFu8s89R8Z1m+XT08WuCRsOM4DwqhUZU4TU8ST
   s43DkCqUjhK75tEwmjK7t1Ywk5mrdI4E+onPtYmbl7guwLnJ2jZCoV5U3
   RIWfDtCbWIDaSFy/paKHmrDL68pfwqrDLao7RXm9mq/qbIeaTNh71PUjm
   iy2IGKbECwotgsJEmjOw7z/ZPgQgrteijpXQoSFL6pQqXXC9vt5HqFjwK
   MmYBaShPvG3yrd8jIw4rqffbX2BWU2NTZ/FQQmieBhaWd4Kh3L/Ffcu1H
   TrqTTWYCdweyRqfZN5EYwqf9RE/CuojZTj1QJ5F+tfIkwofjuujegmfsH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337600289"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="337600289"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 10:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673740176"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="673740176"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 May 2023 10:37:32 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pttwR-0001Bk-1P;
	Tue, 02 May 2023 17:37:31 +0000
Date: Wed, 3 May 2023 01:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: "larry.lai" <larry.lai@yunjingtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC RESEND 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Message-ID: <202305030144.WmuMog6A-lkp@intel.com>
References: <20230425152135.30745-3-larry.lai@yunjingtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425152135.30745-3-larry.lai@yunjingtech.com>

Hi larry.lai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4fe89d07dcc2804c8b562f6c7896a45643d34b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
base:   4fe89d07dcc2804c8b562f6c7896a45643d34b2f
patch link:    https://lore.kernel.org/r/20230425152135.30745-3-larry.lai%40yunjingtech.com
patch subject: [RFC RESEND 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230503/202305030144.WmuMog6A-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b8c1c33f21a4a0526016b4ec803adabc2d32b035
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20230425-232744
        git checkout b8c1c33f21a4a0526016b4ec803adabc2d32b035
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/ drivers/hwmon/ drivers/pinctrl/ drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030144.WmuMog6A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-upboard.c:754:13: warning: variable length array used [-Wvla]
           int offset[pctrl->pctldesc->npins];
                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-upboard.c:774:8: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                   bool input = false;
                        ^
>> drivers/pinctrl/pinctrl-upboard.c:877:26: warning: unused variable 'pctrl' [-Wunused-variable]
           struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
                                   ^
   drivers/pinctrl/pinctrl-upboard.c:888:19: warning: variable length array used [-Wvla]
           char name[strlen(pctrl->pctldesc->pins[pin].name)];
                     ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-upboard.c:1009:5: warning: no previous prototype for function 'upboard_acpi_node_pin_mapping' [-Wmissing-prototypes]
   int upboard_acpi_node_pin_mapping(struct upboard_fpga *fpga,
       ^
   drivers/pinctrl/pinctrl-upboard.c:1009:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int upboard_acpi_node_pin_mapping(struct upboard_fpga *fpga,
   ^
   static 
>> drivers/pinctrl/pinctrl-upboard.c:1068:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UP_APL03,
                            ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:85:26: note: expanded from macro 'BOARD_UP_APL03'
   #define BOARD_UP_APL03                  9
                                           ^
   drivers/pinctrl/pinctrl-upboard.c:1075:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UP_WHL01,
                            ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:82:26: note: expanded from macro 'BOARD_UP_WHL01'
   #define BOARD_UP_WHL01                  5
                                           ^
   drivers/pinctrl/pinctrl-upboard.c:1082:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPX_TGL,
                            ^~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:87:25: note: expanded from macro 'BOARD_UPX_TGL'
   #define BOARD_UPX_TGL                   11
                                           ^~
   drivers/pinctrl/pinctrl-upboard.c:1089:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPN_EHL01,
                            ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:89:27: note: expanded from macro 'BOARD_UPN_EHL01'
   #define BOARD_UPN_EHL01                 13
                                           ^~
   drivers/pinctrl/pinctrl-upboard.c:1096:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPS_EHL01,
                            ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:90:27: note: expanded from macro 'BOARD_UPS_EHL01'
   #define BOARD_UPS_EHL01                 14
                                           ^~
   drivers/pinctrl/pinctrl-upboard.c:1103:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPX_ADLP01,
                            ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:91:27: note: expanded from macro 'BOARD_UPX_ADLP01'
   #define BOARD_UPX_ADLP01                15
                                           ^~
   drivers/pinctrl/pinctrl-upboard.c:1110:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPN_ADLN01,
                            ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:92:27: note: expanded from macro 'BOARD_UPN_ADLN01'
   #define BOARD_UPN_ADLN01                16
                                           ^~
   drivers/pinctrl/pinctrl-upboard.c:1117:12: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
                   .ident = BOARD_UPS_ADLP01,
                            ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:93:27: note: expanded from macro 'BOARD_UPS_ADLP01'
   #define BOARD_UPS_ADLP01                15
                                           ^~
>> drivers/pinctrl/pinctrl-upboard.c:1253:16: warning: incompatible pointer to integer conversion assigning to 'int' from 'const char *const' [-Wint-conversion]
                   pctrl->ident = system_id->ident;
                                ^ ~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:298:38: warning: unused variable 'pin_groups' [-Wunused-const-variable]
   static const struct upboard_pingroup pin_groups[] = {
                                        ^
   drivers/pinctrl/pinctrl-upboard.c:320:38: warning: unused variable 'pin_functions' [-Wunused-const-variable]
   static const struct upboard_function pin_functions[] = {
                                        ^
   16 warnings generated.


vim +754 drivers/pinctrl/pinctrl-upboard.c

   750	
   751	static void upboard_alt_func_enable(struct gpio_chip *gc, const char *name, int id)
   752	{
   753		struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
 > 754		int offset[pctrl->pctldesc->npins];
   755		int i, cnt;
   756	
   757		/* find all pins */
   758		for (i = 0, cnt = 0; i < pctrl->pctldesc->npins; i++) {
   759			if (strstr(pctrl->pctldesc->pins[i].name, name))
   760				offset[cnt++] = i;
   761		}
   762	
   763		for (i = 0; i < cnt; i++) {
   764			if (pinctrl_gpio_request(pctrl->pins[offset[i]].gpio))
   765				return; /* this pin is being used */
   766	
   767			pinctrl_gpio_free(pctrl->pins[offset[i]].gpio);
   768		}
   769	
   770		/* change to alternate function */
   771		for (i = 0; i < cnt; i++) {
   772			if (pctrl->pins[offset[i]].regs == NULL)
   773				continue;
 > 774			bool input = false;
   775			int mode = 1; /* default */
   776			unsigned int val = readl(pctrl->pins[offset[i]].regs);
   777	
   778			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "I2C")) {
   779				switch (id) {
   780				case BOARD_UPN_ADLN01:
   781				case BOARD_UPX_ADLP01:
   782					mode = 2;
   783					break;
   784				default:
   785					break;
   786				}
   787				val |= mode<<PADCFG0_PMODE_SHIFT;
   788				writel(val, pctrl->pins[offset[i]].regs);
   789				upboard_fpga_request_free(pctrl->pctldev, offset[i]);
   790				continue;
   791			} else if (strstr(pctrl->pctldesc->pins[offset[i]].name, "UART")) {
   792				switch (id) {
   793				case BOARD_UPN_EHL01:
   794				case BOARD_UPS_EHL01:
   795					mode = 4;
   796					break;
   797				case BOARD_UPN_ADLN01:
   798				case BOARD_UPX_ADLP01:
   799					mode = 2;
   800					break;
   801				default:
   802					break;
   803				}
   804			} else if (strstr(pctrl->pctldesc->pins[offset[i]].name, "SPI")) {
   805				switch (id) {
   806				case BOARD_UP_WHL01:
   807					mode = 3;
   808					break;
   809				case BOARD_UPN_ADLN01:
   810				case BOARD_UPX_ADLP01:
   811					mode = 7;
   812					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MOSI")) {
   813						val &= ~PADCFG0_GPIOTXDIS;
   814						val |= PADCFG0_GPIORXDIS;
   815					}
   816					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MISO")) {
   817						val |= PADCFG0_GPIORXDIS;
   818					}
   819					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CLK")) {
   820						val &= ~PADCFG0_GPIOTXDIS;
   821						val |= PADCFG0_GPIORXDIS;
   822					}
   823					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CS0")) {
   824						val |= PADCFG0_GPIORXDIS;
   825					}
   826					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CS1")) {
   827						continue;
   828					}
   829					break;
   830				default:
   831					break;
   832				}
   833			} else if (strstr(pctrl->pctldesc->pins[offset[i]].name, "I2S")) {
   834				switch (id) {
   835				case BOARD_UPX_ADLP01:
   836					mode = 4;
   837					break;
   838				default:
   839					break;
   840				}
   841			}
   842			val |= mode<<PADCFG0_PMODE_SHIFT;
   843			writel(val, pctrl->pins[offset[i]].regs);
   844	
   845			/* input pins */
   846			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "RX"))
   847				input = true;
   848			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CTS"))
   849				input = true;
   850			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "ADC"))
   851				input = true;
   852			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MISO"))
   853				input = true;
   854			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "DIN"))
   855				input = true;
   856			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "SDI"))
   857				input = true;
   858			upboard_fpga_set_direction(pctrl->pctldev, NULL, offset[i], input);
   859		}
   860	}
   861	
   862	static int upboard_rpi_to_native_gpio(struct gpio_chip *gc, unsigned int gpio)
   863	{
   864		struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
   865		unsigned int pin = pctrl->rpi_mapping[gpio];
   866		struct pinctrl_gpio_range *range;
   867	
   868		range = pinctrl_find_gpio_range_from_pin(pctrl->pctldev, pin);
   869		if (!range)
   870			return -ENODEV;
   871	
   872		return range->base;
   873	}
   874	
   875	static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
   876	{
 > 877		struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
   878		int gpio = upboard_rpi_to_native_gpio(gc, offset);
   879	
   880		return pinctrl_gpio_request(gpio);
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

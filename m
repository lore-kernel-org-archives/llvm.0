Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC2AA54;
	Fri, 10 Mar 2023 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678426319; x=1709962319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWfDmW7LSGx/qeqdHSHGAX/d0IEog+56aUHCK77FZ/I=;
  b=FykuxKfITMReJxEiHSrWRrGj5z6vxT+vz7G2c6LtKna8kBAJkAIk0ltY
   4HbucpLjap1yvUI5DKCWLj+0gPR0kAM5nMSPM+B6n3Hb6kqc7vkYU6Oxt
   dGN6khwq2V6YlD+1DNyOAF6TDfXDFFlc3VhG/5wq13FBn+DwuQJt5U7jc
   d75LjpFU1PBOxrhOZNj398HJfdZ/NrLQMtDjiia2crw7kQLR8+8FxyFkM
   N03dEJpfCOfoLuTkoiGgOBZxmDQ7ANKQUMUjWa+oArfx1Zws7sR8zi71E
   9jAymGRNO9juUpvKsPnRRirtAl3GYVQXmfB/GqyFh/5/iUq93jsZUglSQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="339014769"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="339014769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 21:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="710148680"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="710148680"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 21:31:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paVMA-0003Xj-2H;
	Fri, 10 Mar 2023 05:31:54 +0000
Date: Fri, 10 Mar 2023 13:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kangzhen Lou <kangzhen.lou@dell.com>, oliver@neukum.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, Kangzhen Lou <kangzhen.lou@dell.com>
Subject: Re: [PATCH] net: cdc_ncm: support ACPI MAC address pass through
 functionality
Message-ID: <202303101331.rzCbgFQa-lkp@intel.com>
References: <20230309083436.6729-1-kangzhen.lou@dell.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309083436.6729-1-kangzhen.lou@dell.com>

Hi Kangzhen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on westeri-thunderbolt/next]
[also build test ERROR on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kangzhen-Lou/net-cdc_ncm-support-ACPI-MAC-address-pass-through-functionality/20230309-184736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20230309083436.6729-1-kangzhen.lou%40dell.com
patch subject: [PATCH] net: cdc_ncm: support ACPI MAC address pass through functionality
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230310/202303101331.rzCbgFQa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/97cd8ee9a774c36093af3d26255e415f6082b4a3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kangzhen-Lou/net-cdc_ncm-support-ACPI-MAC-address-pass-through-functionality/20230309-184736
        git checkout 97cd8ee9a774c36093af3d26255e415f6082b4a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ drivers/net/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101331.rzCbgFQa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/usb/cdc_ncm.c:818:5: warning: no previous prototype for function 'acpi_mac_passthru_invalid' [-Wmissing-prototypes]
   int acpi_mac_passthru_invalid(void)
       ^
   drivers/net/usb/cdc_ncm.c:818:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acpi_mac_passthru_invalid(void)
   ^
   static 
>> drivers/net/usb/cdc_ncm.c:851:5: warning: no previous prototype for function 'get_acpi_mac_passthru' [-Wmissing-prototypes]
   int get_acpi_mac_passthru(char *MACAddress)
       ^
   drivers/net/usb/cdc_ncm.c:851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_acpi_mac_passthru(char *MACAddress)
   ^
   static 
>> drivers/net/usb/cdc_ncm.c:894:20: error: passing 'const unsigned char *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                 iface_no, dev->net->dev_addr, ETH_ALEN);
                                           ^~~~~~~~~~~~~~~~~~
   include/linux/usb/usbnet.h:181:35: note: passing argument to parameter 'data' here
                       u16 value, u16 index, void *data, u16 size);
                                                   ^
   drivers/net/usb/cdc_ncm.c:980:12: error: passing 'const unsigned char *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                   memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
                                          ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/string.h:27:28: note: passing argument to parameter here
   extern void * memcpy(void *,const void *,__kernel_size_t);
                              ^
   2 warnings and 2 errors generated.


vim +894 drivers/net/usb/cdc_ncm.c

   817	
 > 818	int acpi_mac_passthru_invalid(void)
   819	{
   820		acpi_status status;
   821		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   822		union acpi_object *obj;
   823		int ret = -EINVAL;
   824	
   825		/* returns _AUXMAC_#AABBCCDDEEFF# */
   826		status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
   827		obj = (union acpi_object *)buffer.pointer;
   828	
   829		if (!ACPI_SUCCESS(status))
   830			return -ENODEV;
   831		if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
   832			acpi_info("Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
   833				  obj->type, obj->string.length);
   834			goto amacout;
   835		}
   836		if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
   837		    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
   838			acpi_info("Invalid header when reading pass-thru MAC addr\n");
   839			goto amacout;
   840		}
   841		/* return success, otherwise return non-zero if invalid buffer read or
   842		 * MAC pass through is disabled in BIOS
   843		 */
   844		ret = 0;
   845	
   846	amacout:
   847		kfree(obj);
   848		return ret;
   849	}
   850	
 > 851	int get_acpi_mac_passthru(char *MACAddress)
   852	{
   853		acpi_status status;
   854		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   855		union acpi_object *obj;
   856		int ret = -EINVAL;
   857		unsigned char buf[6];
   858	
   859		/* returns _AUXMAC_#AABBCCDDEEFF# */
   860		status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
   861		obj = (union acpi_object *)buffer.pointer;
   862	
   863		if (!ACPI_SUCCESS(status))
   864			return -ENODEV;
   865	
   866		ret = hex2bin(buf, obj->string.pointer + 9, 6);
   867		if (!(ret == 0 && is_valid_ether_addr(buf))) {
   868			acpi_info("Invalid MAC for pass-thru MAC addr: %d, %pM\n",
   869				  ret, buf);
   870			ret = -EINVAL;
   871			goto amacout;
   872		}
   873		memcpy(MACAddress, buf, 6);
   874		acpi_info("Pass-thru MAC addr %pM\n", MACAddress);
   875	
   876	amacout:
   877		kfree(obj);
   878		return ret;
   879	}
   880	
   881	/* Provide method to get MAC address from the USB device's ethernet controller.
   882	 * If the device supports CDC_GET_ADDRESS, we should receive just six bytes.
   883	 * Otherwise, use the prior method by asking for the descriptor.
   884	 */
   885	static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
   886						struct cdc_ncm_ctx *ctx)
   887	{
   888		int ret;
   889		u8 iface_no = ctx->control->cur_altsetting->desc.bInterfaceNumber;
   890	
   891		ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
   892				      USB_DIR_IN | USB_TYPE_CLASS
   893				      | USB_RECIP_INTERFACE, 0,
 > 894				      iface_no, dev->net->dev_addr, ETH_ALEN);
   895	
   896		if (ret == ETH_ALEN) {
   897			ret = 0;	/* success */
   898		} else {
   899			ret = usbnet_get_ethernet_addr(dev,
   900					ctx->ether_desc->iMACAddress);
   901		}
   902	
   903		return ret;
   904	}
   905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

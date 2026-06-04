Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5E37DEBF;
	Thu,  4 Jun 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567704; cv=none; b=Mbo8q/TZin9IYBOVDxZ4Bryr2c1iqU19sPDN2k7UbhqrwJC//1gnvFP60PoKg1Awkr3S6MgPufJ3BF6MxYpZL8Fu9le4BLZF5+lznOZ1VPEG4/IVFfJCLxDqMNwR3JL0WxqyrZhkhxJ3N8edk/KQnco0ZGWCnDkIjxwma9CUSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567704; c=relaxed/simple;
	bh=n8dz+rAIivGTlLz4kr9eKw2AJPPEpZQAQx3LTSxHyQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRDcmmlz+XhfacXbGjeiRR6RvONY8WxB93ntjOEunlLT4Bn2izQDg90wI9E0nSW6sgRnJxZQuS6HOoddRaW0DUj1vO/SV9w0F4LNwqkW/4FYi5NpP89vl4xZdhO+SSegEqGMYutKqMCOC2W/B+OaqiIRBI8vTPm6x8sYkXOpATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqD8yWFo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqD8yWFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780567696; x=1812103696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=n8dz+rAIivGTlLz4kr9eKw2AJPPEpZQAQx3LTSxHyQc=;
  b=eqD8yWFo/dGB6drEJRgUjtPYKGPrWmYW+vZL+69sUlpCw3BevISHy69a
   HdO4Tzl7uYprIwV+8OKdAAVQMzr29YdrTfMqnVHM1pL4HmuBTC/wpzfd1
   w3I4ebE94bYCmu+EAiYIapn9/RmKdyEXPLPv2XPLxiPV2Kgsxnerl2WQY
   tkIpJdwgBAwzdlb3sIg88d5SFK4Rv7IBrxSbowg61Z+RFlEEZBdPa+HMe
   lh2BddlzpE/Ll6eQSI9kiZJCVH0NmxjYE83etxtA9WHkaEh8SfuUDLamx
   tIEoVnB4t7qOTeQT4nC18gR8wpjidNZggof8HspygdTuEK6F6J7IkadYt
   A==;
X-CSE-ConnectionGUID: S+YuiMBbQlaxhra2heFbXA==
X-CSE-MsgGUID: Ds+TRI8XTf6d8Zp8ILKhXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81573913"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81573913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 03:08:04 -0700
X-CSE-ConnectionGUID: 67qOfRWdTtilIiJQU9mI7Q==
X-CSE-MsgGUID: UYRrd3pzQFGd4OZh1NNvHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="244621400"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2026 03:08:00 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV4zV-000000002Jf-0apE;
	Thu, 04 Jun 2026 10:07:57 +0000
Date: Thu, 4 Jun 2026 12:07:32 +0200
From: kernel test robot <lkp@intel.com>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jack Wu <jackbb_wu@compal.com>
Subject: Re: [PATCH v2] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Message-ID: <202606041246.ZhwbKrIJ-lkp@intel.com>
References: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>

Hi Jack,

kernel test robot noticed the following build errors:

[auto build test ERROR on e43ffb69e0438cddd72aaa30898b4dc446f664f8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Wu-via-B4-Relay/USB-serial-option-add-new-usb-id-for-Dell-Wireless-DW5826e-m/20260604-101712
base:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
patch link:    https://lore.kernel.org/r/20260604-dw5826e-option-driver-v2-1-00609f65f5ae%40compal.com
patch subject: [PATCH v2] USB: serial: option: add new usb-id for Dell Wireless DW5826e-m
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260604/202606041246.ZhwbKrIJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041246.ZhwbKrIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041246.ZhwbKrIJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/serial/option.c:1132:2: error: expected '}'
    1132 |         { USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },   /* ADU-E100, ADU-310 */
         |         ^
   drivers/usb/serial/option.c:645:50: note: to match this '{'
     645 | static const struct usb_device_id option_ids[] = {
         |                                                  ^
>> drivers/usb/serial/option.c:2537:1: error: definition of variable with array type needs an explicit size or an initializer
    2537 | MODULE_DEVICE_TABLE(usb, option_ids);
         | ^
   include/linux/module.h:256:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     256 | static typeof(name) __mod_device_table(type, name)                      \
         |                     ^
   include/linux/module.h:247:2: note: expanded from macro '__mod_device_table'
     247 |         __PASTE(__mod_device_table__,   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:339:1: note: expanded from here
     339 | __mod_device_table__kmod_option__usb__option_ids
         | ^
   2 errors generated.


vim +1132 drivers/usb/serial/option.c

2438c3a19dec5e Daniele Palmas               2019-12-19   643  
71a0483d56e784 Kristian Evensen             2018-02-01   644  
7d40d7e85a25e0 Németh Márton                2010-01-10   645  static const struct usb_device_id option_ids[] = {
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   646  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   647  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   648  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_LIGHT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   649  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_QUAD) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   650  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_QUAD_LIGHT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   651  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_NDIS) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   652  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_NDIS_LIGHT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   653  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_NDIS_QUAD) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   654  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_RICOLA_NDIS_QUAD_LIGHT) },
14f76cc7ab75b1 Matthias Urlichs             2006-06-02   655  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COBRA) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   656  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COBRA_BUS) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   657  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_VIPER) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   658  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_VIPER_BUS) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   659  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_GT_MAX_READY) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   660  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_FUJI_MODEM_LIGHT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   661  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_FUJI_MODEM_GT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   662  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_FUJI_MODEM_EX) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   663  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_KOI_MODEM) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   664  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_SCORPION_MODEM) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   665  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_ETNA_MODEM) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   666  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_ETNA_MODEM_LITE) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   667  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_ETNA_MODEM_GT) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   668  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_ETNA_MODEM_EX) },
fd978bfa127a0b Greg Kroah-Hartman           2007-02-21   669  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_ETNA_KOI_MODEM) },
e7f2f0d77a7b48 Achilleas Kotsis             2009-03-16   670  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_GTM380_MODEM) },
fc91be2ad03e0d Alex.Cheng@quantatw.com      2009-01-22   671  	{ USB_DEVICE(QUANTA_VENDOR_ID, QUANTA_PRODUCT_Q101) },
fc91be2ad03e0d Alex.Cheng@quantatw.com      2009-01-22   672  	{ USB_DEVICE(QUANTA_VENDOR_ID, QUANTA_PRODUCT_Q111) },
fc91be2ad03e0d Alex.Cheng@quantatw.com      2009-01-22   673  	{ USB_DEVICE(QUANTA_VENDOR_ID, QUANTA_PRODUCT_GLX) },
fc91be2ad03e0d Alex.Cheng@quantatw.com      2009-01-22   674  	{ USB_DEVICE(QUANTA_VENDOR_ID, QUANTA_PRODUCT_GKE) },
fc91be2ad03e0d Alex.Cheng@quantatw.com      2009-01-22   675  	{ USB_DEVICE(QUANTA_VENDOR_ID, QUANTA_PRODUCT_GLE) },
cd565279e51bed Bjørn Mork                   2013-02-12   676  	{ USB_DEVICE(QUANTA_VENDOR_ID, 0xea42),
c3a65808f04a84 Johan Hovold                 2018-03-07   677  	  .driver_info = RSVD(4) },
1f3f687722fd9b Bjørn Mork                   2013-02-13   678  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x1c05, USB_CLASS_COMM, 0x02, 0xff) },
daec90e7382cbd Bjørn Mork                   2013-02-27   679  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x1c1f, USB_CLASS_COMM, 0x02, 0xff) },
1f3f687722fd9b Bjørn Mork                   2013-02-13   680  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x1c23, USB_CLASS_COMM, 0x02, 0xff) },
f36446cf9bbeba Bjørn Mork                   2012-11-25   681  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   682  	  .driver_info = RSVD(1) },
8f173e22abf225 Gustavo Zacarias             2013-11-11   683  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173S6, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   684  	  .driver_info = RSVD(1) },
eb2addd4044b4b Michal Malý                  2013-09-28   685  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E1750, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   686  	  .driver_info = RSVD(2) },
1f3f687722fd9b Bjørn Mork                   2013-02-13   687  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x1441, USB_CLASS_COMM, 0x02, 0xff) },
1f3f687722fd9b Bjørn Mork                   2013-02-13   688  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x1442, USB_CLASS_COMM, 0x02, 0xff) },
0d905fd5ece4ab Dan Williams                 2011-09-13   689  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4505, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   690  	  .driver_info = RSVD(1) | RSVD(2) },
0d905fd5ece4ab Dan Williams                 2011-09-13   691  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K3765, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   692  	  .driver_info = RSVD(1) | RSVD(2) },
b8a24e6281d372 Bjørn Mork                   2013-06-06   693  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0x14ac, 0xff, 0xff, 0xff),	/* Huawei E1820 */
c3a65808f04a84 Johan Hovold                 2018-03-07   694  	  .driver_info = RSVD(1) },
0d905fd5ece4ab Dan Williams                 2011-09-13   695  	{ USB_DEVICE_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4605, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07   696  	  .driver_info = RSVD(1) | RSVD(2) },
ee6f827df91071 fangxiaozhi                  2012-08-08   697  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0xff, 0xff) },
ee6f827df91071 fangxiaozhi                  2012-08-08   698  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x01) },
ee6f827df91071 fangxiaozhi                  2012-08-08   699  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x02) },
ee6f827df91071 fangxiaozhi                  2012-08-08   700  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x03) },
ee6f827df91071 fangxiaozhi                  2012-08-08   701  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x04) },
ee6f827df91071 fangxiaozhi                  2012-08-08   702  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x05) },
ee6f827df91071 fangxiaozhi                  2012-08-08   703  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x06) },
ee6f827df91071 fangxiaozhi                  2012-08-08   704  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x0A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   705  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x0B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   706  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x0D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   707  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x0E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   708  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x0F) },
ee6f827df91071 fangxiaozhi                  2012-08-08   709  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x10) },
ee6f827df91071 fangxiaozhi                  2012-08-08   710  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x12) },
ee6f827df91071 fangxiaozhi                  2012-08-08   711  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x13) },
ee6f827df91071 fangxiaozhi                  2012-08-08   712  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x14) },
ee6f827df91071 fangxiaozhi                  2012-08-08   713  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x15) },
ee6f827df91071 fangxiaozhi                  2012-08-08   714  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x17) },
ee6f827df91071 fangxiaozhi                  2012-08-08   715  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x18) },
ee6f827df91071 fangxiaozhi                  2012-08-08   716  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x19) },
ee6f827df91071 fangxiaozhi                  2012-08-08   717  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x1A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   718  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x1B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   719  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x1C) },
ee6f827df91071 fangxiaozhi                  2012-08-08   720  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x31) },
ee6f827df91071 fangxiaozhi                  2012-08-08   721  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x32) },
ee6f827df91071 fangxiaozhi                  2012-08-08   722  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x33) },
ee6f827df91071 fangxiaozhi                  2012-08-08   723  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x34) },
ee6f827df91071 fangxiaozhi                  2012-08-08   724  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x35) },
ee6f827df91071 fangxiaozhi                  2012-08-08   725  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x36) },
ee6f827df91071 fangxiaozhi                  2012-08-08   726  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x3A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   727  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x3B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   728  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x3D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   729  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x3E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   730  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x3F) },
ee6f827df91071 fangxiaozhi                  2012-08-08   731  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x48) },
ee6f827df91071 fangxiaozhi                  2012-08-08   732  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x49) },
ee6f827df91071 fangxiaozhi                  2012-08-08   733  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x4A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   734  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x4B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   735  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x4C) },
ee6f827df91071 fangxiaozhi                  2012-08-08   736  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x61) },
ee6f827df91071 fangxiaozhi                  2012-08-08   737  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x62) },
ee6f827df91071 fangxiaozhi                  2012-08-08   738  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x63) },
ee6f827df91071 fangxiaozhi                  2012-08-08   739  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x64) },
ee6f827df91071 fangxiaozhi                  2012-08-08   740  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x65) },
ee6f827df91071 fangxiaozhi                  2012-08-08   741  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x66) },
ee6f827df91071 fangxiaozhi                  2012-08-08   742  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x6A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   743  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x6B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   744  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x6D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   745  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x6E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   746  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   747) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   748) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   749) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   750) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x75) },
ee6f827df91071 fangxiaozhi                  2012-08-08   751  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x78) },
ee6f827df91071 fangxiaozhi                  2012-08-08   752  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x79) },
ee6f827df91071 fangxiaozhi                  2012-08-08   753  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x7A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   754  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x7B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   755  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x01, 0x7C) },
ee6f827df91071 fangxiaozhi                  2012-08-08   756  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x01) },
ee6f827df91071 fangxiaozhi                  2012-08-08   757  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x02) },
ee6f827df91071 fangxiaozhi                  2012-08-08   758  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x03) },
ee6f827df91071 fangxiaozhi                  2012-08-08   759  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x04) },
ee6f827df91071 fangxiaozhi                  2012-08-08   760  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x05) },
ee6f827df91071 fangxiaozhi                  2012-08-08   761  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x06) },
ee6f827df91071 fangxiaozhi                  2012-08-08   762  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x0A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   763  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x0B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   764  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x0D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   765  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x0E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   766  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x0F) },
ee6f827df91071 fangxiaozhi                  2012-08-08   767  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x10) },
ee6f827df91071 fangxiaozhi                  2012-08-08   768  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x12) },
ee6f827df91071 fangxiaozhi                  2012-08-08   769  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x13) },
ee6f827df91071 fangxiaozhi                  2012-08-08   770  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x14) },
ee6f827df91071 fangxiaozhi                  2012-08-08   771  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x15) },
ee6f827df91071 fangxiaozhi                  2012-08-08   772  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x17) },
ee6f827df91071 fangxiaozhi                  2012-08-08   773  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x18) },
ee6f827df91071 fangxiaozhi                  2012-08-08   774  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x19) },
ee6f827df91071 fangxiaozhi                  2012-08-08   775  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x1A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   776  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x1B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   777  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x1C) },
ee6f827df91071 fangxiaozhi                  2012-08-08   778  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x31) },
ee6f827df91071 fangxiaozhi                  2012-08-08   779  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x32) },
ee6f827df91071 fangxiaozhi                  2012-08-08   780  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x33) },
ee6f827df91071 fangxiaozhi                  2012-08-08   781  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x34) },
ee6f827df91071 fangxiaozhi                  2012-08-08   782  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x35) },
ee6f827df91071 fangxiaozhi                  2012-08-08   783  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x36) },
ee6f827df91071 fangxiaozhi                  2012-08-08   784  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x3A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   785  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x3B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   786  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x3D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   787  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x3E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   788  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x3F) },
ee6f827df91071 fangxiaozhi                  2012-08-08   789  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x48) },
ee6f827df91071 fangxiaozhi                  2012-08-08   790  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x49) },
ee6f827df91071 fangxiaozhi                  2012-08-08   791  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x4A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   792  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x4B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   793  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x4C) },
ee6f827df91071 fangxiaozhi                  2012-08-08   794  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x61) },
ee6f827df91071 fangxiaozhi                  2012-08-08   795  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x62) },
ee6f827df91071 fangxiaozhi                  2012-08-08   796  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x63) },
ee6f827df91071 fangxiaozhi                  2012-08-08   797  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x64) },
ee6f827df91071 fangxiaozhi                  2012-08-08   798  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x65) },
ee6f827df91071 fangxiaozhi                  2012-08-08   799  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x66) },
ee6f827df91071 fangxiaozhi                  2012-08-08   800  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x6A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   801  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x6B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   802  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x6D) },
ee6f827df91071 fangxiaozhi                  2012-08-08   803  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x6E) },
ee6f827df91071 fangxiaozhi                  2012-08-08   804  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   805) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   806) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   807) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   808) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x75) },
ee6f827df91071 fangxiaozhi                  2012-08-08   809  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x78) },
ee6f827df91071 fangxiaozhi                  2012-08-08   810  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x79) },
ee6f827df91071 fangxiaozhi                  2012-08-08   811  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x7A) },
ee6f827df91071 fangxiaozhi                  2012-08-08   812  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x7B) },
ee6f827df91071 fangxiaozhi                  2012-08-08   813  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x02, 0x7C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   814) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x01) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   815) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x02) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   816) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x03) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   817) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x04) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   818) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x05) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   819) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x06) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   820) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x0A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   821) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x0B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   822) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x0D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   823) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x0E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   824) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x0F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   825) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x10) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   826) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x12) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   827) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x13) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   828) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x14) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   829) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x15) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   830) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x17) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   831) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x18) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   832) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x19) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   833) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x1A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   834) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x1B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   835) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x1C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   836) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x31) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   837) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x32) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   838) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x33) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   839) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x34) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   840) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x35) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   841) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x36) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   842) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x3A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   843) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x3B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   844) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x3D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   845) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x3E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   846) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x3F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   847) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x48) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   848) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x49) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   849) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x4A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   850) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x4B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   851) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x4C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   852) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x61) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   853) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x62) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   854) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x63) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   855) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x64) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   856) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x65) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   857) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x66) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   858) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x6A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   859) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x6B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   860) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x6D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   861) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x6E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   862) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   863) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   864) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   865) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   866) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x75) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   867) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x78) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   868) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x79) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   869) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x7A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   870) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x7B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   871) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x03, 0x7C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   872) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x01) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   873) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x02) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   874) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x03) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   875) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x04) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   876) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x05) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   877) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x06) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   878) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x0A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   879) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x0B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   880) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x0D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   881) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x0E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   882) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x0F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   883) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x10) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   884) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x12) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   885) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x13) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   886) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x14) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   887) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x15) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   888) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x17) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   889) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x18) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   890) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x19) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   891) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x1A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   892) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x1B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   893) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x1C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   894) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x31) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   895) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x32) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   896) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x33) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   897) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x34) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   898) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x35) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   899) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x36) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   900) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x3A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   901) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x3B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   902) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x3D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   903) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x3E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   904) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x3F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   905) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x48) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   906) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x49) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   907) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x4A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   908) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x4B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   909) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x4C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   910) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x61) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   911) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x62) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   912) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x63) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   913) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x64) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   914) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x65) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   915) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x66) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   916) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x6A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   917) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x6B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   918) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x6D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   919) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x6E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   920) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   921) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   922) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   923) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   924) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x75) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   925) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x78) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   926) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x79) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   927) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x7A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   928) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x7B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   929) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x04, 0x7C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   930) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x01) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   931) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x02) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   932) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x03) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   933) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x04) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   934) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x05) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   935) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x06) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   936) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x0A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   937) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x0B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   938) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x0D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   939) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x0E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   940) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x0F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   941) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x10) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   942) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x12) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   943) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x13) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   944) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x14) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   945) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x15) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   946) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x17) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   947) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x18) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   948) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x19) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   949) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x1A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   950) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x1B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   951) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x1C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   952) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x31) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   953) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x32) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   954) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x33) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   955) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x34) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   956) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x35) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   957) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x36) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   958) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x3A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   959) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x3B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   960) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x3D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   961) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x3E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   962) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x3F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   963) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x48) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   964) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x49) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   965) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x4A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   966) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x4B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   967) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x4C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   968) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x61) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   969) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x62) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   970) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x63) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   971) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x64) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   972) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x65) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   973) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x66) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   974) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x6A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   975) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x6B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   976) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x6D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   977) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x6E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   978) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   979) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   980) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   981) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02   982) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x75) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   983) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x78) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   984) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x79) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   985) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x7A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   986) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x7B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   987) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x05, 0x7C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   988) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x01) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   989) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x02) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   990) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x03) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   991) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x04) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   992) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x05) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   993) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x06) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   994) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x0A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   995) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x0B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   996) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x0D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   997) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x0E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   998) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x0F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11   999) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x10) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1000) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x12) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1001) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x13) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1002) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x14) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1003) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x15) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1004) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x17) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1005) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x18) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1006) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x19) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1007) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x1A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1008) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x1B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1009) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x1C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1010) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x31) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1011) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x32) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1012) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x33) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1013) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x34) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1014) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x35) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1015) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x36) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1016) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x3A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1017) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x3B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1018) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x3D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1019) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x3E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1020) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x3F) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1021) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x48) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1022) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x49) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1023) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x4A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1024) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x4B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1025) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x4C) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1026) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x61) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1027) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x62) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1028) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x63) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1029) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x64) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1030) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x65) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1031) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x66) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1032) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x6A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1033) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x6B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1034) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x6D) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1035) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x6E) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1036) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x6F) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02  1037) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x72) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02  1038) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x73) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02  1039) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x74) },
2bf308d7bc5e8c Fangxiaozhi (Franko          2013-12-02  1040) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x75) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1041) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x78) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1042) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x79) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1043) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7A) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1044) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7B) },
d544db293a44a2 Fangxiaozhi (Franko          2013-10-11  1045) 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7C) },
ee6f827df91071 fangxiaozhi                  2012-08-08  1046  
6caf0be40a7076 Tony Lindgren                2019-08-15  1047  	/* Motorola devices */
6caf0be40a7076 Tony Lindgren                2019-08-15  1048  	{ USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x2a70, 0xff, 0xff, 0xff) },	/* mdm6600 */
6caf0be40a7076 Tony Lindgren                2019-08-15  1049  	{ USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x2e0a, 0xff, 0xff, 0xff) },	/* mdm9600 */
6caf0be40a7076 Tony Lindgren                2019-08-15  1050  	{ USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x4281, 0x0a, 0x00, 0xfc) },	/* mdm ram dl */
6caf0be40a7076 Tony Lindgren                2019-08-15  1051  	{ USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x900e, 0xff, 0xff, 0xff) },	/* mdm qc dl */
ee6f827df91071 fangxiaozhi                  2012-08-08  1052  
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1053  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V640) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1054  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V620) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1055  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V740) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1056  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V720) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1057  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_U730) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1058  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_U740) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1059  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_U870) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1060  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_XU870) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1061  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_X950D) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1062  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EV620) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1063  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_ES720) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1064  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_E725) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1065  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_ES620) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1066  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EU730) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1067  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EU740) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1068  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EU870D) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1069  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC950D) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1070  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC727) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1071  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_OVMC760) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1072  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC780) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1073  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_FULLSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1074  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_FULLSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1075  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_EMBEDDED_FULLSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1076  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_EMBEDDED_FULLSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1077  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_HIGHSPEED) },
9ac2feb22b5b82 Santiago Garcia Mantinan     2012-03-19  1078  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1079  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED3) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1080  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED4) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1081  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED5) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1082  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED6) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1083  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED7) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1084  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC996D) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1085  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MF3470) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1086  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC547) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1087  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_EMBEDDED_HIGHSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1088  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_EMBEDDED_HIGHSPEED) },
c7aa8f44b4d1dc Dirk De Schepper             2010-08-24  1089  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_G2) },
065b07e7a14676 Forest Bond                  2012-06-22  1090  	/* Novatel Ovation MC551 a.k.a. Verizon USB551L */
065b07e7a14676 Forest Bond                  2012-06-22  1091  	{ USB_DEVICE_AND_INTERFACE_INFO(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC551, 0xff, 0xff, 0xff) },
fcb21645f1bd86 Dan Williams                 2012-11-08  1092  	{ USB_DEVICE_AND_INTERFACE_INFO(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_E362, 0xff, 0xff, 0xff) },
8a61ba3a47ac39 Alexej Starschenko           2014-05-07  1093  	{ USB_DEVICE_AND_INTERFACE_INFO(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_E371, 0xff, 0xff, 0xff) },
e07af133c3e271 Aleksander Morgado           2015-11-11  1094  	{ USB_DEVICE_AND_INTERFACE_INFO(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_U620L, 0xff, 0x00, 0x00) },
72ab6414cf1eae Dirk DeSchepper              2008-03-05  1095  
32147be4cc50e5 tang kai                     2008-04-14  1096  	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_H01) },
32147be4cc50e5 tang kai                     2008-04-14  1097  	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_H01A) },
32147be4cc50e5 tang kai                     2008-04-14  1098  	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_H02) },
7595931c986f50 Dennis Jansen                2010-07-09  1099  	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_SKYPEPHONE_S2) },
32147be4cc50e5 tang kai                     2008-04-14  1100  
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1101  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5700_MINICARD) },		/* Dell Wireless 5700 Mobile Broadband CDMA/EVDO Mini-Card == Novatel Expedite EV620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1102  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5500_MINICARD) },		/* Dell Wireless 5500 Mobile Broadband HSDPA Mini-Card == Novatel Expedite EU740 HSDPA/3G */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1103  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5505_MINICARD) },		/* Dell Wireless 5505 Mobile Broadband HSDPA Mini-Card == Novatel Expedite EU740 HSDPA/3G */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1104  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5700_EXPRESSCARD) },		/* Dell Wireless 5700 Mobile Broadband CDMA/EVDO ExpressCard == Novatel Merlin XV620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1105  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5510_EXPRESSCARD) },		/* Dell Wireless 5510 Mobile Broadband HSDPA ExpressCard == Novatel Merlin XU870 HSDPA/3G */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1106  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5700_MINICARD_SPRINT) },	/* Dell Wireless 5700 Mobile Broadband CDMA/EVDO Mini-Card == Novatel Expedite E720 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1107  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5700_MINICARD_TELUS) },	/* Dell Wireless 5700 Mobile Broadband CDMA/EVDO Mini-Card == Novatel Expedite ET620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1108  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5720_MINICARD_VZW) }, 	/* Dell Wireless 5720 == Novatel EV620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1109  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5720_MINICARD_SPRINT) }, 	/* Dell Wireless 5720 == Novatel EV620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1110  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5720_MINICARD_TELUS) }, 	/* Dell Wireless 5720 == Novatel EV620 CDMA/EV-DO */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1111  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5520_MINICARD_CINGULAR) },	/* Dell Wireless HSDPA 5520 == Novatel Expedite EU860D */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1112  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5520_MINICARD_GENERIC_L) },	/* Dell Wireless HSDPA 5520 */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1113  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5520_MINICARD_GENERIC_I) },	/* Dell Wireless 5520 Voda I Mobile Broadband (3G HSDPA) Minicard */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1114  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5730_MINICARD_SPRINT) },	/* Dell Wireless 5730 Mobile Broadband EVDO/HSPA Mini-Card */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1115  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5730_MINICARD_TELUS) },	/* Dell Wireless 5730 Mobile Broadband EVDO/HSPA Mini-Card */
c200b9c9e8ec93 Dirk De Schepper             2009-02-06  1116  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5730_MINICARD_VZW) }, 	/* Dell Wireless 5730 Mobile Broadband EVDO/HSPA Mini-Card */
fcb21645f1bd86 Dan Williams                 2012-11-08  1117  	{ USB_DEVICE_AND_INTERFACE_INFO(DELL_VENDOR_ID, DELL_PRODUCT_5800_MINICARD_VZW, 0xff, 0xff, 0xff) },
fcb21645f1bd86 Dan Williams                 2012-11-08  1118  	{ USB_DEVICE_AND_INTERFACE_INFO(DELL_VENDOR_ID, DELL_PRODUCT_5800_V2_MINICARD_VZW, 0xff, 0xff, 0xff) },
49c6e370dd6400 Dan Williams                 2013-05-06  1119  	{ USB_DEVICE_AND_INTERFACE_INFO(DELL_VENDOR_ID, DELL_PRODUCT_5804_MINICARD_ATT, 0xff, 0xff, 0xff) },
7bab01ecc6c43d Aleksander Morgado           2018-07-24  1120  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5821E),
7bab01ecc6c43d Aleksander Morgado           2018-07-24  1121  	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
957c31ea082e3f Aleksander Morgado           2019-11-07  1122  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5821E_ESIM),
957c31ea082e3f Aleksander Morgado           2019-11-07  1123  	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
6ecb3f0b18b320 Slark Xiao                   2022-02-14  1124  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5829E),
6ecb3f0b18b320 Slark Xiao                   2022-02-14  1125  	  .driver_info = RSVD(0) | RSVD(6) },
6ecb3f0b18b320 Slark Xiao                   2022-02-14  1126  	{ USB_DEVICE(DELL_VENDOR_ID, DELL_PRODUCT_5829E_ESIM),
6ecb3f0b18b320 Slark Xiao                   2022-02-14  1127  	  .driver_info = RSVD(0) | RSVD(6) },
52480e1f1a259c Puliang Lu                   2023-10-16  1128  	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
52480e1f1a259c Puliang Lu                   2023-10-16  1129  	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
7ee69d81b422b0 Jack Wu                      2026-06-04  1130  	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_DW5826E_ESIM, 0xff),
7ee69d81b422b0 Jack Wu                      2026-06-04  1131  	  .driver_info = RSVD(1) }
bb78a825fa9162 Jon K Hellan                 2008-10-03 @1132  	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
46269db99cc1a6 Alexander Gattin             2007-06-20  1133  	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
f8033827d8e92d Hiroshi Miura                2008-08-19  1134  	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },
85fb62a0012782 Daniel Kozák                 2008-03-04  1135  	{ USB_DEVICE(AXESSTEL_VENDOR_ID, AXESSTEL_PRODUCT_MV110H) },
c6206faa4f18bc Leslie Watter                2008-11-12  1136  	{ USB_DEVICE(YISO_VENDOR_ID, YISO_PRODUCT_U893) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1137  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_C100_1, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1138  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_C100_2, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1139  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1004, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1140  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1005, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1141  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1006, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1142  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1007, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1143  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1008, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1144  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1009, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1145  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100A, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1146  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100B, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1147  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100C, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1148  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100D, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1149  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100E, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1150  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_100F, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1151  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1010, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1152  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1011, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  1153  	{ USB_DEVICE_INTERFACE_CLASS(BANDRICH_VENDOR_ID, BANDRICH_PRODUCT_1012, 0xff) },
640c1bce86d1e1 Greg Kroah-Hartman           2008-06-19  1154  	{ USB_DEVICE(KYOCERA_VENDOR_ID, KYOCERA_PRODUCT_KPC650) },
564d61d30effcc Dan Williams                 2008-02-19  1155  	{ USB_DEVICE(KYOCERA_VENDOR_ID, KYOCERA_PRODUCT_KPC680) },
63a901c06e3c2c Johan Hovold                 2014-08-07  1156  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x6000)}, /* ZTE AC8700 */
d061c1caa31d4d Bjørn Mork                   2016-02-12  1157  	{ USB_DEVICE_AND_INTERFACE_INFO(QUALCOMM_VENDOR_ID, 0x6001, 0xff, 0xff, 0xff), /* 4G LTE usb-modem U901 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1158  	  .driver_info = RSVD(3) },
d726fb757722a3 Kevin Lloyd                  2008-02-14  1159  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x6613)}, /* Onda H600/ZTE MF330 */
63b5df963f52cc Enrico Mioso                 2013-07-25  1160  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x0023)}, /* ONYX 3G device */
f8df5c2c3e2df5 Mans Rullgard                2019-02-26  1161  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x9000), /* SIMCom SIM5218 */
f8df5c2c3e2df5 Mans Rullgard                2019-02-26  1162  	  .driver_info = NCTRL(0) | NCTRL(1) | NCTRL(2) | NCTRL(3) | RSVD(4) },
6e9f44eaaef0df Dan Williams                 2017-03-09  1163  	/* Quectel products using Qualcomm vendor ID */
6e9f44eaaef0df Dan Williams                 2017-03-09  1164  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, QUECTEL_PRODUCT_UC15)},
6e9f44eaaef0df Dan Williams                 2017-03-09  1165  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, QUECTEL_PRODUCT_UC20),
c3a65808f04a84 Johan Hovold                 2018-03-07  1166  	  .driver_info = RSVD(4) },
3920bb71303881 SZ Lin (林上智               2017-12-19  1167) 	/* Yuga products use Qualcomm vendor ID */
3920bb71303881 SZ Lin (林上智               2017-12-19  1168) 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, YUGA_PRODUCT_CLM920_NC5),
c3a65808f04a84 Johan Hovold                 2018-03-07  1169  	  .driver_info = RSVD(1) | RSVD(4) },
4205cb01f6e9ef SZ Lin (林上智               2018-04-26  1170) 	/* u-blox products using Qualcomm vendor ID */
4205cb01f6e9ef SZ Lin (林上智               2018-04-26  1171) 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
4205cb01f6e9ef SZ Lin (林上智               2018-04-26  1172) 	  .driver_info = RSVD(1) | RSVD(3) },
d9e37a5c4d80ea Davide Tronchin              2022-11-16  1173  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b),	/* u-blox LARA-R6 00B */
d9e37a5c4d80ea Davide Tronchin              2022-11-16  1174  	  .driver_info = RSVD(4) },
2ec106b96afc19 Davide Tronchin              2022-11-16  1175  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x90fa),
94b619a0765580 Marco De Marco               2021-07-05  1176  	  .driver_info = RSVD(3) },
c1547f12df8b8e Davide Tronchin              2022-11-16  1177  	/* u-blox products */
ffa5f7a3bf28c1 Davide Tronchin              2023-06-22  1178  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1311) },	/* u-blox LARA-R6 01B */
ffa5f7a3bf28c1 Davide Tronchin              2023-06-22  1179  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1312),		/* u-blox LARA-R6 01B (RMNET) */
ffa5f7a3bf28c1 Davide Tronchin              2023-06-22  1180  	  .driver_info = RSVD(4) },
ffa5f7a3bf28c1 Davide Tronchin              2023-06-22  1181  	{ USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1313, 0xff) },	/* u-blox LARA-R6 01B (ECM) */
c1547f12df8b8e Davide Tronchin              2022-11-16  1182  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1341) },	/* u-blox LARA-L6 */
c1547f12df8b8e Davide Tronchin              2022-11-16  1183  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1342),		/* u-blox LARA-L6 (RMNET) */
c1547f12df8b8e Davide Tronchin              2022-11-16  1184  	  .driver_info = RSVD(4) },
c1547f12df8b8e Davide Tronchin              2022-11-16  1185  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1343),		/* u-blox LARA-L6 (ECM) */
c1547f12df8b8e Davide Tronchin              2022-11-16  1186  	  .driver_info = RSVD(4) },
6e9f44eaaef0df Dan Williams                 2017-03-09  1187  	/* Quectel products using Quectel vendor ID */
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1188  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1189  	  .driver_info = NUMEP2 },
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1190  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0, 0) },
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1191  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC25, 0xff, 0xff, 0xff),
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1192  	  .driver_info = NUMEP2 },
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1193  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC25, 0xff, 0, 0) },
c184accc4a42c7 Tomaz Solc                   2021-10-06  1194  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG91, 0xff, 0xff, 0xff),
c184accc4a42c7 Tomaz Solc                   2021-10-06  1195  	  .driver_info = NUMEP2 },
c184accc4a42c7 Tomaz Solc                   2021-10-06  1196  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG91, 0xff, 0, 0) },
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1197  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0xff, 0xff),
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1198  	  .driver_info = NUMEP2 },
2bb70f0a4b2383 Bjørn Mork                   2020-08-29  1199  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0, 0) },
f8f67eff6847f9 Carl Yin(殷张成              2022-09-02  1200) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, 0x0203, 0xff), /* BG95-M3 */
f8f67eff6847f9 Carl Yin(殷张成              2022-09-02  1201) 	  .driver_info = ZLP },
c98fff7332dbd6 Bjørn Mork                   2020-12-01  1202  	{ USB_DEVICE(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_BG96),
c98fff7332dbd6 Bjørn Mork                   2020-12-01  1203  	  .driver_info = RSVD(4) },
36cae568404a29 Kristian Evensen             2018-09-13  1204  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EP06, 0xff, 0xff, 0xff),
35aecc02b5b621 Johan Hovold                 2018-09-13  1205  	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
36cae568404a29 Kristian Evensen             2018-09-13  1206  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EP06, 0xff, 0, 0) },
71dfd381a7c051 Duke Xin(辛安文              2023-01-15  1207) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05CN, 0xff),
71dfd381a7c051 Duke Xin(辛安文              2023-01-15  1208) 	  .driver_info = RSVD(6) | ZLP },
1541dd0097c0f8 Duke Xin(辛安文              2023-01-15  1209) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05CN_SG, 0xff),
1541dd0097c0f8 Duke Xin(辛安文              2023-01-15  1210) 	  .driver_info = RSVD(6) | ZLP },
33b29dbb39bcbd Yonglin Tan                  2022-06-21  1211  	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0xff),
33b29dbb39bcbd Yonglin Tan                  2022-06-21  1212  	  .driver_info = RSVD(6) | ZLP },
873854c02364eb Martin Kohn                  2023-07-27  1213  	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05GV2, 0xff),
873854c02364eb Martin Kohn                  2023-07-27  1214  	  .driver_info = RSVD(4) | ZLP },
bb78654b0b4631 Duke Xin(辛安文              2022-12-27  1215) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS, 0xff),
bb78654b0b4631 Duke Xin(辛安文              2022-12-27  1216) 	  .driver_info = RSVD(6) | ZLP },
6c331f32e32ac7 Duke Xin(辛安文              2022-12-27  1217) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR, 0xff),
6c331f32e32ac7 Duke Xin(辛安文              2022-12-27  1218) 	  .driver_info = RSVD(6) | ZLP },
b72d13977689f0 Duke Xin(辛安文              2022-12-27  1219) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_RS, 0xff),
b72d13977689f0 Duke Xin(辛安文              2022-12-27  1220) 	  .driver_info = RSVD(6) | ZLP },
f0052d7a1edb3d Duke Xin                     2022-11-19  1221  	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_SG, 0xff),
f0052d7a1edb3d Duke Xin                     2022-11-19  1222  	  .driver_info = RSVD(6) | ZLP },
f766f3abe6dbc9 Yonglin Tan                  2022-07-19  1223  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0x00, 0x40) },
f766f3abe6dbc9 Yonglin Tan                  2022-07-19  1224  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x30) },
f766f3abe6dbc9 Yonglin Tan                  2022-07-19  1225  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x40) },
4f7cab49cecee1 Jerry Meng                   2023-06-29  1226  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x30) },
4f7cab49cecee1 Jerry Meng                   2023-06-29  1227  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0x00, 0x40) },
4f7cab49cecee1 Jerry Meng                   2023-06-29  1228  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1229  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0xff, 0x30) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1230  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0x00, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1231  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0xff, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1232  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0xff, 0x30) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1233  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0x00, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1234  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0xff, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1235  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0xff, 0x30) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1236  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0x00, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1237  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0xff, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1238  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0xff, 0x30) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1239  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0x00, 0x40) },
c840244aba7ad2 Jerry Meng                   2024-04-15  1240  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0xff, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1241  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x30) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1242  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0x00, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1243  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1244  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x30) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1245  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0x00, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1246  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1247  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x30) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1248  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0x00, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1249  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1250  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x30) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1251  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0x00, 0x40) },
f1832e2b5e498e Jerry Meng                   2023-05-31  1252  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x40) },
d1252f0237238b Kristian Evensen             2019-03-02  1253  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0xff, 0xff),
d1252f0237238b Kristian Evensen             2019-03-02  1254  	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
d1252f0237238b Kristian Evensen             2019-03-02  1255  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
d6c1ddd938d84a Bjørn Mork                   2020-12-30  1256  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, 0x0620, 0xff, 0xff, 0x30) },	/* EM160R-GL */
d6c1ddd938d84a Bjørn Mork                   2020-12-30  1257  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, 0x0620, 0xff, 0, 0) },
33b7af2f459df4 Carl Yin(殷张成              2022-05-19  1258) 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, 0x0700, 0xff), /* BG95 */
33b7af2f459df4 Carl Yin(殷张成              2022-05-19  1259) 	  .driver_info = RSVD(3) | ZLP },
accf227de4d211 Kristian Evensen             2020-01-13  1260  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
06f22cd6635bda Reinhard Speyerer            2023-12-12  1261  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0x40) },
accf227de4d211 Kristian Evensen             2020-01-13  1262  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
f3eaabbfd093c9 Reinhard Speyerer            2020-01-14  1263  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
f3eaabbfd093c9 Reinhard Speyerer            2020-01-14  1264  	  .driver_info = ZLP },
d640c4cb8f2f93 jerry meng                   2022-09-05  1265  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM520N, 0xff, 0xff, 0x30) },
d640c4cb8f2f93 jerry meng                   2022-09-05  1266  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM520N, 0xff, 0, 0x40) },
d640c4cb8f2f93 jerry meng                   2022-09-05  1267  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM520N, 0xff, 0, 0) },
7708a3858e69db Bjørn Mork                   2023-03-28  1268  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, 0x0900, 0xff, 0, 0), /* RM500U-CN */
7708a3858e69db Bjørn Mork                   2023-03-28  1269  	  .driver_info = ZLP },
857ea9005806e2 Mohsen Tahmasebi             2023-07-10  1270  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200A, 0xff, 0, 0) },
d9bbb15881046b Ali Mirghasemi               2022-12-28  1271  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200U, 0xff, 0, 0) },
2263eb7370060b Yu-Tung Chang                2021-09-30  1272  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200S_CN, 0xff, 0, 0) },
a46b973bced1ba Ziyi Cao                     2020-10-20  1273  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200T, 0xff, 0, 0) },
6d79d9434c69bb Alper Ak                     2023-08-08  1274  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG912Y, 0xff, 0, 0) },
540eff5d7faf0c Benjamin B. Frost            2024-09-11  1275  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG916Q, 0xff, 0x00, 0x00) },
15b694e96c3180 Macpaul Lin                  2022-06-23  1276  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
3b05949ba39f30 Benoît Monin                 2024-10-24  1277  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0xff, 0x30) },
3b05949ba39f30 Benoît Monin                 2024-10-24  1278  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0, 0) },
89205c60c0fc96 Reinhard Speyerer            2025-10-22  1279  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x30) },
89205c60c0fc96 Reinhard Speyerer            2025-10-22  1280  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0, 0) },
89205c60c0fc96 Reinhard Speyerer            2025-10-22  1281  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x40) },
accf227de4d211 Kristian Evensen             2020-01-13  1282  
34f972d6156fe9 Bjørn Mork                   2014-04-25  1283  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1284  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1285  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6003),
c3a65808f04a84 Johan Hovold                 2018-03-07  1286  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1287  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6004) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1288  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6005) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1289  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CGU_628A) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1290  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHE_628S),
c3a65808f04a84 Johan Hovold                 2018-03-07  1291  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1292  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_301),
c3a65808f04a84 Johan Hovold                 2018-03-07  1293  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1294  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_628),
c3a65808f04a84 Johan Hovold                 2018-03-07  1295  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1296  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_628S) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1297  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CDU_680) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1298  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CDU_685A) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1299  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_720S),
c3a65808f04a84 Johan Hovold                 2018-03-07  1300  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1301  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7002),
c3a65808f04a84 Johan Hovold                 2018-03-07  1302  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1303  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_629K),
c3a65808f04a84 Johan Hovold                 2018-03-07  1304  	  .driver_info = RSVD(4) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1305  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7004),
c3a65808f04a84 Johan Hovold                 2018-03-07  1306  	  .driver_info = RSVD(3) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1307  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7005) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1308  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CGU_629),
c3a65808f04a84 Johan Hovold                 2018-03-07  1309  	  .driver_info = RSVD(5) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1310  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_629S),
c3a65808f04a84 Johan Hovold                 2018-03-07  1311  	  .driver_info = RSVD(4) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1312  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CHU_720I),
c3a65808f04a84 Johan Hovold                 2018-03-07  1313  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1314  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7212),
c3a65808f04a84 Johan Hovold                 2018-03-07  1315  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1316  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7213),
c3a65808f04a84 Johan Hovold                 2018-03-07  1317  	  .driver_info = RSVD(0) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1318  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7251),
c3a65808f04a84 Johan Hovold                 2018-03-07  1319  	  .driver_info = RSVD(1) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1320  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7252),
c3a65808f04a84 Johan Hovold                 2018-03-07  1321  	  .driver_info = RSVD(1) },
34f972d6156fe9 Bjørn Mork                   2014-04-25  1322  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_7253),
c3a65808f04a84 Johan Hovold                 2018-03-07  1323  	  .driver_info = RSVD(1) },
ee53b0ca0153b4 Greg Kroah-Hartman           2008-05-15  1324  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UC864E) },
ce60c48871d2b3 Manuel Lauss                 2009-09-01  1325  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UC864G) },
7204cf584836c2 Daniele Palmas               2012-02-29  1326  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_CC864_DUAL) },
7204cf584836c2 Daniele Palmas               2012-02-29  1327  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_CC864_SINGLE) },
7204cf584836c2 Daniele Palmas               2012-02-29  1328  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_DE910_DUAL) },
d6de486bc22255 Daniele Palmas               2014-04-02  1329  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UE910_V2) },
399ad9477c523f Daniele Palmas               2020-05-25  1330  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1031, 0xff),	/* Telit LE910C1-EUX */
399ad9477c523f Daniele Palmas               2020-05-25  1331  	 .driver_info = NCTRL(0) | RSVD(3) },
399ad9477c523f Daniele Palmas               2020-05-25  1332  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1033, 0xff),	/* Telit LE910C1-EUX (ECM) */
399ad9477c523f Daniele Palmas               2020-05-25  1333  	 .driver_info = NCTRL(0) },
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1334  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1034, 0xff),	/* Telit LE910C4-WWX (rmnet) */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1335  	 .driver_info = RSVD(2) },
6a7be48e9bd18d Fabio Porcedda               2023-09-05  1336  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1035, 0xff) }, /* Telit LE910C4-WWX (ECM) */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1337  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1036, 0xff) },  /* Telit LE910C4-WWX */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1338  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1037, 0xff),	/* Telit LE910C4-WWX (rmnet) */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1339  	 .driver_info = NCTRL(0) | NCTRL(1) | RSVD(4) },
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1340  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1038, 0xff),	/* Telit LE910C4-WWX (rmnet) */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1341  	 .driver_info = NCTRL(0) | RSVD(3) },
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1342  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x103b, 0xff),	/* Telit LE910C4-WWX */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1343  	 .driver_info = NCTRL(0) | NCTRL(1) },
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1344  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x103c, 0xff),	/* Telit LE910C4-WWX */
a5a261bea9bf84 Fabio Porcedda               2025-08-22  1345  	 .driver_info = NCTRL(0) },
ff4e2494dc17b1 Daniele Palmas               2016-01-12  1346  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG0),
c3a65808f04a84 Johan Hovold                 2018-03-07  1347  	  .driver_info = RSVD(0) | RSVD(1) | NCTRL(2) | RSVD(3) },
5b09eff0c37900 Daniele Palmas               2016-12-01  1348  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG1),
c3a65808f04a84 Johan Hovold                 2018-03-07  1349  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
5b09eff0c37900 Daniele Palmas               2016-12-01  1350  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG2),
c3a65808f04a84 Johan Hovold                 2018-03-07  1351  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
ff4e2494dc17b1 Daniele Palmas               2016-01-12  1352  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG3),
c3a65808f04a84 Johan Hovold                 2018-03-07  1353  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
5deef5551c77e4 Daniele Palmas               2016-02-29  1354  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG5, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1355  	  .driver_info = RSVD(0) | RSVD(1) | NCTRL(2) | RSVD(3) },
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1356  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1050, 0xff),	/* Telit FN980 (rmnet) */
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1357  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1358  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1051, 0xff),	/* Telit FN980 (MBIM) */
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1359  	  .driver_info = NCTRL(0) | RSVD(1) },
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1360  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1052, 0xff),	/* Telit FN980 (RNDIS) */
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1361  	  .driver_info = NCTRL(2) | RSVD(3) },
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1362  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1053, 0xff),	/* Telit FN980 (ECM) */
5eb3f4b87a0e7e Daniele Palmas               2019-09-23  1363  	  .driver_info = NCTRL(0) | RSVD(1) },
924a9213358fb9 Leonid Bloch                 2020-10-04  1364  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1054, 0xff),	/* Telit FT980-KS */
924a9213358fb9 Leonid Bloch                 2020-10-04  1365  	  .driver_info = NCTRL(2) | RSVD(3) },
db0362eeb22992 Daniele Palmas               2020-11-03  1366  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1055, 0xff),	/* Telit FN980 (PCIe) */
db0362eeb22992 Daniele Palmas               2020-11-03  1367  	  .driver_info = NCTRL(0) | RSVD(1) },
5648c073c33d33 Daniele Palmas               2021-08-03  1368  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1056, 0xff),	/* Telit FD980 */
5648c073c33d33 Daniele Palmas               2021-08-03  1369  	  .driver_info = NCTRL(2) | RSVD(3) },
f32c5a0423400e Daniele Palmas               2022-04-06  1370  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1057, 0xff),	/* Telit FN980 */
f32c5a0423400e Daniele Palmas               2022-04-06  1371  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
f32c5a0423400e Daniele Palmas               2022-04-06  1372  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1058, 0xff),	/* Telit FN980 (PCIe) */
f32c5a0423400e Daniele Palmas               2022-04-06  1373  	  .driver_info = NCTRL(0) | RSVD(1) },
7bb057134d609b Carlo Lobrano                2021-09-03  1374  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1060, 0xff),	/* Telit LN920 (rmnet) */
7bb057134d609b Carlo Lobrano                2021-09-03  1375  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
7bb057134d609b Carlo Lobrano                2021-09-03  1376  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1061, 0xff),	/* Telit LN920 (MBIM) */
7bb057134d609b Carlo Lobrano                2021-09-03  1377  	  .driver_info = NCTRL(0) | RSVD(1) },
7bb057134d609b Carlo Lobrano                2021-09-03  1378  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1062, 0xff),	/* Telit LN920 (RNDIS) */
7bb057134d609b Carlo Lobrano                2021-09-03  1379  	  .driver_info = NCTRL(2) | RSVD(3) },
7bb057134d609b Carlo Lobrano                2021-09-03  1380  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1063, 0xff),	/* Telit LN920 (ECM) */
7bb057134d609b Carlo Lobrano                2021-09-03  1381  	  .driver_info = NCTRL(0) | RSVD(1) },
12606fe73f3364 Fabio Porcedda               2025-02-05  1382  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1070, 0xff),	/* Telit FN990A (rmnet) */
2b503c8598d1b2 Daniele Palmas               2021-12-10  1383  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
12606fe73f3364 Fabio Porcedda               2025-02-05  1384  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1071, 0xff),	/* Telit FN990A (MBIM) */
2b503c8598d1b2 Daniele Palmas               2021-12-10  1385  	  .driver_info = NCTRL(0) | RSVD(1) },
12606fe73f3364 Fabio Porcedda               2025-02-05  1386  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1072, 0xff),	/* Telit FN990A (RNDIS) */
2b503c8598d1b2 Daniele Palmas               2021-12-10  1387  	  .driver_info = NCTRL(2) | RSVD(3) },
12606fe73f3364 Fabio Porcedda               2025-02-05  1388  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),	/* Telit FN990A (ECM) */
2b503c8598d1b2 Daniele Palmas               2021-12-10  1389  	  .driver_info = NCTRL(0) | RSVD(1) },
f8cc59ecc22841 Fabio Porcedda               2026-04-02  1390  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1074, 0xff),	/* Telit FN990A (MBIM) */
f8cc59ecc22841 Fabio Porcedda               2026-04-02  1391  	  .driver_info = NCTRL(5) | RSVD(6) | RSVD(7) },
12606fe73f3364 Fabio Porcedda               2025-02-05  1392  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990A (PCIe) */
f32c5a0423400e Daniele Palmas               2022-04-06  1393  	  .driver_info = RSVD(0) },
cba70aff623b10 Fabio Porcedda               2025-08-06  1394  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1077, 0xff),	/* Telit FN990A (rmnet + audio) */
cba70aff623b10 Fabio Porcedda               2025-08-06  1395  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
cba70aff623b10 Fabio Porcedda               2025-08-06  1396  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1078, 0xff),	/* Telit FN990A (MBIM + audio) */
cba70aff623b10 Fabio Porcedda               2025-08-06  1397  	  .driver_info = NCTRL(0) | RSVD(1) },
cba70aff623b10 Fabio Porcedda               2025-08-06  1398  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1079, 0xff),	/* Telit FN990A (RNDIS + audio) */
cba70aff623b10 Fabio Porcedda               2025-08-06  1399  	  .driver_info = NCTRL(2) | RSVD(3) },
6232f0d8e100a2 Fabio Porcedda               2025-03-04  1400  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1080, 0xff),	/* Telit FE990A (rmnet) */
773e8e7d07b753 Enrico Sau                   2023-03-14  1401  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
6232f0d8e100a2 Fabio Porcedda               2025-03-04  1402  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1081, 0xff),	/* Telit FE990A (MBIM) */
773e8e7d07b753 Enrico Sau                   2023-03-14  1403  	  .driver_info = NCTRL(0) | RSVD(1) },
6232f0d8e100a2 Fabio Porcedda               2025-03-04  1404  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1082, 0xff),	/* Telit FE990A (RNDIS) */
773e8e7d07b753 Enrico Sau                   2023-03-14  1405  	  .driver_info = NCTRL(2) | RSVD(3) },
6232f0d8e100a2 Fabio Porcedda               2025-03-04  1406  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1083, 0xff),	/* Telit FE990A (ECM) */
773e8e7d07b753 Enrico Sau                   2023-03-14  1407  	  .driver_info = NCTRL(0) | RSVD(1) },
582ee2f9d268d3 Daniele Palmas               2024-04-18  1408  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a0, 0xff),	/* Telit FN20C04 (rmnet) */
582ee2f9d268d3 Daniele Palmas               2024-04-18  1409  	  .driver_info = RSVD(0) | NCTRL(3) },
509f403f3ccec1 Fabio Porcedda               2026-01-23  1410  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a1, 0xff),	/* Telit FN20C04 (RNDIS) */
509f403f3ccec1 Fabio Porcedda               2026-01-23  1411  	  .driver_info = NCTRL(4) },
6d951576ee1643 Daniele Palmas               2024-10-03  1412  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a2, 0xff),	/* Telit FN920C04 (MBIM) */
6d951576ee1643 Daniele Palmas               2024-10-03  1413  	  .driver_info = NCTRL(4) },
622865c73ae30f LI Qingwu                    2025-10-23  1414  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a3, 0xff),	/* Telit FN920C04 (ECM) */
622865c73ae30f LI Qingwu                    2025-10-23  1415  	  .driver_info = NCTRL(4) },
582ee2f9d268d3 Daniele Palmas               2024-04-18  1416  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a4, 0xff),	/* Telit FN20C04 (rmnet) */
582ee2f9d268d3 Daniele Palmas               2024-04-18  1417  	  .driver_info = RSVD(0) | NCTRL(3) },
509f403f3ccec1 Fabio Porcedda               2026-01-23  1418  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a6, 0xff),	/* Telit FN920C04 (RNDIS) */
509f403f3ccec1 Fabio Porcedda               2026-01-23  1419  	  .driver_info = NCTRL(4) },
6d951576ee1643 Daniele Palmas               2024-10-03  1420  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a7, 0xff),	/* Telit FN920C04 (MBIM) */
6d951576ee1643 Daniele Palmas               2024-10-03  1421  	  .driver_info = NCTRL(4) },
622865c73ae30f LI Qingwu                    2025-10-23  1422  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a8, 0xff),	/* Telit FN920C04 (ECM) */
622865c73ae30f LI Qingwu                    2025-10-23  1423  	  .driver_info = NCTRL(4) },
582ee2f9d268d3 Daniele Palmas               2024-04-18  1424  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a9, 0xff),	/* Telit FN20C04 (rmnet) */
582ee2f9d268d3 Daniele Palmas               2024-04-18  1425  	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
6d951576ee1643 Daniele Palmas               2024-10-03  1426  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10aa, 0xff),	/* Telit FN920C04 (MBIM) */
6d951576ee1643 Daniele Palmas               2024-10-03  1427  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
509f403f3ccec1 Fabio Porcedda               2026-01-23  1428  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10ab, 0xff),	/* Telit FN920C04 (RNDIS) */
509f403f3ccec1 Fabio Porcedda               2026-01-23  1429  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1430  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
4981bb50392b75 Fabio Porcedda               2025-03-04  1431  	  .driver_info = NCTRL(5) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1432  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1433  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x60) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1434  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b1, 0xff, 0xff, 0x30),	/* Telit FE990B (MBIM) */
4981bb50392b75 Fabio Porcedda               2025-03-04  1435  	  .driver_info = NCTRL(6) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1436  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b1, 0xff, 0xff, 0x40) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1437  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b1, 0xff, 0xff, 0x60) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1438  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b2, 0xff, 0xff, 0x30),	/* Telit FE990B (RNDIS) */
4981bb50392b75 Fabio Porcedda               2025-03-04  1439  	  .driver_info = NCTRL(6) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1440  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b2, 0xff, 0xff, 0x40) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1441  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b2, 0xff, 0xff, 0x60) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1442  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b3, 0xff, 0xff, 0x30),	/* Telit FE990B (ECM) */
4981bb50392b75 Fabio Porcedda               2025-03-04  1443  	  .driver_info = NCTRL(6) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1444  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b3, 0xff, 0xff, 0x40) },
4981bb50392b75 Fabio Porcedda               2025-03-04  1445  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b3, 0xff, 0xff, 0x60) },
8366e64a445448 Daniele Palmas               2024-12-09  1446  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c0, 0xff),	/* Telit FE910C04 (rmnet) */
8366e64a445448 Daniele Palmas               2024-12-09  1447  	  .driver_info = RSVD(0) | NCTRL(3) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1448  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c1, 0xff),	/* Telit FE910C04 (RNDIS) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1449  	  .driver_info = NCTRL(4) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1450  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c2, 0xff),	/* Telit FE910C04 (MBIM) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1451  	  .driver_info = NCTRL(4) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1452  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c3, 0xff),	/* Telit FE910C04 (ECM) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1453  	  .driver_info = NCTRL(4) },
8366e64a445448 Daniele Palmas               2024-12-09  1454  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c4, 0xff),	/* Telit FE910C04 (rmnet) */
8366e64a445448 Daniele Palmas               2024-12-09  1455  	  .driver_info = RSVD(0) | NCTRL(3) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1456  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c5, 0xff),	/* Telit FE910C04 (RNDIS) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1457  	  .driver_info = NCTRL(4) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1458  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c6, 0xff),	/* Telit FE910C04 (MBIM) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1459  	  .driver_info = NCTRL(4) },
072f2c49572547 Fabio Porcedda               2025-11-26  1460  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
072f2c49572547 Fabio Porcedda               2025-11-26  1461  	  .driver_info = NCTRL(4) },
072f2c49572547 Fabio Porcedda               2025-11-26  1462  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
8366e64a445448 Daniele Palmas               2024-12-09  1463  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c8, 0xff),	/* Telit FE910C04 (rmnet) */
8366e64a445448 Daniele Palmas               2024-12-09  1464  	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1465  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c9, 0xff),	/* Telit FE910C04 (MBIM) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1466  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
c908039a29aa70 Fabio Porcedda               2025-11-26  1467  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10cb, 0xff),	/* Telit FE910C04 (RNDIS) */
c908039a29aa70 Fabio Porcedda               2025-11-26  1468  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1469  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x30),	/* Telit FN990B (rmnet) */
c979fb5ece2dc1 Fabio Porcedda               2025-02-05  1470  	  .driver_info = NCTRL(5) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1471  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x40) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1472  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x60) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1473  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x30),	/* Telit FN990B (MBIM) */
c979fb5ece2dc1 Fabio Porcedda               2025-02-05  1474  	  .driver_info = NCTRL(6) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1475  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x40) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1476  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x60) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1477  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d2, 0xff, 0xff, 0x30),	/* Telit FN990B (RNDIS) */
c979fb5ece2dc1 Fabio Porcedda               2025-02-05  1478  	  .driver_info = NCTRL(6) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1479  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d2, 0xff, 0xff, 0x40) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1480  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d2, 0xff, 0xff, 0x60) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1481  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d3, 0xff, 0xff, 0x30),	/* Telit FN990B (ECM) */
c979fb5ece2dc1 Fabio Porcedda               2025-02-05  1482  	  .driver_info = NCTRL(6) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1483  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d3, 0xff, 0xff, 0x40) },
9a665fe3d967fe Johan Hovold                 2025-03-06  1484  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d3, 0xff, 0xff, 0x60) },
40dd46048c155b Daniele Palmas               2017-05-03  1485  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
c3a65808f04a84 Johan Hovold                 2018-03-07  1486  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
08933099e6404f Daniele Palmas               2017-12-14  1487  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
c3a65808f04a84 Johan Hovold                 2018-03-07  1488  	  .driver_info = NCTRL(0) | RSVD(3) },
6431866b6707d2 Daniele Palmas               2019-02-20  1489  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1102, 0xff),	/* Telit ME910 (ECM) */
6431866b6707d2 Daniele Palmas               2019-02-20  1490  	  .driver_info = NCTRL(0) },
0d3010fa442429 Daniele Palmas               2019-12-13  1491  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110a, 0xff),	/* Telit ME910G1 */
0d3010fa442429 Daniele Palmas               2019-12-13  1492  	  .driver_info = NCTRL(0) | RSVD(3) },
8e852a7953be2a Daniele Palmas               2020-03-04  1493  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110b, 0xff),	/* Telit ME910G1 (ECM) */
8e852a7953be2a Daniele Palmas               2020-03-04  1494  	  .driver_info = NCTRL(0) },
2d0eb862dd477c Daniele Palmas               2014-10-14  1495  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910),
c3a65808f04a84 Johan Hovold                 2018-03-07  1496  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
489979b4aab490 Daniele Palmas               2020-10-31  1497  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1203, 0xff),	/* Telit LE910Cx (RNDIS) */
489979b4aab490 Daniele Palmas               2020-10-31  1498  	  .driver_info = NCTRL(2) | RSVD(3) },
f5a8a07edafed8 Daniele Palmas               2021-10-04  1499  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1204, 0xff),	/* Telit LE910Cx (MBIM) */
f5a8a07edafed8 Daniele Palmas               2021-10-04  1500  	  .driver_info = NCTRL(0) | RSVD(1) },
3c0415fa08548e Daniele Palmas               2016-06-06  1501  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
c3a65808f04a84 Johan Hovold                 2018-03-07  1502  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
03eb466f276cee Daniele Palmas               2013-01-28  1503  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920),
c3a65808f04a84 Johan Hovold                 2018-03-07  1504  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(5) },
01d7956b58e644 Daniele Palmas               2016-08-02  1505  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1207) },
01d7956b58e644 Daniele Palmas               2016-08-02  1506  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1208),
c3a65808f04a84 Johan Hovold                 2018-03-07  1507  	  .driver_info = NCTRL(0) | RSVD(1) },
01d7956b58e644 Daniele Palmas               2016-08-02  1508  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1211),
c3a65808f04a84 Johan Hovold                 2018-03-07  1509  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
01d7956b58e644 Daniele Palmas               2016-08-02  1510  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1212),
c3a65808f04a84 Johan Hovold                 2018-03-07  1511  	  .driver_info = NCTRL(0) | RSVD(1) },
01d7956b58e644 Daniele Palmas               2016-08-02  1512  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1213, 0xff) },
01d7956b58e644 Daniele Palmas               2016-08-02  1513  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE920A4_1214),
c3a65808f04a84 Johan Hovold                 2018-03-07  1514  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
489979b4aab490 Daniele Palmas               2020-10-31  1515  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1230, 0xff),	/* Telit LE910Cx (rmnet) */
489979b4aab490 Daniele Palmas               2020-10-31  1516  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
489979b4aab490 Daniele Palmas               2020-10-31  1517  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE910Cx (RNDIS) */
489979b4aab490 Daniele Palmas               2020-10-31  1518  	  .driver_info = NCTRL(2) | RSVD(3) },
342fc0c3b34552 Carlo Lobrano                2022-06-14  1519  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x00, 0x00) },	/* Telit LE910Cx (rmnet) */
100201d349edd2 Fabio Porcedda               2026-04-27  1520  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1251, 0xff) },	/* Telit LE910Cx (RNDIS) */
8af4274ab59998 Ulrich Mohr                  2025-12-09  1521  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1252, 0xff) },	/* Telit LE910Cx (MBIM) */
100201d349edd2 Fabio Porcedda               2026-04-27  1522  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1253, 0xff) },	/* Telit LE910Cx (ECM) */
100201d349edd2 Fabio Porcedda               2026-04-27  1523  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1254, 0xff) },	/* Telit LE910Cx */
100201d349edd2 Fabio Porcedda               2026-04-27  1524  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1255, 0xff) },	/* Telit LE910Cx */
f3dfd4072c3ee6 Daniele Palmas               2019-05-15  1525  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
f3dfd4072c3ee6 Daniele Palmas               2019-05-15  1526  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
f3dfd4072c3ee6 Daniele Palmas               2019-05-15  1527  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
f3dfd4072c3ee6 Daniele Palmas               2019-05-15  1528  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
28a86092b1753b Jörgen Storvist              2018-12-13  1529  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1900),				/* Telit LN940 (QMI) */
28a86092b1753b Jörgen Storvist              2018-12-13  1530  	  .driver_info = NCTRL(0) | RSVD(1) },
28a86092b1753b Jörgen Storvist              2018-12-13  1531  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
28a86092b1753b Jörgen Storvist              2018-12-13  1532  	  .driver_info = NCTRL(0) },
9a590ff283421b Daniele Palmas               2024-06-25  1533  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x3000, 0xff),	/* Telit FN912 */
9a590ff283421b Daniele Palmas               2024-06-25  1534  	  .driver_info = RSVD(0) | NCTRL(3) },
9a590ff283421b Daniele Palmas               2024-06-25  1535  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x3001, 0xff),	/* Telit FN912 */
9a590ff283421b Daniele Palmas               2024-06-25  1536  	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
e467714f822b5d Daniele Palmas               2021-04-28  1537  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x7010, 0xff),	/* Telit LE910-S1 (RNDIS) */
e467714f822b5d Daniele Palmas               2021-04-28  1538  	  .driver_info = NCTRL(2) },
e467714f822b5d Daniele Palmas               2021-04-28  1539  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x7011, 0xff),	/* Telit LE910-S1 (ECM) */
e467714f822b5d Daniele Palmas               2021-04-28  1540  	  .driver_info = NCTRL(2) },
cfc4442c642d56 Daniele Palmas               2022-02-18  1541  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701a, 0xff),	/* Telit LE910R1 (RNDIS) */
cfc4442c642d56 Daniele Palmas               2022-02-18  1542  	  .driver_info = NCTRL(2) },
cfc4442c642d56 Daniele Palmas               2022-02-18  1543  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701b, 0xff),	/* Telit LE910R1 (ECM) */
cfc4442c642d56 Daniele Palmas               2022-02-18  1544  	  .driver_info = NCTRL(2) },
4298e400dbdbf2 Daniele Palmas               2024-05-30  1545  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x9000, 0xff),	/* Telit generic core-dump device */
4298e400dbdbf2 Daniele Palmas               2024-05-30  1546  	  .driver_info = NCTRL(0) },
2438c3a19dec5e Daniele Palmas               2019-12-19  1547  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
2438c3a19dec5e Daniele Palmas               2019-12-19  1548  	  .driver_info = NCTRL(0) | ZLP },
e353f3e8872030 Daniele Palmas               2021-11-19  1549  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9200),				/* Telit LE910S1 flashing device */
e353f3e8872030 Daniele Palmas               2021-11-19  1550  	  .driver_info = NCTRL(0) | ZLP },
cfc4442c642d56 Daniele Palmas               2022-02-18  1551  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9201),				/* Telit LE910R1 flashing device */
cfc4442c642d56 Daniele Palmas               2022-02-18  1552  	  .driver_info = NCTRL(0) | ZLP },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1553  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
c58a76cdd7ab5a Dan Williams                 2011-09-13  1554  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1555  	  .driver_info = RSVD(1) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1556  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0003, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1557  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0004, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1558  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0005, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1559  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0006, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1560  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0008, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1561  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0009, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1562  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000a, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1563  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000b, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1564  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000c, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1565  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000d, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1566  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000e, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1567  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x000f, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1568  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0010, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1569  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0011, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1570  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0012, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1571  	  .driver_info = RSVD(1) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1572  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0013, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1573  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF628, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1574  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0016, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1575  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0017, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1576  	  .driver_info = RSVD(3) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1577  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0018, 0xff, 0xff, 0xff) },
3d1a69e726406a Enrico Mioso                 2013-06-29  1578  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0019, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1579  	  .driver_info = RSVD(3) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1580  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0020, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1581  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0021, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1582  	  .driver_info = RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1583  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0022, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1584  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0023, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1585  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0024, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1586  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0025, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1587  	  .driver_info = RSVD(1) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1588  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0028, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1589  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0029, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1590  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0030, 0xff, 0xff, 0xff) },
c3a65808f04a84 Johan Hovold                 2018-03-07  1591  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF626, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1592  	  .driver_info = NCTRL(0) | NCTRL(1) | RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1593  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0032, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1594  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0033, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1595  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0034, 0xff, 0xff, 0xff) },
eb05ce567a81c5 Dan Williams                 2011-09-13  1596  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0037, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1597  	  .driver_info = NCTRL(0) | NCTRL(1) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1598  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0038, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1599  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0039, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1600  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0040, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1601  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0042, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1602  	  .driver_info = RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1603  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0043, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1604  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0044, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1605  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0048, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1606  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0049, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1607  	  .driver_info = RSVD(5) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1608  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0050, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1609  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0051, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1610  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0052, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1611  	  .driver_info = RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1612  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0054, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1613  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0055, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1614  	  .driver_info = RSVD(1) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1615  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0056, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1616  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0057, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1617  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0058, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1618  	  .driver_info = RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1619  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0061, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1620  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0062, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1621  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0063, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1622  	  .driver_info = RSVD(4) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1623  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0064, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1624  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0065, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1625  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0066, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1626  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0067, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1627  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0069, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1628  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0076, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1629  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0077, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1630  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0078, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1631  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0079, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1632  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0082, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1633  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0083, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1634  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0086, 0xff, 0xff, 0xff) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1635  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0087, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1636  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0088, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1637  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0089, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1638  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0090, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1639  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0091, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1640  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0092, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1641  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0093, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1642  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0094, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1643  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0095, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1644  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0096, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1645  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0097, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1646  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0104, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1647  	  .driver_info = RSVD(4) },
ecfa153ef616b9 Mauro Carvalho Chehab        2010-09-12  1648  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0105, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1649  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0106, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1650  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0108, 0xff, 0xff, 0xff) },
c58a76cdd7ab5a Dan Williams                 2011-09-13  1651  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0113, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1652  	  .driver_info = RSVD(5) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1653  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0117, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1654  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0118, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1655  	  .driver_info = RSVD(5) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1656  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0121, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1657  	  .driver_info = RSVD(5) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1658  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0122, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1659  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0123, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1660  	  .driver_info = RSVD(4) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1661  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0124, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1662  	  .driver_info = RSVD(5) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1663  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0125, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1664  	  .driver_info = RSVD(6) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1665  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0126, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1666  	  .driver_info = RSVD(5) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1667  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0128, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1668  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0135, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1669  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0136, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1670  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0137, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1671  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0139, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1672  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0142, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1673  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0143, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1674  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0144, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1675  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0145, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1676  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0148, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1677  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0151, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1678  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0153, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1679  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0155, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1680  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0156, 0xff, 0xff, 0xff) },
160c9425ac52cb Bjørn Mork                   2012-09-19  1681  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0157, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1682  	  .driver_info = RSVD(5) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1683  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0158, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1684  	  .driver_info = RSVD(3) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1685  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0159, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1686  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0161, 0xff, 0xff, 0xff) },
8d87cacda7c8db zhao.ming9@zte.com.cn        2009-12-07  1687  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0162, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1688  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0164, 0xff, 0xff, 0xff) },
1608ea5f4b5d62 Rui li                       2012-01-31  1689  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
5889d3d4209c10 Bjørn Mork                   2012-03-16  1690  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0167, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1691  	  .driver_info = RSVD(4) },
8771127e25d6c2 Lech Perczak                 2023-11-18  1692  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0189, 0xff, 0xff, 0xff),
8771127e25d6c2 Lech Perczak                 2023-11-18  1693  	  .driver_info = RSVD(4) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1694  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0191, 0xff, 0xff, 0xff), /* ZTE EuFi890 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1695  	  .driver_info = RSVD(4) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1696  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0196, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1697  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0197, 0xff, 0xff, 0xff) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1698  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0199, 0xff, 0xff, 0xff), /* ZTE MF820S */
c3a65808f04a84 Johan Hovold                 2018-03-07  1699  	  .driver_info = RSVD(1) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1700  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0200, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1701  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0201, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1702  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0254, 0xff, 0xff, 0xff) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1703  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0257, 0xff, 0xff, 0xff), /* ZTE MF821 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1704  	  .driver_info = RSVD(3) },
2291dff02e5f8c Bjørn Mork                   2013-01-17  1705  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0265, 0xff, 0xff, 0xff), /* ONDA MT8205 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1706  	  .driver_info = RSVD(4) },
fab38246f318ed Bjørn Mork                   2012-12-19  1707  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0284, 0xff, 0xff, 0xff), /* ZTE MF880 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1708  	  .driver_info = RSVD(4) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1709  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0317, 0xff, 0xff, 0xff) },
09110529780890 Bjørn Mork                   2012-07-12  1710  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0326, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1711  	  .driver_info = RSVD(4) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1712  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0330, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1713  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0395, 0xff, 0xff, 0xff) },
73c042df6e1bc5 Teppo Kotilainen             2013-05-03  1714  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0412, 0xff, 0xff, 0xff), /* Telewell TW-LTE 4G */
c3a65808f04a84 Johan Hovold                 2018-03-07  1715  	  .driver_info = RSVD(4) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1716  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0414, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1717  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0417, 0xff, 0xff, 0xff) },
aed2a26283528f Jörgen Storvist              2019-06-19  1718  	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x0601, 0xff) },	/* GosunCn ZTE WeLink ME3630 (RNDIS mode) */
70a7444c550a75 Jörgen Storvist              2018-12-11  1719  	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x0602, 0xff) },	/* GosunCn ZTE WeLink ME3630 (MBIM mode) */
f264ddea0109bf Andrew Bird (Sphere Systems  2012-03-25  1720) 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1721  	  .driver_info = RSVD(4) },
f264ddea0109bf Andrew Bird (Sphere Systems  2012-03-25  1722) 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1723  	  .driver_info = RSVD(4) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1724  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1012, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1725  	  .driver_info = RSVD(4) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1726  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1018, 0xff, 0xff, 0xff) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1727  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1021, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1728  	  .driver_info = RSVD(2) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1729  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1057, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1730  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1058, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1731  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1059, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1732  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1060, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1733  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1061, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1734  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1062, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1735  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1063, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1736  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1064, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1737  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1065, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1738  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1066, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1739  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1067, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1740  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1068, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1741  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1069, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1742  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1070, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1743  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1071, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1744  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1072, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1745  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1073, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1746  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1074, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1747  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1075, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1748  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1076, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1749  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1077, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1750  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1078, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1751  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1079, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1752  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1080, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1753  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1081, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1754  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1082, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1755  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1083, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1756  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1084, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1757  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1085, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1758  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1086, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1759  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1087, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1760  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1088, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1761  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1089, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1762  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1090, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1763  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1091, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1764  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1092, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1765  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1093, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1766  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1094, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1767  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1095, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1768  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1096, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1769  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1097, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1770  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1098, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1771  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1099, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1772  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1100, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1773  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1101, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1774  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1102, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1775  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1103, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1776  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1104, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1777  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1105, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1778  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1106, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1779  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1107, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1780  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1108, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1781  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1109, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1782  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1110, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1783  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1111, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1784  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1112, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1785  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1113, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1786  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1114, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1787  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1115, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1788  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1116, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1789  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1117, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1790  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1118, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1791  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1119, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1792  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1120, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1793  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1121, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1794  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1122, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1795  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1123, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1796  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1124, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1797  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1125, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1798  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1126, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1799  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1127, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1800  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1128, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1801  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1129, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1802  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1130, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1803  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1131, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1804  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1132, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1805  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1133, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1806  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1134, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1807  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1135, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1808  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1136, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1809  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1137, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1810  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1138, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1811  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1139, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1812  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1140, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1813  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1141, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1814  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1142, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1815  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1143, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1816  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1144, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1817  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1145, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1818  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1146, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1819  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1147, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1820  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1148, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1821  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1149, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1822  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1150, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1823  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1151, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1824  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1152, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1825  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1153, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1826  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1154, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1827  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1155, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1828  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1156, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1829  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1157, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1830  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1158, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1831  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1159, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1832  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1160, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1833  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1161, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1834  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1162, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1835  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1163, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1836  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1164, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1837  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1165, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1838  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1166, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1839  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1167, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1840  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1168, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1841  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1169, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1842  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1170, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1843  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1244, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1844  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1245, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1845  	  .driver_info = RSVD(4) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1846  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1246, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1847  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1247, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1848  	  .driver_info = RSVD(4) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1849  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1248, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1850  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1249, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1851  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1250, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1852  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1251, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1853  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1252, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1854  	  .driver_info = RSVD(4) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1855  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1253, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1856  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1254, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1857  	  .driver_info = RSVD(4) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1858  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1255, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1859  	  .driver_info = RSVD(3) | RSVD(4) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1860  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1256, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1861  	  .driver_info = RSVD(4) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1862  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1257, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1863  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1258, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1864  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1259, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1865  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1260, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1866  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1261, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1867  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1262, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1868  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1263, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1869  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1264, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1870  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1265, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1871  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1266, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1872  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1267, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1873  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1268, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1874  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1269, 0xff, 0xff, 0xff) },
3635c7e2d59f78 Raymond Wanyoike             2014-02-09  1875  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1270, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1876  	  .driver_info = RSVD(5) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1877  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1271, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1878  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1272, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1879  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1273, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1880  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1274, 0xff, 0xff, 0xff) },
6420a569504e21 Lech Perczak                 2021-02-07  1881  	{ USB_DEVICE(ZTE_VENDOR_ID, 0x1275),	/* ZTE P685M */
6420a569504e21 Lech Perczak                 2021-02-07  1882  	  .driver_info = RSVD(3) | RSVD(4) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1883  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1276, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1884  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1277, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1885  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1278, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1886  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1279, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1887  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1280, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1888  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1281, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1889  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1282, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1890  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1283, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1891  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1284, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1892  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1285, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1893  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1286, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1894  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1287, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1895  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1288, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1896  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1289, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1897  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1290, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1898  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1291, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1899  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1292, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1900  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1293, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1901  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1294, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1902  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1295, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1903  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1296, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1904  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1297, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1905  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1298, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1906  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1299, 0xff, 0xff, 0xff) },
a71ee85e1d74e8 zhao1980ming                 2010-05-03  1907  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1300, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1908  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1301, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1909  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1302, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1910  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1303, 0xff, 0xff, 0xff) },
31b6a1048b7292 li.rui27@zte.com.cn          2012-11-20  1911  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1333, 0xff, 0xff, 0xff) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1912  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1401, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1913  	  .driver_info = RSVD(2) },
8e16e33c168a6e Bjørn Mork                   2012-07-02  1914  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1402, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1915  	  .driver_info = RSVD(2) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1916  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1424, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1917  	  .driver_info = RSVD(2) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1918  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1425, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1919  	  .driver_info = RSVD(2) },
4b35f1c5294385 Bjørn Mork                   2012-10-18  1920  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1426, 0xff, 0xff, 0xff),  /* ZTE MF91 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1921  	  .driver_info = RSVD(2) },
3d28bd840b2d39 Bernd Wachter                2014-07-02  1922  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff),  /* Telewell TW-LTE 4G v2 */
c3a65808f04a84 Johan Hovold                 2018-03-07  1923  	  .driver_info = RSVD(2) },
70a7444c550a75 Jörgen Storvist              2018-12-11  1924  	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },	/* GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
7e7ae38bf928c5 Yoshiaki Okamoto             2019-07-20  1925  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1481, 0xff, 0x00, 0x00) }, /* ZTE MF871A */
d48384c7ed6c8f Pawel Dembicki               2022-01-11  1926  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1485, 0xff, 0xff, 0xff),  /* ZTE MF286D */
d48384c7ed6c8f Pawel Dembicki               2022-01-11  1927  	  .driver_info = RSVD(5) },
0636fc507a976c Rui li                       2013-10-25  1928  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1929  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1930  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1931  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1545, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1932  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1546, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1933  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1547, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1934  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1565, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1935  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1566, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1936  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1567, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1937  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1589, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1938  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1590, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1939  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1591, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1940  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1592, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1941  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1594, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1942  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1596, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1943  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1598, 0xff, 0xff, 0xff) },
0636fc507a976c Rui li                       2013-10-25  1944  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1600, 0xff, 0xff, 0xff) },
c3a65808f04a84 Johan Hovold                 2018-03-07  1945  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2002, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1946  	  .driver_info = NCTRL(0) | NCTRL(1) | NCTRL(2) | RSVD(4) },
b9e44fe5ecda41 li.rui27@zte.com.cn          2012-02-14  1947  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2003, 0xff, 0xff, 0xff) },
b9e44fe5ecda41 li.rui27@zte.com.cn          2012-02-14  1948  
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1949  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0014, 0xff, 0xff, 0xff) }, /* ZTE CDMA products */
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1950  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0027, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1951  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0059, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1952  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0060, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1953  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0070, 0xff, 0xff, 0xff) },
c420befde6b274 Herton Ronaldo Krzesinski    2009-07-15  1954  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0073, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1955  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0130, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1956  	  .driver_info = RSVD(1) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1957  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0133, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1958  	  .driver_info = RSVD(3) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1959  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0141, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1960  	  .driver_info = RSVD(5) },
b9e44fe5ecda41 li.rui27@zte.com.cn          2012-02-14  1961  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0147, 0xff, 0xff, 0xff) },
b9e44fe5ecda41 li.rui27@zte.com.cn          2012-02-14  1962  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0152, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1963  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0168, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1964  	  .driver_info = RSVD(4) },
b9e44fe5ecda41 li.rui27@zte.com.cn          2012-02-14  1965  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0170, 0xff, 0xff, 0xff) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1966  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0176, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1967  	  .driver_info = RSVD(3) },
1452df6f1b7e39 Bjørn Mork                   2012-10-18  1968  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0178, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  1969  	  .driver_info = RSVD(3) },
f0d09463c59c2d lei liu                      2016-05-03  1970  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff42, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1971  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff43, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1972  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff44, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1973  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff45, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1974  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff46, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1975  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff47, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1976  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff48, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1977  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff49, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1978  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4a, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1979  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4b, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1980  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4c, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1981  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4d, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1982  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4e, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1983  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff4f, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1984  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff50, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1985  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff51, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1986  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff52, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1987  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff53, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1988  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff54, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1989  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff55, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1990  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff56, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1991  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff57, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1992  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff58, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1993  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff59, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1994  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5a, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1995  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5b, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1996  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5c, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1997  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5d, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1998  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5e, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  1999  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff5f, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2000  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff60, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2001  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff61, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2002  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff62, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2003  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff63, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2004  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff64, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2005  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff65, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2006  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff66, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2007  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff67, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2008  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff68, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2009  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff69, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2010  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6a, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2011  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6b, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2012  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6c, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2013  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6d, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2014  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6e, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2015  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff6f, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2016  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff70, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2017  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff71, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2018  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff72, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2019  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff73, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2020  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff74, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2021  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff75, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2022  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff76, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2023  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff77, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2024  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff78, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2025  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff79, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2026  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7a, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2027  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7b, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2028  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7c, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2029  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7d, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2030  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7e, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2031  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff7f, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2032  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff80, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2033  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff81, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2034  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff82, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2035  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff83, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2036  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff84, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2037  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff85, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2038  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff86, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2039  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff87, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2040  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff88, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2041  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff89, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2042  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8a, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2043  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8b, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2044  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8c, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2045  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8d, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2046  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8e, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2047  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff8f, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2048  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff90, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2049  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff91, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2050  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff92, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2051  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff93, 0xff, 0xff, 0xff) },
4d90b819ae4c7e 张君                         2013-12-18  2052  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff94, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2053  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff9f, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2054  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa0, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2055  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa1, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2056  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa2, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2057  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa3, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2058  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa4, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2059  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa5, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2060  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa6, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2061  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa7, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2062  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa8, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2063  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffa9, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2064  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffaa, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2065  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffab, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2066  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffac, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2067  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffae, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2068  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffaf, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2069  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb0, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2070  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb1, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2071  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb2, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2072  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb3, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2073  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb4, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2074  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb5, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2075  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb6, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2076  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb7, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2077  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb8, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2078  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffb9, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2079  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffba, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2080  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffbb, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2081  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffbc, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2082  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffbd, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2083  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffbe, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2084  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffbf, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2085  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc0, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2086  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc1, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2087  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc2, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2088  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc3, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2089  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc4, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2090  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc5, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2091  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc6, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2092  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc7, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2093  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc8, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2094  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffc9, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2095  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffca, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2096  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffcb, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2097  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffcc, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2098  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffcd, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2099  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffce, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2100  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffcf, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2101  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd0, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2102  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd1, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2103  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd2, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2104  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd3, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2105  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd4, 0xff, 0xff, 0xff) },
74d2a91aec97ab Lei Liu                      2016-05-04  2106  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffd5, 0xff, 0xff, 0xff) },
f0d09463c59c2d lei liu                      2016-05-03  2107  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffe9, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2108  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffec, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2109  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xffee, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2110  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfff6, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2111  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfff7, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2112  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfff8, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2113  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfff9, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2114  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfffb, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2115  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xfffc, 0xff, 0xff, 0xff) },
f8c0e057b48980 Johan Hovold                 2014-09-15  2116  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MG880, 0xff, 0xff, 0xff) },
63a901c06e3c2c Johan Hovold                 2014-08-07  2117  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_CDMA_TECH, 0xff, 0xff, 0xff) },
63a901c06e3c2c Johan Hovold                 2014-08-07  2118  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_AC2726, 0xff, 0xff, 0xff) },
63a901c06e3c2c Johan Hovold                 2014-08-07  2119  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_AC8710T, 0xff, 0xff, 0xff) },
46b5a277ed9031 zheng.zhijian@zte.com.cn     2011-11-17  2120  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MC2718, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2121  	 .driver_info = NCTRL(1) | NCTRL(2) | NCTRL(3) | NCTRL(4) },
63a901c06e3c2c Johan Hovold                 2014-08-07  2122  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_AD3812, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2123  	 .driver_info = NCTRL(0) | NCTRL(1) | NCTRL(2) },
63a901c06e3c2c Johan Hovold                 2014-08-07  2124  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MC2716, 0xff, 0xff, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2125  	 .driver_info = NCTRL(1) | NCTRL(2) | NCTRL(3) },
19ab6bc5674a30 Liu.Zhao                     2015-08-24  2126  	{ USB_DEVICE(ZTE_VENDOR_ID, ZTE_PRODUCT_ME3620_L),
c3a65808f04a84 Johan Hovold                 2018-03-07  2127  	 .driver_info = RSVD(3) | RSVD(4) | RSVD(5) },
19ab6bc5674a30 Liu.Zhao                     2015-08-24  2128  	{ USB_DEVICE(ZTE_VENDOR_ID, ZTE_PRODUCT_ME3620_MBIM),
c3a65808f04a84 Johan Hovold                 2018-03-07  2129  	 .driver_info = RSVD(2) | RSVD(3) | RSVD(4) },
19ab6bc5674a30 Liu.Zhao                     2015-08-24  2130  	{ USB_DEVICE(ZTE_VENDOR_ID, ZTE_PRODUCT_ME3620_X),
c3a65808f04a84 Johan Hovold                 2018-03-07  2131  	 .driver_info = RSVD(3) | RSVD(4) | RSVD(5) },
19ab6bc5674a30 Liu.Zhao                     2015-08-24  2132  	{ USB_DEVICE(ZTE_VENDOR_ID, ZTE_PRODUCT_ZM8620_X),
c3a65808f04a84 Johan Hovold                 2018-03-07  2133  	 .driver_info = RSVD(3) | RSVD(4) | RSVD(5) },
ba9edaa468869a Bjørn Mork                   2012-09-11  2134  	{ USB_VENDOR_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff, 0x02, 0x01) },
ba9edaa468869a Bjørn Mork                   2012-09-11  2135  	{ USB_VENDOR_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff, 0x02, 0x05) },
ba9edaa468869a Bjørn Mork                   2012-09-11  2136  	{ USB_VENDOR_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0xff, 0x86, 0x10) },
ba9edaa468869a Bjørn Mork                   2012-09-11  2137  
28fb66821f8848 Jesse Sung                   2009-02-20  2138  	{ USB_DEVICE(BENQ_VENDOR_ID, BENQ_PRODUCT_H10) },
c00deaa542100a Pascal Terjan                2009-04-07  2139  	{ USB_DEVICE(DLINK_VENDOR_ID, DLINK_PRODUCT_DWM_652) },
ff854ce0b17161 Zhang Le                     2009-11-04  2140  	{ USB_DEVICE(ALINK_VENDOR_ID, DLINK_PRODUCT_DWM_652_U5) }, /* Yes, ALINK_VENDOR_ID */
bf162019b7f5bd Huang Ying                   2010-02-28  2141  	{ USB_DEVICE(ALINK_VENDOR_ID, DLINK_PRODUCT_DWM_652_U5A) },
e3a3174519bae9 Brad Lu                      2009-06-16  2142  	{ USB_DEVICE(QISDA_VENDOR_ID, QISDA_PRODUCT_H21_4512) },
e3a3174519bae9 Brad Lu                      2009-06-16  2143  	{ USB_DEVICE(QISDA_VENDOR_ID, QISDA_PRODUCT_H21_4523) },
e3a3174519bae9 Brad Lu                      2009-06-16  2144  	{ USB_DEVICE(QISDA_VENDOR_ID, QISDA_PRODUCT_H20_4515) },
646d90e2b92557 Ömer Sezgin Ugurlu           2010-06-28  2145  	{ USB_DEVICE(QISDA_VENDOR_ID, QISDA_PRODUCT_H20_4518) },
e3a3174519bae9 Brad Lu                      2009-06-16  2146  	{ USB_DEVICE(QISDA_VENDOR_ID, QISDA_PRODUCT_H20_4519) },
75f47214f90e99 Peter Magdina                2009-10-07  2147  	{ USB_DEVICE(TOSHIBA_VENDOR_ID, TOSHIBA_PRODUCT_G450) },
334f9b0f23c9bb Michele Valzelli             2009-05-27  2148  	{ USB_DEVICE(TOSHIBA_VENDOR_ID, TOSHIBA_PRODUCT_HSDPA_MINICARD ) }, /* Toshiba 3G HSDPA == Novatel Expedite EU870D MiniCard */
c3325eb16d36a4 Anssi Hannula                2009-07-06  2149  	{ USB_DEVICE(ALINK_VENDOR_ID, 0x9000) },
5c3e4076ee8253 Dan Williams                 2011-06-06  2150  	{ USB_DEVICE(ALINK_VENDOR_ID, ALINK_PRODUCT_PH300) },
c3325eb16d36a4 Anssi Hannula                2009-07-06  2151  	{ USB_DEVICE_AND_INTERFACE_INFO(ALINK_VENDOR_ID, ALINK_PRODUCT_3GU, 0xff, 0xff, 0xff) },
3158a8d416f4e1 Andrey Skvortsov             2016-01-29  2152  	{ USB_DEVICE(ALINK_VENDOR_ID, SIMCOM_PRODUCT_SIM7100E),
c3a65808f04a84 Johan Hovold                 2018-03-07  2153  	  .driver_info = RSVD(5) | RSVD(6) },
cc6730df08a291 Jörgen Storvist              2018-12-12  2154  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
5417a7e4829629 Jörgen Storvist              2019-05-13  2155  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
5417a7e4829629 Jörgen Storvist              2019-05-13  2156  	  .driver_info = RSVD(7) },
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2157  	{ USB_DEVICE(0x1e0e, 0x9071),				/* Simcom SIM8230 RMNET mode */
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2158  	  .driver_info = RSVD(3) | RSVD(4) },
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2159  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9078, 0xff),	/* Simcom SIM8230 ECM mode */
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2160  	  .driver_info = RSVD(5) },
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2161  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x907b, 0xff),	/* Simcom SIM8230 RNDIS mode */
0e0ba0ecec3d6e Xiaowei Li                   2025-09-24  2162  	  .driver_info = RSVD(5) },
1ac698790819b8 Aleksander Morgado           2020-08-29  2163  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9205, 0xff) },	/* Simcom SIM7070/SIM7080/SIM7090 AT+ECM mode */
1ac698790819b8 Aleksander Morgado           2020-08-29  2164  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9206, 0xff) },	/* Simcom SIM7070/SIM7080/SIM7090 AT-only mode */
15badbcc8eede5 Dan Williams                 2011-06-06  2165  	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_X060S_X200),
c3a65808f04a84 Johan Hovold                 2018-03-07  2166  	  .driver_info = NCTRL(0) | NCTRL(1) | RSVD(4) },
f8f0302bbcbd1b Bjørn Mork                   2013-01-23  2167  	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_X220_X500D),
c3a65808f04a84 Johan Hovold                 2018-03-07  2168  	  .driver_info = RSVD(6) },
f8f0302bbcbd1b Bjørn Mork                   2013-01-23  2169  	{ USB_DEVICE(ALCATEL_VENDOR_ID, 0x0052),
c3a65808f04a84 Johan Hovold                 2018-03-07  2170  	  .driver_info = RSVD(6) },
f8f0302bbcbd1b Bjørn Mork                   2013-01-23  2171  	{ USB_DEVICE(ALCATEL_VENDOR_ID, 0x00b6),
c3a65808f04a84 Johan Hovold                 2018-03-07  2172  	  .driver_info = RSVD(3) },
f8f0302bbcbd1b Bjørn Mork                   2013-01-23  2173  	{ USB_DEVICE(ALCATEL_VENDOR_ID, 0x00b7),
c3a65808f04a84 Johan Hovold                 2018-03-07  2174  	  .driver_info = RSVD(5) },
5ec0085440ef8c Bjørn Mork                   2012-12-28  2175  	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_L100V),
c3a65808f04a84 Johan Hovold                 2018-03-07  2176  	  .driver_info = RSVD(4) },
dd6b48ecec2ea7 Bjørn Mork                   2014-04-25  2177  	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_L800MA),
c3a65808f04a84 Johan Hovold                 2018-03-07  2178  	  .driver_info = RSVD(2) },
12148da6722be3 Huzaifa Sidhpurwala          2009-10-12  2179  	{ USB_DEVICE(AIRPLUS_VENDOR_ID, AIRPLUS_PRODUCT_MCD650) },
fead2ab6cf9ad3 Bryan Wu                     2009-10-22  2180  	{ USB_DEVICE(TLAYTECH_VENDOR_ID, TLAYTECH_PRODUCT_TEU800) },
617c331d91077f Florian Zumbiehl             2023-02-06  2181  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, FOUR_G_SYSTEMS_PRODUCT_CARSTICK_LTE),
617c331d91077f Florian Zumbiehl             2023-02-06  2182  	  .driver_info = RSVD(0) },
ac7d4ca9e0b27d Dan Williams                 2010-02-16  2183  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, FOUR_G_SYSTEMS_PRODUCT_W14),
c3a65808f04a84 Johan Hovold                 2018-03-07  2184  	  .driver_info = NCTRL(0) | NCTRL(1) },
638148e20c7f8f Bjørn Mork                   2015-11-18  2185  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, FOUR_G_SYSTEMS_PRODUCT_W100),
c3a65808f04a84 Johan Hovold                 2018-03-07  2186  	  .driver_info = NCTRL(1) | NCTRL(2) | RSVD(3) },
69341bd15018da OKAMOTO Yoshiaki             2018-01-16  2187  	{USB_DEVICE(LONGCHEER_VENDOR_ID, FUJISOFT_PRODUCT_FS040U),
c3a65808f04a84 Johan Hovold                 2018-03-07  2188  	 .driver_info = RSVD(3)},
1cab4c68e33908 Oliver Neukum                2014-05-20  2189  	{ USB_DEVICE_INTERFACE_CLASS(LONGCHEER_VENDOR_ID, SPEEDUP_PRODUCT_SU9800, 0xff) },
8fb060da715ad1 Johan Hovold                 2017-06-12  2190  	{ USB_DEVICE_INTERFACE_CLASS(LONGCHEER_VENDOR_ID, 0x9801, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2191  	  .driver_info = RSVD(3) },
8fb060da715ad1 Johan Hovold                 2017-06-12  2192  	{ USB_DEVICE_INTERFACE_CLASS(LONGCHEER_VENDOR_ID, 0x9803, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2193  	  .driver_info = RSVD(4) },
cf16ffa17c3984 Coia Prant                   2024-04-15  2194  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, 0x9b05),	/* Longsung U8300 */
cf16ffa17c3984 Coia Prant                   2024-04-15  2195  	  .driver_info = RSVD(4) | RSVD(5) },
cf16ffa17c3984 Coia Prant                   2024-04-15  2196  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, 0x9b3c),	/* Longsung U9300 */
cf16ffa17c3984 Coia Prant                   2024-04-15  2197  	  .driver_info = RSVD(0) | RSVD(4) },
cdacb598fe7ab8 Dan Williams                 2011-06-06  2198  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, ZOOM_PRODUCT_4597) },
7d5c1b9c7cb5ec Rahul Bedarkar               2014-01-02  2199  	{ USB_DEVICE(LONGCHEER_VENDOR_ID, IBALL_3_5G_CONNECT) },
c983202bd03eb8 Donny Kurnia                 2009-12-23  2200  	{ USB_DEVICE(HAIER_VENDOR_ID, HAIER_PRODUCT_CE100) },
012eee1522318b Dan Williams                 2014-10-14  2201  	{ USB_DEVICE_AND_INTERFACE_INFO(HAIER_VENDOR_ID, HAIER_PRODUCT_CE81B, 0xff, 0xff, 0xff) },
33c387529b7931 spark                        2010-03-05  2202  	/* Pirelli  */
dbdf680703b98b Bjørn Mork                   2012-10-31  2203  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_C100_1, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2204  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_C100_2, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2205  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1004, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2206  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1005, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2207  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1006, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2208  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1007, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2209  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1008, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2210  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1009, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2211  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100A, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2212  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100B, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2213  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100C, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2214  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100D, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2215  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100E, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2216  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_100F, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2217  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1011, 0xff) },
dbdf680703b98b Bjørn Mork                   2012-10-31  2218  	{ USB_DEVICE_INTERFACE_CLASS(PIRELLI_VENDOR_ID, PIRELLI_PRODUCT_1012, 0xff) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2219  	/* Cinterion */
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2220  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EU3_E) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2221  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EU3_P) },
12df84d4a80278 Aleksander Morgado           2014-02-12  2222  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_PH8),
c3a65808f04a84 Johan Hovold                 2018-03-07  2223  	  .driver_info = RSVD(4) },
4152b387da8161 John Ernberg                 2016-01-25  2224  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_AHXX, 0xff) },
8ff10bdb14a52e Schemmel Hans-Christoph      2013-05-06  2225  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_PLXX),
c3a65808f04a84 Johan Hovold                 2018-03-07  2226  	  .driver_info = RSVD(4) },
444f94e9e625f6 Schemmel Hans-Christoph      2016-04-29  2227  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_PH8_2RMNET, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2228  	  .driver_info = RSVD(4) | RSVD(5) },
444f94e9e625f6 Schemmel Hans-Christoph      2016-04-29  2229  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_PH8_AUDIO, 0xff),
c3a65808f04a84 Johan Hovold                 2018-03-07  2230  	  .driver_info = RSVD(4) },
444f94e9e625f6 Schemmel Hans-Christoph      2016-04-29  2231  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_AHXX_2RMNET, 0xff) },
444f94e9e625f6 Schemmel Hans-Christoph      2016-04-29  2232  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_AHXX_AUDIO, 0xff) },
dfbac2f4da6a0c Reinhard Speyerer            2019-10-03  2233  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_CLS8, 0xff),
dfbac2f4da6a0c Reinhard Speyerer            2019-10-03  2234  	  .driver_info = RSVD(0) | RSVD(4) },
6d6556c04ebaea Giacinto Cifelli             2020-11-25  2235  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EXS82, 0xff) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2236  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2237  	{ USB_DEVICE(CINTERION_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2238  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDM) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2239  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2240  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, /* HC28 enumerates with Siemens or Cinterion VID depending on FW revision */
aa52b3a9291803 Nicolaus Colberg             2011-01-12  2241  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
e478d6029dca9d Christoph Schemmel           2021-01-27  2242  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV31_MBIM, 0xff),
e478d6029dca9d Christoph Schemmel           2021-01-27  2243  	  .driver_info = RSVD(3)},
e478d6029dca9d Christoph Schemmel           2021-01-27  2244  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV31_RMNET, 0xff),
e478d6029dca9d Christoph Schemmel           2021-01-27  2245  	  .driver_info = RSVD(0)},
158f7585bfcea4 Slark Xiao                   2022-06-01  2246  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV31_2_MBIM, 0xff),
158f7585bfcea4 Slark Xiao                   2022-06-01  2247  	  .driver_info = RSVD(3)},
158f7585bfcea4 Slark Xiao                   2022-06-01  2248  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV31_2_RMNET, 0xff),
158f7585bfcea4 Slark Xiao                   2022-06-01  2249  	  .driver_info = RSVD(0)},
b4a64ed6e7b857 Slark Xiao                   2022-04-14  2250  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV32_WA, 0xff),
b4a64ed6e7b857 Slark Xiao                   2022-04-14  2251  	  .driver_info = RSVD(3)},
8ffe20d08f2c95 Slark Xiao                   2022-08-10  2252  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV32_WA_RMNET, 0xff),
8ffe20d08f2c95 Slark Xiao                   2022-08-10  2253  	  .driver_info = RSVD(0) },
b4a64ed6e7b857 Slark Xiao                   2022-04-14  2254  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV32_WB, 0xff),
b4a64ed6e7b857 Slark Xiao                   2022-04-14  2255  	  .driver_info = RSVD(3)},
8ffe20d08f2c95 Slark Xiao                   2022-08-10  2256  	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_MV32_WB_RMNET, 0xff),
8ffe20d08f2c95 Slark Xiao                   2022-08-10  2257  	  .driver_info = RSVD(0) },
b0ebef36e93703 Bjørn Mork                   2014-06-06  2258  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
c3a65808f04a84 Johan Hovold                 2018-03-07  2259  	  .driver_info = RSVD(4) },
b0ebef36e93703 Bjørn Mork                   2014-06-06  2260  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),
c3a65808f04a84 Johan Hovold                 2018-03-07  2261  	  .driver_info = RSVD(4) },
b0ebef36e93703 Bjørn Mork                   2014-06-06  2262  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD140),
c3a65808f04a84 Johan Hovold                 2018-03-07  2263  	  .driver_info = RSVD(4) },
d19bf5cedfd7d5 Filippo Turato               2013-04-20  2264  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD145) },
b0ebef36e93703 Bjørn Mork                   2014-06-06  2265  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD155),
c3a65808f04a84 Johan Hovold                 2018-03-07  2266  	  .driver_info = RSVD(6) },
fd8573f5828873 Enrico Mioso                 2013-10-15  2267  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD200),
c3a65808f04a84 Johan Hovold                 2018-03-07  2268  	  .driver_info = RSVD(6) },
b0ebef36e93703 Bjørn Mork                   2014-06-06  2269  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD160),
c3a65808f04a84 Johan Hovold                 2018-03-07  2270  	  .driver_info = RSVD(6) },
533b3994610f31 Bjørn Mork                   2014-04-25  2271  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD500),
c3a65808f04a84 Johan Hovold                 2018-03-07  2272  	  .driver_info = RSVD(4) },
76078dc4fc3891 Michael Tokarev              2010-08-06  2273  	{ USB_DEVICE(CELOT_VENDOR_ID, CELOT_PRODUCT_CT680M) }, /* CT-650 CDMA 450 1xEVDO modem */
15b2f3204a5c87 Marius B. Kotsbak            2011-03-21  2274  	{ USB_DEVICE_AND_INTERFACE_INFO(SAMSUNG_VENDOR_ID, SAMSUNG_PRODUCT_GT_B3730, USB_CLASS_CDC_DATA, 0x00, 0x00) }, /* Samsung GT-B3730 LTE USB modem.*/
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2275  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM600) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2276  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM610) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2277  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM500) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2278  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM510) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2279  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM800) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2280  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEM900) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2281  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU818) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2282  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU816) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2283  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU828) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2284  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU826) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2285  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU518) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2286  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU516) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2287  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU528) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2288  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU526) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2289  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM600) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2290  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM610) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2291  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM500) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2292  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM510) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2293  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM800) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2294  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWM900) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2295  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU718) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2296  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU716) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2297  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU728) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2298  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU726) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2299  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU518) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2300  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU516) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2301  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU528) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2302  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU526) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2303  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM600) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2304  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM610) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2305  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM500) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2306  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM510) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2307  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM800) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2308  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLM900) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2309  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU718) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2310  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU716) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2311  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU728) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2312  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU726) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2313  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU518) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2314  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU516) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2315  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU528) },
c6eb2d75ffcdfa Gavin.zhu                    2011-08-22  2316  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CLU526) },
0ef0be15fd2564 说不得                       2012-05-28  2317  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU881) },
0ef0be15fd2564 说不得                       2012-05-28  2318  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CEU882) },
0ef0be15fd2564 说不得                       2012-05-28  2319  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU581) },
0ef0be15fd2564 说不得                       2012-05-28  2320  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU582) },
0ef0be15fd2564 说不得                       2012-05-28  2321  	{ USB_DEVICE(YUGA_VENDOR_ID, YUGA_PRODUCT_CWU583) },
5b061623355d8f VU Tuan Duc                  2011-11-15  2322  	{ USB_DEVICE_AND_INTERFACE_INFO(VIETTEL_VENDOR_ID, VIETTEL_PRODUCT_VT1000, 0xff, 0xff, 0xff) },
3c8c9316710b83 Janne Snabb                  2011-12-28  2323  	{ USB_DEVICE_AND_INTERFACE_INFO(ZD_VENDOR_ID, ZD_PRODUCT_7000, 0xff, 0xff, 0xff) },
e423d7401fd071 Kentaro Matsuyama            2012-01-12  2324  	{ USB_DEVICE(LG_VENDOR_ID, LG_PRODUCT_L02C) }, /* docomo L-02C modem */
0d8520a1d7f433 Meng Zhang                   2012-02-27  2325  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x00, 0x00) },
0d8520a1d7f433 Meng Zhang                   2012-02-27  2326  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x02, 0x01) },
0d8520a1d7f433 Meng Zhang                   2012-02-27  2327  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x00, 0x00) },
0d8520a1d7f433 Meng Zhang                   2012-02-27  2328  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x02, 0x01) },        /* MediaTek MT6276M modem & app port */
aacef9c561a693 Gaosen Zhang                 2012-07-05  2329  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_1COM, 0x0a, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2330  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_5COM, 0xff, 0x02, 0x01) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2331  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_5COM, 0xff, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2332  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM, 0xff, 0x02, 0x01) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2333  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM, 0xff, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2334  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7208_1COM, 0x02, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2335  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7208_2COM, 0x02, 0x02, 0x01) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2336  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FP_1COM, 0x0a, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2337  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FP_2COM, 0x0a, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2338  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FPDC_1COM, 0x0a, 0x00, 0x00) },
aacef9c561a693 Gaosen Zhang                 2012-07-05  2339  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FPDC_2COM, 0x0a, 0x00, 0x00) },
94a85b633829b9 Quentin.Li                   2012-12-26  2340  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7103_2COM, 0xff, 0x00, 0x00) },
94a85b633829b9 Quentin.Li                   2012-12-26  2341  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7106_2COM, 0x02, 0x02, 0x01) },
94a85b633829b9 Quentin.Li                   2012-12-26  2342  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x02, 0x01) },
94a85b633829b9 Quentin.Li                   2012-12-26  2343  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x00, 0x00) },
2604e08ff251db Bjørn Mork                   2024-06-26  2344  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x7126, 0xff, 0x00, 0x00),
2604e08ff251db Bjørn Mork                   2024-06-26  2345  	  .driver_info = NCTRL(2) },
2604e08ff251db Bjørn Mork                   2024-06-26  2346  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x7127, 0xff, 0x00, 0x00),
2604e08ff251db Bjørn Mork                   2024-06-26  2347  	  .driver_info = NCTRL(2) | NCTRL(3) | NCTRL(4) },
f07dfa6a1b6503 Jack Wu                      2024-11-28  2348  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x7129, 0xff, 0x00, 0x00),        /* MediaTek T7XX  */
f07dfa6a1b6503 Jack Wu                      2024-11-28  2349  	  .driver_info = NCTRL(2) | NCTRL(3) | NCTRL(4) },
1e2c4e59d2b879 Dmitry Shmygov               2012-06-20  2350  	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MEN200) },
3e765cab8abe7f Wilken Gottwalt              2020-10-03  2351  	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MPL200),
3e765cab8abe7f Wilken Gottwalt              2020-10-03  2352  	  .driver_info = RSVD(1) | RSVD(4) },
c38e83b6cc2adf Daniil Bolsun                2013-07-19  2353  	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600A) },
c38e83b6cc2adf Daniil Bolsun                2013-07-19  2354  	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600E) },
837ddc4793a69b Henryk Heisig                2017-09-11  2355  	{ USB_DEVICE_AND_INTERFACE_INFO(TPLINK_VENDOR_ID, TPLINK_PRODUCT_LTE, 0xff, 0x00, 0x00) },	/* TP-Link LTE Module */
99beb2e9687ffd Bjørn Mork                   2013-01-15  2356  	{ USB_DEVICE(TPLINK_VENDOR_ID, TPLINK_PRODUCT_MA180),
c3a65808f04a84 Johan Hovold                 2018-03-07  2357  	  .driver_info = RSVD(4) },
94190301ffa059 Bjørn Mork                   2013-06-28  2358  	{ USB_DEVICE(TPLINK_VENDOR_ID, 0x9000),					/* TP-Link MA260 */
c3a65808f04a84 Johan Hovold                 2018-03-07  2359  	  .driver_info = RSVD(4) },
d4fa681541aa7b Bjørn Mork                   2013-02-01  2360  	{ USB_DEVICE(CHANGHONG_VENDOR_ID, CHANGHONG_PRODUCT_CH690) },
b5fdde28d4b773 Bjørn Mork                   2017-08-29  2361  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7d01, 0xff) },			/* D-Link DWM-156 (variant) */
b5fdde28d4b773 Bjørn Mork                   2017-08-29  2362  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7d02, 0xff) },
b5fdde28d4b773 Bjørn Mork                   2017-08-29  2363  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7d03, 0xff) },
4d304a6fe93538 Giuseppe Lippolis            2018-04-23  2364  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7d04, 0xff),			/* D-Link DWM-158 */
4d304a6fe93538 Giuseppe Lippolis            2018-04-23  2365  	 .driver_info = RSVD(4) | RSVD(5) },
169e86546f5712 Maciej S. Szmigiero          2017-08-29  2366  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7d0e, 0xff) },			/* D-Link DWM-157 C1 */
d48d5691ebf88a Bjørn Mork                   2016-04-07  2367  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e19, 0xff),			/* D-Link DWM-221 B1 */
c3a65808f04a84 Johan Hovold                 2018-03-07  2368  	  .driver_info = RSVD(4) },
fd1b8668af59a1 Hector Martin                2017-08-02  2369  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
c3a65808f04a84 Johan Hovold                 2018-03-07  2370  	  .driver_info = RSVD(4) },
552573e42aab5f Rogan Dawes                  2019-07-17  2371  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e3d, 0xff),			/* D-Link DWM-222 A2 */
552573e42aab5f Rogan Dawes                  2019-07-17  2372  	  .driver_info = RSVD(4) },
ca24763588844b Alexandr \"Sky\" Ivanov      2013-07-23  2373  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e01, 0xff, 0xff, 0xff) },	/* D-Link DWM-152/C1 */
ca24763588844b Alexandr \"Sky\" Ivanov      2013-07-23  2374  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e02, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/C1 */
cf1b18030de29e Lubomir Rintel               2016-07-24  2375  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
dfee7e2f478346 Pawel Dembicki               2020-03-25  2376  	{ USB_DEVICE_INTERFACE_CLASS(0x1435, 0xd191, 0xff),			/* Wistron Neweb D19Q1 */
dfee7e2f478346 Pawel Dembicki               2020-03-25  2377  	  .driver_info = RSVD(1) | RSVD(4) },
007d20dca2376a Pawel Dembicki               2020-03-25  2378  	{ USB_DEVICE_INTERFACE_CLASS(0x1690, 0x7588, 0xff),			/* ASKEY WWHC050 */
007d20dca2376a Pawel Dembicki               2020-03-25  2379  	  .driver_info = RSVD(1) | RSVD(4) },
84f3b43f7378b9 Bjørn Mork                   2019-03-27  2380  	{ USB_DEVICE_INTERFACE_CLASS(0x2020, 0x2031, 0xff),			/* Olicard 600 */
84f3b43f7378b9 Bjørn Mork                   2019-03-27  2381  	  .driver_info = RSVD(4) },
6cb2669cb97fc4 Pawel Dembicki               2020-03-25  2382  	{ USB_DEVICE_INTERFACE_CLASS(0x2020, 0x2033, 0xff),			/* BroadMobi BM806U */
6cb2669cb97fc4 Pawel Dembicki               2020-03-25  2383  	  .driver_info = RSVD(4) },
e5d8badf37e6b5 Bob Ham                      2019-07-24  2384  	{ USB_DEVICE_INTERFACE_CLASS(0x2020, 0x2060, 0xff),			/* BroadMobi BM818 */
e5d8badf37e6b5 Bob Ham                      2019-07-24  2385  	  .driver_info = RSVD(4) },
f6d7fb37f92622 Claudio Cappelli             2015-06-10  2386  	{ USB_DEVICE_INTERFACE_CLASS(0x2020, 0x4000, 0xff) },			/* OLICARD300 - MT6225 */
f4c19b8e165cff Greg Kroah-Hartman           2013-10-05  2387  	{ USB_DEVICE(INOVIA_VENDOR_ID, INOVIA_SEW858) },
d77302739d900b Brennan Ashton               2014-08-06  2388  	{ USB_DEVICE(VIATELECOM_VENDOR_ID, VIATELECOM_PRODUCT_CDS7) },
6695593e4a7659 Aleksandr Makarov            2016-08-20  2389  	{ USB_DEVICE_AND_INTERFACE_INFO(WETELECOM_VENDOR_ID, WETELECOM_PRODUCT_WMD200, 0xff, 0xff, 0xff) },
40d9c32525cba7 Aleksandr Makarov            2016-08-24  2390  	{ USB_DEVICE_AND_INTERFACE_INFO(WETELECOM_VENDOR_ID, WETELECOM_PRODUCT_6802, 0xff, 0xff, 0xff) },
40d9c32525cba7 Aleksandr Makarov            2016-08-24  2391  	{ USB_DEVICE_AND_INTERFACE_INFO(WETELECOM_VENDOR_ID, WETELECOM_PRODUCT_WMD300, 0xff, 0xff, 0xff) },
5d03a2fd2292e7 Bjørn Mork                   2017-01-24  2392  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0x421d, 0xff, 0xff, 0xff) },	/* HP lt2523 (Novatel E371) */
d57ec3c83b5153 Tore Anderson                2018-12-08  2393  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xa31d, 0xff, 0x06, 0x10) },	/* HP lt4132 (Huawei ME906s-158) */
d57ec3c83b5153 Tore Anderson                2018-12-08  2394  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xa31d, 0xff, 0x06, 0x12) },
d57ec3c83b5153 Tore Anderson                2018-12-08  2395  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xa31d, 0xff, 0x06, 0x13) },
d57ec3c83b5153 Tore Anderson                2018-12-08  2396  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xa31d, 0xff, 0x06, 0x14) },
d57ec3c83b5153 Tore Anderson                2018-12-08  2397  	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xa31d, 0xff, 0x06, 0x1b) },
f0797095423e6e Aleksander Morgado           2019-11-13  2398  	{ USB_DEVICE(0x0489, 0xe0b4),						/* Foxconn T77W968 */
f0797095423e6e Aleksander Morgado           2019-11-13  2399  	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
f0797095423e6e Aleksander Morgado           2019-11-13  2400  	{ USB_DEVICE(0x0489, 0xe0b5),						/* Foxconn T77W968 ESIM */
f0797095423e6e Aleksander Morgado           2019-11-13  2401  	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
13fde9ac23ca8c Slark Xiao                   2023-12-01  2402  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0da, 0xff),                     /* Foxconn T99W265 MBIM variant */
13fde9ac23ca8c Slark Xiao                   2023-12-01  2403  	  .driver_info = RSVD(3) | RSVD(5) },
9e3eed534f8235 Slark Xiao                   2021-09-17  2404  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0db, 0xff),			/* Foxconn T99W265 MBIM */
9e3eed534f8235 Slark Xiao                   2021-09-17  2405  	  .driver_info = RSVD(3) },
4d9488b294e1f8 Slark Xiao                   2023-08-23  2406  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0ee, 0xff),			/* Foxconn T99W368 MBIM */
4d9488b294e1f8 Slark Xiao                   2023-08-23  2407  	  .driver_info = RSVD(3) },
4d9488b294e1f8 Slark Xiao                   2023-08-23  2408  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0f0, 0xff),			/* Foxconn T99W373 MBIM */
4d9488b294e1f8 Slark Xiao                   2023-08-23  2409  	  .driver_info = RSVD(3) },
7970b4969c4c99 Slark Xiao                   2025-11-18  2410  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe123, 0xff),			/* Foxconn T99W760 MBIM */
7970b4969c4c99 Slark Xiao                   2025-11-18  2411  	  .driver_info = RSVD(3) },
3c841d54b63e44 Slark Xiao                   2024-07-05  2412  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe145, 0xff),			/* Foxconn T99W651 RNDIS */
3c841d54b63e44 Slark Xiao                   2024-07-05  2413  	  .driver_info = RSVD(5) | RSVD(6) },
ad1244e1ce18f8 Slark Xiao                   2025-07-21  2414  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe15f, 0xff),                     /* Foxconn T99W709 */
ad1244e1ce18f8 Slark Xiao                   2025-07-21  2415  	  .driver_info = RSVD(5) },
08f49cdb71f375 Slark Xiao                   2025-06-20  2416  	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe167, 0xff),                     /* Foxconn T99W640 MBIM */
08f49cdb71f375 Slark Xiao                   2025-06-20  2417  	  .driver_info = RSVD(3) },
5e4d659b10fde1 Vincent Palatin              2020-11-20  2418  	{ USB_DEVICE(0x1508, 0x1001),						/* Fibocom NL668 (IOT version) */
30360224441ce8 Jörgen Storvist              2018-12-12  2419  	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
714adff9a6271b Sven Schwermer               2022-04-25  2420  	{ USB_DEVICE(0x1782, 0x4d10) },						/* Fibocom L610 (AT mode) */
714adff9a6271b Sven Schwermer               2022-04-25  2421  	{ USB_DEVICE_INTERFACE_CLASS(0x1782, 0x4d11, 0xff) },			/* Fibocom L610 (ECM/RNDIS mode) */
e389fe8b681373 Victor Fragoso               2023-11-21  2422  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0001, 0xff, 0xff, 0xff) },	/* Fibocom L716-EU (ECM/RNDIS mode) */
4b2c01ad902ec0 Jörgen Storvist              2018-12-21  2423  	{ USB_DEVICE(0x2cb7, 0x0104),						/* Fibocom NL678 series */
4b2c01ad902ec0 Jörgen Storvist              2018-12-21  2424  	  .driver_info = RSVD(4) | RSVD(5) },
4b2c01ad902ec0 Jörgen Storvist              2018-12-21  2425  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0105, 0xff),			/* Fibocom NL678 series */
4b2c01ad902ec0 Jörgen Storvist              2018-12-21  2426  	  .driver_info = RSVD(6) },
07989eb981d862 Sven Schwermer               2022-04-25  2427  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0106, 0xff) },			/* Fibocom MA510 (ECM mode w/ diag intf.) */
07989eb981d862 Sven Schwermer               2022-04-25  2428  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x010a, 0xff) },			/* Fibocom MA510 (ECM mode) */
2829a4e3cf3a6a Zhengjun Zhang               2021-08-09  2429  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x010b, 0xff, 0xff, 0x30) },	/* Fibocom FG150 Diag */
2829a4e3cf3a6a Zhengjun Zhang               2021-08-09  2430  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x010b, 0xff, 0, 0) },		/* Fibocom FG150 AT */
148f4b32b4504d Reinhard Speyerer            2022-11-09  2431  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0111, 0xff) },			/* Fibocom FM160 (MBIM mode) */
393c74ccbd847b Reinhard Speyerer            2024-10-18  2432  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0xff, 0x30) },	/* Fibocom FG132 Diag */
393c74ccbd847b Reinhard Speyerer            2024-10-18  2433  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0xff, 0x40) },	/* Fibocom FG132 AT */
393c74ccbd847b Reinhard Speyerer            2024-10-18  2434  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0, 0) },		/* Fibocom FG132 NMEA */
356952b13af5b2 bolan wang                   2024-03-06  2435  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0115, 0xff),			/* Fibocom FM135 (laptop MBIM) */
356952b13af5b2 bolan wang                   2024-03-06  2436  	  .driver_info = RSVD(5) },
5e4d659b10fde1 Vincent Palatin              2020-11-20  2437  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x01a0, 0xff) },			/* Fibocom NL668-AM/NL652-EU (laptop MBIM) */
88459e3e42760a Mingjie Zhang                2021-11-23  2438  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x01a2, 0xff) },			/* Fibocom FM101-GL (laptop MBIM) */
b4a1f4eaf1d798 Puliang Lu                   2024-01-31  2439  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x01a3, 0xff) },			/* Fibocom FM101-GL (laptop MBIM) */
88459e3e42760a Mingjie Zhang                2021-11-23  2440  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x01a4, 0xff),			/* Fibocom FM101-GL (laptop MBIM) */
88459e3e42760a Mingjie Zhang                2021-11-23  2441  	  .driver_info = RSVD(4) },
fb1f4584b1215e Chuanhong Guo                2024-03-12  2442  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0a04, 0xff) },			/* Fibocom FM650-CN (ECM mode) */
fb1f4584b1215e Chuanhong Guo                2024-03-12  2443  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0a05, 0xff) },			/* Fibocom FM650-CN (NCM mode) */
fb1f4584b1215e Chuanhong Guo                2024-03-12  2444  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0a06, 0xff) },			/* Fibocom FM650-CN (RNDIS mode) */
fb1f4584b1215e Chuanhong Guo                2024-03-12  2445  	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0a07, 0xff) },			/* Fibocom FM650-CN (MBIM mode) */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2446  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d41, 0xff, 0, 0) },		/* MeiG Smart SLM320 */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2447  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d57, 0xff, 0, 0) },		/* MeiG Smart SLM770A */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2448  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0, 0) },		/* MeiG Smart SRM815 */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2449  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x02) },	/* MeiG Smart SLM828 */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2450  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x03) },	/* MeiG Smart SLM828 */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2451  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM815 and SRM825L */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2452  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825L */
6aa8a63c471eb6 Johan Hovold                 2025-02-11  2453  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825L */
e8d0ed37bd51da Ernestas Kulik               2026-03-24  2454  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM825WN (Diag) */
e8d0ed37bd51da Ernestas Kulik               2026-03-24  2455  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825WN (AT) */
e8d0ed37bd51da Ernestas Kulik               2026-03-24  2456  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825WN (NMEA) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2457  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d63, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2458  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d63, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2459  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2460  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2461  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
7d2b37d3e42d19 Jan Volckaert                2026-05-17  2462  
0e2d6795e8dbe9 Daniel Palmer                2020-12-27  2463  	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
08d4ef5cc9203a Jörgen Storvist              2020-06-23  2464  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
08d4ef5cc9203a Jörgen Storvist              2020-06-23  2465  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
08d4ef5cc9203a Jörgen Storvist              2020-06-23  2466  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
311f97a4c7c22a Vanillan Wang                2024-04-16  2467  	{ USB_DEVICE(0x33f8, 0x0104),						/* Rolling RW101-GL (laptop RMNET) */
311f97a4c7c22a Vanillan Wang                2024-04-16  2468  	  .driver_info = RSVD(4) | RSVD(5) },
523bf0a59e674b Vanillan Wang                2025-11-10  2469  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0115, 0xff),			/* Rolling RW135-GL (laptop MBIM) */
523bf0a59e674b Vanillan Wang                2025-11-10  2470  	  .driver_info = RSVD(5) },
311f97a4c7c22a Vanillan Wang                2024-04-16  2471  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a2, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
311f97a4c7c22a Vanillan Wang                2024-04-16  2472  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a3, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
311f97a4c7c22a Vanillan Wang                2024-04-16  2473  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a4, 0xff),			/* Rolling RW101-GL (laptop MBIM) */
311f97a4c7c22a Vanillan Wang                2024-04-16  2474  	  .driver_info = RSVD(4) },
523bf0a59e674b Vanillan Wang                2025-11-10  2475  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a8, 0xff),			/* Rolling RW101R-GL (laptop MBIM) */
523bf0a59e674b Vanillan Wang                2025-11-10  2476  	  .driver_info = RSVD(4) },
523bf0a59e674b Vanillan Wang                2025-11-10  2477  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a9, 0xff),			/* Rolling RW101R-GL (laptop MBIM) */
523bf0a59e674b Vanillan Wang                2025-11-10  2478  	  .driver_info = RSVD(4) },
523bf0a59e674b Vanillan Wang                2025-11-10  2479  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0301, 0xff) },			/* Rolling RW101R-GL (laptop MBIM) */
523bf0a59e674b Vanillan Wang                2025-11-10  2480  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0302, 0xff) },			/* Rolling RW101R-GL (laptop MBIM) */
ae420771551bd9 Vanillan Wang                2024-05-31  2481  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0802, 0xff),			/* Rolling RW350-GL (laptop MBIM) */
ae420771551bd9 Vanillan Wang                2024-05-31  2482  	  .driver_info = RSVD(5) },
689f2facc689c8 Wanquan Zhong                2026-05-20  2483  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),			/* Rolling RW135R-GL (laptop MBIM) */
689f2facc689c8 Wanquan Zhong                2026-05-20  2484  	  .driver_info = RSVD(5) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2485  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Global */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2486  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2487  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2488  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WRD for Global SKU */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2489  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2490  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2491  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WRD for China SKU */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2492  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2493  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2494  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for SA */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2495  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2496  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2497  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for EU */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2498  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2499  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2500  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for NA */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2501  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2502  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2503  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for China EDU */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2504  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2505  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0xff, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2506  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Golbal EDU */
dc6dbe3ed28795 Mank Wang                    2024-06-29  2507  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0x00, 0x40) },
dc6dbe3ed28795 Mank Wang                    2024-06-29  2508  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0xff, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2509  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010a, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WRD for WWAN Ready */
aa954ae08262bb Mank Wang                    2024-11-22  2510  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010a, 0xff, 0x00, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2511  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010a, 0xff, 0xff, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2512  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010b, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for WWAN Ready */
aa954ae08262bb Mank Wang                    2024-11-22  2513  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010b, 0xff, 0x00, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2514  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010b, 0xff, 0xff, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2515  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010c, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WRD for WWAN Ready */
aa954ae08262bb Mank Wang                    2024-11-22  2516  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010c, 0xff, 0x00, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2517  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010c, 0xff, 0xff, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2518  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010d, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for WWAN Ready */
aa954ae08262bb Mank Wang                    2024-11-22  2519  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010d, 0xff, 0x00, 0x40) },
aa954ae08262bb Mank Wang                    2024-11-22  2520  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x010d, 0xff, 0xff, 0x40) },
8d5fc280392735 Yan Xinyu                    2022-07-14  2521  	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, 0xff, 0x30) },
df3414b0a245f4 Benoît Monin                 2022-10-13  2522  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
064f6e2ba9eb59 Benoît Monin                 2023-10-02  2523  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
df3414b0a245f4 Benoît Monin                 2022-10-13  2524  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
968e1cbb1f6293 Adam Xue                     2025-04-14  2525  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x30) },
968e1cbb1f6293 Adam Xue                     2025-04-14  2526  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x40) },
a095edfc15f083 Arınç ÜNAL                   2023-04-17  2527  	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
71c07570b918f0 Renjun Wang                  2025-10-19  2528  	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, UNISOC_PRODUCT_UIS7720, 0xff, 0, 0) },
da90e45d5afc4d Asuna Yang                   2023-11-22  2529  	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
fdad4fb7c506be Daniel Swanemar              2024-11-04  2530  	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
fdad4fb7c506be Daniel Swanemar              2024-11-04  2531  	  .driver_info = NCTRL(1) },
fdad4fb7c506be Daniel Swanemar              2024-11-04  2532  	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
fdad4fb7c506be Daniel Swanemar              2024-11-04  2533  	  .driver_info = NCTRL(3) },
f5b435be70cb12 Michal Hrusecky              2025-01-07  2534  	{ USB_DEVICE_INTERFACE_CLASS(0x2949, 0x8700, 0xff) },			/* Neoway N723-EA */
14f76cc7ab75b1 Matthias Urlichs             2006-06-02  2535  	{ } /* Terminating entry */
14f76cc7ab75b1 Matthias Urlichs             2006-06-02  2536  };
58cfe9113e485f Matthias Urlichs             2005-05-23  2537  MODULE_DEVICE_TABLE(usb, option_ids);
58cfe9113e485f Matthias Urlichs             2005-05-23  2538  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825390;
	b=zORP5Fflll4ybwgBE8ntr/odeR/4N33SLUW294SN5l4D2l5HLc4ABY/WXqeAcWtHkoOy
	 AK/9AH3d22cL3KJGz89fjOABgCWCYzel1c/xHCk1rAlH0EZdyikslU2yKYmQUE9KGAl5/
	 64EIkeTKbptHvAfGIfxc7ZfrGYKW7IL+UX00oEnAZcvaFSIs0Xwj51uQpb/PXCm6XFr8d
	 p87IFSdl7ApGDhQn2TJ2/gxT9rsSbrl98alVKOnQ17HAt3eak2EFuO99zZU6Lo97rPKqZ
	 X/zmg4LR8wgpVfd75lRLhAPAUI19LBlFhkIW3dcAedoM7sKLlEV9uphb4O8nj9ZL4aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7UHNfr4Il3LK173WRBdrE3VsuDX4KYvFSp/3qgLgdhM=;
	b=iKCplzFs4LnB0xDS7MJkxieVttTFWuQ+UIWtXfAsRegBAOOGvzrPHATOJYVbpA1uK7Hn
	 LGdwh0MTYrdO5anuXfeccYcSL8WwmjCHK8Tjv197+5Jig3FOpGvB1ld8dY3mpLcGAX3HE
	 qEcbS7j6djC6Ny79mEaeWks7Z0KxOygzfW658jSfh3uw3NMNcihbotcmvzNFIl3pInDXD
	 xwa8S6goatjt6PJ3FymbX5DGFxMmDWRXGM+qNd5zVBc1zj1Ln5OWSfwIiZtQnuruIQ9Oh
	 gLlbKlqEQCZ6Ye6mUm2i6vbrIYcaUvVyTu7VdkMV5dke2xsc9H1XweLsy8hV10ACZNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l2Ozy7eb;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80365606CA23;
	Wed,  4 Nov 2026 20:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80365606CA23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l2Ozy7eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793825388; x=1825361388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5xeOURYxUIPvO0bpPT2q/RibhsINvajMvDh/SUbxlto=;
  b=l2Ozy7eblfRcWbZJ5kcTCoqM/2FJhQxM1T+zc0pCazMlfhIcjFGxbKB/
   ffz+VUlUnyZ419RUIZ3LV6nAwFrn2hQFxfSRtsDTf7t4MMd6guAascDKp
   tWtNQui+wI7Zes+yhKlKnwyFBS1Dhqu5k2eFyNJyIxbTfOUnT1iavnme/
   FYCjCpUKD2zOnxggNehCIAiT1T+KSS7v61ZKyZdPyQPyWSD/swxCz03sR
   9JKXr+oQz4tR1P2kTGNEN8sv1wZc/zcZxMku/8nQhLiNGLJq0iMcxItID
   MnkBlZN3OXgPny6hvdM9DiZNGrbj1H3ubEG33PQ2f+b8Dzfz/06I0YU7Y
   w==;
X-CSE-ConnectionGUID: duuHviZwSMKTkluY4urVPw==
X-CSE-MsgGUID: cxZTvrqWQfeRNOLhguPlew==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2610888"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2610888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:49:48 -0800
X-CSE-ConnectionGUID: vWF71u6tQXerag+cpWI2Ow==
X-CSE-MsgGUID: lZZeExA0Stu6OVEk1wFsaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6942779"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2026 12:49:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOhvU-00000000kzv-1oLk;
	Wed, 04 Nov 2026 20:49:44 +0000
Date: Thu, 5 Nov 2026 04:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/14] power/supply: add support for x86 macs in
 macsmc-power
Message-ID: <202611050433.ijrZVulP-lkp@intel.com>
References: <20261029085504.3547-11-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029085504.3547-11-atharvatiwarilinuxdev@gmail.com>

Hi Atharva,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on groeck-staging/hwmon groeck-staging/hwmon-next groeck-staging/watchdog groeck-staging/watchdog-next jic23-iio/togreg linus/master v7.3 next-20261030]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/treewide-Add-backend-for-macsmc/20261029-045158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20261029085504.3547-11-atharvatiwarilinuxdev%40gmail.com
patch subject: [RFC PATCH 10/14] power/supply: add support for x86 macs in macsmc-power
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611050433.ijrZVulP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050433.ijrZVulP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050433.ijrZVulP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/macsmc-power.c:1011:24: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1011 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                      ^
   drivers/power/supply/macsmc-power.c:1011:24: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:556:8: note: 'acpi_evaluate_object' declared here
     556 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
>> drivers/power/supply/macsmc-power.c:1011:60: error: incomplete definition of type 'struct acpi_device'
    1011 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                                            ~~~~~~~~~~~~~~^
   include/linux/device/bus.h:224:8: note: forward declaration of 'struct acpi_device'
     224 | struct acpi_device;
         |        ^
>> drivers/power/supply/macsmc-power.c:1308:9: error: call to undeclared function 'acpi_dev_install_notify_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1308 |                 ret = acpi_dev_install_notify_handler(power->adapter, ACPI_DEVICE_NOTIFY,
         |                       ^
   drivers/power/supply/macsmc-power.c:1308:9: note: did you mean 'acpi_install_notify_handler'?
   include/acpi/acpixf.h:641:8: note: 'acpi_install_notify_handler' declared here
     641 |                             acpi_install_notify_handler(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   drivers/power/supply/macsmc-power.c:1313:24: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1313 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                      ^
   drivers/power/supply/macsmc-power.c:1313:60: error: incomplete definition of type 'struct acpi_device'
    1313 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                                            ~~~~~~~~~~~~~~^
   include/linux/device/bus.h:224:8: note: forward declaration of 'struct acpi_device'
     224 | struct acpi_device;
         |        ^
>> drivers/power/supply/macsmc-power.c:1330:3: error: call to undeclared function 'acpi_dev_remove_notify_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1330 |                 acpi_dev_remove_notify_handler(power->adapter, ACPI_DEVICE_NOTIFY,
         |                 ^
   drivers/power/supply/macsmc-power.c:1330:3: note: did you mean 'acpi_remove_notify_handler'?
   include/acpi/acpixf.h:647:8: note: 'acpi_remove_notify_handler' declared here
     647 |                             acpi_remove_notify_handler(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   6 errors generated.


vim +/acpi_evaluate_integer +1011 drivers/power/supply/macsmc-power.c

  1005	
  1006	static void macsmc_power_acpi_notify(acpi_handle handle, u32 event, void *context)
  1007	{
  1008		struct macsmc_power *power = context;
  1009	
  1010		if (event == 0x80) {
> 1011			acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
  1012									&power->adapter_status);
  1013			if (ACPI_FAILURE(status))
  1014				return;
  1015	
  1016			power->adapter_status = !!power->adapter_status;
  1017			power_supply_changed(power->batt);
  1018			power_supply_changed(power->ac);
  1019		}
  1020	}
  1021	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

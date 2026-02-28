Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2751449EB3;
	Sat, 28 Feb 2026 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772290936; cv=none; b=TY+H62jnCecv6LfILccggNvnuhDMu/r6INSK1BWduf3GuePCx9u9YUd0XHqWcsG0EgK3BY6eEaX2uGdH3QopZ/BA4nNWUXGzDvDptDWOpVzx29McMNU8fKOUMVdvahvmP8Dujqp6Tf69bLONuJYlnIbZhse9DPLFebImDMAZpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772290936; c=relaxed/simple;
	bh=Rw4khuzqqbVItIQot1CVbPdPhaE0r4TQd/DiqRb3zaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kc6blvVYwYdRGWLy3vWlYJ2Sdgq0Rs7+gTOIfGwe30AQUK/wFxqPsiy9UXd866cxitSGn8TdUdVfK7hxUW9zWQ6N47tWx37CmH34uVjdM4mcV0nng2KHHhv+CIkzid0z0AQqcCngsQ07xyd8V+Aw+SuAMcxYb5N0ZgIJPCtt5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVvZqJ+r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVvZqJ+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772290933; x=1803826933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rw4khuzqqbVItIQot1CVbPdPhaE0r4TQd/DiqRb3zaE=;
  b=XVvZqJ+r8tAQxdtfenhRZsEPxmOuHA2yTL4dpa4PGD3oweR9n7xj+Ccs
   N677FQY2prc77xwTDTYrDvwuIVN3Oz5/vx7inPc4cDSfev7ki9JvCT6Oz
   0IbO+vq+1eVh/V+W0BieTtejO0vrUtVM7xftcq53gcKxfQXQessLysrj3
   9nHqPhmElsS8+s4BMp/lyZPzJapypNogn+F/9iaRT0vzeejuCIkPwZUFd
   vhggiD0aDWtKO09eSzMx76hGpDyxIWof9xs7u3dujiA3+AmBcGIh/+q2K
   XKXS99r2V+0dvrGcX1CAL4kNR5jQXRZWZfKCP0eplCQz6OEEE5EHNfPMl
   g==;
X-CSE-ConnectionGUID: IbmC9oc8QWO9uqnr5qaLmA==
X-CSE-MsgGUID: rW0JWPjrSHajFbBvRinr1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73465522"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="73465522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 07:02:12 -0800
X-CSE-ConnectionGUID: RHxyeq5nQMicn/tEAMxa7w==
X-CSE-MsgGUID: nl7lgaZgQgaxASmeeVrr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="216319816"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Feb 2026 07:02:10 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwLpX-00000000Bcn-3HZD;
	Sat, 28 Feb 2026 15:02:07 +0000
Date: Sat, 28 Feb 2026 23:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 3/7]
 drivers/platform/chrome/cros_kbd_led_backlight.c:79:11: error: call to
 undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202602282250.2zY8xH09-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_kbd_led-cleanup
head:   daa221254bed55b8bb0814220c77831014f03446
commit: 44103d0e19b283f9e8d64215aee10ec01270e935 [3/7] CONFIG_ACPI
config: x86_64-buildonly-randconfig-004-20260228 (https://download.01.org/0day-ci/archive/20260228/202602282250.2zY8xH09-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602282250.2zY8xH09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602282250.2zY8xH09-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/cros_kbd_led_backlight.c:79:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
         |                  ^
   drivers/platform/chrome/cros_kbd_led_backlight.c:79:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:556:8: note: 'acpi_evaluate_object' declared here
     556 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   1 error generated.


vim +/acpi_evaluate_integer +79 drivers/platform/chrome/cros_kbd_led_backlight.c

492ef7829d2d09 Simon Que     2016-03-08  72  
492ef7829d2d09 Simon Que     2016-03-08  73  static enum led_brightness
6b1e5ba39c4444 Tzung-Bi Shih 2022-05-23  74  keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
492ef7829d2d09 Simon Que     2016-03-08  75  {
492ef7829d2d09 Simon Que     2016-03-08  76  	unsigned long long brightness;
492ef7829d2d09 Simon Que     2016-03-08  77  	acpi_status status;
492ef7829d2d09 Simon Que     2016-03-08  78  
492ef7829d2d09 Simon Que     2016-03-08 @79  	status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
492ef7829d2d09 Simon Que     2016-03-08  80  				       NULL, &brightness);
492ef7829d2d09 Simon Que     2016-03-08  81  	if (ACPI_FAILURE(status)) {
492ef7829d2d09 Simon Que     2016-03-08  82  		dev_err(cdev->dev, "Error getting keyboard LED value: %d\n",
492ef7829d2d09 Simon Que     2016-03-08  83  			status);
492ef7829d2d09 Simon Que     2016-03-08  84  		return -EIO;
492ef7829d2d09 Simon Que     2016-03-08  85  	}
492ef7829d2d09 Simon Que     2016-03-08  86  
492ef7829d2d09 Simon Que     2016-03-08  87  	return brightness;
492ef7829d2d09 Simon Que     2016-03-08  88  }
492ef7829d2d09 Simon Que     2016-03-08  89  

:::::: The code at line 79 was first introduced by commit
:::::: 492ef7829d2d09428803bffb187d5781bbc12ca5 platform/chrome: Add Chrome OS keyboard backlight LEDs support

:::::: TO: Simon Que <sque@chromium.org>
:::::: CC: Olof Johansson <olof@lixom.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D02D7DE1;
	Fri, 14 Nov 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106791; cv=none; b=YH1OzxHOIhicd6ntZ9aWPQdbtilBVHdSkVlRIMEKmvCxo78XjcKBsNzysSG59blVpQ0XGkzjRLtWbRXidYbpXVc2s2J2QEaOZA9kBjeVES8SWPQnaodF+wWPdFWIfAdAW1tzphntI4H/ETBG/ngQ7DYhZV/AzPaG427ALFwhg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106791; c=relaxed/simple;
	bh=Ugiw+8CpqA265ZRJP3r5j9bjsiFqYmRWm5CmslpIV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7uNzBCus7WDEPNiK4z/W9d1fd9jdy62RTZccQQqo0sQckaRaZp+Kbhc10KbOsAN8VH94tGRuN5VI79QL9XzbrXYSBlgaot/HQAZvZk3+qfoOVj60RyhB/1C0YRHRhlUHgDP0WebIpWBK8yAsXpPUcNiXbVaCJf4mxxKSdQadg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI/f30dG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI/f30dG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763106789; x=1794642789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ugiw+8CpqA265ZRJP3r5j9bjsiFqYmRWm5CmslpIV4o=;
  b=LI/f30dGfSOL5IQV4FDUX5soQxHLc3OZlaoIOlI+57bZswFGjO+vXH1U
   ESQ4+i8R6ad7EGBA9DzJzb+4a6GgNOXfcO7Smq76vXud1P6BvLwZ+gqdc
   JmHV6pdqADdGk2zyej+s0N+zNzdz7OjN9QamUWkJilTpf2qcA3FDn8YxJ
   JTc3fG0ezUl6pPCnoPYiBJqS1A9hKmQwx+ah24iIxDRc/eK3Q3yuExBYM
   V2sq07BoQvsXbT1kzWC4sRYWPe1bdvCOmHltr4WRuIyIX+EABCTFk711P
   QJ/ZXMHJytGXrZLSssyyNm+6w5wy6DmfSu0RMpOX7I+6AkF67w3sIS1LK
   Q==;
X-CSE-ConnectionGUID: 1aily3mdRWWuyivZQpchZg==
X-CSE-MsgGUID: 22t1SUJCTmSzCOVC7lnxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65232169"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65232169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 23:53:08 -0800
X-CSE-ConnectionGUID: Jw6UaTCCSg6fH5ANFcAJEQ==
X-CSE-MsgGUID: U1MJOfZERTGAVQvi3ohk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190497774"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 23:53:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJocC-0006Jp-1s;
	Fri, 14 Nov 2025 07:53:04 +0000
Date: Fri, 14 Nov 2025 15:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] HID: input: Add support for multiple batteries
 per device
Message-ID: <202511141515.7CEez9Uh-lkp@intel.com>
References: <20251111105634.1684751-2-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111105634.1684751-2-lzampier@redhat.com>

Hi Lucas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.18-rc5 next-20251114]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Zampieri/HID-input-Add-support-for-multiple-batteries-per-device/20251111-191143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20251111105634.1684751-2-lzampier%40redhat.com
patch subject: [RFC PATCH 1/1] HID: input: Add support for multiple batteries per device
config: riscv-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141515.7CEez9Uh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141515.7CEez9Uh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141515.7CEez9Uh-lkp@intel.com/

All errors (new ones prefixed by >>):

     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:20:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:20:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:20:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:20:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:20:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-input.c:2475:
>> drivers/hid/hid-input-test.c:18:50: error: incompatible pointer types passing 'struct hid_device *' to parameter of type 'struct hid_battery *' [-Wincompatible-pointer-types]
      18 |         handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
         |                                                         ^~~
   drivers/hid/hid-input.c:672:71: note: passing argument to parameter 'bat' here
     672 | static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
         |                                                                       ^
   In file included from drivers/hid/hid-input.c:2475:
   drivers/hid/hid-input-test.c:22:50: error: incompatible pointer types passing 'struct hid_device *' to parameter of type 'struct hid_battery *' [-Wincompatible-pointer-types]
      22 |         handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
         |                                                         ^~~
   drivers/hid/hid-input.c:672:71: note: passing argument to parameter 'bat' here
     672 | static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
         |                                                                       ^
   In file included from drivers/hid/hid-input.c:2475:
   drivers/hid/hid-input-test.c:26:50: error: incompatible pointer types passing 'struct hid_device *' to parameter of type 'struct hid_battery *' [-Wincompatible-pointer-types]
      26 |         handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
         |                                                         ^~~
   drivers/hid/hid-input.c:672:71: note: passing argument to parameter 'bat' here
     672 | static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
         |                                                                       ^
   7 warnings and 3 errors generated.


vim +18 drivers/hid/hid-input-test.c

a608dc1c06397dc José Expósito 2022-11-24   9  
a82231b2a8712d0 José Expósito 2025-08-14  10  static void hid_test_input_update_battery_charge_status(struct kunit *test)
a608dc1c06397dc José Expósito 2022-11-24  11  {
a608dc1c06397dc José Expósito 2022-11-24  12  	struct hid_device *dev;
a608dc1c06397dc José Expósito 2022-11-24  13  	bool handled;
a608dc1c06397dc José Expósito 2022-11-24  14  
a608dc1c06397dc José Expósito 2022-11-24  15  	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
a608dc1c06397dc José Expósito 2022-11-24  16  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
a608dc1c06397dc José Expósito 2022-11-24  17  
a82231b2a8712d0 José Expósito 2025-08-14 @18  	handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
a608dc1c06397dc José Expósito 2022-11-24  19  	KUNIT_EXPECT_FALSE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  20  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
a608dc1c06397dc José Expósito 2022-11-24  21  
a82231b2a8712d0 José Expósito 2025-08-14  22  	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
a608dc1c06397dc José Expósito 2022-11-24  23  	KUNIT_EXPECT_TRUE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  24  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
a608dc1c06397dc José Expósito 2022-11-24  25  
a82231b2a8712d0 José Expósito 2025-08-14  26  	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
a608dc1c06397dc José Expósito 2022-11-24  27  	KUNIT_EXPECT_TRUE(test, handled);
a608dc1c06397dc José Expósito 2022-11-24  28  	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_CHARGING);
a608dc1c06397dc José Expósito 2022-11-24  29  }
a608dc1c06397dc José Expósito 2022-11-24  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

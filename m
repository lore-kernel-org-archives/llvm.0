Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057E2FD7BE;
	Sun,  1 Mar 2026 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772335548; cv=none; b=Te//hZwq+v7oxQxhsjc/wS7aWlq+vmJG1SN49ICzgfNdKXm5FOAV428nJzLc/JcoBMH8jAckerCi/j91ycyjfCvTVI0NRHG2oFc7QXNXp2an6RyqoC0dheafQ2PXGOhkt4FsXrSRPmlGaLRdnikvdiyQTUWvM/Kyjm5bAe/1xTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772335548; c=relaxed/simple;
	bh=RhzQ3LZzwPkVYXc6nQPz1TpSyfdZr3vMiXd2xY3oJAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aPAMXiG47AHq05r0Jd02SbrL+UIaoexnb7VxrhyrmzuvICLFHjEVQeXzvOZPn3r2G3Nzxl9cdlqsPr6Qq/ontZpPSZChsJCaCm3W6J+NzqngD6OrP/NS6gmZc+aIAkgqTNS/AY1ItLbw1SN0ebR1LqyaH10j4kp/EcdMXWdHRW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq0GSNRF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq0GSNRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772335546; x=1803871546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RhzQ3LZzwPkVYXc6nQPz1TpSyfdZr3vMiXd2xY3oJAs=;
  b=mq0GSNRFYFj1oYzihGOLvmwxXIv5D7VyRlDxDtyKxdKdm4pWWdiHXrGd
   IpU+qAUGxGZyMdLPPCLsuoblpjovd69Faf6eTV5LrEiNh2x0lIBjG3eQ7
   jKJM0J4CtQhRu0aLiqUJ6+SKl6XQCYotldIbsHpN22/XoIvGoSChBvuAN
   LxAAL2lDUCtVSf1QDMVVu3yKmWcz3Kf/qtAbgEXSmKP6XeDnNlesbKiD8
   QjA42vgMQkBfjb0GqEZh0ry0kErdTQXjGpVdc9zv35CxPcmCPtGYtwLjM
   WNwXuH4yYgU4bHhOR1RuvAqVB1Y/9ZcyeALW+lHTq0WRRY3dA5/iUOlHA
   w==;
X-CSE-ConnectionGUID: QfbKw1gcR5qNgbThA1nhdw==
X-CSE-MsgGUID: uwOB0fklRsqxYbVXJj9mAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73444424"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73444424"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 19:25:41 -0800
X-CSE-ConnectionGUID: wQcd/xxLSvCEUaJQBRPg5w==
X-CSE-MsgGUID: CrW+YH30R3CVeCOQbXMmeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="216521234"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2026 19:25:40 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwXR3-000000001F9-1kPx;
	Sun, 01 Mar 2026 03:25:37 +0000
Date: Sun, 01 Mar 2026 11:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 3/8] ld.lld:
 error: duplicate symbol: acpi_dev_found
Message-ID: <202603011102.CTx6UojI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_kbd_led-cleanup
head:   1f8a06bba34bbd4d190a7c78f4f81d6a58f7489d
commit: 2b182d193bb941d68d765d0e973c8494338794f0 [3/8] incl
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20260301/202603011102.CTx6UojI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011102.CTx6UojI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011102.CTx6UojI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: acpi_dev_found
   >>> defined at 8250_core.c
   >>>            drivers/tty/serial/8250/8250_core.o:(acpi_dev_found)
   >>> defined at 8250_platform.c
   >>>            drivers/tty/serial/8250/8250_platform.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: acpi_dev_present
   >>> defined at 8250_core.c
   >>>            drivers/tty/serial/8250/8250_core.o:(acpi_dev_present)
   >>> defined at 8250_platform.c
   >>>            drivers/tty/serial/8250/8250_platform.o:(.text+0x40)
--
>> ld.lld: error: duplicate symbol: acpi_reduced_hardware
   >>> defined at 8250_core.c
   >>>            drivers/tty/serial/8250/8250_core.o:(acpi_reduced_hardware)
   >>> defined at 8250_platform.c
   >>>            drivers/tty/serial/8250/8250_platform.o:(.text+0x80)
--
>> ld.lld: error: duplicate symbol: acpi_check_dsm
   >>> defined at 8250_core.c
   >>>            drivers/tty/serial/8250/8250_core.o:(acpi_check_dsm)
   >>> defined at 8250_platform.c
   >>>            drivers/tty/serial/8250/8250_platform.o:(.text+0xC0)
--
>> ld.lld: error: duplicate symbol: acpi_evaluate_dsm
   >>> defined at 8250_core.c
   >>>            drivers/tty/serial/8250/8250_core.o:(acpi_evaluate_dsm)
   >>> defined at 8250_platform.c
   >>>            drivers/tty/serial/8250/8250_platform.o:(.text+0x100)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

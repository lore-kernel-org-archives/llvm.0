Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADB430BBE;
	Sun,  1 Mar 2026 04:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772341127; cv=none; b=QqifY1LGkrYVc9nfLeaor3jvOdYX+r6tSIdIJq6P2OqCAz/r/4dUjdN5Bq1KtLdnsmp/1nAz+wUFqDRupudXgaWXNqLGKuB4/HEpHvRFkBc0IOrT+11U4iXwqgsMYPg3/GDtwYGllfnxGYp79KCPRwx4906pDKgg++79grhW6jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772341127; c=relaxed/simple;
	bh=9mgtMEov0urAmy9lMnXCLis1jYtTfuqUM8LzYy6hQiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xepl+FSpe0k9ZnBbPdMvk9cK1yYt2Dy/RUniU1vqqD8lbE57+5Kwf54LUim0Co6a3hdOpoV7No+4LQJc57lD+/eqhyGUc5vwvqooTnb4E1MqAXxiBrNENA5tqOFWyHxgEq72hfE4TSk/8ZXx4yhUHz0qUp+VHPJI+rAr7L+tqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BN5pOrwG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN5pOrwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772341125; x=1803877125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9mgtMEov0urAmy9lMnXCLis1jYtTfuqUM8LzYy6hQiA=;
  b=BN5pOrwGAKVQ/TEzumMuwEHxYCEAA1zsJTBoyMoDerIegTjcmovo270g
   AL3q0gUgZTmROyQ9BSksmSD/M1uIIT380DcoaX1Lklaf4proGckJJPnCZ
   HBHbkNJ7oXCE/HeLqJQj4/FHHz2J311TpPMkpA0K4J+/vzyjhZ1kSVFph
   ki90tvtx7n7/fVc1xJh/CugSREdHj/PZxXInB3F0HHX/cjXslykBlvF6h
   78FLVeAdL3WPf8/EU0ywF1b2J4Tt7wf4+Fop6g0XIwd5hGFw9NzFDdB44
   5bFYL/GrFJYC/9kinXjk9xLMZrJ/vVxPb6lLAf3ndTokfbkIf8l3Esu67
   Q==;
X-CSE-ConnectionGUID: oGjdcmE6Te+AztPR/OwiaQ==
X-CSE-MsgGUID: yQcWGIldQtabV3pZyv05xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="98850558"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="98850558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 20:58:44 -0800
X-CSE-ConnectionGUID: Qx5zdoAuTYOPCttTHdaEwA==
X-CSE-MsgGUID: xIAtFvFVR/amoJVA7CyEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="216533540"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2026 20:58:43 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwYt6-000000001Hl-1lCg;
	Sun, 01 Mar 2026 04:58:40 +0000
Date: Sun, 01 Mar 2026 12:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 4/8]
 drivers/platform/chrome/cros_kbd_led_backlight.c:218:36: warning: unused
 variable 'keyboard_led_acpi_match'
Message-ID: <202603011248.jxkOdb2d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/cros_kbd_led-cleanup
head:   1f8a06bba34bbd4d190a7c78f4f81d6a58f7489d
commit: d98418ac5bb0a650a30c4efcfb68b21d4dc41f37 [4/8] CONFIG_ACPI
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
301/202603011248.jxkOdb2d-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260301/202603011248.jxkOdb2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011248.jxkOdb2d-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_kbd_led_backlight.c:218:36: warning: unused=
 variable 'keyboard_led_acpi_match' [-Wunused-const-variable]
     218 | static const struct acpi_device_id keyboard_led_acpi_match[] =3D {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/keyboard_led_acpi_match +218 drivers/platform/chrome/cros_kbd_led_bac=
klight.c

492ef7829d2d09 Simon Que        2016-03-08  217 =20
6b1e5ba39c4444 Tzung-Bi Shih    2022-05-23 @218  static const struct acpi_d=
evice_id keyboard_led_acpi_match[] =3D {
6b1e5ba39c4444 Tzung-Bi Shih    2022-05-23  219  	{ "GOOG0002", (kernel_ulo=
ng_t)&keyboard_led_drvdata_acpi },
492ef7829d2d09 Simon Que        2016-03-08  220  	{ }
492ef7829d2d09 Simon Que        2016-03-08  221  };
d98418ac5bb0a6 Thomas Wei=C3=9Fschuh 2026-02-28  222  #ifdef CONFIG_ACPI
6b1e5ba39c4444 Tzung-Bi Shih    2022-05-23  223  MODULE_DEVICE_TABLE(acpi, =
keyboard_led_acpi_match);
6b1e5ba39c4444 Tzung-Bi Shih    2022-05-23  224  #endif
492ef7829d2d09 Simon Que        2016-03-08  225 =20

:::::: The code at line 218 was first introduced by commit
:::::: 6b1e5ba39c44442c5ca115d89056823e064f1796 platform/chrome: cros_kbd_l=
ed_backlight: separate ACPI backend

:::::: TO: Tzung-Bi Shih <tzungbi@kernel.org>
:::::: CC: Tzung-Bi Shih <tzungbi@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

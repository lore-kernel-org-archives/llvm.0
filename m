Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87B3438BA;
	Wed, 20 May 2026 00:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779236111; cv=none; b=Ej06ZqcOwCErZUPYAKh7fJrNLjzi3dU5797tRO+vsZSs5mn8VngaimVwjg2Mt/hK6y6kaQyK4NxVJ3pf0gmR47u96xO0xIXPkYoy/gpx76kzF/vek+icsx71MKmGFhEHra9E8prF4aqUpsYTpRHuWGSGKLQknaKyVAUqNI+BJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779236111; c=relaxed/simple;
	bh=yHU62qtJe71z+n2NYo3c6O8G3pL7GxIMIn8WBIqI5gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hQlkY9crxE9Rf5nwPI09Pct2SG01j+KuvFF5I+zKY0mEOLJUntJ/gPiTkZerd802kMq3Kjo6e5E8LkL2JkDOtZM0zxTeEg0ArQ+z/8X3geFtk9lCJEtGcVFexrEJvwreIwMhp/wTZGJe8Es3EYrJXMKmYurOet04HQAGvzUpH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS8esRgS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS8esRgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779236109; x=1810772109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHU62qtJe71z+n2NYo3c6O8G3pL7GxIMIn8WBIqI5gQ=;
  b=ZS8esRgSlLNOqRpjW181UKYyMIWcfOglGF3W619YsE1FGQrO4EThLro/
   Wx92LiaLQ4C6TJflXDt4Yv3WbeiaMAC4/7XMzmIzYVOqLdktbFAQd1pgn
   BGGPZEQzp1NieHtBUJ/LEvoN5622jGHxqdXponiempafSL/UxJeSEbYiL
   FsRumAjsubuajSkCR46BM/ON/mDDULEuW+mBSOYzgr45VbSsgRss7Be+o
   5hKokFX6ce+Z3jH9rWuCjdcTcGJ35dR7TuY3N/zBGuxA3/E5eJuk7ZHCc
   MYKjZr41ehnE6kNCF1smCvxmW4BAHhu8qK+QSN9vpOBvpYcrH9fo8eWz6
   A==;
X-CSE-ConnectionGUID: QCZ/4AJaSbOnQpq8kX0mOw==
X-CSE-MsgGUID: IutDiibPSpaVbugwVXnmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80161415"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80161415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:15:09 -0700
X-CSE-ConnectionGUID: RsERq4XOTrS+/uUxR3uQww==
X-CSE-MsgGUID: UV9jfy8GQC6JvDOtU+2ImA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278066026"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 17:15:06 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPUa6-000000002CX-0lRq;
	Wed, 20 May 2026 00:14:51 +0000
Date: Wed, 20 May 2026 08:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_ec-leds-hw-trigger-brightness
 2/2] ERROR: modpost: "led_trigger_is_hw_controlled"
 [drivers/leds/led-class.ko] undefined!
Message-ID: <202605200844.SV3OteT0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_ec-leds-hw-trigger-brightness
head:   bb58e805ce231583c1b73405eb7f9afd60eeab1e
commit: bb58e805ce231583c1b73405eb7f9afd60eeab1e [2/2] leds: core: Report ENODATA for brightness of hardware controlled LED
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605200844.SV3OteT0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200844.SV3OteT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200844.SV3OteT0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "led_trigger_is_hw_controlled" [drivers/leds/led-class.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

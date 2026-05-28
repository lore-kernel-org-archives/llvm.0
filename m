Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C951A3157;
	Thu, 28 May 2026 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998946; cv=none; b=fB9EyLxdrPzgV0qqvGgEsjb9V4rWLKqAicEt2mdFCndBuqhBzyuN/A99bgAGrrpGZJXdMS3Qg7dmne5g3/gygXnP8oGE6fYC+Vkop0BRr5EVRcmrJrOnwj5EyfOD2z3OEDj/D8x0TLc1LBOK6BKr8gtUOvUa3zgQ2GumSMCvTpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998946; c=relaxed/simple;
	bh=0Y86ag6Xquz23Z6E95qv3olZvI4U0HmZDWDPLIMUW7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XmZGSGuzpObUNlutViuFUMh4Z8SJepj7mQRzTYnJcLWLxfwN5UchbrK8BnKcAG+8k+eeXEDfMsymjHZxA2MvXwxdxDu0r86RC5O/0duwHEDX0b/UBxzMy85YMI6UDOlvM9ind9A5dGXQ1pkFzUJ7Nd7J4beiYeXn/nCYIhG9iHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WB6lajYO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WB6lajYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779998945; x=1811534945;
  h=date:from:to:cc:subject:message-id;
  bh=0Y86ag6Xquz23Z6E95qv3olZvI4U0HmZDWDPLIMUW7Q=;
  b=WB6lajYOH6+/TnpdMEtiVbou71ZwvMpkHqktWGBv4qs5S9gfWzUaw9dU
   LzqyJRaLtoL1cYdRYJKNakXJb4sfdbbIMrHo7tewkv7V7AmJGVYh+btQ3
   Xx8F5/D9DqVf25sNme/Ok2xY520e2ur3yRpo1H9NpfpUNP80ATK5YCgYi
   BICVT/oVvqJzVoGzL+LTODN/AVNJOzK/Lzu36DEgToeHVB5SilW0xTka1
   oVF+6hOi0EkoaNaki2pmHXzf0nvNwu25w9t+hBmN08YWxVVGoervCFNmd
   eY5UbZ3T4B82+vqf00Id5ji2rsvDDYd6T4RKDD0TlKqvNQOtar6y/H1Fq
   Q==;
X-CSE-ConnectionGUID: 1YmKhyB2QXmbdhpwxqVB1w==
X-CSE-MsgGUID: oaFN8LGJS7Kgv4ZWM7h8ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="83428061"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="83428061"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 13:09:04 -0700
X-CSE-ConnectionGUID: 4F3xrGm6Q1ql/lSjQ8XQCQ==
X-CSE-MsgGUID: fNFN1QNJQ8aPU8OQ2D8LCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242804676"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2026 13:09:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSh2J-000000006PS-3DXp;
	Thu, 28 May 2026 20:08:59 +0000
Date: Fri, 29 May 2026 04:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [thermal:thermal/linux-next 8/19] ld.lld: error: undefined
 symbol: meson_sm_get
Message-ID: <202605290447.GyBPtFsK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   3929405c64376a8a54c794e8a4485023b108a97e
commit: b21d88de69184c1dc82d85859aeb34a6418b96e4 [8/19] thermal/drivers/amlogic: Add support for secure monitor calibration readout
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260529/202605290447.GyBPtFsK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290447.GyBPtFsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290447.GyBPtFsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: meson_sm_get
   >>> referenced by amlogic_thermal.c:196 (drivers/thermal/amlogic_thermal.c:196)
   >>>               drivers/thermal/amlogic_thermal.o:(amlogic_thermal_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: meson_sm_get_thermal_calib
   >>> referenced by amlogic_thermal.c:205 (drivers/thermal/amlogic_thermal.c:205)
   >>>               drivers/thermal/amlogic_thermal.o:(amlogic_thermal_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

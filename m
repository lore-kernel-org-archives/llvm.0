Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7C353A6D;
	Sun,  4 Oct 2026 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791151443; cv=none; b=IYWXv0+zBD6Vb1KdoyaB11lbbGXwxT0usHk0k84Kuzfg4tHJyNnOfnLAIvmrqUcrwM4u6SUECGXBdkAlJI2c8ZYwq1crRRN12PwgL0j5JNxOem+UXGAdTpTEwY/zGux6yCXH+Gz8HPZXIdDyTR2JZv+/OunnRMEGSAsVbY+IbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791151443; c=relaxed/simple;
	bh=OYncZyWlgurZajrfhAJgPQQ5zbIU9aawOtL7dvK/Xw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B7QVp27XKGQILeYC/+f9BxEi13Km1G0BgB+B01Rr3dn1wjIHJ9rHChHg/VsLptUuAf25+zgndNuS8yiAIuPipZqN9kmi6T0oRj232/Z6lq2WSAKcjk6D3TpC+NQmIx8w88Ss2KoQqtU9gbFh0qxgXypPiZjHEVo1q0j4XlPKfuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd5Coiei; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd5Coiei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791151441; x=1822687441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYncZyWlgurZajrfhAJgPQQ5zbIU9aawOtL7dvK/Xw8=;
  b=Yd5CoieiODolLVR6nkt7p5qkaVKPOHGeLn/x7mvi9rDdFI9ngGU4gBjP
   Oo6M4raPxcBlRYGcqUFSUUejdmHP84y/7vTuoyLVN1lol7Fj0w5AfAV4T
   b+takH+YqoGpSZHpbjgp2GF4KUllP5gR/MH0Hq3OOGVQnqFy1udWsK9/8
   Yic2TjpidRyXMqv8UMiuGNTVjXfxXyf5eqfCh/kTDeRvMKJZtN2zWsr3+
   +XPmB3fyD1K+3JtGiqS735lk4xBnXWPl21zxhMqjNsA37e5/bgeW9YBm9
   OjJriaCB6yMKqXUCq9Jl/Tgt4wB8fsVniSbtzd6L14FGGTonrl2XGGjaB
   A==;
X-CSE-ConnectionGUID: pnscoQI3RyWIKbAt4Za6Hw==
X-CSE-MsgGUID: Qzfzb/BcSv2dSUNf81c8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91034317"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91034317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 15:04:01 -0700
X-CSE-ConnectionGUID: QUn2CHRATI+2gFh2VPIN/g==
X-CSE-MsgGUID: oDyJkbRvT52YmuJK3dub9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276814819"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Oct 2026 15:03:59 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDUJJ-000000000R2-1V05;
	Sun, 04 Oct 2026 22:03:57 +0000
Date: Mon, 05 Oct 2026 00:03:35 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-kunit-assertion 11/13]
 lib/kunit/string-stream.c:111:47: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 2, 3)' attribute to the declaration of
 'kunit_string_stream_add'
Message-ID: <202610042350.99INxpQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-kunit-assertion
head:   f72cd14d37a9483b1e310e75dc9e583adb82a6d2
commit: 99770826688f8794d7f46b2d703adf3270ed8744 [11/13] prep: string stream
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261004/202610042350.99INxpQ7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610042350.99INxpQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610042350.99INxpQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/string-stream.c:111:47: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'kunit_string_stream_add' [-Wmissing-format-attribute]
     111 |         result = string_stream_vadd(stream, fmt, args);
         |                                                      ^
   include/kunit/assert.h:232:5: note: 'kunit_string_stream_add' declared here
     232 | int kunit_string_stream_add(struct string_stream *stream, const char *fmt, ...);
         |     ^
   1 warning generated.


vim +111 lib/kunit/string-stream.c

   103	
   104	#if IS_ENABLED(CONFIG_RUST)
   105	int kunit_string_stream_add(struct string_stream *stream, const char *fmt, ...)
   106	{
   107		va_list args;
   108		int result;
   109	
   110		va_start(args, fmt);
 > 111		result = string_stream_vadd(stream, fmt, args);
   112		va_end(args);
   113	
   114		return result;
   115	}
   116	#endif
   117	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A082F5A34;
	Tue, 19 May 2026 04:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164834; cv=none; b=Ry4YF0aC1cQCkmg7clL7jv/uTH2ImbCshzsv0/PXea0+IRy4rPh3QcgT663WPYqOT1Puzp1tdQR+I25jpmWlZTiPz7+Jk5ZWZaYoZYoUFxL9GzQfdM8fnhKmBnveKZLUoBNH/DLlhGd01KcwjOS5FwMOb9kIzim4BYbsbgYIm7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164834; c=relaxed/simple;
	bh=xc9h88eZ3BmKn4I4W32n0DPxYm9Tw3GD20DAXQfyy2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ukcxW5SkxMj6J5Vmk70F4ImNdHJp6FLU3K7ZW07l249aoCZtpA6OWAkGL0KTga52D825SEXqQEgd3YHGYSSuozR/OaIYOIrndJNhYkjaweCnkq7SP6dDxPXZq2fmHg3IJ9K+HucQ6gHfaxWHEzbMY/VVU+xMsyCK+KKoiD1ChZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPsFPicw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPsFPicw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779164832; x=1810700832;
  h=date:from:to:cc:subject:message-id;
  bh=xc9h88eZ3BmKn4I4W32n0DPxYm9Tw3GD20DAXQfyy2s=;
  b=UPsFPicwEq6gjgmfoMhRKRuCoLPu736FT1YKSr2MaKVLRNDVBPgIzO5z
   xtey3O6ViaABpQxNXJmbh9fqDNxMVspNQ0QDiUv/V1O/JKHERie2tMZDm
   LgmeXOpAWi0qcyBMCyrzQwB5S0bT9TpUmJ5zVNsTi3RhzVM++3hODti58
   92fDZHbPcF4PwwXFRnLO6JIqYH/6f2q1Y3Nl2YH551hS1w7AImTeOXWOl
   KTZ+wHSYrftLlrxDu9zg9tt0gWW2ArTjaCab2MIu1vKOEg6ue6sHTwbGg
   Wc76mgerK9VAXwZpjfZJdrHL3zDXGRJaUeIT0dBC+URtxsvgquHAyBiIa
   w==;
X-CSE-ConnectionGUID: 0DFgPjcrSj6NvJagY3Hf9A==
X-CSE-MsgGUID: TELom3vMSD2gA5ZxmFt1Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91426681"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91426681"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:27:11 -0700
X-CSE-ConnectionGUID: SgOX7xbiR8mpDBNDjwGpJw==
X-CSE-MsgGUID: wG3E3x0jS7aoDKCx4lrvmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263166186"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2026 21:27:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPC2u-00000000A4v-20FO;
	Tue, 19 May 2026 04:27:08 +0000
Date: Tue, 19 May 2026 06:26:10 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] kernel/time/ntp.c:370:5: warning: no
 previous prototype for function 'ntp_get_time_offset_ns'
Message-ID: <202605190631.vGxyCPsE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260519/202605190631.vGxyCPsE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190631.vGxyCPsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190631.vGxyCPsE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/ntp.c:370:5: warning: no previous prototype for function 'ntp_get_time_offset_ns' [-Wmissing-prototypes]
     370 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         |     ^
   kernel/time/ntp.c:370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     370 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         | ^
         | static 
   1 warning generated.


vim +/ntp_get_time_offset_ns +370 kernel/time/ntp.c

   369	
 > 370	s64 ntp_get_time_offset_ns(unsigned int tkid)
   371	{
   372		return shift_right(tk_ntp_data[tkid].time_offset * NTP_INTERVAL_FREQ,
   373				   NTP_SCALE_SHIFT);
   374	}
   375	EXPORT_SYMBOL_GPL(ntp_get_time_offset_ns);
   376	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C041D45FB;
	Sat, 26 Oct 2024 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945506; cv=none; b=E67bRtpFQW5txWyPfPSeozD2FSnk6B5Dv5QZNUGs4ryYTRGpnx8ul57icCJcNLT8Qpi5Ml7WkscEsZ+vh8bq5TVKVcVD0XviLUV+Wl7OQGYOUetnMqDgbK+iAxWqbcG36+rw3Npdcyb8CU3iilXzRtzX1QI7asNJgpw30tlljIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945506; c=relaxed/simple;
	bh=qnmNKZ/FWWyN6qSwQvOP2dxddlyLO0EocdPri5cf4Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvx4k5Cfc1vkR3vrgGS5iwpCGsCKZNl7E0wtGLCvwgXJX4VN7S1Eex9uBLYdSME5g4FgbgN53LyJrC1XLBIrF4/e4J8gSyqsuyfwT4spOHy2hTTE59b7l8lBMXVndOoUw+OB6atxuMxmP0Wc0geCJTD4Y7+6sGgzTJRUbaJ2/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEX/xDO4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEX/xDO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729945504; x=1761481504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnmNKZ/FWWyN6qSwQvOP2dxddlyLO0EocdPri5cf4Yg=;
  b=kEX/xDO4zgus4q38hoxilxGrozYZfAsPV4/g50qd73Wg6ei6BMwQvtuU
   Gb000E44Qxz16XwdburEmmYh4MDTUElikznY0VKElKtKpX52kTd6YZfok
   k5xquimpk6XOeNC4SvL8NjfndxTpHAARZAkUUj2G3vqFySnrgsQEx+tc3
   mjurRTitOHKY7L2y3IH6wFLn2FIqlzIRchvXuLsDxTFwXBOlk62e2e2KU
   /sTEMPiNnyxxkTGjp+2AhBPaT1i8Kh7UyPl3LzYN/hZj/CQVWCh9Blji/
   aYDdjq9Tu1Jb5jUbAasjnbc0FY0BWJTpziigVJDIEIr9kQ4PaocSFgwOz
   w==;
X-CSE-ConnectionGUID: Ajk2LNv6SZOBOsWOBtyR4g==
X-CSE-MsgGUID: d6zovvy8T9CUc+l48n8XzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40979086"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40979086"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 05:25:03 -0700
X-CSE-ConnectionGUID: rebcLCbdT6yISfABw1fTpA==
X-CSE-MsgGUID: FIuAKFJGRfm51cvKssWBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="118656067"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2024 05:25:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4fql-000ZdU-2A;
	Sat, 26 Oct 2024 12:24:59 +0000
Date: Sat, 26 Oct 2024 20:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 5/5] asm-generic/io.h: Remove I/O port accessors for
 HAS_IOPORT=n
Message-ID: <202410262023.Vw4meDWp-lkp@intel.com>
References: <20241024-b4-has_ioport-v9-5-6a6668593f71@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-b4-has_ioport-v9-5-6a6668593f71@linux.ibm.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Schnelle/hexagon-Don-t-select-GENERIC_IOMAP-without-HAS_IOPORT-support/20241025-015802
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241024-b4-has_ioport-v9-5-6a6668593f71%40linux.ibm.com
patch subject: [PATCH v9 5/5] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: um-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241026/202410262023.Vw4meDWp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410262023.Vw4meDWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262023.Vw4meDWp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT
>> ld.lld: error: call to _outb marked "dontcall-error": outb() requires CONFIG_HAS_IOPORT

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B21E487;
	Sat, 24 Jan 2026 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769298283; cv=none; b=CaXy5bRxbSR/mpP7LOsLkZdxdhigDTUnRQhBO8jTI2JHeQWhcmh6XXSD+oPf5cSTzJm7aGzsU+EY4xjWjtwCizaDpvQgtvr9MV9YRQDErnnlvNKqwWEmNpPNv7N0ID9PfPKZov7z3Ls3wZpjbWOAvu7ISo3m3GwAz7/VedXxJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769298283; c=relaxed/simple;
	bh=MxMElC/ExOdQm2uMY4FxpUVLxkabgjTXQRXJlO1ryf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BM9TyaJuR+S0Rj9s/QSc1pKdSLJ/Qe5DvaUx1YhyGoaPAMuVJawvfIpakz0iCpY+/f4uuM6tNLYyl9t6oAF4ljtbHgQYt6YpyYcI4PF8u2nSGgJMQbaevkHKGxTN3dNWnxP4kk7gGyHlC7VGNqVz8V0qBThUeOamD6BTB0lSWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HU05WYHp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HU05WYHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769298282; x=1800834282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxMElC/ExOdQm2uMY4FxpUVLxkabgjTXQRXJlO1ryf4=;
  b=HU05WYHp3yjNTtgwrpxOkeg+btkxhKFD9SWDfG32x4s4AcdQh6DFU07Z
   hqJsV7Pk3il24JXpOG4owli9xA4A6gjit+kayA7nlGsXFc2iz5/nmZwIn
   2mh727w04H7tAYNYgD2KYvsH2qNgJbqPOE7unebABGnMw8qq3p8R0rsDW
   jnvirNYNaeGMOnQdi/HNYzLKxkzaGgsLeJuRbYNzzaJdrU6UAFz23IU1x
   IkAHPgMQWMv4Tt+OXI/+9Jf09/Uh+b4pN+N2wXgN9+2BN679bgcU8cOaa
   WcL471S2zR7hg7HBiMQnc1QjVtI+KUj5dnjDS5Eo1sp99g9loonTruTbY
   w==;
X-CSE-ConnectionGUID: 1YAH+nqITGmAUBDTm5F20g==
X-CSE-MsgGUID: h3J9vbzqQAeT4qR1IqB1AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81948796"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="81948796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 15:44:41 -0800
X-CSE-ConnectionGUID: KY33xq3cTLuNqhwWcSeroQ==
X-CSE-MsgGUID: c3oAgL5ATIqg+HwQLstb5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207688070"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 15:44:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjnIz-00000000VcK-0yz7;
	Sat, 24 Jan 2026 23:44:37 +0000
Date: Sun, 25 Jan 2026 07:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 3/7]
 usr/dummy-include/string.h:1:9: error: '_DUMMY_STRING_H' is used as a header
 guard here, followed by #define of a different macro
Message-ID: <202601250746.aYp5yuYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-uapi-libc
head:   42f8899f5959bce93a899d194c5b14d2a809bd31
commit: c2504abf729a15f7df4bff328def344426a2b6da [3/7] dummy includes
config: riscv-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250746.aYp5yuYE-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250746.aYp5yuYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250746.aYp5yuYE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/cec.h:12:
   In file included from usr/include/linux/string.h:7:
>> usr/dummy-include/string.h:1:9: error: '_DUMMY_STRING_H' is used as a header guard here, followed by #define of a different macro [-Werror,-Wheader-guard]
   #ifndef _DUMMY_STRING_H
           ^~~~~~~~~~~~~~~
   usr/dummy-include/string.h:2:9: note: '_DUMMY_STRIGN_H' is defined here; did you mean '_DUMMY_STRING_H'?
   #define _DUMMY_STRIGN_H
           ^~~~~~~~~~~~~~~
           _DUMMY_STRING_H
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +/_DUMMY_STRING_H +1 usr/dummy-include/string.h

   > 1	#ifndef _DUMMY_STRING_H
     2	#define _DUMMY_STRIGN_H
     3	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

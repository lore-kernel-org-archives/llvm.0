Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427ED60EF9;
	Thu, 11 Apr 2024 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712799785; cv=none; b=h4Nk90GiFRwkIjTj7+1ZuSa9QysdsHVXdzLmefWaBv5F7WqQO3DArugqgbTTlysoWjbdIlGNs6kIK0Q0vG1unzZJPToDhFZ7MKFSzDwGEs5m8mOJc8geiKG/TXcvQzglqEtxhGjYLF1xnsClYAjFeLXHDdXv64MKs7ymFVFis/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712799785; c=relaxed/simple;
	bh=hoJ/Pv0YyXpskXC5/6lL/iLRY/OyR9NkXVb3BMeV11c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvruyd3nneYFVcVEzqP4hoDAD6VduwD5f4embCtJwjpH+3piMdej2bKGJwPQ48wVFfP24moLpwGCGaZSnjVFuZercqu5PAm85IvjxxQTbQgODKCfNv0ZXKigT4/DX9jgCsECIGLpnfDw/OBzASCDLggtckhHCx4MGIDiTo/Kx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MafPfLot; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MafPfLot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712799784; x=1744335784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoJ/Pv0YyXpskXC5/6lL/iLRY/OyR9NkXVb3BMeV11c=;
  b=MafPfLotM0L5cwm6SIJBjnd7At+UmI0rQocFD8hgABsC/eQ57mPM9qun
   vCyydtAC3EZReklpvpUozqwAsBcO6xOZVucA3YcX9m8jCuYM1LshZK56d
   lHtO3FKQjYC8fId1oht7VYh3sBDxmAJ4umbFrNzQ5HJVfF/Vm0oLACr/j
   6a++YeskxEE9xUT0tjUME8H/Ym5Ae6kF92M9gQI5wnktGKe77AIzbcFhK
   7PllO7FH5h38ElTtNG2PLyqhmWH5L1GxToXsfHQ4S4DUkn2RkcjHAxuxG
   Uo8QWJU4HoL7UHo3pnffesdqEO0vLm/2vSxa+LEQUyuQsmMA5eElMIbEa
   w==;
X-CSE-ConnectionGUID: CE5NqXtZRY2JtHeKLs033A==
X-CSE-MsgGUID: J+oBsEtkRXmDai0f5VNWGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11972394"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="11972394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 18:43:02 -0700
X-CSE-ConnectionGUID: 4RxbIvMmTEu4dWWn3DeP6A==
X-CSE-MsgGUID: 8N1fNzEjRa+AhaqMtWQBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25405138"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2024 18:43:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rujSs-00085y-00;
	Thu, 11 Apr 2024 01:42:58 +0000
Date: Thu, 11 Apr 2024 09:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: [net:main 2/2] ld.lld: error: undefined symbol: r8169_remove_leds
Message-ID: <202404110940.nOM9bJvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git main
head:   19fa4f2a85d777a8052e869c1b892a2f7556569d
commit: 19fa4f2a85d777a8052e869c1b892a2f7556569d [2/2] r8169: fix LED-related deadlock on module removal
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240411/202404110940.nOM9bJvF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110940.nOM9bJvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110940.nOM9bJvF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: r8169_remove_leds
   >>> referenced by r8169_main.c
   >>>               drivers/net/ethernet/realtek/r8169_main.o:(rtl_remove_one) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

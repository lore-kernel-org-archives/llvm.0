Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B13446A0;
	Sat,  6 Apr 2024 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712425066; cv=none; b=L/Pdu7L3d4oqvzK/x2nBPhQtD+Z0ZH8zPch0Hupf4qnFjDpWGM2dC2wGiztHxdNKbHrHrbNI94hDwGapQDQg1xxyLpdQEG0KLE7VABcXgXBXFgyTLWbcdp8ctm16n+5n7Db6iyflzVwrFlHzgNtU2gt3P7/X5NUcKnkweKGmF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712425066; c=relaxed/simple;
	bh=19uVdfL+EX41ApFyzvHi/X5zi1j2O2EONq+3NpwzYXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTsATEDt/SC/SqHqiz5aL8nqst4yd8O4hwM0166TW5Vb1F2uu01yh38IT0CWmWHh58ifcgFcn4eOv7633pDMGm7FpQsR5I9Nf78gtLv3iHvoTW+hEg7Z12h2DzUBcKuFILskFk5RGripq9wbD/aq/iEwafE/f+4tMu6JJEteg7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmNCQWCw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmNCQWCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712425065; x=1743961065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19uVdfL+EX41ApFyzvHi/X5zi1j2O2EONq+3NpwzYXk=;
  b=UmNCQWCwiM6SI9Mtc4pXSD1ZwmDDQjLO8youEE7uzD0rctuLG4XHT5qn
   K/Vr5gs1pIxFm8QFb8eg53JE+eabo9r9XKqLJWljt8C1f8S/wD6y4aGVG
   5XxU2OHkLvKYWRlvDZLzpoMtKpmcWBrd63hlb4Rdqye3qdn716HUmpX/J
   sl3+qpxSFmqnzMD/gaM4w3SIFeKsnURbEpUFACgTVKTAIP9wUTP7TYq6m
   BQfWyl329gSy4rF5sLOGaq+XhyeM4FiTEBe8iF6pPOo3wKRz/JjZcvqM7
   pFUx86trPl+qK7ejyFKihaFaSfnfh+HrxV9hlUHrirPkiQBj9/QQHdqnO
   Q==;
X-CSE-ConnectionGUID: QfWeA2m3Ta+XRvt5rPvlSQ==
X-CSE-MsgGUID: li0vupAFSbSXAR/mwVXIOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11513950"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="11513950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 10:37:44 -0700
X-CSE-ConnectionGUID: 6DWphFNhTx6F0yAjIrSEIg==
X-CSE-MsgGUID: kH8ePQwcRba0h00Da/f0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="23958778"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2024 10:37:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt9z2-0003io-39;
	Sat, 06 Apr 2024 17:37:40 +0000
Date: Sun, 7 Apr 2024 01:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 61/66] ld.lld: error: undefined symbol:
 __get_user_bad
Message-ID: <202404070139.iR6dc6kY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   86bf22aacb4afe50b74f567a62ae4deff198eab5
commit: 7f246d8d9649d5f40683ce07f98c1a134fae4b4c [61/66] bcachefs: Fix BCH_IOCTL_FSCK_OFFLINE for encrypted filesystems
config: arm-randconfig-002-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070139.iR6dc6kY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 233c030dcb18880d5f0a749573f11f96f35e76b8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070139.iR6dc6kY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070139.iR6dc6kY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __get_user_bad
   >>> referenced by chardev.c
   >>>               fs/bcachefs/chardev.o:(bch2_chardev_ioctl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4D4B0497;
	Mon, 17 Aug 2026 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968754; cv=none; b=TXmcWItV5Wn0/33cMQNwWM2I8MZuErBmhqtw/DQlSn0GQ5VjVURQALFx/cF++iiW3YWQGPAsiQVJCT6bNbojzXGZ2QTDHB43IxgYZjXKmyovzdUz49RIavpHg2bcOuYvlXivla3PdfseyWBq8BBHHschhTsIzhDgXVLY4h82QCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968754; c=relaxed/simple;
	bh=tHKaGYnJ+I4ccwx0KNvEv8cR6awfYaf34iY//rourtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hQEWLhpMrOve41XqIbTomkecQOIeel+LLuBPvS72+JsqI1WOnaiO1dviC1P0eTXQIUGzyJP9VZ8uAVPqeUJlGEPItiqE/9nCPf8bDIXSqK55Le2JlVdWe2qopJD/4l6bYf5LqXPxP/F6D/g9KUFU7U6FqiOjMIMdTGKlRhkpV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKEq8sMb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKEq8sMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786968753; x=1818504753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHKaGYnJ+I4ccwx0KNvEv8cR6awfYaf34iY//rourtk=;
  b=MKEq8sMbllsIbYnnFfmLD3A+jGJjXAbBmT8C67lhaZqROIhsDbDfIddV
   4+MZTLybGK/hiFdu9vdUd2eti5Zykw35yHjRC5bXYJnH4XGmt3GYirc1s
   1EWjEC5XnoIc/1zvuh28m991rFkdqQj5UUZi7QEDO56VnPN8iWLFltyxD
   TND7Bl7WpjhSMyZxKw6VciERNwUZWDeB1eNSE90UcytM/p5y80t/k/qe3
   vmAQbeakSUslwH7O60O+nW8bDycd+iwod9vFUg4fcxEAvxhPSu5zklq8a
   V9mX2YWHH4/kdVp9IqzrYWpm+vAxf0c5GoZKncV311ucnuZ6+iXfC+s2d
   Q==;
X-CSE-ConnectionGUID: 1LquUv3DS8GXdHXf53a8jA==
X-CSE-MsgGUID: M+j4ABjgR4KqcROth+yjlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="110225258"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="110225258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:12:32 -0700
X-CSE-ConnectionGUID: w8r8Pi79QOaVeV5PqeIKdw==
X-CSE-MsgGUID: pLTOD4E8Rh+sHd5xWHVw6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="263552277"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2026 05:12:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvwCa-00000000dSM-2UnN;
	Mon, 17 Aug 2026 12:12:28 +0000
Date: Mon, 17 Aug 2026 20:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 43/122] ERROR: modpost:
 "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202608172010.SFZY7u2N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   91070be10a4c365f2be28f4351676bc072798b93
commit: d4275763763a12b44dbeb442ff773a8b7c38a34e [43/122] Try to add the wifi card in the dlink device.
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260817/202608172010.SFZY7u2N-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172010.SFZY7u2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172010.SFZY7u2N-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

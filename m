Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76F18FC7F;
	Thu,  4 Jul 2024 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083275; cv=none; b=quuH1lxUPI9lsVu13S/gmAMrmQgp6jnvv15k8S1VYAlTxEt5qCcDmP14ly6enwSKneNW0WC6IVVtBf77UyHR1Dhb91wBUfW6kPrgO7Jh52sUSdQ+biExeLZM15TnZr9B49MST91XqZWeV71Ak8EqQQJX2zJSWw0/zTEtq/WdGN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083275; c=relaxed/simple;
	bh=mr/bHCU7oShyLrZ5ZIv1DBXULK1S/vCQHYrMqWdZZbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzCl747p8qtDmBtRsBDgSHsQLw2wGHSyN2kEzP5WcGe6ELVOKa6rd7lm+6PBPqFNWZHdayO4VFDsYKM6hu5YRq9AW8SWuoSu/o5mUBCmKO6XFcRNyWewVgVZ5F4NxR5Ldu9c6RH8B+RXxkQ+7Q2AWHWxxJ4kBklOvUX6y+pqjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWt69WXL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWt69WXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083275; x=1751619275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mr/bHCU7oShyLrZ5ZIv1DBXULK1S/vCQHYrMqWdZZbA=;
  b=eWt69WXL0bNpbCMyfLV4sObOPBr1ETUeyZXXsOhuMOa7MtzEuU1oOxz7
   hDoOFBG6u2kElPLwR8BO+e260hF55rP5Kl1yWM7RtK8E5aITvCnFmI3OK
   uczkkf9E1w+LzgaEr28hiO2kbz6DEwjmcGnGCmGsFyyw7fXqPC1cgcn05
   PWqEwQcUW/Uo1E1c2iUfS1YbmwxGu3n4Pa8VlBxPfcVNktEGakyi0QabJ
   ubWHRlQRZRJPmNo5fXIX5nx8DCTb6pISwTNX5kn7U4DNInEG4QmZJYGoo
   J9lUtr+bKenmvc400ccFN8c+L5C36ajWlvoR/IPWKa3KVrcXmyQ5JZe+A
   A==;
X-CSE-ConnectionGUID: rKWDeqlMSJGO3v7ICaUAeg==
X-CSE-MsgGUID: KwFm9+WdTCy5dY7UoXyg5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21158074"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21158074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 01:54:34 -0700
X-CSE-ConnectionGUID: l70YYzYxTOGeUW/XerKicg==
X-CSE-MsgGUID: AyHxrjokT6uELRevlCaKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51390241"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2024 01:54:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPIEY-000QmE-0O;
	Thu, 04 Jul 2024 08:54:30 +0000
Date: Thu, 4 Jul 2024 16:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [linux-next:master 6880/10451] ld.lld: error: duplicate symbol:
 init_module
Message-ID: <202407041634.GgIQlOpZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 294bbd1f2697ff28af7f036b2cb19fee78eb100b [6880/10451] drm/panic: Add support for drawing a monochrome graphical logo
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407041634.GgIQlOpZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041634.GgIQlOpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041634.GgIQlOpZ-lkp@intel.com/

Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: init_module
   >>> defined at drm_drv.c
   >>>            drivers/gpu/drm/drm_drv.o:(init_module)
   >>> defined at drm_panic.c
   >>>            drivers/gpu/drm/drm_panic.o:(.ltext+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA903E716A;
	Thu,  5 Mar 2026 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736171; cv=none; b=LH9BskhNny1dD33aXCYyw4iSR0u3o6XViYlndZFkWfA/FnuOBf8yS9H0So7+uOYAU+ky7dFQZWcTN1HHgKzWPr0NDkoq4zQ0bkX28Uss5j3JzorwYExiHOqsprNp/JhSTVpwaLj42vMxx246NphRqMtat//JUR2tOUiH1qgXKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736171; c=relaxed/simple;
	bh=KI8zDkCmjclQpAj1+uZpvTQVLLmR3UqHgSK5fn9JVbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HdZ2UhVG+qGSijL++OL91R3AUdRT31BWXg+zH/cfOj5Oo9ZUpKduYKfkBSOSap8nU8nhWCuU0kAZWC6MKIPmQfR9oMOgEFmLmgoBOwcIJeKEg7UACH699qDI89X447edx3Z4ZO8uZvC/7UMeMfzfT4r9JKCTyw0h0eLyUcn/lUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0216r71; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0216r71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772736169; x=1804272169;
  h=date:from:to:cc:subject:message-id;
  bh=KI8zDkCmjclQpAj1+uZpvTQVLLmR3UqHgSK5fn9JVbc=;
  b=T0216r71GQmyvymuzuzJOphsAy9nO6RL95nORcfIFS6eHgbunJ6U9KYs
   ppb2uczD3ft5C/bY71zKINZvT020P90KMcmLrBcnMtJh8OGFsAXVch6HJ
   OgjuakH6KLOOrt/kELMfKlyedNC0a5PHpcfZOaMVhuZ8kuTO0y4572h15
   YybdvuEA5xAq0AfSjsSnUGSSpfr5FaadO41qRx68xpTQ6iMwEXsrSA3WZ
   tk5dV7OJo2CinurL4x8JeTIAd1X810MNGrPweEFlXR7p2r4pE4BmYD93I
   oDKJItmsmvnsnSHGqQ4hzGSz8fUebLIV45siJfsS7Vi1+ruHfYZaoUyyc
   A==;
X-CSE-ConnectionGUID: pNYxoakpQ0anPdfMQRcePQ==
X-CSE-MsgGUID: 2oQd4IceSn+FwVFeqyd9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73749225"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73749225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:42:49 -0800
X-CSE-ConnectionGUID: yrMfmZYCRZ2eV4i77nyyWA==
X-CSE-MsgGUID: dPTpIZujT/SS36rpTD+Bkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="256664937"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 10:42:48 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyDem-0000000016w-2hQ7;
	Thu, 05 Mar 2026 18:42:44 +0000
Date: Fri, 06 Mar 2026 02:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 304/467] Warning:
 drivers/net/ieee802154/ca8210.c:2444 function parameter 'iocb' not described
 in 'ca8210_test_int_user_write'
Message-ID: <202603060217.DiUU0rgE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 2633f2ba5c3c7e3096bd862c086093077372e6ed [304/467] drivers/net/ieee802154: convert to read/write iterators
config: arm-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060217.DiUU0rgE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060217.DiUU0rgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060217.DiUU0rgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ieee802154/ca8210.c:2444 function parameter 'iocb' not described in 'ca8210_test_int_user_write'
>> Warning: drivers/net/ieee802154/ca8210.c:2444 function parameter 'from' not described in 'ca8210_test_int_user_write'
>> Warning: drivers/net/ieee802154/ca8210.c:2517 function parameter 'iocb' not described in 'ca8210_test_int_user_read'
>> Warning: drivers/net/ieee802154/ca8210.c:2517 function parameter 'to' not described in 'ca8210_test_int_user_read'
>> Warning: drivers/net/ieee802154/ca8210.c:2444 function parameter 'iocb' not described in 'ca8210_test_int_user_write'
>> Warning: drivers/net/ieee802154/ca8210.c:2444 function parameter 'from' not described in 'ca8210_test_int_user_write'
>> Warning: drivers/net/ieee802154/ca8210.c:2517 function parameter 'iocb' not described in 'ca8210_test_int_user_read'
>> Warning: drivers/net/ieee802154/ca8210.c:2517 function parameter 'to' not described in 'ca8210_test_int_user_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

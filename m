Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52214D6ED;
	Wed, 23 Oct 2024 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670258; cv=none; b=JXeHk1KYypuoIVW/op6s/a06SFte+ujL+UBD6V1h/8q+uKh0b7gVlQsPj6XD6FxXLPowJNeWLcu0JzQAnUKNHnyJ6e/HL+gytbfxCtCpB/LOFd5s4qgBatHGrMqAkMB1QicP+SsFTsG5CGIhGkqQDva/KNuIOICawip501DVhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670258; c=relaxed/simple;
	bh=JimrSyTqFyT3tOoA/eNvkbLEiLP93KW72ZpHrRgu0Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaADnBBZVoyr98fy0fuzxCuLCRkrXR83zYf588wgr3tkv5ekgvb4ao43FTXD8IRHG4FohMnZRxjT7GXT4Xasekc8crr/vsMX5cJbjGnuYnE+ThA4ge9uKD8w1SC9FGRPRuKURXM3b+cKKWxvCImgi/c8/6Yc25ChcPAFoDJuWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6EkDdEx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6EkDdEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729670257; x=1761206257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JimrSyTqFyT3tOoA/eNvkbLEiLP93KW72ZpHrRgu0Jc=;
  b=Z6EkDdExfK/hgpTqgg6XXpO80+0w18sK8b0Ewp4loJ61fSPd6fSO0nTG
   avIJ0awo+ZbjZ4BUnuriXQKR+AvJchS7mvDgOddhZtCY0kVeXZMMAtDYq
   UuAJl7cdxNx02hlkYh4nquKSpK4TPtCsVXkGc04X4N5HZphaavnVS6RkE
   PNNc7DrEc0NmF6UhQN/UNk4kzbFxbhe/GmbMFF+KjLu+k8ZZD92BSnkAw
   wpj58/5XbVtIVaQLtK87mxNYWdT9800gKv2MY5r37PX3ccEM6kSyV3k8b
   N1TYxDRd+YE9KpVAxE+2jxWGgTFxYcWpFFvS9HOn5H0BR6hX9P5I5+vKn
   w==;
X-CSE-ConnectionGUID: 4q7C5xuFTZGGCvznt74Hfw==
X-CSE-MsgGUID: 0RiD+7AeRFWZvnEFH4sahA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39818020"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="39818020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 00:57:37 -0700
X-CSE-ConnectionGUID: KV+Tm2KBTyuEjCZzb/+TNw==
X-CSE-MsgGUID: aZm9yJqtTeytFF+IdMPfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="79788618"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2024 00:57:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3WFJ-000UdG-1l;
	Wed, 23 Oct 2024 07:57:33 +0000
Date: Wed, 23 Oct 2024 15:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-reg-wait 6/7] ld.lld: error: undefined symbol:
 __get_user_bad
Message-ID: <202410231553.FJ6DF96q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-reg-wait
head:   454727b3107832a226fbfee1d91a8b74670fc861
commit: edfa7dbed73cb69f803d6cff1fd7e0632777bfa0 [6/7] io_uring: change io_get_ext_arg() to uaccess begin + end
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241023/202410231553.FJ6DF96q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231553.FJ6DF96q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231553.FJ6DF96q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __get_user_bad
   >>> referenced by io_uring.c
   >>>               io_uring/io_uring.o:(__se_sys_io_uring_enter) in archive vmlinux.a
   >>> referenced by io_uring.c
   >>>               io_uring/io_uring.o:(__se_sys_io_uring_enter) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

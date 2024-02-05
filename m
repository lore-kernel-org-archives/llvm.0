Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27513B293;
	Mon,  5 Feb 2024 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707166966; cv=none; b=UIfbjly5jBEbjUq+0VUdRCnshJaqQL7U0MWgwcH69s1OfHRg/PDEGGJ8hFtXYXOI3/JT580l7LFIoUnEeKT4MU+G00cOCIboNATjMD/eMkp6VlUBHtcgCKc5nNJPg5lfIOMUEzBTM9myb57RqPQsZUDt7Bd94KJ3uuy5xoJK4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707166966; c=relaxed/simple;
	bh=sjOTX9XEsVoI7zcrCJc/HWeZX1ul2gb8CAFqy1pPQGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=og/Zh2TU6vvrU46pRqHgLsasZoweiLOPWcYNY1N2WZCq02HjHs9l3tVz9k6azpq6xYspZJ4mzLEIQyDWfwiKHBDfcqT8ygDMUouc47n0fkR1IEvZu9a4gRoau6Q4Hyj0hQMu4v574KuMaEl5B2i6LAwDtQPgHdVGb111ifYUW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlpSok+I; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlpSok+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707166965; x=1738702965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjOTX9XEsVoI7zcrCJc/HWeZX1ul2gb8CAFqy1pPQGs=;
  b=QlpSok+IBZMgcVEc74Q7pcT/z6MKpnDNY1Vv9uYbgMmcYiqZToa/IWLI
   7bhK9fIgMqBAdDMaU/HVk0usQMSZbYcgC0um40IF6s+tuS9vQCrHY+dkO
   C9Gt/oi9W81UBXFURjG6Ao/jLvsq8SSOgSghHtPz1qFp/iNvhqN+H0Twh
   hoLes5dzewns849iAauJo6ICvwHNo3jGGQe9xL+YAgxG22BGw214OZCv/
   cwX6wCbkFLZlKttBCtChyedraEoW9LItZJSfLFQEGXru3Fh2H/w+uYs0s
   SHNokrtKG0HkNfeyquCv8ErdLfMhVhtmkJPxlBuZp0I39adaR7nDIHqoD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18132702"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="18132702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="814552"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2024 13:02:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX66x-0000oK-1U;
	Mon, 05 Feb 2024 21:02:39 +0000
Date: Tue, 6 Feb 2024 05:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 53/53] ld.lld: error: duplicate symbol:
 arm_pm_restart
Message-ID: <202402060401.IFKBsHxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   ff075610dd600c992d66304316930e69b2006e55
commit: ff075610dd600c992d66304316930e69b2006e55 [53/53] squash! ODROID-COMMON: power:reset: Add odroid support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240206/202402060401.IFKBsHxB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060401.IFKBsHxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060401.IFKBsHxB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: arm_pm_restart
   >>> defined at process.c
   >>>            arch/arm64/kernel/process.o:(arm_pm_restart) in archive vmlinux.a
   >>> defined at odroid-reboot.c
   >>>            drivers/power/reset/odroid-reboot.o:(.bss+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F03955FD;
	Tue, 26 May 2026 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774359; cv=none; b=YpIoAd6wsf4I5fMansGPHg0f/I/jv7NsdfdV1hfI7VbN5BsYVfp6p6mL3cDx6znc/Qhussm5UUTvwH4RNCGKw+24n3nQtjmUvbIq5XuOcch1X5eXqiepk7ON7q4DW51Gxegkarga751szISiPMNH5vMmxAcAvI7m4i4NVgOVOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774359; c=relaxed/simple;
	bh=ndkBBjMdxKvnKWvmsdbn5z52mzyu5UpMivlRKXeN+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gn6uUE19/YBQeFr5k75HQJOKtPzEjnJP3vjAyc5U3wWUgsvI6TRQCTpdeD5YKFJhn1GPee/Hjn1NG0gO3H8gols1RDI15ihE6DqmQxRpSskev6zHXXS/Pp5BU93Hg21F41VHrtzUF6A1jteIrK37mS8UqK2crjGhgTBAgU9cZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQga1967; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQga1967"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779774358; x=1811310358;
  h=date:from:to:cc:subject:message-id;
  bh=ndkBBjMdxKvnKWvmsdbn5z52mzyu5UpMivlRKXeN+Fc=;
  b=RQga1967Tz5lPC1zKHcHiqCFCjEbMcyyr71uuKeEb4adypCJcF7PQi7Z
   EmbAgEiGcsAQjheGHZ4aWnoQgaXly0G1SExcSMICzOR3ujp4fEf696EvS
   1PfBVIDofV3herj7P5ReSeyXN2u/oFz4fkJVrbZ1XVbUq3A/RwsPGKPoh
   9D+6DxhU76WOtgh94my/7tnfr76Ho4QAcjAyD0pyP4szYZRBYGnugNJ/M
   qxcoeXEaIbUtBeZbR2oUaedrFNDHsRg6QrRdD19uCBSmoVCPJYzlrc/+J
   oqKYiN+ML1NvoKvMVWhcv4NU0yvKarWFUJ8TDd97HJKUUrC96Gkgl7YoU
   Q==;
X-CSE-ConnectionGUID: OOnkYYH8SyeWCRJtwY9JzQ==
X-CSE-MsgGUID: 4zuJavJ/T8yYF9inpHR/sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98007030"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98007030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 22:45:55 -0700
X-CSE-ConnectionGUID: NVquqH0vRwSydLWWnahm/w==
X-CSE-MsgGUID: W8Kzm0wBTWyLmRQZv46Xvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241983885"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2026 22:45:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRkbu-0000000029W-340V;
	Tue, 26 May 2026 05:45:50 +0000
Date: Tue, 26 May 2026 13:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 30/1197]
 ./usr/include/linux/ublk_cmd.h:601:3: error: // comments are not allowed in
 this language
Message-ID: <202605261311.mL3WnN3h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: a33c92e1bad897ddadbbd0cc4490eb82c29b54d6 [30/1197] cheri: compat64: Fix definition of ublk_elem_header
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260526/202605261311.mL3WnN3h-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261311.mL3WnN3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261311.mL3WnN3h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ublk_cmd.h:601:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
     601 |                 /// UAPI: NoConvert: Padding/alignment only
         |                 ^
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

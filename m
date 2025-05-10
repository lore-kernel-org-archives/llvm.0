Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FB189BAC;
	Sat, 10 May 2025 03:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746847775; cv=none; b=RtqO6aZmu8oe+V9RsbqlSLGuCPazkT4UqW/zCB7Mk74B683BObaUI7lo8hEgDnhOkvryFbCfYvnKaeKpRAwofTVyF8pHXVMSdKfuGTFLnqBjtiYlAT16aKlmXmVeEcKZhGaShVOKXxu0iWk/XAjS45OvEtN7mjjK5eODaWI8n9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746847775; c=relaxed/simple;
	bh=HslIg/mgDg1Ug19oPvJQt5WyPJMqULS/mzJzvPcq5A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnYAenB2BYZS5bUfTfwPT0DYxYNLX9ZF1ZdXExrgnXGX3zSLZMQ3OWMdw+DY13YnA6uzRzKjAIZRhk1WGwv/Oxswet1Ova5fbh6XT3Xxm0E1r0wYZ+gpqViQP7xtRS5cm+ZCt1KREzkLyOlMFh1kkQCQBKsDnm8APG5HF8yjiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARnEvHiT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARnEvHiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746847771; x=1778383771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HslIg/mgDg1Ug19oPvJQt5WyPJMqULS/mzJzvPcq5A4=;
  b=ARnEvHiTuJpqwc+GrcYIjYwE/ufG9GvkacgOEavW++/9A0xsoN6RoFNr
   plJ2PPV3cndYrZjFHCH63yB9TnuQaQuADycIX8xp63kOCelOwEZFyGnDX
   OPvEgN5kF3pPty1XWsTriHzMhKnGJxSQgZstr+x4ZITzs9+Lq68peI71w
   RDWYpufMLQueLp8DIXg2AhmpgW/6D6pfNVwQ1K7m0OVen+pvyZr9bNMp0
   SPPEJB4pw1PhdShz2a1iKnVE611UNnLL66F9caqLslMWzIKR8qhNvtgZW
   jord3oQkDaZXDpue2QnwH+lVujaByzZek4CxbSPGZrSKxcC7rwuO4qPvV
   Q==;
X-CSE-ConnectionGUID: QV63lP/QQmuMLYDOy2AWnA==
X-CSE-MsgGUID: 4y16AcpfST+mJ6DGyqWkNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51347002"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="51347002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 20:29:30 -0700
X-CSE-ConnectionGUID: yOZh1DFFQyacKfMO6DcbmQ==
X-CSE-MsgGUID: 1pZduCpWQUShVv3MRxAa3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136716747"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2025 20:29:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDatz-000Ckl-0Z;
	Sat, 10 May 2025 03:29:27 +0000
Date: Sat, 10 May 2025 11:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 13/19] page_pool: expand scope of is_pp_{netmem,page}() to
 global
Message-ID: <202505101158.3gT6t67h-lkp@intel.com>
References: <20250509115126.63190-14-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509115126.63190-14-byungchul@sk.com>

Hi Byungchul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fd93b3350b4314eebd8fbf0fea3ca7fe48d777e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/netmem-rename-struct-net_iov-to-struct-netmem_desc/20250509-195458
base:   fd93b3350b4314eebd8fbf0fea3ca7fe48d777e3
patch link:    https://lore.kernel.org/r/20250509115126.63190-14-byungchul%40sk.com
patch subject: [RFC 13/19] page_pool: expand scope of is_pp_{netmem,page}() to global
config: x86_64-buildonly-randconfig-001-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101158.3gT6t67h-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101158.3gT6t67h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101158.3gT6t67h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: is_pp_netmem
   >>> referenced by skbuff.c:1040 (net/core/skbuff.c:1040)
   >>>               net/core/skbuff.o:(skb_pp_frag_ref) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

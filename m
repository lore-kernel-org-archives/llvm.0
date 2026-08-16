Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16A3A872B;
	Sun, 16 Aug 2026 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786891224; cv=none; b=Ik4rjhEw0uhIjjjz46rcoV8ATK7EZ5cov0lwumMmZxXTBzO4Az2wJ5HvIXtbDAIJt0lVXfc9CARKPEaaFQbAdTRg+W36XHJWMX7A5sEzHaze9U4Ew0DaWqCd7KpX0cNa8KzHw8aJ0Nc8qKtutysEzCiTabuOGj1TlPKiPZApOTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786891224; c=relaxed/simple;
	bh=FzaGI7tH10WSf7ggdHj4n/dsYNSQQHnW3BFWHr7bcIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iSEiTvHCx6uv375YAhhNNfSKiHf89ZExvhKvPyP/AexjaHRH5Tz0K9JeFAgCoBnpJpcnuf/pd70Ecz+SXTCdhGKoTIIGGh2XuSi7mSDw5PoiARy8OhuiXgzYegDzop2thoDO3fUKaq4aLCTIvqX3LtTrgMq5GjfwHNM+Simn4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcEZyUmE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcEZyUmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786891223; x=1818427223;
  h=date:from:to:cc:subject:message-id;
  bh=FzaGI7tH10WSf7ggdHj4n/dsYNSQQHnW3BFWHr7bcIk=;
  b=JcEZyUmEw9sCSDOdr9PpigT6REypYkLEgjrsGlwnRveb1oeFY9nBnYnT
   00/9ZWEiMjm43b5GvAmEBbZsZpzpuJcfiENtIXlhkeLEn4VQDre2qsJXx
   AzhXbYDCO+zq90eKFqWc878R38k+fXhP8b74hcBWKa10dDCgLyWiHf6eF
   BFUKcdViBsSX5UflNnX0dN0lpn10yL92AHRsxpSZ3Z+2hJLsS0owqvz5b
   vimAYZBSJIKDcsVju0w7r7novSPF1/4kuyDwyuw+94Oo7GWtjXGkQe2gk
   Ow+drARwkPxoD8sY37ce2tCcpRTYVotDwWRnOHGMEBfs9oZxHan3f3B4B
   w==;
X-CSE-ConnectionGUID: 5esgNfpVQ8ykpqfbZcxIpQ==
X-CSE-MsgGUID: oTUBHYReSKSNH34Iog7tIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87597239"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87597239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 07:40:22 -0700
X-CSE-ConnectionGUID: sCMSTgOQQyScUYlDSk6sPg==
X-CSE-MsgGUID: R7RDT55fREO09BKhvp38Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="265292277"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 07:40:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvc26-000000006bR-0eLS;
	Sun, 16 Aug 2026 14:40:18 +0000
Date: Sun, 16 Aug 2026 16:39:36 +0200
From: kernel test robot <lkp@intel.com>
To: Longjun Tang <tanglongjun@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/bpf/helpers.c:4090 Incorrect use of
 kernel-doc format:  * bpf_strpbrk - Find the first occurrence of a set of
 characters in a string
Message-ID: <202608161659.Yqj3Asxx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Longjun-Tang/bpf-add-bpf_memcmp-kfunc/20260810-191652
head:   31fa7f646be6064b4be75b1e82cfff74597b6464
commit: 572e424dd77331c6f3cc067893c812c03104d09c bpf: add bpf_strpbrk kfunc
date:   6 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260816/202608161659.Yqj3Asxx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161659.Yqj3Asxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161659.Yqj3Asxx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/bpf/helpers.c:4090 Incorrect use of kernel-doc format:  * bpf_strpbrk - Find the first occurrence of a set of characters in a string
>> Warning: kernel/bpf/helpers.c:4103 function parameter 's__ign' not described in 'bpf_strpbrk'
>> Warning: kernel/bpf/helpers.c:4103 function parameter 'accept__ign' not described in 'bpf_strpbrk'
>> Warning: kernel/bpf/helpers.c:4103 expecting prototype for bpf_memcmp(). Prototype was for bpf_strpbrk() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

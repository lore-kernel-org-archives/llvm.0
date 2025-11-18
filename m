Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE13502A7;
	Tue, 18 Nov 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466384; cv=none; b=Dpl1DZa+HNp16tLdNsDrhIUs3z3ZT9ElV0DIETnreP2hZwyz1X4+svmqGieGXBnGIccsXG2m6tfBURdLaZH8RN34B8w5iYHcdJy31VfFKZB+xiIa7a6Mj88UIFilfrUGIzkrY/CdoILUg7F+th+tSJwxdB3Wq50GX8HfKIpmMBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466384; c=relaxed/simple;
	bh=mi18b4bWduUyDvgCE4BQ9rJr9tFYwFnYee+gh9xR3LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZVGDvpFbS0oC6LjoY3FLltOLd3wyyhe7alhVYhL4fvi52sGlhQ7ZvyAqG6hgnTXuJ2BCOW2KMS+fZQFaQHe39hAhosIYlcrlZ4/It2aA0v8uu6ixOXtRPdCq+9O01DqgNyuAkWeGXf5aCeb562nMa4EPPUyYX7BHO0OzVqU0jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htV20dF1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htV20dF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763466382; x=1795002382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mi18b4bWduUyDvgCE4BQ9rJr9tFYwFnYee+gh9xR3LE=;
  b=htV20dF1VXVAnafWYgiRWnKbOY0ZxAaRs65wUqTlEpRWDdEMgwgLbO/V
   UXl99Andbe7uyR9mj4YqhssEMTlxhNidXHlWIc5JNdQxe7/y7x4i8oeFE
   l5c7TKdwiz+w5ClXCsx6Xcg4BTyqhFX5P/XK02IvgdezdhwNvXybUguIg
   AFbL5CBA7SJ7uVPHk3N6biB6ITCgZZRYFvyoIGU30+wiRsn5uPK2DWBNA
   epdauwkWS2KQU7TugdBV4bY6jt8nbLOooGfucTtk61XXPPiPMmbT4O9uu
   y+iF3IamgjHMdIa+t2y/OtMlTtH4bFto5HD36bfTrYmLcU5gyFU/Pjioq
   Q==;
X-CSE-ConnectionGUID: nQveKiDrTKqg2I+biGWnmw==
X-CSE-MsgGUID: PKJyynf+RkWNcn0CAwjnMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53054781"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53054781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:46:22 -0800
X-CSE-ConnectionGUID: FzSVmoWYQrqyuyCLvu8aIQ==
X-CSE-MsgGUID: HLttOJ3tS0W3rUMnhfGAJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190407906"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2025 03:46:20 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLKA6-0001fv-2B;
	Tue, 18 Nov 2025 11:46:18 +0000
Date: Tue, 18 Nov 2025 19:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as
 private
Message-ID: <202511181954.UMxCeTV1-lkp@intel.com>
References: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>

Hi Ricardo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6f85aad74a70d17919a64ecd93037aa51c08698d]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Neri/x86-acpi-Add-functions-to-setup-and-access-the-wakeup-mailbox/20251118-011935
base:   6f85aad74a70d17919a64ecd93037aa51c08698d
patch link:    https://lore.kernel.org/r/20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c%40linux.intel.com
patch subject: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as private
config: x86_64-buildonly-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181954.UMxCeTV1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181954.UMxCeTV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181954.UMxCeTV1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/hyperv/hv_vtl.c:9:
   In file included from arch/x86/include/asm/acpi.h:11:
   In file included from arch/x86/include/asm/numa.h:8:
>> arch/x86/include/asm/topology.h:159:47: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     159 | const char *get_topology_cpu_type_name(struct cpuinfo_x86 *c);
         |                                               ^
   arch/x86/include/asm/topology.h:160:57: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
     160 | enum x86_topology_cpu_type get_topology_cpu_type(struct cpuinfo_x86 *c);
         |                                                         ^
   2 warnings generated.


vim +159 arch/x86/include/asm/topology.h

090610ba704a66 Thomas Gleixner 2024-02-13  158  
45239ba39a5279 Pawan Gupta     2024-10-25 @159  const char *get_topology_cpu_type_name(struct cpuinfo_x86 *c);
45239ba39a5279 Pawan Gupta     2024-10-25  160  enum x86_topology_cpu_type get_topology_cpu_type(struct cpuinfo_x86 *c);
45239ba39a5279 Pawan Gupta     2024-10-25  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

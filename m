Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623302989B4;
	Wed,  3 Dec 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760477; cv=none; b=F/mvzpJC1JFgNdjF9EhCqb4Oqn4OpO8Z9MKVVpKzeCXB9ZEWpnpO9g4cdfq3YMHY7uwPkqVyJ7BRji+7RDYKBklmcl+SO1xVGAGhmZGUtkJ6z61V/sjXRajFRr16TRIe3m2JlzP+VfKYpy8CZw/dlkfKWyXivjGNTpRxiszkzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760477; c=relaxed/simple;
	bh=YGJ4SFbq03CKNylXpmqKpDEKKjOyf9D7NVavcvrpD0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYRkevNekkPHgE0BNC2aIgj2qb3RvlFCZj+z2TR6lQKEkUM9UdSqQVzjU2WMSvfSYtlff93+8FfEFRVugknjafPu3HeLBGpTH435HxjTfvJ7H4ntHCCcy3o/S3DlmNrEgQVsp6n+EeEWLzwI6cAwS/Izwx2VPYaVpvNLc0BbVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbDCisv9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbDCisv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764760476; x=1796296476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGJ4SFbq03CKNylXpmqKpDEKKjOyf9D7NVavcvrpD0Y=;
  b=dbDCisv9zKsdS//isEPmwZ2mDifIwKvJFKv+XF4cPPKztJLQPkaFvaU6
   pJXkLHPBUUukpuHN1dzQSV4Ezhepd8AtKi9Flve7eMsjolkMZBGP/W56m
   3QKmeDcf8TScq0oVEnr3qj8ka0oVtiYtpqmjZdDdII75oteljVjWDlWQ7
   WvcKrFkJafwFeTrGo0YTeHub6a/8vUUAKNDpMlkiVcfkew9ckiJOYW0uf
   vShtRMGpWJLbwBEVmE0wsFwcuidnDAaZuj2coZpUm0HH0EGY40MfbFOSJ
   pqfTP81mBzQZNGLKg+LKK7eZuZshP8M6yjMOAcA2xfbjUs8WyQi/faoV7
   Q==;
X-CSE-ConnectionGUID: DzacQOhnTkmgNACvZ3DjKQ==
X-CSE-MsgGUID: VWTq8zXtRWef7HYIS3M2Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69344479"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="69344479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 03:14:34 -0800
X-CSE-ConnectionGUID: 1jIx6cEfSSq5Q4hJXzqhfQ==
X-CSE-MsgGUID: 1h1PO0P+QFG6X21qJUIIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199779176"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2025 03:14:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQkoX-00000000AuH-3vGz;
	Wed, 03 Dec 2025 11:14:29 +0000
Date: Wed, 3 Dec 2025 19:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] kasan: Refactor pcpu kasan vmalloc unpoison
Message-ID: <202512031933.IaXWTVb8-lkp@intel.com>
References: <3907c330d802e5b86bfe003485220de972aaac18.1764685296.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3907c330d802e5b86bfe003485220de972aaac18.1764685296.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18]
[cannot apply to akpm-mm/mm-everything next-20251203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Refactor-pcpu-kasan-vmalloc-unpoison/20251202-223111
base:   linus/master
patch link:    https://lore.kernel.org/r/3907c330d802e5b86bfe003485220de972aaac18.1764685296.git.m.wieczorretman%40pm.me
patch subject: [PATCH v2 1/2] kasan: Refactor pcpu kasan vmalloc unpoison
config: x86_64-randconfig-004-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031933.IaXWTVb8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031933.IaXWTVb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031933.IaXWTVb8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/common.c:598:66: error: too few arguments to function call, expected 4, have 3
     598 |                 vms[area]->addr = __kasan_unpoison_vmap_areas(addr, size, flags);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/kasan.h:617:7: note: '__kasan_unpoison_vmap_areas' declared here
     617 | void *__kasan_unpoison_vmap_areas(void *addr, unsigned long size,
         |       ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     618 |                                   kasan_vmalloc_flags_t flags, u8 tag);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +598 mm/kasan/common.c

   586	
   587	#ifdef CONFIG_KASAN_VMALLOC
   588	void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms,
   589				       kasan_vmalloc_flags_t flags)
   590	{
   591		unsigned long size;
   592		void *addr;
   593		int area;
   594	
   595		for (area = 0 ; area < nr_vms ; area++) {
   596			size = vms[area]->size;
   597			addr = vms[area]->addr;
 > 598			vms[area]->addr = __kasan_unpoison_vmap_areas(addr, size, flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

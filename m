Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4D222578;
	Thu,  6 Nov 2025 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762393388; cv=none; b=XGgOGNNoCi6vUK9NfOgkSUPlZ0AR2n5mpKaIsnOWFvXJz3jvp6rIfWG+mrJPWRvnwzPzlsgN1to5DhKTd0EU3BYnuiDnX0C2scXX2lLC4XXRk5Bdfa+98Z3JKUrpXf8VIa7ISPYhpc7OTo2S2f91+CAIEKmf9PeHT/CJPBPb7KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762393388; c=relaxed/simple;
	bh=2BVMpR3FHyZ+X/hxS26Deu2WAC/NgwDf1oq+a7rG/6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cel/R6BFh9/oceXJcUCsn1ooDbovZ+v9r3wcUQigGjqybDRZ0crqoncFXHKB2YA1fM4PW4nhGP9AHAu391l0SXtScnPiv6Bh7pmpP04sw3pzOmHKXbvRztOHyGtP+/hf9To5tZ9EHHMGhSU+OTevGt0sl4OyYfRfZvykvm1RTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYTFnmqY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYTFnmqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762393387; x=1793929387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2BVMpR3FHyZ+X/hxS26Deu2WAC/NgwDf1oq+a7rG/6Y=;
  b=hYTFnmqY38PBTmbinunFFYCXCUPmk7dj0vD2rJTx1P2EUPUNTfGXGcSs
   u3Y7MxiX4lm3ndefFgT7KI1tZWzF47qJjMKD8wbtQegwPR04MGV7otRs/
   hgB2U2efW9+UzJ7MihQcbwe0hHT6ILQAwN5sXmo2Vktx4lPsuKsp541L5
   iyhc2Mtv9JzeIABB+RfsyIkElIY/20Uq7lG7i3CGY+WCoTCpKW99/LPhk
   1qecIyvJd5N5YgvoDmaa3ks5GG40gp2LdygtZKtsdl1uBkRl3D7j3EvCH
   dMkHh0oxQbA9AY9GC0VSci4latuPg9BzLvg5CHHZ5mtsf/U6diRYpDJRy
   w==;
X-CSE-ConnectionGUID: K9UdNbjjSP6YAwriZLIOHQ==
X-CSE-MsgGUID: mTI9rO4zRfaZukzhaIwuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75874940"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="75874940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 17:43:04 -0800
X-CSE-ConnectionGUID: CJWimRuKSDGhm1KNZzS0Ug==
X-CSE-MsgGUID: iOJKe8OyRfez6UZyGvb2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="191976026"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 17:43:00 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGp1e-000TL2-02;
	Thu, 06 Nov 2025 01:42:58 +0000
Date: Thu, 6 Nov 2025 09:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	m.wieczorretman@pm.me, stable@vger.kernel.org,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] kasan: Unpoison pcpu chunks with base address tag
Message-ID: <202511060927.eg2dcKpK-lkp@intel.com>
References: <821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc4 next-20251105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Unpoison-pcpu-chunks-with-base-address-tag/20251104-225204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/821677dd824d003cc5b7a77891db4723e23518ea.1762267022.git.m.wieczorretman%40pm.me
patch subject: [PATCH v1 1/2] kasan: Unpoison pcpu chunks with base address tag
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251106/202511060927.eg2dcKpK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060927.eg2dcKpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060927.eg2dcKpK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kasan/common.c:584:6: warning: no previous prototype for function '__kasan_unpoison_vmap_areas' [-Wmissing-prototypes]
     584 | void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
         |      ^
   mm/kasan/common.c:584:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     584 | void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
         | ^
         | static 
   1 warning generated.


vim +/__kasan_unpoison_vmap_areas +584 mm/kasan/common.c

   583	
 > 584	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

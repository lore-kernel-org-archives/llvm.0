Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AD208A7;
	Wed,  9 Apr 2025 03:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744168060; cv=none; b=j6//lzWT4ya9HQ+hm5rM8jFEwyblh1jS1HM06Oid8B9sPUI/yUR6fjEvaToptKSlF/+zmiwcIqbiAOMNnQnpVqbsHpoVi5ACOexhIPbbI0Zojv2SuGj3z5Czm5eXjTFfEeBm0UBZb0RU4uzk2iKFlzP5N2NeqS1kqwvLuGC88tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744168060; c=relaxed/simple;
	bh=uaLCSwTocvAn86R2kk0COrySP6lGs/8ID2LAvNwiTuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rh05mB0Ps+mnLLYY6cUS3bVweFkMDye3fajmIR5MWYhiupreTpXKNVu+Ee8icYesF3n9reXAFUMJjNs8YjkaA9+4O1PIQc+yzNdVqQwVFQ+yHEVIGVn+wQeYb7tVQiqHR2UdyDDBHP7WLTMoTepeNU6mUJ7JOr3I4bkloP4Ez8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8LIWRWZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8LIWRWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744168058; x=1775704058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaLCSwTocvAn86R2kk0COrySP6lGs/8ID2LAvNwiTuk=;
  b=c8LIWRWZ4ifiuxZJ4qRHwpcpxDW8yAILZ2iOyJErPdc2//WAMV6Edspv
   w+AtFIb9Wlc/3KA2a30BqaQx8Xa3xp1Y7ps1p/pRbR7P6W1ifcjKvkF56
   e7p38B+C+nFUIMyoPUuG51HQHa/7elXwl6dgck0gRsnBTudprICLqjZz9
   SOkWXeOnI0SBDZ7pMC+BwR53HYd+T4Sa1MBk/djDDY0udXyRxm9k21SqS
   DOfiePurXH7eFasKr4/wYPlkQn3kPpDt74ewFDBMFXMTXNBI3/5pJr650
   RIufgUxyslkKyNPg42HrBmL56K6tciDHELvPyGyBkORZzP593UEm411w7
   A==;
X-CSE-ConnectionGUID: u8coDjHfTDCxcTjvG2Zd+Q==
X-CSE-MsgGUID: O4ZEdA8dQRW0JaFBXI+3TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56995688"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56995688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 20:07:37 -0700
X-CSE-ConnectionGUID: YjN+QmguT26NlSpRc620Pg==
X-CSE-MsgGUID: CxUd0lDARJK9KbOCYFeE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="159432451"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2025 20:07:36 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Lmo-0008Dl-0D;
	Wed, 09 Apr 2025 03:07:34 +0000
Date: Wed, 9 Apr 2025 11:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 44/48] mm/shrinker.c:834:
 warning: Function parameter or struct member 'out' not described in
 'shrinkers_to_text'
Message-ID: <202504091131.zm2emQdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6d28d840040405a71622fd85f78fb10c629704ba
commit: 200f6b291977b4e0dd9f53d01df22135c7ca2926 [44/48] mm: shrinker: Add a .to_text() method for shrinkers
config: riscv-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091131.zm2emQdT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091131.zm2emQdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091131.zm2emQdT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:834: warning: Function parameter or struct member 'out' not described in 'shrinkers_to_text'


vim +834 mm/shrinker.c

   826	
   827	/**
   828	 * shrinkers_to_text - Report on shrinkers with highest usage
   829	 *
   830	 * This reports on the top 10 shrinkers, by object counts, in sorted order:
   831	 * intended to be used for OOM reporting.
   832	 */
   833	void shrinkers_to_text(struct seq_buf *out)
 > 834	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

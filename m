Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D210A24;
	Thu, 29 Aug 2024 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896962; cv=none; b=sHwuPW1X8mmnzwvL/2D1MpjhkZQGq5+aUfJSGA2N+rZncSLlhKkLqddOKoXpaSGf6Tj8fiPFCSW2/vC95m3HeBw9T1lv/cujdrcge97NwZvYunzzqykVIDuF3SXoBn4LiHLhzSQoiV1widsD3TqFttmJa4+JYqcIJ+Q/NXRPTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896962; c=relaxed/simple;
	bh=0juvYXdajUddBhJi8nQrWw7uHzjYGwFtazF6bvX/GXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgFm0S1c0XM/VMb2OX0/9WnUidTtopYPBjPL4uFEdkJhbiwlELUFDIOAbJUj0wPtcd6a0QbcYh+neNpbic2XdIxFTuNMoZd8VvvTjkuZ/TSib4AeXUsxKTQTYvnno/pen7HjehOth0TgXRcUjAAVJONAP1CZWCWwRfxrLHogk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwdOSQkA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwdOSQkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724896960; x=1756432960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0juvYXdajUddBhJi8nQrWw7uHzjYGwFtazF6bvX/GXE=;
  b=SwdOSQkAnlcEsMIna2WimQD0eOsI3k9tLq2bE4cxqKH00cFYzR3byYxc
   o77MZHyVw9iVOx1c5V5oJX/PHUDkjWyqdNy5bVBkiiw2x27zE5uspaxJ/
   FcIh15nngGJbhSj5A8b0MClutTKNv90Jk1pMcqxRsSnnYMbRChuywc67y
   KwKswg++4BBRzFkWy8ieXLFwBcUtH4Ed1y1cyduxsGG9EX0RyxNw20iXh
   0m4TNsMyG0yG2jhiwta3kCe8QT4s6LOGfIKBp6jMREsH1KlVlhygPc8pc
   aVFqJbxryPGPTDUbUC+7+C2ajEsRn1DtqwlFLbfjXazOUbppaBxTXXzK5
   Q==;
X-CSE-ConnectionGUID: ntcNZUniTuaEvJL4yOqxIg==
X-CSE-MsgGUID: e0jD+XTYS0Og3HgVdogNcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="26365326"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="26365326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 19:02:39 -0700
X-CSE-ConnectionGUID: ewHr2/aPRMW8XbdGFv6j1A==
X-CSE-MsgGUID: dYrM7thGSs6QE8zDbMjPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63367231"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Aug 2024 19:02:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjUUd-000LZW-1g;
	Thu, 29 Aug 2024 02:02:35 +0000
Date: Thu, 29 Aug 2024 10:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [linux-next:master 5237/7353] drivers/gpu/drm/xe/xe_ggtt.c:714:3:
 error: variable 'total' is uninitialized when used here
Message-ID: <202408290916.B9yUmPQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   195a402a75791e6e0d96d9da27ca77671bc656a8
commit: 136367290ea5d7b5d05696189e9fd6162b9d9742 [5237/7353] drm/xe: Introduce xe_ggtt_print_holes
config: x86_64-randconfig-002-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290916.B9yUmPQD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290916.B9yUmPQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290916.B9yUmPQD-lkp@intel.com/

Note: the linux-next/master HEAD 195a402a75791e6e0d96d9da27ca77671bc656a8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_ggtt.c:714:3: error: variable 'total' is uninitialized when used here [-Werror,-Wuninitialized]
     714 |                 total += hole_size;
         |                 ^~~~~
   drivers/gpu/drm/xe/xe_ggtt.c:702:11: note: initialize the variable 'total' to silence this warning
     702 |         u64 total;
         |                  ^
         |                   = 0
   1 error generated.


vim +/total +714 drivers/gpu/drm/xe/xe_ggtt.c

   685	
   686	/**
   687	 * xe_ggtt_print_holes - Print holes
   688	 * @ggtt: the &xe_ggtt to be inspected
   689	 * @alignment: min alignment
   690	 * @p: the &drm_printer
   691	 *
   692	 * Print GGTT ranges that are available and return total size available.
   693	 *
   694	 * Return: Total available size.
   695	 */
   696	u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
   697	{
   698		const struct drm_mm *mm = &ggtt->mm;
   699		const struct drm_mm_node *entry;
   700		u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
   701		u64 hole_start, hole_end, hole_size;
   702		u64 total;
   703		char buf[10];
   704	
   705		mutex_lock(&ggtt->lock);
   706	
   707		drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
   708			hole_start = max(hole_start, hole_min_start);
   709			hole_start = ALIGN(hole_start, alignment);
   710			hole_end = ALIGN_DOWN(hole_end, alignment);
   711			if (hole_start >= hole_end)
   712				continue;
   713			hole_size = hole_end - hole_start;
 > 714			total += hole_size;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

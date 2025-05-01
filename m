Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0A1946DA;
	Thu,  1 May 2025 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133971; cv=none; b=r/RZU6v3x7nWZKBMarL6RlbAeeFwnWeNzYxnPth6MawjTplJZ/+woaOAQztIbSPFFldkNMSBAry/DONA/VFIcaxFa5VxGrOCyMhjubydsrf8J/eG87GtktLMOoeyY0Q9L+D7UpLnyEFGTQKMwmOK+LPh9/55Mej7Zu3c5SbYf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133971; c=relaxed/simple;
	bh=bvedAPJvlUXrrSJRO8/640/XzAYpJjywUI5nx3jfp3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jO0LiUgE7IjsW0bsfsa6WbBwZQLALIfwoAB3tyBh4Z84J+kPikUR/vU2sAMXBq7mHQStJ2PMXExb+ON+IZa+8qUl4y3CRXqSnY+JOqwHHqv6k5fritSTwgl9NpgHP3QAGQEeHibleNOr9U5t0MNHKEqJ5KvmSz7vVOaXFFn3lUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baPJ90Ym; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baPJ90Ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746133969; x=1777669969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvedAPJvlUXrrSJRO8/640/XzAYpJjywUI5nx3jfp3c=;
  b=baPJ90YmiGorLwFU1fKK4w9Nuu4avfYQqxL774OVCldaZIG3Kd2WLvaw
   rGhKgd0yRu4OBZid2lhe3uL2rQELhdZO7fQ+NN8Vtcp/RJovEkhQx13Kv
   HHsS4NEiOFHLHj+mDGgAG9Hr7Vw1kw6XTGT6VwGNwed4HFG5XJJc3igws
   QGq0QJUXqSZzTkH8/+gqiwNqFcGZ5a1NwOgViotGrqtXxDzZNMT2C4RGF
   5atCtvVn7vyuuafUD3u/xlvw3lHPcsjxyMwburqjztzf+XzcQFfT2Iwwb
   bYX8x+N2isedSVmqelBHtzBj0sXNRE847IYR8M0/csUzps5SVaTXk2zmm
   A==;
X-CSE-ConnectionGUID: eM3px+M8QCm2uJD471pvAQ==
X-CSE-MsgGUID: db3Z2yo7SEaDuG7q9CR9bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59204555"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59204555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:12:48 -0700
X-CSE-ConnectionGUID: E4iSkYTMSQq2Y2MET4qT0Q==
X-CSE-MsgGUID: WwrXopnCT4ihUjKUCUaVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134221313"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2025 14:12:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAbD2-0004Of-1z;
	Thu, 01 May 2025 21:12:44 +0000
Date: Fri, 2 May 2025 05:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 272/272] fs/jfs/jfs_metapage.c:238:28: error:
 called object type 'void *' is not a function or function pointer
Message-ID: <202505020532.eOaIqKwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ea17e4fdc13cae144d90ce8561c2f50a49492037
commit: ea17e4fdc13cae144d90ce8561c2f50a49492037 [272/272] jfs: implement migrate_folio for jfs_metapage_aops
config: arm-randconfig-004-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020532.eOaIqKwc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020532.eOaIqKwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020532.eOaIqKwc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/jfs/jfs_metapage.c:238:28: error: called object type 'void *' is not a function or function pointer
     238 |         rc = filemap_migrate_folio(mapping, dst, src, mode);
         |              ~~~~~~~~~~~~~~~~~~~~~^
   fs/jfs/jfs_metapage.c:641:31: error: called object type 'void *' is not a function or function pointer
     641 |                 return filemap_migrate_folio(mapping, dst, src, mode);
         |                        ~~~~~~~~~~~~~~~~~~~~~^
   2 errors generated.


vim +238 fs/jfs/jfs_metapage.c

   226	
   227	static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
   228					    struct folio *src, enum migrate_mode mode)
   229	{
   230		struct metapage *mp;
   231		int page_offset;
   232		int rc;
   233	
   234		mp = folio_to_mp(src, 0);
   235		if (mp && metapage_locked(mp))
   236			return -EAGAIN;
   237	
 > 238		rc = filemap_migrate_folio(mapping, dst, src, mode);
   239		if (rc != MIGRATEPAGE_SUCCESS)
   240			return rc;
   241	
   242		if (unlikely(insert_metapage(dst, mp)))
   243			return -EAGAIN;
   244	
   245		page_offset = mp->data - folio_address(src);
   246		mp->data = folio_address(dst) + page_offset;
   247		mp->folio = dst;
   248		remove_metapage(src, mp);
   249	
   250		return MIGRATEPAGE_SUCCESS;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

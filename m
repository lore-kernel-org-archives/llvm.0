Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC1156678;
	Wed, 29 Jan 2025 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166972; cv=none; b=q1WDeJ/wppiD6QDkftMFbRqo5g7mu8OEp4LevvViQf1WgLac9YPxShD7hlAcYJ+vI8X7s3Do3LbntqpDR/SJj/sa+TsYWBSi2bCPnUkUi/r4bHuP1asJz2cHiv48bzXNUc+Vqt4/qfdGz0xl35TAK8T0esXEPuEQrprleaALo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166972; c=relaxed/simple;
	bh=wm4zHgGryETRpW1walIQusMYxmzczsl5+w3hLPABMNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0vHnoZz7j4AMNMywPvl2kRA6aRhsPLiLfMNHro5gKCpdBAo4q4M58JSsBQgcKXapJhicAQUnPcP6GQqQyVSGmp7GzH/tuqmGFw4n3/3qdBWplVJM5CgC7qHNmeb4omeeBQef11LsPiS7dTLDsklWB33klgem2Ju85WvsyZrED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc3cbQkN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc3cbQkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738166970; x=1769702970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wm4zHgGryETRpW1walIQusMYxmzczsl5+w3hLPABMNk=;
  b=mc3cbQkNTSP3bXu+qyXfhqpIImA8tdQIf5bCnULlErjMurtopXYoUHbr
   MLNCjGBQ+U/8uJhdSUQ2lFGFMtqEbkkPKaMhdSWUqWgu+p90s6Inwc9Mg
   UNhYbT+x2cFg1nmxbIhjG/eM2iWoUD46sAdZgo6U2v0l2Al7VDZAc690Q
   GuprJHiyVHDR/DihP4XQysc/oWOa1N+QDKaSKlJNdwa+nXLuVUuUL/Ksu
   X4I2Cvp+58zr6cUzY3voLeQ4HP8ShH/pPis3x3sxcoWPzlw8BMQbojRIl
   /Q03FVt605isRaBGrKCHfJoi5/whf9ySgyj3MGZjIFddwF2t3xoYffekQ
   A==;
X-CSE-ConnectionGUID: lo43jHwpT+mW5/+xiHEJoA==
X-CSE-MsgGUID: gYaX+VIETGqIDE0o7w4Ncg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38394394"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38394394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 08:09:17 -0800
X-CSE-ConnectionGUID: fO5hVIr7SziMeHYPiGIv6w==
X-CSE-MsgGUID: fDw4uS1/TfSPtErkU8rT5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113688567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 08:09:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdAcs-000j6A-0S;
	Wed, 29 Jan 2025 16:09:14 +0000
Date: Thu, 30 Jan 2025 00:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 19/43] net/ceph/databuf.c:143:9: error: call
 to undeclared function 'alloc_pages_bulk_array'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501300024.GpUfBI0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   99bca1b95b54b7a3e7260c2431b587639482a71d
commit: e4e0cb58c2b8c5d15293762a5dcc81d1de627c42 [19/43] libceph: Add a new data container type, ceph_databuf
config: s390-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300024.GpUfBI0f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300024.GpUfBI0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300024.GpUfBI0f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ceph/databuf.c:143:9: error: call to undeclared function 'alloc_pages_bulk_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |                 got = alloc_pages_bulk_array(gfp, want, pages);
         |                       ^
   net/ceph/databuf.c:143:9: note: did you mean 'alloc_pages_bulk_noprof'?
   include/linux/gfp.h:213:15: note: 'alloc_pages_bulk_noprof' declared here
     213 | unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
         |               ^
   1 error generated.


vim +/alloc_pages_bulk_array +143 net/ceph/databuf.c

   118	
   119	/* Allocate enough pages for a dbuf to append the given amount
   120	 * of dbuf without allocating.
   121	 * Returns: 0 on success, -ENOMEM on error.
   122	 */
   123	int ceph_databuf_reserve(struct ceph_databuf *dbuf, size_t add_space,
   124				 gfp_t gfp)
   125	{
   126		struct bio_vec *bvec;
   127		size_t i, req_bvec = DIV_ROUND_UP(dbuf->iter.count + add_space, PAGE_SIZE);
   128		int ret;
   129	
   130		dbuf->put_pages = true;
   131		if (req_bvec > dbuf->max_bvec) {
   132			ret = ceph_databuf_expand(dbuf, req_bvec, gfp);
   133			if (ret < 0)
   134				return ret;
   135		}
   136	
   137		bvec = dbuf->bvec;
   138		while (dbuf->nr_bvec < req_bvec) {
   139			struct page *pages[16];
   140			size_t want = min(req_bvec, ARRAY_SIZE(pages)), got;
   141	
   142			memset(pages, 0, sizeof(pages));
 > 143			got = alloc_pages_bulk_array(gfp, want, pages);
   144			if (!got)
   145				return -ENOMEM;
   146			for (i = 0; i < got; i++)
   147				bvec_set_page(&bvec[dbuf->nr_bvec + i], pages[i],
   148					      PAGE_SIZE, 0);
   149			dbuf->iter.nr_segs += got;
   150			dbuf->nr_bvec += got;
   151			dbuf->limit = dbuf->nr_bvec * PAGE_SIZE;
   152		}
   153	
   154		return 0;
   155	}
   156	EXPORT_SYMBOL(ceph_databuf_reserve);
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

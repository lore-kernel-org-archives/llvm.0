Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDDC278E42;
	Tue, 29 Apr 2025 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923455; cv=none; b=eYaNbOQFUHss+4I0aWHJJPmdD0cIrspblTEaq6t5eGzrSEFNpRZxzSkrjEMpYzLiOrSwmJX+BEZ9y0J1IGk9o4n2KRutpXDhhvwYV719nxx/Fr29QADW5gQWCp8JHvHhLvFQvjiHT1YAGGW6sDczqCbhzuoPFQQx3wQqol+ZgPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923455; c=relaxed/simple;
	bh=m/qJy+b8NE/HLp9V6SCwIyhElarYggTKKzO6CI8FZFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXa1mqxJZxboG2W4BXo8HyCa8EVsl9m+HLGO0jfcg2CmTAi0/m7ZeVeYhubBt0Ka3f+axubTlPgTOjLKyaHsssWrMuhF1PmC9V/XKUNSYW/IkWPM71hfjSYS6HKuXeMuEcJ3XaIf4P0KkeCRfmgaY1XzqEyiinfk2oG2OmANvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UflEYS+z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UflEYS+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745923453; x=1777459453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/qJy+b8NE/HLp9V6SCwIyhElarYggTKKzO6CI8FZFY=;
  b=UflEYS+zaz7FxWMMehzWUK45neFXI1cbOpJABMyWnAOfEoOBPLWuIlF2
   6ULFU0SaXKuS8VZQjr1YSeNQI7hJL6RTLtg31g1Nz0TdgwOD5ZM0PUJKe
   YAXLu7qzJp8fVptpMgPvByyo0jHxhXQRzdI31JwcSLEaSlEq6bcNY6kKz
   NNNujgluIDtInydzfoBsuomx9yQYLWbUloGtKNlhGxiIBRM95mtrwkHhT
   F7AXfUCUOhJf2baiOUViIcxhozMyJMcX0emHsLw0b2Exg3FXpsSkO0L8w
   R0xbG9p5M6Lp+fGdRmPRHxM8n0rrXhcf3kkndjCckraPWU/z3X5vJRiOx
   A==;
X-CSE-ConnectionGUID: yMBbHei2TuK/iLp0U+J3cg==
X-CSE-MsgGUID: IsBWvAV5RBSWgLPi4+VVrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58190987"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58190987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 03:44:12 -0700
X-CSE-ConnectionGUID: MfsDg1wETeyZlTYfM/4AbA==
X-CSE-MsgGUID: bBhn+R+5SSOSIp6Yb+Vg1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133672806"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 03:44:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9iRd-0000fB-0w;
	Tue, 29 Apr 2025 10:44:09 +0000
Date: Tue, 29 Apr 2025 18:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/6] fs/f2fs/data.c:153:38: error: use of
 undeclared identifier 'sbi'
Message-ID: <202504291850.1MMsrq8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   0d3a805efb57a446736f275ab88d6f8b29a3ad09
commit: 238708a6490ffcfb6314c2a8b2238d2bf2b3178b [5/6] f2fs: fix to do sanity check on node footer in read_end_io
config: s390-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291850.1MMsrq8x-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291850.1MMsrq8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291850.1MMsrq8x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:153:38: error: use of undeclared identifier 'sbi'
     153 |                 if (folio->mapping == NODE_MAPPING(sbi)) {
         |                                                    ^
>> fs/f2fs/data.c:154:8: error: call to undeclared function 'sanity_check_node_footer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |                         if (sanity_check_node_footer(sbi, folio, folio->index,
         |                             ^
   fs/f2fs/data.c:154:33: error: use of undeclared identifier 'sbi'
     154 |                         if (sanity_check_node_footer(sbi, folio, folio->index,
         |                                                      ^
   3 errors generated.


vim +/sbi +153 fs/f2fs/data.c

   122	
   123	/*
   124	 * Update and unlock a bio's pages, and free the bio.
   125	 *
   126	 * This marks pages up-to-date only if there was no error in the bio (I/O error,
   127	 * decryption error, or verity error), as indicated by bio->bi_status.
   128	 *
   129	 * "Compressed pages" (pagecache pages backed by a compressed cluster on-disk)
   130	 * aren't marked up-to-date here, as decompression is done on a per-compression-
   131	 * cluster basis rather than a per-bio basis.  Instead, we only must do two
   132	 * things for each compressed page here: call f2fs_end_read_compressed_page()
   133	 * with failed=true if an error occurred before it would have normally gotten
   134	 * called (i.e., I/O error or decryption error, but *not* verity error), and
   135	 * release the bio's reference to the decompress_io_ctx of the page's cluster.
   136	 */
   137	static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
   138	{
   139		struct folio_iter fi;
   140		struct bio_post_read_ctx *ctx = bio->bi_private;
   141	
   142		bio_for_each_folio_all(fi, bio) {
   143			struct folio *folio = fi.folio;
   144	
   145			if (f2fs_is_compressed_page(&folio->page)) {
   146				if (ctx && !ctx->decompression_attempted)
   147					f2fs_end_read_compressed_page(&folio->page, true, 0,
   148								in_task);
   149				f2fs_put_folio_dic(folio, in_task);
   150				continue;
   151			}
   152	
 > 153			if (folio->mapping == NODE_MAPPING(sbi)) {
 > 154				if (sanity_check_node_footer(sbi, folio, folio->index,
   155							NODE_TYPE_REGULAR, true))
   156					bio->bi_status = BLK_STS_IOERR;
   157			}
   158	
   159			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
   160			folio_end_read(folio, bio->bi_status == 0);
   161		}
   162	
   163		if (ctx)
   164			mempool_free(ctx, bio_post_read_ctx_pool);
   165		bio_put(bio);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

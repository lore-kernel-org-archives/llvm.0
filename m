Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205444C77BF;
	Fri,  5 Jun 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656643; cv=none; b=qBHEQ2noGl/yuwGOLTRIs5qQoW4xI4s6aDsKv2EcDqwPBo7P0tYDjp3bLchkc3vbruuKurnqz36DGEwyLBqJ8NPBD2likKWAtVnx/FvGtYha2ymttd1bufggXyGVu11OHDuMdHZIXRQbU+r3l/rqRtfkGNWf+5dNu/7W8r5r7TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656643; c=relaxed/simple;
	bh=GKK7WfGkKQYtFjmLO9iFyUTBlOq47vtLXTU84yExILQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pDxqrXEPDVRZ8pITBMUSSUHLXmfVediJz/yRyNOdabMiC5Nai/RlpWftxx6+nd/BAFRg+R8ICr7xvV8t+HsbhrmoKxsNiQhr7VD7jPizR3Bjt40tg0p/O3WRoQIvGXKm0uwsVvnUNNHTvQ+qAGHVkgloPllR33W7MITw8PYlk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0LvzDFt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0LvzDFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780656643; x=1812192643;
  h=date:from:to:cc:subject:message-id;
  bh=GKK7WfGkKQYtFjmLO9iFyUTBlOq47vtLXTU84yExILQ=;
  b=a0LvzDFttjMWkqtiXk7B86T2r1UDXYr7YS/jHcvzdSwyi9aZvLVPf5j6
   Xnlna4PL4wbHNmTIj+c6Sgtwxx8LDqs6bLTcbSLxYTVdGwCa+qGUqQqwo
   UzT9Nq/vgiF6MT3fbLVWgsYtOnF6G/t60Lh4zcAQfm6gnHtAHPA35r4lJ
   SvyavzCB6hmilG25hpexjRqGvMof8oIptim5MHKbyaGkshDKcNmM0wy6Z
   i/eYhZ17tfv64leCUzroUC1xPutBMJB5txo9X8/9braIXxIflc4eQ6lnX
   rAcxejr3dRGGR8kTUeJ1ZSRPfnnjGfQsT4uENSOzEnQoImwZZfZ+bgchz
   A==;
X-CSE-ConnectionGUID: Yil8+pRbRayN0idDzQMvvg==
X-CSE-MsgGUID: XawD2q7+QDWBCSrGpjQdTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81236490"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81236490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:50:39 -0700
X-CSE-ConnectionGUID: Glz90DjTS9WaHlh75qnMVw==
X-CSE-MsgGUID: 4ixzoeSmTZ+pC2HSUuwzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="246647509"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 03:50:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVS8I-00000000Ftw-0NyQ;
	Fri, 05 Jun 2026 10:50:34 +0000
Date: Fri, 05 Jun 2026 18:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [brauner-vfs:vfs-7.2.iomap 6/10]
 fs/iomap/buffered-io.c:577:5: error: call to undeclared function
 'fsverity_fill_zerohash'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202606051838.FGBZXbNu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.iomap
head:   7cf86a52cd64d21a9511f2659cb87d3aab2cc1d4
commit: 014c8fc41d92d1c48e9c08cb92ab3761f4956d4f [6/10] iomap: teach iomap to read files with fsverity
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260605/202606051838.FGBZXbNu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051838.FGBZXbNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051838.FGBZXbNu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:577:5: error: call to undeclared function 'fsverity_fill_zerohash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |                                 fsverity_fill_zerohash(folio, poff, plen,
         |                                 ^
   1 error generated.


vim +/fsverity_fill_zerohash +577 fs/iomap/buffered-io.c

   526	
   527	static int iomap_read_folio_iter(struct iomap_iter *iter,
   528			struct iomap_read_folio_ctx *ctx, size_t *bytes_submitted)
   529	{
   530		const struct iomap *iomap = &iter->iomap;
   531		loff_t pos = iter->pos;
   532		loff_t length = iomap_length(iter);
   533		struct folio *folio = ctx->cur_folio;
   534		size_t folio_len = folio_size(folio);
   535		struct iomap_folio_state *ifs;
   536		size_t poff, plen;
   537		loff_t pos_diff;
   538		int ret;
   539	
   540		if (iomap->type == IOMAP_INLINE) {
   541			ret = iomap_read_inline_data(iter, folio);
   542			if (ret)
   543				return ret;
   544			return iomap_iter_advance(iter, length);
   545		}
   546	
   547		ifs = ifs_alloc(iter->inode, folio, iter->flags);
   548	
   549		length = min_t(loff_t, length, folio_len - offset_in_folio(folio, pos));
   550		while (length) {
   551			iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff,
   552					&plen);
   553	
   554			pos_diff = pos - iter->pos;
   555			if (WARN_ON_ONCE(pos_diff + plen > length))
   556				return -EIO;
   557	
   558			ret = iomap_iter_advance(iter, pos_diff);
   559			if (ret)
   560				return ret;
   561	
   562			if (plen == 0)
   563				return 0;
   564	
   565			/*
   566			 * Handling of fsverity "holes". We hit this for two case:
   567			 *   1. No need to go further, the hole after fsverity
   568			 *	descriptor is the end of the fsverity metadata.
   569			 *
   570			 *   2. This folio contains merkle tree blocks which need to be
   571			 *	synthesized. If we already have fsverity info (ctx->vi)
   572			 *	synthesize these blocks.
   573			 */
   574			if ((iomap->flags & IOMAP_F_FSVERITY) &&
   575			    iomap->type == IOMAP_HOLE) {
   576				if (ctx->vi)
 > 577					fsverity_fill_zerohash(folio, poff, plen,
   578							       ctx->vi);
   579				iomap_set_range_uptodate(folio, poff, plen);
   580			} else if (iomap_block_needs_zeroing(iter, pos)) {
   581				/* zero post-eof blocks as the page may be mapped */
   582				folio_zero_range(folio, poff, plen);
   583				if (ctx->vi &&
   584				    !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
   585					return -EIO;
   586				iomap_set_range_uptodate(folio, poff, plen);
   587			} else {
   588				if (!*bytes_submitted)
   589					iomap_read_init(folio);
   590				ret = ctx->ops->read_folio_range(iter, ctx, plen);
   591				if (ret < 0)
   592					fserror_report_io(iter->inode,
   593							  FSERR_BUFFERED_READ, pos,
   594							  plen, ret, GFP_NOFS);
   595				if (ret)
   596					return ret;
   597	
   598				*bytes_submitted += plen;
   599				/*
   600				 * Hand off folio ownership to the IO helper when:
   601				 * 1) The entire folio has been submitted for IO, or
   602				 * 2) There is no ifs attached to the folio
   603				 *
   604				 * Case (2) occurs when 1 << i_blkbits matches the folio
   605				 * size but the underlying filesystem or block device
   606				 * uses a smaller granularity for IO.
   607				 */
   608				if (*bytes_submitted == folio_len || !ifs)
   609					ctx->cur_folio = NULL;
   610			}
   611	
   612			ret = iomap_iter_advance(iter, plen);
   613			if (ret)
   614				return ret;
   615			length -= pos_diff + plen;
   616			pos = iter->pos;
   617		}
   618		return 0;
   619	}
   620	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

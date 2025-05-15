Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFC8223DE2;
	Thu, 15 May 2025 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307075; cv=none; b=D0rDO6i4D0j48qT7jau/BYqmsGo1hAB5Yoq1b4KTqXuqQZrx/UW4fjlyGcXbcZc3I5slC4QYley5BQVF0UnbSNtz512O+HbrO0ZYCRnz0WlAyaf9B9T2jTefKw/tyVBcVfH8ixQhffHg5CwMkEBBx2ZRNlp0OSlMeOzKWdawq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307075; c=relaxed/simple;
	bh=/AGqmI6YQsQWWPC4epgFkZ4hgo+SZOT+cLfsDITz764=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEJJdrLDcmlolGXflqJkFcj15OazlO4m3xap9YYa/LN4oHwt1H7WdEYmNHaZgUq9AB+6SnUqWJU/tGDejGYzOstwEJFcqBVUVuWdQhwWhRJoJdFDxgi9nh9B5HkkyI3LHIMVwqxZ4IHZ56t2XXu23BUkSLqckbHJzYA+yxQ1Wgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHM+9WPK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHM+9WPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747307074; x=1778843074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/AGqmI6YQsQWWPC4epgFkZ4hgo+SZOT+cLfsDITz764=;
  b=CHM+9WPK24uIUxHlLcIW23a9OOIqQHf4S+7dtsjnMvZb23TMC22Mi4ud
   TxwLQE/UL4gtmDlyV9Lz6/lkQpJaYtX1A6nWAgrSFJ+OF/r2iA6wCcH0B
   f1ydApPdtfOOGJj/RBcolFZLYBuK4tnlzhbXaBcwOlePJgn/UGjNp2oUx
   OBA12KYUX3/9EAjjCrLDJufbBfUAkNLDUcO8987AOrKMNDV/GhrE5P3Wv
   XXK7vjAribIbFOYeCWzpG7omi/1E7tFBHBVmFx5+5kBs0drVZXDseLux4
   MUh3itm+O6ldZdlkMQr2ppDlAMS9K3/lIOtX5JAAcNKY5bPBW9f2tNCqF
   w==;
X-CSE-ConnectionGUID: 52+PYY0cRN+d58fX/PgLDA==
X-CSE-MsgGUID: v5v+6gHWQaywt5l7a7b8xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60573543"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60573543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:04:31 -0700
X-CSE-ConnectionGUID: EHZn6GfgSCa8UqxUkSWaYA==
X-CSE-MsgGUID: JXgKmvYATfG7d5/geoIlQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143444360"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 04:04:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWO3-000IIV-28;
	Thu, 15 May 2025 11:04:27 +0000
Date: Thu, 15 May 2025 19:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 35/41] ld.lld: error: undefined symbol:
 nfsd_handle_dir_event
Message-ID: <202505151907.LkW9rsjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   320d6bdec4f569941d0c7ebd1f7b9e5951c18454
commit: 53211d47195dbe072e2ae078acb0d83fb51de74a [35/41] nfsd: add notification handlers for dir events
config: i386-randconfig-017-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151907.LkW9rsjr-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151907.LkW9rsjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151907.LkW9rsjr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfsd_handle_dir_event
   >>> referenced by filecache.c:746 (fs/nfsd/filecache.c:746)
   >>>               vmlinux.o:(nfsd_file_fsnotify_handle_event)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

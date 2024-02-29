Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A734AECD;
	Thu, 29 Feb 2024 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709226829; cv=none; b=UOGOxNaV+qeeK7M/zToM4Htyyrj9QwiIZFrJlW5ocRUSocU9bhlJfFQyirMQt1NkSVhLZcYJdDJHjpETrooCbHJag0ryni5lciItNSGExQUUjOLIzqJd2wTARYdj2s6/2S+6+WwgRRnrOw5hXj369aVjHU+XcXSJ3E0yVnydWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709226829; c=relaxed/simple;
	bh=VXVqp/j1TKoXfxqeZeKmNEs8tR4VsXdAtKHwzNXib2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=No0XX5riCbJhPvNiSlrGsIlZ1qY9hetdY1x2KOn5Wpf+W8ofU+HQItGEPAj6uVJSqGCpRKN5yuaARtGg5LtDBNK1MLe5iVFHkpTuI37zxvixosgmgJycFnUsin7tAagVp95T3gStukyC2oFtBV7WkRRLyFssQ59DQKuMOYcRfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZYYMzaK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZYYMzaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709226827; x=1740762827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXVqp/j1TKoXfxqeZeKmNEs8tR4VsXdAtKHwzNXib2Q=;
  b=IZYYMzaKLo6lKl702v7Kcdg7tedJDRH2i8S569/A7uOmdvn8ez/yhVo6
   lVl8RneRAsHbuHqSeKSfetuv/Ioh9VpzDGzPtCiyRxpLhfqTcTB0x4KFt
   rInb8p+DnrHPWnpZwRG6UpmjuMaBxL1U6+mZdLbVj9JRCLpzxT+lkXQ2T
   aEHG4nScxvd5l1rd8CjGH2zQDm0v9CG9G8lRWGLfuB2PsgHJe+nBLGhY3
   eLAToIb6+2ZFIviH1Pi6nPIQagSLqgWtxOopIBRBcOT7nHL9XL+cYMpZA
   +i/O7Bm3GM/sz2FLihMZaMdrXWh2ygO4gho0dSX+N8qUVBR1V87HkhNLO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14417822"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14417822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7766717"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 09:11:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfjwE-000D8L-2i;
	Thu, 29 Feb 2024 17:11:18 +0000
Date: Fri, 1 Mar 2024 01:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 30/30] fs/cachefiles/io.c:640:24:
 error: use of undeclared identifier 'BIO_MAX_VECS'
Message-ID: <202403010143.OlWnhA40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   afd4a14c1f0fde0fd833c3d1984c4ebb5981f7f8
commit: 920c10a555e2742546325940063cadc115de6a08 [30/30] netfs: Use writeback_iter()
config: x86_64-randconfig-002-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010143.OlWnhA40-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010143.OlWnhA40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010143.OlWnhA40-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/cachefiles/io.c:640:24: error: use of undeclared identifier 'BIO_MAX_VECS'
     640 |         subreq->max_nr_segs = BIO_MAX_VECS;
         |                               ^
   1 error generated.


vim +/BIO_MAX_VECS +640 fs/cachefiles/io.c

   624	
   625	static int cachefiles_preprepare_write(struct netfs_io_subrequest *subreq)
   626	{
   627		struct netfs_io_request *wreq = subreq->rreq;
   628		struct netfs_cache_resources *cres = &wreq->cache_resources;
   629	
   630		_enter("W=%x[%x] %llx", wreq->debug_id, subreq->debug_index, subreq->start);
   631	
   632		if (!cachefiles_cres_file(cres)) {
   633			if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
   634				return -ENOBUFS;
   635			if (!cachefiles_cres_file(cres))
   636				return -ENOBUFS;
   637		}
   638	
   639		subreq->max_len = 16384; //ULONG_MAX;
 > 640		subreq->max_nr_segs = BIO_MAX_VECS;
   641		return 0;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

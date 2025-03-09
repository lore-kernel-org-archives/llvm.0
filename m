Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02656211C;
	Sun,  9 Mar 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741522810; cv=none; b=bWHmWGv6ssH5H/TX3XwGAZKZIlzK3na5j+EfHYqzzSEMFIuRkjYZ0ZrEDd/4484J/H2ZZbF+P7D4GUwI7vvSsYe2fK06zyYdTFt/EX6xICHuCWyAm/rdf5e6KsQ8NW12OektViiKEGjVlP7l/oJNIeKWhyUbPG13806BYAXfOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741522810; c=relaxed/simple;
	bh=FBfm+xo1vqTjDpoWeRpN2M/Ankc/SCdLuV1dwK9Cnic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3gQ8osX55g3E14fvGoXV1XLk+cK9AsKRd9v+3nncjWHntNFynnCKivXTwkA6x/QSXhlFnV0eIkljCDVgCYIYMV/5O2T/SUstWL0JH5tQ6rkvGrWdRYVOR5nqIqagCT+U2KircGPAbtLHmPjryk00F2I4RzxxrRTmSOO+Zi76xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReN+ZyCx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReN+ZyCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741522809; x=1773058809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBfm+xo1vqTjDpoWeRpN2M/Ankc/SCdLuV1dwK9Cnic=;
  b=ReN+ZyCxAFHMKy1GU0kWWgP61FDguGV4sychl0ywwk79RcndeiHz452j
   R+LnVVsQ91Hfsvr/4V9LhRfzOtdX9Xz3NKtmpN7TLX2ce/j7SJ3nnmJGj
   dgIUslS4zfyIYMXY1pnaYHI750nXkHhy7/6S4rgq8MUDVkPxqxirowiWI
   sXCL0o1sDXpM21FktywAysJhvZGXz/+qi4s6vd+gqAzXOSjIFQRPv4YjT
   YnOoaIM8LZIJZ0gvsY3uo5toU1cDqiwMKt6ycqgKb4N2inJnSo0V0/ROJ
   mL30C5CnFcC/y+VYlSyCIgFvpLVvjkjpvuKkOP3GOxpjxCrn5IBJUk8Us
   g==;
X-CSE-ConnectionGUID: tjoSUmDRSK664PGv+ctMpA==
X-CSE-MsgGUID: ocMQVBNSQr+RCM7GEv/k4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42230943"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42230943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 05:20:08 -0700
X-CSE-ConnectionGUID: BFMlb1NhShuHNc0qPb0xbg==
X-CSE-MsgGUID: C0y1rclwR4KtGYZERbAZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119689047"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2025 05:20:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trFdU-000352-00;
	Sun, 09 Mar 2025 12:20:04 +0000
Date: Sun, 9 Mar 2025 20:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 8/9] fs/nfsd/nfs4proc.c:797:2: warning:
 label at end of compound statement is a C2x extension
Message-ID: <202503092055.5Awz8EoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   7162c90c3e04a073c111a5821e529377ce2ab43f
commit: f1681c62918a99afaf3528b5332aa647740eb818 [8/9] nfsd: add tracepoints around nfsd_create events
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250309/202503092055.5Awz8EoC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092055.5Awz8EoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092055.5Awz8EoC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4proc.c:797:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
           }
           ^
   1 warning generated.


vim +797 fs/nfsd/nfs4proc.c

   778	
   779	static umode_t nfs_type_to_vfs_type(enum nfs_ftype4 nfstype)
   780	{
   781		switch (nfstype) {
   782		case NF4REG:
   783			return S_IFREG;
   784		case NF4DIR:
   785			return S_IFDIR;
   786		case NF4BLK:
   787			return S_IFBLK;
   788		case NF4CHR:
   789			return S_IFCHR;
   790		case NF4LNK:
   791			return S_IFLNK;
   792		case NF4SOCK:
   793			return S_IFSOCK;
   794		case NF4FIFO:
   795			return S_IFIFO;
   796		default:
 > 797		}
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

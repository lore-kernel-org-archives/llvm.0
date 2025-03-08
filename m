Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D437E0E4;
	Sat,  8 Mar 2025 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741460638; cv=none; b=rcYOtoTWP7TBSgacxWgJxNQwtadAb+Wh7N1KqApVcVfwM/YC3jZ0hW8AeFMXjIwpDEv0gn3UR349LfFWWfWkh9WqfAMY9RZycuYSWhfy0lU8ESMf/BUXx7PdqiqlTZzP77nmZPLwVqdM8H5T+ZmExpxb9KAkgFGKG6eacGMZtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741460638; c=relaxed/simple;
	bh=65kqqOsjZaiM1VgbRJnR4M7Afd5DgByNmFYUFii1nB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loctNI2SCjyofR0ruslzmwXWdQBs/vr7nN/EBAwOWpkqCU/femXlRMcBpBMFAh1SjD0S/5kxjgbBFB9GCdVYpIXuEthCEJ1FH9WRDzrLWyp5WFiRzGKL2Gm13sR6z7N1EvSyv7TCXHSTbQUjykBUAfG0u9TLO8E54maTR9VJBKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcXPzNSo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcXPzNSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741460637; x=1772996637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65kqqOsjZaiM1VgbRJnR4M7Afd5DgByNmFYUFii1nB8=;
  b=fcXPzNSob9tmmvPRhPd6xRWvoyamVA3lxGF71egZdzl8axZWLX7lXdt5
   Hy/6ix63Ol0URJLkIVd854yrEuCozQcNo//JfK/tt1HjqzkUeBeWDFRL+
   qcCtbiUD7PwLkvjH1fBrRtahA9GGoUfCQ5pHitFQa/lgvKhLl8Yc0knHB
   3bPPAD/+LjSpucehelnapwl9sH14IR9l9aoSiJsAFzaV7L1dbcdZzzb61
   j1a50PdOfHSQwWS7+byec93nwGHbPhE0ggFX9Mgc1QrsZgPFQvYUK31mJ
   fW5rlh+x0be2fjyhSuZZ08SjLh9z+BacP3srk+QnzQVL79PZWzeLJ1w1V
   w==;
X-CSE-ConnectionGUID: LfYMi/4QTi6grInyW4+fNw==
X-CSE-MsgGUID: Am2oxLNnRo6aPPlC6WS+zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42632746"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42632746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 11:03:56 -0800
X-CSE-ConnectionGUID: mwyqAACbTuK9LXorcgrneA==
X-CSE-MsgGUID: fIe6VNYnQFOKHlW2UIH9Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="120301243"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2025 11:03:56 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqzSi-0002Do-2l;
	Sat, 08 Mar 2025 19:03:52 +0000
Date: Sun, 9 Mar 2025 03:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 8/9] fs/nfsd/nfs4proc.c:796:10: error:
 label at end of compound statement: expected statement
Message-ID: <202503090203.YzYCBsQA-lkp@intel.com>
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
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250309/202503090203.YzYCBsQA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090203.YzYCBsQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090203.YzYCBsQA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4proc.c:796:10: error: label at end of compound statement: expected statement
           default:
                   ^
                    ;
   1 error generated.


vim +796 fs/nfsd/nfs4proc.c

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
 > 796		default:
   797		}
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

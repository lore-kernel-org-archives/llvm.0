Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E44C85;
	Sun, 27 Oct 2024 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992127; cv=none; b=DYvR1ty5wocras6BIXC/nwwzm8ClwbC9NzTNVjFqmdI/9SXbiqJyJgfJBkfXdzpE8KCm1ZjYv0EJCsTumuwovXRXBDs0pRCyb3AIPE170Z4Wb1bfj5qHmzdsdMd72T61nOMiO6Zzpv23sVCTGyfb4mJPg0CT5W1p77msMOMzD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992127; c=relaxed/simple;
	bh=D4X3kE5WRSKG7lOgw/OVlng3E7IHcb/ncp7fIHotzqA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tll3+z71RxKLJ0l31FHm1G8llrYJyP1CfyCjqtt58DJ0oEFMW5HRcOLz6hElna52I66V96WTO6YgLwuLaYQGNzOIO8NbUY8AacLf6pX/F7GnWqnWXzXWJj+QTTxF8q7kvA5fNbaStbv1w05s3GjDOE6FqNgTk0/ZUwOjkVTbfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB80UBfI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB80UBfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729992125; x=1761528125;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D4X3kE5WRSKG7lOgw/OVlng3E7IHcb/ncp7fIHotzqA=;
  b=iB80UBfIZp2ND68ss2/JhzqsSKy4F9htZvlPDc8rNsmfJFglXKT7c+Rm
   Kw4Onq7hbTMoq21vSAcY0TNe9bt7jVNnz06DZ/GtUKNOZYvX5E48pTkHe
   tqOjXQ0waokHXz9uX/GfhhXAR3Wt3Uku9U6j1eMpn7DAF5q13lwyIyQXB
   jvMgN8qnOIFTle1liKTa1QZ7R7kSYc1pZUqDBSHJt8wka/sk4bdUED2gL
   +j0eGzZf5oSibtApyKRo+iAu5QykS+AL9ubC3D8r329NSJ7q2y6kOj3i8
   OG8xPxN7wrJ0PccrOkMX/6oBFc+HdU0pa77I/65oc3iSHZhPckSljSJlc
   Q==;
X-CSE-ConnectionGUID: ZYfpv+wLQcKzPN6ghT/vag==
X-CSE-MsgGUID: ELub7LPATGy8swqbonCYyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29088633"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29088633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 18:22:04 -0700
X-CSE-ConnectionGUID: sevu5ZbmTKibhhr8U87OGQ==
X-CSE-MsgGUID: capuG8N4Sfy8uZqJbMipQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85228244"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 18:22:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ryj-000aF0-1U;
	Sun, 27 Oct 2024 01:22:01 +0000
Date: Sun, 27 Oct 2024 09:21:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 29/35] fs/netfs/netfs.o: warning:
 objtool: .text.netfs_retry_reads: unexpected end of section
Message-ID: <202410270955.yg6oU3O3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   c7c0ac11bb2527f2257071bcbe4c5f9fd8fb1419
commit: e2973a7144165a67ca82dffba3fb71185a0af097 [29/35] netfs: Change the read result collector to only use one work item
config: x86_64-buildonly-randconfig-005-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270955.yg6oU3O3-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270955.yg6oU3O3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270955.yg6oU3O3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/netfs.o: warning: objtool: .text.netfs_retry_reads: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

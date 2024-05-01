Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE912DDBC;
	Wed,  1 May 2024 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571785; cv=none; b=rCDOJWOJAVCrqKfc8RqlVyvAC3LRMFimD0Qe+DT0l4p+A/YI0G2fePqR5/inucE5yOdMIeVuwPzLdD7ipZitKkEZikobCpenvw+ExwvvbiNBnCE5tVde4w/BwvjMdexiaWut4drAdJ87+/ZUsgBrhE6iyqU23WeOshUhLIJvK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571785; c=relaxed/simple;
	bh=td1evzhxKVCcXoExF/ICVf1Ir3tX2tTjk3mMcZVyb4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjWmNpiBF75PykBXaprDIkfkjN7LJxBIb06zkkfnFUyNKiLVrM0M1qxEnqP9crMPeAAmFDLES5tXXL8TH2hQ5N5on+Zjp/U+Lv52njHO/TBd0wIicv0InN5P0dUjTsyqaFtvdKrVYFPWoIRB9OqV8Db56enYkxyuU1EMTt4mBEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTX94s4X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTX94s4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714571783; x=1746107783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=td1evzhxKVCcXoExF/ICVf1Ir3tX2tTjk3mMcZVyb4s=;
  b=TTX94s4XKu/4lhbW0Vp7dAuU+IUFVaB/y1vkPknqm4Unbbf//9UY/kf5
   +pzNui0L9uJH7xQLIjUB2NxlkxOnf95LKbAoNg+FeV/f/Q3LwRP2UisI/
   qkQdUY4zf9DcWI4TID7Olq+cSDSu8OOqIKyfeeM9tNFtvvHmh5h60ti5r
   g6sqQhabsIAR8KLfIMnGicbOaFUZ2yyk0Q1qHBJlBGmL+1ZJf3UKmshQp
   d+aXRk/OkruNjZ3Yh89c5uka3juhySn4dlz7npHyvOBavAJLmXHwd2C5H
   13fckCWaDU+yOtF1dLgOmlggRX7SCq7inuYKca3rTX16aJhw6bJBftzUU
   w==;
X-CSE-ConnectionGUID: b52/V8XkQqCsA76CGiV/iw==
X-CSE-MsgGUID: LIibMCVLSCWdbHQ5ZuUPzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="13228425"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="13228425"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 06:56:22 -0700
X-CSE-ConnectionGUID: u9z/Ewa7QwywGCD1IK/WbQ==
X-CSE-MsgGUID: jWUJMaDuR26Ta8nnJdA/KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="27214736"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2024 06:56:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2ARW-0009a0-2g;
	Wed, 01 May 2024 13:56:18 +0000
Date: Wed, 1 May 2024 21:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [brauner-vfs:vfs.xattr 2/5] ./usr/include/linux/xattr.h:25:2: error:
 unknown type name '__aligned_u64'
Message-ID: <202405012137.vO3QRlq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.xattr
head:   0703b9aad555387113b9112cdc84469d12fda266
commit: 71491cbe0205be53be1a044594698eb21c1c15f4 [2/5] fs/xattr: add *at family syscalls
config: i386-buildonly-randconfig-006-20240501 (https://download.01.org/0day-ci/archive/20240501/202405012137.vO3QRlq7-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012137.vO3QRlq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012137.vO3QRlq7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/xattr.h:25:2: error: unknown type name '__aligned_u64'
      25 |         __aligned_u64 value;
         |         ^
>> ./usr/include/linux/xattr.h:26:2: error: unknown type name '__u32'
      26 |         __u32 size;
         |         ^
   ./usr/include/linux/xattr.h:27:2: error: unknown type name '__u32'
      27 |         __u32 flags;
         |         ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

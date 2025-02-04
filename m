Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C01223309;
	Tue,  4 Feb 2025 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676771; cv=none; b=adgig4DExWX2aqe9he6M24pgMuQoLOtIBZpHvZm4hmu/6yRXp5MSSKIDhKfW5N1cn5+EQow3J+fUei5UYGDj81ykOErlfiIHmYd5g/moBGcHNnyyitw3j6iBoXMY76yEfEm1g0OLHgNxJ9ddpAZhetRmjI9Qdlnaz27/5eQ/F5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676771; c=relaxed/simple;
	bh=hjvJ6WaP8HusSUr9o/YhxY6iYTvJNIoZ1HKWn/qmXT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikRMKktAvw4wXQwFdUKtYO7gOWDykKnotZACO9ClWeYumTI9EU+JxbZ6zZHKB4G7XFUWxNkcCejrPKUvvIWWcaYOBpHpj8eD/4qE9CpN0QKecHQM1MLphnthl6Q4a3KCCkJup/VqV2ZNfhBXj5wTy5kxduj522AWdpypFm5Au48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc8jlL+w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc8jlL+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738676769; x=1770212769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjvJ6WaP8HusSUr9o/YhxY6iYTvJNIoZ1HKWn/qmXT4=;
  b=Bc8jlL+wCvZYZGrj7NJI+1q32BCQ2Obw8hhcmjbVM4u0SUO54+dvsEEK
   4yv5t/ho/DtOxJu+SUzQGY0+DenkUNSjOnW0AVzMgqf6sWxR10zoSEJL6
   VDEGQaSn4FNC5nByMqOw1aqhALKUxJp+liKsLwyzyuJHRgIjcOaL7y41M
   +f+Uj3C7i6FsT8TDBjXSB4ll4eRaero7jATmro5B0mwCCjy48ts/CxfMf
   YPMDz+wvdTTE0RQ7lcB5BBUa2HmDByIysc8BoY061MSIMYFVLu86Ar8Vj
   wRq+XvU5qhfpvGGj+5sD5iQ923abv00s56gyP5bEP11kUQilyzeJXbrNP
   w==;
X-CSE-ConnectionGUID: wYPAwssaSSyIqZIHXtDwjA==
X-CSE-MsgGUID: ge1pnmD6QXejvPdMM7bmcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39463702"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39463702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 05:46:08 -0800
X-CSE-ConnectionGUID: cicf94GtTs6KGJK6fiHZaw==
X-CSE-MsgGUID: vbC1faCOQR+w/4xdCKJ9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115590149"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2025 05:46:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfJFc-000sXM-0q;
	Tue, 04 Feb 2025 13:46:04 +0000
Date: Tue, 4 Feb 2025 21:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 7/13] kernel/kexec_internal.h:48:46: warning:
 declaration of 'struct kexec_buf' will not be visible outside of this
 function
Message-ID: <202502042126.zNJDFdI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: 4a9f36010eba44853b3c9bb721a4a5f4319dc370 [7/13] kexec: Add KHO support to kexec file loads
config: i386-buildonly-randconfig-003-20250204 (https://download.01.org/0day-ci/archive/20250204/202502042126.zNJDFdI3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042126.zNJDFdI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042126.zNJDFdI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/vmcore_info.c:24:
>> kernel/kexec_internal.h:48:46: warning: declaration of 'struct kexec_buf' will not be visible outside of this function [-Wvisibility]
      48 | static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
         |                                              ^
   1 warning generated.


vim +48 kernel/kexec_internal.h

    42	
    43	#ifdef CONFIG_KEXEC_HANDOVER
    44	int kho_locate_mem_hole(struct kexec_buf *kbuf,
    45				int (*func)(struct resource *, void *));
    46	int kho_fill_kimage(struct kimage *image);
    47	#else
  > 48	static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
    49					      int (*func)(struct resource *, void *))
    50	{
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

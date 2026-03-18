Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813F23D2A1;
	Wed, 18 Mar 2026 04:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807506; cv=none; b=fEWBCmqUy4zuRsP8gveuTdUG96+T5RmKMwaaX/b3gxOrbJ8aRJnI97A5YG++/44p7+3d3bSmmGqxbTqi4e8GNMZR+zGH9/pY46q1NsQ+awcgRK6AkJH+jz5pADJQa+B/yyH2kO9I9CWcW1jih/ls+27zLw5u7II0GfMpncq7KLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807506; c=relaxed/simple;
	bh=v4X/oxrBXKl/yR6D2jQwzZicnWQPZRT+HICGQYyZtmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kt8QewwEGeVyRrYnoWGf5GHYdakW3s4nyy5apJ4SfTClZ8pB6aqOCxNN3BGFyYj1Ngh6i4qOZUDiACQJ+g+C3FpE/6vNDeHehJHgc8QvJGb0ZrvnKB6PlEYlM85aGAHWm3wIQlgJKCd9NrjEbNuI5iaqFsOT3niK2zvT3YXNWBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fm8k66Od; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fm8k66Od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773807505; x=1805343505;
  h=date:from:to:cc:subject:message-id;
  bh=v4X/oxrBXKl/yR6D2jQwzZicnWQPZRT+HICGQYyZtmI=;
  b=fm8k66OdNKBghHirpwbabm9KNB0srmXjgDDSiF21m2RqIsoie1GzxRv9
   stknDqn9W+E1hK39KFh3VCHQthp7CBDzUePSsFmo7wxjGO9gz/RO897RW
   4nZjJ9g/AtjOaSRR2jlv44kzNhlL/XAxvJX9cllHHbKgdVTnGD0PoHPWm
   TfCendc14XOzYpYwXukmgFNiLCU9AIUn9jewpaunpEte2wt9hOjnbz0vE
   mZyWP9WFBzWJ+FwbDouOYF9tTXV9ZEgfdcyzX80EJ+koUePXfblWSsaQr
   rbZYdcOPWGBCeY3lzIiVcvnU0De+j3gZyrtQGrzxLE/02Dr/Qh+nSCpfF
   A==;
X-CSE-ConnectionGUID: CVNlS5WmQoGHM0W0MJpymQ==
X-CSE-MsgGUID: gvQw7hONQ1KuSzSK0YP84A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85487733"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85487733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 21:18:24 -0700
X-CSE-ConnectionGUID: 2IDuQkL1QPGkuXf+nsLJ6g==
X-CSE-MsgGUID: z10XOIKsRm6S0XNt8TXM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226944379"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 21:18:23 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2iMO-000000002V3-12ir;
	Wed, 18 Mar 2026 04:18:20 +0000
Date: Wed, 18 Mar 2026 12:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dk:rw_iter 416/471] drivers/sbus/char/oradax.c:217:16:
 error: use of undeclared identifier 'dax_write_iter'; did you mean
 'vfs_write_iter'?
Message-ID: <202603181213.1fuVocnj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.kernel.dk/linux rw_iter
head:   7e8e9e30f1231e9ab34d17d42798297a502683f3
commit: 1abba19b9f1ba0b7c4affe9aeec06cd924713caa [416/471] sbus: oradax: convert to read/write iterators
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260318/202603181213.1fuVocnj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181213.1fuVocnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181213.1fuVocnj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/sbus/char/oradax.c:217:16: error: use of undeclared identifier 'dax_write_iter'; did you mean 'vfs_write_iter'?
     217 |         .write_iter     =       dax_write_iter,
         |                                 ^~~~~~~~~~~~~~
         |                                 vfs_write_iter
   include/linux/fs.h:2085:9: note: 'vfs_write_iter' declared here
    2085 | ssize_t vfs_write_iter(struct kiocb *iocb, struct iov_iter *from,
         |         ^
>> drivers/sbus/char/oradax.c:217:16: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct kiocb *, struct iov_iter *, ssize_t (*)(struct file *, const char *, size_t, loff_t *))' (aka 'long (struct kiocb *, struct iov_iter *, long (*)(struct file *, const char *, unsigned long, long long *))') [-Wincompatible-function-pointer-types]
     217 |         .write_iter     =       dax_write_iter,
         |                                 ^~~~~~~~~~~~~~
   2 errors generated.


vim +217 drivers/sbus/char/oradax.c

   212	
   213	static const struct file_operations dax_fops = {
   214		.owner	=	THIS_MODULE,
   215		.open	=	dax_open,
   216		.read_iter	=	dax_read,
 > 217		.write_iter	=	dax_write_iter,
   218		.mmap	=	dax_devmap,
   219		.release =	dax_close,
   220	};
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

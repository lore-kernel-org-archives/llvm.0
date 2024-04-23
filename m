Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B557880;
	Tue, 23 Apr 2024 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713862824; cv=none; b=ZVAQKqd2KmyRsrcIsCLKYbwpmpojNuskiZSzXeLmhoT1ScUHz2gsM3NXsfoPCei/IF0jTLF8mEzMmiNxv80LB61gDJukb2mz6n6/Bcuzz+6Qh/dGwejK4CAT+qtXCcmGGiyJjmPo0zs6WDT6tF53I3zHbyqCIc4wg3LKg/P2qAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713862824; c=relaxed/simple;
	bh=ZygaaiwMIs+eSq/9t/tXMMP08KMtapZjy/g2WygoLJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXc8ryHl+3HkIpynq2i6XjpD4Jxq9yjCVWOfQTGkWry/PcjSJLBJczCJv8OjMXFYg4QxfXlL6zUjW9EdajK+EzeOKRcLCfc4lUBqRnKxac4zcsWSoF+2eNUyvJg+bOErG6kmaV7Emm1kHMYWH12rgMnHjV29IJ+9KI4NNPzyRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmGyK/Wm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmGyK/Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713862822; x=1745398822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZygaaiwMIs+eSq/9t/tXMMP08KMtapZjy/g2WygoLJg=;
  b=AmGyK/Wmgyk8gvnnGEvz9QzKybORdyXKd+eAk0GCovibcpkyA1CchHcb
   A6fYe58ZcAf7ZYpmkm8DeUsyDLqb7/g3Htc18HrNCw4Nw0v5+B4tXUHGu
   AkhOHZ914KQMGd7HtYmokXvmnK3qIHyEOHoHgRLsAbM78QXIxT70E6hoA
   CPMyDBei14b1wSyHJPVomB9+qeqkEwUx+SP9KMm3n4Qz/NOsZDXLgU6Qi
   aEZilfHq/4l8miSekfhew46MvZj2bcouWi/6REH6faDpG7IyPIHpyRtFZ
   iuxAysfoyvEILVumxwvuwbSqDB6N3z8UPk+Lt4l9SH8VvQxu/av6QXVXT
   Q==;
X-CSE-ConnectionGUID: CtBCbIVzSlyjanj/711/yQ==
X-CSE-MsgGUID: FUHZvO7qQ6K88sxXtLAthw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26950560"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="26950560"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 02:00:21 -0700
X-CSE-ConnectionGUID: kO+u+q1IQX2tQ/mwkmaXcw==
X-CSE-MsgGUID: MINtFSJETT2xmDeJWdLKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24914831"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Apr 2024 02:00:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzC0f-00003s-1t;
	Tue, 23 Apr 2024 09:00:17 +0000
Date: Tue, 23 Apr 2024 16:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 335/438] arch/mips/kernel/vpe.c:856:5: error:
 expected ';' after expression
Message-ID: <202404231629.iwUVnBep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   89db07f28b15def984eadebee7eb8f15891a6390
commit: e5578d903b7d06069b56cfbe17988a10578ae897 [335/438] arch/mips: convert to read/write iterators
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20240423/202404231629.iwUVnBep-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231629.iwUVnBep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231629.iwUVnBep-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/kernel/vpe.c:856:5: error: expected ';' after expression
           ret !copy_from_iter_full(v->pbuffer + v->len, count, from);
              ^
              ;
   arch/mips/kernel/vpe.c:856:2: warning: expression result unused [-Wunused-value]
           ret !copy_from_iter_full(v->pbuffer + v->len, count, from);
           ^~~
   arch/mips/kernel/vpe.c:856:6: warning: expression result unused [-Wunused-value]
           ret !copy_from_iter_full(v->pbuffer + v->len, count, from);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +856 arch/mips/kernel/vpe.c

   836	
   837	static ssize_t vpe_write(struct kiocb *iocb, struct iov_iter *from)
   838	{
   839		size_t count = iov_iter_count(from);
   840		size_t ret = count;
   841		struct vpe *v;
   842	
   843		if (iminor(file_inode(iocb->ki_filp)) != VPE_MODULE_MINOR)
   844			return -ENODEV;
   845	
   846		v = get_vpe(aprp_cpu_index());
   847	
   848		if (v == NULL)
   849			return -ENODEV;
   850	
   851		if ((count + v->len) > v->plen) {
   852			pr_warn("VPE loader: elf size too big. Perhaps strip unneeded symbols\n");
   853			return -ENOMEM;
   854		}
   855	
 > 856		ret !copy_from_iter_full(v->pbuffer + v->len, count, from);
   857		if (!ret)
   858			return -EFAULT;
   859	
   860		v->len += count;
   861		return count;
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

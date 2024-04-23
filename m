Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499452F71;
	Tue, 23 Apr 2024 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713859101; cv=none; b=hPKr4EhHoAacCfxRNJnD75jeFv1qGRo0UxCkTMsSZX+mWDfGb+5fdJaAeZnwBnlztuWW7d0H4RZ1pG5OVRVm4SzuceSBA9JJhlrNnNQ7r25JkEb4pZGqnmif2+0ZL6cWRXWo3ijHTUM1XWACj+g9VRNJcAzJtjwn0HRYHRskKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713859101; c=relaxed/simple;
	bh=yOfnuZYzcvCFto48cquaJwaRYnVGj+RXuaNnnjy8KBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=faCGWYu7VUCywEf6iQNxOIUzg6CRDDoO673JnZqWTOCFKnbj4mYjB56vRAW4xNrIE1+gjvFZXe0RLECRGJ0zT9sqWEAhM1A1gV2DaXbWWvDIsygJe9lY/H1vYpPJPqFwnLgE4mxwAu95hKEvc429/SU+LjDdcJcAiCyOSryMBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIKQTdpd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIKQTdpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713859100; x=1745395100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOfnuZYzcvCFto48cquaJwaRYnVGj+RXuaNnnjy8KBk=;
  b=nIKQTdpdZhjPZ76cccah38u+OikJpy5lU8CYJPBL+6U+qiKRY036EZ2v
   9kOgrxtJXSjKGH2jL2ughEDxnIF+MH7+13jcWEbiK7sgvY+4RoDdPh488
   5uUfGzt58PnuX0SlqO9w/6ejufI/CYPitsgKBp6w4XzO5cLgyio0R4kpv
   DQBiyhzEyxkgsP95hmlhm8IUsESLZaAcols9OUUTU+aGEdEVLk2K87yzb
   XUvrp+SXtwdGcVxnoWPO8jpTJ9/v8kfFxuEcGk+KUWM6XDyqQeb/W3XwM
   0k1OENADHS3bKCT7TmwwtPZek8pH1Zjd1RAQ9HqnK6qChaFSisgkEZ00S
   w==;
X-CSE-ConnectionGUID: 8beeOomuT92iKkCAMS4vTg==
X-CSE-MsgGUID: JRx4kkL7TDaHkPlVUaERJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31920310"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="31920310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 00:58:20 -0700
X-CSE-ConnectionGUID: ospN8u+iRwO+GAkHkns80A==
X-CSE-MsgGUID: +72KZSbqSZOlOaKYYRKNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55487002"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2024 00:58:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzB2e-000020-1W;
	Tue, 23 Apr 2024 07:58:16 +0000
Date: Tue, 23 Apr 2024 15:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 335/438] arch/mips/kernel/vpe.c:856:2: warning:
 expression result unused
Message-ID: <202404231509.m8XUwqdQ-lkp@intel.com>
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
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20240423/202404231509.m8XUwqdQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231509.m8XUwqdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231509.m8XUwqdQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kernel/vpe.c:856:5: error: expected ';' after expression
           ret !copy_from_iter_full(v->pbuffer + v->len, count, from);
              ^
              ;
>> arch/mips/kernel/vpe.c:856:2: warning: expression result unused [-Wunused-value]
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

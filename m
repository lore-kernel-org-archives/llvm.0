Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F440292B40;
	Mon, 30 Jun 2025 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303953; cv=none; b=my3nZ3ehQ7pgPcDbFi5eXqDqymGnPcGApg0gjQBPkQ+FJEcjRo6xgZVRj1II7YWaXYZLxS3UrqFjb7dP03I37og+8lqlgpBAPmy32FwyTgLfVhFo4ml42Ptl/c83U0il5qQJQ8VUG8hNv6pp8O0ZPhH7OB5lm31MSLJlKz13eps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303953; c=relaxed/simple;
	bh=v6nG3ANwlwewYMzG2EDdd15h04a3QX18hSDz1c6pRs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpBpiyCyWXAZa9/Fy24Aa6d/JUHmuBARbxX3WlUCoq3oY/RIrXGkKavsbxmoB0XM9QE6zo+REqYT6mYUC/WySdCo9m3lZ8NmUqpd2K4kzeebbmuas52p5wAcx4b8ROLAXpgnVi8vB5Zh5mqBqyOpOzdF7bTbVujcFI19Kx/O1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGWfRdrs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGWfRdrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751303952; x=1782839952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6nG3ANwlwewYMzG2EDdd15h04a3QX18hSDz1c6pRs4=;
  b=PGWfRdrsfSK90Nuep1FWBKegIAbE6FsVTmAb541Xgf9m3cVxg7eXpCqz
   bQKXhoOKphB82ImqcDDSva1kfWVUoE279nq4xwREIaGX0HsB58T3y4XLv
   vxFDOKbwyOJwB8E8lhB5Heo2n2yiTloYpP6NQBPchZYEgXQ/NIWOk/eac
   MpuBxn6Buz5MnmIkv0Y5zNpeZF3XzBYXrBj3xItETEccGO4NwHm6bqjTr
   4qe+uC4Rh0Nk/PLPKz4A2zXI6Q72+JySULiJ1Z3VMCggYxgasemcJeGF+
   Gy1y1XDDf8peheJNK8HubwPNLEpFVTFX0vb1bRaMOYtOL12ahXpNf7uKR
   w==;
X-CSE-ConnectionGUID: daOLKe97Rge0bmbap/KfjA==
X-CSE-MsgGUID: yMfiHytxR7CryToXD41g2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52655467"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52655467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 10:19:11 -0700
X-CSE-ConnectionGUID: Zs5+pFf4RhOqtVr2rq10TA==
X-CSE-MsgGUID: z+7SfbLHS86fpWLtpCjSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="152903848"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 10:19:10 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWI9r-0001Fn-18;
	Mon, 30 Jun 2025 17:19:07 +0000
Date: Mon, 30 Jun 2025 19:18:28 +0200
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.mount 30/42] Warning: fs/namespace.c:2792 function
 parameter 'pinned' not described in 'do_lock_mount'
Message-ID: <202506301911.uysRaP8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.mount
head:   a7cce099450f8fc597a6ac215440666610895fb7
commit: e037364e4447334c28f6453693d663a7e6fdc5bf [30/42] get rid of mountpoint->m_count
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250630/202506301911.uysRaP8b-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301911.uysRaP8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301911.uysRaP8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/namespace.c:2792 function parameter 'pinned' not described in 'do_lock_mount'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

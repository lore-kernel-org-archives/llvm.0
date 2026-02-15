Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34531A23A6;
	Sun, 15 Feb 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186083; cv=none; b=kPoyiEJvH1+mR8V9gtJ2qzIn+C2B/ErnYyGp5Tpj4vgqtCjt+Tk1nPo+zG9xq0EB3CeQWoc4LH1yvQwFP7e/VOhz/BNzMw/is1NXrh7eoHHqpFrToxGxigBwXY4uhtEny9yMopukhYkMZ39xtfAzx8kNkA5v1ymOK08MiljwtPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186083; c=relaxed/simple;
	bh=x3IQ3Lpw0aWRlKuoYN5Fv/ER7rJwEr15D9gkFq1uook=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDN6nHxWjqKBhoFonnR81t3iuqWvxtiiRp/EnpYGoKWZiMjit/COiyQhZD88RqwyN5cIfpBYOlHJxtECf4pkiTxWMWuXN/QS4E7tKuJu04c3RDM1Ah748CVjhh59dUzGNEnUdNiZKMmLmsxS9EXDE5D0XOBEqXQ4yeDz0CARfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVqYRCIV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVqYRCIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771186082; x=1802722082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3IQ3Lpw0aWRlKuoYN5Fv/ER7rJwEr15D9gkFq1uook=;
  b=nVqYRCIV5J2zB2k3wU7I1/aG9vdYeC+30JMqTacSBo/h9zwdd7i5enqC
   prZJYOUzSb6zRHdzWhvmKcw+B/vGehN8KL/k2+3Fb7ghbUhZdBmVuzqHR
   m+BqpGtscyFuPXtssjMq1CHULoblIERBJhYjf0iyQmvF6Xi1IATHLw898
   i1XiizQgkDl2vuRzguiJSThEFiN6UP8WHhu7cZVGQT3fh9QCmvh67S1AN
   4alpMzZSoVpDxasUddeAvRGMkqkrO4cRfP0NNwT1pmWuig5t9569vAZSt
   Hlpfk2ZPdbG+MUCAs0LuKy9Oz5iX2sUH26GlQWLUJoXg0yaP/Xr4pm/JW
   Q==;
X-CSE-ConnectionGUID: 3gfK+3qAR2aiOQcsHdgwIA==
X-CSE-MsgGUID: tBedbIXrS76sm/W5LJKKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="97744913"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="97744913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 12:08:01 -0800
X-CSE-ConnectionGUID: h96EFrSlQJeyA3ohkWdWDQ==
X-CSE-MsgGUID: 0J9iTjSVQWuEAqFh1M67Og==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Feb 2026 12:08:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vriPN-00000000z7g-2o7W;
	Sun, 15 Feb 2026 20:07:57 +0000
Date: Mon, 16 Feb 2026 04:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v6.19] dlm: introduce dlmpfs
Message-ID: <202602160339.si8Mlefw-lkp@intel.com>
References: <20260213180014.614646-1-aahringo@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213180014.614646-1-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.19]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/dlm-introduce-dlmpfs/20260214-020248
base:   v6.19
patch link:    https://lore.kernel.org/r/20260213180014.614646-1-aahringo%40redhat.com
patch subject: [RFC v6.19] dlm: introduce dlmpfs
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260216/202602160339.si8Mlefw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160339.si8Mlefw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160339.si8Mlefw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/dlm/dlmpfs/inode.c:47:7: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           di = kzalloc_obj(*di, GFP_NOFS);
                ^
>> fs/dlm/dlmpfs/inode.c:47:5: error: incompatible integer to pointer conversion assigning to 'struct dlmpfs_inode *' from 'int' [-Wint-conversion]
           di = kzalloc_obj(*di, GFP_NOFS);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/dlmpfs/inode.c:441:8: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fsi = kzalloc_obj(*fsi, GFP_KERNEL);
                 ^
>> fs/dlm/dlmpfs/inode.c:441:6: error: incompatible integer to pointer conversion assigning to 'struct dlmpfs_fs_info *' from 'int' [-Wint-conversion]
           fsi = kzalloc_obj(*fsi, GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> fs/dlm/dlmpfs/newdlm.c:137:7: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           lk = kzalloc_obj(*lk, GFP_NOFS);
                ^
>> fs/dlm/dlmpfs/newdlm.c:137:5: error: incompatible integer to pointer conversion assigning to 'struct dlmlk *' from 'int' [-Wint-conversion]
           lk = kzalloc_obj(*lk, GFP_NOFS);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/dlmpfs/newdlm.c:216:7: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ls = kzalloc_obj(*ls, GFP_NOFS);
                ^
>> fs/dlm/dlmpfs/newdlm.c:216:5: error: incompatible integer to pointer conversion assigning to 'struct dlmls *' from 'int' [-Wint-conversion]
           ls = kzalloc_obj(*ls, GFP_NOFS);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> fs/dlm/dlmpfs/file.c:23:7: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fp = kzalloc_obj(*fp, GFP_NOFS);
                ^
>> fs/dlm/dlmpfs/file.c:23:5: error: incompatible integer to pointer conversion assigning to 'struct dlmpfs_file *' from 'int' [-Wint-conversion]
           fp = kzalloc_obj(*fp, GFP_NOFS);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kzalloc_obj +47 fs/dlm/dlmpfs/inode.c

    42	
    43	static struct inode *dlmpfs_alloc_inode(struct super_block *sb)
    44	{
    45		struct dlmpfs_inode *di;
    46	
  > 47		di = kzalloc_obj(*di, GFP_NOFS);
    48		if (!di)
    49			return NULL;
    50	
    51		inode_init_once(&di->inode);
    52		return &di->inode;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

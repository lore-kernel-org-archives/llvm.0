Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000014D2B9;
	Sun,  6 Oct 2024 05:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728191452; cv=none; b=TuOGsGLQSrzedGnF9NP0AsVTXGDapl+ESQ2ecRHYpQo0xGgCjuoX5KqRpzEGfnmKy+xzqMmUiVrnxfudHQVKs6HsB/5UtSAsqL7qOnzIN0jZnTqJa3YlX4NjOstGq0SRXRBvfSwg7u78mjc9YX6Rb/oZU5dp8om+7o72tjaMVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728191452; c=relaxed/simple;
	bh=TuqrH0MK9XVTYwOnrSQOST4+hIMOBIr6LNB6z8HJ2pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcgXdhm/rgmSO4RzRIZyp2XUHaI+j0E3pgLu/qv8BngTBSLJ6Tsm97kKJD7MoICEpj8pSH98xcW/7WMShHLVTsZZkI1/r8Lq63FrcoMS3Ca5myXchEMgxfNbQ4sBKkvUeXuoHyVX39tn8RrME4mQMdAjD2rrsW+/L1KI9IpDPg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTL8S6Z9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTL8S6Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728191451; x=1759727451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TuqrH0MK9XVTYwOnrSQOST4+hIMOBIr6LNB6z8HJ2pE=;
  b=gTL8S6Z9ZYGz3LgM2nV+DfFPE6hZYwjHCQ7HjBsixBCHhJvxbvKkDp6+
   MU41/7QWtSkvMR01tRX0MWb7dAWN+IauM88df0VzGuzs67zhJoDtfZI0z
   OZXhyjP46sNyWeRXMIci/nVAW3ZbTgTm/V83ebTJl8eSrvJjqAoU1KyTH
   /GHi1sgOqqHSombMsPS8cbwC3kWLckEmWE8Jil2rdXlQQd++Tg9DeCDPW
   ugQcqo908LQByeqeDEJk10dti6GY0Mji8kKcjYLl70Nym81diSELJuGRq
   d5w3oCKNVuCF1eVkBUToXt5+6JMjbAgdEJpZOrMkM1DkbIOH9+yN+tZko
   g==;
X-CSE-ConnectionGUID: Bx1iXlEmSniGtKQrQJPb8g==
X-CSE-MsgGUID: 61iavCvESECCQUVIiJ8gTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="26867393"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="26867393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 22:10:50 -0700
X-CSE-ConnectionGUID: /1nD6UcSSji0idIG5sfvBw==
X-CSE-MsgGUID: Qex4CVsXQoK1aSuVcW0B0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="98432378"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2024 22:10:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxJXY-0003ca-1L;
	Sun, 06 Oct 2024 05:10:44 +0000
Date: Sun, 6 Oct 2024 13:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	krisman@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-dev@igalia.com, Daniel Rosenberg <drosen@google.com>,
	smcv@collabora.com, Christoph Hellwig <hch@lst.de>,
	Theodore Ts'o <tytso@mit.edu>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v5 07/10] tmpfs: Add casefold lookup support
Message-ID: <202410061202.rhZIs2gr-lkp@intel.com>
References: <20241002234444.398367-8-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002234444.398367-8-andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on akpm-mm/mm-everything tytso-ext4/dev linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/libfs-Create-the-helper-function-generic_ci_validate_strict_name/20241003-074711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241002234444.398367-8-andrealmeid%40igalia.com
patch subject: [PATCH v5 07/10] tmpfs: Add casefold lookup support
config: x86_64-buildonly-randconfig-004-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061202.rhZIs2gr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061202.rhZIs2gr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061202.rhZIs2gr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c:1608:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1608 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
>> mm/shmem.c:4717:39: warning: unused variable 'shmem_ci_dentry_ops' [-Wunused-const-variable]
    4717 | static const struct dentry_operations shmem_ci_dentry_ops = {
         |                                       ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/shmem_ci_dentry_ops +4717 mm/shmem.c

  4715	
  4716	#if IS_ENABLED(CONFIG_UNICODE)
> 4717	static const struct dentry_operations shmem_ci_dentry_ops = {
  4718		.d_hash = generic_ci_d_hash,
  4719		.d_compare = generic_ci_d_compare,
  4720		.d_delete = always_delete_dentry,
  4721	};
  4722	#endif
  4723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

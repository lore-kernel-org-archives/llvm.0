Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC804A21
	for <llvm@lists.linux.dev>; Fri, 13 Sep 2024 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244330; cv=none; b=VJwPbMpchvqlnbiWqtAzmc4KtEYSqnUStSjKt1WPu6DhcgHVvOP2lMecWFadAMAT534GNazNPiunj0aiJ426thRW1T/1NnofLV1YC4+4n6/ILz7wEb7cSoOTFctS+yyXSqjnhqXsclk9LmMkvQbXWwzzVq31UnQK6YVKtIxckRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244330; c=relaxed/simple;
	bh=lm2kDCysHuXfeaUDtgjfypUvl5qYOh8sKfbICOSqXew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJo6nZDjQwIkQsn9UEWKvgv9kAc2LngFz+VoVksA0PVHaQZqbS2S+fBIHW8qC9iuMFYk9S3uM+FGxPiKkpsdWhPLugCEpo15dN45uDBaJ69vjbQbs6wBQlr43pcPXVfZnv0POwpgNhKMQPahisZx+XeLDzySgR+Egts2UyNs+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBhkK/i4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBhkK/i4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726244328; x=1757780328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lm2kDCysHuXfeaUDtgjfypUvl5qYOh8sKfbICOSqXew=;
  b=oBhkK/i4wM/YevPkedpswhngbgvaWDesRIDdSiqU1sPc/W9jRiZKeRj0
   SoD7nJoQfVABhHN8MOnP5rvsRvatWR8Qo3IMwY/Urifr+o42SmLjzdXQn
   tzk0pp2rDq6lk4jgAAn+11BbaiZYuUO6F3yzvm4ojcJ/g6v6O8Y2UIuaH
   +0evCACH8W22rbpzbkRb3Xhkt/3gcLIOamUeMylGQbmUaxrm09vrzAOYW
   cFtvhpBtMLWqlxvzjRl1vEy+hglvYws/lqQxd2AFzEBoQSKm1MoKHqhX4
   14gmsvAiAqsalaGth4qzpm0eNYbu76OUNUQjNE+m8wv3R93I9LADWQuX9
   A==;
X-CSE-ConnectionGUID: TGhsCGaWQ3mX/kgeq1rCCQ==
X-CSE-MsgGUID: gJPeH358T8iwwRwx+i0lKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28897116"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28897116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:18:47 -0700
X-CSE-ConnectionGUID: JRHj80i0TlSIu2IBuY4x/w==
X-CSE-MsgGUID: Z4vhfHClRP+hka7pYslJiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68879526"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 09:18:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp8zh-0006fO-1M;
	Fri, 13 Sep 2024 16:18:01 +0000
Date: Sat, 14 Sep 2024 00:17:18 +0800
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
Subject: Re: [PATCH v4 07/10] tmpfs: Add casefold lookup support
Message-ID: <202409140037.SAFqfyoX-lkp@intel.com>
References: <20240911144502.115260-8-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911144502.115260-8-andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tytso-ext4/dev brauner-vfs/vfs.all linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/libfs-Create-the-helper-function-generic_ci_validate_strict_name/20240911-224740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240911144502.115260-8-andrealmeid%40igalia.com
patch subject: [PATCH v4 07/10] tmpfs: Add casefold lookup support
config: x86_64-buildonly-randconfig-006-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140037.SAFqfyoX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140037.SAFqfyoX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140037.SAFqfyoX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c:1609:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1609 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
>> mm/shmem.c:4719:39: warning: unused variable 'shmem_ci_dentry_ops' [-Wunused-const-variable]
    4719 | static const struct dentry_operations shmem_ci_dentry_ops = {
         |                                       ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/shmem_ci_dentry_ops +4719 mm/shmem.c

  4717	
  4718	#if IS_ENABLED(CONFIG_UNICODE)
> 4719	static const struct dentry_operations shmem_ci_dentry_ops = {
  4720		.d_hash = generic_ci_d_hash,
  4721		.d_compare = generic_ci_d_compare,
  4722	#ifdef CONFIG_FS_ENCRYPTION
  4723		.d_revalidate = fscrypt_d_revalidate,
  4724	#endif
  4725		.d_delete = always_delete_dentry,
  4726	};
  4727	#endif
  4728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

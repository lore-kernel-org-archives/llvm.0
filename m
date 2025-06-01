Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F432CCA5;
	Sun,  1 Jun 2025 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748809968; cv=none; b=ldRjrm1qCk4aj6TI5Y5VHujkF7xvsz3bkAhXfHCcttNYNrUFW1K4RXsJDhy1XI07NxsY+naVCqMwlgyuLuHpUnam44Orcm0WN/7K6qZYTRRj+sLTni5luBrSPK8/q2LUCjuOtpkagLrW74s+1MkYi8A8Lvfn/p1Ce+jj+LwA028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748809968; c=relaxed/simple;
	bh=sAS4cGxaZgiOsC64Zak7rasJeWYwfPJCCuZP7TENQnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7cq9qVulX+WSJQRdMp30CzTk+W54U1NkLcgvPqPDygOrR/ksztyRk6UUTmbpuSoinIarzWqWi+u9+xIYefP5K1tRV8RBNlIXc4c3UzmUbpavBQp9VUWlSAJpX/kGn+PjjJlsaqOK5csaI7vBMonMbSdyu/yZtFf6kiHtSnn0oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOvhCoWn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOvhCoWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748809967; x=1780345967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAS4cGxaZgiOsC64Zak7rasJeWYwfPJCCuZP7TENQnk=;
  b=fOvhCoWnIuCrgWtaGS5cVbx51ZX9GEPN+J6XMUBJBQog7TVBYoAXFeBB
   3o9aw1t8G5Z05l54/Ls6TPavr6B8K64n3NZYDqQcurQzKROimrLd48LC/
   6YY/STZuj5XwIdiLOTRbWQ8YkbqoNiw/5VvSbYK4JFezjpKehQMEUjAZU
   yj2ouB2Y4xeFKyNk4S/C637mSQGGQrBBM+oDknw7RIbGI/smkrG0g3bCG
   xOQ+cp46khyUkGTa/Zo8YEfkHJN2EUYO2nIe8BOx1V3i4GhxmdKhp/nAg
   j0q94949Meyw0lfBKDTwZgn/aweud/sE0+FL6WNtXNvmyEWG5sPISXlol
   g==;
X-CSE-ConnectionGUID: Yzccdlf/S3ymNYzPGqUdxA==
X-CSE-MsgGUID: rE03S5ezTVmz8wi3jkYCUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62178513"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="62178513"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 13:32:45 -0700
X-CSE-ConnectionGUID: PAMWnestS8OmeYWzWlZEaw==
X-CSE-MsgGUID: MnL3RPxWTt6sv5TlhnDxbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="144257945"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2025 13:32:44 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLpMH-0001CI-26;
	Sun, 01 Jun 2025 20:32:41 +0000
Date: Mon, 2 Jun 2025 04:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 331/338] fs/dcache.c:3223: warning:
 Function parameter or struct member 'dentry' not described in
 'd_casefold_disabled_put'
Message-ID: <202506020428.aKtBuNbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ac9cb68e998c4a17159a05fb750fc7e9f3850c41
commit: 520ad9104545fd112f172076b4ed10797c1cc8da [331/338] fs: dcache exlusion between overlayfs, casefolding
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250602/202506020428.aKtBuNbS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020428.aKtBuNbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506020428.aKtBuNbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/dcache.c:3223: warning: Function parameter or struct member 'dentry' not described in 'd_casefold_disabled_put'
>> fs/dcache.c:3247: warning: Function parameter or struct member 'dentry' not described in 'd_casefold_disabled_get'


vim +3223 fs/dcache.c

  3216	
  3217	/**
  3218	 * d_casefold_disabled_put - drop a "casefold disabled" ref
  3219	 *
  3220	 * Only for overlayfs.
  3221	 */
  3222	void d_casefold_disabled_put(struct dentry *dentry)
> 3223	{
  3224		struct super_block *sb = dentry->d_sb;
  3225	
  3226		if (!(sb->s_flags & SB_CASEFOLD))
  3227			return;
  3228	
  3229		guard(mutex)(&sb->s_casefold_enable_lock);
  3230		no_casefold_dentry_put(dentry, ref_casefold_disable);
  3231	}
  3232	EXPORT_SYMBOL_GPL(d_casefold_disabled_put);
  3233	
  3234	/**
  3235	 * d_casefold_disabled_get - attempt to disable casefold on a tree
  3236	 *
  3237	 * Only for overlayfs.
  3238	 *
  3239	 * Returns -EINVAL if casefolding is in use on any subdirectory; this must be
  3240	 * tracked by the filesystem.
  3241	 *
  3242	 * On success, returns with a reference held that must be released by
  3243	 * d_casefold_disabled_put(); this ref blocks casefold from being enabled
  3244	 * by d_casefold_enable().
  3245	 */
  3246	int d_casefold_disabled_get(struct dentry *dentry)
> 3247	{
  3248		struct super_block *sb = dentry->d_sb;
  3249	
  3250		if (!(sb->s_flags & SB_CASEFOLD))
  3251			return 0;
  3252	
  3253		guard(mutex)(&sb->s_casefold_enable_lock);
  3254	
  3255		if (!(dentry->d_inode->i_flags & S_NO_CASEFOLD))
  3256			return -EINVAL;
  3257	
  3258		return no_casefold_dentry_get(dentry, ref_casefold_disable);
  3259	}
  3260	EXPORT_SYMBOL_GPL(d_casefold_disabled_get);
  3261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

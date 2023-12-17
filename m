Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5761A2A;
	Sun, 17 Dec 2023 01:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuC/jwJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702777991; x=1734313991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZ+LBM9NXM4g0AOGlMraNS2q53MXhZEjzSh98qcB2ik=;
  b=FuC/jwJq6rCjgo+VD3+6aNbyLTt+5WOewafHGgLl0+hMOf9PxiVIf5Mq
   Td2aBDcKbuzT5s79C3HYBiWIxDchS9oCLVvyC0rUAQC1erNstUGn/oFDv
   CIp2O6hxvi4BeJoR2AfJI77oSJDVCywt06x+AW8D1KHw07bt6lsi8eg06
   qhBYzNEbBur3m+v6/fPVPMG75RZ+IXR76GpJgQ0hJq2J+6did5rRpSxmO
   TuANHIz43Ei/FarhZXWC6QJkMK5p3crpOBxhHgyKRdgjoXMZdQkVjEpTZ
   76sYnPAEnNjTE7e6uDT9kcczeQxhzIa4f15W23wMuoWe0DgU+R8u5R2L7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="459722215"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="459722215"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918851337"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="918851337"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2023 17:53:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEgL5-0002Tq-0i;
	Sun, 17 Dec 2023 01:53:07 +0000
Date: Sun, 17 Dec 2023 09:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 23/24] ima: Make it independent from 'integrity' LSM
Message-ID: <202312170940.GnFjqC6b-lkp@intel.com>
References: <20231214170834.3324559-24-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214170834.3324559-24-roberto.sassu@huaweicloud.com>

Hi Roberto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231214]
[cannot apply to zohar-integrity/next-integrity shuah-kselftest/next shuah-kselftest/fixes pcmoore-selinux/next brauner-vfs/vfs.all linus/master v6.7-rc5 v6.7-rc4 v6.7-rc3 v6.7-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roberto-Sassu/ima-Align-ima_inode_post_setattr-definition-with-LSM-infrastructure/20231215-011948
base:   next-20231214
patch link:    https://lore.kernel.org/r/20231214170834.3324559-24-roberto.sassu%40huaweicloud.com
patch subject: [PATCH v8 23/24] ima: Make it independent from 'integrity' LSM
config: i386-buildonly-randconfig-005-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170940.GnFjqC6b-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170940.GnFjqC6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170940.GnFjqC6b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:570:6: warning: variable 'iint' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (ima_policy_flag) {
               ^~~~~~~~~~~~~~~
   security/integrity/ima/ima_main.c:576:8: note: uninitialized use occurs here
           if ((!iint || !(iint->flags & IMA_COLLECTED)) && file) {
                 ^~~~
   security/integrity/ima/ima_main.c:570:2: note: remove the 'if' if its condition is always true
           if (ima_policy_flag) {
           ^~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_main.c:567:29: note: initialize the variable 'iint' to silence this warning
           struct ima_iint_cache *iint, tmp_iint;
                                      ^
                                       = NULL
   1 warning generated.


vim +570 security/integrity/ima/ima_main.c

8eb988c70e7709 Mimi Zohar     2010-01-20  563  
280fe8367b0dc4 Roberto Sassu  2022-03-02  564  static int __ima_inode_hash(struct inode *inode, struct file *file, char *buf,
280fe8367b0dc4 Roberto Sassu  2022-03-02  565  			    size_t buf_size)
6beea7afcc72b8 Florent Revest 2020-01-13  566  {
7f3b66c6df75b7 Roberto Sassu  2023-12-14  567  	struct ima_iint_cache *iint, tmp_iint;
280fe8367b0dc4 Roberto Sassu  2022-03-02  568  	int rc, hash_algo;
6beea7afcc72b8 Florent Revest 2020-01-13  569  
280fe8367b0dc4 Roberto Sassu  2022-03-02 @570  	if (ima_policy_flag) {
7f3b66c6df75b7 Roberto Sassu  2023-12-14  571  		iint = ima_iint_inode(inode);
280fe8367b0dc4 Roberto Sassu  2022-03-02  572  		if (iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  573  			mutex_lock(&iint->mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  574  	}
280fe8367b0dc4 Roberto Sassu  2022-03-02  575  
280fe8367b0dc4 Roberto Sassu  2022-03-02  576  	if ((!iint || !(iint->flags & IMA_COLLECTED)) && file) {
280fe8367b0dc4 Roberto Sassu  2022-03-02  577  		if (iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  578  			mutex_unlock(&iint->mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  579  
280fe8367b0dc4 Roberto Sassu  2022-03-02  580  		memset(&tmp_iint, 0, sizeof(tmp_iint));
280fe8367b0dc4 Roberto Sassu  2022-03-02  581  		mutex_init(&tmp_iint.mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  582  
280fe8367b0dc4 Roberto Sassu  2022-03-02  583  		rc = ima_collect_measurement(&tmp_iint, file, NULL, 0,
280fe8367b0dc4 Roberto Sassu  2022-03-02  584  					     ima_hash_algo, NULL);
8c1d6a050a0f16 Roberto Sassu  2022-11-02  585  		if (rc < 0) {
8c1d6a050a0f16 Roberto Sassu  2022-11-02  586  			/* ima_hash could be allocated in case of failure. */
8c1d6a050a0f16 Roberto Sassu  2022-11-02  587  			if (rc != -ENOMEM)
8c1d6a050a0f16 Roberto Sassu  2022-11-02  588  				kfree(tmp_iint.ima_hash);
8c1d6a050a0f16 Roberto Sassu  2022-11-02  589  
6beea7afcc72b8 Florent Revest 2020-01-13  590  			return -EOPNOTSUPP;
8c1d6a050a0f16 Roberto Sassu  2022-11-02  591  		}
6beea7afcc72b8 Florent Revest 2020-01-13  592  
280fe8367b0dc4 Roberto Sassu  2022-03-02  593  		iint = &tmp_iint;
6beea7afcc72b8 Florent Revest 2020-01-13  594  		mutex_lock(&iint->mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  595  	}
280fe8367b0dc4 Roberto Sassu  2022-03-02  596  
280fe8367b0dc4 Roberto Sassu  2022-03-02  597  	if (!iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  598  		return -EOPNOTSUPP;
aa662fc04f5b29 KP Singh       2020-09-16  599  
aa662fc04f5b29 KP Singh       2020-09-16  600  	/*
aa662fc04f5b29 KP Singh       2020-09-16  601  	 * ima_file_hash can be called when ima_collect_measurement has still
aa662fc04f5b29 KP Singh       2020-09-16  602  	 * not been called, we might not always have a hash.
aa662fc04f5b29 KP Singh       2020-09-16  603  	 */
62622dab0a2850 Matt Bobrowski 2023-01-04  604  	if (!iint->ima_hash || !(iint->flags & IMA_COLLECTED)) {
aa662fc04f5b29 KP Singh       2020-09-16  605  		mutex_unlock(&iint->mutex);
aa662fc04f5b29 KP Singh       2020-09-16  606  		return -EOPNOTSUPP;
aa662fc04f5b29 KP Singh       2020-09-16  607  	}
aa662fc04f5b29 KP Singh       2020-09-16  608  
6beea7afcc72b8 Florent Revest 2020-01-13  609  	if (buf) {
6beea7afcc72b8 Florent Revest 2020-01-13  610  		size_t copied_size;
6beea7afcc72b8 Florent Revest 2020-01-13  611  
6beea7afcc72b8 Florent Revest 2020-01-13  612  		copied_size = min_t(size_t, iint->ima_hash->length, buf_size);
6beea7afcc72b8 Florent Revest 2020-01-13  613  		memcpy(buf, iint->ima_hash->digest, copied_size);
6beea7afcc72b8 Florent Revest 2020-01-13  614  	}
6beea7afcc72b8 Florent Revest 2020-01-13  615  	hash_algo = iint->ima_hash->algo;
6beea7afcc72b8 Florent Revest 2020-01-13  616  	mutex_unlock(&iint->mutex);
6beea7afcc72b8 Florent Revest 2020-01-13  617  
280fe8367b0dc4 Roberto Sassu  2022-03-02  618  	if (iint == &tmp_iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  619  		kfree(iint->ima_hash);
280fe8367b0dc4 Roberto Sassu  2022-03-02  620  
6beea7afcc72b8 Florent Revest 2020-01-13  621  	return hash_algo;
6beea7afcc72b8 Florent Revest 2020-01-13  622  }
403319be5de511 KP Singh       2020-11-24  623  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

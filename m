Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977D7A
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659860978; x=1691396978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zldi7ioVam3SXWkUXMr6S5cw/9YD9h1FQKzs/lHLIFg=;
  b=M4p4OzYa4yxqKWVt0X75zB7ZmPmDWXFgRsNfNLsEVF7BFINezpRV3BSJ
   p8wNM2fEazLAs9jzp51mD89twk1jUfqf46aldl4qcJ1hzlNVaK0OaDnsW
   k6SvM44g4EQPcYBexKp3ZJwoKp+Ic9NzaOYdCN4sFaMvmf82Rh2FMYnGV
   07OsZN3aJ6A7GrSoOvhzhn3PuNg2AQ/FTKvhYt03NuVRxtp/5P4+qLB4a
   HTpTWfsv36KmwhpzHFkRsEvu+B2kRpmHX4rkmBJDjueADFEOtQRdgGqQQ
   7vlUdgAdCHfPuYITs8JpOkapWLT7iaAq5MHgOUgeC56jatpQZNiw0TCF4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="354420723"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="354420723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 01:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="746301907"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2022 01:29:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKbf4-000L9f-0N;
	Sun, 07 Aug 2022 08:29:26 +0000
Date: Sun, 7 Aug 2022 16:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: studentxswpy@163.com, jaegeuk@kernel.org, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Xie Shaowen <studentxswpy@163.com>,
	Hacash Robot <hacashRobot@santino.com>
Subject: Re: [PATCH -next] f2fs: Replace kmalloc() with f2fs_kmalloc
Message-ID: <202208071605.XXehjTqy-lkp@intel.com>
References: <20220801092202.3134668-1-studentxswpy@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801092202.3134668-1-studentxswpy@163.com>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220728]

url:    https://github.com/intel-lab-lkp/linux/commits/studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
base:    7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
config: x86_64-randconfig-a002-20220801 (https://download.01.org/0day-ci/archive/20220807/202208071605.XXehjTqy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
        git checkout ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/dir.c:235:61: error: too few arguments to function call, expected 3, have 2
                   decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
                                         ~~~~~~~~~~~~                        ^
   fs/f2fs/f2fs.h:3316:21: note: 'f2fs_kmalloc' declared here
   static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
                       ^
   1 error generated.


vim +235 fs/f2fs/dir.c

   211	
   212	#if IS_ENABLED(CONFIG_UNICODE)
   213	/*
   214	 * Test whether a case-insensitive directory entry matches the filename
   215	 * being searched for.
   216	 *
   217	 * Returns 1 for a match, 0 for no match, and -errno on an error.
   218	 */
   219	static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
   220				       const u8 *de_name, u32 de_name_len)
   221	{
   222		const struct super_block *sb = dir->i_sb;
   223		const struct unicode_map *um = sb->s_encoding;
   224		struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
   225		struct qstr entry = QSTR_INIT(de_name, de_name_len);
   226		int res;
   227	
   228		if (IS_ENCRYPTED(dir)) {
   229			const struct fscrypt_str encrypted_name =
   230				FSTR_INIT((u8 *)de_name, de_name_len);
   231	
   232			if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
   233				return -EINVAL;
   234	
 > 235			decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
   236			if (!decrypted_name.name)
   237				return -ENOMEM;
   238			res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
   239							&decrypted_name);
   240			if (res < 0)
   241				goto out;
   242			entry.name = decrypted_name.name;
   243			entry.len = decrypted_name.len;
   244		}
   245	
   246		res = utf8_strncasecmp_folded(um, name, &entry);
   247		/*
   248		 * In strict mode, ignore invalid names.  In non-strict mode,
   249		 * fall back to treating them as opaque byte sequences.
   250		 */
   251		if (res < 0 && !sb_has_strict_encoding(sb)) {
   252			res = name->len == entry.len &&
   253					memcmp(name->name, entry.name, name->len) == 0;
   254		} else {
   255			/* utf8_strncasecmp_folded returns 0 on match */
   256			res = (res == 0);
   257		}
   258	out:
   259		kfree(decrypted_name.name);
   260		return res;
   261	}
   262	#endif /* CONFIG_UNICODE */
   263	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

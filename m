Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE92F27
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644345304; x=1675881304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9saq7rGmfrwUpXPyRHSQhX5kvkJ0wLoCAZGqcwvpi4=;
  b=XyLLl8NJ+A6BpOKQj5wzIxwtxSALONrxZlqe0VzLP0k+3eAkbnoI4MCS
   UzBytgf+DoaorPSM1K1MiDWfyTQAlN+pd9WcFaijAPmZ/l+MaMyZN2oor
   5ZRH56IvhkO95WDYdmei0Bd681qDTS1VGp6UtTj+NtoWrwfs1pnyHdDOK
   cVFJ7exUjc2ju01YjaNNvhKOqbBkJRf/WZCtWLSYp78WDO+tinq6rZR3l
   8aHiXRluyY9W86vTVp6+aweKJrqmP+oP1/v6RBU9qAuCbVa4JL/ONlctT
   wY1ESksPPm4+k622Ug3kzgt8rur9jFpO+6HgjEcH7I/F0sxQvj6O9qU6g
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="309764261"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="309764261"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 10:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="484910437"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2022 10:35:02 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHVKQ-0000ax-9I; Tue, 08 Feb 2022 18:35:02 +0000
Date: Wed, 9 Feb 2022 02:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ksmbd: fix racy issue from using ->d_parent and ->d_name
Message-ID: <202202090207.MiyIsofZ-lkp@intel.com>
References: <20220208010959.4050-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208010959.4050-1-linkinjeon@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Namjae,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc3 next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Namjae-Jeon/ksmbd-fix-racy-issue-from-using-d_parent-and-d_name/20220208-092438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 555f3d7be91a873114c9656069f1a9fa476ec41a
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220209/202202090207.MiyIsofZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f4cb65c1c670f5332092a7eb75d569bbd4e46a5f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Namjae-Jeon/ksmbd-fix-racy-issue-from-using-d_parent-and-d_name/20220208-092438
        git checkout f4cb65c1c670f5332092a7eb75d569bbd4e46a5f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ksmbd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ksmbd/vfs.c:654:6: warning: variable 'old_dentry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (d_is_symlink(new_path.dentry)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:719:7: note: uninitialized use occurs here
           dput(old_dentry);
                ^~~~~~~~~~
   fs/ksmbd/vfs.c:654:2: note: remove the 'if' if its condition is always false
           if (d_is_symlink(new_path.dentry)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:604:27: note: initialize the variable 'old_dentry' to silence this warning
           struct dentry *old_dentry, *new_dentry, *trap;
                                    ^
                                     = NULL
>> fs/ksmbd/vfs.c:654:6: warning: variable 'new_dentry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (d_is_symlink(new_path.dentry)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:717:7: note: uninitialized use occurs here
           dput(new_dentry);
                ^~~~~~~~~~
   fs/ksmbd/vfs.c:654:2: note: remove the 'if' if its condition is always false
           if (d_is_symlink(new_path.dentry)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:604:40: note: initialize the variable 'new_dentry' to silence this warning
           struct dentry *old_dentry, *new_dentry, *trap;
                                                 ^
                                                  = NULL
   2 warnings generated.


vim +654 fs/ksmbd/vfs.c

   600	
   601	int ksmbd_vfs_rename(struct ksmbd_work *work, struct path *path, char *newname,
   602			     int flags)
   603	{
   604		struct dentry *old_dentry, *new_dentry, *trap;
   605		struct path old_path, new_path;
   606		struct qstr old_last, new_last;
   607		struct renamedata rd;
   608		struct filename *from, *to;
   609		struct ksmbd_share_config *share_conf = work->tcon->share_conf;
   610		struct ksmbd_file *parent_fp;
   611		int old_type, new_type;
   612		int err, lookup_flags = LOOKUP_NO_SYMLINKS;
   613		char *pathname, *abs_oldname;
   614	
   615		if (ksmbd_override_fsids(work))
   616			return -ENOMEM;
   617	
   618		pathname = kmalloc(PATH_MAX, GFP_KERNEL);
   619		if (!pathname) {
   620			ksmbd_revert_fsids(work);
   621			return -ENOMEM;
   622		}
   623	
   624		abs_oldname = d_path(path, pathname, PATH_MAX);
   625		if (IS_ERR(abs_oldname)) {
   626			err = -EINVAL;
   627			goto free_pathname;
   628		}
   629	
   630		from = getname_kernel(abs_oldname);
   631		if (IS_ERR(from)) {
   632			err = PTR_ERR(from);
   633			goto free_pathname;
   634		}
   635	
   636		to = getname_kernel(newname);
   637		if (IS_ERR(to)) {
   638			err = PTR_ERR(to);
   639			goto putname_from;
   640		}
   641	
   642		err = filename_parentat(AT_FDCWD, from, lookup_flags, &old_path,
   643					&old_last, &old_type);
   644		if (err)
   645			goto putnames;
   646	
   647		err = vfs_path_parent_lookup(share_conf->vfs_path.dentry,
   648					     share_conf->vfs_path.mnt, to,
   649					     lookup_flags | LOOKUP_BENEATH,
   650					     &new_path, &new_last, &new_type);
   651		if (err)
   652			goto out1;
   653	
 > 654		if (d_is_symlink(new_path.dentry)) {
   655			err = -EACCES;
   656			goto out4;
   657		}
   658	
   659		trap = lock_rename(old_path.dentry, new_path.dentry);
   660		old_dentry = __lookup_hash(&old_last, old_path.dentry, 0);
   661		if (IS_ERR(old_dentry)) {
   662			err = PTR_ERR(old_dentry);
   663			goto out2;
   664		}
   665		if (d_is_negative(old_dentry)) {
   666			err = -ENOENT;
   667			goto out3;
   668		}
   669	
   670		new_dentry = __lookup_hash(&new_last, new_path.dentry,
   671					   LOOKUP_RENAME_TARGET);
   672		if (IS_ERR(new_dentry)) {
   673			err = PTR_ERR(new_dentry);
   674			goto out3;
   675		}
   676	
   677		if (d_is_symlink(new_dentry)) {
   678			err = -EACCES;
   679			goto out4;
   680		}
   681	
   682		if ((flags & RENAME_NOREPLACE) && d_is_positive(new_dentry)) {
   683			err = -EEXIST;
   684			goto out4;
   685		}
   686	
   687		if (old_dentry == trap) {
   688			err = -EINVAL;
   689			goto out4;
   690		}
   691	
   692		if (new_dentry == trap) {
   693			err = -ENOTEMPTY;
   694			goto out4;
   695		}
   696	
   697		parent_fp = ksmbd_lookup_fd_inode(old_path.dentry->d_inode);
   698		if (parent_fp) {
   699			if (parent_fp->daccess & FILE_DELETE_LE) {
   700				pr_err("parent dir is opened with delete access\n");
   701				err = -ESHARE;
   702				goto out4;
   703			}
   704		}
   705	
   706		rd.old_mnt_userns	= mnt_user_ns(old_path.mnt),
   707		rd.old_dir		= old_path.dentry->d_inode,
   708		rd.old_dentry		= old_dentry,
   709		rd.new_mnt_userns	= mnt_user_ns(new_path.mnt),
   710		rd.new_dir		= new_path.dentry->d_inode,
   711		rd.new_dentry		= new_dentry,
   712		rd.flags		= flags,
   713		err = vfs_rename(&rd);
   714		if (err)
   715			ksmbd_debug(VFS, "vfs_rename failed err %d\n", err);
   716	out4:
   717		dput(new_dentry);
   718	out3:
   719		dput(old_dentry);
   720	out2:
   721		unlock_rename(new_path.dentry, old_path.dentry);
   722		path_put(&new_path);
   723	out1:
   724		path_put(&old_path);
   725	
   726	putnames:
   727		putname(to);
   728	putname_from:
   729		putname(from);
   730	free_pathname:
   731		kfree(pathname);
   732		ksmbd_revert_fsids(work);
   733		return err;
   734	}
   735	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

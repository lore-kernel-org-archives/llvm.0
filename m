Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0032812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657320133; x=1688856133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9nbQMltoJvLCOEl21Gju2MwvYBvmooNgUDUJ2MCQzmg=;
  b=Uzgt+Iz+99tKJrMZMSN2/bRMM/h3u8YnlUW9NsykyfZEyvAkWp9RwhsW
   Wmnc69BCauet6esxhM3Zh/x2hMKongXUuu2616o4OKeOG8ic6EuYCrAcj
   RBNZJxRRaYsIHmPFkU9fyMtLh1/YHvqXEDIBmYq7amX/InAG35EAWAQFK
   IE1DSrMWQhuSjf5RXMrvwEYykKDCLIB3u20uIamIV6jIwgJm4lfvDKniA
   rrl1lyOkfJlzU4qCopyqc/zmQZtz9K1M1shuSW4uzak9yizU1fA9VAB+F
   A9JSqwbWBISDFQfoR9z/unMDNV9Xo10d0D2NHi2mGsGJEbHM5OpY9UuuC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="281932962"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="281932962"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 15:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="544363827"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2022 15:42:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9wfq-000O0y-SZ;
	Fri, 08 Jul 2022 22:42:10 +0000
Date: Sat, 9 Jul 2022 06:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 3/3] ksmbd: fix racy issue from using ->d_parent and
 ->d_name
Message-ID: <202207090655.jB6KiKh6-lkp@intel.com>
References: <20220707123205.6902-4-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707123205.6902-4-linkinjeon@kernel.org>

Hi Namjae,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-patches-included-vfs-changes/20220707-203352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9f09069cde34dcd86f5ecf3a3139fd752020812f
config: mips-randconfig-r035-20220708 (https://download.01.org/0day-ci/archive/20220709/202207090655.jB6KiKh6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/5f33c60a6259952c632f92a27a1f71b04b484dcc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Namjae-Jeon/ksmbd-patches-included-vfs-changes/20220707-203352
        git checkout 5f33c60a6259952c632f92a27a1f71b04b484dcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/ksmbd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/ksmbd/vfs.c:53: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
   fs/ksmbd/vfs.c:53: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/ksmbd/vfs.c:324: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
   fs/ksmbd/vfs.c:324: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
   fs/ksmbd/vfs.c:441: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
   fs/ksmbd/vfs.c:441: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/ksmbd/vfs.c:506: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:506: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:506: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:506: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:506: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:523: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
   fs/ksmbd/vfs.c:546: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:546: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:546: warning: Excess function parameter 'name' description in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:584: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/ksmbd/vfs.c:750: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/ksmbd/vfs.c:750: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
   fs/ksmbd/vfs.c:791: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
   fs/ksmbd/vfs.c:868: warning: Function parameter or member 'attr_name' not described in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:868: warning: Function parameter or member 'attr_value' not described in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:868: warning: Function parameter or member 'attr_size' not described in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:868: warning: Excess function parameter 'name' description in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:868: warning: Excess function parameter 'value' description in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:868: warning: Excess function parameter 'size' description in 'ksmbd_vfs_setxattr'
   fs/ksmbd/vfs.c:888: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/ksmbd/vfs.c:888: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
   fs/ksmbd/vfs.c:1112: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path_locked'
>> fs/ksmbd/vfs.c:1112: warning: expecting prototype for ksmbd_vfs_kern_path(). Prototype was for ksmbd_vfs_kern_path_locked() instead


vim +1112 fs/ksmbd/vfs.c

f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1099  
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1100  /**
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1101   * ksmbd_vfs_kern_path() - lookup a file and get path info
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1102   * @name:	file path that is relative to share
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1103   * @flags:	lookup flags
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1104   * @path:	if lookup succeed, return path info
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1105   * @caseless:	caseless filename lookup
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1106   *
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1107   * Return:	0 on success, otherwise error
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1108   */
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1109  int ksmbd_vfs_kern_path_locked(struct ksmbd_work *work, char *name,
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1110  			       unsigned int flags, struct path *path,
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1111  			       bool caseless)
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16 @1112  {
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1113  	struct ksmbd_share_config *share_conf = work->tcon->share_conf;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1114  	int err;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1115  	struct path parent_path;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1116  
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1117  	err = ksmbd_vfs_path_parent_lookup(share_conf, name, flags,
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1118  					   &parent_path);
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1119  	flags |= LOOKUP_BENEATH;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1120  	if (!err) {
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1121  		err = vfs_path_lookup(share_conf->vfs_path.dentry,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1122  				      share_conf->vfs_path.mnt,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1123  				      name,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1124  				      flags,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1125  				      path);
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1126  		if (!err)
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1127  			goto lock_parent;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1128  		path_put(&parent_path);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1129  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1130  
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1131  	if (caseless) {
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1132  		char *filepath;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1133  		size_t path_len, remain_len;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1134  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1135  		filepath = kstrdup(name, GFP_KERNEL);
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1136  		if (!filepath)
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1137  			return -ENOMEM;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1138  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1139  		path_len = strlen(filepath);
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1140  		remain_len = path_len;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1141  
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1142  		parent_path = share_conf->vfs_path;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1143  		path_get(&parent_path);
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1144  
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1145  		while (d_can_lookup(parent_path.dentry)) {
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1146  			char *filename = filepath + path_len - remain_len;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1147  			char *next = strchrnul(filename, '/');
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1148  			size_t filename_len = next - filename;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1149  			bool is_last = !next[0];
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1150  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1151  			if (filename_len == 0)
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1152  				break;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1153  
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1154  			err = ksmbd_vfs_lookup_in_dir(&parent_path, filename,
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1155  						      filename_len);
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1156  			if (err)
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1157  				goto out2;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1158  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1159  			next[0] = '\0';
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1160  
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1161  			err = vfs_path_lookup(share_conf->vfs_path.dentry,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1162  					      share_conf->vfs_path.mnt,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1163  					      filepath,
265fd1991c1db8 fs/ksmbd/vfs.c Hyunchul Lee 2021-09-25  1164  					      flags,
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1165  					      path);
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1166  			if (err)
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1167  				goto out2;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1168  			else if (is_last)
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1169  				goto out1;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1170  			path_put(&parent_path);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1171  			parent_path = *path;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1172  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1173  			next[0] = '/';
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1174  			remain_len -= filename_len + 1;
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1175  		}
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1176  
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1177  		err = -EINVAL;
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1178  out2:
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1179  		path_put(&parent_path);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1180  out1:
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1181  		kfree(filepath);
3c20378325c710 fs/cifsd/vfs.c Hyunchul Lee 2021-04-13  1182  	}
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1183  
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1184  lock_parent:
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1185  	if (!err) {
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1186  		err = ksmbd_vfs_lock_parent(parent_path.dentry, path->dentry);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1187  		if (err)
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1188  			path_put(path);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1189  		path_put(&parent_path);
5f33c60a625995 fs/ksmbd/vfs.c Namjae Jeon  2022-07-07  1190  	}
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1191  	return err;
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1192  }
f44158485826c0 fs/cifsd/vfs.c Namjae Jeon  2021-03-16  1193  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

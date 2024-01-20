Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A62C53AA;
	Sat, 20 Jan 2024 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705745140; cv=none; b=VkJvxcVcDYyUL04ScrP/I9YT9N62NB/WmWxXrdpfrclgDes8n02AIv0Dj7Bik58+GiAvzq13ZqDpbueczazNjgQvVpTrAs9MKXj3QvK7G3lhRNO7lpWChG56OQPdFLDfLePhqJ0IphXSgV6UMBZCi47LNN3WvF+OScw3ntOMmf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705745140; c=relaxed/simple;
	bh=NfHVKsFGC+7KKNZ5KrKMVmMcbIGJsutL72AWtM+2pg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIe/GXFi2FmcjIVXAV/Mgy6Ogeoyxjf0hDm5AmIM1A0T/TO6jbfL+l6nt138NYDWevOuSTf5r4t1Bdi8Pcw40gmshkTD1wfGTZDk2IvhK/xVou0T9DLhkBQl8i0u2Jx2UnSTfGzUgv0vJHo3Y3W42fQXdIyc0rhnpt43/CeSQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg/TExL0; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg/TExL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705745138; x=1737281138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfHVKsFGC+7KKNZ5KrKMVmMcbIGJsutL72AWtM+2pg4=;
  b=Bg/TExL0VtVwPL+eZ1ad6qcE1l9bE7fAK/1HJxiFuybR77SdqHizrNcw
   VlOuK96tU0a+N1KJgpHaMlbMB7vQqC1XbQ+mNyOZ3mbjC+pnPMeEJLuEY
   Rf7gq8VoN9rnrSHPFbiEpaZFhboIodFuuHPbbKWLR1lA14S3ovIc8SZ+7
   xSnR3wog3I76lDu2yUnlwLEwevdhHwYdmfLU6N3Fi+V7AMWHpPTxtUvhl
   RjrQE9fqhryxZ7bJBbRNt21hndMQQOIWTz6EDFH24sX61YQ4xq9D39Tbp
   fXrUKB/w785rIOYIojkcEQXR513R1XhPcXD2wcdk0Vdi7w2+JY4puC9ng
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="398090505"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="398090505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 02:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="26952402"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2024 02:05:35 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR8EH-0004ys-0g;
	Sat, 20 Jan 2024 10:05:33 +0000
Date: Sat, 20 Jan 2024 18:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 3/13] fs/smb/client/readdir.c:144:38: error:
 no member named 'server_eof' in 'struct cifsInodeInfo'
Message-ID: <202401201756.yjQXoulz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   6dd72c2b9e0f5141be61959f3f8a74ed0e37192b
commit: 4dd30fbc06d88f77b19de231c6fdfbe147384988 [3/13] cifs: Share server EOF pos with netfslib
config: i386-buildonly-randconfig-004-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201756.yjQXoulz-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201756.yjQXoulz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201756.yjQXoulz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/readdir.c:144:38: error: no member named 'server_eof' in 'struct cifsInodeInfo'
     144 |                                                 fattr->cf_eof = CIFS_I(inode)->server_eof;
         |                                                                 ~~~~~~~~~~~~~  ^
   1 error generated.


vim +144 fs/smb/client/readdir.c

6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06   74  
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   75  /*
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03   76   * Attempt to preload the dcache with the results from the FIND_FIRST/NEXT
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03   77   *
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   78   * Find the dentry that matches "name". If there isn't one, create one. If it's
9e6d722f3d91c9 fs/cifs/readdir.c       Nakajima Akira    2014-12-19   79   * a negative dentry or the uniqueid or filetype(mode) changed,
9e6d722f3d91c9 fs/cifs/readdir.c       Nakajima Akira    2014-12-19   80   * then drop it and recreate it.
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   81   */
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03   82  static void
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03   83  cifs_prime_dcache(struct dentry *parent, struct qstr *name,
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   84  		    struct cifs_fattr *fattr)
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   85  {
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   86  	struct dentry *dentry, *alias;
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   87  	struct inode *inode;
fc64005c93090c fs/cifs/readdir.c       Al Viro           2016-04-10   88  	struct super_block *sb = parent->d_sb;
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18   89  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20   90  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wq);
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06   91  	int rc;
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   92  
f96637be081141 fs/cifs/readdir.c       Joe Perches       2013-05-04   93  	cifs_dbg(FYI, "%s: for %s\n", __func__, name->name);
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25   94  
4f522a247bc26d fs/cifs/readdir.c       Al Viro           2013-02-11   95  	dentry = d_hash_and_lookup(parent, name);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20   96  	if (!dentry) {
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20   97  		/*
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20   98  		 * If we know that the inode will need to be revalidated
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20   99  		 * immediately, then don't create a new dentry for it.
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  100  		 * We'll end up doing an on the wire call either way and
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  101  		 * this spares us an invalidation.
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  102  		 */
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  103  retry:
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  104  		if ((fattr->cf_cifsattrs & ATTR_REPARSE) ||
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  105  		    (fattr->cf_flags & CIFS_FATTR_NEED_REVAL))
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  106  			return;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  107  
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  108  		dentry = d_alloc_parallel(parent, name, &wq);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  109  	}
a1c83681d52704 fs/cifs/readdir.c       Viresh Kumar      2015-08-12  110  	if (IS_ERR(dentry))
4f522a247bc26d fs/cifs/readdir.c       Al Viro           2013-02-11  111  		return;
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  112  	if (!d_in_lookup(dentry)) {
2b0143b5c986be fs/cifs/readdir.c       David Howells     2015-03-17  113  		inode = d_inode(dentry);
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  114  		if (inode) {
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  115  			if (d_mountpoint(dentry)) {
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  116  				dput(dentry);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  117  				return;
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  118  			}
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  119  			/*
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  120  			 * If we're generating inode numbers, then we don't
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  121  			 * want to clobber the existing one with the one that
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  122  			 * the readdir code created.
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  123  			 */
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  124  			if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_SERVER_INUM))
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  125  				fattr->cf_uniqueid = CIFS_I(inode)->uniqueid;
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  126  
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  127  			/*
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  128  			 * Update inode in place if both i_ino and i_mode didn't
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  129  			 * change.
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  130  			 */
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  131  			if (CIFS_I(inode)->uniqueid == fattr->cf_uniqueid) {
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  132  				/*
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  133  				 * Query dir responses don't provide enough
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  134  				 * information about reparse points other than
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  135  				 * their reparse tags.  Save an invalidation by
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  136  				 * not clobbering the existing mode, size and
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  137  				 * symlink target (if any) when reparse tag and
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  138  				 * ctime haven't changed.
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  139  				 */
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  140  				rc = 0;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  141  				if (fattr->cf_cifsattrs & ATTR_REPARSE) {
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  142  					if (likely(reparse_inode_match(inode, fattr))) {
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  143  						fattr->cf_mode = inode->i_mode;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06 @144  						fattr->cf_eof = CIFS_I(inode)->server_eof;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  145  						fattr->cf_symlink_target = NULL;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  146  					} else {
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  147  						CIFS_I(inode)->time = 0;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  148  						rc = -ESTALE;
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  149  					}
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  150  				}
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  151  				if (!rc && !cifs_fattr_to_inode(inode, fattr)) {
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  152  					dput(dentry);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  153  					return;
cd60042cc1392e fs/cifs/readdir.c       Jeff Layton       2012-07-06  154  				}
2f2591a34db6c9 fs/cifs/readdir.c       Jeff Layton       2012-12-18  155  			}
6d039984c15d1e fs/smb/client/readdir.c Paulo Alcantara   2024-01-06  156  		}
5542aa2fa7f6cd fs/cifs/readdir.c       Eric W. Biederman 2014-02-13  157  		d_invalidate(dentry);
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25  158  		dput(dentry);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  159  		goto retry;
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  160  	} else {
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25  161  		inode = cifs_iget(sb, fattr);
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03  162  		if (!inode)
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  163  			inode = ERR_PTR(-ENOMEM);
41d28bca2da4bd fs/cifs/readdir.c       Al Viro           2014-10-12  164  		alias = d_splice_alias(inode, dentry);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  165  		d_lookup_done(dentry);
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03  166  		if (alias && !IS_ERR(alias))
eb1b3fa5cdb9c2 fs/cifs/readdir.c       Jeff Layton       2012-12-03  167  			dput(alias);
3125d2650cae97 fs/cifs/readdir.c       Al Viro           2016-04-20  168  	}
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25  169  	dput(dentry);
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25  170  }
cc0bad7552308e fs/cifs/readdir.c       Jeff Layton       2009-06-25  171  

:::::: The code at line 144 was first introduced by commit
:::::: 6d039984c15d1ea1ca080176df6dfab443e44585 smb: client: stop revalidating reparse points unnecessarily

:::::: TO: Paulo Alcantara <pc@manguebit.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF1D2E5;
	Sat, 18 Nov 2023 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J34rJLOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700284913; x=1731820913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbJCo8ZdSwZUIaS0Ve2SlJ6vsXsnPlA53ftsf5UfFe0=;
  b=J34rJLOGKNf2tyxGPX7LjhajgyXoIejYOyFNauCJfAGtd07xJOq4k1B2
   T7W1bAQQeygZdAYifW0iYmSllUNUzEJoUqufuFWWwlRXOvPH7xGVrL3+S
   Zvb0VT95LZWn6cstiD5B6iatfnPwZ+RzxIhcmPdlRYxCm/28sgwh7yXtZ
   L60lC5lk/ZlXCRFnXGZViXXtbb66yLW6karlJSJyt3ugCDqn4legwB6bc
   GA9HON4HJ7erkMMHqXPtoDCZU2aojWO5jsgEO47TCLHIxfQPm823vpezu
   jhGrotkSctcJIQXsopOkciN1M0vU1XfdFSKLuKwopC6Vjd6Y0ERgLa1KW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="395334550"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="395334550"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097293091"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="1097293091"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2023 21:21:51 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Dm8-0003YP-2o;
	Sat, 18 Nov 2023 05:21:48 +0000
Date: Sat, 18 Nov 2023 13:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@google.com>
Subject: [krisman-unicode:for-next 3/10] fs/ceph/dir.c:1872:44: error: too
 few arguments to function call, expected 3, have 2
Message-ID: <202311181351.Hn7HpZKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git for-next
head:   ea1a615cb6e7ea94b0682005400c7f30bf448f00
commit: 24084e50e5790ecce3c7107d41233be6b11fc696 [3/10] fs: Expose name under lookup to d_revalidate hooks
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231118/202311181351.Hn7HpZKC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181351.Hn7HpZKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181351.Hn7HpZKC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/dir.c:1872:44: error: too few arguments to function call, expected 3, have 2
           valid = fscrypt_d_revalidate(dentry, flags);
                   ~~~~~~~~~~~~~~~~~~~~              ^
   include/linux/fscrypt.h:356:5: note: 'fscrypt_d_revalidate' declared here
   int fscrypt_d_revalidate(struct dentry *dentry, const struct qstr *name,
       ^
   1 error generated.


vim +1872 fs/ceph/dir.c

2817b000b02c5f Sage Weil               2009-10-06  1860  
2817b000b02c5f Sage Weil               2009-10-06  1861  /*
2817b000b02c5f Sage Weil               2009-10-06  1862   * Check if cached dentry can be trusted.
2817b000b02c5f Sage Weil               2009-10-06  1863   */
24084e50e5790e Gabriel Krisman Bertazi 2023-08-16  1864  static int ceph_d_revalidate(struct dentry *dentry, const struct qstr *name,
24084e50e5790e Gabriel Krisman Bertazi 2023-08-16  1865  			     unsigned int flags)
2817b000b02c5f Sage Weil               2009-10-06  1866  {
bf1c6aca96c9d2 Sage Weil               2011-07-26  1867  	int valid = 0;
641235d8f82357 Yan, Zheng              2016-03-16  1868  	struct dentry *parent;
aa8dd816732b2b Al Viro                 2019-10-29  1869  	struct inode *dir, *inode;
719a2514e9bf31 Yan, Zheng              2020-03-05  1870  	struct ceph_mds_client *mdsc;
34286d6662308d Nicholas Piggin         2011-01-07  1871  
c526760181ca08 Jeff Layton             2020-08-07 @1872  	valid = fscrypt_d_revalidate(dentry, flags);
c526760181ca08 Jeff Layton             2020-08-07  1873  	if (valid <= 0)
c526760181ca08 Jeff Layton             2020-08-07  1874  		return valid;
c526760181ca08 Jeff Layton             2020-08-07  1875  
f49d1e058d23a5 Jeff Layton             2016-07-01  1876  	if (flags & LOOKUP_RCU) {
52953d55917e45 Seraphime Kirkovski     2016-12-26  1877  		parent = READ_ONCE(dentry->d_parent);
f49d1e058d23a5 Jeff Layton             2016-07-01  1878  		dir = d_inode_rcu(parent);
f49d1e058d23a5 Jeff Layton             2016-07-01  1879  		if (!dir)
34286d6662308d Nicholas Piggin         2011-01-07  1880  			return -ECHILD;
aa8dd816732b2b Al Viro                 2019-10-29  1881  		inode = d_inode_rcu(dentry);
f49d1e058d23a5 Jeff Layton             2016-07-01  1882  	} else {
f49d1e058d23a5 Jeff Layton             2016-07-01  1883  		parent = dget_parent(dentry);
f49d1e058d23a5 Jeff Layton             2016-07-01  1884  		dir = d_inode(parent);
aa8dd816732b2b Al Viro                 2019-10-29  1885  		inode = d_inode(dentry);
f49d1e058d23a5 Jeff Layton             2016-07-01  1886  	}
34286d6662308d Nicholas Piggin         2011-01-07  1887  
c526760181ca08 Jeff Layton             2020-08-07  1888  	dout("d_revalidate %p '%pd' inode %p offset 0x%llx nokey %d\n", dentry,
c526760181ca08 Jeff Layton             2020-08-07  1889  	     dentry, inode, ceph_dentry(dentry)->offset,
c526760181ca08 Jeff Layton             2020-08-07  1890  	     !!(dentry->d_flags & DCACHE_NOKEY_NAME));
2817b000b02c5f Sage Weil               2009-10-06  1891  
719a2514e9bf31 Yan, Zheng              2020-03-05  1892  	mdsc = ceph_sb_to_client(dir->i_sb)->mdsc;
719a2514e9bf31 Yan, Zheng              2020-03-05  1893  
2817b000b02c5f Sage Weil               2009-10-06  1894  	/* always trust cached snapped dentries, snapdir dentry */
2817b000b02c5f Sage Weil               2009-10-06  1895  	if (ceph_snap(dir) != CEPH_NOSNAP) {
a455589f181e60 Al Viro                 2014-10-21  1896  		dout("d_revalidate %p '%pd' inode %p is SNAPPED\n", dentry,
aa8dd816732b2b Al Viro                 2019-10-29  1897  		     dentry, inode);
bf1c6aca96c9d2 Sage Weil               2011-07-26  1898  		valid = 1;
aa8dd816732b2b Al Viro                 2019-10-29  1899  	} else if (inode && ceph_snap(inode) == CEPH_SNAPDIR) {
bf1c6aca96c9d2 Sage Weil               2011-07-26  1900  		valid = 1;
14fb9c9efe3570 Jeff Layton             2016-07-01  1901  	} else {
8f2a98ef3c1adf Yan, Zheng              2019-05-23  1902  		valid = dentry_lease_is_valid(dentry, flags);
14fb9c9efe3570 Jeff Layton             2016-07-01  1903  		if (valid == -ECHILD)
14fb9c9efe3570 Jeff Layton             2016-07-01  1904  			return valid;
719a2514e9bf31 Yan, Zheng              2020-03-05  1905  		if (valid || dir_lease_is_valid(dir, dentry, mdsc)) {
aa8dd816732b2b Al Viro                 2019-10-29  1906  			if (inode)
aa8dd816732b2b Al Viro                 2019-10-29  1907  				valid = ceph_is_any_caps(inode);
9215aeea622fec Yan, Zheng              2013-11-30  1908  			else
bf1c6aca96c9d2 Sage Weil               2011-07-26  1909  				valid = 1;
2817b000b02c5f Sage Weil               2009-10-06  1910  		}
14fb9c9efe3570 Jeff Layton             2016-07-01  1911  	}
2817b000b02c5f Sage Weil               2009-10-06  1912  
200fd27c8fa2ba Yan, Zheng              2016-03-17  1913  	if (!valid) {
200fd27c8fa2ba Yan, Zheng              2016-03-17  1914  		struct ceph_mds_request *req;
1097680d759918 Jeff Layton             2017-01-12  1915  		int op, err;
1097680d759918 Jeff Layton             2017-01-12  1916  		u32 mask;
200fd27c8fa2ba Yan, Zheng              2016-03-17  1917  
f49d1e058d23a5 Jeff Layton             2016-07-01  1918  		if (flags & LOOKUP_RCU)
f49d1e058d23a5 Jeff Layton             2016-07-01  1919  			return -ECHILD;
f49d1e058d23a5 Jeff Layton             2016-07-01  1920  
f9009efac49c83 Xiubo Li                2020-03-19  1921  		percpu_counter_inc(&mdsc->metric.d_lease_mis);
f9009efac49c83 Xiubo Li                2020-03-19  1922  
200fd27c8fa2ba Yan, Zheng              2016-03-17  1923  		op = ceph_snap(dir) == CEPH_SNAPDIR ?
5eb9f6040f3854 Jeff Layton             2017-01-30  1924  			CEPH_MDS_OP_LOOKUPSNAP : CEPH_MDS_OP_LOOKUP;
200fd27c8fa2ba Yan, Zheng              2016-03-17  1925  		req = ceph_mdsc_create_request(mdsc, op, USE_ANY_MDS);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1926  		if (!IS_ERR(req)) {
200fd27c8fa2ba Yan, Zheng              2016-03-17  1927  			req->r_dentry = dget(dentry);
5eb9f6040f3854 Jeff Layton             2017-01-30  1928  			req->r_num_caps = 2;
5eb9f6040f3854 Jeff Layton             2017-01-30  1929  			req->r_parent = dir;
4c18347238ab5a Jeff Layton             2021-06-18  1930  			ihold(dir);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1931  
200fd27c8fa2ba Yan, Zheng              2016-03-17  1932  			mask = CEPH_STAT_CAP_INODE | CEPH_CAP_AUTH_SHARED;
200fd27c8fa2ba Yan, Zheng              2016-03-17  1933  			if (ceph_security_xattr_wanted(dir))
200fd27c8fa2ba Yan, Zheng              2016-03-17  1934  				mask |= CEPH_CAP_XATTR_SHARED;
1097680d759918 Jeff Layton             2017-01-12  1935  			req->r_args.getattr.mask = cpu_to_le32(mask);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1936  
200fd27c8fa2ba Yan, Zheng              2016-03-17  1937  			err = ceph_mdsc_do_request(mdsc, NULL, req);
c3f4688a08fd86 Jeff Layton             2016-11-30  1938  			switch (err) {
c3f4688a08fd86 Jeff Layton             2016-11-30  1939  			case 0:
c3f4688a08fd86 Jeff Layton             2016-11-30  1940  				if (d_really_is_positive(dentry) &&
c3f4688a08fd86 Jeff Layton             2016-11-30  1941  				    d_inode(dentry) == req->r_target_inode)
c3f4688a08fd86 Jeff Layton             2016-11-30  1942  					valid = 1;
c3f4688a08fd86 Jeff Layton             2016-11-30  1943  				break;
c3f4688a08fd86 Jeff Layton             2016-11-30  1944  			case -ENOENT:
c3f4688a08fd86 Jeff Layton             2016-11-30  1945  				if (d_really_is_negative(dentry))
c3f4688a08fd86 Jeff Layton             2016-11-30  1946  					valid = 1;
df561f6688fef7 Gustavo A. R. Silva     2020-08-23  1947  				fallthrough;
c3f4688a08fd86 Jeff Layton             2016-11-30  1948  			default:
c3f4688a08fd86 Jeff Layton             2016-11-30  1949  				break;
200fd27c8fa2ba Yan, Zheng              2016-03-17  1950  			}
200fd27c8fa2ba Yan, Zheng              2016-03-17  1951  			ceph_mdsc_put_request(req);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1952  			dout("d_revalidate %p lookup result=%d\n",
200fd27c8fa2ba Yan, Zheng              2016-03-17  1953  			     dentry, err);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1954  		}
f9009efac49c83 Xiubo Li                2020-03-19  1955  	} else {
f9009efac49c83 Xiubo Li                2020-03-19  1956  		percpu_counter_inc(&mdsc->metric.d_lease_hit);
200fd27c8fa2ba Yan, Zheng              2016-03-17  1957  	}
200fd27c8fa2ba Yan, Zheng              2016-03-17  1958  
bf1c6aca96c9d2 Sage Weil               2011-07-26  1959  	dout("d_revalidate %p %s\n", dentry, valid ? "valid" : "invalid");
37c4efc1ddf98b Yan, Zheng              2019-01-31  1960  	if (!valid)
9215aeea622fec Yan, Zheng              2013-11-30  1961  		ceph_dir_clear_complete(dir);
641235d8f82357 Yan, Zheng              2016-03-16  1962  
f49d1e058d23a5 Jeff Layton             2016-07-01  1963  	if (!(flags & LOOKUP_RCU))
641235d8f82357 Yan, Zheng              2016-03-16  1964  		dput(parent);
bf1c6aca96c9d2 Sage Weil               2011-07-26  1965  	return valid;
2817b000b02c5f Sage Weil               2009-10-06  1966  }
2817b000b02c5f Sage Weil               2009-10-06  1967  

:::::: The code at line 1872 was first introduced by commit
:::::: c526760181ca083dbd607d2e694b43080a8b1585 ceph: make d_revalidate call fscrypt revalidator for encrypted dentries

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB07B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655570303; x=1687106303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44olcdvemTrn1KIWWSAtJXkg8zEmREhBPCabj39AkE4=;
  b=Xg28tXYvL9IeBNBGbaLuQUJq4Yi4EMXj0WimkayVR7GIPUjOMGaNCFYr
   46aNg4EZP64M0pCa6aOcRw+VOaZw0RRIKEUGOoMVdeuiUSsHP6dePwMil
   nZazK0H0lHnYNeahencJIgWIT37eW7OLGSlfQhcjWwKTD78YX7rUjCN2S
   MDxCtnPpKlFQ3e4KVVp/asvCJo1TE6kI03b+7JRLbjcBmkti71tV2fvUD
   teJ2TuRKHEPj+qurFxDsDHFK8hrLqZmBDyn6fR3Foueh6fKfBMhdJt5YC
   hLOlYXtEbPdv7g8zpfh07QUaCJkNEGHPQ3/MZCW5wdEQ4vh+HZXi94Nng
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="260096815"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="260096815"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 09:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688768828"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2022 09:38:22 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2bSn-000QRH-Bw;
	Sat, 18 Jun 2022 16:38:21 +0000
Date: Sun, 19 Jun 2022 00:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC] iov_iter: import single segments iovecs as ITER_UBUF
Message-ID: <202206190044.xokGx8NW-lkp@intel.com>
References: <b3e19eb1-18c4-8599-b68d-bf28673237d1@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e19eb1-18c4-8599-b68d-bf28673237d1@kernel.dk>

Hi Jens,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Axboe/iov_iter-import-single-segments-iovecs-as-ITER_UBUF/20220618-221039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4b35035bcf80ddb47c0112c4fbd84a63a2836a18
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220619/202206190044.xokGx8NW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 91688716ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ec74a6fdd818738cf8e0c0f10798fa001970bb81
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jens-Axboe/iov_iter-import-single-segments-iovecs-as-ITER_UBUF/20220618-221039
        git checkout ec74a6fdd818738cf8e0c0f10798fa001970bb81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/iov_iter.c:1950:9: error: call to undeclared function 'import_ubuf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = import_ubuf(type, iovp[0]->iov_base, total_len, i);
                         ^
   lib/iov_iter.c:1950:9: note: did you mean 'import_uuid'?
   include/linux/uuid.h:71:20: note: 'import_uuid' declared here
   static inline void import_uuid(uuid_t *dst, const __u8 *src)
                      ^
   1 error generated.


vim +/import_ubuf +1950 lib/iov_iter.c

  1927	
  1928	ssize_t __import_iovec(int type, const struct iovec __user *uvec,
  1929			 unsigned nr_segs, unsigned fast_segs, struct iovec **iovp,
  1930			 struct iov_iter *i, bool compat)
  1931	{
  1932		ssize_t total_len = 0;
  1933		unsigned long seg;
  1934		struct iovec *iov;
  1935	
  1936		iov = iovec_from_user(uvec, nr_segs, fast_segs, *iovp, compat);
  1937		if (IS_ERR(iov)) {
  1938			*iovp = NULL;
  1939			return PTR_ERR(iov);
  1940		}
  1941	
  1942		/*
  1943		 * Fast path - single segment import. Use UBUF for these, rather
  1944		 * than setup an ITER_IOV.
  1945		 */
  1946		if (nr_segs == 1) {
  1947			ssize_t ret;
  1948	
  1949			total_len = iovp[0]->iov_len;
> 1950			ret = import_ubuf(type, iovp[0]->iov_base, total_len, i);
  1951			*iovp = NULL;
  1952			if (unlikely(ret < 0))
  1953				return ret;
  1954			return total_len;
  1955		}
  1956	
  1957		/*
  1958		 * According to the Single Unix Specification we should return EINVAL if
  1959		 * an element length is < 0 when cast to ssize_t or if the total length
  1960		 * would overflow the ssize_t return value of the system call.
  1961		 *
  1962		 * Linux caps all read/write calls to MAX_RW_COUNT, and avoids the
  1963		 * overflow case.
  1964		 */
  1965		for (seg = 0; seg < nr_segs; seg++) {
  1966			ssize_t len = (ssize_t)iov[seg].iov_len;
  1967	
  1968			if (!access_ok(iov[seg].iov_base, len)) {
  1969				if (iov != *iovp)
  1970					kfree(iov);
  1971				*iovp = NULL;
  1972				return -EFAULT;
  1973			}
  1974	
  1975			if (len > MAX_RW_COUNT - total_len) {
  1976				len = MAX_RW_COUNT - total_len;
  1977				iov[seg].iov_len = len;
  1978			}
  1979			total_len += len;
  1980		}
  1981	
  1982		iov_iter_init(i, type, iov, nr_segs, total_len);
  1983		if (iov == *iovp)
  1984			*iovp = NULL;
  1985		else
  1986			*iovp = iov;
  1987		return total_len;
  1988	}
  1989	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

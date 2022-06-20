Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094429CA
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655748412; x=1687284412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnMygAZ4jF7f+ZKGKRpoVUPsKM/JQ11jmZTshXl44j4=;
  b=lndXzGPtj+lDOJ7C70ttqKr8/t7+ehKYen5QxdqZtV6BsOuq4RxijHAF
   J9dGHIeCTfFdhh/ilNhR5uEnGC+MKf7g8pCebrdtAKn3Q/LbFKecTcDMf
   7jFZBddMzmOxuZROpy071rBbaRbmYJSgeMo4IMmZvp19KicobDkYWTXH8
   UEJ123ikcTKdIhoKWNJzo25Any6nm3zQfzT6PchVWoQUOgpM49usiX+ih
   dSS5NSPXO2zCExUQv+COr7/ZrQs8dSGYv8umgJWvxDyKTBWnZ6TryvzNY
   mUtZCtrr1+3K2+JsinT65ybjWLUvacMgzEkytaMccFL6FCvkWQwqqkgJK
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="277498948"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="277498948"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 11:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="591280532"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 11:06:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3LnM-000UtC-9p;
	Mon, 20 Jun 2022 18:06:40 +0000
Date: Tue, 21 Jun 2022 02:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 4/5] userfaultfd: zero access/write hints
Message-ID: <202206210125.0A6porLp-lkp@intel.com>
References: <20220619233449.181323-5-namit@vmware.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619233449.181323-5-namit@vmware.com>

Hi Nadav,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[cannot apply to shuah-kselftest/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nadav-Amit/userfaultfd-support-access-write-hints/20220620-150942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: i386-randconfig-a011-20220620 (https://download.01.org/0day-ci/archive/20220621/202206210125.0A6porLp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e5d70abf56dd545f8ea3abce34e8af894745c2bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nadav-Amit/userfaultfd-support-access-write-hints/20220620-150942
        git checkout e5d70abf56dd545f8ea3abce34e8af894745c2bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/userfaultfd.c:1774:15: warning: variable 'uffd_flags' set but not used [-Wunused-but-set-variable]
           uffd_flags_t uffd_flags;
                        ^
   1 warning generated.


vim +/uffd_flags +1774 fs/userfaultfd.c

  1765	
  1766	static int userfaultfd_zeropage(struct userfaultfd_ctx *ctx,
  1767					unsigned long arg)
  1768	{
  1769		__s64 ret;
  1770		struct uffdio_zeropage uffdio_zeropage;
  1771		struct uffdio_zeropage __user *user_uffdio_zeropage;
  1772		struct userfaultfd_wake_range range;
  1773		bool mode_dontwake, mode_access_likely, mode_write_likely;
> 1774		uffd_flags_t uffd_flags;
  1775	
  1776		user_uffdio_zeropage = (struct uffdio_zeropage __user *) arg;
  1777	
  1778		ret = -EAGAIN;
  1779		if (atomic_read(&ctx->mmap_changing))
  1780			goto out;
  1781	
  1782		ret = -EFAULT;
  1783		if (copy_from_user(&uffdio_zeropage, user_uffdio_zeropage,
  1784				   /* don't copy "zeropage" last field */
  1785				   sizeof(uffdio_zeropage)-sizeof(__s64)))
  1786			goto out;
  1787	
  1788		ret = validate_range(ctx->mm, uffdio_zeropage.range.start,
  1789				     uffdio_zeropage.range.len);
  1790		if (ret)
  1791			goto out;
  1792		ret = -EINVAL;
  1793	
  1794		mode_dontwake = uffdio_zeropage.mode & UFFDIO_ZEROPAGE_MODE_DONTWAKE;
  1795		mode_access_likely = uffdio_zeropage.mode & UFFDIO_ZEROPAGE_MODE_ACCESS_LIKELY;
  1796		mode_write_likely = uffdio_zeropage.mode & UFFDIO_ZEROPAGE_MODE_WRITE_LIKELY;
  1797	
  1798		if (mode_dontwake)
  1799			return -EINVAL;
  1800	
  1801		uffd_flags = (mode_access_likely ? UFFD_FLAGS_ACCESS_LIKELY : 0) |
  1802			     (mode_write_likely ? UFFD_FLAGS_WRITE_LIKELY : 0);
  1803	
  1804		if (mmget_not_zero(ctx->mm)) {
  1805			ret = mfill_zeropage(ctx->mm, uffdio_zeropage.range.start,
  1806					     uffdio_zeropage.range.len,
  1807					     &ctx->mmap_changing, 0);
  1808			mmput(ctx->mm);
  1809		} else {
  1810			return -ESRCH;
  1811		}
  1812		if (unlikely(put_user(ret, &user_uffdio_zeropage->zeropage)))
  1813			return -EFAULT;
  1814		if (ret < 0)
  1815			goto out;
  1816		/* len == 0 would wake all */
  1817		BUG_ON(!ret);
  1818		range.len = ret;
  1819		if (!(uffdio_zeropage.mode & UFFDIO_ZEROPAGE_MODE_DONTWAKE)) {
  1820			range.start = uffdio_zeropage.range.start;
  1821			wake_userfault(ctx, &range);
  1822		}
  1823		ret = range.len == uffdio_zeropage.range.len ? 0 : -EAGAIN;
  1824	out:
  1825		return ret;
  1826	}
  1827	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

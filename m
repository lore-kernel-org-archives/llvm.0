Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F502F546E;
	Fri, 14 Nov 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102888; cv=none; b=Fw8DnJpPiohorPkZWFA/fzvo/Fw6WmC6cJXTedj6d1ws59Tq4OV9cEnxjzSvK8hgu1mKXR3UKuMEdEgjQSQo7WtGZa6brc10XVftt6DKt0S5Z10l1zuah0FQw1/ASqGPGKRYi3uNkUnwj66G0xwckaS0uordL82ti96HpQ4eGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102888; c=relaxed/simple;
	bh=THbj+88VuO4sIuy3hWP2HnvGnvBd21831d3imWSeuqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXV40nZQ1ZDgQUVBn23EewM3QJoD/4BqE7520226TWwLwIwfOE7NuzxBsFsPC8geTdLyLHfKBJROU1K2h71aHiBHr1y2r6zxJUTOQjtldcAHeKHyWHLuihZTLoQyXPYXYHpQ+mQl4HICacIu13yT7lEs9Nu9tfJtBL9rBM0ifis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8tK7R5Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8tK7R5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102885; x=1794638885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=THbj+88VuO4sIuy3hWP2HnvGnvBd21831d3imWSeuqM=;
  b=P8tK7R5ZpN+VzQstrDRI0GxIPk7iW2OzjMZQxUgcOuphxelEqAwrLe7A
   J1bmzHP3+RCe+8fIJQJD8eS3aP7FxBKV9P+LKxjB8enMmQfJtFbyCpzdJ
   a2r4Aq0Py33w7fsWdarmf7Ud1Axt5qr3ZiTyj++UOXuGj9iuxNXSRm8DD
   +WfPGy896YtuJn+Y91WFOCGPRqzwnc/M2QHRkt+zLii17+1pP+NP43eBk
   6owZe5+euumMxJc+YykSsdltU/JKjIwFMKNG0Q1B6F4GxsV3NK1QbuN0J
   C31mXh4J6FXrv7U6sqhIepswK7oiC+JT2eVb7+10UpiKc6O2BtBr4g+g/
   Q==;
X-CSE-ConnectionGUID: Kwg+VducRVytm+/BcGdXZQ==
X-CSE-MsgGUID: IuoeBJYUS+aYHhW9RU2ffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82829296"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="82829296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:01 -0800
X-CSE-ConnectionGUID: pIupv9WCRdGjiwtsuDqWcA==
X-CSE-MsgGUID: TpxMZq//RmaV4GtGbxkzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190485394"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006Ff-11;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH V3 6/6] gpib: Destage gpib
Message-ID: <202511141203.sbp27oAR-lkp@intel.com>
References: <20251113104543.5875-7-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113104543.5875-7-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-Remove-gpib-build-from-staging/20251113-185632
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251113104543.5875-7-dpenkler%40gmail.com
patch subject: [PATCH V3 6/6] gpib: Destage gpib
config: powerpc64-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141203.sbp27oAR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141203.sbp27oAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141203.sbp27oAR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/gpib_ioctl.h:43:21: error: // comments are not allowed in this language [-Werror,-Wcomment]
      43 |         __u8 padding[3];   // align to 32 bit boundary
         |                            ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6A200CB4;
	Fri, 18 Oct 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245329; cv=none; b=MvxRPDx3JjYQklHbhShhgt/le5YJUgVde1AAPWQh8JRVtfGe8aFURkwlxDePfum/ggGS18KayVSM02wXlqtYqGfSRy1DT9JBmDGJGsa/7HMg6YiMGNxDlsbwiCvme0ZmYiDQrC/Qeat39rjAaRAOCGri4/R1vODiF0xQzPPZB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245329; c=relaxed/simple;
	bh=5PDMUTNypGoTv8jck74VZSTfJJ/lZzbeN20sNMd8Q1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRe661cc0n/BrzAWQoDG53VpUoWOe2a0BoSXWV967C+FCsbR41xDRQq28o1EjTVL1kFzUwnfUfYKj+dcZ9y6Br7DgIZKswPq8leR7fynU0c7c164+hz1TrvRrdjcv4RIi1DQJ6uW6+p7yEigSZnMMo43OjLq695Sz80O1u9hAZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn+LNdWE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn+LNdWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729245328; x=1760781328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5PDMUTNypGoTv8jck74VZSTfJJ/lZzbeN20sNMd8Q1Y=;
  b=Vn+LNdWEcwTeM8/CZsi/GYGDVVera5jjzPQkYpAUPpr1q0p6raorZTkx
   Au7oxtwv+aJfU+HjNsGpm8CYH0270eUtPCQFXKA+e4JjegbZLHfV2i/bL
   KrL3DFoBGn7a6PTmXRVNUKtKIE1tGQMaBd79F8Y4xYzDxHa+z75n1oY0n
   RXMjwcNseK1gsasXzU3DNdZUeXYERe3hLWyZ6RBGEcMyg27BBTBntjNAa
   5SYNtd9GzySI6WaiiF9IljppGtugLkBCFHGa2dW2RS5RLEK2Yy5xg2fIe
   L+WG/f50cd6S8InCRzU52haSPOB+w06L9IQWRv4i0VXicm8mGMO2Mg+My
   A==;
X-CSE-ConnectionGUID: C++WkNB4TViNO6rR2pkcDA==
X-CSE-MsgGUID: f2o02lBeRkC77rzMx7PxvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40131112"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="40131112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 02:55:25 -0700
X-CSE-ConnectionGUID: uSoo9bUaQDCijsl2Q0Vsuw==
X-CSE-MsgGUID: FRxVOG5aRHGZ8RKcBcgszA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78734838"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2024 02:55:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1jhZ-000Na9-0n;
	Fri, 18 Oct 2024 09:55:21 +0000
Date: Fri, 18 Oct 2024 17:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] f2fs: zone: don't block IO if there is remained open
 zone
Message-ID: <202410181726.6oq4qPDH-lkp@intel.com>
References: <20241017081421.2213743-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017081421.2213743-1-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-zone-don-t-block-IO-if-there-is-remained-open-zone/20241017-162658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241017081421.2213743-1-chao%40kernel.org
patch subject: [PATCH v7] f2fs: zone: don't block IO if there is remained open zone
config: i386-buildonly-randconfig-002-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181726.6oq4qPDH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181726.6oq4qPDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181726.6oq4qPDH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:666:67: error: too many arguments to function call, expected single argument 'seg_type', have 2 arguments
     666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
         |                                               ~~~~~~~~~~~~~~~~~~~~~      ^~~~
   fs/f2fs/f2fs.h:3762:5: note: 'f2fs_get_segment_temp' declared here
    3762 | int f2fs_get_segment_temp(int seg_type);
         |     ^                     ~~~~~~~~~~~~
   fs/f2fs/data.c:2426:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2426 |         pgoff_t index;
         |                 ^
   1 warning and 1 error generated.
--
>> fs/f2fs/segment.c:4324:38: error: too many arguments to function call, expected single argument 'seg_type', have 2 arguments
    4324 |                         temp = f2fs_get_segment_temp(sbi, type);
         |                                ~~~~~~~~~~~~~~~~~~~~~      ^~~~
   fs/f2fs/segment.c:3610:5: note: 'f2fs_get_segment_temp' declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^                     ~~~~~~~~~~~~
   fs/f2fs/segment.c:5666:53: error: too many arguments to function call, expected single argument 'seg_type', have 2 arguments
    5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
         |                                               ~~~~~~~~~~~~~~~~~~~~~      ^
   fs/f2fs/segment.c:3610:5: note: 'f2fs_get_segment_temp' declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^                     ~~~~~~~~~~~~
   2 errors generated.


vim +/seg_type +666 fs/f2fs/data.c

   657	
   658	void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
   659	{
   660	#ifdef CONFIG_BLK_DEV_ZONED
   661		struct f2fs_bio_info *io;
   662	
   663		if (!f2fs_sb_has_blkzoned(sbi))
   664			return;
   665	
 > 666		io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
   667	
   668		f2fs_down_write(&io->io_rwsem);
   669		if (io->zone_opened) {
   670			if (io->bio) {
   671				io->close_zone = true;
   672				__submit_merged_bio(io);
   673			} else {
   674				up(&sbi->available_open_zones);
   675				io->zone_opened = false;
   676			}
   677		}
   678		f2fs_up_write(&io->io_rwsem);
   679	#endif
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

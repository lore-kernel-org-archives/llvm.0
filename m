Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE771922DB;
	Sat, 19 Oct 2024 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729375087; cv=none; b=Ca0lVTwvxJQi7MLgrhg3NEw+jQaIhhGJbDj+n2AW31d4HPO7RaW0Yn/Oa+tCo2d3xbRrkm/4nxxrqwMOe3Wm9LhVYJF9wMamkNgeNRxSQG3MyE4nCgpRpIj2yyxxjfy7Qdi7tE1ON7C8WZhfNR3NKhL82HJtFvx8PafK6aXX/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729375087; c=relaxed/simple;
	bh=kF4o32H6Y+d5GRg9+dYDAFXUYee3JdV9QlWYoFKJKBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUV+zLuIvwViPUwGnPROX4Ncm0nRTJx4yV7DLQJkqVKHdwVCWVAk60eyFJ1I4p6IjjxWDhiTF9Vi865gts1RUGb2WfVh66XFz3ebRcSf+rFjqDvrbGMPbNQoto3AEVc9fzH3MJ/AJbRsXZA40tH2BYVm24uGNvOQX/A8PfH93/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=du6bVCJ8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="du6bVCJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729375085; x=1760911085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kF4o32H6Y+d5GRg9+dYDAFXUYee3JdV9QlWYoFKJKBQ=;
  b=du6bVCJ82ZYYkBbDdZzytc7j9DaEPM/AQvYryzqa1iApiejZUw0Nn1bS
   vWP/3x3q1A9BHwlKWMor8tYR9KtuFeVMQX/rtw4/RrvWeIoNSARWtIdF+
   K+AtVUdcK2GkIt1W4mpWi+VblUvGBZD50SABHk/fc02d3Y6b+t1rpgjJZ
   aqTxP8aH7dgN/xqchbi+fprdqbV7Pa4ns84sjRz7ybqLiaGM/lSuOIwEQ
   2tiu477wgaki53V8e7pmnobeQBn9Pf2IB8ZLgbtpInRCrLY3rM3ZRrpvc
   g27C3G8K12RYT+DK2cZtNKGJF8hykZG7BE1QiNXxBY674tz2R3PnT/eCP
   g==;
X-CSE-ConnectionGUID: QAXcys5tTUeYj90bEZxV+w==
X-CSE-MsgGUID: OwVoCv7PQ46okjlxUCxaog==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28983916"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28983916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 14:58:05 -0700
X-CSE-ConnectionGUID: fPl6equpT0uNzjD4ZHvRgQ==
X-CSE-MsgGUID: jZ/gyGMvRW2olnQDoGkwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83737408"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2024 14:58:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2HSS-000PaT-0f;
	Sat, 19 Oct 2024 21:58:00 +0000
Date: Sun, 20 Oct 2024 05:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
	jaegeuk@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: Re: [PATCH] f2fs: fix to convert log type to segment data type
 correctly
Message-ID: <202410200521.Mc4H4BHm-lkp@intel.com>
References: <20241018092200.2792472-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018092200.2792472-1-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-convert-log-type-to-segment-data-type-correctly/20241018-172401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241018092200.2792472-1-chao%40kernel.org
patch subject: [PATCH] f2fs: fix to convert log type to segment data type correctly
config: i386-buildonly-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200521.Mc4H4BHm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/f2fs/segment.c:3818:38: warning: declaration of 'enum log_type' will not be visible outside of this function [-Wvisibility]
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
>> fs/f2fs/segment.c:3818:47: error: variable has incomplete type 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                               ^
   fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
   fs/f2fs/segment.c:3843:16: error: variable has incomplete type 'enum log_type'
    3843 |         enum log_type type = __get_segment_type(fio);
         |                       ^
   fs/f2fs/segment.c:3843:7: note: forward declaration of 'enum log_type'
    3843 |         enum log_type type = __get_segment_type(fio);
         |              ^
>> fs/f2fs/segment.c:4828:44: error: argument type 'enum log_type' is incomplete
    4828 |                 array[i].seg_type = log_type_to_seg_type(i);
         |                                                          ^
   fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
   1 warning and 3 errors generated.


vim +3818 fs/f2fs/segment.c

  3817	
> 3818	static int log_type_to_seg_type(enum log_type type)
  3819	{
  3820		int seg_type = CURSEG_COLD_DATA;
  3821	
  3822		switch (type) {
  3823		case CURSEG_HOT_DATA:
  3824		case CURSEG_WARM_DATA:
  3825		case CURSEG_COLD_DATA:
  3826		case CURSEG_HOT_NODE:
  3827		case CURSEG_WARM_NODE:
  3828		case CURSEG_COLD_NODE:
  3829			seg_type = (int)type;
  3830			break;
  3831		case CURSEG_COLD_DATA_PINNED:
  3832		case CURSEG_ALL_DATA_ATGC:
  3833			seg_type = CURSEG_COLD_DATA;
  3834			break;
  3835		default:
  3836			break;
  3837		}
  3838		return seg_type;
  3839	}
  3840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A136F53E0B;
	Thu, 15 Jan 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501265; cv=none; b=kOVh8P2tiwMPOdLiHVX7soM+jL9xfT1S/l6SqYQAlYz8bG2xIWEwYMSwteFlYoKuwLil46I3xhWBZQD2sbycFYd0QLZn+2L9eTyuEdb2j+hXmrfz9OaXVohdnDUpzhIPZBTKmB84qMXgxCoO73h0lka3UKUCej6+6b4Y8m8taSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501265; c=relaxed/simple;
	bh=osFDWhRc3tyI93V8GHVLOPYYoWpNTTMULb6Rgi9Ciho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHdP/WeCt32XnRZRC8RRSt/h4mjQFhZ6wFZQpT2g8LuOLVQtnKmMXRsQeCy0N8cH0+qjkAJ2t0AIqpB7n9gT/CUZvokjGziRlMjW5ZwWc/9eJfaXfUeJSm1Br4qfeU/xjOMyHCIaFVXxQGRS91gDnkDgsVz9fH9ynxks8EWhOCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1XPEVOB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1XPEVOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768501263; x=1800037263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=osFDWhRc3tyI93V8GHVLOPYYoWpNTTMULb6Rgi9Ciho=;
  b=k1XPEVOB0KqkrNWS5jg5xpciyop4rRX+wQLfOvNxlFVwtaAphoj+Ya6/
   X53mY/eFb76EioxUJJcUqXPlEZhtbbfiK8yWdZlQhi1PbkmnLa2QHdWQ4
   XKOIYwOKyfyaxqec2bUUYu5dN/TUdoq/4HBCLnBi1OZ195Db2dA/Nya78
   Efcu+njQm3I+teu0A+GoQeMshXAkcB2dHuxwwkHrtgEhkIkSpy3hn9B5J
   G0z4vqRbUkZLgsRiBFwvpBQMo0kF0SoJvnJK80wt1yOiqeVbFZKUBodRT
   I3JTBmKBDnLbU1xbgmwJ/Z3oLPv0fZet7LmUhCAmGt5E+tKV3MCilsHW9
   A==;
X-CSE-ConnectionGUID: s9LfjpXYTp+ML3I6sJvd9g==
X-CSE-MsgGUID: q/DukH6TRXKOW0AgCATSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87392786"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="87392786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 10:21:02 -0800
X-CSE-ConnectionGUID: HASe/dwGSl2H6EubFfXg7A==
X-CSE-MsgGUID: QaeVTii0SEqzGZnvFJod8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209502393"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 10:21:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgRxr-00000000JfS-1pom;
	Thu, 15 Jan 2026 18:20:59 +0000
Date: Fri, 16 Jan 2026 02:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Diangang Li <diangangli@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] block: export windowed IO P99 latency
Message-ID: <202601160133.EiiYdMZh-lkp@intel.com>
References: <20260109083126.15052-2-lidiangang@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109083126.15052-2-lidiangang@bytedance.com>

Hi Diangang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Diangang-Li/block-export-windowed-IO-P99-latency/20260109-163449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260109083126.15052-2-lidiangang%40bytedance.com
patch subject: [RFC 1/1] block: export windowed IO P99 latency
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160133.EiiYdMZh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160133.EiiYdMZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160133.EiiYdMZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:1099:9: warning: stack frame size (2232) exceeds limit (2048) in 'part_stat_show' [-Wframe-larger-than]
    1099 | ssize_t part_stat_show(struct device *dev,
         |         ^
   1 warning generated.


vim +/part_stat_show +1099 block/genhd.c

3ad5cee5cd000d Christoph Hellwig     2020-03-24  1098  
3ad5cee5cd000d Christoph Hellwig     2020-03-24 @1099  ssize_t part_stat_show(struct device *dev,
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1100  		       struct device_attribute *attr, char *buf)
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1101  {
0d02129e76edf9 Christoph Hellwig     2020-11-27  1102  	struct block_device *bdev = dev_to_bdev(dev);
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1103  	struct disk_stats stat;
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1104  	unsigned int inflight;
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1105  
f2987c5816bda0 Yu Kuai               2025-05-06  1106  	inflight = bdev_count_inflight(bdev);
86d7331299fda7 Zhang Wensheng        2022-02-17  1107  	if (inflight) {
86d7331299fda7 Zhang Wensheng        2022-02-17  1108  		part_stat_lock();
86d7331299fda7 Zhang Wensheng        2022-02-17  1109  		update_io_ticks(bdev, jiffies, true);
86d7331299fda7 Zhang Wensheng        2022-02-17  1110  		part_stat_unlock();
86d7331299fda7 Zhang Wensheng        2022-02-17  1111  	}
86d7331299fda7 Zhang Wensheng        2022-02-17  1112  	part_stat_read_all(bdev, &stat);
8e71afb94d6ed5 zhangguopeng          2024-11-07  1113  	return sysfs_emit(buf,
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1114  		"%8lu %8lu %8llu %8u "
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1115  		"%8lu %8lu %8llu %8u "
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1116  		"%8u %8u %8u "
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1117  		"%8lu %8lu %8llu %8u "
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1118  		"%8lu %8u "
f8b4ca85f47647 Diangang Li           2026-01-09  1119  		"%8u %8u %8u %8u"
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1120  		"\n",
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1121  		stat.ios[STAT_READ],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1122  		stat.merges[STAT_READ],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1123  		(unsigned long long)stat.sectors[STAT_READ],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1124  		(unsigned int)div_u64(stat.nsecs[STAT_READ], NSEC_PER_MSEC),
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1125  		stat.ios[STAT_WRITE],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1126  		stat.merges[STAT_WRITE],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1127  		(unsigned long long)stat.sectors[STAT_WRITE],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1128  		(unsigned int)div_u64(stat.nsecs[STAT_WRITE], NSEC_PER_MSEC),
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1129  		inflight,
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1130  		jiffies_to_msecs(stat.io_ticks),
8cd5b8fc00716f Konstantin Khlebnikov 2020-03-25  1131  		(unsigned int)div_u64(stat.nsecs[STAT_READ] +
8cd5b8fc00716f Konstantin Khlebnikov 2020-03-25  1132  				      stat.nsecs[STAT_WRITE] +
8cd5b8fc00716f Konstantin Khlebnikov 2020-03-25  1133  				      stat.nsecs[STAT_DISCARD] +
8cd5b8fc00716f Konstantin Khlebnikov 2020-03-25  1134  				      stat.nsecs[STAT_FLUSH],
8cd5b8fc00716f Konstantin Khlebnikov 2020-03-25  1135  						NSEC_PER_MSEC),
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1136  		stat.ios[STAT_DISCARD],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1137  		stat.merges[STAT_DISCARD],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1138  		(unsigned long long)stat.sectors[STAT_DISCARD],
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1139  		(unsigned int)div_u64(stat.nsecs[STAT_DISCARD], NSEC_PER_MSEC),
ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  1140  		stat.ios[STAT_FLUSH],
f8b4ca85f47647 Diangang Li           2026-01-09  1141  		(unsigned int)div_u64(stat.nsecs[STAT_FLUSH], NSEC_PER_MSEC),
f8b4ca85f47647 Diangang Li           2026-01-09  1142  		diskstat_p99_us(stat.latency[STAT_READ][0]),
f8b4ca85f47647 Diangang Li           2026-01-09  1143  		diskstat_p99_us(stat.latency[STAT_WRITE][0]),
f8b4ca85f47647 Diangang Li           2026-01-09  1144  		diskstat_p99_us(stat.latency[STAT_DISCARD][0]),
f8b4ca85f47647 Diangang Li           2026-01-09  1145  		diskstat_p99_us(stat.latency[STAT_FLUSH][0]));
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1146  }
3ad5cee5cd000d Christoph Hellwig     2020-03-24  1147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

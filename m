Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC071DA10E;
	Sun, 17 Nov 2024 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731867909; cv=none; b=LuIlsHsjpO+pswrMAxYrwaQBpcTmoxK0+T07IqDMBVgaCn1f+jIVAUHvzywkogzLSvq8OgIoq2uYIiwD6z/rIOTvxioTdTh04u4SIQgKrs4TNDXdjaXT14dnQM8pZJyn8OzjG6OrB5fcMOT5pdjdygM6UN2CKReLGGz9ZCmy94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731867909; c=relaxed/simple;
	bh=uZQwO2slaP+IjCDs9Pevrdnlep4XjEDGj+oyBLTIQ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FltjTB3mkdnUyl9oKXj8SUGJ1QeOJfqh5kZHc3BcaDDWJr+HJAMm9HyULhw2k0hwNdIlp5i2OTunZsyj3l21VTH39wnEnGs5nPUVtcOwT5sRhLy0G0WVfIQ8xL7nsHveD2Tbu2E5lLU8YqF9MQqizz9KT2rPZeVkoa4tsjfMIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcNFCr7u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcNFCr7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731867907; x=1763403907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZQwO2slaP+IjCDs9Pevrdnlep4XjEDGj+oyBLTIQ9A=;
  b=RcNFCr7ueHTk2fzD9HCYCG+KhGGp+QQTBf9u0v+KfrFAMZ8jNhLSvyka
   XZVfa9tmd+2LSUlMbhkFpzinfx2TNGXbCFMuJRK97II3noFg1oqvxVUR+
   SFrtQXoxQo3Q5YRAoeP8DBFcyg2la/gfQUTcVrsVS1SFAPczDN0vmfvzF
   4cW99EwstjRYAQ+ZaC1ek4f5w/zzTRLCMAi3vGdF9rbWssf7Xbkm8Zy4Z
   gtHlUrMDluzTURJA8h0/sEKjeeQoHEX3uSedWh3bD4ZalPg5vsC9IavMg
   x4uGjxzmt1yAbHrL5bx5TEE7me0lIthYcaP6Epnsrdfdgwq0MnhKcKUC8
   A==;
X-CSE-ConnectionGUID: lYnGsCFOQBe3LG0ROIWUtw==
X-CSE-MsgGUID: eM4QsL0wSBKYHK3FOux+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49348088"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49348088"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 10:25:06 -0800
X-CSE-ConnectionGUID: WbCIuUmJQ6KW8qQl4bSoVA==
X-CSE-MsgGUID: LrfD+NZ7SHyk5VOSqaZKXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89030026"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2024 10:25:05 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjxG-0001zb-2T;
	Sun, 17 Nov 2024 18:25:02 +0000
Date: Mon, 18 Nov 2024 02:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 54/54] mm/damon/core.c:2027:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202411180218.mUqglaqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   26e20409cfae740fa1111007c575241ef2b3baeb
commit: 26e20409cfae740fa1111007c575241ef2b3baeb [54/54] mm/damon/core: simplify damon_call() callback path
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241118/202411180218.mUqglaqC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180218.mUqglaqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180218.mUqglaqC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:10:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2211:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/damon/core.c:2027:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2027 |         if (cancel) {
         |             ^~~~~~
   mm/damon/core.c:2036:9: note: uninitialized use occurs here
    2036 |         return ret;
         |                ^~~
   mm/damon/core.c:2027:2: note: remove the 'if' if its condition is always false
    2027 |         if (cancel) {
         |         ^~~~~~~~~~~~~
    2028 |                 req->canceled = true;
         |                 ~~~~~~~~~~~~~~~~~~~~~
    2029 |         } else {
         |         ~~~~~~
   mm/damon/core.c:2019:9: note: initialize the variable 'ret' to silence this warning
    2019 |         int ret;
         |                ^
         |                 = 0
   5 warnings generated.


vim +2027 mm/damon/core.c

  2015	
  2016	static int kdamond_callback(struct damon_ctx *ctx, bool cancel)
  2017	{
  2018		struct damon_call_req *req;
  2019		int ret;
  2020	
  2021		mutex_lock(&ctx->call_request_lock);
  2022		req = ctx->call_request;
  2023		if (!req) {
  2024			mutex_unlock(&ctx->call_request_lock);
  2025			return 0;
  2026		}
> 2027		if (cancel) {
  2028			req->canceled = true;
  2029		} else {
  2030			ret = req->fn(req->arg);
  2031			req->return_code = ret;
  2032		}
  2033		complete(&req->completion);
  2034		ctx->call_request = NULL;
  2035		mutex_unlock(&ctx->call_request_lock);
  2036		return ret;
  2037	}
  2038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

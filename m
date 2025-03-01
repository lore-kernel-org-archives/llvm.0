Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEFF14AD29;
	Sat,  1 Mar 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740867687; cv=none; b=Cwrc3ZtIZTZHUlv2SNc6i2UTrBvNxIwPthAbRZUs4EquRPd/Q+mbV/PgCCvT2S+lArosIXlODXZ9wQI+GXR+qvXWj9PFHDR9obRMfK3kFU9nP2tklk+FKtVVbzjcnw3rvvcQ+dbueEJfcszrSe7/2AMG9QufVwStr1mbx6+ELuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740867687; c=relaxed/simple;
	bh=zwuJEgxet1s5WBYaVBuYVn7E+CkA57nDuVO+XjOW6Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF8xg2otUk/f+HKzdvTtuNk/qtJXdVgQ/JyEgeoIIC9Ud48gpHaz1uBtRZ8/J9wvbZsm7n6/YxNCxrDAGKJnZwq7w6sh0Dk35UDQSjrtwowQfTmTuaDGjfow9W2VWda7uYVZvx431cZf41ATwKiZl3xhhz+oTvyYbed1vXgyz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjZV4z6t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjZV4z6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740867685; x=1772403685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zwuJEgxet1s5WBYaVBuYVn7E+CkA57nDuVO+XjOW6Dw=;
  b=EjZV4z6tDSL9yLI0CmLa6EKMhOQsbPjNqJDkjAvsLtOUPMRXz1AIaTD8
   PQccVU4Itemv1bJ92W1coREJM9gCkFQju9fe3f3ItXGo3lDa9FMP7yDv0
   ffuHpP1xJcghrQ0YKvYyCs8hwFP9biuQ6kPxmNUjNovc23wnMUqtpPFK5
   vPhIdlmWaxAZYKIac0L/wNiSa75GXP2igMlO5tkz/zbeeKYX/+aP74bch
   sUEnArAVV6/cpZSecHgctoJDmodEjWwV3vliv3kD4Tv5Q+dHH0h3UdkaX
   t8ZKVAjpQ2C1vXKWrqM0NeXYtC7vA+zmL9tD7v+yRRUZ3WrLytTc7fv0w
   w==;
X-CSE-ConnectionGUID: uC6mp4X9R62sgPBpfnI1jA==
X-CSE-MsgGUID: vqfabasOSu6hiiaiHNmVNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="44590850"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="44590850"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 14:21:24 -0800
X-CSE-ConnectionGUID: 8F1FReX+QTqFQHEI1Fc5BQ==
X-CSE-MsgGUID: vEFHHuLyRd+ogK32Nh6yLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117837337"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Mar 2025 14:21:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toVCz-000GmC-0D;
	Sat, 01 Mar 2025 22:21:21 +0000
Date: Sun, 2 Mar 2025 06:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] rbd: convert timeouts to secs_to_jiffies()
Message-ID: <202503020652.YwLR3G2j-lkp@intel.com>
References: <20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed@linux.microsoft.com>

Hi Easwar,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0226d0ce98a477937ed295fb7df4cc30b46fc304]

url:    https://github.com/intel-lab-lkp/linux/commits/Easwar-Hariharan/rbd-convert-timeouts-to-secs_to_jiffies/20250301-122529
base:   0226d0ce98a477937ed295fb7df4cc30b46fc304
patch link:    https://lore.kernel.org/r/20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed%40linux.microsoft.com
patch subject: [PATCH v4 1/2] rbd: convert timeouts to secs_to_jiffies()
config: x86_64-buildonly-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020652.YwLR3G2j-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020652.YwLR3G2j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020652.YwLR3G2j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/rbd.c:31:
   In file included from include/linux/ceph/libceph.h:8:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/block/rbd.c:6092:17: warning: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    6092 |         if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
         |             ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6093 |                                  / sizeof (u64)) {
         |                                  ~~~~~~~~~~~~~~
>> drivers/block/rbd.c:6286:14: error: no member named 'uint32' in 'struct fs_parse_result'; did you mean 'uint_32'?
    6286 |                 if (result.uint32 > INT_MAX / HZ)
         |                            ^~~~~~
         |                            uint_32
   include/linux/fs_parser.h:59:16: note: 'uint_32' declared here
      59 |                 unsigned int    uint_32;        /* For spec_u32{,_octal,_hex}/spec_enum */
         |                                 ^
   2 warnings and 1 error generated.


vim +6286 drivers/block/rbd.c

  6249	
  6250	static int rbd_parse_param(struct fs_parameter *param,
  6251				    struct rbd_parse_opts_ctx *pctx)
  6252	{
  6253		struct rbd_options *opt = pctx->opts;
  6254		struct fs_parse_result result;
  6255		struct p_log log = {.prefix = "rbd"};
  6256		int token, ret;
  6257	
  6258		ret = ceph_parse_param(param, pctx->copts, NULL);
  6259		if (ret != -ENOPARAM)
  6260			return ret;
  6261	
  6262		token = __fs_parse(&log, rbd_parameters, param, &result);
  6263		dout("%s fs_parse '%s' token %d\n", __func__, param->key, token);
  6264		if (token < 0) {
  6265			if (token == -ENOPARAM)
  6266				return inval_plog(&log, "Unknown parameter '%s'",
  6267						  param->key);
  6268			return token;
  6269		}
  6270	
  6271		switch (token) {
  6272		case Opt_queue_depth:
  6273			if (result.uint_32 < 1)
  6274				goto out_of_range;
  6275			opt->queue_depth = result.uint_32;
  6276			break;
  6277		case Opt_alloc_size:
  6278			if (result.uint_32 < SECTOR_SIZE)
  6279				goto out_of_range;
  6280			if (!is_power_of_2(result.uint_32))
  6281				return inval_plog(&log, "alloc_size must be a power of 2");
  6282			opt->alloc_size = result.uint_32;
  6283			break;
  6284		case Opt_lock_timeout:
  6285			/* 0 is "wait forever" (i.e. infinite timeout) */
> 6286			if (result.uint32 > INT_MAX / HZ)
  6287				goto out_of_range;
  6288			opt->lock_timeout = secs_to_jiffies(result.uint_32);
  6289			break;
  6290		case Opt_pool_ns:
  6291			kfree(pctx->spec->pool_ns);
  6292			pctx->spec->pool_ns = param->string;
  6293			param->string = NULL;
  6294			break;
  6295		case Opt_compression_hint:
  6296			switch (result.uint_32) {
  6297			case Opt_compression_hint_none:
  6298				opt->alloc_hint_flags &=
  6299				    ~(CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE |
  6300				      CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE);
  6301				break;
  6302			case Opt_compression_hint_compressible:
  6303				opt->alloc_hint_flags |=
  6304				    CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE;
  6305				opt->alloc_hint_flags &=
  6306				    ~CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE;
  6307				break;
  6308			case Opt_compression_hint_incompressible:
  6309				opt->alloc_hint_flags |=
  6310				    CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE;
  6311				opt->alloc_hint_flags &=
  6312				    ~CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE;
  6313				break;
  6314			default:
  6315				BUG();
  6316			}
  6317			break;
  6318		case Opt_read_only:
  6319			opt->read_only = true;
  6320			break;
  6321		case Opt_read_write:
  6322			opt->read_only = false;
  6323			break;
  6324		case Opt_lock_on_read:
  6325			opt->lock_on_read = true;
  6326			break;
  6327		case Opt_exclusive:
  6328			opt->exclusive = true;
  6329			break;
  6330		case Opt_notrim:
  6331			opt->trim = false;
  6332			break;
  6333		default:
  6334			BUG();
  6335		}
  6336	
  6337		return 0;
  6338	
  6339	out_of_range:
  6340		return inval_plog(&log, "%s out of range", param->key);
  6341	}
  6342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

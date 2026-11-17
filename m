Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903283;
	b=R6fgBRBNh1LjmZBuia38GCSeKmR3fC7tvLq8ItpyYu993RoQoobQSm8tlkPL/Cj7JtUZ
	 BPpr/Cc3hV+VGQ051lT7cO6FSpwt004JNijVm0D5qzjNA96Zqr4LtCjRjyCeTGnt74N9L
	 BG5d8mS10RDtbEba6yFGgrqus1V7nM/EamAl8UlRWzH42KYDLm0c+ILE8JhN7l4ys4UNN
	 mjUKa9A627IhVZcVMBp/oFGLDAzAg2LudGi73uPPEGr8HBS+WnhHwbs0jrdooho7ZXr8W
	 23JDRATGI6WFSupCnPWIAWGpaAZQD+pynZlTg/cfiaH2xPZ3b3YIxuajfqqlRh1HCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u+/cwffwIYhunynydI3MCyk18sMtDgmDhaVBujjZGGU=;
	b=CNocdTCSMsis7U54HHv/f4JD6FxzaV+inR1kaGDt4VQ8TsN30k+zq4Ts+J+1RRDo6TCD
	 ZDx3hbIsEx/ruzn/Bom6RgumjOlb3F6RyBefQWHadSBdNxSvsKmMBukgT3OD8bb7d7Bsg
	 cPC1vBOB1tB8JMAWM4BQvve8YEBD/6fPngw0VSnNKEwNRrMLQtGuciY/FAcGBGcWJfwoA
	 qPxA6Grhow4HfdrZAfg8V0WnyOGUnfr9ZAx1srQ/+2R0dwF3lGRoPbhp+l9snSaUpZZSX
	 pTKYIF3FDf1KfGgFsAntg4Cq9tIR1yQigw8nzpbqgRRaPeE5nyGknjcHoovC8qL2TYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LIRuIEzW;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9C606A31C;
	Tue, 17 Nov 2026 08:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LIRuIEzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794903283; x=1826439283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNmUx0jrvNZHfbPCL0lRJuOzMXqXrDP37LApWQ+VGqo=;
  b=LIRuIEzWXHT6W14Zot/PA8K0urVntHnTCSIENZrMHH+VqyEn8KsDESb/
   zbcDxHcgnbObk4n+qvWLQUBkl/DNqoHtNjDuqjBoeIn045N7AM5Udh9x8
   Pk6v2p9ZhSM9MdgMSozAEDz6QVOVlh7Zz5l2KNrAhUEA+Dwksg81Mf68D
   DX13y1ewHcTftVPg+iDNIH90UL+D5KrWG6URIMg6Vb1VDFfhmSDiN5BgI
   /hUvuKQ/2Mth4KfSekmQHtl2aaSXe/kng6O4l1Zq/6bTbhDiifZ2/ShhG
   9psKKLw6iJC0rNds+QXVEDOaB9imhUWnVJ+5GONgSV8v74I6EOb82H0AA
   Q==;
X-CSE-ConnectionGUID: B1ElCop7Qf2MVEOB982J/A==
X-CSE-MsgGUID: 9IbkxsWAS7iukgTwT/EJng==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3517173"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3517173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 00:14:42 -0800
X-CSE-ConnectionGUID: HIAC5vPkQFS4EZd2BqhXXQ==
X-CSE-MsgGUID: t3tuitAFQPSxn+gSWM/hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9947828"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2026 00:14:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTEKq-00000001APf-071k;
	Tue, 17 Nov 2026 08:14:36 +0000
Date: Tue, 17 Nov 2026 16:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 12/19] drm/amd/display: Migrate amdgpu_dm KUnit tests off
 struct dc internals
Message-ID: <202611171624.vqpwzkOB-lkp@intel.com>
References: <20261112-amdgpu-dc-cleanup-v1-12-0fae41718ad2@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-amdgpu-dc-cleanup-v1-12-0fae41718ad2@redhat.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a6836fcbb5b22968019256025321d655b78bc49c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie-via-B4-Relay/drm-amd-display-Drop-the-dead-vmid-module/20261112-114336
base:   a6836fcbb5b22968019256025321d655b78bc49c
patch link:    https://lore.kernel.org/r/20261112-amdgpu-dc-cleanup-v1-12-0fae41718ad2%40redhat.com
patch subject: [PATCH 12/19] drm/amd/display: Migrate amdgpu_dm KUnit tests off struct dc internals
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611171624.vqpwzkOB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611171624.vqpwzkOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611171624.vqpwzkOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c:57:25: warning: cast from 'void (*)(struct dc *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      57 |         kunit_add_action(test, (kunit_action_t *)dc_test_destroy, dc);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +57 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c

    50	
    51	struct dc *dm_kunit_alloc_dc(struct kunit *test)
    52	{
    53		struct dc *dc;
    54	
    55		dc = dc_test_create();
    56		KUNIT_ASSERT_NOT_NULL(test, dc);
  > 57		kunit_add_action(test, (kunit_action_t *)dc_test_destroy, dc);
    58	
    59		return dc;
    60	}
    61	EXPORT_SYMBOL(dm_kunit_alloc_dc);
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

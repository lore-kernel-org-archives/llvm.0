Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563F2BCF4C;
	Fri, 20 Feb 2026 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771630180; cv=none; b=IeMoA6Yjj2gHzrtgQsL8Z+9N6+/8tJTwPD9bIkfiocqGGxqAi7F5j4Bq14IrYQ2lZ7DM2JPBSZmhOrEbL4Iy9ZG8YyuzgQqEHQsrD99PhvZVbMyFO+VrZjZac1i7tsJ0T9J8aFyrfpcVvpkLW2cQTn+DmUaCdix1sVrU3b77ybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771630180; c=relaxed/simple;
	bh=tpBKM+tCf7xV4rDwBhU4u6cahb59u3cyRH8ijiH0LXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm60ggf1C1bmKGZk+5RwpNy7cRnUvA82pNYIa+GTyq3XTEKrYYOY3ZMfnFuAYPcF9A48fbzd4+h+Blc7bqt6gHbDMPUeXuZRi3oBSiTewxLasZzWkOnqAbQPLd2q0S2Hfhu/egW2uPHQ0y3FG5YlBWIYZ+PPxmt5zyyHgOcVLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOi0+Q4D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOi0+Q4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771630178; x=1803166178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tpBKM+tCf7xV4rDwBhU4u6cahb59u3cyRH8ijiH0LXY=;
  b=mOi0+Q4Dbvv5ujnIcAtH5AXaQp0ZWL757twyivybVQ5PQ3ALP5XDUE7G
   eDGdJmh7gK4N3ihM36sMRK8nbY2wp+3Fq0ZWVEe6kF7phTjAfNU89xNDV
   MhxmY42DbuHuZml7xV83rCEUknJZZYQso/v3ZsTKoXuH+DENf3kAyc29P
   g95qK2G+LyR+mTAi4imz57ZhAcPJuWXkXf91F3DCIK7JVzE2m4LEQsoHu
   2EhGR1VXKxTDM5HVzuVO8TE0pSDY2JUPSQhKZNgdQ58I+cF2mYHTbc6Z2
   raZuafZ1XrGJQm48qrZ4n1Op1FLB1/KToQBm5wzvys7uL5qYoOKzfOs/l
   g==;
X-CSE-ConnectionGUID: wOPwUk/iTzKVVpJzYKUblw==
X-CSE-MsgGUID: Ilj27lSKRO2S8x5kWM1e8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90134804"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90134804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 15:29:38 -0800
X-CSE-ConnectionGUID: W+Jw/QPqQwqkOubvZQjzpg==
X-CSE-MsgGUID: iJbWitI3Sju9BqK+DREdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214993279"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2026 15:29:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtZwB-000000014YA-2NI6;
	Fri, 20 Feb 2026 23:29:31 +0000
Date: Sat, 21 Feb 2026 07:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Sun Jian <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space
 annotations
Message-ID: <202602210735.v0eU5uou-lkp@intel.com>
References: <20260220193353.21870-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220193353.21870-1-sun.jian.kdev@gmail.com>

Hi Sun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 770aaedb461a055f79b971d538678942b6607894]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-Jian/sched-rcu-fix-rq-curr-donor-address-space-annotations/20260221-033739
base:   770aaedb461a055f79b971d538678942b6607894
patch link:    https://lore.kernel.org/r/20260220193353.21870-1-sun.jian.kdev%40gmail.com
patch subject: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space annotations
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260221/202602210735.v0eU5uou-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210735.v0eU5uou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210735.v0eU5uou-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: kernel/sched/core.o: in function `wake_up_if_idle':
   core.c:(.text+0x5190): undefined reference to `lockdep_is_held'
>> aarch64-linux-ld: core.c:(.text+0x51d4): undefined reference to `lockdep_is_held'
   aarch64-linux-ld: kernel/sched/core.o: in function `__schedule':
   core.c:(.sched.text+0xd0): undefined reference to `lockdep_is_held'
>> aarch64-linux-ld: core.c:(.sched.text+0x1a4): undefined reference to `lockdep_is_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

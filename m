Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5110A3E;
	Tue, 28 May 2024 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927038; cv=none; b=Do1bsbweOpgmjD3M8HfJp4veL5F56oCOO58sxhg/zDN3GiKz6ErgcMqkBUl/neROLG4pIyT0HS2uMVoeRDFSvRwEEqfmERzlEkcnHF2ypPjnSHOc8d3lCD5J9JJ7e0SsgST2hGIzGehQ0Qi3Wlyi6F29kO4mat0vY+KtydSQPkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927038; c=relaxed/simple;
	bh=wcGkh7aaZpA1PpmJUQSL6WGUvY81nBPmII61R5pfMVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCX6gBi5cnM4lA8EVlPW4XiPi+RhMEzPjY6lSBnqg7umzO88LeUJphROFPupb2bTpTOXvX+ab0agSnAjrPE35/hgiEujuBN+cEpqh3mrlwJo8eZsIN+izJfQ59xXUalnXa+03rijfSSkEhu3XcXKCvL8jK3qgDNdmf9bw8P5y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IR3bI3Ch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IR3bI3Ch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B0BC3277B;
	Tue, 28 May 2024 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716927037;
	bh=wcGkh7aaZpA1PpmJUQSL6WGUvY81nBPmII61R5pfMVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IR3bI3ChcIZ7nAeSIVKvI+2v2WRLsiEYzACZlaCw52p0zcay5cxQkUcgN2i0EMclX
	 /qkR3NN+JuF4Tlmmpo+coCDlxayPwQTmfXeqod4Da8FPnvrWlbNUmBx3IA8McVzSZv
	 nsgdGQ0Q4Mt0FkPWLc8xYeVyV0KpUJr1xfv7t7oyHWQ0mlJgShuodFRgIz8QpP62PM
	 O6tqUmdjd+GKKOlJtcIC091IPoe/EXYEtRIbdsFPswREGxRUUaU2lEDWhnG/ZUk9y4
	 lMRXGw+ulpOM29E2XzbMvPkgU/ucu/OQyeAv5BJj//p3Bj0Z7OReGazSkxRgzAE5CX
	 ro1/jt3CWj/cg==
Date: Tue, 28 May 2024 13:10:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jeff Layton <jlayton@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jlayton:mgtime 4/5] fs/inode.c:73:15: error: '__section__'
 attribute only applies to functions, global variables, Objective-C methods,
 and Objective-C properties
Message-ID: <20240528201035.GA2680415@thelio-3990X>
References: <202405281321.aRVc7usN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405281321.aRVc7usN-lkp@intel.com>

On Tue, May 28, 2024 at 01:22:40PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
> head:   05aa6b03b8c3451d4aac5fb47e9e99c6e00ee304
> commit: 05ca0fa7e195e028694f41de279dec33ada93d21 [4/5] fs: add infrastructure for multigrain timestamps
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240528/202405281321.aRVc7usN-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281321.aRVc7usN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405281321.aRVc7usN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> fs/inode.c:73:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
>       73 | static struct __cacheline_aligned_in_smp ctime_floor_val ctime_floor;
>          |               ^

The message is slightly obtuse but this attribute shouldn't be splitting
the type, otherwise it is parsed as a type attribute.

  static struct ctime_floor_val ctime_floor __cacheline_aligned_in_smp;

or

  static __cacheline_aligned_in_smp struct ctime_floor_val ctime_floor;

should work.

>    include/linux/cache.h:60:36: note: expanded from macro '__cacheline_aligned_in_smp'
>       60 | #define __cacheline_aligned_in_smp __cacheline_aligned
>          |                                    ^
>    include/linux/cache.h:55:4: note: expanded from macro '__cacheline_aligned'
>       55 |                  __section__(".data..cacheline_aligned")))
>          |                  ^
>    fs/inode.c:73:15: warning: attribute declaration must precede definition [-Wignored-attributes]
>    include/linux/cache.h:60:36: note: expanded from macro '__cacheline_aligned_in_smp'
>       60 | #define __cacheline_aligned_in_smp __cacheline_aligned
>          |                                    ^
>    include/linux/cache.h:54:18: note: expanded from macro '__cacheline_aligned'
>       54 |   __attribute__((__aligned__(SMP_CACHE_BYTES),                  \
>          |                  ^
>    fs/inode.c:64:8: note: previous definition is here
>       64 | struct ctime_floor_val {
>          |        ^
>    1 warning and 1 error generated.
> 
> 
> vim +/__section__ +73 fs/inode.c
> 
>     62	
>     63	/* Floor value for all ctime stamps */
>     64	struct ctime_floor_val {
>     65		union {
>     66			struct {
>     67				ktime_t	coarse;
>     68				ktime_t	floor;
>     69			};
>     70			u128	full;
>     71		};
>     72	};
>   > 73	static struct __cacheline_aligned_in_smp ctime_floor_val ctime_floor;
>     74	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

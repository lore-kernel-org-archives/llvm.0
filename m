Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD830C157;
	Fri, 10 Jul 2026 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723066; cv=none; b=FREhJeId9L+U5JNz3tW0t3UHhhtSOPbFdB/xuqn26OQu8nGfr+Uy8U6fhR6DInfNJveo82knyZKV4cLY/KXuHzwyevqsqr2QYu0ndtIaxnIsGUM39aH1ypScR0yd+vTtnJuFeghrcPPqnG2gZy4aSOLHJhbBj7y1kOWRmYCn23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723066; c=relaxed/simple;
	bh=KS6hI+mDf1SsatlLUsAm1p1t6WWvAS0GWb80PZS9N9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G78DbRqJlXGqCETfWblpZWB0u/hGZzgABBYuwVqggCn1zUa+dga/cGq61IfhlAFFMZoszkZ/eYnmR4ngnngfNbhNOsQugOZM7jtClVusIv49zUt41PCDgrCBp2WJkVlsg8Ljvh1RMknbrKXBKCIjYtTeaZ2/PdZfH5dl/Np76IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTXOJZXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTXOJZXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416F61F000E9;
	Fri, 10 Jul 2026 22:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783723064;
	bh=TsLZqe25Bg2E8d7AhewrbCTsf0pH4EyObAN5qi7E++w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTXOJZXUnLGGVUjnQYmIkMR9gThXna/fpTvYP72WoDQTrVsjo1jali1uZ2SJu5Y66
	 PwVLjQBpcSYXNzn0sRlynxfCnIhOmjD9KuzUFZZWdvLqcY4n2pC0qCurV8g+bFo/B6
	 xmGjG2iDagp47PUNDkeN8fwZmUu0Xgd4x1rLk5xxrlDgWrMDDC/qHnIp+e5JPX3Ox9
	 kjxyX/ohopezNHnc3AMM+mRW9Hiqns3RjzjAA422103rwTjvAI1NaUn4E6hg+eeVN4
	 Xa4iHqpoWCyTIyI6RH1cT6XbQ8MxIxkUU1AMfH+0CwkDJoG8JjpxL0R5yyePlDm7V/
	 6b9I2Xyv1IpmQ==
Date: Fri, 10 Jul 2026 18:37:40 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [powerpc:fixes-test 10/12] kernel/sched/core.c:7449:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <20260710223740.GA2667378@ax162>
References: <202607110422.frjmJOf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607110422.frjmJOf8-lkp@intel.com>

On Sat, Jul 11, 2026 at 04:54:17AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
> head:   afc2830892a128a13a65f677271a0a48aeb61b5e
> commit: 4747e17fe063720a30b1c0075bae3e8f8acd26f4 [10/12] powerpc/32: Use HAVE_PREEMPT_DYNAMIC_CALL instead of HAVE_PREEMPT_DYNAMIC_KEY
> config: powerpc-randconfig-002-20260711 (https://download.01.org/0day-ci/archive/20260711/202607110422.frjmJOf8-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110422.frjmJOf8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607110422.frjmJOf8-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/sched/core.c:7449:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
>     7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
>          | ^
>    include/linux/static_call.h:223:2: note: expanded from macro 'EXPORT_STATIC_CALL_TRAMP'
>      223 |         ARCH_ADD_TRAMP_KEY(name)
>          |         ^
> >> kernel/sched/core.c:7449:26: error: a parameter list without types is only allowed in a function definition
>     7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
>          |                          ^

This happens with GCC as well.

  In file included from include/linux/tracepoint.h:22,
                   from include/trace/syscall.h:5,
                   from include/linux/syscalls.h:95,
                   from include/linux/syscalls_api.h:1,
                   from kernel/sched/core.c:16:
  include/linux/static_call.h:223:9: warning: data definition has no type or storage class
    223 |         ARCH_ADD_TRAMP_KEY(name)
        |         ^~~~~~~~~~~~~~~~~~
  kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
   7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
        | ^~~~~~~~~~~~~~~~~~~~~~~~
  include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Wimplicit-int]
  kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
   7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
        | ^~~~~~~~~~~~~~~~~~~~~~~~
  kernel/sched/core.c:7449:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
        | ^~~~~~~~~~~~~~~~~~~~~~~~

-- 
Cheers,
Nathan

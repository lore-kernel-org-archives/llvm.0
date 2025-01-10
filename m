Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2D205AA2;
	Fri, 10 Jan 2025 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532162; cv=none; b=AiDyGb4yZtOpFHBoLe+TG6lwNnpDzr7RFo3X71YlaNs56HZKgtQld9x+2MsVJdPdVJr9v4dkoI4+iQuybf3qolNkeRH3nHblj2KCG5RQitdLujzDMdW8khfN++JRyDmW7ynahsQ73Yjcj45Nhd0ehBK29WsKD8+U7Kp3HNYCzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532162; c=relaxed/simple;
	bh=wWTI+J+GqDlibzTHylOSVS60+DoqiT0ax232mSj9/3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtZWraQFf3SEyGK82W3pPjDz3SHaP879l49kCtUd5agUUl8sJMlIRQzorzaUlldJvjbC7AzYpQKHlBB2lNRkyPcOdo5WwAldigjPk6/6W8QxrHA1tteuavRX0nsDQSjXRsz6q4OW3sBolUthyyptiKAjcgouK3vKPVawHp6NqCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5NOaEgn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5NOaEgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A2CC4CED6;
	Fri, 10 Jan 2025 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736532161;
	bh=wWTI+J+GqDlibzTHylOSVS60+DoqiT0ax232mSj9/3c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=n5NOaEgnGVoHONmajKOFuSFe01v8pG56uh7Jz59jYpvELG6xDVGEJvoIdY6IKXilg
	 GeRnF7gPxt4qZQ81A11NvJpAcdhh5XR+qvp1R9+Dt0+4d14sZSKAjVwAZ1IZy5v6zb
	 4gZZj+le5m6UHdgH3odJqiEftJXeqMATXaM9+aDVpu6GZ05D9qEV932dj0Jgci3ju5
	 PfS6iSPtl1wEeMNv6a+4V7ldw1xM2IOUkQFXYhWsrWI9oXeB06JN9lAQXHrOQ9qkmA
	 iKkD4RQjf/jTkMabkHLE0tX8XYvVipA8dROYLkEMbxUxK7zN/5EHA0UAohNg8Vbx/n
	 k0BARd93xUXXQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 18827CE0D99; Fri, 10 Jan 2025 10:02:41 -0800 (PST)
Date: Fri, 10 Jan 2025 10:02:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.01.07a 46/56] kernel/rcu/srcutree.c:800:18:
 error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of
 incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address
 with &
Message-ID: <8dfa30fb-03a6-4851-aeda-4e2701840209@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202501101426.H4VxxBgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501101426.H4VxxBgO-lkp@intel.com>

On Fri, Jan 10, 2025 at 02:56:39PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.01.07a
> head:   88e44a908bff076d1e7f47634f06a8a4560c19e9
> commit: 88b0a38dd85e2d8a633c78ad39dd82168b9b4e94 [46/56] srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
> config: powerpc64-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501101426.H4VxxBgO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/rcu/srcutree.c:800:18: error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address with &
>      800 |         atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                         &
>    include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
>     3589 | atomic_long_inc(atomic_long_t *v)
>          |                                ^
>    1 error generated.

Good catch!  Does the diff below fix this?

And yes, I am adding a Kconfig option to allow me to easily test this
code on x86 systems.  Why do you ask?  ;-)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ec4232b0a72f5..1e75b35bf7550 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -797,7 +797,7 @@ void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
 	struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
 
 	smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
-	atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
+	atomic_long_inc(&__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
 }
 EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
 

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5353259486;
	Wed, 11 Dec 2024 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733950021; cv=none; b=W3AN3wzWWQSyVhlmaA2aU+87J+5Z5Oa0LSFh6pLnrKVJLRDb99UgG1kuw/yFRaLaRY6CDw/dgl3Q0DAD6pyipD+NuzhFLJgtryHyxj1/gYzPhPR7cFrUli2oQZ9oZ64kcgXqwpy0OzcfU/Yn2JKLO7ZezALRZwZZztYgqEukevQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733950021; c=relaxed/simple;
	bh=RHQEaPl+OXCP8J6ei9WgtVPk9MLgUFMs6Dwx3WiJ3nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/aCnIT3NsMNCWlpn3k8g3aGtNccjVx915f9q5bCGqWO0UnehObvZleBSQDEJG/OsCH04PCc+r7ivFVxrDxAakVmHOv6cj+ew3MLfyiM+bOpA+y+mQpETTYOGz0r1HQI8JzA5z5p9twdH+ZOs2gJuZ55SHqhLIqdIp4NsbU5dO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEEIusON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEEIusON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6010EC4CED2;
	Wed, 11 Dec 2024 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733950021;
	bh=RHQEaPl+OXCP8J6ei9WgtVPk9MLgUFMs6Dwx3WiJ3nA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=CEEIusON1lp3D/NltTmGn0KHYoY4NPEkBakIpHeck8KW6gurv46BAYhI4eDnle/Qq
	 84veFT/XG79O3dRfOcE3ucRDqeafxcYqI3o3K6uLou1Uwr5mole/UH244GcBoSjK64
	 kdNvUhHv6d9U+0GfdF26aMMEmpkVTQo3pqcXhV2zZsUYzyvkiUUJSSpaHxe8/p4L/e
	 Dlpm/KRH11Deg48lF8ETF55bhDE5+IbcVyMtc4SMYder7s2NHnU9L8FsDAbE1cKdWL
	 KBBWeRJA5EZ995ivDRY8ouTcXV1tcumt1Cr0wp19Jkkw2L8ChvPfnzsNnnQXGIy6Bz
	 1AMJb5zOROX7w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0C698CE0DFC; Wed, 11 Dec 2024 12:47:01 -0800 (PST)
Date: Wed, 11 Dec 2024 12:47:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 47/49] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <a62bf091-ec1d-4bc9-abca-6ddf30ae57cd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412041204.ys3dSglL-lkp@intel.com>
 <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>
 <20241210203552.GA4141507@ax162>
 <2d1f4904-68ae-49d7-a8b6-b37558ec4aa8@paulmck-laptop>
 <20241211052439.GA1322346@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211052439.GA1322346@ax162>

On Tue, Dec 10, 2024 at 10:24:39PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 10, 2024 at 01:37:48PM -0800, Paul E. McKenney wrote:
> > On Tue, Dec 10, 2024 at 01:35:52PM -0700, Nathan Chancellor wrote:
> > > On Tue, Dec 10, 2024 at 10:47:22AM -0800, Paul E. McKenney wrote:
> > > > On Wed, Dec 04, 2024 at 12:04:15PM +0800, kernel test robot wrote:
> > > > > tree:   https://github.com/paulmckrcu/linux dev
> > > > > head:   48ca997e8632db65609dcc6a715207a1b6dded57
> > > > > commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
> > > > > config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
> > > > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/
> > > > > 
> > > > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > > > 
> > > > > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > > > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > > 
> > > > This commit has EXPORT_SYMBOL_GPL() for both the Tree and Tiny definitions
> > > > of both of these functions.  What am I missing here?
> > > 
> > > This configuration has CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m,
> > > so the definition and export do not work correctly because the define is
> > > CONFIG_RCU_TORTURE_TEST_MODULE in that case. I think you should be using
> > > IS_ENABLED(), which will handle =y and =m. This resolves the error for
> > > me.
> > 
> > Thank you for the analysis and the fix!
> > 
> > If this fixes things in the kernel test robot run, may I have your
> > Signed-off-by?
> 
> Sure thing:
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thank you!  The commit is below, so please let me know of any needed
changes.

							Thanx, Paul

------------------------------------------------------------------------

commit c2cf9cf59e746aa60badcb07f58b09b7f604c19b
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Dec 11 12:43:01 2024 -0800

    rcu: Use IS_ENABLED() for Tiny RCU rcutorture definitions
    
    The rcutorture_gather_gp_seqs() and rcutorture_format_gp_seqs() functions
    are currently guarded by "#ifdef CONFIG_RCU_TORTURE_TEST".  This fails
    in kernels built with CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m
    because in that case there is no CONFIG_RCU_TORTURE_TEST cpp macro.
    There is instead a CONFIG_RCU_TORTURE_TEST_MODULE cpp macro.
    
    This commit uses "#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)" to correctly
    handle modular as well as built-in rcutorture for kernels using Tiny RCU.
    
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index 1971683f1a82d..b97c64e99a905 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 EXPORT_SYMBOL_GPL(kvfree_call_rcu);
 #endif
 
-#ifdef CONFIG_RCU_TORTURE_TEST
+#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
 unsigned long long rcutorture_gather_gp_seqs(void)
 {
 	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;

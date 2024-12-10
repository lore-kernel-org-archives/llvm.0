Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC614E2CC;
	Tue, 10 Dec 2024 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733862956; cv=none; b=MiXoiNshbSZxLivIb2kxEzhUeYmYvIN181xdZ7vd4TtAxkX+pjYXsPVqFSkS1Mjujbwb2D3tGnPa1oTZrkrEPkML4e0kYSNtc6Ap6T3UPfPOMiacTFt6yX2AxBznkcbIRkC9r5b+wEvT12Ickqe/0+SkH3O3tqGGsb1ifEBL4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733862956; c=relaxed/simple;
	bh=129M7TzOabzFP/G4M/RaCFMu/FfHMyujlf6UAFRPfRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7yoTPyuVAxCKmU7GKI6dXW+uTgR91DZ2lh4W47zIZ0SaZm08PYD+mx6Q8RAE/Vl3wkYE29+Jk1ujHRw4mXytRP+sSVxnfNNGQyccn3vBu2rSuoO+ihZoWQ6u4JcYt5wh2iBYKg7wT+0fO9NoAm2bqgJ6nqrxGYuff2V1bx+m9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgKWQE6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgKWQE6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEFEC4CED6;
	Tue, 10 Dec 2024 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733862955;
	bh=129M7TzOabzFP/G4M/RaCFMu/FfHMyujlf6UAFRPfRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgKWQE6qEmyCU9VSf10hqUPcpw7U1nFy9I7Wes8NTlauaFrIchEbS/cTIiXM+OMcZ
	 Q6GX1cBqoHq5EPHxYtxhtXvQo0hZx8EBfEjPYTDwypt3yl6/JZp0T8dM/sbMJ80L/X
	 YyhmUfCbLlLmb/E8VomOck52TlUGFak0cBUZMd6LdVv4G5uZkM1ArLa6v2S57+MBsk
	 kbJDtlRLWjU+edjXWFlr0HeAFFunuHepz1nK+I4ncI+mUFWnf0bbj8Ysbm2SEbJqGW
	 LGXgFFefLZ/D7esQ9NJfUaPuWJ1HhcJctGPjv9pRPqA4wcLRTKv8V7CDvgJSKDawKU
	 n8LglAcRIWYag==
Date: Tue, 10 Dec 2024 13:35:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 47/49] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <20241210203552.GA4141507@ax162>
References: <202412041204.ys3dSglL-lkp@intel.com>
 <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>

On Tue, Dec 10, 2024 at 10:47:22AM -0800, Paul E. McKenney wrote:
> On Wed, Dec 04, 2024 at 12:04:15PM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev
> > head:   48ca997e8632db65609dcc6a715207a1b6dded57
> > commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
> > config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> 
> This commit has EXPORT_SYMBOL_GPL() for both the Tree and Tiny definitions
> of both of these functions.  What am I missing here?

This configuration has CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m,
so the definition and export do not work correctly because the define is
CONFIG_RCU_TORTURE_TEST_MODULE in that case. I think you should be using
IS_ENABLED(), which will handle =y and =m. This resolves the error for
me.

Cheers,
Nathan

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index f068bd9dc037..773944257e79 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 EXPORT_SYMBOL_GPL(kvfree_call_rcu);
 #endif
 
-#ifdef CONFIG_RCU_TORTURE_TEST
+#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
 unsigned long rcutorture_gather_gp_seqs(void)
 {
 	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xff;

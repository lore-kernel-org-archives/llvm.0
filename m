Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57420ADC7;
	Fri, 10 Jan 2025 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736545744; cv=none; b=q9ag7fr3p8PB5NF6lGM6szi56byfSNdONmBLJ9g8JYkvBI2Hok0b7yuQ3S+emUg4xyNXo26yinL50DnIU6fRvMrz4UToLgi+2axZx5Rb9Aef0nD0HRvnAt+KIYzOOeNJq7mAezEAC1G32cppdVEWOKIbc20DuSJmkmseEwFXjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736545744; c=relaxed/simple;
	bh=icEOyTJjkLLVGBhMAIYra7Jx7ECj+q28nka3Flf7EMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRpudchQCiT4yD9kyMoBuXs3iK2rGKXGCrdURAhHISQ+ycxLaDoAU8CN+HF02iJAnsywH2IHKFq34M8Mx6zrJDNeKX9/UU2oZLCuJdSLS2+50FznNrtfFEqFsbmihrn0UXqETi7ZcEtYC94/PAgrO6gq3KsLqxWyvsxoRYRTPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQfjCfCB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQfjCfCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231C4C4CED6;
	Fri, 10 Jan 2025 21:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736545744;
	bh=icEOyTJjkLLVGBhMAIYra7Jx7ECj+q28nka3Flf7EMU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SQfjCfCBPS4pjFtyIYZpTUQjD0tj0P4PBxkqGO+hqdGZI5Lbxg7sxBWGS9BpLM9YZ
	 rAS4o6CaKkfzKbcBH9Ku5p0OHFzejFWkqXayMgy+YdwpixH1fCWct38b1jD5Yat4tf
	 L57PgFIborKYFK3zUPXRNdXp4E5pb6JhWSGdYmSnOyk20L9PNp2e4I9PU8AoGsOMZR
	 6ZJTdzmi+fLyqRa//3nekUkxInn8VA2bsP0BBT0HC3igw9oNmoDuxTzwqmOZABDX+w
	 20hHqPMmBQ9szrQHSgaEI57V7PpX1l+vybaGYyBA8lMtT2cmH2XPPpeYW4IlMbzsIi
	 9g9nVdHa7cXfw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BDACDCE37C9; Fri, 10 Jan 2025 13:49:03 -0800 (PST)
Date: Fri, 10 Jan 2025 13:49:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.01.07a 46/56] kernel/rcu/srcutree.c:800:18:
 error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of
 incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address
 with &
Message-ID: <2529df6f-27d3-401e-994c-fc2a591ede96@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202501101426.H4VxxBgO-lkp@intel.com>
 <8dfa30fb-03a6-4851-aeda-4e2701840209@paulmck-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfa30fb-03a6-4851-aeda-4e2701840209@paulmck-laptop>

On Fri, Jan 10, 2025 at 10:02:41AM -0800, Paul E. McKenney wrote:
> On Fri, Jan 10, 2025 at 02:56:39PM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev.2025.01.07a
> > head:   88e44a908bff076d1e7f47634f06a8a4560c19e9
> > commit: 88b0a38dd85e2d8a633c78ad39dd82168b9b4e94 [46/56] srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
> > config: powerpc64-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501101426.H4VxxBgO-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> kernel/rcu/srcutree.c:800:18: error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address with &
> >      800 |         atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          |                         &
> >    include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
> >     3589 | atomic_long_inc(atomic_long_t *v)
> >          |                                ^
> >    1 error generated.
> 
> Good catch!  Does the diff below fix this?
> 
> And yes, I am adding a Kconfig option to allow me to easily test this
> code on x86 systems.  Why do you ask?  ;-)

And this turned up three additional bugs.  Please see below for a patch
that causes this to pass short tests, and please let me know if this
works for your setup.

Huh.  Four bugs in three lines of code...  :-/

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ec4232b0a72f5..d2a6949445538 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -783,7 +783,7 @@ int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
 
 	atomic_long_inc(&scp->srcu_locks);
 	smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
-	return __srcu_ptr_to_ctr(ssp, scp);
+	return __srcu_ptr_to_ctr(ssp, scpp);
 }
 EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
 
@@ -794,10 +794,8 @@ EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
  */
 void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
 {
-	struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
-
 	smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
-	atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
+	atomic_long_inc(&raw_cpu_ptr(__srcu_ctr_to_ptr(ssp, idx))->srcu_unlocks);
 }
 EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
 

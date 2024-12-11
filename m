Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7E91C1F06;
	Wed, 11 Dec 2024 05:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733894683; cv=none; b=AdoYMFwu0O35nr+aD2thpsZqQl9+5KK+XKeGjZoXw5GK4thIbvoci5xjswphiaGQi+ywcyfQ7PqmP22K0nLWSKWBY49Z1L+SzaQQ+3VT8/uwHSEjO4qdu7zSWsehoEeQEEHg4gHjfI0TlYCB44iLTL2k8gd5gJMZOzNlECGqc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733894683; c=relaxed/simple;
	bh=EP3SMizGJI2wc1I8BNp9nfPCWzn5RZBTqatW2/k/Y6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7Yb2mYTpDPxObWtCKm1hgdY7dheSJR3FDNK1PqdHJFN/Nn3UG1mgTDyyJ+KXpycI7t2EFqr4nCQjk9+r7Ee0UqTCIUKgGdt3vU7MOFBlQWf4dkk2blVmsnkPcCopX8w1QHFfvv9KNvX3LB27lVo+Owv7oNKOatqWYWC6xzcDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA/Gm6Lf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA/Gm6Lf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46393C4CED2;
	Wed, 11 Dec 2024 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733894683;
	bh=EP3SMizGJI2wc1I8BNp9nfPCWzn5RZBTqatW2/k/Y6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vA/Gm6LfxD1RvBiMETojxd/jlBT544liIV8nMcb48zNxxFNdUW0mqu53kA7bOtE+d
	 iKTksXHAHErkk1eRKjR98nj+FijSYOeYouKj1fHlMkHoqW90v+UXcurZqNUCEz9a4a
	 MXNXGltQ/Qjkv+mPKAqcFggnqJ56yBLRSMBoKMxG12SXiDupULHEVBeEu2l0M3j0e5
	 38KaHahYFmKN7o9Bg7PFOoa4ZJ9I7Ll65PS0D4ZPXs2ww4FVwBgE/NW9Vg5YpmkTEu
	 48Qn4Gd8H7PJ1yUQeJ6MJEFlZ617lcBbPWPvUY0KXen/h0ZWnApBXWpNacUp+AzbKM
	 jR4djlZLKkX/w==
Date: Tue, 10 Dec 2024 22:24:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 47/49] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <20241211052439.GA1322346@ax162>
References: <202412041204.ys3dSglL-lkp@intel.com>
 <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>
 <20241210203552.GA4141507@ax162>
 <2d1f4904-68ae-49d7-a8b6-b37558ec4aa8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1f4904-68ae-49d7-a8b6-b37558ec4aa8@paulmck-laptop>

On Tue, Dec 10, 2024 at 01:37:48PM -0800, Paul E. McKenney wrote:
> On Tue, Dec 10, 2024 at 01:35:52PM -0700, Nathan Chancellor wrote:
> > On Tue, Dec 10, 2024 at 10:47:22AM -0800, Paul E. McKenney wrote:
> > > On Wed, Dec 04, 2024 at 12:04:15PM +0800, kernel test robot wrote:
> > > > tree:   https://github.com/paulmckrcu/linux dev
> > > > head:   48ca997e8632db65609dcc6a715207a1b6dded57
> > > > commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
> > > > config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
> > > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > > 
> > > > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > 
> > > This commit has EXPORT_SYMBOL_GPL() for both the Tree and Tiny definitions
> > > of both of these functions.  What am I missing here?
> > 
> > This configuration has CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m,
> > so the definition and export do not work correctly because the define is
> > CONFIG_RCU_TORTURE_TEST_MODULE in that case. I think you should be using
> > IS_ENABLED(), which will handle =y and =m. This resolves the error for
> > me.
> 
> Thank you for the analysis and the fix!
> 
> If this fixes things in the kernel test robot run, may I have your
> Signed-off-by?

Sure thing:

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

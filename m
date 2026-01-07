Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6633985D;
	Wed,  7 Jan 2026 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767818753; cv=none; b=lvKMSB++mlkRsQmU5GoxpiYtecQhk2bX2aEjIE3yfUqlmfLBat7mzo1GfjC9p0qTrZ76nHGJuZrzKk0qGnxUxhx9FCzVtTEeye5dH8e8IirOTGZrBWTy9pwWT8aPBObO5jF7UFvs+BLrzKkCKw6v8Tu5ifEJenqZjcvFKZf18pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767818753; c=relaxed/simple;
	bh=ylxZ3xfbrrZ8hUeBW7snxibvV9z4nQSKvWiM3FqQYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ollqQ0hfLg/c6oJDsydPGgYCFon/vAP/t/b9Oow8nauYjxrZKZ7wR701+YfFAwdu4SW/ggMNoVexJpY2+0uy/x11L2FZp5TNRTekmJ6POh/lT1JBx674XurQiz8K3cGYCBetPkCc93fkygndZiJg42Zuraqc+gl7duXyaira16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSa0saWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSa0saWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A2CC19422;
	Wed,  7 Jan 2026 20:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767818753;
	bh=ylxZ3xfbrrZ8hUeBW7snxibvV9z4nQSKvWiM3FqQYQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSa0saWwd5Dh9WStEfIglG/Gdi8xcV/rXCFC10VW/gfz5P0lbPGesebgkaKUncca4
	 sWcVDR0fM4YCNKYY2gugZsnQ/SPQLaPxCwqGiAN+9MoDWwKgZYIIZOVBRruj1ACA1T
	 pnnxFCPiyaFvNHpPRah8V8D3fr6ZfA7EIgbV2ixIoQnZCFcAhIZE/j/WECyNosVwyH
	 c1rBsZtmt5j7ARIssKmPeU6+GKzEtCAireAGc6c2irJW3o7Z4mEMuSBpdk/d9ISPf2
	 RLrnQkrAEdscWHhe1UgsJepPsdnEmKOJ7E7hwwAQR5jnjBbQsgUiY/OI7TqXSfRFW2
	 zAhkfTAmO22mg==
Date: Wed, 7 Jan 2026 13:45:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>, Marco Elver <elver@google.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260107204549.GA846948@ax162>
References: <202512222219.F6EkVNmQ-lkp@intel.com>
 <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
 <20260107114608.10536C6a-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107114608.10536C6a-hca@linux.ibm.com>

On Wed, Jan 07, 2026 at 12:46:08PM +0100, Heiko Carstens wrote:
> On Mon, Jan 05, 2026 at 04:35:20PM +0100, Peter Zijlstra wrote:
> > > commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
> > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > >> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
> > > Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
> > > >> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
> > > Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
> > 
> > Heiko, I'm seeing these warnings, and I can reproduce in a local build.
> > But I have to note that its just one more of an already existing string
> > of similar failures.
> > 
> > I don't see anything like this on x86, not have I had robot reports for
> > other architectures. As such, I'm considering this a pre-existing s390
> > issue.
> > 
> > Please let me know if this is something you want me to look at
> > nevertheless.
> 
> Sorry, to be more precise: I haven't seen anything like this before on s390.
> All other occurences are also new and come with EXPORT_SYMBOL statements
> within files where context analysis has been enabled.
> 
> When enabling CONFIG_MODVERSIONS I see this also for x86 builds.
> 
> I assume you cannot see this error pattern for s390 builds with
> context analysis disabled?

Something about the context analysis makes genksyms fall over, running
it manually on kernel/sched/core.i with '-w' to show warnings reveals
many new "syntax error" instances. I don't see any warnings when using
gendwarfksyms. Maybe it is context_lock_struct, as that is the first
error I see in the list:

  include/linux/spinlock_types_raw.h:14: syntax error

Cheers,
Nathan

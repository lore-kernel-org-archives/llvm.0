Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2C8248F62
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835982; cv=none; b=hjzzQvdSYV5HfxID0JVhduEgMbo+XHQ6baSYPA34QNt4+cP6bFKUpxNC1JoPK6xsVAJ+bOkF+zJOoL7Tc51hn1Wrybquy7VDjCu2h4YMeSKtZ0owLRNO7n3guN4Es5F1dQRb/Ny+ZBwN6fnNoD8GcSVxNnEwf/xWEhCuiTJ8jjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835982; c=relaxed/simple;
	bh=vMM965T9bjJMAbkNXqh/aVOZLqcM/99LzQNb+7dO4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+TWrFC++wnLXDqMjjORVPzN8sqRTlK8x3p/E/YvKwvwgiNnqPrIeSjxj+OCCg6kwVfqaMzIiHdEEfZKc166x5DocD/3H8WP2tFCgKkTQZt2mmm8K6pgEGp3rjKsMA02b2IbQXWt760+SERH86NzsUgjFDL+exwkRk0sKMnax7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62ICCjZ6969638;
	Wed, 18 Mar 2026 07:12:45 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 62ICCi6v969637;
	Wed, 18 Mar 2026 07:12:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 18 Mar 2026 07:12:44 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
Message-ID: <abqWvBj5_t_Q-y6m@gate>
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <abqRvDiAI85w2bCe@gate>
 <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>
 <abqTSG-wg-9ahRTe@gate>
 <42b99f91-02bc-4062-93ad-02db3fe81b49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b99f91-02bc-4062-93ad-02db3fe81b49@oss.qualcomm.com>

On Wed, Mar 18, 2026 at 01:03:03PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:58, Segher Boessenkool wrote:
> > On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
> >> On 18/03/2026 12:51, Segher Boessenkool wrote:
> >>> On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
> >>>> Return value of ps3_start_probe_thread() is not used, so code can be
> >>>> simplified to fix W=1 clang warnings:
> >>>>
> >>>>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
> >>>
> >>> And this is exactly why -Werror is harmful.  A boring harmless warning
> >>> turned into a build break :-(
> >>
> >> -Werror does not matter here. We do not want warnings either, assuming
> >> of course they are correct.
> >>
> >> So if this warning is correct, then patch should be applied and WERROR
> >> is irrelevant.
> > 
> > The build is broken.  -Werror is positively harmful.
> > 
> > Yes, you want the warnings fixed, but maybe something else has priority
> > right now?
> 
> What do you mean? This is waiting on the list for long time - note that
> it is a resend - so if warning is correct, for how long it should wait
> to get to the "priority" box?
> 
> And why anything needs even the priority here? Why priority has to be
> discussed, especially for some legacy (I think?) code? Why correct
> patches cannot be simply applied after some time/review?

It is totally simple: without -Werror, you can build a kernel.  With it,
you cannot.

The ***warning*** is correct, there is something in the code that can be
improved.  That is why such things are warnings: the compiler can
produce useful output, there is no reason to scream bloody murder.

The main reason some people like -Werror is because they are too lazy to
look at the warning messages they get from normal builds.  Such
developers need potty training, this is not a reason to punish all more
reasonable people!


Segher

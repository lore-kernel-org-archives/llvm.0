Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6042C3242;
	Mon, 13 Oct 2025 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760380267; cv=none; b=DB32UTDNz1ud51Zb8ARVzear121EqvpQUolHzuLVNhN9U2CxhXS/S/kszeq49yGK5+ZkMO9gDyhNHGT2EJk8Lw13OpLrEns5INqC15iRTU1HIhi40gYSkGPbshHizn8NU946Pw9aNQ3wMHZq2kN8YDnBR2/5UXNR8uxPkev7VeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760380267; c=relaxed/simple;
	bh=j/kKOAp35xzzbw0pVVrPMAIWdzl0bSnm+VK2iAP7TR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNAgWe2nEj8u6YE2os6FSvJs4SZRhmEBqyhh/JSeGcUUxBjnQYyDXgvDhk/sPzIrxmKerFHnsveeCNpc+3RgAmJQXc4+NBnG2pLz1tyhqBI3ut4IIDq3yK34Llf63/pecu6C19uHRaze8GhRkMGHfOHoZUPXw2AH08WpJw/+K5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc7dRP1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc7dRP1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46703C4CEE7;
	Mon, 13 Oct 2025 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760380264;
	bh=j/kKOAp35xzzbw0pVVrPMAIWdzl0bSnm+VK2iAP7TR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hc7dRP1E31eJYSUPpgceC/zxrPCpJq+0Ng8inHl+wiKcYMx1YVLA5cAkiVOyx9MoG
	 9dNzWZ2tiWcYBpvpnErzALdUJ7pKWGVpVV4Z6ztGqjly1Bcu4LdSCPQdDxc3nwFqx1
	 LO/qLYNMfipt1bkPoh/XyXCI8UzzTXP4pCjUiudpOI5Idqdm5HWcgetNTdFI1XAJuB
	 GcawhXYwxyHEkDVpbxec5KMlDQdqMtaua+7jgM/OCs9m3gyedDud8b2KYmMZQeWA51
	 4DmRSGHufVHEHbQBu9Lkql19/iwRwC1/gT/BfI+FaklaZZDhMaSHDloMTVRPsROz6N
	 7v1Co6+/FZXPw==
Date: Mon, 13 Oct 2025 11:30:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [tip:x86/core 1/1] vmlinux.o: warning: objtool:
 rcar_pcie_probe+0x13e: no-cfi indirect call!
Message-ID: <20251013183059.GA690226@ax162>
References: <202510092124.O2IX0Jek-lkp@intel.com>
 <20251010032001.GA3741500@ax162>
 <20251010071032.GE4067720@noisy.programming.kicks-ass.net>
 <20251010074446.GE4068168@noisy.programming.kicks-ass.net>
 <20251010223012.GA3597090@ax162>
 <20251013082629.GH4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013082629.GH4067720@noisy.programming.kicks-ass.net>

On Mon, Oct 13, 2025 at 10:26:29AM +0200, Peter Zijlstra wrote:
> On Fri, Oct 10, 2025 at 03:30:12PM -0700, Nathan Chancellor wrote:
> > which does somewhat make sense because what's the point of setting up
> > the CFI call if you know nothing can actually make use of it since we
> > will crash when trying to indirectly call a NULL pointer?
> 
> As Sami says, it would be really nice if clang would at least WARN about
> emitting an unconditional NULL call like that. I mean, it *knows* its
> going to crash and burn at that point, right?

Yeah, I agree. It would have to happen after optimizations and the
infrastructure for reporting those instances back up to the frontend
is... not great IIRC but I will see if I can file something upstream.

Is there any way for objtool to detect these instances and emit a
slightly differently worded message? Figured it was worth asking ;)

> > Something like this would avoid this issue then.
> 
> Yes, this seems reasonable -- even if the driver should perhaps
> mandate/depend on CONFIG_OF, making sure to behave when NULL does get
> returned is definitely a good thing!.
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks, I have sent this for review with your tag and Kees's:

https://lore.kernel.org/20251013-rcar_pcie_probe-avoid-nocfi-objtool-warning-v1-1-552876b94f04@kernel.org/

Cheers,
Nathan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F128467D
	for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915473; cv=none; b=lx7LwtarXjQ/W4//Zew+nM9GM25uyuB1zVVQWmcx27UqCmkIONaSy8gIMR+V6zrvAQFtaibQXpGF6fgECf5+AFgl10HiSH7DONmQ2p2vBC+bRiN780aPVgCKaVes2Qhh56VoTIYCmtBDqeCRyS7mSnGiOOUdmixGUxpov8KE/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915473; c=relaxed/simple;
	bh=eQOXudHbh+SFJK10wt0jLFHGpTFS6Qlb+u0MozIFooM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLbu8idISjijbo0PZkZi4EmmP/dDSv0/R7YMd3vIK32OE+7uNqzBQHoIp8Ni+qXn8eVKeuJK5Lf3ccZ15t1xbkTebuqNBa6iHWkxpSRyIQUrVdA9y9hXJLYh63lg6Zd/fRsZYtX0icXic+1cL0ZmclIHOBGNJ+PvojAsAV0kUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNmSXrlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNmSXrlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157A4C4CEF7;
	Thu, 12 Feb 2026 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770915472;
	bh=eQOXudHbh+SFJK10wt0jLFHGpTFS6Qlb+u0MozIFooM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNmSXrlf5W9KK0byB1qJdNrMTz4QFBDok5+lJcX+Nq5dea6w0y5DzDFOFOmbFEGF1
	 NKCwhzdEil9TorLDkYSsIcFCNkQRCI+SWFcw7IGXjkEK5paKXl0S+9Gq8nPt12Qyo5
	 X+7zz86f6Wz0Sz94mqhlzGLn3bh1y+GLw6wMQP9QbPSF53Z88LJqckxpMnLlRyJJVN
	 5Sa6issZ16tA4JsuWwO4YQgTm5+eCWRQWLc5aAIoHIpnNJN4YBv8v946ottxYWpIrq
	 Y3IRIJkKeEgxq1lSfw+KcGxvfBMRoFDYvCee6ctJIJFXeRqLoCwmmgtPjFNqWj3mxi
	 RGhU9KjYondGA==
Date: Thu, 12 Feb 2026 11:57:48 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Aaron Ballman <aaron@aaronballman.com>,
	"Jose E. Marchesi" <jemarch@gnu.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
Message-ID: <20260212165748.GA1036664@ax162>
References: <aYhfK3tB0X6Y_GyV@gmail.com>
 <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
 <20260211194020.GA3482274@ax162>
 <CANpmjNNB_KDBXeEi6MYsPwVcDnid-8oQJvGcc6HwbOLqNBpE1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNB_KDBXeEi6MYsPwVcDnid-8oQJvGcc6HwbOLqNBpE1Q@mail.gmail.com>

On Thu, Feb 12, 2026 at 12:53:24AM +0100, Marco Elver wrote:
> On Wed, 11 Feb 2026 at 20:40, Nathan Chancellor <nathan@kernel.org> wrote:
> > > I recall there was a CI system that did this, but lost track of what's
> > > the latest.
> >
> > Aside from our CI and Intel's, I know Linaro's toolchain group has some
> > testing of LLVM main that seems to be fairly up to date:
> >
> >   https://lore.kernel.org/llvm/?q=f%3Aci_notify%40linaro.org
> 
> Glad to see. I hope that if there are breakages, those are bisected
> and reported to LLVM PRs that introduced the issues?

Yes, at the very least by myself if not others since those reports are
set to the ClangBuiltLinux mailing list.

Cheers,
Nathan

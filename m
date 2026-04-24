Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514103E120A;
	Fri, 24 Apr 2026 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050817; cv=none; b=dp4l1bIKYcTHyHEXeLYEVwo9C1E4lMr1L+0NnnzCRNrOlQHqzlon4H2xUXpebgB9psvXBXCoEf68OsCvRv9g4jranvGMMt2ErFiHSL/C8kVXV62Eu9QKCPNmhIqsvvrCphzCPJqpZs+yb0j4GbSfMs6qOCl3pknsh12tKzbhBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050817; c=relaxed/simple;
	bh=4dPfJlvetpBAWcQDj72GCk6vJDDuORgpjt8I3DmO7uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wsu7kwcKXpzWmpaV0SyEAydLaQtfkqdPctMioe4rWlD8PV0+b4q+m1IvBf5JyNkd2bfASZIUTNw3pzXgD0xg6r329yIAA+KmdvX7fP9PxknsJ7AT2E1O6sBuv624U1NS/FQsDJQxZImMkJLZq4Z+Kj/VfJtfMvlW9IdJ7sglip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Out/1I/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Out/1I/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232BAC19425;
	Fri, 24 Apr 2026 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050817;
	bh=4dPfJlvetpBAWcQDj72GCk6vJDDuORgpjt8I3DmO7uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Out/1I/YI+SSstHsVxoOMSiEVWxkBFANKUWrcE9d5GRjeVMOxKEVSMDZqUbJzreDF
	 sh43tgsRNcjQTpix+E3C5J7hnIXyfviDm/YCK4XPuSGB1hNv1FjQOXgjl6XGCeLTNU
	 RmTSo2gCcr3ZI10PZlkBo0CVJrYQ5WIFJdc09nVuH6idzYFn3IsFWe+0QFCkmH1fu+
	 vLf4ltnRVy9OvjutDaaDvI4oJBlv21/z27wyMm2xxVNomI6hYVrI31ATsE5jUoUiEA
	 tmpe+KUVeyJchrdZwRocopsvnsXOdR7hj76EHn6cVD+JygVQyAbXzUja4w+A4g1dNY
	 YjY4oKprLRNkA==
Date: Fri, 24 Apr 2026 10:13:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [GIT PULL] Clang build fix for 7.1
Message-ID: <20260424171333.GA3872959@ax162>
References: <20260424000413.GA1031124@ax162>
 <CAHk-=wh9eUk9+BOGwP7ni4OZPZSCfgZQ43n53XWuh3rHhMxwfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh9eUk9+BOGwP7ni4OZPZSCfgZQ43n53XWuh3rHhMxwfA@mail.gmail.com>

On Fri, Apr 24, 2026 at 09:33:19AM -0700, Linus Torvalds wrote:
> On Thu, 23 Apr 2026 at 17:04, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Please pull this single build fix for an instance of a new clang
> > subwarning under -Wunused-but-set-variable, -Wunused-but-set-global,
> > that appears in certs/extract-cert.c. If there are any issues, please
> > let me know.
> 
> Ugh. I've pulled this, but this is very ugly and does not make the
> source code better.
> 
> So if these patterns keep happening, I think the whole warning should
> just be removed.

Ack. For the record, there were only three instances of this warning in
the host tools (-Wunused-but-set-variable is currently enabled at W=1
for the rest of the kernel so I have not audited those patterns) and of
those, this is the only one where I took the '#ifdef' approach. So I
don't expect this to keep happening but if it does, we can certainly
evaluate turning it off (although I expect new code will just avoid this
warning through the various build reports and such that happen during
development).

Thank you for pulling it despite the ugliness.

Cheers,
Nathan

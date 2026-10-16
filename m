Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC5381AE0;
	Fri, 16 Oct 2026 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118063; cv=none; b=HeLpvwdNR0IGvKxisCVqvoTv4FfEks2TLEVig5+oQeP552ZHRK+5pXNn+8KiTa9uMXWy2wQDxuY4F26oBjE5dAMTdgwwMB7lZ4JRleoEI3X1Rs3XxMdozY3L5WjyMOfKDnvH7H5O7EQgV5/3MkSJME2+psVKmS/VGOGzGGsGPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118063; c=relaxed/simple;
	bh=p11wEnCGT/4GXNa43V0MNBx/BrZ9zXTuijGteZO2ljI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZVR88eSZRJ+N+zgOqFD4tClTbb2llqevdbAwGOaNbhhDnNpqUdQJYOn5j+1qWHVfcP7qgqNTbs5YWH8UBcl2+V5cdpeizLHo4wZv351bXJkkW1eYpVqxo07W27kfz2SAQfU2A03HIHz7btwJ3qyAVO1ImleM9xsoYlLotd9UiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaDqbOv5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaDqbOv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98841F000C4;
	Fri, 16 Oct 2026 02:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792118061;
	bh=I5wb+IQYgdid2/TXHD9XZHiivRHVDqrN7BBEAr+6RcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EaDqbOv5WxRGaCIRCpL3IeqDO3tEGHnekPliGwXr1DQxep99FvXLRSBHV94g2bDGJ
	 zCSbqAOXWBypNvLd87iblYYQhCjvKXsOydaFrNoDUdNJ48S7ywlty/yp838UCx2dhn
	 POdbuM/ZWqovMQGWJUpt7bXMyRN52yEVFNhfDAAhIgxGlvV4wCvmjXHC0sin4YlWGh
	 brM3RUO5gjh/NcAeceyJJnTQsbn59IXLg8zd3UWw/3CfIhFsgWWm3AcOvTetqxMnNn
	 8F4WK1ebClMvxDuUgYeG4Lx8fnWRW1MaayFS6S53tgGA7zh+Is7oFeehBq3Hyu+jNs
	 n+C6Xe9IVK/2A==
Date: Thu, 15 Oct 2026 19:34:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
Message-ID: <20261016023418.GA3746059@ax162>
References: <20261014232030.GA3382959@ax162>
 <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>

On Thu, Oct 15, 2026 at 07:12:19PM +0200, Miguel Ojeda wrote:
> On Thu, Oct 15, 2026 at 1:20 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I have built and uploaded LLVM 23.1.2 and 23.1.3 to
> > https://mirrors.edge.kernel.org/pub/tools/llvm/.
> >
> > If there are any issues found, please let us know via email or
> > https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> > opportunity to get them fixed in main and backported before the 23.x
> > series is no longer supported.
> 
> It seems to work in my usual test:
> 
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> 
> By the way, the `rust/` folder is fixed on Rust 1.97 which uses LLVM
> 22 -- not sure if we discussed it.

Whoops, I am in the process of uploading 1.99.1, which should allow us
to cut over to LLVM 23. Thanks for pointing it out, I need to stay up
with Rust releases better.

-- 
Cheers,
Nathan

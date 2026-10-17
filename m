Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D660377A80;
	Sat, 17 Oct 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266471; cv=none; b=k+NmgsvymD1soVd3tJn6wGOud1XOdtev1MFv/YTxVg5BCuhAbqoAB+ABY5PDrlMWmbpKpPnAt4Gxi08N8tczaHMm9Qwgmv2HtO+ZK7pDXoBSZZ31aNJRI44FgnSoGKdOBFzQGPhmVx3ClE37a80TbhOKrm9rai+/MoqLtboXL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266471; c=relaxed/simple;
	bh=SQOudAgflRjlS737CP35RYs55/quMmKZG7UcBtaftqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjeyiamG0ebmcdBTBTJDJUWjo25dWAL2qefIOMLJv9Kf8vYmEu3W2o20nhoC7kHwvjH9pE1rDabby5DFDLO7TbV8rstN/538aaNJMBsgLXmpicWgAYdV/lzZI9LDD9wJBuzimndjX3NE38m0nx36XF/il6GPX9jdC9/aqxVr348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHGHGT62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHGHGT62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDF11F000C4;
	Sat, 17 Oct 2026 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792266470;
	bh=ooOEJZaTryus34SCWYvlm63h96oz5PyCpeviMvxF82s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHGHGT62OlGI1+f7BbcfFOIiHub794WdqANPY8TygQcXeMvevFW7p5ATdngO0Xedc
	 LsctfS0rHfX2DUIwMohx1vYFPtE5qY4eFjOTwGNMKVbau6K5yAbERBlIK0VdMVZpoC
	 aLh/s0lvU9d7eu6Dr47t3vRe68PqWC8HSKPam4T5SLHC2w7l7sdhcHMU6/YY5uJeRE
	 vRnPwnQXNxKNGd7FgM3K8uH9N2gjP47v3ffY0cpO1Y5ZsxiEPqjnZdyGQTRtVFtDR6
	 gg3Ku7lnLTLab3+un/hxMQ6xPLSLqoVCm9t7JVa2nTNAWcrXPwtlK9puwUnqxJ7jky
	 bL5Ho3y+KVsdQ==
Date: Sat, 17 Oct 2026 12:47:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
Message-ID: <20261017194746.GB318740@ax162>
References: <20261014232030.GA3382959@ax162>
 <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
 <20261016023418.GA3746059@ax162>
 <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
 <CANiq72mhaCSsMiXJstWMnvt77y7jJvZsQwnNCACs+YYioAoA4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mhaCSsMiXJstWMnvt77y7jJvZsQwnNCACs+YYioAoA4w@mail.gmail.com>

On Sat, Oct 17, 2026 at 06:58:31PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 16, 2026 at 11:44 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Don't even mention it! I thought perhaps there was some reason like a
> > fix needed -- if it is just that it wasn't updated, then that is good
> > news after all! :)
> >
> > (I am happy to ping when there is a new release if that helps or
> > similar -- actually, they follow release dates like a clock; I even
> > have it in my calendar as a periodic event)

Ah, I failed to realize it was a six week cycle. I have added a
recurring task to my TODO so no more delays.

> By the way, the Rust 1.99.1 + LLVM 23 archives you uploaded on Friday
> work, thanks! :)

Great, thanks for confirming!

-- 
Cheers,
Nathan

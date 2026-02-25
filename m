Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B548830594F;
	Wed, 25 Feb 2026 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050355; cv=none; b=K64a8sep2f9b6bVr+dSYyfT3U0qD6xwMx68blQM0+yM0Jd/itRX98CWRA3dL4UVWLBx0JNMO7a3/trsixFUsrk4qTgWJ+6G2LVX1e4VZ/+bwJuktXSXYd1WX7yKwYkyDiylg3x1sqPc+8hLzK1ON0nbq6M0iFv3qDxIvRDOdC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050355; c=relaxed/simple;
	bh=QxicpVh7AXHk9Sz78Y5Hq+TByPNNANQV8C4vSxuSC78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMMFkiQyA1IpEbgHB42GWdvaICFipaxC+UbXEhhBGsTT9Webl4nZTLuijn+FF5b+C/qTBgCxH43gFdUaGwF9ysLChXaePmWZX71sFtqg1Xfk2QnFfNAiKRYRytrTEXD0NckRYRZjNQxSurC22PR6FqHRWxZhotKXb6QLgfg/Mro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBj75RVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBj75RVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFD6C116D0;
	Wed, 25 Feb 2026 20:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772050355;
	bh=QxicpVh7AXHk9Sz78Y5Hq+TByPNNANQV8C4vSxuSC78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBj75RVyZCKhmRCiz4Y5iFzaQH6PS+s4fGYVaTlLRCy4VoigSxZFlMxqkbWOd/Tvy
	 1LXS8yM6K6rYBt1Ymhme3P4e77crkmZCTC+VnROryN0/RbccK6B3YY6JIcq6lMcpRk
	 pHG9dU3dCLuO5qWtMlPk5dMtecgCMvlq7qirkHnZs6Tx+BCFzLMQx4HBt6h/0jP95q
	 m7JveTUjYwlTqActtxHL+equqVFPAidCmHiwlk6Wt5tLSUhTEixRx/MsuAtWGDX/ZH
	 iIn/E9/7zYgfzSAbeSFaxy8uRkC0kD85ditnCdD2vBFkJM8fDcrIeWw6WI9lg6grou
	 HW31ggYeF7aKw==
Date: Wed, 25 Feb 2026 13:12:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 22.1.0 uploaded
Message-ID: <20260225201231.GF2755225@ax162>
References: <20260225014834.GA1284670@ax162>
 <CANiq72=d8c8GJEjPik5tv+LYPdFLiQOpArb1-wNck5sCzdOhkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=d8c8GJEjPik5tv+LYPdFLiQOpArb1-wNck5sCzdOhkA@mail.gmail.com>

On Wed, Feb 25, 2026 at 11:55:24AM +0100, Miguel Ojeda wrote:
> On Wed, Feb 25, 2026 at 2:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I have built and uploaded LLVM 22.1.0 to
> > https://mirrors.edge.kernel.org/pub/tools/llvm/.
> 
> As usual, thanks Nathan. I will test the new major.
> 
> Speaking of new major versions -- for the Rust "latest" combined ones,
> should they be LLVM 22 or 21? i.e. isn't the "latest" set is meant to
> match the LLVM major number? On the other hand, it probably works
> anyway, and whoever cares about LTO should use the matching. But in
> that case perhaps we should update the wording at the top of the page.

Hmmm, yeah good point. I had interpreted it as "latest LLVM version" not
"latest LLVM stable version of the corresponding major version". I guess
I had figured CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE would help prevent any
problems and most users would probably prefer the latest version of each
tool, rather than the compatible ones, which are still available. I will
work on a wording update there (or just revert back to 21.1.8 for those
until Rust has LLVM 22 merged).

Cheers,
Nathan

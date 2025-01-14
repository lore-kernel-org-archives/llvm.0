Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897C81BD9E7;
	Tue, 14 Jan 2025 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875101; cv=none; b=Ph713tEL4sWXNRyhtFCd7m14hG6y/AWEVYqCcjbtrpk2RsngMxwql+5ySg3lmxfVsz0Z/aPblsa9vWBcirrUkJ5XxBL/YCeXhgj+UH1oE+lsHktXaQOIiAHsAPxina5OI0uITVcpKR40uRq5/7tjJ/RAsBSZZ6fDNWfQSy1ou10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875101; c=relaxed/simple;
	bh=r8aH0okh6XUsDkYzNmBIKs01nwcI68VyXznpfVQwNFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd5r1sNYKPUbnm3oU9C4Xta0WKCZHaRxF/osYuWCMMGwfkj/v1nneGGMkQ+8xZdK6rUPixE0QutjPuyXNEp4FX5f0pwJEwkk5Ov0XVSnbbfg5O1YL3gY2dtEYkz/SiL7YO9cpKaJFPu17xD0uGdadqqSNai3Fr1rxDdT/tDTEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKQDgl05; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKQDgl05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8164C4CEDD;
	Tue, 14 Jan 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736875101;
	bh=r8aH0okh6XUsDkYzNmBIKs01nwcI68VyXznpfVQwNFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKQDgl05vPAC75mvj1DNH2NCNIAOB5khlaQHfqoB7Rv7biQObFsByi4aAW2jCeL6a
	 NiR/PakvIykiPy4IKKjw3D+KqFYObSQ4WnhBZYKS5c+Eyc5MOOQBV/17logGO7jnBI
	 j4etqhwspq8kbKf81PrAD7eJb6g8Vxi7IzW+iesuo/m1ynn2haGrS1Cp8sxAfDijxq
	 5KXwlAyH06y/rwvIfmlFM6StYJm+KQENpRQeD08jYBkH7eYWIh2bWAGnFFgCi8nBK2
	 Cuu2VM0NSTdDQqj45FvmGVs+JDOWNtnj+2b8QcvwFxu2buXJfEHDc0dyYvoJ12mDvp
	 M2KvWP0Bb6jCw==
Date: Tue, 14 Jan 2025 10:18:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Klaus Kusche <klaus.kusche@computerix.info>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: "Bad or missing .orc_unwind table. Disabling unwinder." Clang 19
 problem? 6.12.8 problem?
Message-ID: <20250114171816.GA3416405@ax162>
References: <b248a0fb-e182-42e3-abf5-83945ee992f6@computerix.info>
 <20250113214122.g4lluwpzj3tnamx3@jpoimboe>
 <20250113235835.vqgvb7cdspksy5dn@jpoimboe>
 <20250114095159.GA1580513@ax162>
 <46c1ffa7-7531-4d4c-b302-e3ae244b57a4@computerix.info>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46c1ffa7-7531-4d4c-b302-e3ae244b57a4@computerix.info>

On Tue, Jan 14, 2025 at 10:59:44AM +0100, Klaus Kusche wrote:
> On 14/01/2025 10:51, Nathan Chancellor wrote:
> >> Nathan, I think this is a Clang 19 issue, where one of the jump table
> >> entries is pointing past the end of the function.  When we saw this in
> >> the past I think it was due to some leftover optimization, where the
> >> jump table entry ended up unused so it was harmless.  Are you aware of
> >> any recent bugs in that area?
> > 
> > I am not aware of any recent bugs there but if you or Klaus have a
> > configuration file that triggers this, I would be happy to bisect LLVM
> > to see what change introduced it to give us a better understanding of
> > what is happening here.
> 
> Kernel .config files are attached to both
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=219685
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=219686

Thanks a lot, I missed that since I do not interact with Bugzilla much.

I bisected this change in behavior to LLVM commit 64ed699b3d81 ("Reland
"[SimplifyCFG] When only one case value is missing, replace default with
that case (#76669)"") [1]. I can see how that would cause this issue but
I am not sure how it is specifically interacting with this particular
kernel code. I am going to try and tease out a reproducer for this and
report it upstream but it would still probably be good to consider if
objtool could handle this, especially in the face of the upcoming
--Werror.

[1]: https://github.com/llvm/llvm-project/commit/64ed699b3d811407e5a9f1111f63e11dc7f7dd80

Cheers,
Nathan

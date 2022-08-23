Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E3F291A
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 16:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756FEC433D6;
	Tue, 23 Aug 2022 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661271072;
	bh=I2wMQlQE2ea0W3N6RNflFgDwWIvO1yrAEOonIAJwWe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSNdmwjbSdgzxxiy2Qzow0e270Hch77B2bpGjSSvCsBEq0D2lu1fyHza6fmFyevSY
	 I651tP7J8TQq8OWHcF3ddOmM58Q232mMCNLsju4WTWaGp1jQdjx9JpupezRSO216s2
	 Gi+4M0GDMeNwY8EB83YKlpOnJeOoR4A0zBRIjE5TflYDFKivDoABAY4GrAD60t7vqJ
	 WF4oASrfMmg6VsYGrsvEZNqwHqVNYBRDFaIKO5gPs5UamkOflYkkBJUcCqXGpX07wh
	 5kBgJU/plegFl8P78+jzUovFOnAnyZvJEEFkpIVukrEMDVT5YZ70FbtqUvOfCKQgr5
	 KG7LbnvSYLkEA==
Date: Tue, 23 Aug 2022 09:11:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>, llvm@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-ID: <YwT8HYefLbFaOdJz@dev-arch.thelio-3990X>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
 <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
 <YwT6bmqeBeoYcRi7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwT6bmqeBeoYcRi7@sirena.org.uk>

On Tue, Aug 23, 2022 at 05:03:58PM +0100, Mark Brown wrote:
> On Tue, Aug 23, 2022 at 08:39:13AM -0700, Nathan Chancellor wrote:
> 
> > I noticed that this was applied to for-6.1. I know you do not rebase or
> > change your trees so this request might be rejected based on that alone
> > but would it be possible to cherry-pick this to for-6.0 so that it can
> > be applied to Linus's tree quicker? We have had to apply this change to
> > our CI to keep our builds green in mainline, -tip, and 5.19/5.15 stable
> > with clang-16 due to -Werror. If not, no worries, I should have made it
> > clearer that is what I was looking for with the subject prefix.
> 
> Hrm, OK - it's a bit surprising that this didn't get fixed in -next
> before the clang change made it to mainline TBH, it looked like
> something that had just hit -next.

Right, sorry for not making that more clear in the commit message. The
change in clang was made only a few hours before this patch so I did fix
it quickly but we do not usually get any heads up on new warnings. They
just appear then we fix them and move on. I'll make it clearer where I
want the patch to go in the future, thanks for accommodating this one
time.

Cheers,
Nathan

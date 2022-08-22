Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73E320F
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 18:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBE0C433C1;
	Mon, 22 Aug 2022 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661193123;
	bh=gfZjPJT5G7lpjIu/0Jy28SoaFgeZIqpxf0POXqDEnMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7UOEFled3s96Est+17agM3GtQ6UvjepLkC8J4vcoBFlVFLEU/vF1CCXXIJTxb2aa
	 s5ZiGbhY9yzE6XqyuTX8vZbpd0+xE1hubC7trUqz5Dz6UbCGzw6wFWn4k6xAXH6sQ9
	 hFRgwGjcJ+gCg28wDCKYyDt5Qz2RX35oFlOYNjeRRG/I+ilCSEVqYMFHVzl6O0U81E
	 YBGu9yeH+3wRhgj6ALfl0NkAOy6lPF+w71RbBBe91doRY+BTi8ZNl1Nz1Ac4YKJF2i
	 x6nFfnPmb8QfrgcLvoUFOrW4VUv5c3vRjfwCRGhOzVdgjFucHliXFhap+VcfAYgs72
	 Vi5NKaGikPFbg==
Date: Mon, 22 Aug 2022 11:32:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matt Flax <flatmax@flatmax.com>, kernel test robot <lkp@intel.com>,
	alsa-devel@alsa-project.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <YwPLoSWuYzsJ6Bhp@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
 <Yv0NLxzwqdBaZ3Jf@dev-arch.thelio-3990X>
 <YwPGQZHs1o0jsv2m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwPGQZHs1o0jsv2m@sirena.org.uk>

On Mon, Aug 22, 2022 at 07:09:05PM +0100, Mark Brown wrote:
> On Wed, Aug 17, 2022 at 08:45:51AM -0700, Nathan Chancellor wrote:
> > On Wed, Aug 17, 2022 at 03:44:33PM +1000, Matt Flax wrote:
> > > On 17/8/22 04:00, Nathan Chancellor wrote:
> 
> > > > In the final commit, there is a 'break' here. Should it be a 'return 0'
> > > > instead? Or should there be a different fix for these warnings?
> 
> > > The state of DIR PLL registers aren't important if the user doesn't specify
> > > a known mclk frequency.  The implication is that the DIR will not function,
> > > however that is already implied by the user lacking to specify a known mclk
> > > frequency.
> 
> > > The other functions on the chip (port A/B I2S, SRC, DIT, etc) will behave as
> > > per usual, only the DIR will be dysfunctional.
> 
> > So I suppose there is little point to all of the calls to regmap_write()
> > and regmap_update_bits() in the default case then, meaning a 'return 0'
> > would be appropriate? Sorry, I am having a hard time parsing what should
> > be done about the warnings, which are fatal for allmodconfig due to
> > CONFIG_WERROR.
> 
> Are either of you still looking at fixing this?

I sent https://lore.kernel.org/20220822183101.1115095-1-nathan@kernel.org/.

If that is not the right fix, I need some guidance on what it should be.

Cheers,
Nathan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CDE7E0
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 18:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6CC433D6;
	Tue, 23 Aug 2022 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661279839;
	bh=6b52WSZ0j72XRJq6uFTsXCAQc695XrtImOHOm6npeI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fCGqvlzlZe5Fih2wiCo9XuQ6bZuWQpS4Fkb5U9T0AaZAfFtnkTftjnL8OvWZ29Asp
	 WRTPf0O0fPAGBPJx6q1Lv0Z3hmboFJvyaFxbs5z0MTX/b7o74pGWz5HeJxdiwfy9n6
	 ZkXthBYrOmT36MUgDa8PmrF/903ZpdwLG2J8uQPi89h7asbfIvWVJ9ryQAlVk0mQOa
	 c+otNUMpaonl6T8AeR9I1YBiYmlcds+u4+kAwMC6BEo5L4/EGngyhSpy/Y/7kHtljd
	 YM4G4eG7gDn1nVmor3ffibw/eIgQJdh2yKIOlnhYLF89o8KCBTHv+jgxZlM2IIKrhQ
	 WZM6LZLiIS6Nw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Tom Rix <trix@redhat.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
References: <20220810010809.2024482-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
Message-Id: <166127983640.711152.15279532246364775048.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:37:16 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df

On Tue, 9 Aug 2022 18:08:09 -0700, Nathan Chancellor wrote:
> A recent change in clang strengthened its -Wbitfield-constant-conversion
> to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
> only be 0 or -1, not 1:
> 
>   sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
>           dev->gclk_enabled = 1;
>                             ^ ~
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
      commit: 5c5c2baad2b55cc0a4b190266889959642298f79

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

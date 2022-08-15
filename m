Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541563238
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 16:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD978C433D7;
	Mon, 15 Aug 2022 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660580598;
	bh=CQ8GnYQ4x+INFVVCSYPZ42+atVmQLvhXcUHF093NxoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Db3WCW7QvkizfRr3+w9C7o7vjJbRK9vF+ZSd23yZLdTZ/10gf0s8Pje+E39i0XbOX
	 lg9eCSB6p505XCQ9VjqmBVkzEGmAmN5X+qjPQkJDrDEPHf0x7I/I9LsnRbrmrQzNr0
	 PBtbtLM8cJwZI1bRn46zJkj/6tyu/74vsI7w7f5xg3xUpQQ88bqEvTdRS1kZPx+bn7
	 rEoQGxuMNnCpmjt9RmSmSZoMIUTh065hDwct9yo4qKx7MdQn4mr+D641a7sMk9lqnH
	 V607nOms2sSxp1ScIuqInvySqb4j6Mprows1oj/pBKxdrzzN40RAeycR4g4S5C3nlE
	 W5NhUgBLJtqFw==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
References: <20220810010809.2024482-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
Message-Id: <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a

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
      commit: eab9100d9898cbd37882b04415b12156f8942f18

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

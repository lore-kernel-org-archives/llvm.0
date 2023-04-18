Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBE1C02
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 16:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF6EC4339B;
	Tue, 18 Apr 2023 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834884;
	bh=KYDGQ9LC4dPkxsMX1LMYuetVwQ+YdQq+9bWbGBBitMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FAjdS1X12XnDLtdc2vxXiUiZEUSoRx5JQwgiqbIyXf5jNtZK+REYZ4mBKDmCmoQv7
	 0KQmMicHUPbbSHyIqfCjadsugLbUtHK5hG6ze75e48XCs0hBYzs2vlQGEz/NeEI71e
	 mZT5BYh4uh7RuG4gYtpS5A0risLPIElTJiDQsOi86KTj2r78ALN7wymPglJaVKblWW
	 Axe0NQA1J4qRT6ZluipdMEvB9XEtGJrz16VypAWyMbgieK6a3kn+G0kgMMsh8ZWgl/
	 yVAFnvVZfNg7/idwIYz55Oh9jLxw9/CRXRO+7yKAv+IAmnSPzBtEFjL4DTLRlbJAEx
	 De1HdNSCQZeOA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, nathan@kernel.org, 
 ndesaulniers@google.com, CTLIN0@nuvoton.com, luca.ceresoli@bootlin.com, 
 peda@axentia.se, javierm@redhat.com, u.kleine-koenig@pengutronix.de, 
 ckeepax@opensource.cirrus.com, Tom Rix <trix@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20230418120955.3230705-1-trix@redhat.com>
References: <20230418120955.3230705-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: nau8825: fix bounds check for adc_delay
Message-Id: <168183488148.87933.1461165483240440828.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:21 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303

On Tue, 18 Apr 2023 08:09:55 -0400, Tom Rix wrote:
> clang build reports
> sound/soc/codecs/nau8825.c:2826:31: error: overlapping comparisons
>   always evaluate to false [-Werror,-Wtautological-overlap-compare]
>         if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
>             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is a bug, a logical-or should have been used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8825: fix bounds check for adc_delay
      commit: 5f3d94eb7ae877430d9fe6a9aae7dcef6c3e5fea

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


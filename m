Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D534CFA1;
	Mon, 13 Jul 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965009; cv=none; b=D4MCTulNKaJ0gu91gLdDC5kcb4hh9YD39CNsvrpV5xo0huU0xy+wVXU3azAJe+tJBUZI2VjpW2loIKu5RIQ/5m6rlEQrA9pxPRj2/2n7rHZSWRlZydG4DPHpCwTirx9oLoJi0qi0tXX5UHFn/DM0yEcwg5bKs6NDz7Ypf7OjQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965009; c=relaxed/simple;
	bh=P057jC9FPaM1QpIBuGZW5fCji3GTPUliH+a3Vutd1+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dafx+Vl81mbD1W04WGWSW6aMwqbNsIh/EluekTH0QPy+NCWrmfnCpds650Ec90idt/YznJnn27pn7d1+p9pfJbeviwqN2wHXOJR678U+N8ED6lELMRufvIAK7vabN3Wn7kUBkKfshq+CzGuHEqOgl8FFMCWWE0UcsoyfBPjG1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgYD767i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgYD767i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F71F00A3A;
	Mon, 13 Jul 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783965008;
	bh=njim2WHT5WxHIE8jcP0aU98d2/NMnPyWD2ataeKNeCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bgYD767iOAqD+o/HzVD8r3YcbocVp1ZZCFm/zhJN89cwFdNDVh/NR6jLmwKeI7f9Q
	 vMtTuMMylbPVaRiEswZ8MxdB4IVuSkb5rGTb1S4n4t/SjgBfpnInNjsOP0T0eki7dY
	 VTt/2U9KR/I0kq5gFKCJF8Pe1S7sVXtdBeQ6QxIyTPuOHPhKo3owTx7L66/Rw1KFrg
	 u1Rexw1L0DDHbedEYaZG+n5Hc656jnVh8eehddlszEUl9IZtWSod/FFXt+gM1jRsgA
	 h2WW9FJE6EtNB8Sy1JjfTSUl5UtT8XhWtpGkADEsRrcBo8/sGa7JXs1497lzQz9NKd
	 EInX38CNMR8Yw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260713-asoc-fix-simple-card-build-v1-1-671ad44ad1a0@kernel.org>
References: <20260713-asoc-fix-simple-card-build-v1-1-671ad44ad1a0@kernel.org>
Subject: Re: [PATCH] ASoC: simple-card: Fix clang build
Message-Id: <178396100709.7914.6074597279101348668.b4-ty@b4>
Date: Mon, 13 Jul 2026 17:43:27 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=broonie@kernel.org;
 h=from:subject:message-id; bh=P057jC9FPaM1QpIBuGZW5fCji3GTPUliH+a3Vutd1+o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVSVNpKQiY02CF01YA0vEXT83XOaqhmO03Y08B
 i9S7xvo8k2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalUlTQAKCRAk1otyXVSH
 0Jc/B/9HDnafccwsTESYviylgNe5p8JznTZhjDhjt8x8g+qmUnOit7mRWPklex5n+tA23977Wmi
 JkNRR/APogWRyvTuCYAhaFysCzB4AgB+hu3ED9LmvdhkTvoUKpMaGq+7geRnPTy9O6gMxvMRoEq
 c82VEkgmiYpvHvo8IZ2aGB6DPxpFuPJvOlF2+Xp0MAnor08EnYzDawv3nqKxSNIooY+czDO7by7
 DAAZAGBtnsC0uJGDW9/CyA+IEYZVggtn/xdzU98YUvDuDJubnZ93Iu+Hts/ZCg7W4CsgZORE1bD
 YnTOhxu52EVkielrXSRiLheVGLE5glQxRURBJvBNx6ZQQ7PA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 17:04:04 +0100, Mark Brown wrote:
> ASoC: simple-card: Fix clang build

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: simple-card: Fix clang build
      https://git.kernel.org/broonie/sound/c/a9a2c8c44b30

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


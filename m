Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205343839B2;
	Thu, 30 Jul 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426629; cv=none; b=IDYpkabRHhYas8mhuZF0Lv/0YLWPmQiTKDQTvbdHCSQ9OeKMClWnsJ6xT14GZuziIN9Y3lDH/TVT7NyXgbky4xix7JOMSJffw6vJNjOb1Gg7djoH4jrnv9TvarFMxWKg2zMq2RNNbHtqNdg62ry201zZ44lyLAsw9mM8aVWytQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426629; c=relaxed/simple;
	bh=OXB+Amvt4UI89mDC1CNYuG8y5B+vfWq/Ye6z1Da18xU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qPieGchvKgSQmap5S+jHwUp0z2Jm4GRKzajGGthaQQChp2no7bOD83QZgikLQuyPoGJyDM6o16E/IDw9btYqqFVxkUIhOpJFdfO/QCQmJ/wNwjdiO7thQuu/txMQsSK+EgfoYnIAFRn2u1djZhxBDoL8W1gXhQUChBSO7j4yZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqdKJ40k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqdKJ40k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210211F00A3A;
	Thu, 30 Jul 2026 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426628;
	bh=lts3poYN0q+4SuUXzbt8GNf0Q6/wJatHUi0CoDkkUCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UqdKJ40kGoFLU+mGv0Z4vmtvxFss4JQO3L74/9gonTut3Uw+U6jPN+13yqIMxTqmM
	 zn+EsxSOrwtygALWZX3UsIubgVky8C2uuL0Km8KcGCK9Jha/DLAUFXyHOFSUejj5Fx
	 u19C83HL+kDuTYDy++DahGOTOwmBBUdVedkNgqcSBh928eWEswzlBwuZan6+raNLyp
	 jPUDZZv3S7xFT9xkzign3IZxpjX00ns6eFpedQh5Nu6loU2VDm+TcXc26hrAsH9Gcc
	 MuUD6zZV5AUbzveii7iGxwssyO67NFwljo5dYVGfAvBXNHTOBekiYmt2kTtxANTCzZ
	 yetTSc/wVpoGQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260721225442.817787-1-rosenp@gmail.com>
References: <20260721225442.817787-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: dma: use platform helpers and devm cleanup
Message-Id: <178541397313.81171.5927385255562929260.b4-ty@b4>
Date: Thu, 30 Jul 2026 13:19:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 21 Jul 2026 15:54:42 -0700, Rosen Penev wrote:
> ASoC: fsl: dma: use platform helpers and devm cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl: dma: use platform helpers and devm cleanup
      https://git.kernel.org/broonie/sound/c/522d7baa39e9

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


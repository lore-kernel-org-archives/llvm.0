Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728198;
	b=SvgkhBA0aEQ/lPQpvxrvimEwed5uIqGifhouGzbf5i2avNhJ9TnksID9BfryQBtxM8fK
	 U36woN8IGT9g4aV+sa9ieJwiQ5RXlmK7ty4+97VfLGyyy/gHw8qRP8JDkYnMQInPuFQ1V
	 WhMjJMivZ4eJ56b9aeYW6evLYR0FM9khNdhEsoqiJK79s5ZowGa2QdGuA2U65yFVJl8NG
	 C7X2B5TCeSZgr8yzwfJJe0x58JJpQa/XVz6mdamSbWxL35IlGmt2knEQhoPqPWlbtBRYc
	 rcdptwyG1ozTxvINXmNqSfQVl+0LE3yuZt4WVrKZoj5uR7V7TTPhCIUV9ZAp7ijk1tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728198;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5Kzpid4RLm/541vknBbiSpsgz96CflLOK7rHjgv23pI=;
	b=jRU1m/3JxFYNv7+4Ch0DyQ5U6pEclSAHEfKHvQmzdFndKBTv2XegYvuOTilbmnyluTF1
	 poGR2DuB3iIxMxWIle3+L839eJIZYhNgAMCD1JqR44oUsdcQkQDruqjR0gQebUIMB4Pcl
	 Q6HCOLmiaXh0MTlzmsHbdKfU6EbWAr/YfW1hbA0L0wg42QBARDjtwhc98+6h5bOkvfUSY
	 OCs9AyQBVhUe6cgufrNpUJAZdqfVPZqxzMd2O9nbcmu2M3TuRgJmTIMvoHWspNbVYK7zQ
	 YK9QN/i6Ihy995mi2dLgnV2KTO5oicHiZLnt/Lvk9P8i87jsHgA1fCKlVcowN7myE0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCaiHIt6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4BE606A31E;
	Thu, 26 Nov 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCaiHIt6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2B61F00897;
	Thu, 26 Nov 2026 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728197;
	bh=5Kzpid4RLm/541vknBbiSpsgz96CflLOK7rHjgv23pI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BCaiHIt6JQl0pKTeR7oir9kH6/VRwOk66jC8Lakml5kQXxM/bsIIulL6wNEiFYTNL
	 v7c5FpxDbbQROOP6Egyukx7h6LD0Ef38w09+5qGiT9sO2+aOxOuC9Ojpb2Ie0Xxkzf
	 b+wnzDj1eiFI1WOiIfYoO7YvAFYWS/pQJa3w0COFDMzDi9ALyxjEqyhWHPKWg8s77a
	 NRdRxtBcARIGZlJ67E5B0clv2xurFlI3SiWCSM7MOjhIoUoGINhIIiEW8lXsUO59TQ
	 utoBiuD1GLAmTPn8kQtSijHrtY44+QY9I+eVGEm6kcSYRFGWABr00qrKEQrcQd/5On
	 x4Ihv1Wn47D4Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Elkin Cruz <elkin@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, irogers@google.com
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
References: <20261120192237.2870582-1-elkin@google.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on
 devm_regmap_init_mmio() error
Message-Id: <179572175011.838304.10101662458233835065.b4-ty@b4>
Date: Thu, 26 Nov 2026 19:35:50 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3p1Ore9hafy1yDB9rebMEMzGAj4tc6cIfEocpWtEBT4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5FjsybN5705/rolj9xORgjeXptw9ufuP1qkqbsTAk/
 8VZrqe9HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE9gQLk4BmIjlVUaGxx++dvV2X39dtkm7
 Tnst18HwVXHca796TZoocVB527bWWEaGF6xpOw+1WFXt12dbe55x5fwZSw1nPbt/f9OC24vOLTJ
 8wwMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 19:22:35 +0000, Elkin Cruz wrote:
> ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio() error
> 
> I am trying out a new Clang static analysis linter for ERR_PTR/NULL
> handling, and it flagged this code as possibly buggy. The findings were triaged
> and fixed with an AI coding assistant, then checked against linux-next (not
> runtime-tested on hardware).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio() error
      https://git.kernel.org/broonie/sound/c/4d5ed6cd0a14
[2/2] ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio() error
      https://git.kernel.org/broonie/sound/c/18246650ab69

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


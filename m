Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540662;
	b=0ZNI+mS8ik81ZYUV+thJ8ni+UOmPkzhHsr4Kbm1g2b6Rts47V0n83csT7GehmtF4VCE7
	 ALWp+k0AIy9A1T6u6+K0XzvkJhGDXYY0GtKndEcMx96v2rFOMwag631EOd9ENhSJofmGK
	 dhiE0Oin3V0U/WJ769QSVZ64bbgHmHQESNoaZuWuTq83jd6Zf8+qTE821fgJEl0chUT3V
	 FXKplXoNjbj/SK7EwHfY7syp+QuuUC+eP/S7ZeDJxLguRQ63Z3I4TNSEKcE4DQjBNCmW1
	 GYrlqGW2H0H2K8+f0DrX6n8JDAugRtZ9OyAFtk4eF950UaIeDOs4CbGDKY/AfMLJUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540662;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xx14778ekaPvlXPkdQ/6EQ5XfnTILF6S2y1VFMUAVVI=;
	b=qYfUOdFZHHBQZdjhdK6vm0jJbSH9IPEDkWsEty2jgT3cik6Z+TJijvAD0Gca5kmOnKIG
	 lfOXMuTnr5nlYFzUPgE5WU2hDRwJwPoChJxjFBLclqMn2mt+n/w3JuVVTg32fW9QUPm3c
	 85nEgVdxE3zhstIjAipokmshwaY4UlRBYyTdvirX/jnUquWEtn5w9UfxRcmCSVfqDUrZ8
	 OmKGM7Xden/MGQgIYCxelA+IqLSd31UcxuvAIc9B8wwPkC6K0l4Wniy06W3UYOEWNAzcR
	 Nswc1RWOvt2D4Wb4tFLuISeGuQJRahuhYA6FPsMQwMWu+z9VLxAWJURUdz0cYLrHHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKCsQRE6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B38606A321;
	Tue, 24 Nov 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKCsQRE6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0177B1F000C0;
	Tue, 24 Nov 2026 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540662;
	bh=xx14778ekaPvlXPkdQ/6EQ5XfnTILF6S2y1VFMUAVVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hKCsQRE69owzKioEPaOendnj8oynVHfJAjgRU/7AxBKqu4/I1SXUh1nutfmjITfPl
	 i8lfWVHRBMJy9BuQzFOgFFdtrzRPvRH5gupq1ylI7AL9Lu73vnrlgw9s+fnqxl3u/E
	 YbeQdVPyvMEou6nWXE0SFe7Dm+EczekA6OMRjrasXUB9zBZGclgWefC5etVnTZOkT/
	 a2fEtQcvMV8H5vb7MewhsJDToOz2zre7fzIi4korB/zSvSz1PffI6zXROP3sbk2N+n
	 zHtmL2W0cadGqDvhBt7KnzvaluziP+FX4vYK1t4sgWDWxLGp9Wqn0pCQgpbqlvonaN
	 KRNxZsiWysNQA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ian Rogers <irogers@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
In-Reply-To: <20261119171105.1538194-1-irogers@google.com>
References: <20261119171105.1538194-1-irogers@google.com>
Subject: Re: [PATCH] ASoC: tas2781: Initialize subblk_offset in
 tasdevice_process_block()
Message-Id: <179552987357.264265.5488292379151147418.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:17:53 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nGEyVfz/co3h9KTwLtkLoTtGf3Aic4alZxuPJX3stac=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZj23SlTAIO81/tKi5cZLpvs9iOuovpBiO7LnK63nKs
 3zh5NkdHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI3FJGhhfb59z8J6XybnWG
 2sRVggf+Lo6cMbedZyXD886729QnfopjZOgVamYRj582/6HSG+2tkRctFq46+O/j2l137D6b80n
 VCfIBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 09:11:05 -0800, Ian Rogers wrote:
> ASoC: tas2781: Initialize subblk_offset in tasdevice_process_block()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tas2781: Initialize subblk_offset in tasdevice_process_block()
      https://git.kernel.org/broonie/sound/c/e68e710ecc89

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


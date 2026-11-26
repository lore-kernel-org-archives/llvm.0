Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726316;
	b=pvreTlTjvxtZ5+ZFCgbsxnHA4Sb8dsilxryqu/GEziKrYgif9fUe2wKe5rSTDkHR/Z3D
	 wO9/22CjAtqGnM92yvO5FsLNffxm40wsZeyEw4vCuYe3GbvG9Xvo68U0rQ0iC9rdOcJlG
	 OQNFZowuc4dsaXdWgQrOsx3YMKfI7nIa53psuerLxWX49QRwmFbwXz3tZeA+hhXzJkOiz
	 5YJ709FWQPN9uAjFWzSRVBgqBAQanS4WqE/ILBEWOrKlMoD6k2kcYNe8rWzi6WTZn7F6s
	 Qw7xct/BnLcky84F46SBfGHh0hbkdvmwU+QjaksjXJHNtCgeWx48HMqtFH9QgEh9lIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726316;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KKiKSlRn1CU7D8BEs2u/rf46yHaLNGj8ZGPqKJfIU74=;
	b=I+sCBmFYkjdyilv9+u0Gf81PLFLDCwmUq7DHCD9i/0DvFZrXvLcY4aWTEDkHSCPpQxw1
	 MEEagVSnedNyVMHzD3HNpSy0U3TRBrXOKT2meWq10Q3cb/mkqR4S4RQa45JY19Ls3UaSt
	 BSS8dYVEww1W5IloaGn1ODTtkdrC4MUZF4M5GKImpANfbPloNOkCAeaCGPur3GDVeHQC6
	 xKTahEVMQCwmG3VI0rJn4DsEvbRXS1Z3jCmadQmOP1UoO+C1H6aHNv5/x3SqH5bkycKWQ
	 XtulAZ9nguytJol/EgZP7T3qz61qI01r47j31Ur/VLMqI5JvgbUj2R0Ksm9mWAvYqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLhcE1N1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981C606A326;
	Thu, 26 Nov 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLhcE1N1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C897D1F000C1;
	Thu, 26 Nov 2026 20:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726315;
	bh=KKiKSlRn1CU7D8BEs2u/rf46yHaLNGj8ZGPqKJfIU74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OLhcE1N1RgeWA4OTzqUAP7J1YyEASOA9RiMC9OEhRUGtodDF/N4mQyBT6AoyzHuLL
	 FplKTLpI9vzhrtynjOW9xxK7YmuOy+vF8HquYkaDzNnxEQKDNdCHOWbX2sprVlXsky
	 VvWLFHow0135Nw3TUzZTvPtvJAMBCU9Oo/b4MB5cYR/yDtEQ2GkVkbW+Rc0AHKvii8
	 Xv4svOWn7uTdUFTHbwxPhpU8gwoADN956HcaX78PHvdWkY8XpBGlLRVs3IpmOzAFPn
	 hpd17q4PGuoZG1NiZm5H9JLbLwUg1CDioa3elf61LpkvdUFFFgMHkwa3a5dv3Ki/S5
	 tsTxi1FyXukdw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20261124231245.271869-1-ansuelsmth@gmail.com>
References: <20261124231245.271869-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ASoC: airoha: fix objtool warning with memif probe
 loop
Message-Id: <179571856562.838304.2203550575744012531.b4-ty@b4>
Date: Thu, 26 Nov 2026 18:42:45 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3JMk+PWdk5sr2Qtcs5FeE7WS0AzMKSIzn5yM4hGxNww=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Zj+bsH+igWQy93avXdLH3wReeLXrcGbX3SmaYXPMm
 DIOpvb/6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBExD8xMqwtKdz1YInQRO41
 /2Qb2352eu4OnM0ZUXFn66vf+9L+n5vM8L8y8IfQk6V+lyUOdeZI+bWFX9RMNVJtUM24diI73Un
 iCz8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Nov 2026 00:12:43 +0100, Christian Marangi wrote:
> ASoC: airoha: fix objtool warning with memif probe loop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: airoha: fix objtool warning with memif probe loop
      https://git.kernel.org/broonie/sound/c/61914cb2002a

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


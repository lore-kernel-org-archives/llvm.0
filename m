Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620165;
	b=09HnmNJbenxDmIEJ+hj1wxldF4o8lEsp09Y0Iqudp5VH4FzII4LcyPn6km71o+YNLSwX
	 hW1gLAOyL+b15D7C3myZf4Hgiz/2jinS1OfYEnCdtOnaKHLQqfCORYnG2V7YLGJjaNQwG
	 p6mN84eD+Q0KkwLDnngtGET60b1Jbj6nXnG3FBDvozxrNP4EM5K9cpfco3il+3MPzrBtx
	 G+bOXnIDNQifMcvcepu0GbUKaKZo67enLjrU+tGcXPgWuXp/f/2+dX5G65IcnrhhkHUm8
	 MxWl/fxRay6b43yqQeOQmtGtMqoSubd+40WuhOmMIAf/JsKDjaEEd0fYULMGURoBgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620165;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6GSg/jLsN29tre5kcZSyHYsaS369WhKvfnM4vNbmqC4=;
	b=x1pZy6iP6Tlbr0iuH2+fj26H4U9R3MBXQamzXDb7h6zid5oNLsFrSZMKKkD7CRpcAH6C
	 shQtvudZ2XGbx68pR2AgOQUCTRfVRIx/TrPV3dyG4T8XtuvKwhsyA+V+Kit+ywG0Px4xm
	 ZvYUcdJ6oNH5TxN/x5FyRqCVZhU8cKq05WwCyr0Px668MzyEJ9QSLldEzaoFwOc/J5E99
	 uRJDzxZKXDVc3+HZuP+mmhV6VMU1aeS8Q3mUbScsLgpRKN+7QamO+7kWIFdT/6ihl25+B
	 jW9MENL7Q/by9fCFatJyqZN/uNV7fyvZ7zoFGSPeBxJ6X6xkF6Q6DoBfHko8AKJ/Kaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f/qK01bz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE819606A688;
	Wed, 25 Nov 2026 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/qK01bz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BA31F00A01;
	Wed, 25 Nov 2026 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620165;
	bh=6GSg/jLsN29tre5kcZSyHYsaS369WhKvfnM4vNbmqC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f/qK01bzHUyDDeiTBo/kJ+oJc+8tLLn5lqj3TMdelkNMNfVQnR77kanE7SRbUYD0X
	 cgDZoWOIUWs0RG2dA9fuRwCyo0ObFwsvclvJIcIGwT4WX2XsiAAAClh+zfJWwLVCgI
	 TjurB0ntDfya+a5LXXvrCWIu+CllDbGwMa1dddBXgUJpFFMXfjgZCwL/xD8OptuUeW
	 4X2r/hmpPCGZVpH32quxqByqLthhk6uNruY6gykvkJcJ8S/JCcmbI7o4us5WbTjleS
	 Uv5QAjawlUWR28mIhTL8F0A7lDaIHuFYvm0h67xvHYsFP5Lpe9hmbJvgCUptnH83pr
	 pxW6lDjfu7g7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ian Rogers <irogers@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
In-Reply-To: <20261119171059.1537658-1-irogers@google.com>
References: <20261119171059.1537658-1-irogers@google.com>
Subject: Re: [PATCH] ASoC: codecs: aw88395: Validate 4-byte alignment and
 init ret in reg update
Message-Id: <179554902677.947306.15693529746115817043.b4-ty@b4>
Date: Tue, 24 Nov 2026 19:37:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0hTnNHG4RTo/uFcq2aIwcu+mFLSWwLBMdCg+YvkFGjw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/jrdfjDR4EaI6iTzj+77qqZ3xbXv8lx8UtJ9khBfU
 4HaJs/GjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzEIozhf8K2NzMSqhVX9gT+
 FdlatfEba2bakdsrbln9rNWYdG7RhRsM/8uVl5+UbjTnEpp25+XJ1ERxli9NzzfNnWFivTjwZ++
 8VHYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 09:10:59 -0800, Ian Rogers wrote:
> ASoC: codecs: aw88395: Validate 4-byte alignment and init ret in reg update

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: codecs: aw88395: Validate 4-byte alignment and init ret in reg update
      https://git.kernel.org/broonie/sound/c/e5c608dbb738

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


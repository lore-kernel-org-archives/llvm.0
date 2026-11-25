Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626294;
	b=v1EyLi9H6FURZY9AxRq/r39hxmkTqWt0Olbx64FB4GS67eR7wEVn+IlM8xCH1025GMZn
	 zl1U7I50USn8vhFE2kz7d8L+0IFho4Pdb5whW9mTXPVdYH9aGmN4FjSHOnpGxC+89oeJW
	 0kfenAhDp1E6g++AfECAf/iYHf7VD6MHOi7Ip5A55SdH9tM1H9BeuoS6nQfSPE5u505OP
	 vMPTEH2kuTflTuKRThnpmEdXEZznGqOnL2UZbQ7RPqRVDt/0cEqGQFo+G60V+Q4VmPnYa
	 xdjipVwPS1NzQBXoIHl4+FmuyJ0xX/sOMd6cD1z+xMt/WVKLxOXlWf1HNXSHbSuNfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626294;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lwMyyLlgAulcgxUt03RSWfXx+IzjN/eAWiZQJKqrsSM=;
	b=wwfSoPfhtM31Fi/biC310Ar0zDqVUoMLbdJSq3HcspZ39vMExT9wd2mSOUdxxHEHtNE6
	 iDbOFlEWytYi+FJV6PZJDqonyWWmmIVd7aN6u03Y8FrTpURXWpV0FmD55T1PF+d3eKw8n
	 T0A24hBIgYeDXx9v2nQd9ZHDdgqkaTJ2a3Aani47XS7wEtVk/S7HrQ0NsI/M+WJVbBAJp
	 DkDkbV3usHVdg3CKJEI6EbLzAtHaESTfaxnwsFpZwMn2wJi2VeVnQYwXPEcaRsaZCjeOc
	 sI7VfZac38jcmIWniyVmMFOgwf7stVhFPwo81amjWOtajGCsCRuqFjKNpBAwq8G0asw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mKl/Af1a";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F7606A31E;
	Wed, 25 Nov 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKl/Af1a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506F31F000C6;
	Wed, 25 Nov 2026 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795626293;
	bh=lwMyyLlgAulcgxUt03RSWfXx+IzjN/eAWiZQJKqrsSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mKl/Af1a4mmdiPtOcgs0n1qIh/yOPGMwNpXmDDvBHZYxJ9k1dZy8JO/uVzeYTH2xw
	 r/5ehcAxQGM994bmcpzecpRt7OGdTIhYdwuKCjZApMixrEuuVrXRqLqfh5yhb7OhHC
	 4Qu5hqY4gjT57w07sAWa0GZ5w1cxn4xBmIiMRarsxHPj5rouTfEAEyobSieDvNHSO2
	 8HFpHdk1kZxkwsnKnXG4hDOPX7zIIawaBzCYVxW+DtV9iD/G+JwKrMM3UbXm68j+EU
	 tqe0HwUOKf2lPwftmI6XlxQ3eK8gFKSl9kh2F7xP3aOY4u5ZYVUL8Aj8jqg9nsvHYP
	 awt6xqtN2j+xw==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ian Rogers <irogers@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
In-Reply-To: <20261119171111.1538575-1-irogers@google.com>
References: <20261119171111.1538575-1-irogers@google.com>
Subject: Re: [PATCH] ASoC: sti: Return irqreturn_t instead of -EPERM in
 uni_player_irq_handler()
Message-Id: <179562185577.358726.11130362629711779852.b4-ty@b4>
Date: Wed, 25 Nov 2026 15:50:55 +0000
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
 h=from:subject:message-id; bh=G6V5Px8etOi7i1uRKyug+BSFpCRLBg3BjTNTRb20krw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZRY10zP1y5Sfp9ktF/919sSDs380Wd9a4i+cfRC/gZ
 OK+9n5ORykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZS2sTI8NSj5NAxvTP8hS3z
 e16+fViZ//fxNdfbN4X7/e0vsqhdXM7IsPHB3EdGpz6zcVTF3Jt4dH72tUbN668/cV/eXPjjddN
 /Bm4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 09:11:11 -0800, Ian Rogers wrote:
> ASoC: sti: Return irqreturn_t instead of -EPERM in uni_player_irq_handler()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sti: Return irqreturn_t instead of -EPERM in uni_player_irq_handler()
      https://git.kernel.org/broonie/sound/c/83e20d3e0d11

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


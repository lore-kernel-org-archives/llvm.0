Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310691;
	b=DBiVviEAvdQkNxw4qSTNwmFIC6YNeuYyQtrMqgJcxFu+2BqtBM33PukPlx1h3FUuZzr/
	 p5wCWUnDKepbBcMn8/PDRWWOXOu1seL0uCzF99X8zxzyxWR3GpTy8IixCkrrR2k42sqCs
	 RiwfJER0FbhEEBAD93wIhHhdHUtWaPA7HW1sm4cx1o4H48xBvlbNzE6aA6ZcKBxFuUDEy
	 I9OZxdChgOPl7gij9PVD7NrGFbPEIx5IyEcJuI7qrDVE4OHBdHGRiqCjOektCTry+CtQR
	 T9uPDk5soeaZkbnItlOkc0C125LCBIH2axIoOULzp93SgcPa9CdnFUQoI6Zt+bHyB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310691;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=T2P/GAEk2otkWq/GcV9uWXOrUgzcWGATJfy8p7qWBJg=;
	b=s9VfJOlmV0ve1IOB7V6wHDLQrsFsH8fxTN2nn4fT6eWL+MkwUAvk+llpG7+V1lMo9BVY
	 IEP35bZdKnatkTg2aMhXsn+uRgX3P1dWyPg7r01ay8HHUEMwtqnMiOWRKFq8nFDfCxw7v
	 fP3EeaJlQVhbOJfsGqRjr5i2F+mfWfwiz7dAk0p7crO/XkOTvfNqRncEza7FLMMMqF9uY
	 2g9PgOiGo7Y0OW7VxA3G9jfkHQpKryPWFelugYAIRxxoVvANW6ydlkOHlFG1QzG03y2Ne
	 1+SN8xI7iICZ78bl6w+YBVivSFO7kDAVlMSsnieow44QmJmi7FtDerA41Qys1SEzGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=birImCg0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67C606A32E;
	Tue, 10 Nov 2026 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=birImCg0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D351F008A1;
	Tue, 10 Nov 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310691;
	bh=T2P/GAEk2otkWq/GcV9uWXOrUgzcWGATJfy8p7qWBJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=birImCg0ikfZlgymBPG1EQOVl8T4PvzPBJE3IkYSwyCAjX6vQwI65u9dOTVAFVIVt
	 Jr4PKTv7nmKwXrj12EPxjnX54EDhza++N11jzeedzWLJV9phNHoC61SgwtI5RgdSk4
	 IfpcIAJO3N+NPz4LziHzOcsznefoB07i+3jUEPXTN5G4V1f9MsFSrznT9QDgUE7DuQ
	 3V+rvquAaKTbafZOKdinMDkCmmpo8zf65hLVbPMJFgHEVANzwn2/5aCC29En6T6hn7
	 CMdn/xwxsklmImZWNlFx/SHbbnF8177DN3zJaSqolLxcAVpcgCeE2wzIZnqICN9XBt
	 tR3aHyt/+QvvQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8F31C310B6B7;
	Tue, 10 Nov 2026 11:38:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, Cyril Chao <cyril.chao@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
Subject: Re: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and
 HDMI jacks
Message-Id: <179427281919.3711751.4669554819271995706.b4-ty@b4>
Date: Tue, 10 Nov 2026 01:06:59 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xSnEnBaKwOzWyBQ2Svyhe7l3mZBvUNDHRGh0ZFk7WrQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+Mym8lqtfYThp6fRXYmfMzI33fDycuu0Jk+H0d9lhQ
 XmlDznWd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiJY0M/2sPbpk47aLHqofX
 W4U25uY2l8zgm/+B5dSUBZefJKR5/xNg+KddJX8xILc3a89Rkedl/yJ3G1wVVzfiML2b9s9fYdN
 CEX4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 11:24:08 +0800, Cyril Chao wrote:
> ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
> 
> This single-patch series declares the MT8189 DP and HDMI jacks as AV
> outputs, matching the status reported by the HDMI codec and exposing
> the video-output input switch when jack input devices are enabled.
> 
> It is based on ASoC for-next at:
>   c937f492dd40a8398d955cf0f4f9e11d7268bcb5
> No additional patch dependencies are required.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
      https://git.kernel.org/broonie/sound/c/1ab0585e7609

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


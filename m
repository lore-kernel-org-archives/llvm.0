Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539698;
	b=goRykpLxJ6oetwLE3IkpSG0EhyFJPFCJmx6Y7BeMTfE0kJPjzHUaYwvZqmAix9dTSjk1
	 6PclqSXxWxpOAQJMahMlSdMxLYDxvVhxbacOHklCKY+vFQmi7glflLcShNbFenpLujwmj
	 YF+7TowG5lT2m7p6NMql0pMWxGcOF6JkKS10tDYV3XJk/YD18HGIfGzjr9ZAEQuqIP/6e
	 /x1564jItszGu+JTn1oF6Pn0GEJQMf4Munnn0b5V29pbtO/wE0W9+q7Z9O8DK2YcxZCb3
	 d/ZuKrJd28/FeD8nuq97rtdIfsLOPc5uwH+CVrElcrNANy0KPnO5tYY9QHRLSyfy7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539698;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TSC3I1jV6XXplIRladDooc3Vpn5WRNyjJtlSE+XfShg=;
	b=pzBkCFdqReVIiiK5gR66MksGDPDey4+1DlRt+Syc+c2g/X/DZ+K3+Kbn/V11Q5Z3Q/PE
	 VnSbgz/xXrVMt/dNPb+/O5OOCr0mJxcsClXqb1qoHBfrgRLbm9lyDvIuMoDbnSC+WNQw6
	 7MMFSWGhGgCXFWh0zrQiUmJHtyk7Oys32D9Zsq4elQYOPgKpX5ja/XWFGZoaGqdPAazwY
	 GddmfjE5ZMaYc99gHJNOsaTe9sw2pzlk5Bp+wf8x5TE+wzg61hgaADxg8KJLkoRdHVNwB
	 iR1YF8RQBuoGG60BWZZi2ajibqYWLt/OZVCU1RxwtATZT6k8b6podotl48snGsh5P6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARqsv9yf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD23606A329;
	Tue, 24 Nov 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARqsv9yf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CF81F000EC;
	Tue, 24 Nov 2026 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539697;
	bh=TSC3I1jV6XXplIRladDooc3Vpn5WRNyjJtlSE+XfShg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ARqsv9yf2EGzPvTs1MhR9e7rOUVCqNAbZPezGgGlIUuIIev7iKQ4EvZo2kiLx+of/
	 ovRjeWIqCBQmSgx3lDU8+KX5UD/uYI26bCSU2ID5TIp9onQYINnJiROvR9YQWLHnA7
	 zVwrKpsTrQLImDhVSYTSoLnsqgE0lZDprDsircr3ELgRd5Vo3r2RGsabDk8kHiwzW3
	 tNLjZvrVmQ1zH2eu9UWXo418uriZLDvfTkiCT4OCaa1I+v4B6zxp4oh0PDu/YY0J+X
	 H7qyCUkrTjNZUKRS9+SL/LT3Nro9F3W9BR6PS4OOQaaTkYvYkNUZbIGu22CjLNTO0p
	 20s4Cpd5VtZ7Q==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ian Rogers <irogers@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
In-Reply-To: <20261119170656.1522183-1-irogers@google.com>
References: <20261119170656.1522183-1-irogers@google.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture
 Volume handlers
Message-Id: <179552861373.264265.1703969548246755142.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:56:53 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jengUeSknPKlTWf3tsSbiafJDZ4Gc9dYOlckdRA9Ero=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZD71zCguY9DrprduTaNHJOztPyc9PFZ/45q64e0bm1
 ckWPy1/dJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAir9oY/nDzhbGxlAYyWGq2
 rC06nZtt6Kx3/uczj62TvouHO/t//MjIcPLsBq5qrofpst0brnAZPd2XITo5d++E1gSTG5+kpfw
 EOQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 09:06:56 -0800, Ian Rogers wrote:
> ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers
      https://git.kernel.org/broonie/sound/c/a61c6405b2f9

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


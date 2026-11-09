Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225548;
	b=DaHJEtapAIblSC2IIwfafR0Pkq26OKZ4KOQpZd9CHvAYEirkKiaW4arJ3mBnF5ctjdss
	 CjVcYy+5lzRgMK6UdEdCrItlE1PbQI7GYPp+myIrDJkdTD+e8NUr7rUUQk8iKvrH/wl8v
	 JRawDuV5SxvhfSAQMv3OwQUwG7T2h1ZT0ljIVyMUc2A91rG1Q+5mu7M5XAYlrksgFBo5X
	 GqGXzC9+5psgpbZe8C5sBb5zIqDWZnOM8sKTvoBMprbzHq3ESq/+cCQ6OFmdosaZVq9kS
	 G4Nimltld0tcHQic4Cky4/YjcqWJuwVpRy6iFyLfBQNcmoXlf9Iw/rI14GWt3+oXbGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225548;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=CjOvZKlvZft8qBVkpgInrkwiduQn9vDLXCRBkO1lIrI=;
	b=wsNnClv5AwGIfIlq2H5b2tZnKxN93Uxhm1IB1BErwINwvkQfd9ZngHh84Aec1VEN/hg/
	 EV/hvbMxkOotiMiPRLKdBMTBDaetYmbKBR1mRSVx0Herw4kBkJ6zTX49AfiRHVxfZ1t66
	 CzS//JZtbmdIdsOzJJzxc9Ux3ug8kWHJ6zrWlWIrja1Swrn/reUS5qAwvDygncy4OYhRF
	 LArxZgqwy4cyEMnxUwd5RXZUYa63w8iW2DHAadpf7tF+nEm7MzZUywI6JHPyHVMKE+jPT
	 5hGCPJR0ZEyg/I03otFjwAIC4uJSePgV9KgL3DGk+K/GZxdXtPLsqrgFuQrXWvWd7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqQKiMKn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABB606A31C;
	Mon,  9 Nov 2026 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqQKiMKn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC7F1F008BE;
	Mon,  9 Nov 2026 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225547;
	bh=CjOvZKlvZft8qBVkpgInrkwiduQn9vDLXCRBkO1lIrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LqQKiMKnWUnThuvM6vcThPSJ4kddSJeQNoYgTNVLXct71OrwG1zaWznekW2i6hQUc
	 Qiij5xuYWbfMio9OLPEeDczGJm/cIQf2pqUznQMjIYV0nE4u5+pI9A2W5myaYD/Jxo
	 MFmFd5XDjv3NoN494RQG9p8eG1ikn8U0xl+MPbmzAIxMlh1ZeBaCPIxSydmJqhfMyi
	 YR+QZ8MZ0j8OvsHF8V/K5LuPoNAx1ItX3PkYOxrj/r9O4wdBOr2GgN1fY1VmRanX95
	 owCdLypLmIwjMfpk66ZrSgEbiOgSaoOWq71f8Mo3x6id3ofgn5Ra1+Hz0xFFnYQtcE
	 iSEKagEMLNbSw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 79B892D3F6C2; Mon, 09 Nov 2026 11:59:04 +0000 (GMT)
Date: Mon, 9 Nov 2026 11:59:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI
 jacks
Message-ID: <d92ec73b-9a75-4301-a0d3-b849c3184673@sirena.org.uk>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+9r/ggjKvtaRv5j"
Content-Disposition: inline
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Cookie: Whoever dies with the most toys wins.


--l+9r/ggjKvtaRv5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 11:24:08AM +0800, Cyril Chao wrote:
> This single-patch series declares the MT8189 DP and HDMI jacks as AV
> outputs, matching the status reported by the HDMI codec and exposing
> the video-output input switch when jack input devices are enabled.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--l+9r/ggjKvtaRv5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavG1gQAKCRAv73Ows9A4
iQbeAQDm+zJK/irl1t6ZLB+k5GYfuInzTNEv71Md4KEhZ9z/9gEA1QrY700airU8
muU3Y6OQLYfWh4wxCJhLygKL+SWfhwY=
=NFhw
-----END PGP SIGNATURE-----

--l+9r/ggjKvtaRv5j--

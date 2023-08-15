Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2D5C9D
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 14:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9358C433C7;
	Tue, 15 Aug 2023 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692108632;
	bh=n5ZUySZEZiqsQq5qoUoRbN2WfkDeGQmpgZO6gsSVgNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvMT8JcnQZj7OZmeLN4OT/RqwDIhHXrGoPSW8qC8zzDbSsyIch1Rv8GKkiGY7DkPR
	 cTIoVmCUU/5zjeeHADYvvuuQj08CU4VD2TJzinH8qRNYMwz5N5GURwwZOEEEHZvLAF
	 yhp3rpbsL8tMQsulZwbJ0sENQc81fWY7bx0Akhhru9ySYSuq6ewC9rTw4fc7MN6ba4
	 X2wCXy4KqRNvCDqJib5ufDckzKOScVjVxRqL79YIvbS6bRSYsVkHm0ojoRA8he0zqs
	 r2FeqkPyvPqJ6kl8TLFwdtJJ/1U0z67s6fDCkmZ3ZfchU/GpsrQVzk+pxlx59NNXRx
	 OZAGmxg0PGNqw==
Date: Tue, 15 Aug 2023 15:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, llvm@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of
 aw88261_reg_update()
Message-ID: <7b35b3b6-7eab-4652-9a16-851a060350bd@sirena.org.uk>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vj9n6GWKkaE+J3Ue"
Content-Disposition: inline
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Darth Vader sleeps with a Teddywookie.


--vj9n6GWKkaE+J3Ue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 12:47:43PM +0200, Krzysztof Kozlowski wrote:
> There is a branch in if() clause where aw88261_reg_update() could return
> uninitialized value.  Pounted out by W=1 clang build:

This series appears to have two copies of every patch which *look*
similar but I'm not 100% sure if that's the case or in general what's
going on - could you please resend a clean copy, it's probably easier
than figuring it out?

--vj9n6GWKkaE+J3Ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbh1AACgkQJNaLcl1U
h9Db2wgAhKl6awfKbl76YkckQHA0qEwrCC3ehM9pJoMcPKMh3Sc9f3FMZrk4XmRg
sPzgcu1JgnUD/G3svs82wur5Kocs8gpAxTiBPonVpko0iILOA6IcELf8Rj3sXVOL
jUS4Qz89yi5zhrTcEQwZm+9FfrXwmeeRNef1KnNHEbG+24KUPVWcRxu/mWfvTPk5
WFL5fgeccSniy5L8pWNC464fRdUzoFSLNxR7/SXtiFjoGbXGCDkRsGNAiMWskO6h
MuFOlNeK8dvtwoVNm06CEk1MWftPzkmRQn6WHb1YjsWU4akwwFXyDRLeTVAfmQCU
lGuevRFzUsBb2FxR8FJyuJOpeRpAfQ==
=8N2T
-----END PGP SIGNATURE-----

--vj9n6GWKkaE+J3Ue--

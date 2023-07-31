Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947A18AFE
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64906C433C9;
	Mon, 31 Jul 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690816719;
	bh=Q50MzpVmQKShkDddA+wpPlFfKFSboVbPTpXchnb6DeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cw1AN4sEbkCY5xbvYMock2xl3WqJNANZjWb0jPrZu+CbiG7XHSWMEkcafGIpV6voQ
	 9AflccHPF6GI0mzn46QhEv4VgwA9JgvNAiCCjROXTR8hVeO2WN+V4ZhXOd4t1aGRE9
	 p0wDSChdnpd6Cwipg7tiYWS6YO6JWrHeqznYE+JULoxRdbM5iBY0yqZJuOzAwsxQVF
	 ycX59BhKJsNyTR3Vohgsof4L7UJkcFPz5mVApNE6L0JjtJB4+nKzavqI9PYVi8JT64
	 3/DSmeCB1K1jRXxbujsX1cjKqsNAWssBtLLw0Fh8z2UHlakAZ3BNUeQz39sqUxzZw3
	 I5aiv9NwNQ8Gw==
Date: Mon, 31 Jul 2023 16:18:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230731-mangy-violation-b388807be1f0@spud>
References: <20230731095936.23397-1-xingmingzheng@iscas.ac.cn>
 <20230731-calzone-gratified-dbc51639beec@wendy>
 <90d97914-9576-42e7-0d7d-c752b5bd6a68@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MYBW3sdjBDT2ibnW"
Content-Disposition: inline
In-Reply-To: <90d97914-9576-42e7-0d7d-c752b5bd6a68@iscas.ac.cn>


--MYBW3sdjBDT2ibnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:16:14PM +0800, Mingzheng Xing wrote:
>=20
> Thanks for your review, I've made the changes and submitted a
> new PATCH but there seems to be an email thread issue,
> hopefully it won't have an effect, sorry about that.

Is there? It seemed fine to me, apart from the missing v4, was about to
take a look.

--MYBW3sdjBDT2ibnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMfQyQAKCRB4tDGHoIJi
0uweAQDTVPr61XcFSC3dLzT5u2GCzcBIT18GT/3MfmaUsXxiQAD/aCvFyVbhmGo+
3/JOuJhaJcuO4Zq8aMt2Vx4QctA8RAE=
=ktAQ
-----END PGP SIGNATURE-----

--MYBW3sdjBDT2ibnW--

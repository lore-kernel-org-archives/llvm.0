Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF92575
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 13:11:19 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 738661C0BCB; Wed, 29 Jun 2022 15:02:01 +0200 (CEST)
Date: Wed, 29 Jun 2022 15:02:01 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, jiri@nvidia.com,
	leon@kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 30/34] hinic: Replace memcpy() with direct
 assignment
Message-ID: <20220629130201.GB13395@duo.ucw.cz>
References: <20220628022241.595835-1-sashal@kernel.org>
 <20220628022241.595835-30-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <20220628022241.595835-30-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Kees Cook <keescook@chromium.org>
>=20
> [ Upstream commit 1e70212e031528918066a631c9fdccda93a1ffaa ]
>=20
> Under CONFIG_FORTIFY_SOURCE=3Dy and CONFIG_UBSAN_BOUNDS=3Dy, Clang is bug=
ged
> here for calculating the size of the destination buffer (0x10 instead of
> 0x14). This copy is a fixed size (sizeof(struct fw_section_info_st)), with
> the source and dest being struct fw_section_info_st, so the memcpy should
> be safe, assuming the index is within bounds, which is UBSAN_BOUNDS's
> responsibility to figure out.
>=20
> Avoid the whole thing and just do a direct assignment. This results in
> no change to the executable code.

This is just a workaround for Clang bug uncovered by 281d0c962752
("fortify: Add Clang support"), and we don't have that in 5.10-stable.

Please drop.

Best regards,
								Pavel
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_devlink.c
> @@ -43,9 +43,7 @@ static bool check_image_valid(struct hinic_devlink_priv=
 *priv, const u8 *buf,
> =20
>  	for (i =3D 0; i < fw_image->fw_info.fw_section_cnt; i++) {
>  		len +=3D fw_image->fw_section_info[i].fw_section_len;
> -		memcpy(&host_image->image_section_info[i],
> -		       &fw_image->fw_section_info[i],
> -		       sizeof(struct fw_section_info_st));
> +		host_image->image_section_info[i] =3D fw_image->fw_section_info[i];
>  	}
> =20
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxNSQAKCRAw5/Bqldv6
8hZBAKC61OU6j3kK9YHOuyC/wk2g70z80gCgkFZtqUnAGb/6paDKaij40KGND+8=
=w4BR
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--

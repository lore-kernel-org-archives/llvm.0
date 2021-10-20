Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22AE72
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 08:40:01 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-26-9od0xuhxN2eU-4dqV5Rppg-1; Wed, 20 Oct 2021 09:39:58 +0100
X-MC-Unique: 9od0xuhxN2eU-4dqV5Rppg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Wed, 20 Oct 2021 09:39:56 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Wed, 20 Oct 2021 09:39:56 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	"Nick Desaulniers" <ndesaulniers@google.com>, Tariq Toukan
	<tariqt@nvidia.com>, Maxim Mikityanskiy <maximmi@nvidia.com>, Aya Levin
	<ayal@nvidia.com>, "Eran Ben Elisha" <eranbe@nvidia.com>, Daniel Borkmann
	<daniel@iogearbox.net>, Jonathan Lemon <jonathan.lemon@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] [v2] mlx5: stop warning for 64KB pages
Thread-Topic: [PATCH] [v2] mlx5: stop warning for 64KB pages
Thread-Index: AQHXwdhG9T7OOxgcJU2hLtnyJfvXJqvbl/VQ
Date: Wed, 20 Oct 2021 08:39:56 +0000
Message-ID: <b12bfefcace143bd9aed95213e1bd8f1@AcuMS.aculab.com>
References: <20211015152056.2434853-1-arnd@kernel.org>
In-Reply-To: <20211015152056.2434853-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Arnd Bergmann
> Sent: 15 October 2021 16:21
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When building with 64KB pages, clang points out that xsk->chunk_size
> can never be PAGE_SIZE:
>=20
> drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:19:22: error: resu=
lt of comparison of constant
> 65536 with expression of type 'u16' (aka 'unsigned short') is always fals=
e [-Werror,-Wtautological-
> constant-out-of-range-compare]
>         if (xsk->chunk_size > PAGE_SIZE ||
>             ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
>=20
> In older versions of this code, using PAGE_SIZE was the only
> possibility, so this would have never worked on 64KB page kernels,
> but the patch apparently did not address this case completely.
>=20
> As Maxim Mikityanskiy suggested, 64KB chunks are really not all that
> useful, so just shut up the warning by adding a cast.
>=20
> Fixes: 282c0c798f8e ("net/mlx5e: Allow XSK frames smaller than a page")
> Link: https://lore.kernel.org/netdev/20211013150232.2942146-1-arnd@kernel=
.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> index 538bc2419bd8..228257010f32 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c
> @@ -15,8 +15,10 @@ bool mlx5e_validate_xsk_param(struct mlx5e_params *par=
ams,
>  =09=09=09      struct mlx5e_xsk_param *xsk,
>  =09=09=09      struct mlx5_core_dev *mdev)
>  {
> -=09/* AF_XDP doesn't support frames larger than PAGE_SIZE. */
> -=09if (xsk->chunk_size > PAGE_SIZE ||
> +=09/* AF_XDP doesn't support frames larger than PAGE_SIZE,
> +=09 * and xsk->chunk_size is limited to 65535 bytes.
> +=09 */
> +=09if ((size_t)xsk->chunk_size > PAGE_SIZE ||
>  =09=09=09xsk->chunk_size < MLX5E_MIN_XSK_CHUNK_SIZE)
>  =09=09return false;

How much smaller does the kernel get if you change 'chunk_size' from
_u16 to 'unsigned int'. ?
Especially for a non-x86 build?
Or is it a hardware constrained size??

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


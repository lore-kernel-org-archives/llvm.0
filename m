Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5F156D2;
	Wed, 21 Jun 2023 12:06:01 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QmMb36DX8z6GD5W;
	Wed, 21 Jun 2023 20:03:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 21 Jun
 2023 13:05:52 +0100
Date: Wed, 21 Jun 2023 13:05:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Paller, Kim Seer" <KimSeer.Paller@analog.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>
Subject: Re: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13:
 warning: result of comparison of constant 18446744073709551615 with
 expression of type 'typeof (_Generic((mask), char: (unsigned char)0,
 unsigned char: (unsigned char)0, signed char: (unsi...
Message-ID: <20230621130552.00001574@Huawei.com>
In-Reply-To: <010ac7c3707f4eb0aef285b5e823f8e3@analog.com>
References: <202306211545.7b6CdqsL-lkp@intel.com>
	<CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
	<010ac7c3707f4eb0aef285b5e823f8e3@analog.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Wed, 21 Jun 2023 08:58:47 +0000
"Paller, Kim Seer" <KimSeer.Paller@analog.com> wrote:

> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Wednesday, June 21, 2023 4:25 PM
> > To: kernel test robot <lkp@intel.com>
> > Cc: Paller, Kim Seer <KimSeer.Paller@analog.com>; llvm@lists.linux.dev;=
 oe-
> > kbuild-all@lists.linux.dev; Jonathan Cameron
> > <Jonathan.Cameron@huawei.com>
> > Subject: Re: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13:
> > warning: result of comparison of constant 18446744073709551615 with
> > expression of type 'typeof (_Generic((mask), char: (unsigned char)0, un=
signed
> > char: (unsigned char)0, signed char: (unsi...
> >=20
> > [External]
> >=20
> > On Wed, Jun 21, 2023 at 10:19=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote: =20
> > >
> > > tree: =20
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel=
/git/ji
> > c23/iio.git__;!!A3Ni8CS0y2Y!45o_-MMr4xq4e_9PWpK-sQ_qHBbFbbS7Q2J-
> > fNmTvSPAQXjYhpLYDteGHSeWEbdIAv364HiQBQy2tXMdnz3oesPJvyDEVg$
> > testing =20
> > > head:   25e201cc6ff270abc062e13ff912292097cb2827
> > > commit: d3e93b67f934a477c5851d575a2278f07c6242fb [6/10] iio: adc:
> > > max14001: New driver
> > > config: x86_64-allyesconfig
> > > (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/2
> > > 0230621/202306211545.7b6CdqsL- =20
> > lkp@intel.com/config__;!!A3Ni8CS0y2Y!45o =20
> > > _-MMr4xq4e_9PWpK-sQ_qHBbFbbS7Q2J- =20
> > fNmTvSPAQXjYhpLYDteGHSeWEbdIAv364HiQB =20
> > > Qy2tXMdnz3oesOgKhx9ZQ$ )
> > > compiler: clang version 15.0.7
> > > (https://urldefense.com/v3/__https://github.com/llvm/llvm-project.git_
> > > _;!!A3Ni8CS0y2Y!45o_-MMr4xq4e_9PWpK-sQ_qHBbFbbS7Q2J- =20
> > fNmTvSPAQXjYhpLYDt =20
> > > eGHSeWEbdIAv364HiQBQy2tXMdnz3oesOx97mL0Q$
> > > 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > reproduce:
> > > (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/2
> > > 0230621/202306211545.7b6CdqsL- =20
> > lkp@intel.com/reproduce__;!!A3Ni8CS0y2Y! =20
> > > 45o_-MMr4xq4e_9PWpK-sQ_qHBbFbbS7Q2J- =20
> > fNmTvSPAQXjYhpLYDteGHSeWEbdIAv364H =20
> > > iQBQy2tXMdnz3oesODMiAFrg$ )
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > | https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/20
> > > | 2306211545.7b6CdqsL-lkp@intel.com/__;!!A3Ni8CS0y2Y!45o_- =20
> > MMr4xq4e_9PW =20
> > > | pK-sQ_qHBbFbbS7Q2J- =20
> > fNmTvSPAQXjYhpLYDteGHSeWEbdIAv364HiQBQy2tXMdnz3oe =20
> > > | sOVGB0hTQ$
> > >
> > > All warnings (new ones prefixed by >>): =20
> >=20
> > Okay, you even haven't compiled your code :-( This should probably use =
one of
> > the functions from bitfield.h.
> > Like u32_encode_bits(). =20
>=20
> I wasn=E2=80=99t able to encounter and trigger this kind of warning in my=
 build. I built=20
> and tested the code with rpi4 and linux kernel source tree before sending=
 the patch.=20
> Perhaps I missed something. I will check and try to resolve this warning.

Also passed my (admittedly limited these days as 0-day does such a good job=
) local
build tests.=20
I guess some / most compilers could see it is constant, but a less observant
one apparently doesn't.

It's only called from one place, I'd just put the code inline so that the
constant nature of that variable is explicit.  Or pass in the FIELD_PREP()
value rather than computing it in the function.

Send a new version and I'll switch it in for the one in the tree currently.

However, it looks like that code was meant to do a read modify write cycle =
and
doesn't use the value read.  So probably a bug there anyway.

Thanks,

Jonathan


>=20
> Thanks and best regards,
> Kim Seer Paller
>=20
>=20
> =20


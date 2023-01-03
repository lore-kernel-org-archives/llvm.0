Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACB2104
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 10:54:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pCevy-0008N9-4j; Tue, 03 Jan 2023 11:54:18 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pCevw-003Xhj-J0; Tue, 03 Jan 2023 11:54:16 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pCevv-0004ck-W5; Tue, 03 Jan 2023 11:54:16 +0100
Message-ID: <97983dd8404782630814a6dada2e863fe914a397.camel@pengutronix.de>
Subject: Re: ld.lld: error: undefined symbol: devm_ti_sci_get_handle
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Date: Tue, 03 Jan 2023 11:54:15 +0100
In-Reply-To: <77e77c4f-0cde-090d-5918-c1a5f85ea5fb@infradead.org>
References: <202212222201.6lgWXMZT-lkp@intel.com>
	 <77e77c4f-0cde-090d-5918-c1a5f85ea5fb@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1+deb11u1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev

On Do, 2022-12-22 at 16:40 -0800, Randy Dunlap wrote:
>=20
> On 12/22/22 06:45, kernel test robot wrote:
> > Hi Philipp,
> >=20
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   9d2f6060fe4c3b49d0cdc1dce1c99296f33379c8
> > commit: a6af504184c981efd253f986e6fc54db57b1d39f reset: ti-sci: Allow b=
uilding under COMPILE_TEST
> > date:   8 months ago
> > config: arm-randconfig-r046-20221222
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98=
b13979fb05f3ed288a900deb843e7b27589e58)
> > reproduce (this is a W=3D1 build):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wget https://raw.github=
usercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0chmod +x ~/bin/make.cro=
ss
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# install arm cross com=
piling tool for clang build
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# apt-get install binut=
ils-arm-linux-gnueabi
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# https://git.kernel.or=
g/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Da6af504184c981ef=
d253f986e6fc54db57b1d39f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git remote add linus ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git fetch --no-tags lin=
us master
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git checkout a6af504184=
c981efd253f986e6fc54db57b1d39f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# save the config file
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mkdir build_dir && cp c=
onfig build_dir/.config
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 O=3Dbuild_dir ARCH=3Darm ol=
ddefconfig
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 O=3Dbuild_dir ARCH=3Darm SH=
ELL=3D/bin/bash
> >=20
> > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > > > ld.lld: error: undefined symbol: devm_ti_sci_get_handle
> > =C2=A0=C2=A0=C2=A0>>> referenced by reset-ti-sci.c:229 (drivers/reset/r=
eset-ti-sci.c:229)
> > =C2=A0=C2=A0=C2=A0>>>               reset/reset-ti-sci.o:(ti_sci_reset_=
probe) in archive drivers/built-in.a
>=20
> Two (2) patches have been posted for this build error (in chronological o=
rder):
>=20
> 2022-10-29:
> =C2=A0=C2=A0https://lore.kernel.org/lkml/20221030055636.3139-1-rdunlap@in=
fradead.org/
> 2022-12-15:
> =C2=A0=C2=A0https://lore.kernel.org/all/20221215170036.2308972-1-arnd@ker=
nel.org/
>=20
> Can someone apply one of them or at least comment on them?
> Philipp?

Sorry for the delay, I've applied your patch and will send a pull
request shortly.

regards
Philipp

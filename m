Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF45168
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 14:58:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 70A0AE198C
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 14:52:06 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 696502000F;
	Thu, 13 Jan 2022 14:51:56 +0000 (UTC)
Date: Thu, 13 Jan 2022 15:51:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt
 <stefan@datenfreihafen.org>, linux-wpan@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, Harry Morris
 <h.morris@cascoda.com>, Varka Bhadram <varkabhadram@gmail.com>, Xue Liu
 <liuxuenetmail@gmail.com>
Subject: Re: [wpan-next v2 19/27] net: ieee802154: Full PAN management
Message-ID: <20220113155154.243c36ad@xps13>
In-Reply-To: <202201130436.44AM2OXA-lkp@intel.com>
References: <20220112173312.764660-20-miquel.raynal@bootlin.com>
	<202201130436.44AM2OXA-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


lkp@intel.com wrote on Thu, 13 Jan 2022 04:46:11 +0800:

> Hi Miquel,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.16 next-20220112]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/IEEE-802-1=
5-4-scan-support/20220113-013731
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t daadb3bd0e8d3e317e36bc2c1542e86c528665e5
> config: riscv-randconfig-r042-20220112 (https://download.01.org/0day-ci/a=
rchive/20220113/202201130436.44AM2OXA-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244d=
d2913a43a200f5a6544d424cdc37b771028b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/9c8fbd918a704432bbf6cdc=
e1d111e9002c756b4
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Miquel-Raynal/IEEE-802-15-4-scan=
-support/20220113-013731
>         git checkout 9c8fbd918a704432bbf6cdce1d111e9002c756b4
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash net/ieee802154/
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> net/ieee802154/nl802154.c:1613:8: error: implicit declaration of funct=
ion 'nl802154_prepare_wpan_dev_dump' [-Werror,-Wimplicit-function-declarati=
on] =20
>            err =3D nl802154_prepare_wpan_dev_dump(skb, cb, &rdev, &wpan_d=
ev);
>                  ^
> >> net/ieee802154/nl802154.c:1637:2: error: implicit declaration of funct=
ion 'nl802154_finish_wpan_dev_dump' [-Werror,-Wimplicit-function-declaratio=
n] =20
>            nl802154_finish_wpan_dev_dump(rdev);

These two helpers were defined within the experimental section. I will
move them out of this section now that they have other users than
experimental code.

>            ^
>    net/ieee802154/nl802154.c:1637:2: note: did you mean 'nl802154_prepare=
_wpan_dev_dump'?
>    net/ieee802154/nl802154.c:1613:8: note: 'nl802154_prepare_wpan_dev_dum=
p' declared here
>            err =3D nl802154_prepare_wpan_dev_dump(skb, cb, &rdev, &wpan_d=
ev);
>                  ^
>    2 errors generated.
>=20
>=20
> vim +/nl802154_prepare_wpan_dev_dump +1613 net/ieee802154/nl802154.c
>=20
>   1605=09
>   1606	static int nl802154_dump_pans(struct sk_buff *skb, struct netlink_=
callback *cb)
>   1607	{
>   1608		struct cfg802154_registered_device *rdev;
>   1609		struct cfg802154_internal_pan *pan;
>   1610		struct wpan_dev *wpan_dev;
>   1611		int err;
>   1612=09
> > 1613		err =3D nl802154_prepare_wpan_dev_dump(skb, cb, &rdev, &wpan_dev)=
; =20
>   1614		if (err)
>   1615			return err;
>   1616=09
>   1617		spin_lock_bh(&rdev->pan_lock);
>   1618=09
>   1619		if (cb->args[2])
>   1620			goto out;
>   1621=09
>   1622		cb->seq =3D rdev->pan_generation;
>   1623=09
>   1624		ieee802154_for_each_pan(pan, rdev) {
>   1625			err =3D nl802154_send_pan_info(skb, cb, cb->nlh->nlmsg_seq,
>   1626						     NLM_F_MULTI, rdev, wpan_dev, pan);
>   1627			if (err < 0)
>   1628				goto out_err;
>   1629		}
>   1630=09
>   1631		cb->args[2] =3D 1;
>   1632	out:
>   1633		err =3D skb->len;
>   1634	out_err:
>   1635		spin_unlock_bh(&rdev->pan_lock);
>   1636=09
> > 1637		nl802154_finish_wpan_dev_dump(rdev); =20
>   1638=09
>   1639		return err;
>   1640	}
>   1641=09
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


Thanks,
Miqu=C3=A8l

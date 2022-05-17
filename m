Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28FD10E8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 08:51:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 83244CCF8D
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 08:21:21 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B3BA7240006;
	Tue, 17 May 2022 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652775672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1/AW8BzbU/J7Ef4GC883IGCwsyydNpj3xsEo4FKgGM=;
	b=aCE5S3xg+ZtS00gLcC8M4Ey5prbCVQ+Vbl7wceGLpnjHN+tsHiiyHzIh/fLa0zg1Irr8IM
	ZOU1BHAilJ5JFwlTJSa9IEu65dGG7cwMo0qsadEj+eKloJmQL6riHROruaUJpBYA6dG8hp
	FDxJLNFegrgRko0KZgvkcWlkW4Gg0z52KaKTvcrsAVVrgdVz8+e+EXeH5Wn+BZCexhCTuI
	Dr9aY5dExZEDWe6HtucI+P2ONJdIeTrIr4tbXGljhkZ5pZcePOIuU1WQZ+24JnuTRXIHQy
	SLgi3J+s62Zc7D6yPc9b7I8Ls9jUAPtLt4GknCkBm+I/dAj8BizliNITpK/SJw==
Date: Tue, 17 May 2022 10:21:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>
Subject: Re: [linux-next:master 10956/12195] ERROR: modpost: "__udivdi3"
 [drivers/mtd/parsers/scpart.ko] undefined!
Message-ID: <20220517102110.42952fb6@xps-13>
In-Reply-To: <202205170327.TVBbIsh2-lkp@intel.com>
References: <202205170327.TVBbIsh2-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mikhail,

lkp@intel.com wrote on Tue, 17 May 2022 03:32:03 +0800:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   3f7bdc402fb06f897ff1f492a2d42e1f7c2efedb
> commit: 4213e556fe2a18782e91a87fec70d98c48f1ee41 [10956/12195] mtd: parse=
rs: add support for Sercomm partitions
> config: i386-randconfig-r004-20220516 (https://download.01.org/0day-ci/ar=
chive/20220517/202205170327.TVBbIsh2-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853f=
a8ee225edf2d0de94b0dcbd31bea916e825e)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D4213e556fe2a18782e91a87fec70d98c48f1ee41
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 4213e556fe2a18782e91a87fec70d98c48f1ee41
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: "__udivdi3" [drivers/mtd/parsers/scpart.ko] undefined!=
 =20
>=20

Can you give this a look rapidly? Otherwise I'll have to drop the patch
(I can keep the bindings anyway).

Thanks,
Miqu=C3=A8l

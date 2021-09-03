Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194583FC1
	for <llvm@lists.linux.dev>; Fri,  3 Sep 2021 00:21:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9428760555;
	Fri,  3 Sep 2021 00:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630628496;
	bh=xps6O0n1T0q7fAV/lqXRRImBcI3pTQf7eq4VADiFEKg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lS4p6ypuayhqEdIM/l22Q0Sl5OP5J1KNQzHvVDt3BZrDd7uwy04ELCG+DcGfE0ZWH
	 QtFWVuaqmWHCjpWp2U9MhWo0Tfmh3bkYtFNksL8PIGl0wc8ipuI1/0nQgBdli766R1
	 2T+TVt2EIkFElNAX1WFwgbSOMhneyCMmtT7wlphJ/7ipi/91frnfVWej6MUGVB1Cp2
	 NlDv06Hd0MboeM4dBo/UNMkDFr1fqMez7GXaKLseDUdmJ5+fROiGeX7BfpCh6yfrDP
	 c35YcDsK/TXbzJrsVIWhk1ZGMhbwlv/5QCQ4iaymWvFNAcPNiBQUw9eB7pdzv4BRSz
	 zf9sPglOFprPw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <85c61a79-3e83-84c8-1b75-3e4640ac3490@somainline.org>
References: <202109021640.TXyMlULd-lkp@intel.com> <85c61a79-3e83-84c8-1b75-3e4640ac3490@somainline.org>
Subject: Re: [linux-next:master 10841/11508] drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable 'gcc_parent_data_2'
From: Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>, kernel test robot <lkp@intel.com>
Date: Thu, 02 Sep 2021 17:21:35 -0700
Message-ID: <163062849533.405991.5146021696613255539@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Konrad Dybcio (2021-09-02 02:01:30)
>=20
> On 02.09.2021 10:57, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   34560ced20599a01660a693f464c7c7dc83db1d9
> > commit: 131abae905df99f63d825e47b4df100d34f518ce [10841/11508] clk: qco=
m: Add SM6350 GCC driver
> > config: riscv-buildonly-randconfig-r006-20210902 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c9=
948e9254fbb6ea00f66c7b4542311d21e060be)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D131abae905df99f63d825e47b4df100d34f518ce
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 131abae905df99f63d825e47b4df100d34f518ce
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Driscv=20
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable 'gcc_p=
arent_data_2' [-Wunused-const-variable]
> >    static const struct clk_parent_data gcc_parent_data_2[] =3D {
> >                                        ^
> >    1 warning generated.
> >
> >
> > vim +/gcc_parent_data_2 +179 drivers/clk/qcom/gcc-sm6350.c
> >
> >    178       =20
> >  > 179        static const struct clk_parent_data gcc_parent_data_2[] =
=3D {
> >    180                { .fw_name =3D "bi_tcxo" },
> >    181                { .hw =3D &gpll0_out_odd.clkr.hw },
> >    182        };
> >    183        static const struct clk_parent_data gcc_parent_data_2_ao[=
] =3D {
> >    184                { .fw_name =3D "bi_tcxo_ao" },
> >    185                { .hw =3D &gpll0_out_odd.clkr.hw },
> >    186        };
> >    187       =20
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20
> Looks like this slipped through.. gcc_parent_data_2[] is in fact not used=
. Could you remove that array in your tree, Stephen?
>=20
>=20

Please send a patch.

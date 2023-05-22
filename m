Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D671429C
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 16:53:10 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f6b20ad49dso4924411cf.2
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684774389; x=1687366389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VpKPrQUojHXQp+pgVX7i9L1lzyUv3HTNaZR3lXx5cA=;
        b=qRyoPL8x6jZBeaTd2V+SSG09Qnklx1PF0l7svjFhXVRm1mFsEE6vlsfiW1KgQ3B9dM
         RlDK4O0aL1qn48bAfjX4VygjC0ve/GZXgvf+ealDdMg0LZf5O0/6xejMtSsuwXoVgUYv
         74xhMqK+pngnbgHMirUxr6BiBfrOLH/CcziBtq71OSQASEFtyaNJLId9Gw7j6lxI+rPt
         tiX3tfzPS0ttwunU4HnugAtAXkM6fx67dEEPm9HQbYwvD8Ug5dUM/UBrKgQ58frKj49q
         o2AU3sJL4KEHbuFYXZ2Uf2wfktSVqOq3eB9CowwhqMM6+VE9ZFT4IpFAMZvvaWlv8fkm
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774389; x=1687366389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VpKPrQUojHXQp+pgVX7i9L1lzyUv3HTNaZR3lXx5cA=;
        b=a4aMa53ha+VJFnGrxe+Wl8vhVE8kZcW73yGAmPOFrRbUQEOmhfkKQHxGC7joyfHcMo
         jI2M9NaoCWXzeZtVl0t516Wrr5t3BrLld6ZFSgc0GD1HQWXgzGYdoBJXhGkk+tZcnm1G
         gEorAnrr//0+JcrQ0UOni39LuE3npyBo+ksTUfC9f1jWGikNRUFZPnz1QziAB9tbOi3B
         Kid/9EPnWAAyTc0l2PwQXIWxcsXj39zm8HTQuJLBwx2c6NgOmvYD6DJmfSmV1kbnDi6A
         imREK2RzXFqvGeehN+dVMBCInkvYo9f2rWkxnrc2yXwcgG3QYqsGNjnoNRSBgtkvIiZN
         lm8g==
X-Gm-Message-State: AC+VfDzxdDRsUOB3AgJ+2ZLBtfu45Hwjw+vsxw/RJ1vHHS2WpcmH3D8T
	R7RsYQAlUdOPOjQLoKkp6Rbj9K4Z7OjgiIB6iru+WQ==
X-Google-Smtp-Source: ACHHUZ7B3DOrs6v3mHQcjLvZZouxq+ew3WRDpgvyUnbt9WaBI/qcq6m+vyEnhdpLuxYt70jFRN+g1i58RyQMSwyYeTs=
X-Received: by 2002:a05:622a:387:b0:3f5:2d80:e5f0 with SMTP id
 j7-20020a05622a038700b003f52d80e5f0mr19990833qtx.40.1684774389531; Mon, 22
 May 2023 09:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305210810.njuOWlC1-lkp@intel.com> <61f75542-0bb2-e601-60b3-cdefa08cba28@gmail.com>
In-Reply-To: <61f75542-0bb2-e601-60b3-cdefa08cba28@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 May 2023 09:52:58 -0700
Message-ID: <CAKwvOdnaL-kNLLjLFG0irYc5ROqShcUWnfSsQESeAvquKsULzQ@mail.gmail.com>
Subject: Re: [linux-stable-rc:queue/5.15 78/106] drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33:
 warning: unused variable 'rtl819xp_ops'
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp, below is my interpretation of this report:

On Sun, May 21, 2023 at 2:10=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 5/21/23 02:59, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git queue/5.15

^ So Greg and Sasha are cherry picking patches to linux-5.15.y branch
of stable...

> > head:   632aeb02f8e831197a9a01b1e93cb00b4363be05
> > commit: f13ecbca1796208fa2f888843223ea289f8e2b39 [78/106] staging: rtl8=
192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE

^ ...of the 106 patches picked up f13ecbca179620 is introducing a new failu=
re...

> > config: x86_64-allyesconfig

^ ...in allyesconfig builds...

> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f2=
8c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=3D1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
-stable-rc.git/commit/?id=3Df13ecbca1796208fa2f888843223ea289f8e2b39
> >          git remote add linux-stable-rc https://git.kernel.org/pub/scm/=
linux/kernel/git/stable/linux-stable-rc.git
> >          git fetch --no-tags linux-stable-rc queue/5.15
> >          git checkout f13ecbca1796208fa2f888843223ea289f8e2b39
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/platform/x86/ =
drivers/staging/rtl8192e/rtl8192e/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305210810.njuOWlC1-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused v=
ariable 'rtl819xp_ops' [-Wunused-const-variable]

^ ... does Greg or Sasha need to pick up
commit 5e2b6593f270 ("staging: rtl8192e: Remove empty struct rtl819x_ops")
for linux-5.15.y in addition to f13ecbca1796208fa2f888843223ea289f8e2b39?

5e2b6593f270 lacks a fixes tag, so it's probably not obvious to them
or their automation.

> >     static const struct rtl819x_ops rtl819xp_ops =3D {
> >                                     ^
> >     1 warning generated.
> >
> >
> > vim +/rtl819xp_ops +29 drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> >
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  27
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  28
> > 1c099ed63f8363 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Julia Lawal=
l       2016-09-11 @29  static const struct rtl819x_ops rtl819xp_ops =3D {
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  30         .nic_type                       =3D NIC_8192=
E,
> > b095be37004f91 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  31         .get_eeprom_size                =3D rtl92e_g=
et_eeprom_size,
> > df85a1313fee7d drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  32         .init_adapter_variable          =3D rtl92e_i=
nit_variables,
> > 460266292de1c3 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  33         .initialize_adapter             =3D rtl92e_s=
tart_adapter,
> > b974b289c4cb8a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  34         .link_change                    =3D rtl92e_l=
ink_change,
> > 072b3948d473f8 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  35         .tx_fill_descriptor             =3D rtl92e_f=
ill_tx_desc,
> > 63b544a17c63c0 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  36         .tx_fill_cmd_descriptor         =3D rtl92e_f=
ill_tx_cmd_desc,
> > 7897285ceb2864 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  37         .rx_query_status_descriptor     =3D rtl92e_g=
et_rx_stats,
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  38         .rx_command_packet_handler =3D NULL,
> > fe99c77b44e41c drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  39         .stop_adapter                   =3D rtl92e_s=
top_adapter,
> > 575d48c5753246 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  40         .update_ratr_table              =3D rtl92e_u=
pdate_ratr_table,
> > 6d99c68e6f5024 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  41         .irq_enable                     =3D rtl92e_e=
nable_irq,
> > baadea565daae4 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  42         .irq_disable                    =3D rtl92e_d=
isable_irq,
> > dc578b417facae drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  43         .irq_clear                      =3D rtl92e_c=
lear_irq,
> > 78c352b2b22348 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  44         .rx_enable                      =3D rtl92e_e=
nable_rx,
> > 6af7a8b662f6bb drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  45         .tx_enable                      =3D rtl92e_e=
nable_tx,
> > a57165d15dae6f drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  46         .interrupt_recognized           =3D rtl92e_a=
ck_irq,
> > c9cf5e78f3b28e drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  47         .TxCheckStuckHandler            =3D rtl92e_i=
s_tx_stuck,
> > 4d73bd2636f51a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kul=
ikowski 2015-07-19  48         .RxCheckStuckHandler            =3D rtl92e_i=
s_rx_stuck,
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  49  };
> > 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finge=
r       2011-08-23  50
> >
> > :::::: The code at line 29 was first introduced by commit
> > :::::: 1c099ed63f8363228a0b075a25511c9feb90e03f staging: rtl8192e: cons=
tify local structures
> >
> > :::::: TO: Julia Lawall <Julia.Lawall@lip6.fr>
> > :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
>
> Hi,
>
> if anybody needs my help please let me know.
>
> I do not know what to do with this message.
>
> Thanks for your support.
>
> Bye Philipp
>
>
>


--=20
Thanks,
~Nick Desaulniers

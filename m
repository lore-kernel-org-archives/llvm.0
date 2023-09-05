Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54732D527
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 15:58:43 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6556d05a55fso12921056d6.3
        for <llvm@lists.linux.dev>; Tue, 05 Sep 2023 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693929522; x=1694534322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8PsOUdlYxNm6DRIQuojE/DnPuosQCXfxt+6iE22b50=;
        b=GI8MNwI03BJtwt/OIcvo5zkpIoSGkkajwIfS8BVwT1knK11NuOwrUwUMgyymZqCXl+
         Dv4JBYhN2z70v64EhoY27TBzj+8FLS98dZqB2q1lE3daysLDqmPYX3QWuUw84TGF+OTy
         Qp753i5XP1Kohq1lnaAzputpD4gEc4K9RnKAAIChXSi1H/Jks7APgd8TUgWzGujapNY0
         PwVSVLB/PvqPOsBiNpZUjt7E/SGY/J/fVsMSi07nlC7sMnRkGhDc2NINBlOEsMj0KY+u
         vf2oUJXF+kszSedlxKOKhgewFfTfjkr163G8lEzBAkMxeg8N3bvUU5sLK/wa6woIdUHi
         emSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693929522; x=1694534322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8PsOUdlYxNm6DRIQuojE/DnPuosQCXfxt+6iE22b50=;
        b=mGGeb4/26S0uHpKpayKkPwXGGxrOl2ZyHCSvt6mKsMKffztBzT5F6T4+nZ6GsLylat
         s1HDA4Qsojs6hOFYgcFg5+DwUH24KgeojtoRp+OEuzUlfyPug8iDBpADFwj523oJvS2L
         bW/7PrCZ7C062x9WVl9kjotcKEfquIzDmE3EBR57ntUaQwwDTSGHkOD5Zc5vTNmYtyHS
         hAXpkJk1NuyOZiE63e9MJQI+A5+/N6oKnhhjBzrlFmwPaJVsSGugiHfTLL6D/kHKrxzh
         aFRCxFM74Cty2c3rneaMs/5ybJRxSU8qoA2dromljgxDtGo7qsT8oNTkO/h3AQPDBFMn
         UZ4g==
X-Gm-Message-State: AOJu0YxkmHQcNRqn2vqjK/86PnVViu8dEB8xTwe1sRznu70+zsMhtN1w
	IfVUnfr9WtBRpU1Gx1mNbiQ3gPaYApOJWTdpZY3YhQ==
X-Google-Smtp-Source: AGHT+IH944pHkAw9VZ43TlFt4vDYO+U/xgVcpDbk7Uk7nqpkI1sHOyU1e3MQrvHBpKUd+yKPV3EdWCfKvx4JwEp8Mlo=
X-Received: by 2002:a0c:e503:0:b0:64a:2b04:c10a with SMTP id
 l3-20020a0ce503000000b0064a2b04c10amr12801883qvm.29.1693929521690; Tue, 05
 Sep 2023 08:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPcuvEg5Mf5MoM2L@rli9-mobl>
In-Reply-To: <ZPcuvEg5Mf5MoM2L@rli9-mobl>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Sep 2023 08:58:30 -0700
Message-ID: <CAKwvOdm281duZtm7t6MHnKpkJr8DU7=wRs_ud7uAWzKXmF7mBQ@mail.gmail.com>
Subject: Re: arch/x86/kernel/fpu/xstate.c:1691: warning: Excess function
 parameter 'tsk' description in 'fpu_xstate_prctl'
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, 
	kernel test robot <philip.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 6:36=E2=80=AFAM kernel test robot <philip.li@intel.c=
om> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   3f86ed6ec0b390c033eae7f9c487a3fea268e027
> commit: f5c0b4f30416c670408a77be94703d04d22b57df x86/prctl: Remove pointl=
ess task argument
> date:   1 year, 4 months ago
> :::::: branch date: 14 hours ago
> :::::: commit date: 1 year, 4 months ago
> config: i386-allnoconfig (https://download.01.org/0day-ci/archive/2023090=
5/202309052029.TNyqXyIT-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230905/202309052029.TNyqXyIT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202309052029.TNyqXyIT-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> arch/x86/kernel/fpu/xstate.c:1691: warning: Excess function parameter =
'tsk' description in 'fpu_xstate_prctl'

FWIW, this is `make htmldocs` complaining about the comment above the funct=
ion.

>
>
> vim +1691 arch/x86/kernel/fpu/xstate.c
>
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1671
> db8268df0983ad Chang S. Bae    2021-10-21  1672  /**
> db8268df0983ad Chang S. Bae    2021-10-21  1673   * fpu_xstate_prctl - xs=
tate permission operations
> db8268df0983ad Chang S. Bae    2021-10-21  1674   * @tsk:       Redundant=
 pointer to current

^ this line should be deleted.

> db8268df0983ad Chang S. Bae    2021-10-21  1675   * @option:    A subfunc=
tion of arch_prctl()
> db8268df0983ad Chang S. Bae    2021-10-21  1676   * @arg2:      option ar=
gument
> db8268df0983ad Chang S. Bae    2021-10-21  1677   * Return:     0 if succ=
essful; otherwise, an error code
> db8268df0983ad Chang S. Bae    2021-10-21  1678   *
> db8268df0983ad Chang S. Bae    2021-10-21  1679   * Option arguments:
> db8268df0983ad Chang S. Bae    2021-10-21  1680   *
> db8268df0983ad Chang S. Bae    2021-10-21  1681   * ARCH_GET_XCOMP_SUPP: =
Pointer to user space u64 to store the info
> db8268df0983ad Chang S. Bae    2021-10-21  1682   * ARCH_GET_XCOMP_PERM: =
Pointer to user space u64 to store the info
> db8268df0983ad Chang S. Bae    2021-10-21  1683   * ARCH_REQ_XCOMP_PERM: =
Facility number requested
> db8268df0983ad Chang S. Bae    2021-10-21  1684   *
> db8268df0983ad Chang S. Bae    2021-10-21  1685   * For facilities which =
require more than one XSTATE component, the request
> db8268df0983ad Chang S. Bae    2021-10-21  1686   * must be the highest s=
tate component number related to that facility,
> db8268df0983ad Chang S. Bae    2021-10-21  1687   * e.g. for AMX which re=
quires XFEATURE_XTILE_CFG(17) and
> db8268df0983ad Chang S. Bae    2021-10-21  1688   * XFEATURE_XTILE_DATA(1=
8) this would be XFEATURE_XTILE_DATA(18).
> db8268df0983ad Chang S. Bae    2021-10-21  1689   */
> f5c0b4f30416c6 Thomas Gleixner 2022-05-12  1690  long fpu_xstate_prctl(in=
t option, unsigned long arg2)
> db8268df0983ad Chang S. Bae    2021-10-21 @1691  {
> db8268df0983ad Chang S. Bae    2021-10-21  1692         u64 __user *uptr =
=3D (u64 __user *)arg2;
> db8268df0983ad Chang S. Bae    2021-10-21  1693         u64 permitted, su=
pported;
> db8268df0983ad Chang S. Bae    2021-10-21  1694         unsigned long idx=
 =3D arg2;
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1695         bool guest =3D fa=
lse;
> db8268df0983ad Chang S. Bae    2021-10-21  1696
> db8268df0983ad Chang S. Bae    2021-10-21  1697         switch (option) {
> db8268df0983ad Chang S. Bae    2021-10-21  1698         case ARCH_GET_XCO=
MP_SUPP:
> db8268df0983ad Chang S. Bae    2021-10-21  1699                 supported=
 =3D fpu_user_cfg.max_features | fpu_user_cfg.legacy_features;
> db8268df0983ad Chang S. Bae    2021-10-21  1700                 return pu=
t_user(supported, uptr);
> db8268df0983ad Chang S. Bae    2021-10-21  1701
> db8268df0983ad Chang S. Bae    2021-10-21  1702         case ARCH_GET_XCO=
MP_PERM:
> db8268df0983ad Chang S. Bae    2021-10-21  1703                 /*
> db8268df0983ad Chang S. Bae    2021-10-21  1704                  * Lockle=
ss snapshot as it can also change right after the
> db8268df0983ad Chang S. Bae    2021-10-21  1705                  * droppi=
ng the lock.
> db8268df0983ad Chang S. Bae    2021-10-21  1706                  */
> db8268df0983ad Chang S. Bae    2021-10-21  1707                 permitted=
 =3D xstate_get_host_group_perm();
> db8268df0983ad Chang S. Bae    2021-10-21  1708                 permitted=
 &=3D XFEATURE_MASK_USER_SUPPORTED;
> db8268df0983ad Chang S. Bae    2021-10-21  1709                 return pu=
t_user(permitted, uptr);
> db8268df0983ad Chang S. Bae    2021-10-21  1710
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1711         case ARCH_GET_XCO=
MP_GUEST_PERM:
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1712                 permitted=
 =3D xstate_get_guest_group_perm();
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1713                 permitted=
 &=3D XFEATURE_MASK_USER_SUPPORTED;
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1714                 return pu=
t_user(permitted, uptr);
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1715
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1716         case ARCH_REQ_XCO=
MP_GUEST_PERM:
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1717                 guest =3D=
 true;
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1718                 fallthrou=
gh;
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1719
> db8268df0983ad Chang S. Bae    2021-10-21  1720         case ARCH_REQ_XCO=
MP_PERM:
> db8268df0983ad Chang S. Bae    2021-10-21  1721                 if (!IS_E=
NABLED(CONFIG_X86_64))
> db8268df0983ad Chang S. Bae    2021-10-21  1722                         r=
eturn -EOPNOTSUPP;
> db8268df0983ad Chang S. Bae    2021-10-21  1723
> 980fe2fddcff21 Thomas Gleixner 2022-01-05  1724                 return xs=
tate_request_perm(idx, guest);
> db8268df0983ad Chang S. Bae    2021-10-21  1725
> db8268df0983ad Chang S. Bae    2021-10-21  1726         default:
> db8268df0983ad Chang S. Bae    2021-10-21  1727                 return -E=
INVAL;
> db8268df0983ad Chang S. Bae    2021-10-21  1728         }
> db8268df0983ad Chang S. Bae    2021-10-21  1729  }
> db8268df0983ad Chang S. Bae    2021-10-21  1730
>
> :::::: The code at line 1691 was first introduced by commit
> :::::: db8268df0983adc2bb1fb48c9e5f7bfbb5f617f3 x86/arch_prctl: Add contr=
ols for dynamic XSTATE components
>
> :::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
> :::::: CC: Borislav Petkov <bp@suse.de>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>


--=20
Thanks,
~Nick Desaulniers

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B2C126;
	Sun, 11 Jun 2023 15:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C68C433EF;
	Sun, 11 Jun 2023 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498551;
	bh=3EWekhSO1wCU4VDEQeoyAhqXeIvgHkX0M4Gym7P43cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nkI7xFkKc8YC3T0KVl8s7QzTzu8Z/N9/h/Q4WSUXHJcMU5kfjBNJ0vrsV5ep40Wtt
	 mt/a22izi5RD61oVJOCKjp09N1NSiZL/LB+divy+gSHtQcJWm+l0rvdsHa+lPnBayM
	 Ts16s1FVgpFAMuLzt2xeauCEBZVwFfU7FX7jLOlueUJrTpsBPpu9Dm0qHLif/7cCGr
	 Q8v23U74cJXkTdWZLgqnfUZ666XusHG4AoIbFf9Drn+rVhjf8V+o90e+r2UNiVslmm
	 IVy9OD0haIS2rHZMQHAc/4EMNamCKG/KNqKhFFl5qKVVPzeFxJOjXKGUUQ3g4g93kp
	 oWc42XUkYT8HA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1a6820804abso187975fac.2;
        Sun, 11 Jun 2023 08:49:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDx4zRF880nMhc21vFPpPr51mhzcFR0HmPyCVT+j6l3gxgobUhgP
	CBjRIVJUH+qX3s83yGRGY6KKHE6vYCHOem0jlp0=
X-Google-Smtp-Source: ACHHUZ7qiig9mTkb1GkwfQqDGJIUSEqgnCvqUVTUHH/+IbdB/ObuYk9sAcbQg+FJPtptj5XiIEcYi8HcwqUWVkzikuI=
X-Received: by 2002:a05:6870:9182:b0:1a2:93ff:a275 with SMTP id
 b2-20020a056870918200b001a293ffa275mr4291191oaf.38.1686498550324; Sun, 11 Jun
 2023 08:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610091320.1054554-9-masahiroy@kernel.org> <202306110018.Ir9UVvn9-lkp@intel.com>
In-Reply-To: <202306110018.Ir9UVvn9-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Jun 2023 00:48:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVC_KOrU+pUEdNZnAYb1LCDejrYzSsRjafm8vJ05bdwQ@mail.gmail.com>
Message-ID: <CAK7LNASVC_KOrU+pUEdNZnAYb1LCDejrYzSsRjafm8vJ05bdwQ@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 1:29=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Masahiro,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on next-20230609]
> [cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm=
/linux-next linus/master v6.4-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Re=
vert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230610-171620
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git for-next
> patch link:    https://lore.kernel.org/r/20230610091320.1054554-9-masahir=
oy%40kernel.org
> patch subject: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYM=
S without recursion
> config: s390-randconfig-r003-20230610 (https://download.01.org/0day-ci/ar=
chive/20230611/202306110018.Ir9UVvn9-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/li=
nux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch masahiroy-kbuild for-next
>         git checkout masahiroy-kbuild/for-next
>         b4 shazam https://lore.kernel.org/r/20230610091320.1054554-9-masa=
hiroy@kernel.org
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Ds390 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306110018.Ir9UVvn9-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    s390x-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init=
_dt':
>    irq-al-fic.c:(.init.text+0x24): undefined reference to `of_iomap'
> >> s390x-linux-ld: irq-al-fic.c:(.init.text+0x1f0): undefined reference t=
o `iounmap'
> --


The options in getopt() got broken due to a mistake of git-rebase.
I will fix it in v9.

--=20
Best Regards
Masahiro Yamada

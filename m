Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99615101ED
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 16:11:03 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-75e4497597cso220369585a.2
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686759062; x=1689351062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPoAD2cQx17/agVIIZsOPzeZQINLpmt+BsXjaxWZki4=;
        b=2DCUbuGjivNIJ/K3I1lerX+RfjyNvVA8xfZg3jswm8hnjx6gB188rz1VgnhG7Nr26z
         x+BQHwHpyARi1bmXdIkHmMqU1NK+9bq2sNlrQ+vYoHW9X30gvf0VtIAdVt1epMY8SHyq
         Lfg/N1/RPpminwoF6d0pRnZxfwVO94QIDxnO+ZOD34FDCq7BqHwTLL77Y/f6XjSwZ5JF
         nqn2bOc/17P1oEeHejjbVfCHZS1M02cp/b8orYyCl62ktElzmm7cBazlQQ+x8ecedmsO
         5HE3UiHbvm9vH/LiWSiF+VH1d30Bq9G8dbEVqTLX8+fm0b5Z/zArT4LQgWjfjk3mIqK9
         of0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686759062; x=1689351062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPoAD2cQx17/agVIIZsOPzeZQINLpmt+BsXjaxWZki4=;
        b=jk1XGhVgvYOVOm6H1qT48G7/u+XdRQydWMKIWOoq547+/i3S2/hvP9Lci8wHp3oxrU
         FBKS1Uz2CGoq3G/0V7mqibQfXHldxO5SfoZGauJ2Zly3O/49faS9nsTIMfYyENJsxkRv
         Uf5aoXBv0w/KxXtTDPQnEb9dsrFvvqbEMi0kXMmECJ2wYYwlYQcFX04YegxEN7y2H0Cm
         MLOd0RI5fttKEC4zxgxG99JzPMLEqc1nIQ0XnTfFUt+Btb5JaFXtiDBiwVxDsWKsABJH
         p8W+rV+TVjkO76VjdTQT8XAWlV3BpwBQ/p9DUQ1AkstFLiu3yx2yuUpLpCa13UjwZc1R
         QWYQ==
X-Gm-Message-State: AC+VfDznPYTKvk3ml15H3iLLI/sQl1VOtuEogiMZUhuA7ECyQ+MZHp7f
	ZUMKeZLRhHr/4mqQ2d5irqGd6LDNXyLM68T1O5ldXA==
X-Google-Smtp-Source: ACHHUZ4DG7IYnl0dzuHTx3rIr2fbK++4fkHPSoufUcgeCw5+vOT0uOgO36Rfb0JrSFSLwGTCgt+Lgsx+U1ubKWTa+IA=
X-Received: by 2002:a05:6214:2aa5:b0:625:953f:84f6 with SMTP id
 js5-20020a0562142aa500b00625953f84f6mr18277284qvb.6.1686759062132; Wed, 14
 Jun 2023 09:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306132237.Z4LJE8bP-lkp@intel.com> <20230614-stadien-gasbetrieben-f9cbfc4343b8@brauner>
In-Reply-To: <20230614-stadien-gasbetrieben-f9cbfc4343b8@brauner>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Jun 2023 12:10:50 -0400
Message-ID: <CAKwvOdnsJD2x+M9ANVNLCXita8L54Gd+=6Nuc6WsCLukFZry9A@mail.gmail.com>
Subject: Re: [linux-next:master 2238/9385] drivers/gpu/drm/i915/display/intel_display_power.h:256:70:
 error: declaration of 'struct seq_file' will not be visible outside of this function
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexander Gordeev <agordeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 4:25=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Tue, Jun 13, 2023 at 10:39:01PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
> > commit: ef104443bffa004f631729dfc924f0b84abbd602 [2238/9385] procfs: co=
nsolidate arch_report_meminfo declaration
> > config: x86_64-randconfig-r036-20230612 (https://download.01.org/0day-c=
i/archive/20230613/202306132237.Z4LJE8bP-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.gi=
t 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > reproduce (this is a W=3D1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Def104443bffa004f631729dfc924f0b84abbd602
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout ef104443bffa004f631729dfc924f0b84abbd602
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306132237.Z4LJE8bP-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from <built-in>:4:
> >    In file included from drivers/gpu/drm/i915/display/intel_display_pow=
er_well.h:10:
> > >> drivers/gpu/drm/i915/display/intel_display_power.h:256:70: error: de=
claration of 'struct seq_file' will not be visible outside of this function=
 [-Werror,-Wvisibility]
> >    void intel_display_power_debug(struct drm_i915_private *i915, struct=
 seq_file *m);
>
> This seems odd. Arnd, any idea?

-Wvisibility is usually the result of a missed header inclusion.
Since the parameter `i915` is a pointer to a type that hasn't been
declared yet, it's an opaque type.  The code can compile just fine if
the members are not accessed, but this is usually a code smell of
someone using a type without the correct #include or forward
declaration.

I see lots of forward declaration of `struct drm_i915_private` in
headers under drivers/gpu/drm/i915/, but maybe
drivers/gpu/drm/i915/display/intel_display_power_well.h is missing
one?

commit ef1e17089190 ("drm/i915: Move power well get/put/enable/disable
functions to a n

seems to have added it though...
--=20
Thanks,
~Nick Desaulniers

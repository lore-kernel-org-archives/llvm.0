Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A411629CA
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 18:09:58 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id q66so23118996vsa.4
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 11:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sr1N3OdR9r/bSiG1VxeyejkeCTjyewOKJdAHjGzabZA=;
        b=NRUFnCvqrbcWBlRTBuvHRadwTihpbiSmPh7jdF8AbAqXsDUq5eCyq15FGHdOYSyAli
         30HR05aVZFQW0yKLTnteHcH0AxcMhNK8eNb8gzfKeR+HdrW2mwWlM8OcEvQBTKjrKjuq
         2HTWR6yYhELqahs6c8sgBlFNDfsjtEAljY/1Tb/HqKwgbyewN7qrRhvFD6YWYvX/GN+/
         tlUtHeIAbckXwy12ZInsXqjyqSUJDiYr2limpg91gz1JALXDGJTC91bPmJcA9gT4QE0c
         pTmE05jLGwK23hCDJAolPhnn8crGTifvnd1XiTM1X4r+0lbhtQjDCN5Bp4Pu2Z7EIYlL
         SZBw==
X-Gm-Message-State: AOAM5329bO6z/4t/9MP+59tnCPYNC/Sp3Mh0L60H5JC5VTVN75ix7rP5
	Iu3nGnKzclliB5+0UqdJTXpWCvND7LKMvwenRxQ=
X-Google-Smtp-Source: ABdhPJwN5gXFR0tjZSDhFmg+f0NFG4JJ6iP9/Qypk5MWyQdIWLY3eox0kHc0hmuU+a19StfWP+Ieloi5kCItsQ7douo=
X-Received: by 2002:a67:f147:: with SMTP id t7mr6925773vsm.41.1632852597572;
 Tue, 28 Sep 2021 11:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202109282205.VsHhj6PP-lkp@intel.com> <CAMuHMdX0Zm_hMheZ0e1Xu991jnUr=aY_cDBHHGFvQ1sKqM1b9A@mail.gmail.com>
 <YVNGMg/TI+jo/1R1@archlinux-ax161>
In-Reply-To: <YVNGMg/TI+jo/1R1@archlinux-ax161>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Sep 2021 20:09:46 +0200
Message-ID: <CAMuHMdVfbAhCCxzKgbW1rPrzkS6Z7DU5vu4G6wTsBvHRb6yBpA@mail.gmail.com>
Subject: Re: drivers/gpu/drm/kmb/kmb_dsi.c:812:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Tue, Sep 28, 2021 at 6:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Sep 28, 2021 at 05:39:19PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Sep 28, 2021 at 5:09 PM kernel test robot <lkp@intel.com> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   0513e464f9007b70b96740271a948ca5ab6e7dd7
> > > commit: ade896460e4a62f5e4a892a98d254937f6f5b64c drm: DRM_KMB_DISPLAY should depend on ARCH_KEEMBAY
> > > date:   11 months ago
> > > config: mips-randconfig-r013-20210928 (attached as .config)
> > > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install mips cross compiling tool for clang build
> > >         # apt-get install binutils-mips-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ade896460e4a62f5e4a892a98d254937f6f5b64c
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout ade896460e4a62f5e4a892a98d254937f6f5b64c
> > >         # save the attached .config to linux build tree
> > >         mkdir build_dir
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/kmb/ drivers/net/ethernet/mellanox/mlxsw/ mm/
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/gpu/drm/kmb/kmb_dsi.c:812:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits'
> > >    set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi
> > >    ^
> > > >> drivers/gpu/drm/kmb/kmb_dsi.c:824:2: warning: unused function 'set_test_mode_src_osc_freq_target_hi_bits'
> > >    set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi
> >
> > These two functions are "static inline", so there should not be such
> > warning. Toolchain issue?
>
> No toolchain issue, Masahiro specifically made clang W=1 builds warns on
> static inline unused functions because of instances like this, see
> commit 6863f5643dd7 ("kbuild: allow Clang to find unused static inline
> functions for W=1 build").

IC, I wasn't aware of that work.

Anyway, the "first bad commit" is the commit introducing the code, not
my commit enabling compile-testing (nor Yamada-san's commit to warn
about it ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

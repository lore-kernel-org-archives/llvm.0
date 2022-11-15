Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07586AD5B;
	Tue, 15 Nov 2022 15:25:49 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso16532029fac.13;
        Tue, 15 Nov 2022 07:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uf8eu5IHbsDfWimmQsuwfxum/RNqHnjNqe3CsnW4ODc=;
        b=ikmF9JxUpBONmpcB4mzORfWBa/U1MTdwn3R1w2i5sutlkkgDz2uf68CziFe1RGek0H
         ymxBrI5njHy6B+kik73RyUlRCgZfD7sIFThovrodiuWz+5+yNab4qwn3Uds5107w5qC2
         mw8RsuqzuKJ5NwUC9kyOGIs8KX7d9S3xfLIaA44i17Fee0LUFnj95K9sC9OzRWD7zsJx
         qGaRROVBmJgg5d5YPjjlhTH0/8mrTgAtmE/L+EnPFypNw6LDMi90wh7u3YHEGOlG0Y65
         hBHByElsZnzLV0chPGnDX18wALjp+3sby4TdwBxbU4gu0SZpGp2v1cAl/84NVr1Y+2Ud
         1faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf8eu5IHbsDfWimmQsuwfxum/RNqHnjNqe3CsnW4ODc=;
        b=Nz7XoyYb/AA+Lw4bLvInimcO7KLmt4mQ+rOpLSYQp+KUGX9JpQ1jNAZIiztK6Ux+1R
         O7i6FDIB3LLoUgRZARohINmqCUBqoXJIf3IzXBQc1bpyV23MH7DAUwgdrM+c3Ie2G7OO
         y96z/3/cnY0KLKN8BpNTkxdSCOOtaZj1K7HNqU5aKk1K5hK/2kocYAo4YITlRdSYq9Qh
         Ezs3SzcylTX+VLSMT7jF/oFsGf1a/MnImtQhN8M/95ecpJb4ncTf8oWZOAAtp6TGIKDy
         aTG/6TaFaow6Enmd3pIhw2vM3mUurlsQkW4ZlXYrgREjpR+fEhiDm5amksP32JBA0IBg
         DQMQ==
X-Gm-Message-State: ANoB5pkDrnVZ/G7LfXrdsCRKibA767PhH0rY5NkKV3Igm/Usv/wdI60G
	ZrLy8/1ln8BVcPpiTYTv/Rotf85QUXn5DI1edqY=
X-Google-Smtp-Source: AA0mqf6axPAl4K74OTmpMsym8LhatuCUAC7ETdoLLJHpfWJjYEZyOp1QCQXXRwmLeNZYB7dInHo7safsXwykqiqyhnY=
X-Received: by 2002:a05:6870:5894:b0:13b:5fff:1d84 with SMTP id
 be20-20020a056870589400b0013b5fff1d84mr631074oab.190.1668525949001; Tue, 15
 Nov 2022 07:25:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin@gmail.com>
 <202211140427.Bd5Zjdbe-lkp@intel.com> <CADvbK_ezonDWaT5fUdc0w5+y91PEaHc8YveV8KGyBC7sH3fWmw@mail.gmail.com>
 <cf4ba8ec52db5fabf61032a355d2a2b57f9bb0d5.camel@redhat.com>
In-Reply-To: <cf4ba8ec52db5fabf61032a355d2a2b57f9bb0d5.camel@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 15 Nov 2022 10:25:15 -0500
Message-ID: <CADvbK_cvS4vJYb_jW=W20bXTpV0Fu4=eSsPEsO4pM5NLGfmwdA@mail.gmail.com>
Subject: Re: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and ep lookup
To: Paolo Abeni <pabeni@redhat.com>
Cc: kernel test robot <lkp@intel.com>, network dev <netdev@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Neil Horman <nhorman@tuxdriver.com>, 
	David Ahern <dsahern@gmail.com>, Carlo Carraro <colrack@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022 at 5:19 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On Mon, 2022-11-14 at 21:38 -0500, Xin Long wrote:
> > On Sun, Nov 13, 2022 at 3:15 PM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Xin,
> > >
> > > Thank you for the patch! Yet something to improve:
> > >
> > > [auto build test ERROR on net-next/master]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/sctp-support-vrf-processing/20221114-004540
> > > patch link:    https://lore.kernel.org/r/86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin%40gmail.com
> > > patch subject: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and ep lookup
> > > config: arm-randconfig-r034-20221114
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 463da45892e2d2a262277b91b96f5f8c05dc25d0)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm cross compiling tool for clang build
> > >         # apt-get install binutils-arm-linux-gnueabi
> > >         # https://github.com/intel-lab-lkp/linux/commit/6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
> > >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> > >         git fetch --no-tags linux-review Xin-Long/sctp-support-vrf-processing/20221114-004540
> > >         git checkout 6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/openvswitch/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from net/openvswitch/actions.c:26:
> > >    In file included from include/net/sctp/checksum.h:27:
> > > > > include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
> > >            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
> > >                                        ~~~  ^
> > The build disabled IP_SCTP, while net/sctp/sctp.h is included in other modules.
> > Instead of "net/sctp/sctp.h", "linux/sctp.h" should be included, I
> > will send another patch series to fix them.
> >
> > We do NOT need to change anything in this series.
>
> 'net->sctp' is defined only when CONFIG_SCTP is enabled. AFAICS the new
> helper introduced by this patch is the only function in sctp.h
> accessing 'net->sctp', so prior to this patch including sctp.h with
>
> # CONFIG_SCTP is not set
>
> was apparently safe, while not it breaks the build.
>
> I think the issue should be addressed here.
I just think it's not correct to include "net/sctp/sctp.h" if one doesn't
depend on SCTP module. I'd rather consider "net/sctp/sctp.h" as
part of SCTP module.

I can fix it by simply moving this function to like net/sctp/input.c, it
just doesn't look good. Anyway, maybe I will do it to solve the build
error in the current patch first.

Thanks.

>
> Thanks,
>
> Paolo
>

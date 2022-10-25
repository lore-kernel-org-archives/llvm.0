Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1F7B
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 07:48:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id g7so20521587lfv.5
        for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TatISEx+sQHO6gLP3Kul1Dx3k+yJa8icqfGfmxu3s90=;
        b=Y7tndJfbw14MDRIENReSs6+KN8PYFUEO3o0tlBB3EPbGlXGPk99hRJAWBu0k0SqlOC
         HHWOjI6P99hzQwH2M3U5hv1yogIAfdeHmdEZX0QYv9tEM5dKKNtmKNKdXufRsaHS2/8u
         ZmBLUvcLAsM29M06LnWQzBXNFgrnx9R3cr+iwujSNjCVfXMPjXOxQeGFT4X0wAJb9QkG
         VO1Hi6giSnuLJ7I2gjfJSVnvicdOU9EbqXdei/ZNiLZVkO2otzIvm3QNcaYYeXp2t3gB
         nKnAfIdAdIJOMA7Av8PNkihJRMAi4dzNzx+2uN6zDUjTvZkJz8D7GPEuuS4HCKxNCBDx
         KvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TatISEx+sQHO6gLP3Kul1Dx3k+yJa8icqfGfmxu3s90=;
        b=XPP9QF3a9Yahk7E4WacIO6s+pkVwiMkdfVbsomWeiEn4mrqXyp6vmAunJunLJRA4/Q
         CRZ9QhTvZHC799Coir2ZATEv+W9mIWVyG3qh5aj+X1Yci+NkqRu21BoOGXsCfKatudAg
         8e7ng55djkKUwztAXbSDC9r5//P2vEwie/B+fCwbLZvyRWVWZKd78LXmYKZWOIDCHJue
         Ar721qW7BCg1rdX0u1xh24H5fT+S06xu3dVjsTzsuBgg+9WenYoDdGwzR5cYv+4+/9Gz
         MVsRvPi2N0verp+PlVIDyNSWzG1Uw23o09xuqLyCu+r2uDKUuOFZ7e/Pn69Hr4RPnU4H
         lewQ==
X-Gm-Message-State: ACrzQf1O6Wz76vs48/8b4QwyZQ7zQ8Ud9uMcdBXPc3nU/wGExn1R8hPH
	9ywHdwPVUzgf+5eyobaxW+3CIgfqFkhCR9NiiQDxXg==
X-Google-Smtp-Source: AMsMyM5Edw0Bu99iH1SfjSlO9212yslmpsDx9fTjciP1z3uMoex9Q3Ep9R819kaMVlPdxXy8Sc2ncu6duVKucoSm8Rc=
X-Received: by 2002:ac2:46d9:0:b0:4a2:22e1:4ad1 with SMTP id
 p25-20020ac246d9000000b004a222e14ad1mr12602816lfo.19.1666684125349; Tue, 25
 Oct 2022 00:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210211004.sOqZyVWM-lkp@intel.com> <CAMGffEnpQiYm94hJLYFXTOX7DNPrZDUERrz97QENsNuHVa5JEQ@mail.gmail.com>
 <CAPhsuW6POWR8-My-jCaVetLV5puAA5rSPSnxGiAffGQmNYU5wg@mail.gmail.com>
In-Reply-To: <CAPhsuW6POWR8-My-jCaVetLV5puAA5rSPSnxGiAffGQmNYU5wg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 25 Oct 2022 09:48:34 +0200
Message-ID: <CAMGffEk-xYdx9EgdsFVG2bW5w6z1Z3EAb=pN8nHrF3HbzBzY6g@mail.gmail.com>
Subject: Re: [song-md:md-next 6/6] drivers/md/md-bitmap.c:2541:12: warning:
 result of comparison of constant 4294967296 with expression of type 'unsigned
 long' is always false
To: Song Liu <song@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 7:08 PM Song Liu <song@kernel.org> wrote:
>
> On Mon, Oct 24, 2022 at 7:31 AM Jinpu Wang <jinpu.wang@ionos.com> wrote:
> >
> > On Fri, Oct 21, 2022 at 4:21 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
> > > head:   c748adfcbe0bd0c760c68d78434a1dfc0344b6b6
> > > commit: c748adfcbe0bd0c760c68d78434a1dfc0344b6b6 [6/6] md/bitmap: Fix bitmap chunk size overflow issues
> > > config: i386-randconfig-a004
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=c748adfcbe0bd0c760c68d78434a1dfc0344b6b6
> > >         git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
> > >         git fetch --no-tags song-md md-next
> > >         git checkout c748adfcbe0bd0c760c68d78434a1dfc0344b6b6
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/md/md-bitmap.c:2541:12: warning: result of comparison of constant 4294967296 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
> > >            if (csize >= (1ULL << (BITS_PER_BYTE *
> > >                ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    1 warning generated.
> > >
> > Thx for catch it.
> > This can be fixed by:
> > diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> > index 44f29cb1fde1..be9f3a768c9f 100644
> > --- a/drivers/md/md-bitmap.c
> > +++ b/drivers/md/md-bitmap.c
> > @@ -2538,7 +2538,7 @@ chunksize_store(struct mddev *mddev, const char
> > *buf, size_t len)
> >         if (csize < 512 ||
> >             !is_power_of_2(csize))
> >                 return -EINVAL;
> > -       if (csize >= (1ULL << (BITS_PER_BYTE *
> > +       if (BITS_PER_LONG == 64 && csize >= (1ULL << (BITS_PER_BYTE *
> >
> > Song, do you want a seperate fix or will you fold it into the patch itself?
>
> Please fold this in the patch and resend. I will replace the commit and force
> push to md-next.
ok, done!
https://lore.kernel.org/linux-raid/20221025073705.17692-1-jinpu.wang@ionos.com/T/#u
>
> Thanks,
> Song
>
> > >
> > > vim +2541 drivers/md/md-bitmap.c
> > >
> > >   2526
> > >   2527  static ssize_t
> > >   2528  chunksize_store(struct mddev *mddev, const char *buf, size_t len)
> > >   2529  {
> > >   2530          /* Can only be changed when no bitmap is active */
> > >   2531          int rv;
> > >   2532          unsigned long csize;
> > >   2533          if (mddev->bitmap)
> > >   2534                  return -EBUSY;
> > >   2535          rv = kstrtoul(buf, 10, &csize);
> > >   2536          if (rv)
> > >   2537                  return rv;
> > >   2538          if (csize < 512 ||
> > >   2539              !is_power_of_2(csize))
> > >   2540                  return -EINVAL;
> > > > 2541          if (csize >= (1ULL << (BITS_PER_BYTE *
> > >   2542                  sizeof(((bitmap_super_t *)0)->chunksize))))
> > >   2543                  return -EOVERFLOW;
> > >   2544          mddev->bitmap_info.chunksize = csize;
> > >   2545          return len;
> > >   2546  }
> > >   2547
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp

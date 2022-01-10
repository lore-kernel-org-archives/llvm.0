Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3C9173
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 21:22:58 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id j11so49117369lfg.3
        for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 13:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gD7CSDwfxy/Lif/7IpTLd88iEhqR78uzddJXBpdBxoI=;
        b=J7l6MTe7Bv1qp+GA1nNeDfDzSVvgtYWd5VNznpN9Y2YSIsJyb6QDDwTf1NsqpGsDIW
         eHPdcQz5lB2cZ9Mauqv4YsF60i2viwrvzLwCGAm+0sGEk55WL9gCZYmM89KyPUDF3C7A
         dLLZY4GsiCuH2gfj8vYzfU/5ud7lpj9Mvf2bpVWJxJpJgtvxLnRX7T0rtCVh37UYFNqo
         rHPoL0My+JOlDorgaXhXV8tnrS4zwry4BtrTjwpmts5MLCTw7M4mpxlwJIFdiMKIXXZn
         9BoL7RDYDVGOg+1xMUMx/yOBOAieHPv2O1QRYfuCJ0EHb079ElSHhDEg4hA5jJSgXrds
         dxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gD7CSDwfxy/Lif/7IpTLd88iEhqR78uzddJXBpdBxoI=;
        b=wzAkW9nL0W98QqPSFBZCdruX/J3xnGpdpD7t9hS0foU662gBMDmND0glyXImNy4rHk
         Rh60hwYNNFIxDTzaqbXXSjb7juhVV7s+LDaxnsdXV4TTwvQ8g0kPHb+9BWhM6LG0VZ+K
         wWykSdcvyYqthCmDFJGFDBZCCXZy6Xc8Wq88u9h5EU/JIX/labeTnZuGyqw1Sj6Ugzai
         e5CZVGkjtfR4wZqmp/vu9AQzbKnHJAGn8hkqY+xZ6XZnCcaG+UErhob7kbWOMyOX/pvC
         hneSQ83klAb59ArhHPhqpIuB0icnpnGzKViaNY9UEVMUJej8UEcErFu8iiRq6Mycz2Dn
         eyQw==
X-Gm-Message-State: AOAM533plIKRfGsWgvwShQZPMJFoPf0cqRF8DPpY7ZiZV174FyOa+3W3
	ldO4AM8sdKVZB/UGtXjbOOWGciPzA4WQsSUurMtbbw==
X-Google-Smtp-Source: ABdhPJzLjIY8fVRDt8uU5TNENsCoG+YvyzB8/FtAQ+ws5z4mSnYa4ns1JadsuKfZW2ucp34oTJJ8E7ncPRGtz6qLoWE=
X-Received: by 2002:a05:6512:1192:: with SMTP id g18mr738593lfr.523.1641849776060;
 Mon, 10 Jan 2022 13:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202201081852.uTfBqS4b-lkp@intel.com> <CAHp75VfS-4B1AwzawCR7VVAxopK6ACcY63ig07OqY32MswfoOQ@mail.gmail.com>
 <CAKwvOdk9XFOL2RAh5+FKWMR9jWFwrS=J+ogwUPj5OOLXcr-iSQ@mail.gmail.com> <YdybwqL1NtF39Wyd@smile.fi.intel.com>
In-Reply-To: <YdybwqL1NtF39Wyd@smile.fi.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Jan 2022 13:22:43 -0800
Message-ID: <CAKwvOdnAXBLE-MjMS6=0jZmkK_3MYTxD2OQjdnxbcnTL9rH_fw@mail.gmail.com>
Subject: Re: drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking
 address of packed member 'pixelformat' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Petr Mladek <pmladek@suse.com>, Roman Lebedev <lebedev.ri@gmail.com>, 
	Richard Smith <richard@metafoo.co.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 12:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jan 10, 2022 at 11:44:12AM -0800, Nick Desaulniers wrote:
> > On Sun, Jan 9, 2022 at 6:26 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > +Nick Desaulniers
> > >
> > > Any ideas on how to fix this?
> >
> > Not obviously.
>
> Thanks for looking into this!
>
> > This code probably will trigger a splat when run with
> > UBSan though.
> >
> > I'm curious if the structure needs to be packed for interfacing with
> > hardware or some ABI, or whether we could add an explicit alignment to
> > the member if that would be ok (which may add back some padding)?
>
> Looking into it I think removing packed attribute brings a regression
> immediately on 64-bit platforms since u32 member followed by u8.
>
> > Otherwise, I suspect to actually access this properly we may have
> > macros for performing underaligned loads and stores?  I suspect you'd
> > read potentially unaligned data into an aligned copy, then do
> > operations on that, at which point printing the address of the copy is
> > legal, but perhaps useless.
>
> Current code does this:
>
>         val = *fourcc & ~BIT(31);
>         ...
>         for (i = 0; i < sizeof(*fourcc); i++) {
>         ...
>         strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
>         ...
>         p = special_hex_number(p, output + sizeof(output) - 2, *fourcc, sizeof(u32));
>
> If unaligned access is not good it will crash on some architectures AFAIU.
>
> So, it should use get_unaligned() in the first place.

Regardless of your unaligned access patch
(https://lore.kernel.org/lkml/20220110205049.11696-1-andriy.shevchenko@linux.intel.com/),
taking the address of a packed member will still have a warning:
https://godbolt.org/z/8r1rcocPY

So it looks like packing a struct sets the alignment of members to 1,
ie. under-aligning them.  You need to restore the alignment of the
members you plan to take the address of.

ie.

struct w {
  char x, y, z;
} __attribute__((packed));

is equivalent in layout and alignment to:

struct w {
  char __attribute__((aligned(1))) x;
  char __attribute__((aligned(1))) y;
  char __attribute__((aligned(1))) z;
} __attribute__((aligned(1)));

For `struct v4l2_pix_format_mplane` we probably want the trailing
char's to have alignment 1, rather than every member. We can either be
explicit with __aligned(1) on them, or __aligned(4) on the uint
members and retain __packed.

>
> > Perhaps:
> >
> > -       __u32                           pixelformat;
> > +       __u32                           pixelformat __aligned(4);
>
> This looks weird, however I can't immediately see any side effects of it.
> What if the address of the entire structure is unaligned, would we have a
> gap here? In any case I wouldn't go this way.
>
> >         __u32                           field;
> >         __u32                           colorspace;
> >
> > Perhaps we could tighten up this warning in clang; we don't have any
> > holes before this member, so I _wouldn't_ have assumed
> > __attribute__((packed)) would have caused the address of pixelformat
> > member of an instance of struct v4l2_pix_format_mplane to ever be
> > underaligned.
> >
> > > On Sun, Jan 9, 2022 at 3:53 PM kernel test robot <lkp@intel.com> wrote:
> > > >
> > > > Hi Sakari,
> > > >
> > > > FYI, the error/warning still remains.
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
> > > > commit: e927e1e0f0dd3e353d5556503a71484008692c82 v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
> > > > date:   11 months ago
> > > > config: mips-buildonly-randconfig-r002-20220107 (https://download.01.org/0day-ci/archive/20220108/202201081852.uTfBqS4b-lkp@intel.com/config)
> > > > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # install mips cross compiling tool for clang build
> > > >         # apt-get install binutils-mips-linux-gnu
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e927e1e0f0dd3e353d5556503a71484008692c82
> > > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > >         git fetch --no-tags linus master
> > > >         git checkout e927e1e0f0dd3e353d5556503a71484008692c82
> > > >         # save the config file to linux build tree
> > > >         mkdir build_dir
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/hid/ drivers/media/v4l2-core/ fs/
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
> > > >                            mp->width, mp->height, &mp->pixelformat,
> > > >                                                    ^~~~~~~~~~~~~~~
> > > >    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
> > > >            printk(KERN_CONT fmt, ##__VA_ARGS__)
> > > >                                    ^~~~~~~~~~~
> > > > >> drivers/media/v4l2-core/v4l2-ioctl.c:347:37: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_sdr_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
> > > >                    pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
> > > >                                                      ^~~~~~~~~~~~~~~~
> > > >    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
> > > >            printk(KERN_CONT fmt, ##__VA_ARGS__)
> > > >                                    ^~~~~~~~~~~
> > > > >> drivers/media/v4l2-core/v4l2-ioctl.c:353:5: warning: taking address of packed member 'dataformat' of class or structure 'v4l2_meta_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
> > > >                            &meta->dataformat, meta->buffersize);
> > > >                             ^~~~~~~~~~~~~~~~
> > > >    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
> > > >            printk(KERN_CONT fmt, ##__VA_ARGS__)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Thanks,
~Nick Desaulniers

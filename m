Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F753E57E
	for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkpR8xDX"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-45db3badadbso2514635137.3
        for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700046901; x=1700651701; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Na/qyJPpv7M2mD4KWI412UY7s6MpSD8TKED279inyuc=;
        b=dkpR8xDX9Ep0uVs09slJxCudB2DBa5NRzd2frhDPyGL1NPbFeS1lqqCPNXpOIJTM10
         i+1WGvl+oN5jDHrWvfG0gArAIESqnw1wz2nRPb61fZb53hZ9reE0ObQ8mpCHO9DQJf77
         4UueMqKWBgM5F3/31jF/fRD4srfYhK//bEPpPRfoaSeq/Xv6IdOSMzfs762BzG98yoPL
         JdgU2F+KFJhPxXX6/sBH+0bbYM5NCJZtH7GfT2ffEoKWWdehsaJYt0/wA/wL5DTiz3tE
         H1JNO7D3GhpDwGi10Xrm4VgznemlfU5Q/UKnCFCaCh8esen2NwbznrNqnELEPz10Xqxg
         xJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046901; x=1700651701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Na/qyJPpv7M2mD4KWI412UY7s6MpSD8TKED279inyuc=;
        b=FBaU5fLrqZuL7wSXcMX3JfqSvNHJeQf6fQuQoj7mnj1OGmTpVeSO26VwX0p9NACP7b
         Bqgb7mOkAt7DVxJUpwu9kMRH4T0m5UY2SV+e417XlQttKyqxBBD19YADB6cmnSZEuCki
         OC+g81b3C+3m4dcS9RpFfKSIW88Bxx10+OSIpF7jxda9gv/2Cqjv+1vv4UTho+J2Hj11
         4kye6rp406uQ6xN6UnpRBhpBa/y37hbMs5RDZ+9rYZZeVNc4BOHtunOTQ7xr7NcZ11JB
         dxbhCV/hxMvdfQjBCcutbxlF/k8hAHozH2x1VqJ59gvL2GOeqE0Qj46IM0OexcQBgLSG
         pqdQ==
X-Gm-Message-State: AOJu0YyBACc9QM8ufqcNNwKnpI6HVAbOOnMI+e7BT5hslx2/zW5B323E
	6q2O++V/0f+9gNE16bc0JeTLMNkh92oy1pS6tCRZWg==
X-Google-Smtp-Source: AGHT+IFTWpi4Ff/kgs493Yi1PtmVxMEBSw015UrnpDNqrt3IXeS1C8RYEVdQRr67V4vRMJRNPFGXcdY6WD7U8DE0Wd4=
X-Received: by 2002:a67:b202:0:b0:45f:8783:beaa with SMTP id
 b2-20020a67b202000000b0045f8783beaamr12841662vsf.12.1700046901398; Wed, 15
 Nov 2023 03:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231109210608.2252323-4-willy@infradead.org> <202311121240.AN8GbAbe-lkp@intel.com>
 <20231113091006.f9d4de1aaf7ed2f8beef07fb@linux-foundation.org> <20231113172052.GA3733520@dev-arch.thelio-3990X>
In-Reply-To: <20231113172052.GA3733520@dev-arch.thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 Nov 2023 16:44:49 +0530
Message-ID: <CA+G9fYuA_PTd7R2NsBvtNb7qjwp4avHpCmWi4=OmY4jndDcQYA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] buffer: Fix grow_buffers() for block size > PAGE_SIZE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Hannes Reinecke <hare@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Pankaj Raghav <p.raghav@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 13 Nov 2023 at 22:50, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Nov 13, 2023 at 09:10:06AM -0800, Andrew Morton wrote:
> > On Sun, 12 Nov 2023 12:52:00 +0800 kernel test robot <lkp@intel.com> wrote:
> >
> > > Hi Matthew,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on akpm-mm/mm-everything]
> > > [also build test ERROR on linus/master next-20231110]
> > > [cannot apply to v6.6]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/buffer-Return-bool-from-grow_dev_folio/20231110-051651
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > > patch link:    https://lore.kernel.org/r/20231109210608.2252323-4-willy%40infradead.org
> > > patch subject: [PATCH v2 3/7] buffer: Fix grow_buffers() for block size > PAGE_SIZE
> > > config: hexagon-comet_defconfig (https://download.01.org/0day-ci/archive/20231112/202311121240.AN8GbAbe-lkp@intel.com/config)
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121240.AN8GbAbe-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202311121240.AN8GbAbe-lkp@intel.com/

KFT CI also have been noticing this build problem on Linux next.
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> ld.lld: error: undefined symbol: __muloti4
> > >    >>> referenced by buffer.c
> > >    >>>               fs/buffer.o:(bdev_getblk) in archive vmlinux.a
> > >    >>> referenced by buffer.c
> > >    >>>               fs/buffer.o:(bdev_getblk) in archive vmlinux.a
> > >
> >
> > What a peculiar compiler.
> >
> > I assume this fixes?
> >
> > --- a/fs/buffer.c~buffer-fix-grow_buffers-for-block-size-page_size-fix
> > +++ a/fs/buffer.c
> > @@ -1099,7 +1099,7 @@ static bool grow_buffers(struct block_de
> >       }
> >
> >       /* Create a folio with the proper size buffers */
> > -     return grow_dev_folio(bdev, block, pos / PAGE_SIZE, size, gfp);
> > +     return grow_dev_folio(bdev, block, pos >> PAGE_SHIFT, size, gfp);
> >  }
> >
> >  static struct buffer_head *
> > _
> >
> >
>
> No, this is not a division libcall. This seems to be related to the
> types of the variables used in __builtin_mul_overflow() :/ for some odd
> reason, clang generates a libcall when passing in an 'unsigned long
> long' and 'unsigned int', which apparently has not been done before in
> the kernel?
>
> https://github.com/ClangBuiltLinux/linux/issues/1958
> https://godbolt.org/z/csfGc6z6c
>
> A cast would work around this but that could have other implications I
> am not aware of (I've done little further investigation due to LPC):

Thanks for providing this fix patch.


> diff --git a/fs/buffer.c b/fs/buffer.c
> index 4eb44ccdc6be..d39934783743 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1091,7 +1091,7 @@ static bool grow_buffers(struct block_device *bdev, sector_t block,
>          * Check for a block which lies outside our maximum possible
>          * pagecache index.
>          */
> -       if (check_mul_overflow(block, size, &pos) || pos > MAX_LFS_FILESIZE) {
> +       if (check_mul_overflow(block, (u64)size, &pos) || pos > MAX_LFS_FILESIZE) {
>                 printk(KERN_ERR "%s: requested out-of-range block %llu for device %pg\n",
>                         __func__, (unsigned long long)block,
>                         bdev);
>
> Cheers,
> Nathan

- Naresh

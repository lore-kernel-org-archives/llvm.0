Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBA2C9D
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 14:26:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w16so43060418edc.11
        for <llvm@lists.linux.dev>; Sun, 09 Jan 2022 06:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YkmGL52favIkjvoPNORhluY+p83nfOULm3gG+4UjRnc=;
        b=M0ptBZpA5Lr8s0K7el/F6yTRl6kHqshckMNaHlMxzqPVULNAjvaJTtBWkT0SsFiQ0M
         Bb5p7TOsNcMZeiuNGndRszEoWVp5giwdb/JdWLZeES96T+T22EI6Eklqt7cbVxQ6Y49+
         jIqApjJnlB2VSgrrxKPUuX1IXz8wmqOtlYhXNjI6IalhnQvY8unNJxQ5K5qrSX4bK41V
         zNDrnLFmIxB/gHD225bQlTT2GJUyleitgOiA0l3u5k4F28Z4AKgW6V+AiGV2C6k490O9
         rya4tb0qAqbWTcMsoXM4zu1kE9UJQvAcE0zw05rZ9mL267tudb5cjGIjiKPjmzDztYCT
         RG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkmGL52favIkjvoPNORhluY+p83nfOULm3gG+4UjRnc=;
        b=s5JuT/yYTZLfxGNuOrmuHGY9vkBP8w02XH46hAJIGUUaPJs2uei/VkYsfwlOj4wOOz
         gTWnyMGoll7ZBzsZ9qVo4eoazmPRD5hsyMM67eObavPm5H/cESK0tvQAACxGyTy3JKX4
         LR9xEhV/F+NbFuZuRJswG11fCYzfiVMFgEZFzbmjZZ/HBPWOH5vvWMm57jljzOZ4q2nV
         oEMFjA2EypIjxWFCkqMhCJaAJCmj6bUB2lul+FUMbDxSroiSOF32SJTp+Gdli2u1zuIg
         DuJZ44al7FeC+IOADo0xRdB1vxe9Zd44MVayPm7QGSEjakdECdL3THcMjrdIDBvOQfTG
         14Sw==
X-Gm-Message-State: AOAM530zt9y/zVlERY4UtC6mAuyHWAObopMqXAytRd5I0P4CJ5N5zdxA
	fWEhzObTTv6qS9j9IwisylUoOwZcjWVno7caeiE=
X-Google-Smtp-Source: ABdhPJwwUQo0sCHU+v67EXzyA4WoIbBsh55dmOjoIxDssnOPbKoVW58WngVceJaEOQ6YGBrM2tbwwcXxK2GWR/mmA1E=
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr4719106edw.122.1641738415346;
 Sun, 09 Jan 2022 06:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202201081852.uTfBqS4b-lkp@intel.com>
In-Reply-To: <202201081852.uTfBqS4b-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 9 Jan 2022 16:26:19 +0200
Message-ID: <CAHp75VfS-4B1AwzawCR7VVAxopK6ACcY63ig07OqY32MswfoOQ@mail.gmail.com>
Subject: Re: drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking
 address of packed member 'pixelformat' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
To: kernel test robot <lkp@intel.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

+Nick Desaulniers

Any ideas on how to fix this?


On Sun, Jan 9, 2022 at 3:53 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Sakari,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
> commit: e927e1e0f0dd3e353d5556503a71484008692c82 v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
> date:   11 months ago
> config: mips-buildonly-randconfig-r002-20220107 (https://download.01.org/0day-ci/archive/20220108/202201081852.uTfBqS4b-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e927e1e0f0dd3e353d5556503a71484008692c82
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e927e1e0f0dd3e353d5556503a71484008692c82
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/hid/ drivers/media/v4l2-core/ fs/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
>                            mp->width, mp->height, &mp->pixelformat,
>                                                    ^~~~~~~~~~~~~~~
>    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
>            printk(KERN_CONT fmt, ##__VA_ARGS__)
>                                    ^~~~~~~~~~~
> >> drivers/media/v4l2-core/v4l2-ioctl.c:347:37: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_sdr_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
>                    pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
>                                                      ^~~~~~~~~~~~~~~~
>    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
>            printk(KERN_CONT fmt, ##__VA_ARGS__)
>                                    ^~~~~~~~~~~
> >> drivers/media/v4l2-core/v4l2-ioctl.c:353:5: warning: taking address of packed member 'dataformat' of class or structure 'v4l2_meta_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
>                            &meta->dataformat, meta->buffersize);
>                             ^~~~~~~~~~~~~~~~
>    include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
>            printk(KERN_CONT fmt, ##__VA_ARGS__)
>                                    ^~~~~~~~~~~
>    3 warnings generated.
>
>
> vim +303 drivers/media/v4l2-core/v4l2-ioctl.c
>
>    273
>    274  static void v4l_print_format(const void *arg, bool write_only)
>    275  {
>    276          const struct v4l2_format *p = arg;
>    277          const struct v4l2_pix_format *pix;
>    278          const struct v4l2_pix_format_mplane *mp;
>    279          const struct v4l2_vbi_format *vbi;
>    280          const struct v4l2_sliced_vbi_format *sliced;
>    281          const struct v4l2_window *win;
>    282          const struct v4l2_sdr_format *sdr;
>    283          const struct v4l2_meta_format *meta;
>    284          u32 planes;
>    285          unsigned i;
>    286
>    287          pr_cont("type=%s", prt_names(p->type, v4l2_type_names));
>    288          switch (p->type) {
>    289          case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>    290          case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>    291                  pix = &p->fmt.pix;
>    292                  pr_cont(", width=%u, height=%u, pixelformat=%p4cc, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
>    293                          pix->width, pix->height, &pix->pixelformat,
>    294                          prt_names(pix->field, v4l2_field_names),
>    295                          pix->bytesperline, pix->sizeimage,
>    296                          pix->colorspace, pix->flags, pix->ycbcr_enc,
>    297                          pix->quantization, pix->xfer_func);
>    298                  break;
>    299          case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>    300          case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>    301                  mp = &p->fmt.pix_mp;
>    302                  pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
>  > 303                          mp->width, mp->height, &mp->pixelformat,
>    304                          prt_names(mp->field, v4l2_field_names),
>    305                          mp->colorspace, mp->num_planes, mp->flags,
>    306                          mp->ycbcr_enc, mp->quantization, mp->xfer_func);
>    307                  planes = min_t(u32, mp->num_planes, VIDEO_MAX_PLANES);
>    308                  for (i = 0; i < planes; i++)
>    309                          printk(KERN_DEBUG "plane %u: bytesperline=%u sizeimage=%u\n", i,
>    310                                          mp->plane_fmt[i].bytesperline,
>    311                                          mp->plane_fmt[i].sizeimage);
>    312                  break;
>    313          case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>    314          case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
>    315                  win = &p->fmt.win;
>    316                  /* Note: we can't print the clip list here since the clips
>    317                   * pointer is a userspace pointer, not a kernelspace
>    318                   * pointer. */
>    319                  pr_cont(", wxh=%dx%d, x,y=%d,%d, field=%s, chromakey=0x%08x, clipcount=%u, clips=%p, bitmap=%p, global_alpha=0x%02x\n",
>    320                          win->w.width, win->w.height, win->w.left, win->w.top,
>    321                          prt_names(win->field, v4l2_field_names),
>    322                          win->chromakey, win->clipcount, win->clips,
>    323                          win->bitmap, win->global_alpha);
>    324                  break;
>    325          case V4L2_BUF_TYPE_VBI_CAPTURE:
>    326          case V4L2_BUF_TYPE_VBI_OUTPUT:
>    327                  vbi = &p->fmt.vbi;
>    328                  pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%p4cc, start=%u,%u, count=%u,%u\n",
>    329                          vbi->sampling_rate, vbi->offset,
>    330                          vbi->samples_per_line, &vbi->sample_format,
>    331                          vbi->start[0], vbi->start[1],
>    332                          vbi->count[0], vbi->count[1]);
>    333                  break;
>    334          case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
>    335          case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
>    336                  sliced = &p->fmt.sliced;
>    337                  pr_cont(", service_set=0x%08x, io_size=%d\n",
>    338                                  sliced->service_set, sliced->io_size);
>    339                  for (i = 0; i < 24; i++)
>    340                          printk(KERN_DEBUG "line[%02u]=0x%04x, 0x%04x\n", i,
>    341                                  sliced->service_lines[0][i],
>    342                                  sliced->service_lines[1][i]);
>    343                  break;
>    344          case V4L2_BUF_TYPE_SDR_CAPTURE:
>    345          case V4L2_BUF_TYPE_SDR_OUTPUT:
>    346                  sdr = &p->fmt.sdr;
>  > 347                  pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
>    348                  break;
>    349          case V4L2_BUF_TYPE_META_CAPTURE:
>    350          case V4L2_BUF_TYPE_META_OUTPUT:
>    351                  meta = &p->fmt.meta;
>    352                  pr_cont(", dataformat=%p4cc, buffersize=%u\n",
>  > 353                          &meta->dataformat, meta->buffersize);
>    354                  break;
>    355          }
>    356  }
>    357
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
With Best Regards,
Andy Shevchenko

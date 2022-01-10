Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413062CA1
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 23:12:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id i31so49888412lfv.10
        for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 15:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oEylbjmXS8n0jIhiDpJJ6W1qy0sFrwfhJUGK1ITijYY=;
        b=AHNsDrCyhR5bh1Pb4SBWxVKDKtF85SHcP8rw6FLLKCZ1qTjim4KF1jlK3AtRGnCDGc
         b9+HZrNBBQhioYEucZlhNMR6lPdcZVt2M3EGl9dxkDdhhPZy8mfzLMCVsASK8ym7940Y
         mI2XUaDw1h+/B1PqZVWqYBMzGNjx+0ob41q9cmtdAoJT0h9kbyqlmqwfM9cZjHmUG2LY
         1HOAoF7K36rT/VzqL5vDjYQ5F7iRlYpGNqXWKuYF8iP8aAo1PFdaZbvG//R5wte8XnRY
         HuskKYNmQssx2gjzhToIW7xADqRbgIoE9aMYkyH91LgeKnNg5O/cqmHCp6DUFfIrAj5D
         Iemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oEylbjmXS8n0jIhiDpJJ6W1qy0sFrwfhJUGK1ITijYY=;
        b=x7M1eSIBN18l4KPfXXhLnG6/t6OeWhcovGNmJeHvi+YcXCEAS3V/HoqVlfI9GSod2/
         8qwDMJW/b1KDKI+hsQr57qT3aLhXuqcK5Yf0d+I6hCBIsavRQP5ikFUnSwDoilBM+QjU
         3obXosV9wBtpni5L/0IbFh/J/0NnzHGu1+4Rg67xNYGvbVXeF8WMkeH5o7QrlW5xfIIj
         zveBWR+jGljifFep/GcxRjtevHVQXoevpMFuAgOtYPr7unTwIw7RaHtPKWq0e2HtN3Mn
         Sg7M84ZNfclK6ooR+iOeTVUb+ssTbdv/dKEkXS1sMfZPFH/GZrwq1kpKT6O5CIonPtDx
         15ow==
X-Gm-Message-State: AOAM533SEgD5QsiHGKK37Spq95R2fSv007JlV1sqpI3PcLuXQe65c8w/
	zHq/K4XOGdDQlgXmb0SMbdwIgM0ytIgTeSafds2naGlLUTI=
X-Google-Smtp-Source: ABdhPJzRlqTrS4oGR25cOpcT15/S2W03HKgTyr0FgD57RiV3ioL1D8AU52pmi8yfAhPIKsehcbzMN+zRs8HhnXMxwsg=
X-Received: by 2002:a2e:b5c9:: with SMTP id g9mr6781ljn.339.1641856343892;
 Mon, 10 Jan 2022 15:12:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com> <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
In-Reply-To: <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Jan 2022 15:12:12 -0800
Message-ID: <CAKwvOdmcLo5D05pue4WgkgXxfD=21YaRoPLPYg8DogX9=-rUwQ@mail.gmail.com>
Subject: Fwd: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, Jan 10, 2022 at 3:11 PM
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when
printing 4cc modifiers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: <linux-media@vger.kernel.org>, Andy Shevchenko
<andriy.shevchenko@linux.intel.com>, <hverkuil@xs4all.nl>


On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> are directly passed to printk family of functions.

I would rephrase the below statement...

> This could result in an
> unaligned access albeit no such possibility appears to exist at the
> moment i.e. this clang warning appears to be a false positive.

...to:

warning: taking address of packed member 'pixelformat' of class or
structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
value [-Waddress-of-packed-member]

The warning is correct; because `struct v4l2_pix_format_mplane` is
__packed, it's members also have __aligned(1).  Taking the address of
such members results in the use of underaligned pointers which is UB
and may be caught by UBSAN or fault on architectures without unaligned
loads should the struct instance happen to be allocated without any
natural alignment.

>
> Address the warning by copying the pixelformat or dataformat value to a
> local variable first.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e927e1e0f0dd ("v4l: ioctl: Use %p4cc printk modifier to print FourCC codes")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Andy, Nick,
>
> How about this one?
>
> I believe it does address the clang warning although I haven't tested it.

LGTM. Thanks Sakari and Andy for pursuing this. Just a minor nit on my
side about the framing of this warning being a false positive; I don't
think it is.  With that amended,

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Kind regards,
> Sakari
>
>  drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9ac557b8e146..642cb90f457c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -279,8 +279,8 @@ static void v4l_print_format(const void *arg, bool write_only)
>         const struct v4l2_vbi_format *vbi;
>         const struct v4l2_sliced_vbi_format *sliced;
>         const struct v4l2_window *win;
> -       const struct v4l2_sdr_format *sdr;
>         const struct v4l2_meta_format *meta;
> +       u32 pixelformat;
>         u32 planes;
>         unsigned i;
>
> @@ -299,8 +299,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 mp = &p->fmt.pix_mp;
> +               pixelformat = mp->pixelformat;
>                 pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> -                       mp->width, mp->height, &mp->pixelformat,
> +                       mp->width, mp->height, &pixelformat,
>                         prt_names(mp->field, v4l2_field_names),
>                         mp->colorspace, mp->num_planes, mp->flags,
>                         mp->ycbcr_enc, mp->quantization, mp->xfer_func);
> @@ -343,14 +344,15 @@ static void v4l_print_format(const void *arg, bool write_only)
>                 break;
>         case V4L2_BUF_TYPE_SDR_CAPTURE:
>         case V4L2_BUF_TYPE_SDR_OUTPUT:
> -               sdr = &p->fmt.sdr;
> -               pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
> +               pixelformat = p->fmt.sdr.pixelformat;
> +               pr_cont(", pixelformat=%p4cc\n", &pixelformat);
>                 break;
>         case V4L2_BUF_TYPE_META_CAPTURE:
>         case V4L2_BUF_TYPE_META_OUTPUT:
>                 meta = &p->fmt.meta;
> +               pixelformat = meta->dataformat;
>                 pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -                       &meta->dataformat, meta->buffersize);
> +                       &pixelformat, meta->buffersize);
>                 break;
>         }
>  }
> --
> 2.30.2
>


--
Thanks,
~Nick Desaulniers


-- 
Thanks,
~Nick Desaulniers

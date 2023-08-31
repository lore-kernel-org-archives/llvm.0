Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3E5399
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 22:26:50 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-64f457c97a3so7687296d6.2
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693520809; x=1694125609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKlkGKYCgrWeKXNqJyo7pWKtqd+Hx7OjZxfb5gEIfrY=;
        b=Vjp8JvrSy1xNO+snAymvpyOnE3l0oSmtvAa5hVDdr1H603iD7N9QRgxSPYEM4dvbZd
         2l6LFXHC764cbSfJOkhMS64LNNWHuaBtYNuw73/mquPcDez6RitG2iokz6bJqPzpnhdg
         AWv4ypmFedGqwLNJ0xi1Mrse5iXDV4J38fAP6v144Fsfa+rZaKYGr4CRaeaGJlCeDr10
         By16c/Y73cwCK9P7wDCwoddLg1RHOc/q8FdyXUvbs6hWAKPlXJccCI8CXBeDLe87idiL
         hc8reIEpGvOO53Nt3xGG+O83fj62mMmNlEySFNEfI1MLOJk2UizWEkh6fi1jllsX5TqZ
         cDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693520809; x=1694125609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKlkGKYCgrWeKXNqJyo7pWKtqd+Hx7OjZxfb5gEIfrY=;
        b=UdJtAp4o8x80yfrR0ypJgIRi0FghYGTu/2iYlYOycf9dE/xXerENXzgX4Gklg7VIUF
         J3vhp5BF4+jixcKnGj2H4x3fzC12vy/irA90rN4Enp8VHoAYB7VdRtT/vujB3BnMHspy
         Hkb7/ywq49NTuBaDOY5iLbDOYr+XVNwDg4wfpCyN9ViqCBcypZkDDlMpVdZIfSgrBxtO
         AVqrRp6kZSIuZUxl+7UF6MK63IjgaHSfX6B2n8CrjH5NZwsKmhS+D+4fjAg17Gv1K1dC
         DQAYSPVFxQdJkTwDu6nJOPRvsb5eHaEFwAabLoZpGRaR7KZto06wl+U58yEYg1y3JQL0
         723Q==
X-Gm-Message-State: AOJu0YyV5CUvf6fUtg7WyCmNM8PCBx4Llcdylx1g1UFUcFbxxWwBOoKI
	DbKIMXzhqZ3ieKkhESlU13zsPOYxj0B3gM7T7q0mTg==
X-Google-Smtp-Source: AGHT+IHqutLf/Ndx2phVAuqZjb5qjCQ920NGHqHCD34nUPgPY+PJcMk8FLCrkS7O1NZpBb1oQRUn/bM3dMgktFBGgQY=
X-Received: by 2002:ad4:45aa:0:b0:64c:e8a3:fb68 with SMTP id
 y10-20020ad445aa000000b0064ce8a3fb68mr646024qvu.3.1693520809085; Thu, 31 Aug
 2023 15:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de> <ZPEEzkQcQOP9yVFF@ls3530>
 <CAKwvOdkXmEe46cG9Hn837215ghWA7UNKtg7ZQM8CpQcEQnoWfg@mail.gmail.com> <ZPERGqgkUwcWvr+4@ls3530>
In-Reply-To: <ZPERGqgkUwcWvr+4@ls3530>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 15:26:35 -0700
Message-ID: <CAKwvOdkqZwF_HqyPhm3hxOVpsWqhN4X=bwUw66=ZkPSpwGpLAA@mail.gmail.com>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 3:16=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
>
> * Nick Desaulniers <ndesaulniers@google.com>:
> > On Thu, Aug 31, 2023 at 2:23=E2=80=AFPM Helge Deller <deller@gmx.de> wr=
ote:
> > >
> > > * Helge Deller <deller@gmx.de>:
> > > > On 8/29/23 18:45, Nick Desaulniers wrote:
> > > > > A recent change in clang made it better about spotting snprintf t=
hat
> > > > > will result in truncation.  Nathan reported the following instanc=
es:
> > > > >
> > > > > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will alwa=
ys be
> > > > > truncated; specified size is 16, but format string expands to at =
least
> > > > > 17 [-Wfortify-source]
> > >
> > > FYI, I've added the patch below to the fbdev for-next git tree.
> > > [...]
> >
> > This indeed makes the warning go away, but that's more so due to the
> > use of strscpy now rather than snprintf.  That alone is a good change
> > but we still have definite truncation.  See below:
> > [...]
>
> Nick, thanks for your review and findings!
> Now every string should be max. 15 chars (which fits with the trailing
> NUL into the char[16] array).
>
> Helge
>
>
> Subject: [PATCH] fbdev: neofb: Shorten Neomagic product name in info stru=
ct
>
> Avoid those compiler warnings:
> neofb.c:1959:3: warning: 'snprintf' will always be truncated;
>    specified size is 16, but format string expands to at least 17 [-Wfort=
ify-source]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://lore.kernel.org/all/CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYG=
fKDNFdHwaeHQ@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1923

ah yeah LGTM

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index d2f622b4c372..b58b11015c0c 100644
> --- a/drivers/video/fbdev/neofb.c
> +++ b/drivers/video/fbdev/neofb.c
> @@ -1948,49 +1948,40 @@ static struct fb_info *neo_alloc_fb_info(struct p=
ci_dev *dev,
>
>         switch (info->fix.accel) {
>         case FB_ACCEL_NEOMAGIC_NM2070:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128");
> +               strscpy(info->fix.id, "MagicGraph128", sizeof(info->fix.i=
d));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2090:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128V");
> +               strscpy(info->fix.id, "MagicGraph128V", sizeof(info->fix.=
id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2093:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128ZV");
> +               strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2097:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128ZV+");
> +               strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2160:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128XD");
> +               strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2200:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256AV");
> +               strscpy(info->fix.id, "MagicGraph256AV", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2230:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256AV+");
> +               strscpy(info->fix.id, "Mag.Graph256AV+", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2360:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256ZX");
> +               strscpy(info->fix.id, "MagicGraph256ZX", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2380:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256XL+");
> +               strscpy(info->fix.id, "Mag.Graph256XL+", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>


--=20
Thanks,
~Nick Desaulniers

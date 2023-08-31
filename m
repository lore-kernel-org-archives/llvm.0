Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F938F57
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:41:47 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6515d44b562so7488976d6.3
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693518106; x=1694122906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6EyUV5AIADigxtAZQirTseOSVmlDyjeFuLsITzk200=;
        b=ALRLj1oQUTvFcJ/I58SwHOxGK+4Q6k0T0NJnLcRDbW4dJSehXMWLJ6tX+fA1peoikT
         G9JqaymStYDVWrRE0lRfbpwQTd9X9dDZdY13kJbDxUF7DgE9dbfHIey0ADmjzLpF/rhO
         zQXG/hI+ViOZlr67XxBd+WOsDeuIkU/hXGIUlfVxC6eKNlkdn+NJxguqiDixO7aUYBZU
         7ujdPw7noySzYz/9n6L/66oJWV3VZ7T3B/n1sy1jg2RyhreEuzP5jDT8eSKwKA4Mvz7g
         oDA8cWUvVSrCjwEGT/AuWmcfZJorQNGQvuYPxPbBsyNoK6p8jXiVhNSnkyFxg/tNFZ6p
         rzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693518106; x=1694122906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6EyUV5AIADigxtAZQirTseOSVmlDyjeFuLsITzk200=;
        b=filC/e431YPjz/xxZO01LNAXSDn2zJTBl9t2XBgiFlQ77JSBwzgSB6u1/4hOE2NVua
         knc7X46DZo+u9yqb/QaOS/g0dM2s1lvrDfcNwcT8FmOGrAKwNQb1oxcg6XcvYEDpX0b8
         Zyt3bA7eUcsX+YOYT6N2YFTXQTzDIbFTLVXtn/GPsMHIHmuB5Lbrs5V+TJYLILkC073D
         zo57iPNcbdv4W1YBpl9r6L/Z/Z7BJsbA69/jwpDX5IfGClxlul6H4ABGTEuaZrHnoI5f
         FrdDbO2yShDNunkV8GK8zDLeZ5cQ7LI1WnSN1T5sIfksz5k3juCFdF0nfap/K1hQ2pyz
         BXcw==
X-Gm-Message-State: AOJu0Yxkj/aUdrFPgSfmK4YaMUQd07lDofxhwaSiTw+FvPCuu4niqQsw
	5tfKPVm72Ab40UM9AaOaf0ZbFabfzNnD6NGcswAgHdSC7i1o3wriO1Zvpg==
X-Google-Smtp-Source: AGHT+IGxoP6SHPHqVHZs1D0kiIkGb5R071xC22qGM31a+vuVtjoP+27tmflqMxvtRHy65qHz3RLJTbR1jjJLZ+/Daoc=
X-Received: by 2002:a0c:e00b:0:b0:636:1aae:1bcc with SMTP id
 j11-20020a0ce00b000000b006361aae1bccmr479228qvk.39.1693518105881; Thu, 31 Aug
 2023 14:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de> <ZPEEzkQcQOP9yVFF@ls3530>
In-Reply-To: <ZPEEzkQcQOP9yVFF@ls3530>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 14:41:31 -0700
Message-ID: <CAKwvOdkXmEe46cG9Hn837215ghWA7UNKtg7ZQM8CpQcEQnoWfg@mail.gmail.com>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 2:23=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
>
> * Helge Deller <deller@gmx.de>:
> > On 8/29/23 18:45, Nick Desaulniers wrote:
> > > A recent change in clang made it better about spotting snprintf that
> > > will result in truncation.  Nathan reported the following instances:
> > >
> > > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always b=
e
> > > truncated; specified size is 16, but format string expands to at leas=
t
> > > 17 [-Wfortify-source]
>
> FYI, I've added the patch below to the fbdev for-next git tree.
>
> Helge
>
> From: Helge Deller <deller@gmx.de>
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

This indeed makes the warning go away, but that's more so due to the
use of strscpy now rather than snprintf.  That alone is a good change
but we still have definite truncation.  See below:

>
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index d2f622b4c372..b905fe93b525 100644
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

I see the Mag.Graph change here; I'm curious why MagicGraph256XL+
didn't need that, too?

MagicGraph128ZV+
MagicGraph256XL+

those look like the same number of characters; are they? Does this one
need the `.` change?

```
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index b905fe93b525..6b7836f7f809 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1957,7 +1957,7 @@ static struct fb_info *neo_alloc_fb_info(struct
pci_dev *dev,
                strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix.i=
d));
                break;
        case FB_ACCEL_NEOMAGIC_NM2097:
-               strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix.i=
d));
+               strscpy(info->fix.id, "MagicGraph128ZV+", sizeof(info->fix.=
id));
                break;
        case FB_ACCEL_NEOMAGIC_NM2160:
                strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix.i=
d));

```
Builds without error for me.  Though I guess the compiler doesn't know
what strscpy is semantically.

Ah
MagicGraph128ZV+
MagicGraph256XL+

are both 17 characters. (16 literal characters + trailing NUL)

So MagicGraph256XL+ (and MagicGraph256AV+) below will fail to copy the
NUL from the source, then overwrite the `+` with NUL IIUC.

There's no ambiguity for MagicGraph256XL+, but now MagicGraph256AV+
would look like MagicGraph256AV which is another possible variant.

Then perhaps MagicGraph256XL+ MagicGraph256AV+ and below might need to chan=
ge.

Sorry, initially it looked like a simple fix and I was ready to sign
off on it; I hope I'm mistaken.  Thank you for the patch, but do
consider sending it to the ML for review before committing.

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
> +               strscpy(info->fix.id, "MagicGraph256AV+", sizeof(info->fi=
x.id));
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
> +               strscpy(info->fix.id, "MagicGraph256XL+", sizeof(info->fi=
x.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;



--=20
Thanks,
~Nick Desaulniers

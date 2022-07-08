Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF214C72
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:39:20 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id a39so155532ljq.11
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzgkqlEXtLd/v+wVSBGVjho9DoRS4811IAns7bCcuhE=;
        b=cP1Cp1ng5PycYG+Ay4ewCeYqKCQLnFr0Ax0omkY9g/v9/xFbeCgUC3B+Bjw/7RSzTu
         iR9425lhMiNeZAULZDX2OqTSIDll6BS+47pr9ZBXulmr8hfzC2wvx+Jzz0zDVVpgdNPJ
         q08dGZqQvP6ikvSY+ipe/pXzNVtCuklIa26uUel7sQMGvMKmltW4XSLugYJky/iIXzA9
         rilIIQ9EpULp6cueTU23ElAXsAPuqXfDBT4Ib/U8qYo1va7mwMXSuJFBZ1a9rrnRJtFy
         fiJqL304zhaq24Hh2dY1MW+msi9OovmdFyr2eQKvDrJsUjADIgpChs3RlvemL8RcsN7p
         KY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzgkqlEXtLd/v+wVSBGVjho9DoRS4811IAns7bCcuhE=;
        b=n+KMdRYA4QRt+WMmZgSigFUtFKbGK6P/P10vSIuHlWADFYX0jTeW5w6rEbt5LEkM5a
         y/m6d1e8J91+syVfn9FC3Z9TuFeevSBiPDG/KVTT7Oa8MeLESWvJ3XDwo4t5En6hpEBE
         SoBk7xbg4HICFjYZpuX9oyUn4vM1VemCV4BU0LFOvTPigH8BXd4sUwAsh9iAoCsPInNC
         nwuJPlVERA7lg1yQQsfpwpFBDuXSHndAHFtH7MLVWeQ1HFWUL2u/MBe2NywiY63f4HV1
         ctcOqfMTnrqcikAwMCh919o1sL3T8lfGxWhHQQuEJEODizb/Lb8G+YLkkFHEOFBQhPGm
         PF+g==
X-Gm-Message-State: AJIora/AoikR1FQOLFZiORq/PkyCamTRUNGRamv1jBbjINea6I7cs58h
	v0IQjT3qft02d7ChTXBXPholiL4netq+T/AyLoIH4Q==
X-Google-Smtp-Source: AGRyM1vZjSv1TI8OphLcBFVwegK3L92Y52UqOTbVd4m0fDNyOGGUp8j3B+ooCd4byiBQQ9L8vZhwWjKTnrdA+cH/3Mg=
X-Received: by 2002:a05:651c:2104:b0:25b:f4ed:db93 with SMTP id
 a4-20020a05651c210400b0025bf4eddb93mr3339834ljq.295.1657323558277; Fri, 08
 Jul 2022 16:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708203549.3834790-1-justinstitt@google.com>
In-Reply-To: <20220708203549.3834790-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:39:06 -0700
Message-ID: <CAKwvOdm9-pJ3AUzpkJwsssk9JCq1zWQt3DugQXF9rsi7YBQC2w@mail.gmail.com>
Subject: Re: [PATCH] mei: me: fix clang -Wformat warning
To: Justin Stitt <justinstitt@google.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 1:36 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter the following warning:
> | drivers/misc/mei/hw-me.c:564:44: error: format specifies type 'unsigned
> | short' but the argument has type 'int' [-Werror,-Wformat]
> | dev_dbg(dev->dev, "empty slots = %hu.\n", empty_slots);
>
> The format specifier used is `%hu` which specifies an unsigned short,
> however, empty_slots is an int -- hence the warning.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the patch! This fixes the warning I observe when building
x86_64 allmodconfig with -Wno-format removed.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/misc/mei/hw-me.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
> index befa491e3344..3a95fe7d4e33 100644
> --- a/drivers/misc/mei/hw-me.c
> +++ b/drivers/misc/mei/hw-me.c
> @@ -561,7 +561,7 @@ static int mei_me_hbuf_write(struct mei_device *dev,
>         dev_dbg(dev->dev, MEI_HDR_FMT, MEI_HDR_PRM((struct mei_msg_hdr *)hdr));
>
>         empty_slots = mei_hbuf_empty_slots(dev);
> -       dev_dbg(dev->dev, "empty slots = %hu.\n", empty_slots);
> +       dev_dbg(dev->dev, "empty slots = %d.\n", empty_slots);
>
>         if (empty_slots < 0)
>                 return -EOVERFLOW;
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Thanks,
~Nick Desaulniers

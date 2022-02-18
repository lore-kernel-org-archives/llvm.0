Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20628E2
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 16:23:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id u18so16371849edt.6
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=idw7YZntoBJP5z9pQg5T5B0np+JD13UcXDxLG774Cwc=;
        b=QyURN3uk2BLtN80COI5GpugWKjfwNhPgf1QfsKzjgguvwOYKDRL9xS+9csSYsiNlmL
         RY6gVFgthq9mH8z7Min5CnG9W9oFTiT6XJ5ECd5Q25mQGl2pG+prqOuaFHqxsVkDAk0O
         5kfxmtsfCrqfTXtNWfJdjjPJ/1C85eFit45001GsN1AmLIFMHrDMXCVANquBGn3xXVKB
         az3rnw/PRs+T3tKBjGNsBn/SNMA1S8MBkVjx2mPww8FRHKDOEz5gLhymg9H3n1I4jJvx
         LqFaavcp4MGY8A8SeWRDjEu04ifpzzLNM4fyVBywuYGBOgOIerQ3rPEx/YlmCctBwlcc
         pzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=idw7YZntoBJP5z9pQg5T5B0np+JD13UcXDxLG774Cwc=;
        b=XK6OeiaOjA6m74OC/Xs8nBkE/A2sJ08tsHupALNcs8Rz+eyvPvRb9cs9l+VGkWGgBI
         hH1/sgvvmsZCZxzlRKSUb7Q9Jx7+YpmsToKFKHHVenvrruetCzpv0aTkEsoLGBBT/HAr
         3O+mWlFxZqD6aiVmID8MCDpqLzx1ebyCWk8qePp0rXN1vzXVN+A2nQXZ7LVicilP9sQd
         x/vDKIPjUJ+y2YLSOUEotFIyAV2T+aJxbXbB3oUYxIQdZe/wkG8957ZgqL1+gIMTb6OM
         F/aZaOVQtZmokZUAAmatBrXQpSKC4C9235v6nEzaBVt1v4aGrqvEM20xT1qWGrCGfeQl
         N1Jw==
X-Gm-Message-State: AOAM532BUPJSveN04yjaKYWgTnV6PFIaCqJc3MKBt8bJwU1emGZ52o5n
	N6IJjEbFzLmZp90fH4eJkgCFcWZYFLvU5gizM5OT
X-Google-Smtp-Source: ABdhPJwLIybVpRExsjCTwswlHvN7ki7KcVz8lLR6HcnU7FD3+kIDwifek077ymQZKGu85pdM8b+a11wHWuPdePK5ciA=
X-Received: by 2002:a05:6402:3487:b0:40f:fa53:956c with SMTP id
 v7-20020a056402348700b0040ffa53956cmr8948400edc.22.1645201380380; Fri, 18 Feb
 2022 08:23:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com> <20220217142133.72205-4-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-4-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Feb 2022 11:22:46 -0500
Message-ID: <CAHC9VhSup7QDQSGxDhbHrpEVNJZ7C0ReDcvuLF=S+1Mb=xRUdQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] selinux: drop unnecessary NULL check
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Serge Hallyn <serge@hallyn.com>, Austin Kim <austin.kim@lge.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 9:22 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Commit e3489f8974e1 ("selinux: kill selinux_sb_get_mnt_opts()")
> introduced a NULL check on the context after a successful call to
> security_sid_to_context().  This is on the one hand redundant after
> checking for success and on the other hand insufficient on an actual
> NULL pointer, since the context is passed to seq_escape() leading to a
> call of strlen() on it.
>
> Reported by Clang analyzer:
>
>     In file included from security/selinux/hooks.c:28:
>     In file included from ./include/linux/tracehook.h:50:
>     In file included from ./include/linux/memcontrol.h:13:
>     In file included from ./include/linux/cgroup.h:18:
>     ./include/linux/seq_file.h:136:25: warning: Null pointer passed as 1s=
t argument to string length function [unix.cstring.NullArg]
>             seq_escape_mem(m, src, strlen(src), flags, esc);
>                                    ^~~~~~~~~~~

Interesting.  If I'm understanding this correctly, Clang is reporting
on a potential NULL pointer simply because we are checking for a NULL
pointer a few lines earlier, even though @context should not be NULL
if (rc !=3D 0)?

> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 1e69f88eb326..ac802b99d36c 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -1020,7 +1020,7 @@ static int show_sid(struct seq_file *m, u32 sid)
>         rc =3D security_sid_to_context(&selinux_state, sid,
>                                              &context, &len);
>         if (!rc) {
> -               bool has_comma =3D context && strchr(context, ',');
> +               bool has_comma =3D strchr(context, ',');
>
>                 seq_putc(m, '=3D');
>                 if (has_comma)
> --
> 2.35.1

--=20
paul-moore.com

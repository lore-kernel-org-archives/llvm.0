Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2DE4AB3
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:31:51 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id w16-20020a056830281000b005ad480e8dd5so923792otu.9
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nebMkmur+LCxBFBdQ4EXcYnlngkdDHM11vfdWfCglsQ=;
        b=qOv30FszpMXxedCYqw7Wlk3PgAiJh6cKSD3NQ7aJFQyHEdlXr13TAv3jxhrAWun9sO
         YKvcPV8jrrIF/QJEAYVnBOnyEdF1iCqU+rHIVvS4VFGPyAf3gDFsqsBU6+DZxonWYQcE
         6N0xBLSI5cD6TXX/dSD2bA3g7id7/dnJaTN4QkJGJZvTvL3WJ0beg+N8Tg+UcJPZ1b4E
         Vdy054NfIH5ql9x01R86PI3sjjb5Gf0u9uqo6E2keDLxW5SdFy+qrIB8Aft1WCxC+Zyr
         2BCpWFj3rQdi7WtkjEIGgKatb4JD5Jx8axCFz7I8+zyr0564OtCpQ+wIIvX9uy7nUq93
         0nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nebMkmur+LCxBFBdQ4EXcYnlngkdDHM11vfdWfCglsQ=;
        b=wcuO08BScdWQKQjYRc3mCKKXGOYj304Q2d5nWGnUVe6x9G82jO5qgDNeaI7w5i4kUy
         IdEeUY4FIq7fRTiX11Lx5DAquIO2cXzwx8fbF48GLPhOvVQDk5n0ou1FNA8IvNAQLY5l
         f+KoWQHhG1rG8Ewb3CMlwLlQeubd29a5VNTVwMI1pvyXYnaZ3Qv2R+OaeWXHW3vjS/rf
         FXw9BeAl5zoulj+vBvaNNU35+tViEYPBQGErqJP07PhyMKNdSLhUYQlwu1tu72yKc6Ba
         0fovmMdBJW0jlbYa4k3YSVRoQPXFQFETENWSh4/O1HML4dT4U0rMKjfApS6aZG+bhgLF
         b9Ew==
X-Gm-Message-State: AOAM532vmcXaNAUT6UsRUJTMjzQalel93UTKhcFmB3YxQfmIal3uTRIQ
	Z7RPewfcvO2Db2vhxJVO+Aj95ZWtkdnmq1DgkPmuug==
X-Google-Smtp-Source: ABdhPJwHuglG3+2+j2XRYDFvOYqQuaKHBnuw+/dO3Bw5z0CIdEYLx0tl4quY7Mc68D/E3dWCqQGvzAzwhhXj3decPis=
X-Received: by 2002:a9d:27e8:0:b0:599:976a:c873 with SMTP id
 c95-20020a9d27e8000000b00599976ac873mr2843690otb.305.1645205510543; Fri, 18
 Feb 2022 09:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com> <20220217142133.72205-4-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-4-cgzones@googlemail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Feb 2022 09:31:39 -0800
Message-ID: <CAKwvOdkNZ3W9amcQKHOEfQLbdWC=4VDtrBdbOVHtWruipQnyKg@mail.gmail.com>
Subject: Re: [PATCH 5/5] selinux: drop unnecessary NULL check
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>, Serge Hallyn <serge@hallyn.com>, 
	Austin Kim <austin.kim@lge.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 6:22 AM Christian G=C3=B6ttsche
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

I'm guessing there was more to this trace for this instance of this warning=
?

>
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

^ perhaps changing this condition to:

if (!rc && context) {

It might be nice to retain the null ptr check should the semantics of
security_sid_to_context ever change.

> -               bool has_comma =3D context && strchr(context, ',');
> +               bool has_comma =3D strchr(context, ',');
>
>                 seq_putc(m, '=3D');
>                 if (has_comma)
> --
> 2.35.1
>


--=20
Thanks,
~Nick Desaulniers

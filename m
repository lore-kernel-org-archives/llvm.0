Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258C4AA1
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 16:01:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso8936615pjj.1
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XFjNobaT2htcA4k2+rACGDlyXr0w1b0IEeXMGWoU+GQ=;
        b=EPaXCh+QRxSRoSgsWxmJwRg6tqGCP82QzcP53X8m2d27haBnyVeGZM/TmoF1kloVEv
         7uQ7xQGri+04tUGGioLH9mW/QWzlVs+zX7RZTBaQOhJJwwzqnHwshwpwJ6HUuR1cM/sN
         jIEDk5XztFcGgigk325bNCeR1Ru4VN9kqMAvfG6ip18Rjx3zzJ3oKs4CEcrfw7ByvDt2
         B1XNj1b9UPfOQEqnwvGeyQQ9Cr0MFD+oF5AaJlW4klqELqyMnDOo9UBdgnu6QmXprStY
         4Kp5UNnyQlMzncVujkp9F47AvHEfza+1X5MHABFWaCkzNpUMMPQomJCv57ZgHaXhwpSb
         YjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XFjNobaT2htcA4k2+rACGDlyXr0w1b0IEeXMGWoU+GQ=;
        b=bblBYqFb4KWliSu9k6QDSS4RaOeOA0utrner/naWmfCByQZvjthTkYR2+sWZFNa4dO
         j0UbU8nfGMV4aRF3v3brvrL5kLrIQmvjpBFAa08xo3fb/O7cvtLu/V12E1Oc0JZHuJiq
         lNAhyDZRSzM9QTcrEqBeZMdpRCe3wf8u93yVQ1240z2eLt0J9IDmgaFi4Ynxy3WQfPEq
         v8T+Pop6w52oTvP/Go/+eNO/Ym0qA3EaXDapisG/sqeaePR4OkZ2kzfm5TjmR854YhAT
         EQeClaVU06OR7+NfYsVwqfQYHeBjnS5X8nmvljqI9n8Zh8uK0atgETc53+7sHT3Jx/Px
         blgg==
X-Gm-Message-State: AOAM532lX0OxXAlJX4to2WgdB1XaKfEBvOgR7MFRC80XG9J5ZaIRi+mS
	i+WG401Fa+9qXk9Tl1b8u84b81Bh80drq06AuCka
X-Google-Smtp-Source: ABdhPJwLt+s8aeYwD2rdVVWp7ivVPPj6qTMkm8CczLA4ox6HcF14gZmFwHu1ScwIEJ2iHUDfWyR9MXBzmMJA0gyJ1CA=
X-Received: by 2002:a17:90a:9294:b0:1b9:48e9:a030 with SMTP id
 n20-20020a17090a929400b001b948e9a030mr13317434pjo.200.1645200081628; Fri, 18
 Feb 2022 08:01:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com> <20220217142133.72205-2-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-2-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Feb 2022 11:01:10 -0500
Message-ID: <CAHC9VhQPZ3_dXvM9eqwsxZ2c+2mcdvNNJbtUNs_-9Md5F3P8vA@mail.gmail.com>
Subject: Re: [PATCH 3/5] selinux: use consistent pointer types for boolean arrays
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	James Morris <jamorris@linux.microsoft.com>, Austin Kim <austin.kim@lge.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 9:21 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Use a consistent type of unsigned int* for boolean arrays, instead of
> using implicit casts to and from int*.
>
> Reported by sparse:
>
>     security/selinux/selinuxfs.c:1481:30: warning: incorrect type in assi=
gnment (different signedness)
>     security/selinux/selinuxfs.c:1481:30:    expected unsigned int *
>     security/selinux/selinuxfs.c:1481:30:    got int *[addressable] value=
s
>     security/selinux/selinuxfs.c:1398:48: warning: incorrect type in argu=
ment 3 (different signedness)
>     security/selinux/selinuxfs.c:1398:48:    expected int *values
>     security/selinux/selinuxfs.c:1398:48:    got unsigned int *bool_pendi=
ng_values
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> ---
> A more invasive change would be to change all boolean arrays to bool*.

I think that might be a worthwhile change, although that can happen at
a later date.

A quick general comment: please try to stick to 80-char long lines.  I
realize Linus/checkpatch.pl has started to allow longer lines but I
would still like SELinux to try and keep to 80-chars or under.

> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/service=
s.c
> index 6901dc07680d..7865926962ab 100644
> --- a/security/selinux/ss/services.c
> +++ b/security/selinux/ss/services.c
> @@ -3175,7 +3175,8 @@ int security_get_bool_value(struct selinux_state *s=
tate,
>  static int security_preserve_bools(struct selinux_policy *oldpolicy,
>                                 struct selinux_policy *newpolicy)
>  {
> -       int rc, *bvalues =3D NULL;
> +       int rc;
> +       unsigned int *bvalues =3D NULL;

Doesn't this cause a type mismatch (unsigned int vs int) when an entry
from bvalues[] is assigned to cond_bool_datum::state later in the
security_preserve_bools() function?

--=20
paul-moore.com

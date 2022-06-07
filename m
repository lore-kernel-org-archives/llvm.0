Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13B2F4D
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 21:22:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z9so3165595wmf.3
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I0TYj0aY/TkdqOtA53I+eFE0LIyvHOAIiCLx8hJBREw=;
        b=e40+dm/Z0W0bIfob5pTvP0J2RyA4XpxF11pWtEW7puVHQEiUnWvd2CVD5XctVds9Bn
         PShLixF5Z4+GFBxqf2YR+q4TKyj0YAyTh8B08UoCUcVGBEeXJw3LB3TDHcgY0OphiaBw
         BeuKOWXH2i+K+No4ln5jeT/AJUK5T9VEOcG8dUQckKV3KbXWODCdTYeGYur0rCBwOLoT
         rKutET82TgGy2BgoaxPWUnW8sGs6P4YskJacxjyO7dDtvzcbFv1zJoPmg+MuHPjFSbt/
         RweF/zHNN6q+a6d0MWPovexRLYenU/ASh1h0PWKSbW10Qc96jNP5Nk2Ls3O4zqDzQnL6
         fOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I0TYj0aY/TkdqOtA53I+eFE0LIyvHOAIiCLx8hJBREw=;
        b=1LTU/p4T7nC13bMe2znkZ6myz30jLv0TLNiNV+tmjfhlV+5251BvxuuD8YaraUzZIp
         021wCZIVIr0mLXSSi/eFJL5BGbQ+i9iTC9BD7KSFYh8KCnw2fyEKiPs06UJumHWtCGh3
         F/P/jID2AoWIZiPiSc1Mn6gQMYI8xzt85CHqeELpcWLNa/KoLzpQQ6loaPN80RoxEKQ0
         LbaXv/1E74m5OYvmIMrigJeJkoX6iaykoStiYaK3Gs/0CbvwXmNLuJvUecQJsZb7vxaK
         62xQPRCjFuMdGgiGDw/7kXFvZSFKd7h4E54UHwtrX5ZqhC9yGGAqR3N27rXO11VECDTm
         mbVg==
X-Gm-Message-State: AOAM532KgyoVTiTu659IqRGfdLfgefK2oai05b0fJenRqtjRx4lLraS3
	ixOObNxQvDdobMu1xNS/9mGq2CSsTBxofv6ql/yK
X-Google-Smtp-Source: ABdhPJyYw/U5+gWoypUqkMl2O59z0OyPFHm7PAW4ahOWZ6+WyOnqtBiiwAIn75Yllh4b0x6DATOkqoiYJsazfLTYCeU=
X-Received: by 2002:a05:600c:414e:b0:397:55aa:ccc0 with SMTP id
 h14-20020a05600c414e00b0039755aaccc0mr61566727wmm.51.1654636964669; Tue, 07
 Jun 2022 14:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com> <20220217142133.72205-4-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-4-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Jun 2022 17:22:34 -0400
Message-ID: <CAHC9VhRatc13ZsBSsjZeGtBfz0ouUGL9n0LTjbQtuZtYv2M43w@mail.gmail.com>
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
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I was waiting for Nick to reply, but he never did, and this looks good
to me so I just merged it into selinux/next.  Thanks for your patience
Christian.

--=20
paul-moore.com

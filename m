Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11634173
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 01:04:21 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id me13so34940912ejb.12
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 17:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GTAyGpZpmaUsPX9axsiybxghgU18jS0enUJ4yCmKfeA=;
        b=gqKUWRyRARbRk0SGN0Ug87qWmhiWP++BNrtjFXsLJKVCte7lTE+HTbyWyEoPAy4N5U
         Cr/nvGCQsDIwzs732Xj1dYSYM47ja/d5pm0F5YZMDHNVCSW37GrkW4saw96qY87DLWe9
         3J32o/WgUPqJAAwC8BvNXDmAHZ12guTjhNoCBu6SRZd8H/gbavxyahxeyogwFZC7/Ao/
         TpXQlklenvh9cbGVXERoeSJfI4YGELTJWS0ItxWav3nXitxmb/qlIqL1RYIXHSKrJ5eH
         SqqxjJSARcyscmkEbZlnJF+wBqo52bftQNRUgPljpqcKO7W5ffyJHyJ66Sbe8IlxTkNp
         DNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GTAyGpZpmaUsPX9axsiybxghgU18jS0enUJ4yCmKfeA=;
        b=P0aaWgmpbUOm2PoHwswcL6LrRzY5spRN24k/sTqrrQxlmmohZNKSIaMCIMmtms/Goa
         BhY1WUtv9BLMXV+OElbtlAST+3OGTQ3ASgGmANv7JRl4/ERusc/XtbPZJaGVTmxX9Zva
         HduEJUc155mrBl6mVVvYPnKMh4dez36ozpo1u0/xt3n37X7xCUNDN7cknEgMHOPG24uV
         USkI3ndyoT0O82A7ywZtxTuxfN9LNeQdqoEDBtdhG0rBkR2YiDf8AXIx11PO6DPW3ie1
         cmNwvLmM7yB+3xR8OzH/zItptC4gvYuOjBJlwghWLukEcyuxOjCYlfd12SnjR+rNOapA
         qwhg==
X-Gm-Message-State: AOAM531EbEKq6S4DMDRyAYldW8UBuwUNYkTko9KHxD4aMiFiW9Yn+Hbz
	dn3ioFCsHq8kIq/OuLKg+xLjZwtxav2RH4eMnQwv
X-Google-Smtp-Source: ABdhPJylTjO6CmnEjURDc3496be4uSWx25zcu1IuJcyKxIu4SxC0yap6Qho7LjX/sjkwRB6y+dJR2BuAoych5i4rE90=
X-Received: by 2002:a17:906:c14f:: with SMTP id dp15mr18137575ejc.327.1643159060317;
 Tue, 25 Jan 2022 17:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-1-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 25 Jan 2022 20:04:09 -0500
Message-ID: <CAHC9VhTiGU_PMDGNKdFD977_Uk2iqVKr51kOzJV+njc0B9Eq5g@mail.gmail.com>
Subject: Re: [PATCH 2/9] selinux: declare path parameters of _genfs_sid const
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Xiong Zhenwu <xiong.zhenwu@zte.com.cn>, Tyler Hicks <tyhicks@linux.microsoft.com>, 
	Serge Hallyn <serge@hallyn.com>, Austin Kim <austin.kim@lge.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, 
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Jeff Vander Stoep <jeffv@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The path parameter is only read from in security_genfs_sid(),
> selinux_policy_genfs_sid() and __security_genfs_sid(). Since a string
> literal is passed as argument, declare the parameter const.
> Also align the parameter names in the declaration and definition.
>
> Reported by clang [-Wwrite-strings]:
>
>     security/selinux/hooks.c:553:60: error: passing 'const char [2]' to p=
arameter of type 'char *' discards qualifiers [-Wincompatible-pointer-types=
-discards-qualifiers]
>             rc =3D security_genfs_sid(&selinux_state, sb->s_type->name, /=
,
>                                                                       ^~~
>     ./security/selinux/include/security.h:389:36: note: passing argument =
to parameter 'name' here
>                            const char *fstype, char *name, u16 sclass,
>                                                      ^
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/include/security.h | 4 ++--
>  security/selinux/ss/services.c      | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Merged, thanks!

--=20
paul-moore.com

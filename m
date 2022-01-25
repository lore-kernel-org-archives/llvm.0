Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4E9168
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 19:46:15 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id t9so6607769lji.12
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ikFUcN/tVzW0fMx/FxScW5ahceyJ22Tp7p5x3rRO04=;
        b=CWv1dcqS9d6z8NlzDMCXj6rpH318FLRdFz5BY/i0Nq/W+uFGbdiDpgTdTCnQt14tXc
         reNilqW32iAwQTb8YsYUb4vNhVJH1SSSAygrjtDqnfZ9pv+fmYv/jsy9H45TAtbH1Rb8
         u1XrRhQNg7V3PFsCNcIJPKXLqcPvCELeDeQcMP1sTlEKik2PSk9IaMt+5zBCkR/Pp/5Y
         FDhUw9nr9lkJnqJMmpRYpSthLjAJhyTzt3VBy3PNb3AnxYLljB2JHuyZ1LIam45cKkPs
         vxsO038RSEQ7K/hsYfx0kh0Y6yT1j8o0NFtUOBSQbg1TJBgwBWbJzbkQGZypFtR19Fhx
         zLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ikFUcN/tVzW0fMx/FxScW5ahceyJ22Tp7p5x3rRO04=;
        b=LHc2WUXZ4kk/PtZSN8k/wG/Y+T2lzD2JYW8nUSRchl6rVdYt96lP9LolN1lqilVaHA
         XJBfEd20jGkjFoklVNd0xcotao4M6HKd87aFZfum8emWUJ1+V2kaVY/b6ma3MtT/1eCq
         GQSZEr7mlUQowdE8/bt08WRDIX3lqgCqxSEqeNXBMpeQm7lbRX3Oyk9Fe1keB97CAE8b
         xFqn1PV+qd3Ye06Pi6e38r4YU5lRNsGD7z+HsFq8Aj4ZbJGR8ZolVlFmwP/RgXYBhHSb
         lTDVuoSCbb8g4J+DKUR6D3l/2TV0+D3kzeBFtjCE5r6DYJgxMvMSOzJgAtfX5JfONjMW
         uqXQ==
X-Gm-Message-State: AOAM532Z2a+xaT9qqgK2E/obQ6/9NiuJahpT8bSNWJXdKP51X4nRuV+R
	DmWu/PGpt0JhTt40qI4xkdIBQK5u6DbXGMi/i3XeeA==
X-Google-Smtp-Source: ABdhPJzPuKCgEjEjJHS0X0O6pfg/Jc6Cj92bekA8cLL6QcjUutztZ41ZgQaRpvglGyC6VvuyAkF9v2v6ZwHcD0s1n4E=
X-Received: by 2002:a2e:9610:: with SMTP id v16mr7963140ljh.339.1643139973065;
 Tue, 25 Jan 2022 11:46:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-9-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-9-cgzones@googlemail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Jan 2022 11:46:00 -0800
Message-ID: <CAKwvOdmkfSQrLL2+fbjnRoY3wiRfpxLUU4YwP+XaiCwNrbi9ww@mail.gmail.com>
Subject: Re: [PATCH 1/9] selinux: check return value of sel_make_avc_files
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Nathan Chancellor <nathan@kernel.org>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 6:15 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> sel_make_avc_files() might fail and return a negative errno value on
> memory allocation failures. Re-add the check of the return value,
> dropped in 66f8e2f03c02.
>
> Reported by clang-analyzer:
>
>     security/selinux/selinuxfs.c:2129:2: warning: Value stored to 'ret' i=
s never read [deadcode.DeadStores]
>             ret =3D sel_make_avc_files(dentry);
>             ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 66f8e2f03c02 ("selinux: sidtab reverse lookup hash table")
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  security/selinux/selinuxfs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index e4cd7cb856f3..f2f6203e0fff 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -2127,6 +2127,8 @@ static int sel_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         }
>
>         ret =3D sel_make_avc_files(dentry);
> +       if (ret)
> +               goto err;
>
>         dentry =3D sel_make_dir(sb->s_root, "ss", &fsi->last_ino);
>         if (IS_ERR(dentry)) {
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers

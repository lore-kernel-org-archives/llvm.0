Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A9881F
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:08:36 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v9so4314393pjk.0
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680890916; x=1683482916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij7uDQEt7OoC3gzgZ3tZqjFkRTxGVdbzCD/wwJBh2J8=;
        b=hE2DhnNSpPajoDvpOYpiauf89G3UWZgVogAuZERwD5b973PhQ/lYeA5LQjcGdeZvLo
         DzwwgTiYYzH/QnmdD6fUMUDwXNtH5+4YGzBKJIA6a0bItAJWMgifHs//9gk3RV10v0qX
         HJVgRFYThdjQmEX4v8BZHS/0WfVSr6SH5PmJW7Mo9oIJ28Sx4PRdVuspoV87+7hx0aPA
         Tx5adPyHrknuwf6s1WXxgHbB3907910x/01tmgpW9Gzuut6f5rKdEwIt8RVYiGk9rzwW
         mCpSthyEK95vDdQIfMCesO/oW0v+Tn3rkwDAQRCO44mJEesOz6OSzIG597LKgT7vZo1J
         Vb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680890916; x=1683482916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij7uDQEt7OoC3gzgZ3tZqjFkRTxGVdbzCD/wwJBh2J8=;
        b=2CmJq4L89idWqcVPrh92sEPRF1dWsIo7rBbKDw4oW+uAjkpN6yC+rcpQ1jd17MBFKq
         TdLS1ADfeCBpXxkr1tCyXWxPX9oYMu9ibV2mYA2TCSHm88k/BLJKVsGXvU4tLcN2FfjZ
         KzItq3BB03eaglCc6qp1jeT0AeAk7VPfXwbcQhnUZupscsqNvc37FZwmYsjNB367xFsz
         o7vNG6S0q0evwcwQ05syUUdxrixHgJjJMVUuglzrTtk5q4EyZpI8h+KTUHOU46QSza6q
         5Vdl7IRKvuO2HM1E5fr74HQPmWli6XTaLMxAewaIMNKQ9IX6aFcmrsu7pMNOvgFeqvXM
         Sv9w==
X-Gm-Message-State: AAQBX9dNxxygT4LfjybIrk8AP2bkUG0jMhHhoAlxsJob4iTE91z/XxkO
	uPuCXuZDgTCWyflBMDjGyMqUU+rk6tQGiqrXBYVQuw==
X-Google-Smtp-Source: AKy350ZEWjuFoz+sL7oAnHomo0iHyqQI1Sm5L+Ii9IqLyzhBmLJPQvFAtHbFOlXt/tvMV1txjQqW/7K5sxOi9yfnuT0=
X-Received: by 2002:a17:90a:5997:b0:244:9b8f:c3bf with SMTP id
 l23-20020a17090a599700b002449b8fc3bfmr807289pji.7.1680890915820; Fri, 07 Apr
 2023 11:08:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230330132114.1826399-1-trix@redhat.com>
In-Reply-To: <20230330132114.1826399-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:08:24 -0700
Message-ID: <CAKwvOdkim2tY3VvR_ejCuzVivEH3iadZYFE_dnMS1shXfJ5eUA@mail.gmail.com>
Subject: Re: [PATCH] fs: dlm: remove unused count_match variable
To: Tom Rix <trix@redhat.com>
Cc: ccaulfie@redhat.com, teigland@redhat.com, nathan@kernel.org, 
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 6:21=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> fs/dlm/dir.c:67:26: error: variable
>   'count_match' set but not used [-Werror,-Wunused-but-set-variable]
>         unsigned int count =3D 0, count_match =3D 0, count_bad =3D 0, cou=
nt_add =3D 0;
>                                 ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Fixes: commit c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I can't help but wonder what this logic originally intended, but this
was introduced back in 2012, so guessing no one cares/remembers/hits
related issues.

The condition above is
149         if (result =3D=3D DLM_LU_MATCH &&
150             nodeid !=3D memb->nodeid) {

which looks like the condition you removed could have been folded into
that originally:

if (result =3D=3D DLM_LU_MATCH) {
  if (nodeid =3D=3D memb->nodeid)
    ++count_match;
  else {
    ...


> ---
>  fs/dlm/dir.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
> index fb1981654bb2..982f7a5570fe 100644
> --- a/fs/dlm/dir.c
> +++ b/fs/dlm/dir.c
> @@ -64,7 +64,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
>         char *b, *last_name =3D NULL;
>         int error =3D -ENOMEM, last_len, nodeid, result;
>         uint16_t namelen;
> -       unsigned int count =3D 0, count_match =3D 0, count_bad =3D 0, cou=
nt_add =3D 0;
> +       unsigned int count =3D 0, count_bad =3D 0, count_add =3D 0;
>
>         log_rinfo(ls, "dlm_recover_directory");
>
> @@ -158,14 +158,6 @@ int dlm_recover_directory(struct dlm_ls *ls)
>                                                              b, namelen);
>                                 }
>
> -                               /* The name was found in rsbtbl, and the
> -                                * master nodeid matches memb->nodeid. */
> -
> -                               if (result =3D=3D DLM_LU_MATCH &&
> -                                   nodeid =3D=3D memb->nodeid) {
> -                                       count_match++;
> -                               }
> -
>                                 /* The name was not found in rsbtbl and w=
as
>                                  * added with memb->nodeid as the master.=
 */
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

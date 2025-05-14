Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4F22318
	for <llvm@lists.linux.dev>; Wed, 14 May 2025 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249581; cv=none; b=TJ+SyGNU8qO/IR2o7ZOSMrsh7CYbN5BJ5VMy6eMwP3M1LQQQzN0ZCdgXTQgt1r0scpjKkLC2768Ypw3PwQDe124MuJd40GZ9GUqJl619DlYLPtCpnTg6WwV9g+SkB8yPpWyswCL5C6ioJbWhXnPdTzZAIxItbflhfeGJt06/l0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249581; c=relaxed/simple;
	bh=pkPGLWmnxyL2lTg/4/v2SuPNj8kowqjrvrA9NC7P7yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUIbzStTvf5xUXB8Om53WUtxt5MeCaWoJ6/bzFyWXdPI3zuVhp6uSt/BIxeVIPjgE6DyF0TI9AEy39ykq8cRrTSfLrXepqLXtt/rTP2VI6SufKauzOojBav+xDsE8TkVW234L3b4euXX4chLcmNEvmtbQkHiNSee2nRxdDRaNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJSppy3H; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJSppy3H"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso235759a91.0
        for <llvm@lists.linux.dev>; Wed, 14 May 2025 12:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747249579; x=1747854379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1pMypX06ZzS76nW/kI23orBa+jzmujGeNficFMCZFk=;
        b=XJSppy3HBFE71v0sjjQFR421zxKrR1FTWTqpJB3JHZSA8Nu5Xf32iqhFm8WWpmVvks
         LveLwJNMMSOOOHhY1shNSZZcbMRd0FuW7lhJVM2F5uJMlo32yco2JgwNgg2+Z5CDezSW
         5tOK9SRICorw9M6f+Qr8afCE93fZ8U5lVoxWtz5R4DFov4uZUdVvTA2Ie6ZYuydHX16g
         5/7vTxraICMIml/r+0R42JxO/jCZbsOu3a5gWc551qeQE2aA0YRCPhxe9ldNwL4PLupT
         i/2CKATiQDjpaibgo7EpXTlJrtJXNXGpNt/68QVQc62UXol9Rzg77sYAY+TtMQjHy49C
         9y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249579; x=1747854379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1pMypX06ZzS76nW/kI23orBa+jzmujGeNficFMCZFk=;
        b=cMqaqOHEVpruD0cNeIR7VKbWUztAIhjE61n8WGdEM4LxklH4ufsSVdF6RrqJMEKmki
         /FXOz2M5NU3nxiN+1KA1a+eH3Iga+zL7W/CgvAylrJhxACDaiA1sQvcPrD0NpKa0s4nZ
         PRE9c0kEW0pcanAgoOfS5uVsTTIykptrlrD0oXi403gPjqW/JBFERaRdzXncNCZE69zv
         Zg0u5SEI/91Pp2W2xs2CaHUqz3so6xkDJm5oIHvFLbMLu7lwNDefH9YxylG4mMBNFZ2Q
         aVHpJPlzO0jEl3IBk3xDt9eXe4E/d4TMy4ZXRe6DNa/mLvuKa2MHh26NDkXy7NCFYh0Y
         tu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMbBQCYrHumg5fxVUD3cwpkn4bbqa5R/f34LFQGkt0JpgOH4p0Lb4W0qOzzgfgY5szR1fI@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1OXNyDtDKe4cahDohQjheXUneKCvOKUVFgVNneLo8CXY7YJNf
	BkFvq//CcC6fxA+wigCra7/n+P4ojQGOS/fvgeIBZR2omMwgBpGbsGNPDp9ipfjfGE5aMMdnuJZ
	Q66fi996tHhqtC4l489U80x0J/zM5Ng==
X-Gm-Gg: ASbGncuzPra50sFJsXEeZJ2LQ2OXkV1prSGntAnolAg4x8lNUFSt86WEua/rg+lrDEs
	idmxAUTRVnXwTNKE7LwR4FN9Oo2TarTlkUiZgW3URkX/CTxYjghsU05nmZpazSVnaP2Ht17tBjE
	bQm/Gf7fGER4wcSYU3u03at3UGRG0aUPwv
X-Google-Smtp-Source: AGHT+IH8NXPz6aovZauT3wvH+Rgd/TCbj/Lng8D8ng36OU4Fiej4pyWd4kw8wz7C3NDdXUq/AopoZdFg+12wLyaC3sU=
X-Received: by 2002:a17:90a:e188:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-30e2e620774mr7584187a91.28.1747249578867; Wed, 14 May 2025
 12:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250511173055.406906-1-cgoettsche@seltendoof.de> <20250511173055.406906-10-cgoettsche@seltendoof.de>
In-Reply-To: <20250511173055.406906-10-cgoettsche@seltendoof.de>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 14 May 2025 15:06:07 -0400
X-Gm-Features: AX0GCFu-o75HyZ3-ihQ9FQt_qlf08mGXT9ZKkWOIPPXXR0HMdCtsCTXkz4QkX5w
Message-ID: <CAEjxPJ5NVZ4HzSm4doEpTG5pLFD-F7A3MZnrM_noxHh4b-mJAQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] selinux: validate symbols
To: cgzones@googlemail.com
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 1:31=E2=80=AFPM Christian G=C3=B6ttsche
<cgoettsche@seltendoof.de> wrote:
>
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Some symbol tables need to be validated after indexing, since during
> indexing their referenced entries might not yet have been indexed.
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

NB role dominance is already gone in checkpolicy and never supported by sec=
ilc.
At some point likely should drop corresponding kernel and libsepol support =
too.

> ---
>  security/selinux/ss/policydb.c | 94 ++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policyd=
b.c
> index f8d6e993ce89..4559c8918134 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -673,6 +673,84 @@ static int (*const index_f[SYM_NUM])(void *key, void=
 *datum, void *datap) =3D {
>  };
>  /* clang-format on */
>
> +static int role_validate(void *key, void *datum, void *datap)
> +{
> +       const struct policydb *p =3D datap;
> +       const struct role_datum *role =3D datum;
> +       struct ebitmap_node *node;
> +       u32 i;
> +
> +       ebitmap_for_each_positive_bit(&role->dominates, node, i) {
> +               if (!policydb_role_isvalid(p, i))
> +                       goto bad;
> +       }
> +
> +       ebitmap_for_each_positive_bit(&role->types, node, i) {
> +               if (!policydb_type_isvalid(p, i + 1))
> +                       goto bad;
> +       }
> +
> +       return 0;
> +
> +bad:
> +       pr_err("SELinux:  invalid role %s\n", sym_name(p, SYM_ROLES, role=
->value - 1));
> +       return -EINVAL;
> +}
> +
> +static int user_validate(void *key, void *datum, void *datap)
> +{
> +       const struct policydb *p =3D datap;
> +       const struct user_datum *usrdatum =3D datum;
> +       struct ebitmap_node *node;
> +       u32 i;
> +
> +       ebitmap_for_each_positive_bit(&usrdatum->roles, node, i) {
> +               if (!policydb_role_isvalid(p, i))
> +                       goto bad;
> +       }
> +
> +       if (!mls_range_isvalid(p, &usrdatum->range))
> +               goto bad;
> +
> +       if (!mls_level_isvalid(p, &usrdatum->dfltlevel))
> +               goto bad;
> +
> +       return 0;
> +
> +bad:
> +       pr_err("SELinux:  invalid user %s\n", sym_name(p, SYM_USERS, usrd=
atum->value - 1));
> +       return -EINVAL;
> +}
> +
> +static int sens_validate(void *key, void *datum, void *datap)
> +{
> +       const struct policydb *p =3D datap;
> +       const struct level_datum *levdatum =3D datum;
> +
> +       if (!mls_level_isvalid(p, &levdatum->level))
> +               goto bad;
> +
> +       return 0;
> +
> +bad:
> +       pr_err("SELinux:  invalid sensitivity\n");
> +       return -EINVAL;
> +}
> +
> +
> +/* clang-format off */
> +static int (*const validate_f[SYM_NUM])(void *key, void *datum, void *da=
tap) =3D {
> +       NULL, /* Everything validated in common_read() and common_index()=
 */
> +       NULL, /* Everything validated in class_read() and class_index() *=
/
> +       role_validate,
> +       NULL, /* Everything validated in type_read(), type_index() and ty=
pe_bounds_sanity_check() */
> +       user_validate,
> +       NULL, /* Everything validated in cond_read_bool() and cond_index_=
bool() */
> +       sens_validate,
> +       NULL, /* Everything validated in cat_read() and cat_index() */
> +};
> +/* clang-format on */
> +
>  #ifdef CONFIG_SECURITY_SELINUX_DEBUG
>  static void hash_eval(struct hashtab *h, const char *hash_name,
>                       const char *hash_details)
> @@ -765,6 +843,16 @@ static int policydb_index(struct policydb *p)
>                 if (rc)
>                         goto out;
>         }
> +
> +       for (i =3D 0; i < SYM_NUM; i++) {
> +               if (!validate_f[i])
> +                       continue;
> +
> +               rc =3D hashtab_map(&p->symtab[i].table, validate_f[i], p)=
;
> +               if (rc)
> +                       goto out;
> +       }
> +
>         rc =3D 0;
>  out:
>         return rc;
> @@ -1087,6 +1175,12 @@ static int context_read_and_validate(struct contex=
t *c, struct policydb *p,
>                         pr_err("SELinux: error reading MLS range of conte=
xt\n");
>                         goto out;
>                 }
> +
> +               rc =3D -EINVAL;
> +               if (!mls_range_isvalid(p, &c->range)) {
> +                       pr_warn("SELinux: invalid range in security conte=
xt\n");
> +                       goto out;
> +               }
>         }
>
>         rc =3D -EINVAL;
> --
> 2.49.0
>

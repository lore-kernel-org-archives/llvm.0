Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20688182BC
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 16:25:24 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58c4dce9db8so10941337b3.1
        for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1692375924; x=1692980724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucUz8MLzQcOIBd0t0XomfDYuKop1ElGaSovik3pwpoQ=;
        b=ahNIeC5eO83tE7Mkt9NbXxeJBGAO+XWYjqJDEtrfQQbPCmx8AUSEAFnurG699BN40Z
         TmciiODTWlI9qkyzdtkEpUYVeE+rzscA6taQe3QG6KKcvziEAWUmRNy+U/T5kWB9Yt4d
         bT3odde1G8BCNQANIwQ+syDE9IQ1nRJqAND7XlRNd8V+KaZ3ebkOLV6WKJS4T2eki7Dx
         w4Kyc0sFmYkdbimeVr6b/Dt3c0SSb++Hcu37HH1ZOFhGjWVOWDIpwRZBEdVDYx3sKztH
         b3s0zFlGMEXK3fD6g0eFkk1hqQnIRHVXtwUfHVYA9+GR6kFWW8ASeOn6+kQZkF81tCW9
         hTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692375924; x=1692980724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucUz8MLzQcOIBd0t0XomfDYuKop1ElGaSovik3pwpoQ=;
        b=mHDJWkGniWEUAxcQOUo9wsOdQbu2F13c+Vc438j0K9UGl/VOwTVIamLPpi136vLzft
         p2DXi+aDbeuPQSu27bWb4yk844OmpV7Jv95BR1Wmz+wridLauyO/4LrNAn4kosR0PTAR
         M2TU5CBK4rUoxqJ9wZRjo+fHAmcxit/bMW/EfJEif0g+53tuQSd87e7vLilZQAsnCPnw
         iaKWZiDOzZhbiTpTWz7YvtL8molm//Pfed2YUsrXcvwmW/qk6uFcA57m9VrbqrzHzY7N
         e/5h/z2Bo4MT5LdZXhkBNviog+z/izEy5raFszTVAzV7jFaaPKCUYHEkAf+w9zK7rbF1
         zwnA==
X-Gm-Message-State: AOJu0YzqBwQlwA3cMMgPRvTLkooI80OE1LQ+S57aZAN998bP/xW3sh/t
	2ENeVRJW+DfRrDHuFbPIo7tZ+f3BGQ+bixQGF/S+
X-Google-Smtp-Source: AGHT+IGGZmIBmOhrdBZxCN6SiC6TfpQQSM5iqw9/0scHGRqppWqbVIg9L05WNia94iikezIgrRH2Nmc2C5JdLAKlSQk=
X-Received: by 2002:a81:9e4d:0:b0:589:d617:e7c4 with SMTP id
 n13-20020a819e4d000000b00589d617e7c4mr1442370ywj.16.1692375923646; Fri, 18
 Aug 2023 09:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230817202210.never.014-kees@kernel.org>
In-Reply-To: <20230817202210.never.014-kees@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Aug 2023 12:25:12 -0400
Message-ID: <CAHC9VhR-vxsaR7deTQ+zzVP9W2uSupz4ucf8p+tt0e730qbZ1g@mail.gmail.com>
Subject: Re: [PATCH] selinux: Annotate struct sidtab_str_cache with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"GONG, Ruiqi" <gongruiqi1@huawei.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 4:22=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct sidtab_str_cache=
.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Eric Paris <eparis@parisplace.org>
> Cc: Ondrej Mosnacek <omosnace@redhat.com>
> Cc: selinux@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  security/selinux/ss/sidtab.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This also looks good to me, but similarly to the audit patch, since we
are at -rc6 I'm going to wait to merge this until after the merge
window.  I'll send a follow up email once it's merged.

Thanks.

> diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
> index d8ead463b8df..732fd8e22a12 100644
> --- a/security/selinux/ss/sidtab.c
> +++ b/security/selinux/ss/sidtab.c
> @@ -25,7 +25,7 @@ struct sidtab_str_cache {
>         struct list_head lru_member;
>         struct sidtab_entry *parent;
>         u32 len;
> -       char str[];
> +       char str[] __counted_by(len);
>  };
>
>  #define index_to_sid(index) ((index) + SECINITSID_NUM + 1)
> --
> 2.34.1

--=20
paul-moore.com

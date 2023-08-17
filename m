Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE61643A
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:21:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so265584e87.3
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692307282; x=1692912082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeALbQx5LxBzM1MS6Rc6ll0OcowbkB9LP6Bj9ouPlmM=;
        b=r2BSbs41E3psTG4zlT/6L4I1b03YBb00iebZ40WnpKqoJsQeLxPfPQILffi9Isyt5e
         DIAVRDMitsROKjFFg3zhKIC+75cxN7MgdkMHAYGTrmznmd8R9V1sCiqNtee8tSYUfeSl
         4hKjJOjZEuseG3873Mdya5l9Gp+7HLExt39/BpyyUJW1zPbOpY3gKT8d7WqGKybcnRJs
         1uV0k7CPsgeOlVT6rg1yHqnyvtLLIoKU8/rWyCAs2KW/5dTrSBdx9Ketg27aOdMT/b+0
         M/OJMmfqEyolSVetziGgawKhRc2djgMRUPxbYf3jNXN+mfm3IZJOpYUdwyfLi7tWGbtx
         NeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692307282; x=1692912082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeALbQx5LxBzM1MS6Rc6ll0OcowbkB9LP6Bj9ouPlmM=;
        b=B8FhKpNvI6O0FlS+N9BFNyH9pLhI99OJJQcmOyUOV0lJHAq8XlvNbfzwWXR6KmHU93
         3ctkmofH/o6nUIiJpn9jRCLmYU6dDNyIb6lM2vTHO+VwVdMAvl+aVz2X64+XdFG3sZjb
         EnqowcpC/+gim+htpRi0QB97aFiTNEW1rHIWlZ2/NehwCMVw1+Lc1cg/wLzBhoH1lfe5
         9Vx1Ombr4Die+XW4MKaX05moApXZytvG/i9QQeRYBM+mGi9Q0nquOpnNoaSe2N2HDgzE
         Ll9JIurDLhs5o1T8O1OsuR7a8z/HilNg23rsnjinXRp4a34Q1T1/wYsaWBIF+yQFsvEY
         SfNg==
X-Gm-Message-State: AOJu0YzkF6UXHJwSYm3Sjuy+KUCT8htJxmDILgcOLFD/zvJ8hIn7Cs1P
	GgCsJjNfVACk9QnlwfHQ+zJA4RKrMWy4fwIYxdlItA==
X-Google-Smtp-Source: AGHT+IF/wiTT9wIP3+3ZHZmD8p/Ah3L5qulD8+FJwJ+Q2KQcVBd0I/M4ovMbQFsOqVAG3uMWNbarBRjmU6goY9fjd54=
X-Received: by 2002:ac2:5226:0:b0:4ff:8aa7:185c with SMTP id
 i6-20020ac25226000000b004ff8aa7185cmr347546lfl.7.1692307281523; Thu, 17 Aug
 2023 14:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230817211114.never.208-kees@kernel.org> <20230817211531.4193219-1-keescook@chromium.org>
In-Reply-To: <20230817211531.4193219-1-keescook@chromium.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 17 Aug 2023 14:21:10 -0700
Message-ID: <CAFhGd8ra6vpUvLc_Z7zRA8kVOzu7=o6b6vFL+QvcGi34-nVmFg@mail.gmail.com>
Subject: Re: [PATCH 1/7] wifi: cfg80211: Annotate struct cfg80211_acl_data
 with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 2:16=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
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
> As found with Coccinelle[1], add __counted_by for struct cfg80211_acl_dat=
a.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  include/net/cfg80211.h | 2 +-
>  net/wireless/nl80211.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index d6fa7c8767ad..eb73b5af5d04 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -1282,7 +1282,7 @@ struct cfg80211_acl_data {
>         int n_acl_entries;
>
>         /* Keep it last */
> -       struct mac_address mac_addrs[];
> +       struct mac_address mac_addrs[] __counted_by(n_acl_entries);
>  };
>
>  /**
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 8bcf8e293308..80633e815311 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -4889,13 +4889,12 @@ static struct cfg80211_acl_data *parse_acl_data(s=
truct wiphy *wiphy,
>         acl =3D kzalloc(struct_size(acl, mac_addrs, n_entries), GFP_KERNE=
L);
>         if (!acl)
>                 return ERR_PTR(-ENOMEM);
> +       acl->n_acl_entries =3D n_entries;
>
>         nla_for_each_nested(attr, info->attrs[NL80211_ATTR_MAC_ADDRS], tm=
p) {
>                 memcpy(acl->mac_addrs[i].addr, nla_data(attr), ETH_ALEN);
>                 i++;
>         }
> -
> -       acl->n_acl_entries =3D n_entries;
>         acl->acl_policy =3D acl_policy;
>
>         return acl;
> --
> 2.34.1
>

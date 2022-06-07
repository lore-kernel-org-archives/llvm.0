Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169215DC
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 20:33:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y32so30077167lfa.6
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nR+uoUh5iaqWwwMAVnGzI16dMVhZL9mz29hSjOxi/f0=;
        b=lXzgIh2ppKvVxSzXEkz3UkXT6OYBgxRJRDn0CGtmdbmvCz/IRVH47BdC2P2QYtJJat
         uGbWL5ttMjxwZwzOTwwsWBOPoZOvDSY6AxwJVwHy226NZrxCCmcpwzqBsJ6oUeoTi8Xu
         QT/y8oJUGI0sHux+SBnMNrQUQDVvy7kHwfwbRDj80XOchTR9lFRSzuGL4OYI06h/tY3A
         JFzF3Un/IYohkWUoeDPF8bDuSyPBvi0si1BLIrz2OaVUrqshPR1eIkYRmeYHL8OWnsHV
         IF+xMhKlgtF156eEVNY02MfcbwYunJYGDRi3l7jEZX025QEC3HMhThupNC5JnEKGCo5E
         u5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nR+uoUh5iaqWwwMAVnGzI16dMVhZL9mz29hSjOxi/f0=;
        b=jdB4NgOi+5SW4EJfNDcDZ9TGeudVKP1Ca6sgrT5QGjwPVxfZKL94VP1sVcRHTNKhdX
         gTEoMi98jgOigcoJOorfX+ax/LCAsr6vVvacvPxs4QN14TctLUBsozRIQlgBtJqLB/7w
         1kNZZWkqrO4vKCUV7bBiiXCiVVDvyJLuHo5H9jcPKRB0JbFkxEQ7bWayDjIfuvOAJ0gd
         kG5YQ3uRdYIOUouojKIcj7P1lyLkVAS4n/UYKxmZFFhkRCYc5mwvIN+y+9swhKCc03eL
         scDEGCR7Q5te/NE8oq4z993s7hEyL5RlEOBP3RWi0YpQVjo5FPgATrEPOa/Ukc409DXU
         Lv0A==
X-Gm-Message-State: AOAM533cCP5mwkxazP/z5cAGlbA4QwoHf76C8guqtr5Xuxf6IV5ON6tg
	SIhTH1tO3bjZgD5zS1UrIPAaKobhQFZbw3EDG5YyDQ==
X-Google-Smtp-Source: ABdhPJw3OFMdECABaibHZnsRlRk4RKp7goQBTxNsnhaHeFF+Z4uHbYmdZS45xE+F8zxXZ0wlt6IUPTLxRnV8n89WTUk=
X-Received: by 2002:a05:6512:2614:b0:445:777d:3530 with SMTP id
 bt20-20020a056512261400b00445777d3530mr67507378lfb.647.1654634033645; Tue, 07
 Jun 2022 13:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X> <20220607180847.13482-1-jstitt007@gmail.com>
In-Reply-To: <20220607180847.13482-1-jstitt007@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 13:33:41 -0700
Message-ID: <CAKwvOd=C2kyMVLYTKJcBQNnqK0T4nEBMeaS3DpTM2ez1P+qcqQ@mail.gmail.com>
Subject: Re: [PATCH v2] netfilter: conntrack: Fix clang -Wformat warning in print_tuple()
To: Justin Stitt <jstitt007@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 11:09 AM Justin Stitt <jstitt007@gmail.com> wrote:
>
>  | net/netfilter/nf_conntrack_standalone.c:63:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.tcp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:64:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.tcp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:69:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.udp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:70:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.udp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:75:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.dccp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:76:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.dccp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:80:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.sctp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:81:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.sctp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends
> using the promoted-to-type's format flag.
>
> Also, as per C11 6.3.1.1:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
> `If an int can represent all values of the original type ..., the
> value is converted to an int; otherwise, it is converted to an
> unsigned int. These are called the integer promotions.`
> Thus it makes sense to change %hu (as well as %u) to %d.
>
> It should be noted that %u does not produce the same warning as %hu in this
> context. However, it should probably be changed as well for consistency.

Right, because they are `unsigned char` and the parameter is unnamed
for variadic functions they are also default-argument-promoted to int.
-Wformat won't warn on signedness.

Thanks for the patch!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/378

Also, Nathan supplied his RB tag on v1; it's ok next time to include
it on subsequent revisions of patches, so long as you don't change the
patch too much between revisions.

>
> Signed-off-by: Justin Stitt <jstitt007@gmail.com>
> ---
>  Diff between v1 -> v2:
>  * update commit message and subject line
>
>  Note: The architecture (arm64) is critical for reproducing this warning.
>
>  net/netfilter/nf_conntrack_standalone.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> index 6ad7bbc90d38..afbec8a12c5e 100644
> --- a/net/netfilter/nf_conntrack_standalone.c
> +++ b/net/netfilter/nf_conntrack_standalone.c
> @@ -53,30 +53,30 @@ print_tuple(struct seq_file *s, const struct nf_conntrack_tuple *tuple,
>
>         switch (l4proto->l4proto) {
>         case IPPROTO_ICMP:
> -               seq_printf(s, "type=%u code=%u id=%u ",
> +               seq_printf(s, "type=%d code=%d id=%d ",
>                            tuple->dst.u.icmp.type,
>                            tuple->dst.u.icmp.code,
>                            ntohs(tuple->src.u.icmp.id));
>                 break;
>         case IPPROTO_TCP:
> -               seq_printf(s, "sport=%hu dport=%hu ",
> +               seq_printf(s, "sport=%d dport=%d ",
>                            ntohs(tuple->src.u.tcp.port),
>                            ntohs(tuple->dst.u.tcp.port));
>                 break;
>         case IPPROTO_UDPLITE:
>         case IPPROTO_UDP:
> -               seq_printf(s, "sport=%hu dport=%hu ",
> +               seq_printf(s, "sport=%d dport=%d ",
>                            ntohs(tuple->src.u.udp.port),
>                            ntohs(tuple->dst.u.udp.port));
>
>                 break;
>         case IPPROTO_DCCP:
> -               seq_printf(s, "sport=%hu dport=%hu ",
> +               seq_printf(s, "sport=%d dport=%d ",
>                            ntohs(tuple->src.u.dccp.port),
>                            ntohs(tuple->dst.u.dccp.port));
>                 break;
>         case IPPROTO_SCTP:
> -               seq_printf(s, "sport=%hu dport=%hu ",
> +               seq_printf(s, "sport=%d dport=%d ",
>                            ntohs(tuple->src.u.sctp.port),
>                            ntohs(tuple->dst.u.sctp.port));
>                 break;
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers

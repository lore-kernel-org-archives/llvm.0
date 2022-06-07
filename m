Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DA7C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 20:29:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id j10so30041115lfe.12
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UOYpSc7h6G6Mcnhor2e/NffZqKr7OZqCk2rdZZjgr2A=;
        b=TlsXRljIGk9azzfB7KgTa0t3mP4ywgrVDoG/+pFDEZgb1hEMZ7e8NxJHUseFzaLuCS
         63M24bNSRyHaRS+qPGJZYLgyxE6+RBHwFnJ2OzLr9DsC99KLD9hmsotHUWAx7d1wQbQy
         BP5ugycFWWRS4QRHCgpuniS00B33qGZNz4/WNZ+NZfecqA0N/PPXhSZP+3fdPgPAT6Ra
         CPeT7cGR1IyAsqxq7fAvIooQTz3W5aHKK2aheT3/8Y9E+9aAYMipsehx168LQjj/OtpD
         SIv9Xp1fWqYJOWbxspFT82ZsyjCUX3ni3ARi3jrKiaGfzTl9+ocBWEetSJRiUBW7uk6J
         ZIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UOYpSc7h6G6Mcnhor2e/NffZqKr7OZqCk2rdZZjgr2A=;
        b=QDeg4rd0KeYKGy0QxsOqaNUpBsvchgOAG0zA0KYAygD9ic1UjDrWQGchLmi0y+QM/0
         2hYmVcvS68PkCk2hrWGbO++Opk7LAZZ24fYld1I5fM5RUI+uEl8CoiejpAXoaC6q1oRX
         5pEjYwmCTq4xmoiWw4qqPLnX5mnU+13zU0mYhep9cSIOn9YNxNSWh3onwt1U4p//eTBK
         +YkmHu/JTZTzYnZ6KytZdeTNNoKq4xl8VCZbCprY7eQzZebHgt6dRluZo5cOW2IF31jc
         YtXTEp4ENZ6fCsuD9OHtBMBbfVxq1u9YD1QN/gS921vG2upbYoe4RLTSmTDkuSzj0Bgz
         wqLQ==
X-Gm-Message-State: AOAM533xJHdkGloOKXYcqZzDgoaLNdaeKkRmpCiJUiqeElfyCND/fLaV
	3Bpr0li52W3Ws1wnlGK5IYYwTrSKKBRU9FmLGRKBGw==
X-Google-Smtp-Source: ABdhPJz8e1qkF3YsPNqQ+CSoYj7aqtQOE0vae7btjfiKP9le+uXKwKIHwZDpfRB4B0gvYe988Q34Dn4thhR7sEsYWio=
X-Received: by 2002:ac2:5c44:0:b0:479:11e1:36f7 with SMTP id
 s4-20020ac25c44000000b0047911e136f7mr17801753lfp.432.1654633782547; Tue, 07
 Jun 2022 13:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606212819.9548-1-jstitt007@gmail.com> <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
In-Reply-To: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 13:29:30 -0700
Message-ID: <CAKwvOdmFCge4cpcyqL1gtqg2xdAgmeuaJZaSMvW=m+cTr8XaaQ@mail.gmail.com>
Subject: Re: [PATCH] netfilter: conntrack: fix this -Wformat clang warning:
To: Nathan Chancellor <nathan@kernel.org>, Justin Stitt <jstitt007@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 8:27 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Justin,
>
> The subject might be a little more descriptive if if were something
> like:
>
> netfilter: conntrack: Fix clang -Wformat in print_tuple()
>
> rather than saying "this warning", as subjects should be standalone from
> the rest of the message. Minor nit but some maintainers have high
> standards for commit messages.
>
> On Mon, Jun 06, 2022 at 02:28:19PM -0700, Justin Stitt wrote:
>
> It would be helpful to note here that this warning appears when building
> arm64 with clang using -Wformat; the architecture is critical for
> reproducing this warning.
>
> >  | net/netfilter/nf_conntrack_standalone.c:63:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->src.u.tcp.port),
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:64:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->dst.u.tcp.port));
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:69:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->src.u.udp.port),
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:70:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->dst.u.udp.port));
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:75:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->src.u.dccp.port),
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:76:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->dst.u.dccp.port));
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:80:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->src.u.sctp.port),
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  | net/netfilter/nf_conntrack_standalone.c:81:7: warning: format specifies type
> >  | 'unsigned short' but the argument has type 'int' [-Wformat]
> >  |                            ntohs(tuple->dst.u.sctp.port));
> >  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Variadic functions (printf-like) undergo default argument promotion.
> > Documentation/core-api/printk-formats.rst specifically recommends
> > using the promoted-to-type's format flag.
> >
> > Also, as per C11 6.3.1.1:
> > (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
> > `If an int can represent all values of the original type ..., the
> > value is converted to an int; otherwise, it is converted to an
> > unsigned int. These are called the integer promotions.`
>
> I think that it is probably worth noting that ntohs() has type 'int' in
> this case because arm64 does not define CONFIG_ARCH_USE_BUILTIN_BSWAP to
> use the version of __swab16() with a cast to __u16; rather, it uses the
> one with the conditional operator, which per 6.5.15.5 means the type of
> the result of the conditional operator is determined through these
> promotion rules as well.
>
> I suspect that the conditional versions of __swab{16,32,64}() in
> include/uapi/linux/swab.h want a cast on the outside of the conditional
> operator with the specified type but I am not sure what other
> repurcussions that might have so it is probably safer to just fix these
> warnings up one by one.

Yes, there's a subtly where for ternary's the resulting type is the
largest of all operands. When the LHS of the ? is larger than either
results, the result is STILL the larger type.
https://godbolt.org/z/EGjW8sqzf

That said, regardless of that change, unnamed parameters of variadic
functions will still undergo default argument promotion, so the __u16
would still be promoted to int.  So we still want this patch, too.

Justin, can you send a separate patch adding the explicit cast to to
__u16 for the ternary expression in __swab16 when
__HAVE_BUILTIN_BSWAP16__ is not defined?
include/uapi/linux/swab.h
Please include Nathan's suggested by tag; cc me and I'll provide review.

>
> > Thus it makes sense to change %hu (as well as %u) to %d.
>
> Regardless of that, changing from '%hu' to '%d' is recommended so that
> part of the change is fine. I am not sure that changing '%u' to '%d'
> does anything other than add to the diff, as there was no warnings from
> those, but consistency is key.

These types in the case of icmp are uint8_t; they also are
default-argument-promoted to int. All possible values of uint8_t are
representable by int, and so %d and %u will make no difference. It is
"no functional change" and simply being consistent, as you say.


>
> > Signed-off-by: Justin Stitt <jstitt007@gmail.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  net/netfilter/nf_conntrack_standalone.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> > index 6ad7bbc90d38..afbec8a12c5e 100644
> > --- a/net/netfilter/nf_conntrack_standalone.c
> > +++ b/net/netfilter/nf_conntrack_standalone.c
> > @@ -53,30 +53,30 @@ print_tuple(struct seq_file *s, const struct nf_conntrack_tuple *tuple,
> >
> >       switch (l4proto->l4proto) {
> >       case IPPROTO_ICMP:
> > -             seq_printf(s, "type=%u code=%u id=%u ",
> > +             seq_printf(s, "type=%d code=%d id=%d ",
> >                          tuple->dst.u.icmp.type,
> >                          tuple->dst.u.icmp.code,
> >                          ntohs(tuple->src.u.icmp.id));
> >               break;
> >       case IPPROTO_TCP:
> > -             seq_printf(s, "sport=%hu dport=%hu ",
> > +             seq_printf(s, "sport=%d dport=%d ",
> >                          ntohs(tuple->src.u.tcp.port),
> >                          ntohs(tuple->dst.u.tcp.port));
> >               break;
> >       case IPPROTO_UDPLITE:
> >       case IPPROTO_UDP:
> > -             seq_printf(s, "sport=%hu dport=%hu ",
> > +             seq_printf(s, "sport=%d dport=%d ",
> >                          ntohs(tuple->src.u.udp.port),
> >                          ntohs(tuple->dst.u.udp.port));
> >
> >               break;
> >       case IPPROTO_DCCP:
> > -             seq_printf(s, "sport=%hu dport=%hu ",
> > +             seq_printf(s, "sport=%d dport=%d ",
> >                          ntohs(tuple->src.u.dccp.port),
> >                          ntohs(tuple->dst.u.dccp.port));
> >               break;
> >       case IPPROTO_SCTP:
> > -             seq_printf(s, "sport=%hu dport=%hu ",
> > +             seq_printf(s, "sport=%d dport=%d ",
> >                          ntohs(tuple->src.u.sctp.port),
> >                          ntohs(tuple->dst.u.sctp.port));
> >               break;
> > --
> > 2.30.2
> >
> >



--
Thanks,
~Nick Desaulniers

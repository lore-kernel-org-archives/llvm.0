Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A64692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:44:18 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l23so10567877ejr.5
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 12:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwEDVdKbnbZtn9p0uC93yaXB5Vwp4sXmO/V6mgJc1hE=;
        b=Opt4AN70UWDNIKd9DrhmzqMlFdNVINRChnpwp92hsWrOpZvBTfEZJN7paVV3K1qBFM
         7OZBpDZMglnQFlcLjrZ9pDfXTkdTQoUzuP0Hz6eUeQux4XKzh2WKfUasuN2gSwWsHLep
         DzWiJVcrraZfXmxMQGs9Pb2Y/u1AF7nC4xlTKtrnqEUhJhoVIbnrdnqPX2Iy3Rfk7bXT
         5SFxJySXeTvn6G4IFMg7HMX+a9tR0UjYWpLwPE3Q0biZEU0kBbtVAuQNo8jYH7ImbN+0
         PlwWct+os2RQ50ZmFHtlRB1eot1RVM7cLSdtJgMbb737jfzbRmo5RVd/r5jq5syWOwH8
         K+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwEDVdKbnbZtn9p0uC93yaXB5Vwp4sXmO/V6mgJc1hE=;
        b=cnG1zTG5AfKwBdmbt3eXae7jFkIG3TuWepDK44DYtyKIf8uVCvR7U4vvsXyeip5+Hl
         3Fb00sDaiMBF71wQ5KtvwnVoDGxaI7IrKfbgom/VelUHKRmksT8usD919ZKlR8D6cSJ8
         j83PVcCSF7rWgXmb626bcl1itwjvNTxfjmnclUHFJkskUzXK3lQC7IdUMZ9MYmZGUlMW
         2xi5iUR/zELFrQOjaP1Nm27Kp5/nh4thB6t9OVHpUlV+Ren52FvqrXKBqoj8Uiy5Vitr
         ND8PVNJPvXLgOPX9KWZKtLq5tlxxD6bsB+RKsD1bwqPpwm2874Lr2meW73eH6z17ekmo
         ieqA==
X-Gm-Message-State: AJIora+y5qsBpG0vtrNtqteGt3KDsuG726QD4/DsuqHm4qEjty1shlsP
	JabNeSlXIB1mF5KE920ZKMj2H+92TauwXNIwWr7+2Q==
X-Google-Smtp-Source: AGRyM1tHofXUqkdW7BnM1C245t2ran6VcnZvUJuKy6J7zLT7nKrsoMbm7F1S99ufXtKPsrkkFHcy/q7Q5UPlTaovmsk=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr11795359ejc.379.1657568656253; Mon, 11
 Jul 2022 12:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220707191745.840590-1-justinstitt@google.com> <YsvniilEnfUOd+yk@salvia>
In-Reply-To: <YsvniilEnfUOd+yk@salvia>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 11 Jul 2022 12:44:05 -0700
Message-ID: <CAFhGd8qDwoWLTJEGtap3s2_+AOLdnSg57DO8VgoMrqDtcFY7qQ@mail.gmail.com>
Subject: Re: [PATCH] netfilter: xt_TPROXY: fix clang -Wformat warnings:
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 2:04 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Thu, Jul 07, 2022 at 12:17:45PM -0700, Justin Stitt wrote:
> > diff --git a/net/netfilter/xt_TPROXY.c b/net/netfilter/xt_TPROXY.c
> > index 459d0696c91a..5d74abffc94f 100644
> > --- a/net/netfilter/xt_TPROXY.c
> > +++ b/net/netfilter/xt_TPROXY.c
> > @@ -169,7 +169,7 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
> >                  targets on the same rule yet */
> >               skb->mark = (skb->mark & ~tgi->mark_mask) ^ tgi->mark_value;
> >
> > -             pr_debug("redirecting: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
> > +             pr_debug("redirecting: proto %d %pI6:%hu -> %pI6:%hu, mark: %x\n",
> >                        tproto, &iph->saddr, ntohs(hp->source),
> >                        laddr, ntohs(lport), skb->mark);
> >
> > @@ -177,7 +177,7 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
> >               return NF_ACCEPT;
> >       }
> >
> > -     pr_debug("no socket, dropping: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
> > +     pr_debug("no socket, dropping: proto %d %pI6:%hu -> %pI6:%hu, mark: %x\n",
> >                tproto, &iph->saddr, ntohs(hp->source),
> >                &iph->daddr, ntohs(hp->dest), skb->mark);
>
> Could you instead send a patch to remove these pr_debug calls?
Do you mean all Instances of pr_debug in `xt_TPROXY.c` (of which there
are six) or just these two specific cases @ +169 and +177.
> Thanks.

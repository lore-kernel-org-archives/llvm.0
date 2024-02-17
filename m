Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F396A034
	for <llvm@lists.linux.dev>; Sat, 17 Feb 2024 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708172300; cv=none; b=T2ESO620PH8WWzbQuXNXmcTL7m/rcBR/Ki1Knn7cZ74Klb9A9DC+FV0d0jh+IV/TiMrV2ANrPXSMyYl9FgVW57l/Muano2K73PrYG5AkaJUvBpQ3236ovb4iR0dG/OFRXQk3iZhbjOI46qNt02FboEpTkysinKM32Hp6jcqpJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708172300; c=relaxed/simple;
	bh=UKjxS5vpoedsgomMAJB5omeAKldlU4nDgXE0PfEP1jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKpclUiZgXjzEk/cT+ZZoRYQsiO2zGdObG/iRap40zpjqY7VJbXV/+KRC8HIsozedu+HCEkrI0V5BJPpvOVrAjhSQrZHcrj9odD9PSQL+lt6YBteJSERGtS9ts1WE3etNc7FSwf+DYihGnk1er/1ujHImOfwYLhvLgPIPzQd/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=MXO5qP6A; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="MXO5qP6A"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso2658009276.3
        for <llvm@lists.linux.dev>; Sat, 17 Feb 2024 04:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1708172297; x=1708777097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dakj+J26FIps8JKFMFOM1GnEisCAC0H9NUZsZ7rhH34=;
        b=MXO5qP6AisFkFQrXjz2Sg/JbG6oV2ilFh8jN+z4miu8Of+BnkNZTzgdsPyy7mVV1uM
         q4fSundmznjYw6bJ+x1VpIAorHuf90f5iTUPJmxkYrJXX/BA9fG1rQpRPvzR3//+OFlD
         8QdDBqYnevZHynER4L81zJUPiw21eWLpHximHKmVvr0uv2a7IlbnRejaOQYDmSEKCI2t
         rkpSD4SUPzOSnWKZSd5EIHZgCmi3KHg1eurkdvaTN08BHwFg9hXzapvCwOGqh5nRaw5r
         wYniEdXHTn6svdmaFqVQH9bgSSN22wWSaAKbxBcHNCLVUbtLsBHArxv3zfcB/8brD89H
         YQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708172297; x=1708777097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dakj+J26FIps8JKFMFOM1GnEisCAC0H9NUZsZ7rhH34=;
        b=HjiMQAO9SypBd5rrMK2NEUDQEK8+4Xhr9mZlCS5jX4kyn47ZxxBe6wsyjuXnZPTKRW
         7jdZ/V2M28D9lcC7pJcIaFGuKVKCoZGksFhi2+WFpG8DS+VDnhwM0vOJm5LXqh0sVkEI
         RRnk+Q2QIqOATt7KSPcyLWDfCqMNadGQvzacp3KplY2Zr2spgPd2CxBDP9j4VMVX9Ojz
         wIHUHu05fL+R1yG5EUW3Sv5HdybmZA/posyVi4bsWaRDzhtt+zxdR03BmiwhYyp/7CmQ
         lqKPe0Rq14SrBYQ05HWup+R3RdeYRY2cJyIQSiUYGXM09SQPIU+l1gwpECbQkEpui6sA
         t8bw==
X-Forwarded-Encrypted: i=1; AJvYcCXi+SAgNgic8AyTsvbhr0GTNTJ3WOIdaTP8ukStoSb3j0zrBbHTW23meVHXa1MYXsZ8GIexTRa+2CkPIeo+fUMYu+uSOQ==
X-Gm-Message-State: AOJu0YxFRHoBv+Utcc2OPqOqpIUhq2Qa/XrSMGcHm4kiKUjXWjY91DJ4
	kd479uOxC29pKJkBjeVJ4Zo9ZWMGSOJmZt8hNO3mLvRA8UPt7jnNrbA0c5ryMYuzHgAXUEwX0K0
	TmLEYv0VcbNCijSBdRGqV+kUnfTLi7UoIx5Xs
X-Google-Smtp-Source: AGHT+IEYHTeRxmK8Tgb29GhppupMJ2XDrsJxJTUarro8uv3qP63OjBIOPHkVh7dMXpiawqTtzwrBAlosTJQ5VBj7vcw=
X-Received: by 2002:a25:adc9:0:b0:dcd:63f8:ba32 with SMTP id
 d9-20020a25adc9000000b00dcd63f8ba32mr6963090ybe.65.1708172297594; Sat, 17 Feb
 2024 04:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240216232744.work.514-kees@kernel.org> <9ed28341-8bf7-4b6a-ba9a-6cfe07dc5964@embeddedor.com>
In-Reply-To: <9ed28341-8bf7-4b6a-ba9a-6cfe07dc5964@embeddedor.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 17 Feb 2024 07:18:06 -0500
Message-ID: <CAM0EoMnDHDGao6NToo5WcT16GZCyQ_SR8aXQ3AXmJFYaWoqv1A@mail.gmail.com>
Subject: Re: [PATCH] net: sched: Annotate struct tc_pedit with __counted_by
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, netdev@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 7:04=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 2/16/24 17:27, Kees Cook wrote:
> > Prepare for the coming implementation by GCC and Clang of the __counted=
_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOU=
NDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-famil=
y
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct tc_pedit.
> > Additionally, since the element count member must be set before accessi=
ng
> > the annotated flexible array member, move its initialization earlier.
> >
> > Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/exampl=
es/counted_by.cocci [1]
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> > Cc: Cong Wang <xiyou.wangcong@gmail.com>
> > Cc: Jiri Pirko <jiri@resnulli.us>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: netdev@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
>
> `opt->nkeys` updated before `memcpy()`, looks good to me:
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks good to me.
Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

> Thanks!
> --
> Gustavo
>
> > ---
> >   include/uapi/linux/tc_act/tc_pedit.h | 2 +-
> >   net/sched/act_pedit.c                | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/tc_act/tc_pedit.h b/include/uapi/linux/=
tc_act/tc_pedit.h
> > index f3e61b04fa01..f5cab7fc96ab 100644
> > --- a/include/uapi/linux/tc_act/tc_pedit.h
> > +++ b/include/uapi/linux/tc_act/tc_pedit.h
> > @@ -62,7 +62,7 @@ struct tc_pedit_sel {
> >       tc_gen;
> >       unsigned char           nkeys;
> >       unsigned char           flags;
> > -     struct tc_pedit_key     keys[0];
> > +     struct tc_pedit_key     keys[] __counted_by(nkeys);
> >   };
> >
> >   #define tc_pedit tc_pedit_sel
> > diff --git a/net/sched/act_pedit.c b/net/sched/act_pedit.c
> > index 2ef22969f274..21e863d2898c 100644
> > --- a/net/sched/act_pedit.c
> > +++ b/net/sched/act_pedit.c
> > @@ -515,11 +515,11 @@ static int tcf_pedit_dump(struct sk_buff *skb, st=
ruct tc_action *a,
> >               spin_unlock_bh(&p->tcf_lock);
> >               return -ENOBUFS;
> >       }
> > +     opt->nkeys =3D parms->tcfp_nkeys;
> >
> >       memcpy(opt->keys, parms->tcfp_keys,
> >              flex_array_size(opt, keys, parms->tcfp_nkeys));
> >       opt->index =3D p->tcf_index;
> > -     opt->nkeys =3D parms->tcfp_nkeys;
> >       opt->flags =3D parms->tcfp_flags;
> >       opt->action =3D p->tcf_action;
> >       opt->refcnt =3D refcount_read(&p->tcf_refcnt) - ref;

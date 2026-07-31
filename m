Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A235C6B1
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529760; cv=pass; b=GgYPpPNdMf9onM1Nrt6v6vRI2Q6F1ljJnMqbw6i72te5PubSxJ4eu4j/zT+BqgFIsBmztYFL5mq8IMZcHyOpzWOHHAYy+/D6hzb7SKqPsfBwoQM4nO1fynAlB4mN1zaI7widCggki73Mbsc9VniXnqPtpoqe56Kub9xJDr5YbIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529760; c=relaxed/simple;
	bh=PB2N9UKJFFpOO3ZJ0XvnRcUAZMhfIDP0urD4uCGRQtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te/Qwa368Q0eL52/mqwqsbYYD8C5RtrN64CmSAU13fRyEKdTUBqWgyXNqN4r49AhaHUSryie6LfiusF08hyDO3yLF0C5VbHBBoP9DSdwozNY8UKexR9UrNmBhDuU9QnvS9GgjznA+peq8tapka1LwLg2skzsqJ+3RJFHxxcAmwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4SRFxuh; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4SRFxuh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso208411866b.3
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785529757; cv=none;
        d=google.com; s=arc-20260327;
        b=XRcPzkqKPbkniLkJAP212MYJPKP/JrH9hOZwVsj9XIu6Rp7bKdDG/gcNk6dMhbLIXy
         VjGLrhWW14ioTtamskcZ3OCwKMGWktqCICgATT3MHrMJHzh2NfKZl+efImUZknYaJCDt
         58ylldimwjsrAfoR720/XaJI/kK++TaeGBThsYvH74hJhWxa1klUztgtP++CeVrssNa7
         qw+mbRydvwvM+HWFzjo+2bJfecW15bSizJm39wMIOWq3oPZrEVwnsgMwivpB9B4XX1tt
         /lDNcjMy7nVzGCKgUfi0FlzE0oc+TwLnAC86nNSGNKGJTcm/0CjYX/wDvxQYqw5sZi8U
         0Z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bEs1/WkjMD9y4dDM8+oBUFumAyguMFu49pZUFYl+/c=;
        fh=fIRRtcME6NimnldNgFz+qLi9Xrp9XrZM8tZT3/KxQ80=;
        b=i5mEPQskveP3FeV2Hl9FR7jaiBoFX9J159AsZWP4icBVTGesPdD1vWAJxLYzHKD5mB
         2Nr1GI2/T3Tu6N5zeMJOp2VOnYeYe+3m71pDF/trxqdLOEnhC3V83ZmBDugkA7Z1cygk
         Ka9HzINCqlMspZD5d2Y7Ess+cv5HdI5PHtoicpA5m7veh68EwRFnUbVK9ZvS2hrLUBVM
         roUMPvfF7g5uk2Fk+UNkvyFCCoBP+12KUCfXG1JNR990h/xlSp6JrPQh91gaE7+zj0Jc
         K0as3ESt/wURb9u08PANNYBXz5H4czs8ZC5KPn58L3Wvot/YxkP2GySCsC6Qa/jBaGi7
         ebwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785529757; x=1786134557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bEs1/WkjMD9y4dDM8+oBUFumAyguMFu49pZUFYl+/c=;
        b=R4SRFxuhvm38w/bxuQ8evsiYaB0ZCRqe7Z5zmjhMFL3yQGuILGBoXMIp52quMJXOAG
         u6ffvEYB2kAP6eswRLLS8ASFZOG4cRpUnUCxIdpOWLjMJyRo45JeEo5SQQO/agexOJh6
         YYpbDMCfCkEJSzoIV3IZLc84YV49T88MNaRvs45QmF24xeCM1xUloYPVZr1sgBLWM+Y3
         nURyrHmSzMvY7OpY6dYmbZ6+605JHbS3lXJcR55IfW7atgw5+zQLVhFpri2Lc1AS6S8C
         GIBkWT5mm4UG/2QUl37qEgl9/Asop+y7DVxORgYgK88Wg1nOumroyEAFnpFgi9pCKCy9
         tvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785529757; x=1786134557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bEs1/WkjMD9y4dDM8+oBUFumAyguMFu49pZUFYl+/c=;
        b=F03prp0TngLgjp3HxIScU7BP4GoJw4St/SSvwZx3pAU6vbFTeg8PVIzbPh433sODJE
         UnXmQ03rjOP/KhjUUwbEWKtfihL5rQ8sYapVGlVHWRnMi84A3btSHVXKPvzUv2AphMEI
         tdXKgS2V+wsjPmypD3c7yWbcZL2QnBcdc9qwGdOmmV72N8DKScI8TswM1xUfYrG5ZA77
         fziGRCbBphE3HapIq99GQg0wUGOI1QC1+MN6IlZRlLg9+pkZCZtW9UKNDdQk4U/FdboQ
         IzDUJQxfx+qKYsTo6in3Hjb21IpGUJJPCCKUU+Fa2u+1erTIIOAB3Q2EY93rk7dXgapS
         yfZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Zqri1p0zfKWC/YModWMYVfnn7L9iw8T7Cy9S5hktw8c0HJw/spaghQHQlZsc1Ln43phq@lists.linux.dev
X-Gm-Message-State: AOJu0YwrnPh4XdrE0HsexTAY4hP61+VzuUWnzHYPq3PJASl83inEtJuU
	gNvQJGDacp6ssY3V8/oMQhhNrPSHjvX9YYYEKVwkQY7IfbxfVCqblhTCaYwWW/wmsWcKZQdZzuc
	B1Zssf8VnS1cM8DfmDrizs1x7PefSDEQEA9SxUtrY
X-Gm-Gg: AR+sD11tgb7BGsLBDOceWGykWzlvszs12LfDyfvnGbyX+kLeoxUA30ZBQ2BV4KolzCJ
	4eEW4a/Pbb/vb0qAw/jO8E6bUaAB3bO6rBJm4WJv9O0IaoBnyD/kQxTfYo9VLGx418Xy57jO9o8
	A3tgL1wPIncu6OFzTeRladnMlPTufIo+BStRAYNOPiKhJO2+sWSYxMRuCe53MZG1NdU9eudtWCd
	z4v9CRVx03Yjuinqs5CCLEC7YjfrrbzxPui3lmI/nza87tpb91pWfW8vb9t7DoynIpdjDsJdvZa
	eCfOx1BUcIR4Pajhq4oSaxeFe4jU30Ar1l5Y6yrIqiBp4c/FykIYdC+BtSVRLtrbBHB5a1cxEQM
	AwbxhP5A4jv8ldhcXvesgUnxuUfjbvgLNm3BmpvSuPyG5UoCwDhgJjT0771o=
X-Received: by 2002:a17:907:3e95:b0:c16:6429:a67d with SMTP id
 a640c23a62f3a-c1fe82c9057mr77057566b.57.1785529756045; Fri, 31 Jul 2026
 13:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com>
In-Reply-To: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 13:29:03 -0700
X-Gm-Features: AUfX_mxZxtfwoH10nUf99ZpgYn_x08YsjXccoaC-hD5PizZ27j_14Ys9x7XnaB4
Message-ID: <CAKwvOd=6xCKkLLLmSXz1S95jOjRSDGyQbUwp5=yNJeau5q9eJQ@mail.gmail.com>
Subject: Re: [PATCH] Mark list_add and __list_add as __always_inline
To: Jordan R Abrahams-Whitehead <ajordanr@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <kees@kernel.org>, Marco Elver <melver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 1:15=E2=80=AFPM Jordan R Abrahams-Whitehead
<ajordanr@google.com> wrote:
>
> This commit resolves an issue where modpost section
> verification fails due to section mismatches between list_add
> and its callers.
>
> At present, list_add (and its internal __list_add) are called from
> both .text and .init code sections. Since inlining can vary per call
> site, list_add can be 4 different states:
>
>   list_add in text with arguments to non-.init.data values
>   list_add in init with arguments to static .init.data values
>   list_add in init with arguments to non-.init.data values
>   list_add in text with arguments to static .init.data values
>
> It is last instance that ends up causing the section mismatch caused by
> constant propagation of the address of static libs inside the `dir_add`

I think you meant `static __initdata LIST_HEADs`? (not `static libs`).
Maybe AKPM could fix that up for you when applying?

> as seen below (with the dir_list being defined statically in
> initramfs.c, resting in .init.data).
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: __list_add
>   (section: .text.unlikely.) -> dir_list (section: .init.data)
>
> Because of these section matching requirements, semantically,
> __list_add and list_add MUST be inlined. This will then ensure
> callers inside .init will receive a list_add that exists and refers
> to only .init data, and list_add code in .text sections will only refer
> to non-init data.
>
> This issue manifests predominently in AutoFDO with clang, which is very
> hesitant to inline cold functions such as list_add even when marked
> `inline`. Marking them as `__always_inline` therefore matches the
> existing semantic constraints imposed by modpost's section mismatch
> checks.
>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

We've been seeing this particularly on Android and ChromeOS while
trying to enable AutoFDO, which seems more likely to outline cold
code.  include/linux/init.h defines __init as __cold.

I saw no change in size for x86 defconfig; enabling
CONFIG_LIST_HARDENED resulted in a change of a few bytes (i.e. less
that 0.01%).  I assume we don't care as much about the size if
CONFIG_DEBUG_LIST is set.  Checked with bloaty and
scripts/bloat-o-meter (thanks to Eric for pointing out that tool in
the linked thread).

I never heard back from Kees or Marco about their thoughts on this in
relation to
commit b16c42c8fde8 ("list_debug: Introduce inline wrappers for debug check=
s")
but I wouldn't mind an Ack (or Nack) from at least one of them.

> Closes: https://github.com/ClangBuiltLinux/linux/issues/2173
> Signed-off-by: Jordan R Abrahams-Whitehead <ajordanr@google.com>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Link: https://lore.kernel.org/all/CANn89iJVQe=3DwedLheJmjZjOTJsWHijT0jZs=
=3DiRxKssJZbjAxHw@mail.gmail.com/
> ---
>  include/linux/list.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 09d979976b3b..59f8aa0905d3 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -150,10 +150,13 @@ static inline bool __list_del_entry_valid(struct li=
st_head *entry)
>   *
>   * This is only for internal list manipulation where we know
>   * the prev/next entries already!
> + *
> + * Must be inlined to ensure it can be safely called
> + * with initdata arguments.
>   */
> -static inline void __list_add(struct list_head *new,
> -                             struct list_head *prev,
> -                             struct list_head *next)
> +static __always_inline void __list_add(struct list_head *new,
> +                                      struct list_head *prev,
> +                                      struct list_head *next)
>  {
>         if (!__list_add_valid(new, prev, next))
>                 return;
> @@ -171,8 +174,12 @@ static inline void __list_add(struct list_head *new,
>   *
>   * Insert a new entry after the specified head.
>   * This is good for implementing stacks.
> + *
> + * Must be inlined to ensure it can be safely called
> + * with initdata arguments.
>   */
> -static inline void list_add(struct list_head *new, struct list_head *hea=
d)
> +static __always_inline void list_add(struct list_head *new,
> +                                    struct list_head *head)
>  {
>         __list_add(new, head, head->next);
>  }
>
> ---
> base-commit: fc46aed51f6280801f43a2cf4b5060cc33b572f9
> change-id: 20260730-always-inline-list-add-363639606e26
>
> Best regards,
> --
> Jordan R Abrahams-Whitehead <ajordanr@google.com>
>


--=20
Thanks,
~Nick Desaulniers

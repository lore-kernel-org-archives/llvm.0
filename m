Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E036B911
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581640; cv=pass; b=gZ/QerOceBrNp2A2SlZ3Z4EphYRtriByhR5Mvfg0GGt0OOOxjr9uHFV6OBegjAodjwmLsAn2DhUW54l/bECP5oefNOthjjW3aLU+npn4lgeIKMIvhlM7jkr2eaH4u4ED0d5tkZtwjTHifJeX8KxtmsHDcz8arPDOOaJFRrRZWfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581640; c=relaxed/simple;
	bh=OvQ55FXoErnNKhvc+Qxa3QvWr6A3gB3Z0YvB4C+COTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwgETojpnWPT1r2YYUKAhe5XuQ0fqT1nX8VxP06o3FpJqPdm2Hq8EEGhLTN+W7nP/+ck8JwzbWrpdPpjQwTNdxaeKQA2G25qhRYX4aVKMnVtj2f9B01DklMZxaBBSNl5svY6d/xgrjdqx6r1u6CMsYGgJLYFGw3hPSSW18+za3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nu4EfAp0; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nu4EfAp0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso225338a12.1
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 14:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581637; cv=none;
        d=google.com; s=arc-20260327;
        b=QKSKz3jj/XG9gmaOw990MFh9cymTM2MpsSMlAc6BrCJlLNjpgltKFH50eHjGpHE6Bn
         Czo0/UNVKmMzy06XClhzNM+T+xcoKYORMWQfqqiGP5IrJd0JmCkGnRLslaGb9o1CxBRc
         TWeAMOgYsZUk4TtaRQAniEp0/VfSrktHc1oq8ZIIrHN4yu4dfRIVRd1CMeosWeB0jHm2
         h7fnY1rce4vFQmBt3NvRkAqJHb2Ximk1AvDSK2f7MMB2xHbBhVG98O7Vcd11nPAqOgel
         gu9to4lVHThRBQKB5HTJi98q4icB5Is8l3o6wZS6YuR1dzSUFpGn+ZGoiRBPvLihyyLH
         J4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        fh=gtAqyLs3uO5XvE8GCNHeTeu+711ScnJVY995fueZTMQ=;
        b=H3iD82Hd8mGgfdoGyAokr9HCJ2G5FkNnGaEEjRClQ7IDMDTzD4aBkpgUCobuL5Ek+1
         tJA+DIUBBA3LrUV+BAzSbw12YDl3WRsRQkmdNie9+fdxRwmtJ/rVGYDCCG5X0j/1N70s
         AIdSit/0LBUiBlsfWhXXRG8reyAu7sjj/MI6QO396AaYG1uK73SuIlwjBY1C0QAP9Qdk
         8HxOQgpDRhcRxfhWmugVKM/aUCFnjaY8XvD/bpFa9LniSQZd83Lh76DzANXcpnWukyNu
         GO2yXfvN2mPO5RPGLMLe7UigI5UEychNgO6D7YsgMcXtObypg2e6LE90LdDDfw8knYK5
         pAVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581637; x=1792186437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        b=nu4EfAp0BhwTGepjg3fsh6TD/DCzQLu6RjssyoSPcVGREkOKXNMJwH4dVeN1Gti/4C
         aGJ+ju9kdGDKzRkApXzqwNkD+y8WxYMln3h/hQXxYVcFqlEgx2sZI+SNtUfUPOEgZqtr
         8V/hgms9ZAhMpQWEzkyaAlFouccEA4ot4lgKXbwLxfqEWiuV6UIY6WxYLtEMr71C96UR
         WckFais5Dmv0FHUNQD+dbmxji74hiZwtXdm+DpPxlNo9HkerunobK1xR0da3E2Ze2/pm
         mjVPbSeiYEqNRVFiOi/SHXsd7FIWgPdKExE30Nzlo3dkENCHN76l1q1w0zmDQZukNYIh
         Vukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581637; x=1792186437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        b=SfXdKrzcgWmWB3Nilz8sIe/pUQHjIWy9OrzxortTZcZ5tnVXTavSB81/iPBqMs1sgE
         Dy88ufCx570b1E2rEMMf3z24Jt4a7fTf/dcpIkfI/GEL9S7tOIBt8t7pyhKqLEfJRYW6
         hjW9V6hsQ1abkngQa1cH0a6rdeh2ihSw6k5KTHSJR/oc7sU7CfZME3n1i+K3mdBwZdEQ
         wRqlS3vfAfpfkwT8AlXk3k28W32x6er7gSj+3uHlBtFiL6Ti8Ch9RNOH2qjkFqmV57lw
         1stWmxbElyGzMQuqBfr4XWSMVuFYzBQCOC7zhX8b/waN5jzvj6N5PnMosUH6Y3fa2jbO
         IsiA==
X-Forwarded-Encrypted: i=1; AKwUvBx65SafRValRf2K3TtPed1BlgeftktlFWmiEwV2BuRb5JUBNZ9AUtpwkqAYnAWh5Csqwth7@lists.linux.dev
X-Gm-Message-State: AFq9FYI21EEm3XJx50rKmFE5146A1ZhZMYiTBF2NQNYyIhQzWpmIiXV1
	klhtrIDxY4JCjyoiL70PUiUfYHh5sb9h5hPC4ASdpc/IeiRI0BUyA+hjQ9Ge8duhxPD6WkHNHb9
	ZLy+nNmvKHwhq1YpF5JtddJXfQQen2Yo=
X-Gm-Gg: AYBFou0mke7oupNQd5Kj8tlpU15wm3vBKMPouclVW+BCehhplgJTlwTA43Nxyovk8Hb
	dV+5ByRpFHx9zWHnPBRh4+8dtcwdli9Bh3bub4Z9hfse7lcLFwyZO9IQz5Y0/zCRM6o0v1cuqBg
	SWY9zhWKR2LKeZEd25Gx1SffLUrn0+UVI8oB3tVoy4tOhtwX/vhD4EUqQyVha6rOBZjOVwDUQhr
	esmULeIfi59x43kr6xn6A181Or9jAsZsFin405u0XmmNAjOPSAXxwLCcPxKn+5Ek/JsWTmUKpOf
	+7jT8zVYTT6nk6KbRTxs33Lehzvxa3cBxUKCDBPBG/xGmYonzlHeieHSx66qAOyqabszzKlf4R5
	rpPwNz3hcV606LhIrNxquXeazjfODd+Dms+jrgpieY4MWt3rGzG2ya5j4Mv9G/3Ml+T4lVhRtB+
	mkxKIaYm7pzdOLJYq31q3T1jHbmS0oIGNZX95meYhx9u86Y0b5FzvB6BSKkka/Ct+Kow==
X-Received: by 2002:a05:6402:3548:b0:6ac:8dce:5a75 with SMTP id
 4fb4d7f45d1cf-6b17c254712mr2711939a12.23.1791581636975; Fri, 09 Oct 2026
 14:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008191711.223236-1-rosenp@gmail.com> <20261009191300.GA757048@ax162>
In-Reply-To: <20261009191300.GA757048@ax162>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 14:33:45 -0700
X-Gm-Features: AclHuK8MlV0tZcrPlLYVGSOF_atGwGV-YpvAht_KJ3XEVfnjWvLiyx6HZPct2Ig
Message-ID: <CAKxU2N9iJahKnVJWTHvh0jaEEma1RuthMW_C7AbvHV+4y_m-=w@mail.gmail.com>
Subject: Re: [PATCH v2] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Nathan Chancellor <nathan@kernel.org>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 12:17:11PM -0700, Rosen Penev wrote:
> > A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
> >
> >   mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
> >   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
> >
> > sparc64 defines p4d_page() as NULL, on the assumption that it is only
> > used by stubbed out hugetlb gup code. Generic code now uses it in
> > vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> > used in pointer arithmetic, which clang diagnoses even though the
> > branch is unreachable on sparc64.
> >
> > Define p4d_page() as a NULL function to silence clang's warning on an
> > unreachable branch. sparc64 has no p4d leaf mappings, so there is no
> > functional change.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: use a NULL function instead.
> >  arch/sparc/include/asm/pgtable_64.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/a=
sm/pgtable_64.h
> > index 35a217bf6e5c..54e563eb0efd 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -851,7 +851,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
> >  #define p4d_clear(p4dp)                      (p4d_val(*(p4dp)) =3D 0UL=
)
> >
> >  /* only used by the stubbed out hugetlb gup code, should never be call=
ed */
> > -#define p4d_page(p4d)                        NULL
> > +#define p4d_page(p4d)                        static inline struct page=
 *p4d_page(p4d_t p4d) { return NULL; }
>
> Huh? Why did you keep the macro instead of replacing it with the static
> inline function wholesale? This should have just be
>
> -#define p4d_page(p4d)                  NULL
> +static inline struct page *p4d_page(p4d_t p4d) { return NULL; }
>
> no?
Was not thinking. I sent a v3 and actually tested compilation this time.
>
> >  #define pud_leaf pud_leaf
> >  static inline bool pud_leaf(pud_t pud)
> > --
> > 2.56.0
> >
>
> --
> Cheers,
> Nathan

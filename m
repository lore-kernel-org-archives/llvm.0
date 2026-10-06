Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF1456E11
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294392; cv=pass; b=YNCEcwjtTFHdbDT0nQpawEljZU80QeAW17jC1iaEio1ZW1BNDE3pbRUJK0dKRvmyrVpW+40ScXcPbvk2OvcaatMNRw3QRuT+cz8neuTpuOg4+ynMXHDV05x3tIXcSWSelorqiG0J7mKC2L2lWbCOBmtTfchRe9cTMkDtk5hoEC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294392; c=relaxed/simple;
	bh=C4ZK4y5jqDlopKlvsMqwakPYMQHAT0xpUCwWJwaY68c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5EE+RBENM2UQdmksdj6IWGzLiWPAIHACQsh3PkUVE+oW09pBvn4fcNXFYAxQdigd/PMPrtL8W2vEX2TO1NJ8X1HCgME+Rq6/w4dGaA2OuKuRxqDyQqpIWhim4VEdIYDo8TUhc+uyvdOPg8KzKqhFyLXjtPaDiAXXeAedXrq6aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r+kAtKnQ; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r+kAtKnQ"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ce65316337so2149325e0c.3
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 06:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791294390; cv=none;
        d=google.com; s=arc-20260327;
        b=SPpcmuQETzfVdg/10OxsepzrQ+WCHVIsTJLaTMqF9AmFDqEXwFyDFL+vvVk16tMUYu
         4RHAwQHsR5wm9QZr8MowO/DfZepY3c7Jd3H6iqMiqjZgogzXbMMN5cGP/zagN3hw4IeQ
         1N5gVU/S3Jwyh3JOoelpAmpZo35T9eUvrEcb8PQ1hoc1TUMW/snj7NmISiDM7ugB9RQy
         wRhtIgbq7gLVR02XYarx3YhEeXsa9YpwwxGwtszjZxmc3SkNL+wzPxDaUO4dsphW3jM6
         nUUDKGmXLhVsR1nKTnCkAs2z2439oln4JIEzn4nL4Ba7cvnW9a9MbXXQ9niNMacaq1gX
         8ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        fh=77tPuiCmQA/kjN9zOIZDORgVAHN6xQJc/qyozOZIGc8=;
        b=YOHtxj2P7m9V3kX6dUeE+NO6rmxJ0dey5tz5+sBNWjEx69bDa4F2KfDBWg41SGyPq9
         mtYJXUC9V7JQleaT5Usj/XfVAJWvVzm4KiiPLqAZ7MgMix632PSogloHehhd50368C2d
         w31mlofOSYOxNLdcPkhBlx5aMI0Vl0AQcmAEUJiOvgLwRs5fdJ+ikX30l3tdOCetGA7L
         WXdLKY0flHbG9yiCqn2uCA8g4m8CS0OA6T91wHo54oBTZ0FPC1tstWJlGOzzHf3hAXXM
         w9j/udBKBiR7geIhcnsKe4G/VzwbH1A4MV7UVw5PaLB9ZE7gRxnwYX/kzcuCOtc4SVOe
         LXZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791294390; x=1791899190; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        b=r+kAtKnQo2n/89wjG/gDnswOT9AkVfophlPaAxNKQ1N/NZ2OQiYdnluD1wnpNLt2OZ
         5IHrqBuOLHcAH2WCizmiFtHSGvy5tVQomdKzAxZEK5mk80DalifLoXO8WQb20OzofnnZ
         Ax+sGoT2J623CmswJwHKUp6Mddqa/Pw/2223JhIsImxmOLp/peBBfdfJnaFJl4Ak47rw
         X5bC63ymbA4C55fOPMUEOmOdNEzuQjfNmrEyvzfVzwAvsevcn0d6v01lSuy3eK69Luny
         fSi4YWXnsUmQ+G341MUNdGc11oNHy2fT0zLisrGr9f6AigKbgcRlUle/k5hk0apxTgn6
         g5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294390; x=1791899190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        b=XywsGnLhDKVE2/f2Da7xCKZSAiub9tZHtW2X5zPKbM8HEB6X8ONejuWaxNwYI6H6wL
         FsxW2WHhvu/Uvdh0fRv95kVIIqnxO/z1MiOpA/qH6J0kd7QS1iUWL73LnqEju/8Hy9E5
         O3fVEVvyaOETyTUHSFgiOnnUQMYEe8216mZL4OAPa9yU04ThcTPM+obVBxjJpSWF2Rd0
         dsN3gm8dPgi1TKZ1KIMp7fCli8yz804AarvdYn/TkEO6SWKIYm+JXJIq8r+fVq2/i4j5
         ncrTI1ekf58vQKpeYpyNQt24lclai0BBqsebdSlwwwpeeMWBqYkC2y2ItQMpiLDy5g2k
         yAQg==
X-Forwarded-Encrypted: i=1; AKwUvBwfTIEPLbg76DsiEbLdo5oYv7cDE4kOmFcT/gyI4SQU40ObBcNMgApef4v9eyTBTbC9Swu1@lists.linux.dev
X-Gm-Message-State: AFq9FYK2XHY1zTFWyVpq5juSYeLTyXl1w2PR5P7DyYImZFN572lFoDD/
	2xvbTSdqtrt3hdLbgSCxoRptO4VRRta2suUQSpy5c5KrvoGflz0qEULzGVaRRvXw5KMb/TpGT9F
	GUPMI7S9y8x1snJEB4x3JT2AzTsixcr+D+57WxWo=
X-Gm-Gg: AYBFou1uYFxVYpnpxsOZFeddMbX14Kk3a/+DfiT+waN+GVw3x7ab7NFGkTR4CiugZPr
	wc8GIqAG4qjvZdCQygBESBeIHs+ORTKHPAvn6z8HOX3dhvHskwlTMzzzyviOpAfv/ZIph2cM2rE
	VMkMlGJ0GRin0tnNnYkY/16GgmELekPL9B3eonf836DCyDeaDhauoea0/ps6v3CTlxqKzc0m4p7
	96cAwetC34vQE8YgsacGWSiVhEn1/86UemUXQmyVDWkth6UJabwlhlF/g3VoyQ1WIDA9px5wF3d
	mcy6WmvOY7jPI/15eJ6GyuTBii8y8F6dHbHIsvU/8xivOwrtcktPfQHA+EuACYHS3L4whOlJE8x
	uJeqamyfD4fcY7S+wIBjR
X-Received: by 2002:a05:6122:d22:b0:5c9:c60e:5cf6 with SMTP id
 71dfb90a1353d-5de6d6ad882mr3678253e0c.20.1791294388970; Tue, 06 Oct 2026
 06:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <3cd11b18-30da-4dc1-9585-1112778aba38@app.fastmail.com>
In-Reply-To: <3cd11b18-30da-4dc1-9585-1112778aba38@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 6 Oct 2026 06:46:12 -0700
X-Gm-Features: AclHuK-xrMb5bRM8C1f3tnWgdVCw-4GPt92q5ifPXVanSRIoA_ArhDjbqKs1NeA
Message-ID: <CAGG=3QWxG9m1gde+RVwqEfDHSizfNP_hOV5UpQUdA5aTbx_8Eg@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:09=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
>
>
> On Tue, 6 Oct 2026, at 11:43, Bill Wendling wrote:
> > Code that runs outside the kernel proper, such as the EFI stub, gets
> > nothing out of the counted_by annotations: the bounds checks they feed
> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >
> > The annotations can also break the build. A __counted_by_ptr() that
> > names a member declared after the pointer needs Clang's
> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and doe=
s
> > not get that flag, so it fails as soon as such a struct is pulled in
> > through a common header.
> >
> > Overriding the macros from a Makefile doesn't work:
> > 'compiler_types.h' is pulled in with '-include', which is processed
> > after all -D/-U options, so it re-establishes the definitions. Follow
> > the '__NO_FORTIFY' precedent instead: let a build define
> > '__NO_COUNTED_BY' to turn the corresponding annotation into a no-op.
> >
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we ne=
ed it.
> > v3: Add the version to the Subject line.
> > v4: Use __NO_COUNTED_BY to reduce churn later on.
> > ---
> >  include/linux/compiler_types.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_ty=
pes.h
> > index c5921f139007..05e2b637f1cd 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -371,8 +371,13 @@ struct ftrace_likely_data {
> >   *
> >   * __bdos on clang < 19.1.3 can be off by 4:
> >   * https://github.com/llvm/llvm-project/pull/112636
> > + *
> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can de=
fine
> > + * __NO_COUNTED_BY to drop the annotation, since it gains nothing from=
 the
> > + * bounds checks. __NO_COUNTED_BY should be used sparingly, because th=
ere are
> > + * better options for opting out of bounds checking.
> >   */
> > -#ifdef CONFIG_CC_HAS_COUNTED_BY
> > +#if defined(CONFIG_CC_HAS_COUNTED_BY) && !defined(__NO_COUNTED_BY)
> >  # define __counted_by(member)                __attribute__((__counted_=
by__(member)))
> >  #else
> >  # define __counted_by(member)
>
>
> What happened to counted_by_ptr() now? __NO_COUNTED_BY should disable tha=
t too.
>
I realized that just now. *sigh* I'd take up basketweaving, but I'd
probably get splinters that would fester and I'd lose fingers.

Fixed in v5.

-bw

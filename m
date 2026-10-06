Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A13B47FF
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278616; cv=pass; b=BzScGya500TAVe/sZFx1vNAXxAcCMQrsIkPoqu3KXg+xRM2i6gxDozOklJ48zOZhbrh4/cvuWEtXotZdsyLPT5wAJhlChATrLlF8nUBrb+zKGBbh5hY98+ZLgA9BhHqJAo4C+p4SpbGXZJn1NzsHV0asULSfGTUOJBnyoSjQSFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278616; c=relaxed/simple;
	bh=XrDbxp9D5a6x31fsBexXhmb5Tdb4LYGgG402LfoyXuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fb5sE1i9XzBlyYEHw55b0OapBd4f1MUx+Gk5vkoMPoAiU0jMK2qY4ib/BZNpc7oZefg4vPNtYXMpt5NQnqSEj0UbXKAc4P/lJ5rRErdeVpJlYVe9ZKDP9ZnU8sKex/uf+ibNluGruqfPNW82APKWRH3y3HWvRwA9hF6wYq+hfVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vECeBiYp; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vECeBiYp"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98c67e94e53so1206328241.1
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 02:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791278614; cv=none;
        d=google.com; s=arc-20260327;
        b=oCudGx/Iicj6bX+3eDxTgsuGxzBsVLjqP+XP58ZVi7bNa+ysBezycURHl9biCbHuJH
         cXyEIknZRun17iZ1/+vHoFpbAPuz2i0si0yw0pge2lzIn/5OMBriQ7KszyJ3MfVS06jo
         CBld4dyO9WvXka/CRS2GThbAza02v34UNeVqlYaaMYQcMIod5gF4ghtISVUOUySIT/3q
         HhwxyeKXf5U0zZzBUpze+ftkyOtq4aHJe/BJj4rbgTKeKYp7W47bTU0HQ4siROimecOj
         5rv6mtuujl/nKLbvV0p3FkkP/D9CLO/KJ5CV9YEcLrdgVkiPBJdqnrk1Oj804Uszy0RY
         sd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        fh=eex8p2b1+RUSut2k9yh4rcqMNZy8gNYYSGxo6mxa/W4=;
        b=mGcKf5TWcM1ljdJWiRywG0Ym64FeU3YBg6PZL7PNGsLRmc2ejphesmPnUZ1tC2eTrk
         XGQ+U/jhLarh+vSyxIT/CN11muukdGK+GGvAOoAaUsTRLBK2Y+jZ4gSnqbvZL44b3NmC
         ca3duhux5Wm2rocz4UE1zkSIl70AY67CXrSwspR7hFrxnuhmY1fhK12TYVKZeMjUTyTH
         DqISYZvzk9EMgYrXmHdHjffFXW9i96aFkiGnISjOtTC+kagQSGvq9nBlIfQDw0N/z9Cc
         MoexOZ37P20KswJddOW7QGfXn8J+8o7tUfziEx1aK6JAXb354lHHDWSiDT/pW905ae7K
         +UBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791278614; x=1791883414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        b=vECeBiYpLLjg/ku4Y8Qi+a5G1+/wJ+g4k6NxRL0ESgshkg6wMsiZ9I5H5JsINWdJxk
         GaJ2f1gPxRmbDXOXEMhtd7T4IPpb7kpQvEWDtmB5falQnsj8pDo/xPLruyFrNSLlSP25
         gAyVyBIhXOFGMdOUpj9KiyChiMqehU/VLhSYwmVM2wp9rHfDX5Ec4TMgkGvQ/kycvrxI
         uZEvwPGzSpWpLoL2Wqk6Hnwg3rHHrOahdYnidQk/49qFhD7BZhwUovvEIP4p1W2DX/qX
         xyNj5epZbDwVdYPT8VD8QVuZXHf+Dx4OegMntll6G0QIR/HI6OP0L4Mf/ciHsBAY+Yjw
         XiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278614; x=1791883414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        b=Dbv8j315rZW0g05cRcIL+ag9rlnGFXYd57z5cKX6F1Xxh8XLB9cuV29AAP+18XSRjY
         ZFgSqkzl/WUY3Hliaz4CHL0gWTEwOe1PW7hh8nHkrI7u++iTxrPqeJ0peIDj8XIXeMpA
         uCzSP+/DfmXSeQGT0afvicZct0vefBxLOn+sXgudvIlUnmv3kXH/GPS0/M4YqksOa8Wr
         0RKCDFCz+YH9QEig/eOSBdhkoJjvjumtXRIEkvvCTzbJZkW7leBX6marqkckov4r/TMY
         tbON352yZwddVAUSsXzGkFo32mk837+2+C9pTTJSfDpt6NMhmU2BLgZRUnelhmnjmYBQ
         a/Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxTTZtboWMUA8Rjj/KKth0rhJv0NzNT12legDofYeHi6Q/yK7nSZ/cEaxmiFMVIBZRRPiF5@lists.linux.dev
X-Gm-Message-State: AFq9FYINSnFU0FJi9BueWzOW1CJExMY/POTdyWizx6VNdetQQrap4L/U
	N9eMOPrFGlxEk5s6LGhuH57x/XfMb61CA04fx49QIEmAj2Dw40AKmUnLp4XAJ883atRcF/jeCD0
	YVw+1/mXviwSi+HAG9AcUvSCuBmSh6EtMBk8OLFU=
X-Gm-Gg: AYBFou3euSdfI0jfMhOSNZ+cJJJ+TyRmtt0AKiIuQc2L5hDzOnXnwip/rW+7UUAKt9d
	F5bC22Ia7p+BVGVTViZSjfYxP4cOBDJ+RDZxyymqol81rH9z3lnqMq3SY+h78hLTie/Dcvo1AEj
	S53wfTsLSxA0J8GEbfb9bcRuO8dhB4iMilOMJTFHR58S8nvsBxAcOUV/VIIcthGmHydytvIJpui
	HkaKcMbOc+SBdNwe7rqhNDRDFxtD/XYw+U/aL5KbA5wrxDvT3hwKAjVuG0zGUW6j1e0lRvJfWfl
	OO+gWXaWng2k5BcZ1tx6GU4pg6jwtburbn23SbpcMY16jwAz5fjK069csEkPTBTYcKSZAy9weNB
	JqdDi/5P5Uaz1DkfJxkG90g7IePbfxYE=
X-Received: by 2002:a05:6102:a54:b0:79d:a035:b6e6 with SMTP id
 ada2fe7eead31-7c87a0038c6mr115746137.3.1791278613354; Tue, 06 Oct 2026
 02:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261005192052.2589382-1-morbo@google.com>
 <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com> <CAFhGd8q3Hs9r6ezCA5bFATcZcq7AZyC7Cai8muk5o-AwOMLW7w@mail.gmail.com>
 <e9e04143-22ff-4396-9b33-333231366f64@app.fastmail.com>
In-Reply-To: <e9e04143-22ff-4396-9b33-333231366f64@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 6 Oct 2026 02:23:17 -0700
X-Gm-Features: AclHuK9qkbH2EI0TJCoQEjGmE8OJ4mfVOULY_WNEwFYu4N8Ri6mQFkkdEf41th4
Message-ID: <CAGG=3QXsdkEEQcfU-QyTW4VA6TsJTScMkidcekrtDtU6H3ubOA@mail.gmail.com>
Subject: Re: [PATCH v3] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:08=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Tue, 6 Oct 2026, at 09:30, Justin Stitt wrote:
> > Hi,
> >
> > On Mon, Oct 5, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> >>
> >>
> >>
> >> On Mon, 5 Oct 2026, at 21:20, Bill Wendling wrote:
> >> > Code that runs outside the kernel proper, such as the EFI stub, gets
> >> > nothing out of the counted_by annotations: the bounds checks they fe=
ed
> >> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >> >
> >> > The annotations can also break the build. A __counted_by_ptr() that
> >> > names a member declared after the pointer needs Clang's
> >> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> >> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and =
does
> >> > not get that flag, so it fails as soon as such a struct is pulled in
> >> > through a common header.
> >> >
> >> > Overriding the __counted_by_ptr macro from a Makefile doesn't work:
> >> > 'compiler_types.h' is pulled in with '-include', which is processed
> >> > after all -D/-U options, so it re-establishes the definitions. Follo=
w
> >> > the '__NO_FORTIFY' precedent instead: let a build define
> >> > '__NO_COUNTED_BY_PTR' to turn the corresponding annotation into a no=
-op.
> >> >
> >> > Assisted-by: LLM
> >> > Signed-off-by: Bill Wendling <morbo@google.com>
> >> > ---
> >> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we=
 need it.
> >> > v3: Add the version to the Subject line.
> >> > ---
> >> >  include/linux/compiler_types.h | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/include/linux/compiler_types.h
> >> > b/include/linux/compiler_types.h
> >> > index c5921f139007..8bde6798b4ec 100644
> >> > --- a/include/linux/compiler_types.h
> >> > +++ b/include/linux/compiler_types.h
> >> > @@ -387,8 +387,13 @@ struct ftrace_likely_data {
> >> >   *
> >> >   *   gcc:
> >> > https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> >> >   * clang:
> >> > https://clang.llvm.org/docs/AttributeReference.html#counted-by-count=
ed-by-or-null-sized-by-sized-by-or-null
> >> > + *
> >> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can
> >> > define
> >> > + * __NO_COUNTED_BY_PTR to drop the annotation. Such code may also l=
ack
> >> > the flag
> >> > + * Clang needs to parse a reference to a later-declared member
> >> > + * (-fexperimental-late-parse-attributes).
> >> >   */
> >> > -#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> >> > +#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) &&
> >> > !defined(__NO_COUNTED_BY_PTR)
> >> >  #define
> >> > __counted_by_ptr(member)      __attribute__((__counted_by__(member))=
)
> >> >  #else
> >> >  #define __counted_by_ptr(member)
> >>
> >> Apologies, I may have been unclear.
> >>
> >> What I would like to see here is something like
> >>
> >> #ifndef __NO_COUNTED_BY
> >> #define __counted_by(member)  __attribute__((....))
> >> #define __counted_by_ptr(member)  __attribute__((....))
> >> #else
> >> #define __counted_by(member)
> >> #define __counted_by_ptr(member)
> >> #endif
> >
> > FWIW, Bill's original patch had this explanation
> >
> > "The two are kept separate but parallel so they
> > can be folded together once all supported compilers handle
> > '__counted_by' on pointers."
> >
>
> When opting out of this, whether or not the compiler supports
> all variants of counted_by() is irrelevant. The same #define
> should just opt out of all of them.
>
> If the need arises to be more granular here, we can always add
> that later but I don't want to have to add
>
> -D__NO_COUNTED_BY -D__NO_COUNTED_BY_PTR
>
> everywhere today, and go back and remove the second part once
> all compilers have caught up.
>
It would reduce churn in the code base once we no longer need a
separate '__counted_by_ptr' macro. However, we should specify that
__NO_COUNTED_BY should be used sparingly, as there are other, better
ways to "opt out" of the __counted_by family of attributes. Basically,
it should only be used if the Makefile doesn't inherit its KCFLAGS
from the root Makefile.

-bw

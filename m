Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE243125B2
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9EihEnT"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54af4f2838dso2037964a12.2
        for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 23:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701416902; x=1702021702; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqqO/q4f6pFgF1PPCq8ZVSkps1XzTjSMsOrJ9t4F9/I=;
        b=l9EihEnTZrGRwgNMgYfW+roA4U+Z4Rs9dV6jzt/LxioMzhWTLUNFxYjusxzrz7++mm
         NsNbmm02+Bn5uOiWhptwkgWsCRKiOVJWlMpAw61IOk4eqhIZsbn1AoOLoI16exCwr6mj
         sqM8Mn1i9NMPGJuKOUJMLkOMaPfJB7t4iT6oD+Oe/F4SHWq541si0C4uaOOTMoQv1/yc
         x3cHfd9CbOQ4Yvh1ji2umkU12UJ+UCTdrq9B0+2n6CythFTRK7imck6kwMnpeQWmnzo/
         nmt7klyXhM5U/BjhGIthJB7ZMuw3xS32pfVGySSzvRxQKRzWw2ataRwNL/Q3VPsFEleB
         dMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416902; x=1702021702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqqO/q4f6pFgF1PPCq8ZVSkps1XzTjSMsOrJ9t4F9/I=;
        b=iiau7PAE7UKA0hLYL3QkFpHJIQziu7nHvD7hBa7O6g7tAHFIOV5zlKlIONWI4MARF3
         X7oeXUCMOM6pCHrK0h29T5HybA73xP5Mv93RxIt/fxZQAXBu9HW9jarssFcq1A3aaHsD
         OIZmhbBE+EJrLvp+ABk6h/jdIr7kSc/Vnb1myvrMh5R3sAP8Fr1gc8OC3GQEiyS7Im5Z
         E0Dh9UHp6lO7fRpWKPqcRjg0qZ3WHTKCqe1KL9N1CqTUKseUOQ3Z74LTQmxbKBGeGAPr
         qjSsy7gs/7Ny20ADIou0tdpvU3fgoZ31HjpQvvhZQZ0Nxt9e2iYJQ9qi0ZDNCMsp2XuW
         8Srw==
X-Gm-Message-State: AOJu0YxUtWf6wH4gefjWnO2T1BdDVMAaT7XWjpmb9JVsgcz0hUKtVF/d
	/eLm8/vuPqLxUhjIjhMQ+YZ5WmPridyqBVa9jAE=
X-Google-Smtp-Source: AGHT+IHXt7iWmWAHVO6dLBENFB4BU1iOkeDYAFaPuDdzu9erF2c9fh5ZDPqFa2o+OlhWO+47MvbVCk1IY20gs45gSgI=
X-Received: by 2002:a50:a404:0:b0:548:7a6f:b51e with SMTP id
 u4-20020a50a404000000b005487a6fb51emr498989edb.14.1701416901693; Thu, 30 Nov
 2023 23:48:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231105213731.1878100-1-ubizjak@gmail.com> <20231105213731.1878100-3-ubizjak@gmail.com>
 <20231201035457.GA321497@dev-arch.thelio-3990X>
In-Reply-To: <20231201035457.GA321497@dev-arch.thelio-3990X>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 1 Dec 2023 08:48:10 +0100
Message-ID: <CAFULd4YWa+Xfue-JEebR9JgjxKtQy7byr68Q+tTOdR+Jf1DBEg@mail.gmail.com>
Subject: Re: [PATCH -tip v2 2/3] x86/callthunks: Handle %rip-relative
 relocations in call thunk template
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000000a641c060b6dfec8"

--0000000000000a641c060b6dfec8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 4:55=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Uros,
>
> On Sun, Nov 05, 2023 at 10:34:36PM +0100, Uros Bizjak wrote:
> > Contrary to alternatives, relocations are currently not supported in
> > call thunk templates.  Re-use the existing infrastructure from
> > alternative.c to allow %rip-relative relocations when copying call
> > thunk template from its storage location.
> >
> > The patch allows unification of ASM_INCREMENT_CALL_DEPTH, which already
> > uses PER_CPU_VAR macro, with INCREMENT_CALL_DEPTH, used in call thunk
> > template, which is currently limited to use absolute address.
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ...
> > diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.=
c
> > index e9ad518a5003..ef9c04707b3c 100644
> > --- a/arch/x86/kernel/callthunks.c
> > +++ b/arch/x86/kernel/callthunks.c
> ...
> > @@ -291,20 +298,27 @@ void *callthunks_translate_call_dest(void *dest)
> >  static bool is_callthunk(void *addr)
> >  {
> >       unsigned int tmpl_size =3D SKL_TMPL_SIZE;
> > -     void *tmpl =3D skl_call_thunk_template;
> > +     u8 insn_buff[MAX_PATCH_LEN];
> >       unsigned long dest;
> > +     u8 *pad;
> >
> >       dest =3D roundup((unsigned long)addr, CONFIG_FUNCTION_ALIGNMENT);
> >       if (!thunks_initialized || skip_addr((void *)dest))
> >               return false;
> >
> > -     return !bcmp((void *)(dest - tmpl_size), tmpl, tmpl_size);
> > +     *pad =3D dest - tmpl_size;
>
> Clang warns (or errors with CONFIG_WERROR=3Dy):

Uh, GCC didn't warn at all (and there is some mixup with types here,
so a thinko slipped through.

The attached patch fixes the oversight. I'll post a formal patch later
today after some more testing.

Thanks,
Uros.

--0000000000000a641c060b6dfec8
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lpmbofu90>
X-Attachment-Id: f_lpmbofu90

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jYWxsdGh1bmtzLmMgYi9hcmNoL3g4Ni9rZXJu
ZWwvY2FsbHRodW5rcy5jCmluZGV4IGY1NTA3Yzk1ZTdiZS4uNzFiNzRhMDdjOGVlIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvY2FsbHRodW5rcy5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9j
YWxsdGh1bmtzLmMKQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgYm9vbCBpc19jYWxsdGh1bmso
dm9pZCAqYWRkcikKIAlpZiAoIXRodW5rc19pbml0aWFsaXplZCB8fCBza2lwX2FkZHIoKHZvaWQg
KilkZXN0KSkKIAkJcmV0dXJuIGZhbHNlOwogCi0JKnBhZCA9IGRlc3QgLSB0bXBsX3NpemU7CisJ
cGFkID0gKHZvaWQgKilkZXN0IC0gdG1wbF9zaXplOwogCiAJbWVtY3B5KGluc25fYnVmZiwgc2ts
X2NhbGxfdGh1bmtfdGVtcGxhdGUsIHRtcGxfc2l6ZSk7CiAJYXBwbHlfcmVsb2NhdGlvbihpbnNu
X2J1ZmYsIHRtcGxfc2l6ZSwgcGFkLAo=
--0000000000000a641c060b6dfec8--

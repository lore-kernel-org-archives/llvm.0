Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C862C9D
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 13:07:11 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id k31so18337599ybj.4
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 05:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YgGxwqesxYhk+GrHgJnKwpv75Cf0zbWqGe6zVs0QN+M=;
        b=cNBEtVx5FT1+KykCzEe9T2FFs9AIQBumaxy53+2enGDqLWGuhatShrWWnhC49Jy9xw
         VmTHspZqGebuddH4NHpFewL2UtFVBpApT3VtMcKLUIBuB/WhObXIS47vBZw4v3RpZ/HM
         q5of2qbhTXbKMMRrGBrJEwq9vP20jD9Q+OBNWFLYgvH+Bm4JCrCO2xlDtTR217dtey2i
         kuaKb7v1zs6oPJeRtzhyGmy3hR+bFGpG3lR36aJXckQNlP4uqZRLDN0mhpFpZCE81jEg
         ImcsFQXJCnKDW4AzBbhzX+Ajy1vnY2eqn+d9RADdGcZGQHfk43bOCwvVKr3QM2jXvMGF
         yH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YgGxwqesxYhk+GrHgJnKwpv75Cf0zbWqGe6zVs0QN+M=;
        b=mCISw/CYpCpWQ0HY24aOrV8WLJr9U/bdCVAKSzH9KWLrTWTAsEb5BNQhZZBRmBYJqq
         txO796XRgxswupiihEMPi4x41uTaTL9izDm1D6MwYPBVa69qEVTtqBoGdafvSZ1CRPSB
         iqJtO5TMvdX9DstmJwGLmXPS4AbMGxWjav71hLy5LzfWEEqu7+pFSRwCYcDky/i00Tjs
         DJAF5VapZt6xq17lxN0/pqTkeOQViQQRkYitO4+7cO+8ZBmJKwrpopaZe/vZkZJYtrkR
         NVouaBljw1OicahRn2si6artvM2otzGNN9pi5ze9Q+BSYDpBGILiBusXqiJq/PJy5m8E
         nUqg==
X-Gm-Message-State: AOAM5317fAkjB1j5O5mjx3BTLWlY5+zxAM2+TfKPdVq+L+8KHCjJQb4b
	4l+o8t4cefaJx/gUEV7RjBSvMl2fLSroOXUEtftQiw==
X-Google-Smtp-Source: ABdhPJzb57UArYumAtcFeFp1C6yIxpu8it15t9WtSxwl45jhC2s8WeqrPkgaWoXnmz9TXVUA2MkZKhDWx0uFxL1ECgM=
X-Received: by 2002:a25:bb4d:: with SMTP id b13mr12751188ybk.129.1643375230778;
 Fri, 28 Jan 2022 05:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128100815.3231551-1-anders.roxell@linaro.org> <c6beb8a8-ecf3-1c17-f685-f5e69cd6265a@csgroup.eu>
In-Reply-To: <c6beb8a8-ecf3-1c17-f685-f5e69cd6265a@csgroup.eu>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 28 Jan 2022 14:07:00 +0100
Message-ID: <CADYN=9L=RB2AoBNU6Cfy2UKyznJy+oo0aPvapHp-v1f12uVs-A@mail.gmail.com>
Subject: Re: [PATCHv2] powerpc: mm: radix_tlb: rearrange the if-else block
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Jan 2022 at 11:14, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 28/01/2022 =C3=A0 11:08, Anders Roxell a =C3=A9crit :
> > Clang warns:
> >
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' =
is uninitialized when used here [-Werror,-Wuninitialized]
> >                                  __tlbiel_va_range(hstart, hend, pid,
> >                                                    ^~~~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the vari=
able 'hstart' to silence this warning
> >                  unsigned long hstart, hend;
> >                                      ^
> >                                       =3D 0
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is=
 uninitialized when used here [-Werror,-Wuninitialized]
> >                                  __tlbiel_va_range(hstart, hend, pid,
> >                                                            ^~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the vari=
able 'hend' to silence this warning
> >                  unsigned long hstart, hend;
> >                                            ^
> >                                             =3D 0
> > 2 errors generated.
> >
> > Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> > always gets initialized, this will silence the warnings. That will also
> > simplify the 'else' path. Clang is getting confused with these warnings=
,
> > but the warnings is a false-positive.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >   arch/powerpc/mm/book3s64/radix_tlb.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/boo=
k3s64/radix_tlb.c
> > index 7724af19ed7e..7d65965a0688 100644
> > --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> > +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> > @@ -1174,12 +1174,9 @@ static inline void __radix__flush_tlb_range(stru=
ct mm_struct *mm,
> >               bool hflush =3D false;
>
> You should then remove the default initialisation of hflush to false
> which has become pointless.
>
> With that fixed,
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thank you for the review.
I will send a v3 shortly with that fixed.

Cheers,
Anders

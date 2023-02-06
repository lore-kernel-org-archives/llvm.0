Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A356FD3
	for <llvm@lists.linux.dev>; Mon,  6 Feb 2023 23:41:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id e19so5981902plc.9
        for <llvm@lists.linux.dev>; Mon, 06 Feb 2023 15:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu0OFN8qZCYWAqVWMqFlj99/Zkr5M5+Eb6c07HRobgk=;
        b=X6O8KDVvbqMZvTq/dBZU/owDSJ8rL1va66hKecrnPQWO7NbZM9JZH8Ff/Kgp+8XR0h
         PYt06fY/twQ70b2B5OciSQ8Ux5zQk8addCp1zwAR7cPUZ6SWWHzhljSi58TNzatHnfol
         Nw0cL+/FeO5Zk1/pmkV2h5fDPZdIjoE9S3+kx/dy5qduoM1n6rDy2H4yiCv5UYABLcXL
         Qw1LbBH5z9Dv1M/TyXGJpC3wEbIASbTpvdDww3AN/Mp0Ls5TE0f+r5rWFT0hA8ZMtu38
         61NC8HORindS8z+Ya0AVJtBOUm6nbeuWTrtKUzw3Ahn2yR6TUWreNfWA1cLUKG9Qs6nY
         THCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu0OFN8qZCYWAqVWMqFlj99/Zkr5M5+Eb6c07HRobgk=;
        b=FFB81VcobObUhOB12e2KO8OFAbezoeN7AGz/f32VpbwaM62eBX7jlDfWeCQy9VNGu+
         siRMnlIH8XsuR5LpFCJwYeVwbxcG347tJvouKuBwzSxaMaljRyOByy6piSp/Lj2ls9jX
         rHc2tNqewzGjyXCT8weH0zDi+wqkc20ac9M6HXglSb8pp8LeChKq2ZNrwXSDcVtQ3qUE
         +Ut3ATGy+UfO7iMWL2VoNaCK1d6gKIRYnWEnJxsvUcIqurH1UEKow/u2AViJuF5/lIcr
         xNCpDCLtD9/EIp6N6g4JmM/4/5hvwU5x7MO3z1uq2HOq9wrxnMTtlN7t0WLthjaa5pz8
         QYSw==
X-Gm-Message-State: AO0yUKUAQJKW38+8Ydf/RcyIZdc813stuHcf2ZeEIMfLGZq6F00b+Pbm
	UHeKTXP/P4h5JLFltla1CudEU/eJ9TtNYCNxlTgWyg==
X-Google-Smtp-Source: AK7set9uOOMShrxA48+C1j7fFNaTfn5dhIRadvFGX40qhOjytovXu9agQpf1EsZBGE57vO7ZYGhygwi7iKDB+HEsXBo=
X-Received: by 2002:a17:902:b7c9:b0:196:7127:2240 with SMTP id
 v9-20020a170902b7c900b0019671272240mr173745plz.11.1675726877236; Mon, 06 Feb
 2023 15:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230203194201.92015-1-ebiggers@kernel.org> <63deacb1.170a0220.f078.6779@mx.google.com>
In-Reply-To: <63deacb1.170a0220.f078.6779@mx.google.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 6 Feb 2023 15:41:05 -0800
Message-ID: <CAFP8O3Kwa2V7GvJPEbr87o6hMi8i2JquWniFOaiFR3nv9pGc_g@mail.gmail.com>
Subject: Re: [PATCH] randstruct: temporarily disable clang support
To: Kees Cook <keescook@chromium.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 4, 2023 at 11:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Feb 03, 2023 at 11:42:01AM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Randstruct with clang is currently unsafe to use in any clang release
> > that supports it, due to a clang bug that is causing miscompilations:
> > "-frandomize-layout-seed inconsistently randomizes all-function-pointer=
s
> > structs" (https://github.com/llvm/llvm-project/issues/60349).  Disable
> > it temporarily until the bug is fixed and the fix is released in a clan=
g
> > version that can be checked for.
> >
> > Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  security/Kconfig.hardening | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > index 53baa95cb644..aad16187148c 100644
> > --- a/security/Kconfig.hardening
> > +++ b/security/Kconfig.hardening
> > @@ -280,7 +280,8 @@ config ZERO_CALL_USED_REGS
> >  endmenu
> >
> >  config CC_HAS_RANDSTRUCT
> > -     def_bool $(cc-option,-frandomize-layout-seed-file=3D/dev/null)
> > +     # Temporarily disabled due to https://github.com/llvm/llvm-projec=
t/issues/60349
> > +     def_bool n
> >
> >  choice
> >       prompt "Randomize layout of sensitive kernel structures"
> >
> > base-commit: 7b753a909f426f2789d9db6f357c3d59180a9354
> > --
> > 2.39.1
>
> This should be fixed with greater precision -- i.e. this is nearly fixed
> in Clang now, and is likely to be backported. So I think we'll need
> versioned checks here.
>
> --
> Kees Cook
>

Bill has requested cherry-pick the llvm-project fix into the
release/16.x branch [1].
https://github.com/llvm/llvm-project-release-prs/pull/276
It may take one day to land.

[1]: https://github.com/llvm/llvm-project/tree/release/16.x

--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

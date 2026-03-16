Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878EC358384
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694423; cv=pass; b=E2bmZRb5WRZZkhyLT5GqREl6HLvzBlWcli+LfFm6Y4Cz58m5WfTkbiXfheboq5c1IvYgDzVkkiLvbbVOx9rGirAFHjENN6zHb7nRbVkLlKp96U27sIr7uBIGYxsUYDDvRnmL5EozwObJvP4f+T2bcZTikdkZkCBt2CMRlnzgQmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694423; c=relaxed/simple;
	bh=xjEiOlby7+X1jtjWnQGqc/QCdHpRI0DPUXAfftw40i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9P2X8iPFEdfx1MfHDwRb4F1UG1/DtBKSShE/vLFROYUgb8OS+LFDut8kUzK6QkP2iZboC9cM84nY6qbwvJQuITk5Flc48b17L7/VoaYcCz+D3lr7BTdPaojP8gpjWUy59JS0QDtTiwAQ2jhFl9UEzYg5HH3kXJelEnw0cGDOMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZaeaWo0i; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZaeaWo0i"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5091ed02c54so46211cf.1
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 13:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773694421; cv=none;
        d=google.com; s=arc-20240605;
        b=WIRAqtjpBa/7cydrIQ3SWEM78/cJu7LCeJWMSwVrG/+ZDIdIaASsg8maCQTqtDVOWZ
         1rvlmIUdebN95W8Bhy1Ns1B2frQhxNudTgVMsRygV7Cbf83qkob9ZpxdbKSNAnOCDEk7
         pLXsDV0ll5JV428TCJ/n3djTPTfhIbjuSisgprNia4NMYhfSA5C2kgKLQQNGWhZhMppt
         LSUZwRhH4ux7u5nbnDxPD8vFtYuo0N76BWd2gNdpDrxL8ibLTtqjXK5ei1pnvuZXF+DY
         Og3mji5yMPUaGOG0QZxi5QuP+GwDB88bNerXh+ojKrb64seFjWmf4eyidDYKj47Q8aVU
         vA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        fh=cZgaYCBz02eAuvbycvy8UY9pN+WuLb9fDTw2uK4lugU=;
        b=Z2SicC4RdUOQuPJNkELoKm4cCNa5N0NgJNo+oJlonrqPLJN7RUPfanENF/vul8vfBa
         zGWjQTg4+74TJQjwGPn7YZEo9KvCC/0XMMFc9jH9f9g1vu9C4zYM2KfxKAAdUDk+yAU3
         XR9OucYmNJYfaujBI2VZX/6KLaxV3k5JyPrQa6ngO9pjwSdiqBOgIONcHQrilZV/K+1p
         XypYvqzG1HhaOHzl5kvJAOWE4+G1Dah9IvblgE85SyWfsvjNftpcAMuptg9v7p8mehAX
         tY12fHMg6zWjzXKP+1+8mMb7BLEuIx6uTShhMEXBJqaUmyhmJxVTm6nGym6mIwyuTUEc
         MXYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773694421; x=1774299221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        b=ZaeaWo0idMZK7iz8kf9j06bxpJIC8c52OZsnHuB2cQDVv7be/RLpZYojlmgS9+gMCR
         Bx0R1tifrV6u+5zO5wE5VxPkUPGjzvN922Y64t85RYfcnB8MctH55m1cX9MKC5XZwk/k
         H6o5B8KKJefyVGzrWOkaFJzcx01Gqjhx8Ts3M1wabjNYbQLpOvwI5sFnXp0VWtaYQwsn
         7FjAXT6wR8sNvRgtLZzrTF5lhGFp8WFVNGg8jJjzpxCVwBrDQM8z16ckiuOAzwNK0FTo
         aHqti/ndI9M0MonOxHp+vKFTbdWXfvD9LbncMCFDBodas5Sr+Q3/Zz9IfJPmswQGz99R
         hatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694421; x=1774299221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        b=f0UyV3HCU5qFu0lSUyowArSGvOg20/dx4lxERCEPK07cIEsNly88c9RTc9s/Vv6zHl
         gD8b1uWWFCzyBa/UVOrwBSJlYMgORXhio7N5OlcODloI+JVNSzB87iAf8+v9ryXN/RVy
         5DPTGdLK6fLr8oM7xp6pL+4UwG/qH9B8fWKWFn9lFy4aUhENtl6x394jjDJGEVt24o/N
         7r/EBmgjqK1tTCtArurf99YvBlr9g8lMx1qTMu3JkeeTaHS6qh2fJOIRdHRxVhZN/ca6
         uVFKGFLsh6CbOGpQuPmtXX/kcWmjJOxJ2LPu7XCkghyMadzV8LSNvpCURllM3SNszXjM
         OIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtLwvzgVln6qD8XsB8RaMsfHW61yu73RmRtmaT2WkHX/AN2fIU4SRssvz66p+kJ+W+MJ0X@lists.linux.dev
X-Gm-Message-State: AOJu0YziPGCVSve8vGCAtUoISDBYTJghMDblvaVpR7cjH7fr/ppCeWop
	pn21mUzz2WR3iaCYOFAj2nwaP72VHYcJW2vemDvafA2TeCtVJ317HujVJUAXxsPUoYnv8BXBGCv
	pOTjE3PhaOiH6hnXQb5UR+x5nXbdLt4WXQZA3oq0k
X-Gm-Gg: ATEYQzxtJezg+9WWL1C8qHinAWkmTUgf7HN2fExZZrG/CtbK6nWZv7z5m4vW5N17Wmo
	+HUGAS9xwnBOr/1BqumLRoukrdoA/dnkbZjlBJ4bGa6SdRdykAuT6lti82sYRnrcVNLti3xUo9w
	tEFDXVHfiy50+fa+fivkTSeFpH4Evrw98haNXB0vVt3JzOe2xQX5g4OAEX33WsEWpR8FPnctoQP
	1GPlIPtYFkPgcN89ps7rhW0oXWKv9chGW1oZMJHnkD7JgFTiaHkqwlptY/ncw4EK735NeHEnyE8
	bZypLNBJo2vgdsso1j22/om5YTRE0rbqC/s=
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr3930831cf.2.1773694421158; Mon, 16 Mar 2026
 13:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
 <20260316175953.GA1910339@ax162> <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
 <20260316204311.GA1329928@ax162>
In-Reply-To: <20260316204311.GA1329928@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 20:53:29 +0000
X-Gm-Features: AaiRm529X9bdSOVFyuw_ffkkUdRVI1I88YIwCTJrveYGGmKOjVl-6WwEUJdSeVU
Message-ID: <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry that my previous email may have caused some confusion.
What I really meant was to keep -T (not change to '--thin').

I think Masahiro's change targeted llvm-ar (<=3D 14), where it uses -T
for "truncate", rather '--thin'. So he used ''--thin" explicitly. But
this "--thin" was not implemented for some old ar.

Since we the minimal llvm is now 15. The '-T' flag in legacy llvm-ar
is no longer a problem. We should keep '-T'.

-Rong


On Mon, Mar 16, 2026 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Mar 16, 2026 at 11:16:41AM -0700, Rong Xu wrote:
> > If that's the case, we can just remove flag "--thin". Can we verify if
> > that works?
>
> I think we can only remove it from the second llvm-ar invocation. I
> tested
>
> diff --git a/Makefile b/Makefile
> index 2b15f0b4a0cb..fb001e02cc0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1260,12 +1260,11 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
>  KBUILD_MODULES :=3D y
>  endif
>
> -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
>  quiet_cmd_ar_vmlinux.a =3D AR      $@
>        cmd_ar_vmlinux.a =3D \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -=
f $(srctree)/scripts/head-object-list.txt)
>
>  targets +=3D vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> --
>
> on 7.0-rc4, which showed no issues. This is basically a revert of my
> suggested workaround for the original issue:
>
>   https://lore.kernel.org/YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X/
>
> You could add this as a prerequisite patch, I don't think it should be
> squashed into the move change, especially since that appears to be why
> we are in this situation. Why are we converting from the 'T' modifier to
> '--thin' in the move patch? I know the documentation of llvm-ar and GNU
> ar says that 'T' is deprecated in favor of '--thin' because it may do
> different things on various ar implementations but the kernel only
> supports these two implementations. I think we should just copy the
> commands as they are and address the deprecation separately, perhaps
> with an ar-option like Nicolas suggested upthread.
>
> How about a v3 that looks like:
>
> Patch 1: The diff above because all supported llvm-ar versions do the
> same thing as GNU ar.
>
> Patch 2: The move patch without changing 'T' into '--thin'.
>
> Patch 3: The same as before, perhaps without '--thin' as well.
>
> You'll need to base on kbuild-next-unstable [1] to address the conflict
> with Yonghong's "kbuild: Reduce the number of compiler-generated
> suffixes for clang thin-lto build" [2].
>
> [1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
> [2]: https://lore.kernel.org/20260307050250.3767489-1-yonghong.song@linux=
.dev/
>
> Cheers,
> Nathan

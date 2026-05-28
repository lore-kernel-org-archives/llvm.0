Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7631319857
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009766; cv=pass; b=FEUnNvNpeqdZ5VfcBJZcEh/sD28XtrZo8lrat6ujVgEWCMTGgg52s3I71VKZvf/h/tjHFaWDVd+NRWBYaGVi6iPP9XtYEjU6x2uJF1UkPlfaU+yLWwv1QuBfuYYGy97UwKR+3BB8l5n9iL+HktHob2rZvGUv6OK924MdvstkrXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009766; c=relaxed/simple;
	bh=n9u1n8p+Tyo28mHX87eTBmXAjGmSME8JGyFugekRIP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTqu3zhQBO3wVCmS1gKBjmHlKknTmjKIvZhlP3dfcVj6ITOsZwAkBR5fEWz9A18MhIC6uk6wWrbKSPMImh+PHkSR4/Tu0Bo90t+jrIf0pRtby/07bDwzv/u3bX/reemd5DzK3/RcPA87Qi8S/DGnVFiPvlij7Rl3ELe39pfWCRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=osRpdWxz; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="osRpdWxz"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-516d78ba1adso2551cf.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 16:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780009764; cv=none;
        d=google.com; s=arc-20240605;
        b=MTrvReJaxQC5MOAwmeAQcix2fVWThZ8OOK8qIWUDK/F257EwFWcNGKZvdyDrRfZfHe
         Ba4m5yFq0Ox0zCjwgBHy5OzEi3PQ6rbhmoGtwzHc/e742lBymyPKx6h48L5ZluPC5Cgx
         FjI1nx2LY34YgT21KYIgFVBrokuupMhl7Y/FFFJ5GCjMf0Su9HjTFsXxFEbEA6V3Cz1e
         gQdcyYoe9wcyMR4F10J2iGF9R0XDveOIURlrOTlFOOpkbhyLwYdm0V05gmXBhujFhKHv
         7r2R+GDBkRmwJ0SgoO97DSMqbx2iEuIvwg1BMfLidv/7rNCahXkZRKzInpPBgPjbc2M2
         m42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        fh=rSAnpra940O92DhgML7iIRaWd8mvL198X2nBSm0P8+k=;
        b=G3XpL/ZM/HAgGaOGNVcNJx6DqUcwkSbbx4zVhk0rNfGLBNSwumf4R67KK/ws+3QKZa
         mc6B1A0YfGm1+cr5dti6Gr5ulE4ApInUeE+WhQ5uO4EUGYUskL8ceYUupMZD5yHvySxW
         M+HjwocoxxdsAqxqcRd6GDrvgEGYdE00vW3TUMCVPLEJEs87+/NPKXAQhKZha3FslHlX
         3kC41zHgOX1VoLUKCtxRLhQl1KgU4w8pKHlZB3wWkPKr8E5TV+7eliW0F6O1qMds0BE9
         8kFvw7BGfy5KkzK9ApusZ+z17qxHsxYKNfaC2J4G+NPKHKGN8CuS+RSyZpMq4xXzbK3G
         Z8Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780009764; x=1780614564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        b=osRpdWxzQBprbhHCnN7pM4i3Lnc7/mD6HOxYztJ4BigH6FgjZV4boGwJginwb/OsQP
         XKYTH6RGWdXo4Dusy2Vqpt8Am6WpznnLGNDtteS+j7O+pKmJCv93ZTlVgBXVfZDC8YDx
         gBz83YHA+08QssVjrVndNxkDcWyhdY/AmXm+bO1fIn2l0jFDvS9WgTrVgfOM8Kk9WM4D
         VQmwilHidg4DzMTRpiixR2tX3pRHsW1QdJFePqaWzjjXNkLUGDG7lM+5k1pLFs3kfMMv
         MKpePzHuH1V9Ek0NOQ64LqTTcM6VN1H81zkTHoYF7p1PMOCKS52hvFyF0PJGhs2lwNId
         1QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009764; x=1780614564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYEkysyj7nIsR4yyCUI7JyubCEenGV97AjOI+tlDrVs=;
        b=eGYHFHGt29poCeef+LwFFf5TK03JgGnU7A0/cqJDnOoeK0IJ9lGGDt1xBKJYc2w2pH
         DAbu9sbYFDKHQHnBUqHmSLWSg8ZGmNUfsDk4W/T4DqOTzzBQV6yMKi4avBIO2W/zvsnl
         Iz032yrC3R2tJZxaLYUNPh+7MCVPpyqLgMkXMw2wEdiArpi9BR8M9bfaTMMXVk6NdujO
         K9kouTNzfJlEIQnRMmZ4JCwj5Sv8G85q3JbRIOYAa04Em0hD19bm+CW4O2qMXAyEWKsx
         7TDl36Dg4my3rSaWb9Av7N2eykZVs2LuZsvzScLmQMAwgksQEBffcBmmPw3tmw/0g7EV
         Obwg==
X-Forwarded-Encrypted: i=1; AFNElJ8/F9yjyVPcTyFW7XmLObbrAqADJ7ro6H3KMxs47F4F4sVGbHORzlcLxm0NdEfz4FC3xNcu@lists.linux.dev
X-Gm-Message-State: AOJu0YzPqy3EBuav7ml9HpNZU8H8ln+Q38Kf3y+dRfyTrjAQRUWJMRt7
	HhvO2VzEiEZGE6QUdkVoI7ZHIg06rQ9NJ+c+fQbraWrAxQ5rBXvCLRmvbRiU3cqMTrtEyBU2oCR
	RYG92G9Hbm6nreQy9ATdu38cSmdSSELTUsNYGm5pB
X-Gm-Gg: Acq92OFywQqqwcv0y7gpH3vYr0Ouig33+Rv4nVRcEB519erH+Jxwyd/uyL4yUne/VNR
	K/0goiVXegwg3G8sTdCn4VdPg0dKYaO2f/pxQL18yCgZBZSO9ePa05s7Ex05G0PjYer9N3u4qZ7
	AZdFWY31WNe85JvtHhEo6rzpJkVkkrfyTw3OUTsrX+OalOSkQ5cNDSMaHzihcTNevfuCnM0vS8u
	QyLJTrLXft3qWOaen3PqY5KzmqT7sI/PN2QZbS/67iBEZzTi78zgCBRSpBFDm/b7znvpaX7IpdD
	Tp5KXl4CZ4gNQV9HUKfsDf2tcz+g1el81ExwhxAcJE8+Qv1I
X-Received: by 2002:a05:622a:6015:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-5172dd8515fmr1560491cf.2.1780009763142; Thu, 28 May 2026
 16:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528203905.687687-1-xur@google.com> <20260528203905.687687-4-xur@google.com>
 <178000602351.678078.3534988919326810792.b4-review@b4>
In-Reply-To: <178000602351.678078.3534988919326810792.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Thu, 28 May 2026 16:09:10 -0700
X-Gm-Features: AVHnY4JIDHpOjLDIlLr5JYWP7b43uKz_Jmz2J99OCwuQqa1ufv57jDGJFyMD0T0
Message-ID: <CAF1bQ=SOG3qr4K3h=SBgM=e42RmV6WjOfyMOmi_qBOpYMoVaEQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 3:07=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, 28 May 2026 13:39:05 -0700, xur@google.com <xur@google.com> wrote=
:
> > diff --git a/scripts/Makefile.thinlto b/scripts/Makefile.thinlto
> > new file mode 100644
> > index 000000000000..408b63786a08
> > --- /dev/null
> > +++ b/scripts/Makefile.thinlto
> > @@ -0,0 +1,41 @@
> > +PHONY :=3D __default
> > +__default:
> > +
> > +include include/config/auto.conf
> > +include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> > +
> > +native-objs :=3D $(patsubst %.o,%.thinlto-native.o,$(call read-file, v=
mlinux.thinlto-index))
> > +
> > +__default: $(native-objs)
> > +
> > +# Generate .thinlto-native.o (obj) from .o (bitcode) and .thinlto.bc (=
summary) files
> > +# --------------------------------------------------------------------=
-------
> > +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag)  $@
> > +      be_flags =3D $(saved_c_flags_$(<))
>
> This change...
>
> > [ ... skip 20 lines ... ]
> > +prereq-ir-objs :=3D $(targets:%.thinlto-native.o=3D%.o)
> > +existing-ir-objs :=3D $(wildcard $(sort $(prereq-ir-objs)))
> > +
> > +-include $(foreach f, $(existing-targets) $(existing-ir-objs), $(dir $=
(f)).$(notdir $(f)).cmd)
> > +
> > +.PHONY: $(PHONY)
>
> ... and this change appear to break the build in certain circumstances.
>
>   | $ printf 'CONFIG_%s\n' LTO_NONE=3Dn LTO_CLANG_THIN_DIST=3Dy >kernel/c=
onfigs/repro.config
>   |
>   | $ make -skj"$(nproc)" ARCH=3Darm64 LLVM=3D1 mrproper defconfig repro.=
config vmlinux
>   | ...
>   | warning: linking module 'virt/kvm/coalesced_mmio.o': Linking two modu=
les of different target triples: 'mm/slab_common.o' is 'aarch64-unknown-lin=
ux-gnu' whereas 'virt/kvm/coalesced_mmio.o' is 'x86_64-unknown-linux-gnu' [=
-Wlinker-warnings]
>   | '+v8a' is not a recognized feature for this target (ignoring feature)
>   | '-fmv' is not a recognized feature for this target (ignoring feature)
>   | '-fp-armv8' is not a recognized feature for this target (ignoring fea=
ture)
>   | '-neon' is not a recognized feature for this target (ignoring feature=
)
>   | '+v8a' is not a recognized feature for this target (ignoring feature)
>   | '-fmv' is not a recognized feature for this target (ignoring feature)
>   | '-fp-armv8' is not a recognized feature for this target (ignoring fea=
ture)
>   | '-neon' is not a recognized feature for this target (ignoring feature=
)
>   | <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
>   |         dmb ishst
>   |         ^~~
>   | 2 warnings and 3 errors generated.
>   | make[5]: *** [scripts/Makefile.thinlto:22: virt/kvm/dirty_ring.thinlt=
o-native.o] Error 1
>   | ...
>
> Looking at V=3D1 output, the backend flags are missing from this object
> and the other ones that errored. If I revert back to how you had it in
> v10, the build is successful and the flags appear to be included
> properly.

I think this error from the relative path issue: I have the _c_flags as:
"saved_c_flags_arch/arm64/kvm/../../../virt/kvm/coalesced_mmio.o"
But in the backend compilation, I tried to load
"saved_c_flags_virt/kvm/coalesced_mmio.o".

I think I will revert to my v10 implementation here.

>
> Sashiko has another comment as well.
>
>   https://sashiko.dev/#/patchset/26003?part=3D3

Are you referring to KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS part?
I'm not sure if that's true: in my build, KBUILD_VMLINUX_OBJS includes
lib/lib.a etc.
In line 1296 of Makefile:
KBUILD_VMLINUX_OBJS :=3D built-in.a $(patsubst %/, %/lib.a, $(filter %/,
$(libs-y)))

We can see native objects in lib/*.
% find lib -name '*.thinlto-native.o' |wc
    204     204    7104

>
> --
> Cheers,
> Nathan
>

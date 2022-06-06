Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CA3D86
	for <llvm@lists.linux.dev>; Mon,  6 Jun 2022 21:57:44 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id s68so14040791pgs.10
        for <llvm@lists.linux.dev>; Mon, 06 Jun 2022 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OVcwc2sHusOOh0nu9Pt06N+s8Xx2ijJaFMUsraj325k=;
        b=Vl6ZhlLa66LkHCjy57MVpd00ciLWPXkcoPC2OwQw++69ENr9/ERRDcHAE8hWh9qyG7
         iCM7q+pu9vVi7jXS0NOEsdjvFV63N8GHH3GYq+8tR3FYS+ft/+ycx0kP0Gvf72Ie6U6s
         fuQ+x76yrZmJZ1ddUzUF8UlSc/SRZ8I7j0LzxyT0eC39+N29h7Zh5QK4rgrUQu2V99F+
         6CgzaUdLDxLA7crr+JPw2g71MdChCAIhFTwC+uyBHUxZt99E6HD7Z/oaadKtpm1/vk+O
         iWVVCYdfRRdX/fcyw4tHIOXoCw6ADMwhd8mh/+f398ZURQS85tv2B1MLyMh30gGDKcQk
         ubmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OVcwc2sHusOOh0nu9Pt06N+s8Xx2ijJaFMUsraj325k=;
        b=v2isFIZEXkUqO9ksIRccUmNwn74lMmyn6CyyZIcS3EVUlPV4VtdlnhZqq7mVmsGMve
         nQARX2CXwoYA5a/VgpGUkGXx6AU1yvsGmuoJwzDQmnoRGGu+4BynThsg7v8Jf0xO4Nu+
         1zmDTucv4FnTcIVnKZMWGZfow+Xryb2xWquluh1D80McervpA53133iBBy0Gd6qRP9wu
         qKCq+cW+VcLcVDYFlgj+RHJbNxRz5n9IuO5JmIQUOnc/C2I2tp8Hc9kL6UJWsaNxAbqb
         1S8zgs4CKYhp8sAXfTWf8WiYkR58sw/2YgwBvCKugF7Wid2Z7MIpCvt12O9Gt40p1qeh
         tX7w==
X-Gm-Message-State: AOAM533XKnNSiUWGBV/7PrjQrAlLTniS/BzUr3pvNNw5ev60KeuH1YlH
	0tQlKnJGtaYBXjifcSwahHdYoEl/GL/BTuBXklc=
X-Google-Smtp-Source: ABdhPJwek3m/elZZR6Oa/JA63J7/4oDhXQSKSBBP+agE9Js+1sMAoDRinRqyN7+mTenzRbtccrWNt1I4Ql/NpgSKNyM=
X-Received: by 2002:a63:24a:0:b0:3fc:52a9:b5d6 with SMTP id
 71-20020a63024a000000b003fc52a9b5d6mr22439371pgc.132.1654552663428; Mon, 06
 Jun 2022 14:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGZ=6K8wudbS--3z+JpKTsL_dfM-8Co7NwViRo0i3t2EZg@mail.gmail.com>
 <Ym2qdHAB6BMMlegB@thelio-3990X> <CAEQFVGZB6eAetmt1kk+TYbGxpfrDut37DEO_-1HECqM6FEERww@mail.gmail.com>
 <CAEQFVGby3Q1mf1GGJwkFyAgaq38NvVAMx6tQM+9LO+HE8Z8Z8A@mail.gmail.com>
 <YnhbOpXHT8k+g9Qu@dev-arch.thelio-3990X> <CAEQFVGYSV=boBYGHfJLis8ayftzNPJy1UYgeEEQLuNb0hSfhjg@mail.gmail.com>
 <CAKwvOd=c=9xbzg0CjGxNnHtu3BOatWpe0gYQU7TWw0rkjwCCxA@mail.gmail.com>
 <CAEQFVGYOkTi4oNSnfyN48Re_4uhQqPF81+M7Xd5VJ0+tETwSbA@mail.gmail.com> <CAKwvOdmrwfm3HsyvGg2_HwYw1tdcj67DLj22oeGGf8MUO4x=mQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmrwfm3HsyvGg2_HwYw1tdcj67DLj22oeGGf8MUO4x=mQ@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Mon, 6 Jun 2022 23:57:31 +0200
Message-ID: <CAEQFVGZTX9RdFvqOvZ-Lxsf4Jq--jNXKrrwKipZ6ZkYx_G2haA@mail.gmail.com>
Subject: Re: arch/x86/entry/entry: RFC on recent kernels building error with
 llvm 11.0.2 internal assembler
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, luto@kernel.org, 
	Chih-Wei Huang <cwhuang@android-x86.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 4, 2022 at 12:13 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jun 1, 2022 at 5:57 AM Mauro Rossi <issor.oruam@gmail.com> wrote:
> >
> > On Wed, Jun 1, 2022 at 12:09 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > As Nathan noted, I messed up the commit "ANDROID: x86: entry: work
> > > around LLVM_IAS=1 bug in LSL". Please see:
> > > https://android-review.googlesource.com/c/kernel/common/+/1521061
> > > https://android-review.googlesource.com/c/kernel/common/+/1560152/
> > >
> > > If you're using an older toolchain, you'll need just the first. If
> > > you're using a newer toolchain, you'll need BOTH (or none, including
> > > dropping "ANDROID: x86: entry: work around LLVM_IAS=1 bug in LSL").
> >
> > Thanks Nick,
> >
> > I had already applied the squashed commit composed of  "ANDROID: x86:
> > entry: work around LLVM_IAS=1 bug in LSL" (the one using .quad) and
> > "ANDROID: x86: entry: fix LSL open coding", so I have already:
> >
> > .macro LOAD_CPU_AND_NODE_SEG_LIMIT reg:req
> > movq $__CPUNODE_SEG, \reg
> > +#ifdef __clang__
> > +.long 0xc0030f48
>
> LGTM
>
> > +#else
> > lsl \reg, \reg
> > +#endif
> > .endm
> >
> >
> > So in principle my kernel image should boot when built with LLVM_IAS=1
> > but to my surprise all my systems (Sony VAIO i7, Intel NUC DN2820FYKH
> > with Celeron D2830, Athlon 200GE) are affected by hard reboot when
> > executing the kernel image
>
> Might need more info.  Do they boot when LLVM_IAS=0 is explicitly set
> with your command line invocation of make? i.e. `make LLVM=1
> LLVM_IAS=0 ...`?  Can you launch these kernels in qemu?

Yes, kernel 5.17 and 5.18 built with LLVM=1 LLVM_IAS=0 do not cause
instantaneus hard reboot and proceed in the boot stages

The complete list of make variables Ihave used is as follows:

LLVM=1 LLVM_IAS=0 \
        CC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
        LD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
        AR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar) \
        NM=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-nm) \
        OBJCOPY=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objcopy) \
        OBJDUMP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objdump) \
        READELF=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-readelf) \
        OBJSIZE=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-size) \
        STRIP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-strip) \
        HOSTCC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
        HOSTCXX=$(abspath $(LLVM_PREBUILTS_PATH)/clang++) \
        HOSTLD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
        HOSTLDFLAGS=-fuse-ld=lld \
        HOSTAR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar)

>
> >
> > I'm trying to understand how to build (and boot) with LLVM_IAS=1 and
> > using clang 11.0.2 shipped with AOSP Android 11
>
> I think this combo should work; we are testing x86_64 with mainline
> https://github.com/ClangBuiltLinux/continuous-integration2/blob/95b9a12cad31675118d61c26d0b541fa4e3c8f09/generator.yml#L1694
>
> Could be something in your .config files though.
> --
> Thanks,
> ~Nick Desaulniers

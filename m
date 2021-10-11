Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445302C81
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 17:38:30 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z11so67907665lfj.4
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ENok56v226Br1Hnj7M8CGRxg2E5be1NU0/kgeLaps8=;
        b=VhuaN6EpoBNobIJbsMZrPkq+ifL7+6neTjUMW3JNMor+qHfF61YYphub1DqtFp5p73
         slSkycDgt6B2tfrVbeQ+k+hSf089ymkkGrrOMWKKVe5B2vQKpLZA0PaQpzltI+Y65T7R
         TN7ACfgVTCBpOQ5X0w6nvp8GtrVJ/pDODpnKODdB9rqwr0I3BloEYXj3FNVcJ9C4eCqI
         EJab75cqSZdUrgk6DZhRBzBJpIpVToq4Bt1uehFQ8SREEykcrshwWbutagddX5eLfOXc
         hxuFD9DzbGOcPzYOHq8XUKET5aIImtBsaWThPT+sdtlveDIHLXTH+OngqEwe5LClQTLi
         vm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ENok56v226Br1Hnj7M8CGRxg2E5be1NU0/kgeLaps8=;
        b=7QXdzH5B2lOQQn/tnlC0BEkFeqE2Faieg/AAaH/ZbFu2pC2jXHSnIzfvOQpgpa0w1r
         RMZBAGK3XOn+NWFcTqxn56ftdzsJuIC2vPx7J45aBv0IooflmazYyzO4/1HjGPJ7Ym1W
         Gumy6d88i7kUk/A2jryZbPRxANasm480Fe9+af6+WIKcZajuRVM2xy1WJNEC+LuXwFri
         PparuacHue19dE33ET+8TErVQNYu/N0sAA5GgHd9sA4eLxE1QKAP2QdtdSuocijaDhIJ
         kv4BAi5nBw3PEgbQmd1wSQ6mqtrQcpqevy+VLtSK3W9Hl/PqhJULS8hz/Rb4RaL8j+0h
         wsvA==
X-Gm-Message-State: AOAM532Sd9iwoeMbNjTfoqDulQufo453EoI94M/nyaOrwlq6bnpb0YcM
	mb0utO1f6WAjeOK2Rmo+h//OhmhAfwgDSoaJz8HyNvqL7t8=
X-Google-Smtp-Source: ABdhPJy5R2jYq0VsNYYLWk2aM0qn9aDFkStjjdWbyMzFom7c0iNkrrSi4FnE9u2Rz43Ueg348C4tc+16WLlVZ98aBlw=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr24962745ljc.338.1633973907228;
 Mon, 11 Oct 2021 10:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmRZg-8Gkn814NPNPmPg3G7v51AcwcKsLfCPZiqsmm01g@mail.gmail.com>
 <BYAPR12MB28729F401F6CB172E08C8167BDB29@BYAPR12MB2872.namprd12.prod.outlook.com>
 <MW2PR12MB2346B63C9C46F1C49BDDFA7ACAB39@MW2PR12MB2346.namprd12.prod.outlook.com>
In-Reply-To: <MW2PR12MB2346B63C9C46F1C49BDDFA7ACAB39@MW2PR12MB2346.namprd12.prod.outlook.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Oct 2021 10:38:15 -0700
Message-ID: <CAKwvOdk=unV-k5p14C=nSWpACdwdeQo0zSqFpjthKqeMy3BVBw@mail.gmail.com>
Subject: Re: Building ARCH=arc linux kernel with Clang
To: Claudiu Zissulescu <claudiu.zissulescu@synopsys.com>, 
	Mark Schimmel <mark.schimmel@synopsys.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 9, 2021 at 12:17 AM Claudiu Zissulescu
<Claudiu.Zissulescu@synopsys.com> wrote:
>
> Hi,
>
> Our QEMU port can boot a Linux image compiled with gcc for ARCv2 and ARCv=
3 cpu families. It doesn't support the floating point and vector instructio=
ns for neither ARCv2 nor ARCv3.
> At this moment, we try to upstream it but it goes in a slow mode. You can=
 download our latest development here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/qemu/
> GitHub - foss-for-synopsys-dwc-arc-processors/qemu: QEMU port for ARCv2 P=
rocessors
> QEMU README. QEMU is a generic and open source machine & userspace emulat=
or and virtualizer. QEMU is capable of emulating a complete machine in soft=
ware without any need for hardware virtualization support.
> github.com

Thanks for the link.  We have in the past used a docker image to use
our own version of QEMU in CI when we had issues with certain versions
of QEMU.  We could use that again.  It's useful to know that the port
is not yet upstream, since that means we can't simply `apt install`
it.

But building will come before booting, so we can cross that bridge
another day.  I'm more curious about the work on upstream LLVM and how
dedicated Synopsys is towards pushing those patches upstream?

Should I start trying to build an ARC linux kernel and start reporting bugs=
?

>
> Cheers,
> Claudiu
>
>
> ________________________________
> From: Mark Schimmel <marksl@synopsys.com>
> Sent: Friday, October 8, 2021 9:33 PM
> To: Nick Desaulniers <ndesaulniers@google.com>; Claudiu Zissulescu <clazi=
ss@synopsys.com>
> Subject: RE: Building ARCH=3Darc linux kernel with Clang
>
>
> +@Claudiu Zissulescu who works on the GCC port for ARC and has some kind =
of support for QEMU. He should know the state of it.
>
>
>
> I'm working on upstreaming our out-of-tree ARC code generator in a very p=
art time capacity. There is currently a bug in ARCOptAddrMode.cpp. I sugges=
t you disable that pass using -mllvm -arc-kill-addr-mode=3D0x10 Until I ups=
tream a fix for it. Hopefully I'll have a fix for it pretty soon. My plan i=
s to really replace the pass with our out-of-tree version.
>
>
>
> -----Original Message-----
> From: Nick Desaulniers <ndesaulniers@google.com>
> Sent: Friday, October 8, 2021 11:25 AM
> To: Mark Schimmel <marksl@synopsys.com>; thomasj@synopsys.com; Jeroen Dob=
belaere <dobbel@synopsys.com>; Graham Yiu <grahamy@synopsys.com>; Bruno De =
Fraine <brunodf@synopsys.com>; Tatyana Kolesnichenko <tatyana@synopsys.com>
> Cc: llvm@lists.linux.dev; Arnd Bergmann <arnd@kernel.org>
> Subject: Building ARCH=3Darc linux kernel with Clang
>
>
>
> Hello @synopsys.com 2021 LLVM contributors, I'm Nick, I work on compiling=
 the Linux kernel with clang (and linking with LLD, and associated llvm-bin=
utils, etc). Jeroen and I know each other from FOSDEM (https://urldefense.c=
om/v3/__https://archive.fosdem.org/2020/schedule/event/llvm_alda_panel/__;!=
!A4F2R9G_pg!O-DNwmYXC8glu0cIBleVFPi_SalrcT57XBR2QwQ06Gvn32L5TfXrNyVDAMB_HG0=
$ ).
>
>
>
> ARC is an ISA that both the Linux kernel has a port for, and LLVM has a b=
ackend for.  Any interest in pursuing being able to build that (IMO, high v=
alue) target?
>
>
>
> We have a fair amount of CI in place; once we get a port up and running w=
e can help report back regressions on the kernel and llvm sides, but there =
will probably be a few bug reports before we get anything building, let alo=
ne booting.  Though, does a QEMU port exist for ARC? Our CI relies on QEMU =
for boot tests.
>
> --
>
> Thanks,
>
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers

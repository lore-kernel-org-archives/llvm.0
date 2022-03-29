Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4C29A1
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 23:04:11 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id r22so25427349ljd.4
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aV7bYKXOhFJMu6k5FXuul13yfeXxFkntHqAD2t+w5yg=;
        b=CJkmnCsJ9AGD+pl0V8nBCojZTCyw8e9iJy5XKL0P7rh1ZSykGTZYpsvzXHC7zh7r/u
         Uc8hRbh/caTjJFQTqQVPyqgIFac92sdgNo8WOuuWEXeM/IwzJEHcDUCwD2Mg2RpReV2P
         1NkFp4Bx5kED5TzzJMSZH+87hi+IO62KNp1jpbDREafeHczHaEEwX91NA/UprW6BvTK1
         BYl3u3DiTOa637U6v63WdLf+IwHuL+qS3NV4p+PLaAZRsdl+KHTrLl542O6H/+4hlT6g
         bCHBMDYZ0gkt9adaAlMED1RZBuFiXVexSR3RXeTfHxCFAA7f24V94lclMDMHiXtcNlBT
         9QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aV7bYKXOhFJMu6k5FXuul13yfeXxFkntHqAD2t+w5yg=;
        b=t/vVW2KU+oBx/E5uahNzhzHaRT2/oTdrrv0IET15hdXw2YhNy+ljqUsuaDdFIKEfPF
         sVRHzwSQTtwT75kWrwFpXVuqbOopOEzgddRzb/bssjlCJIOwN/sgXWQu7LqOCk0WNdL+
         bqZnkJurSdAtLHhkdCxylaMVWVrxPFKFf/eRHuJwrQLVUaxMWjnnQjRReFiSTkMFJkXU
         u+ff3D2DJRu1QyCqwUBDGtUGZLcaLootKI9UUVx9MzD2eF1Iys9NSAkdNNoQUnaYG+gH
         rPb4lzCXwG8tSLgamuJjYHGjMEAXI3NJAvT5+5ogeCUWEMClpV7SfowLmXLggXHUHu7N
         eRQA==
X-Gm-Message-State: AOAM533qWObqJakw4dYUtsAQwagWWlIykhMYw3zH6D50Z+YqPwaK2d48
	3k+pGS/lxFiqd7oRZI+ONBXvRupzq6z1RGNnGJOzYg==
X-Google-Smtp-Source: ABdhPJx0I1Ld/2LwgEGvX7iZJMPdwA0nv3oOokgiFpErvc7ckacA6/4louyesMOYZwvDcBgiBEqgp/0KN+xEidKoAsI=
X-Received: by 2002:a2e:8692:0:b0:249:a0b1:3c77 with SMTP id
 l18-20020a2e8692000000b00249a0b13c77mr4524471lji.235.1648595048944; Tue, 29
 Mar 2022 16:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220329212946.2861648-1-ndesaulniers@google.com>
 <CAKwvOdmsnVsW46pTZYCNu-bx5c-aJ8ARMCOsYeMmQHpAw3PtPg@mail.gmail.com> <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Mar 2022 16:03:57 -0700
Message-ID: <CAKwvOdn-riuzXJWTL08J+qbQkYVzCgBG=XGM9G2TSmA_Kg=hWQ@mail.gmail.com>
Subject: Re: [PATCH] net, uapi: remove inclusion of arpa/inet.h
To: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, 
	Ying Xue <ying.xue@windriver.com>, Jon Maloy <jmaloy@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 29, 2022 at 3:09 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 29, 2022 at 2:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Mar 29, 2022 at 2:29 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Testing out CONFIG_UAPI_HEADER_TEST=y with a prebuilt Bionic sysroot
> > > from Android's SDK, I encountered an error:
> > >
> > >   HDRTEST usr/include/linux/fsi.h
> > > In file included from <built-in>:1:
> > > In file included from ./usr/include/linux/tipc_config.h:46:
> > > prebuilts/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/arpa/inet.h:39:1:
> > > error: unknown type name 'in_addr_t'
> > > in_addr_t inet_addr(const char* __s);
> > > ^
> >
> > Oh, this might not quite be the correct fix for this particular issue.
> >
> > Cherry picking this diff back into my Android kernel tree, I now observe:
> >   HDRTEST usr/include/linux/tipc_config.h
> > In file included from <built-in>:1:
> > ./usr/include/linux/tipc_config.h:268:4: error: implicit declaration
> > of function 'ntohs' [-Werror,-Wimplicit-function-declaration]
> >                 (ntohs(((struct tlv_desc *)tlv)->tlv_len) <= space);
> >                  ^
> >
> > Is there more than one byteorder.h? Oh, I see what I did; ntohs is defined in
> > linux/byteorder/generic.h
> > not
> > usr/include/asm/byteorder.h
> > Sorry, I saw `byteorder` and mixed up the path with the filename.
> >
> > So rather than just remove the latter, I should additionally be adding
> > the former. Though that then produces
> >
> > common/include/linux/byteorder/generic.h:146:9: error: implicit
> > declaration of function '__cpu_to_le16'
> > [-Werror,-Wimplicit-function-declaration]
> >         *var = cpu_to_le16(le16_to_cpu(*var) + val);
> >                ^
> >
> > Oh?
>
> Should there be a definition of ntohs (and friends) under
> include/uapi/linux/ somewhere, rather than have the kernel header
> include/uapi/linux/tipc_config.h depend on the libc header
> arpa/inet.h?
>
> It looks like we already have
> include/uapi/linux/byteorder/{big|little}_endian.h to define
> __be16_to_cpu and friends, just no definition of ntohs under
> include/uapi/linux/.
>
> Also, it looks like include/uapi/linux/ has definitions for
> __constant_ntohs in
> include/uapi/linux/byteorder/{big|little}_endian.h.  Should those 2
> headers also define ntohs (and friends) unprefixed, i.e. the versions
> that don't depend on constant expressions?
>
> (I wish there was an entry in MAINTAINERS for UAPI questions like this...)

I also think that Documentation/kbuild/headers_install.rst should
probably include text from
https://lore.kernel.org/all/Pine.LNX.4.58.0411281710490.22796@ppc970.osdl.org/
or something along the lines of "kernel headers MUST NOT depend on
userspace headers; any instance of that in tree is a bug that should
be fixed."

For people I just cc'ed, here's the lore link to this thread:
https://lore.kernel.org/lkml/20220329212946.2861648-1-ndesaulniers@google.com/

>
> >
> > >
> > > This is because Bionic has a bug in its inclusion chain. I sent a patch
> > > to fix that, but looking closer at include/uapi/linux/tipc_config.h,
> > > there's a comment that it includes arpa/inet.h for ntohs; but ntohs is
> > > already defined in include/linux/byteorder/generic.h which is already
> > > included in include/uapi/linux/tipc_config.h. There are no __KERNEL__
> > > guards on include/linux/byteorder/generic.h's definition of ntohs. So
> > > besides fixing Bionic, it looks like we can additionally remove this
> > > unnecessary header inclusion.
> > >
> > > Link: https://android-review.googlesource.com/c/platform/bionic/+/2048127
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  include/uapi/linux/tipc_config.h | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/tipc_config.h b/include/uapi/linux/tipc_config.h
> > > index 4dfc05651c98..b38374d5f192 100644
> > > --- a/include/uapi/linux/tipc_config.h
> > > +++ b/include/uapi/linux/tipc_config.h
> > > @@ -43,10 +43,6 @@
> > >  #include <linux/tipc.h>
> > >  #include <asm/byteorder.h>
> > >
> > > -#ifndef __KERNEL__
> > > -#include <arpa/inet.h> /* for ntohs etc. */
> > > -#endif
> > > -
> > >  /*
> > >   * Configuration
> > >   *
> > >
> > > base-commit: 5efabdadcf4a5b9a37847ecc85ba71cf2eff0fcf
> > > prerequisite-patch-id: 0c2abf2af8051f4b37a70ef11b7d2fc2a3ec7181
> > > --
> > > 2.35.1.1021.g381101b075-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers

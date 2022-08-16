Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF353BE
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 17:58:05 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id a89so14479774edf.5
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VC/Trrv6J3X4sE7aLeQxuC2Jf1TU8h3dAVmLNNAb/Js=;
        b=baokk5qq0rlLRQ0xpdsWAYJYwpImRq1O33VCZKgpyUfde7GmI0lSm3zXzVCV3lyMAD
         4P11NRhDl0HTGv5KvbaqHyJVgYFEv7fzxNzP5DiTj8OajrzVTmGfJX4zttB+r6IjL4l1
         BdgfkFgN4/Jrel046lgdpxCSDjFqu9TcUfZEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VC/Trrv6J3X4sE7aLeQxuC2Jf1TU8h3dAVmLNNAb/Js=;
        b=2XM3KYGKBFuwZAHL4xcGsV0yAKRkSu7jr0Fs/KcA6USUppHGyk9TRZFLZ+yl/rlYjh
         5uvPJFbAN0uS55A08PwFpWBP/bvDwArMZ2JqXj4lD2MHHuAX7hhGeXzNvN9cc3jSOTm2
         tngz09Phxv4V5yEKUi04ryECvRQBbTCBW1eKrCgWYF2NHmLZ107zKArzUX6I2OE3TYQX
         yP+JLqv8He+u/7JspzRpNjV1TLtItpLzeCmLeJYzsdaN2KeF65k2kt+XJLTdDSFIF8Ss
         Hs0N+HP7DUt8NM8FKTF9jmoNdlQyy/eHUTorevuHSVKpAZDTdO+vFJ6z0HppXqn+iiTL
         dKYw==
X-Gm-Message-State: ACgBeo1ujo5EQqNrkRc7vJTbKp7QZVY1j4zCiX6o118TmEC/eeCGy2FO
	AScru86oihkUnNnDBFHQsyhYekmQyY780Se5CvY=
X-Google-Smtp-Source: AA6agR56RR03GD80eNlL0Cr5LC4hzGodOkgSaP0sg5uqWxmvnPquMuNTu192KCWJJVPQ17G7EA38Vg==
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id f13-20020a0564021e8d00b0044158dbb6a2mr19272000edf.277.1660672683695;
        Tue, 16 Aug 2022 10:58:03 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id jx16-20020a170906ca5000b007305d408b3dsm5574702ejb.78.2022.08.16.10.58.02
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 10:58:02 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id n7so2324150wrv.4
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 10:58:02 -0700 (PDT)
X-Received: by 2002:adf:e843:0:b0:225:221f:262 with SMTP id
 d3-20020adfe843000000b00225221f0262mr272373wrn.193.1660672681718; Tue, 16 Aug
 2022 10:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <Yvny9L3tw1EolqQ4@worktop.programming.kicks-ass.net> <CAHk-=whnEN3Apb5gRXSZK7BM+MOby9VCZe3sDcW34Zme_wk3uA@mail.gmail.com>
 <Yvqn8BqE7FdB6Ccd@worktop.programming.kicks-ass.net> <CAHk-=wj6QaNkoNPA0jrW8F_=RNNb1jCsFF2QngNEQb_C=wMDPQ@mail.gmail.com>
 <YvtPEA/9GV7GthZJ@worktop.programming.kicks-ass.net>
In-Reply-To: <YvtPEA/9GV7GthZJ@worktop.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 10:57:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ0oC0__-kLX51jRwo4XgAQ9xJ=OeT5_=fiLxmDexFZw@mail.gmail.com>
Message-ID: <CAHk-=wjZ0oC0__-kLX51jRwo4XgAQ9xJ=OeT5_=fiLxmDexFZw@mail.gmail.com>
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jeff Layton <jlayton@kernel.org>, 
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 1:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> > +#define EX_TYPE_ZEROPAD                      20 /* load ax from dx zero-padded */
>
> This comment is now woefully incorrect.

Yes it is. Will fix.

> > +     if (insn_decode(&insn, (void *) regs->ip, len, INSN_MODE_KERN))
> > +             return false;
>
> We have insn_decode_kernel() for exactly this (very) common case.

I did that originally, and then I undid it in disgust, because that
interface is too simple.

In particular, it just uses MAX_INSN_SIZE blindly. Which I didn't want
to do when I actually had the instruction size.

Yes, yes, I also check the decode size after-the-fact, but I didn't
want the decoder to even look at the invalid bytes.

This exception case is about the data being at the end of the page, I
wanted the fixup to be aware of code being at the end of a page too.

(And yeah, I'm not convinced that the decoder is that careful, but at
that point I feel it's a decoder issue, and not an issue with the code
I write).

> > +     if (insn.length != len)
> > +             return false;
> > +
> > +     if (insn.opcode.bytes[0] != 0x8b)
> > +             return false;
>
> I was wondering if we want something like MOV_INSN_OPCODE for 0x8b to
> enhance readability, otoh it's currently 0x8b all over the place, so
> whatever. At some point you gotta have the insn tables with you anyway.

Oh, I didn't even notice that we had another case of 0x8b checking.
But yeah, the MMIO decoding wants to see what kind of access it is.

But it wouldn't be MOV_INSN_OPCODE, it would have to be something like
MOV_WORD_INSN_MODRM_REG_OPCODE, because that's what people are
checking for - not just that it's a 'mov', but direction and size too.

And then you'd have to also decide whether you describe those
#define's using the Intel ordering or the one we actually use in our
asm. So now the symbolic names are ambiguous anyway, in ways that the
actual byte value isn't.

So yeah, I suspect it ends up just being an issue of "you have to have
the opcode tables in front of you anyway".

Because you also need to check that that's the only encoding for "mov"
(I checked, and yes, it is - there are other 'mov' encodings that move
directly from memory into %rax, but those are using absolute addresses
that don't make sense for a "this is an unaligned that might be a page
crosser")

Side note: now that I look at it, I note that the MMIO decoding
doesn't handle the absolute address case. It's not really relevant for
the kernel, but I could *imagine* that it is relevant in user mode,
and the SEV case actually does have a "decode and emulate user mode
instruction case".

Not a big issue. If some crazy user even maps IO at a fixed address,
and then uses a "mov %eax <-> moffset" instruction, the kernel
emulation will print out an error and refuse to emulate it.

                  Linus

Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216344ABB
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 23:15:05 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id h11so9259372ljb.2
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 16:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCz5dsdb439gQ6NFh6L/ZZspwpi2O9i4cDJAAPMlk6E=;
        b=LFhk0Dn2ewD1I/HLuCI4l4PHmBU4Mm2MQc/C6mwY6H/MHG3f3zwB1gwA+hhJ/cZFSe
         YMeDugKytCZGRcGrkfQnojwqQvKymdHqaAgwc/+APTFIBY2HRL3JTsGFAloYDEkRbZW5
         EHCvt4Cvw4Zz2QX8DPojHA55443DrYT09Z5hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCz5dsdb439gQ6NFh6L/ZZspwpi2O9i4cDJAAPMlk6E=;
        b=fWKhxPFUXxTT6Mhv4Br9swEDqXwZLBBhX+/+MUjVZCoVERx806LHk+j/Hads4PhWYj
         Cg5loI9o/Nh0rmL8RrrKd73gRue0OGMj32g9rfZsboVYH7PFDKghoXmpPmQSww2ysfmQ
         EnBe9VRzpDgH8ZFVbMKVZh1C3btVFr5uyqB855i1fhcHSQnH1ur3T/NjKxQw5WNmwQ0p
         +zQaqYjaEmCq5EXqv+TAovy5UdxmBB3Q5E52sYoWo29QvFMdEB4FVCK8eVOuZKnfOcoX
         ejbYtH+I1LwWL/xeUSMhG/HXHfp8i2YREJvYtP40GlPDi/+tlmnuQoRkw8Cigcoi1X22
         NTNQ==
X-Gm-Message-State: AOAM531PKOXafX/7hBawC2ZukmgXrhEfwOY+lxPE6YliCK5sA7rRN8bj
	WzO+Mx3n60Y307KP9Z19gz80r5CAR/DbX1oEzvU=
X-Google-Smtp-Source: ABdhPJw8EThEpTKx5vkfNRaqUVe9gXkpTKwOrRaji+3uV4ULCuABV3dkg4bLi5XFuG/LCa7l+cjgqg==
X-Received: by 2002:a2e:7d18:0:b0:247:f205:96fa with SMTP id y24-20020a2e7d18000000b00247f20596famr4397827ljc.269.1647558903942;
        Thu, 17 Mar 2022 16:15:03 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id a10-20020a19e30a000000b00448ed99d745sm451562lfh.90.2022.03.17.16.14.58
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 16:14:59 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id w12so11483390lfr.9
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 16:14:58 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr4214994lfs.27.1647558898113; Thu, 17
 Mar 2022 16:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210223134.233757-1-morbo@google.com> <20220301201903.4113977-1-morbo@google.com>
 <CAGG=3QWh90r5C3gmTj9zxiJb-mwD=PGqGwZZTjAfyi1NCb1_9w@mail.gmail.com>
 <AC3D873E-A28B-41F1-8BF4-2F6F37BCEEB4@zytor.com> <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <CAGG=3QW2ey2w91TxqJ6tzfJOswhTce2e0QTW7kAWyvxeiO+VNg@mail.gmail.com>
 <CAHk-=whn3iYE7gZM4vHx1kFhWBD2P9Wvmcyj8OOqv=y_7nemGQ@mail.gmail.com>
 <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com>
 <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
 <CAGG=3QWcKof_NXrC0kznM2ikwTA00AgUJrcWhKBTitmjCuOxqw@mail.gmail.com> <CAHk-=wj=aK2T+h=rRJL4jDDTgV2U533E_duroCoVSUfkvYd0OQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj=aK2T+h=rRJL4jDDTgV2U533E_duroCoVSUfkvYd0OQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 16:14:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgsYO2BAv+WaeHzP5GkeiWfdUW7tVQ5CG-aVRwANWMBsg@mail.gmail.com>
Message-ID: <CAHk-=wgsYO2BAv+WaeHzP5GkeiWfdUW7tVQ5CG-aVRwANWMBsg@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Bill Wendling <morbo@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 3:51 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I still think that from a sanity standpoint, it would be good to
> actually strengthen the semantics of "asm volatile" to literally act
> as - and be ordered with - volatile memory accesses.

Side note: the reason I personally would prefer these semantics is
that if we had a stronger definition of what "asm volatile" actually
means, we could get rid of some - but certainly not all - "memory"
clobbers.

And while I've been very positive about memory clobbers in this thread
- because they give us that serialization we so often need - they can
often be bad for code generation.

Quite often it's not actually a huge deal. Even with a memory clobber,
it's not like the compiler needs to flush any spills or local
variables that haven't had their address taken to memory.

So quite often a memory clobber is only going to affect instruction
ordering a bit, and that's usually exactly what you want.

But it certainly _can_ be quite noticeable, and while things like
"cli" really wants a memory clobber anyway because it really does want
to order with respect to memory accesses that the compiler does, other
operations wouldn't necessarily need it.

That "native_save_fl()" that does that "pushf ; pop %0" instruction,
for example, would be perfectly happy only being ordered wrt other asm
instructions (notably ordered wrt cli/sti).

So we could easily remove the "memory" clobber there, but only if we
had that other ordering constraint of "asm volatile" being ordered wrt
each other.

Right now we have memory clobbers just about everywhere. It's almost
the default, unless it's purely about some purely arithmetic
operation. I'm not sure how many of them we could remove, but I do
think that pushf/popf is _one_ such case.

So stronger semantics for "asm volatile" could potentially help
generate better code.

Of course, then the "I just don't want you to optimize this away"
crowd might be unhappy and find cases where it really hurts.

               Linus

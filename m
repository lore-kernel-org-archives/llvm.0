Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7424A9F
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 21:21:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id w7so11133335lfd.6
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qRvk/VVnw4/zCdH06gyReu2Cz7SwRimW7RvRCfYZG4A=;
        b=dCDHswjwXChioTR3TMtLF47+FPdp3xR2CaEXTo6XGOtouRJ2I30xou2UBTwg5UYt5h
         niC3YiH/fcpCugWi3ZcOsMK6xoTFUjOHwqBU9sBz7hGe2ACJVpQu065giZSEtMNG0lbA
         Gb7Bvip8XiGbNvYEe5dxzeYkcjGEseJM1fPnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qRvk/VVnw4/zCdH06gyReu2Cz7SwRimW7RvRCfYZG4A=;
        b=fC+u8lGHErayfT2WdQcXlmxBDNSo8ie1ZarO3PXZIVQnwHuzDD6pgp+Yux1+kUvx1G
         VyGvJ0rIfMICXe/1ZNqJpeQdMwQGEjCr2K6aESfliWxrOcIiWXOoSX8sbFflLBilcJ/C
         VJNFZ/cxjUFEVdBL9yLpaTCOnjoMAzcD6w4jL78hwUl01JU+ohywIChyGGnhTcIJW7eW
         w9c/AWU/y2i9qSEQK0tl1Dwadnu2iRNQFpUqbH5enKdxx95d0Xo2JeQPNLvX1BNe8l6j
         kuoLMhdOnnbLLnQGOt01fnRwauQoBFsRDSSNaCTOCDoKlk0JDI+taCSX1asL0YID9cr7
         nHmQ==
X-Gm-Message-State: AOAM5338Nz7Di/Ol+pAUTRd8OBTfwoCgqfB7stWqDg8M9K+kashhrMbc
	QN7/C5U30UGYAYhN7U7jlt8mj1MKtBVlaQgTucs=
X-Google-Smtp-Source: ABdhPJw0L5xJcx3QE6qnXL5HFdcHH5sliccJn6rIExS0I0USxcXXwQqJOEDPKi5lUuDDVl8BpLdg8w==
X-Received: by 2002:a05:6512:3f96:b0:445:a191:5d43 with SMTP id x22-20020a0565123f9600b00445a1915d43mr4037291lfa.603.1647552114087;
        Thu, 17 Mar 2022 14:21:54 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id b23-20020a196717000000b004476449aaf9sm540917lfc.297.2022.03.17.14.21.52
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 14:21:53 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id g17so11164128lfh.2
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:21:52 -0700 (PDT)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr4276267lfu.542.1647552112472; Thu, 17
 Mar 2022 14:21:52 -0700 (PDT)
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
 <CAHk-=whn3iYE7gZM4vHx1kFhWBD2P9Wvmcyj8OOqv=y_7nemGQ@mail.gmail.com> <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com>
In-Reply-To: <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 14:21:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
Message-ID: <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
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

On Thu, Mar 17, 2022 at 2:10 PM Bill Wendling <morbo@google.com> wrote:
> >
> > As a result, we mark pretty much all system instructions as being
> > memory clobbers, because that actually works.
>
> For now.

No. Forever.

If you change the compiler to ignore memory clobbers in inline asms,
we'll stop using clang again.

This is not some kind of "threat". This is literally just a plain fact.

If you turn your compiler into garbage, we can't use it.

End of discussion.

> > Whether they actually clobber memory or not is immaterial, and is not
> > why we do it.
>
> I understand that. My point is that it's not a guarantee that the
> compiler won't change in the future.

YES IT DAMN WELL IS.

If I have an inline asm thing, and I tell the compiler "this inline
asm reads or writes memory in ways you don't understand", and you then
move externally visible memory operations around it - or move other
inline asms that do the same thing around it - then your compiler is
simply not a compiler any more.

IT IS BROKEN  SHIT.

See?

That memory clobber is not a "please mister compiler, can you pretty
please take this into account".

That memory clobber is a "if you don't take this into account, you are
now no longer a working compiler, and thank Gods we have
alternatives".

This is not a "in ten years things can change" kind of issue. This is
a very fundamental and simple thing.

I don't understand why you can't just admit that.

This is as simple as 2+2 being 4. That's black and white.

There is no "the compiler might optimize it to be 3 at some future date".

               Linus

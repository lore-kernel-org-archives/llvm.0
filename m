Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B54ABB
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 23:31:40 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 17so9307633lji.1
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 16:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIik/7JhUqMYYHvz4PGBxZz1oteF8rRLVp9nxcgFqks=;
        b=DpOVy4EhBN9HRx+Owjx5178I49nqrRP/5Ghlg2kAeN2Nl1/gidgOPQ+PfyLo68cYOI
         v+92J+gf3eOFukalAdgvfsWyXUd5I+ofPmDLRlc6sgGLysLHI0E4Go3BsZjoVkO0RYWd
         bvEFttF33LX3h7fgWTXTuWJLu1V7dNVhisyoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIik/7JhUqMYYHvz4PGBxZz1oteF8rRLVp9nxcgFqks=;
        b=ZjcQ1kIOxzu9GvqM4xkw9QGepQj4mulTb+KwNf6gqzGdoQ+7BR3nkM7EsANk+IskXg
         Q/zJnBkWnMEb8X3vQIfrF+O+nRS8aj8XcPB+56ABavSaMQY4CvVEuOgs3hf82bx7e8Vf
         wpKmcZ/zvBvtWbqgU6elYKNPk80DGxZJa3lsit7WBOXsXFMeJOSK1x1gOuN2sS8hA/1y
         TSsp2yrQHh9ZjBIIq61BMhATwAb7SxCfxt27/sVmKNcKeNv0E15veZ6Q12aWM63/J5DD
         +YPsg5n2I1c77CDUz5UkxLU6eKwcQpLAUT93xeV+Fa7bNoM53a/QqFw3I380MeOjp8ik
         D83w==
X-Gm-Message-State: AOAM533SO9UNwlVV7LtsgyCehHwdV8fD4TpEe6kqcPyL83rxCixm1nLf
	9uN5F8xEkVtOJuT6EuW9QAQU1jc0h1HmK4tZuS0=
X-Google-Smtp-Source: ABdhPJwhYeGZLUF7cadZZX8SyUXIFpi0dpJ3MNx48VHKpGJCKSyoSvHcWOo2uet0NSpRN6Jy5ZmM0Q==
X-Received: by 2002:a2e:8909:0:b0:247:fc9c:283f with SMTP id d9-20020a2e8909000000b00247fc9c283fmr4485280lji.21.1647559898156;
        Thu, 17 Mar 2022 16:31:38 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id z11-20020a05651c11cb00b00247dee7faeasm609281ljo.12.2022.03.17.16.31.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 16:31:36 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id o6so9293155ljp.3
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 16:31:36 -0700 (PDT)
X-Received: by 2002:a2e:a78f:0:b0:249:21ce:6d53 with SMTP id
 c15-20020a2ea78f000000b0024921ce6d53mr4379261ljf.164.1647559895803; Thu, 17
 Mar 2022 16:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <CAGG=3QW2ey2w91TxqJ6tzfJOswhTce2e0QTW7kAWyvxeiO+VNg@mail.gmail.com>
 <CAHk-=whn3iYE7gZM4vHx1kFhWBD2P9Wvmcyj8OOqv=y_7nemGQ@mail.gmail.com>
 <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com>
 <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com>
 <CAGG=3QWcKof_NXrC0kznM2ikwTA00AgUJrcWhKBTitmjCuOxqw@mail.gmail.com>
 <CAHk-=wj=aK2T+h=rRJL4jDDTgV2U533E_duroCoVSUfkvYd0OQ@mail.gmail.com> <20220317231959.GN614@gate.crashing.org>
In-Reply-To: <20220317231959.GN614@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 16:31:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHgSJ-suTT6V6_2USPDrdmQweLR_M_YHjb8OsQvYWn-w@mail.gmail.com>
Message-ID: <CAHk-=wgHgSJ-suTT6V6_2USPDrdmQweLR_M_YHjb8OsQvYWn-w@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Bill Wendling <morbo@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 4:25 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> > I still think that from a sanity standpoint, it would be good to
> > actually strengthen the semantics of "asm volatile" to literally act
> > as - and be ordered with - volatile memory accesses.
> >
> > But I guess that's water under the bridge.
>
> That is what it has actually done since forever.  See C 5.1.2.3.  For
> GCC, "asm volatile" has a side effect like in /2 there as well, as does
> unspec_volatile (an internal GCC thing used to implement certain
> builtins, among other things).

Oh, so two "asm volatile" statements _are_ in fact defined to be
ordered wrt each other?

Because the gcc docs certainly don't say that ;(

Yeah, yeah, dead code can be removed, whether volatile or not. That's
true of "*(volatile int *)x" too. It's not the dead code that is the
interesting case, though..

Is this also well-defined ordering-wise:

    asm volatile("do_something");
    WRITE_ONCE(x, 1);

(where "WRITE_ONCE()" is that kernel macro that just uses a volatile
pointer assignment to force the access)?

And could we get that documented?

            Linus

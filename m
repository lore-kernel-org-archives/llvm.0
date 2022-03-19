Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033B18D
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 01:13:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r22so13311484ljd.4
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KewD06Vu0nsX23vq307ezHIhVg7q/YW1qUsCXfY0+3M=;
        b=O31GPd4+a0dW/sfSFVN0SwhJZgZt45sr6T7Z4Ng79tgRtYB8w8KRyTai2p60eBV9gT
         tcbw6Ny+Q/TkhccY9Fv3508KsvjxQWdbRgWksssxaccMi0rt7/bhQcRLGGgqLJRupW4n
         VTasQHX/wzxA2xr2mC7BP2QpKgTAK1TvGaN4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KewD06Vu0nsX23vq307ezHIhVg7q/YW1qUsCXfY0+3M=;
        b=7Q9xGKuDNjG+h8QNKSj56TZqDq9cbYycD+7i4INevu3TyrLtY9VjsccEHbVe6hZkbk
         y5bbcA88fjVvFaU90eUkWLV+rwdxfaKFrunJuAGomyaXYNUwOY3saz4czWuN56XR79gW
         e3NXaBlHBW+cUbTTUR3O5G0NkXn26DYRY6CC4OsKBG6NIL2jC90N3glFG4ICYAu+sMY+
         qPE44MsjX0T+oJ1h/KCBQmeFTyB6vqeDRrnmJXh3zw8Tvt53bP3D10sfHOQ5U+MaHlJd
         Kpyb/6IIYlHNcvUQ/ZmGhTL3UCpqlMHZrppvnHKfRvvJfd+BLDXyGKpD/AmZg1g+zrr7
         z8Zw==
X-Gm-Message-State: AOAM533ogVAX9EjuXf5BcjWh/qRgeZnCZ+sRD0cnsto0X6prA/URhU0r
	osYWC529QHa4jOdVyLOLzNR9Xde2lGGH/1LlPDA=
X-Google-Smtp-Source: ABdhPJwToG70garV9RPrvf/agVq9qUF3dyMilV+f/XFs3kZEAY9YN5E9FfDYYTDWlv8Kg2CH+wi1LA==
X-Received: by 2002:a2e:bd09:0:b0:247:e127:5e05 with SMTP id n9-20020a2ebd09000000b00247e1275e05mr513878ljq.212.1647652425523;
        Fri, 18 Mar 2022 18:13:45 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id p21-20020a056512139500b00447c9b87945sm1078460lfa.172.2022.03.18.18.13.42
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 18:13:42 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id bt26so16572535lfb.3
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:13:42 -0700 (PDT)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr7786949lfu.542.1647652421984; Fri, 18
 Mar 2022 18:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <fd89333f-e470-a295-baf6-a736c55caeb5@citrix.com> <CAHk-=wj47CG0Y9GOFmGg4AYFvXhRFDX9x7E2Uxo9k-UX2wgR4g@mail.gmail.com>
 <83b33afc-8502-0065-60bc-3a91528632d8@kernel.org> <CAHk-=wj1Z_zzY7ADxaarorK5sh2xkwbcHxJTzW=bsYChWJGBGg@mail.gmail.com>
 <9a97330b-e5ee-7b7e-4c7a-cfdf15032094@citrix.com> <CAHk-=wgKBme-SdbkSxbQ4+c6tZdvY2fe1wP1TgJeuDAf+AgwMg@mail.gmail.com>
 <20220318234212.GU614@gate.crashing.org>
In-Reply-To: <20220318234212.GU614@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Mar 2022 18:13:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZhTJJY3WV8=3vjZR6gONReXorRdNtM+T5syFSZqimEA@mail.gmail.com>
Message-ID: <CAHk-=wjZhTJJY3WV8=3vjZR6gONReXorRdNtM+T5syFSZqimEA@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Segher Boessenkool <segher@kernel.crashing.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Andy Lutomirski <luto@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 4:47 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>>
> > Marking '%rsp
> > used makes the compiler understand it's not a leaf function.
>
> As I said before, this is explicitly incorrect code.  Always was, but
> it is documented since a while (since GCC 9).  Clobbering the stack
> pointer can never be correct, the stack pointer after an asm has to be
> identical to the one before that asm!

We've never clobbered the stack register.

We've _marked_ it as an in-out register, but we obviously never
actually change it (as far as the compiler can tell). That would very
obviously never work.

And even that marking must have been some gcc person telling us to do
that, because I don't think we would have come up with it otherwise. I
would guess it's what gcc uses internally to decide "I need this
function to have a stack frame". And once you have a stack frame, the
inline asm will automatically be put inside of it.

I spent a lot of time trying to find the origin of it.  Finding the
commit in the kernel where it was first introduced is easy: looks like
commit 0e8e2238b52e ("x86/xen: Add stack frame dependency to hypercall
inline asm calls") was the first to use that trick, although it was a
series of patches from Josh that did that to make objdump happy.

And I found the culprit. It's you, on the gcc lists:

    https://gcc.gnu.org/legacy-ml/gcc/2015-07/msg00080.html

Heh.

              Linus

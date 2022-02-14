Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB15C8A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 21:38:30 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 124so22092733ybn.11
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 13:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wCcd9F5bCRcs8XshngMDCvznDi+A9xGFahm7PcKzRHw=;
        b=Q8tk/zjg2kqOdwrohQtL5HnJVRSrKfAgLL+jy3x6otXuFdoXukLtAuXrpILOoBc/pH
         eYn8Y1slIrYHk8wE4T1MEJjUOXSbjtx1fiH5k9PGvLBVYZrenDTMFXKDV4T2hyL3atnb
         lQnz/hhArXzUa2X8h/4u7szdBHYE0NUsiQn0JP/UqkahNcDaMHGNTjWfhRxwp54gzvaH
         Xungy/wXWnrOlyjg4FCqYvSLJXeyyzMdomozlNAOTcbHujYtGNXsOWMQWyXAj3DwHWou
         tJpdcDD4VDSx3eL+v2YFjObVBTco6OCIMrZO81yJFQvkgQ7T2LFueWoHnaNBa+emJFAe
         1FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCcd9F5bCRcs8XshngMDCvznDi+A9xGFahm7PcKzRHw=;
        b=uVDfzXL4qaGIMdl693Y6U14NKxYUK+DUUWdOYmPNCrzUPuy+mrL/ijp1uuJMAWIdDD
         dD7Jl4ylQGcTksZ4knuFdxHYzU4LRP8YPKStQfh5DnAhxVUwYZ7vJ5pLVQYmNwfvmKTW
         zuG32ivMUdVGWLwKYen3I20JgnYhCxF4paDzCYo2NXhr+efzAkcolSRMwH7Mx9+q7zoN
         hCD5+PKFuxrm77TneQRvtGDyIKh9kppwhYTxyw0Ywmt84BpCV8CaC7xGGc/wKRlT5ovg
         CVQ0zy21eZkfIGpnF+bVl0/VXrB+oCA0tn46RzsjgRBBC6MJDcTlW3dNMldaE0E9CG9A
         GVwQ==
X-Gm-Message-State: AOAM533PAdgDcjiX7ALw77piIzDDiu2GGF+GQRoTbINCXUWGoPV1elM2
	CKQnlfm0gXod+pTNc5A37xqGegPqrvZ+R+3LdB3Kgg==
X-Google-Smtp-Source: ABdhPJxUccxxoP4bZt6GjNhxpXP1XmlvCj2MmIFZET4f3oQ6jVVeZCKHTeW2u+S3hajLTFMEx9E97COi27QNEfTmUws=
X-Received: by 2002:a0d:ec48:: with SMTP id r8mr816930ywn.298.1644874709055;
 Mon, 14 Feb 2022 13:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122170301.764232470@infradead.org> <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com> <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com> <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com> <20220211133803.GV23216@worktop.programming.kicks-ass.net>
In-Reply-To: <20220211133803.GV23216@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Feb 2022 13:38:18 -0800
Message-ID: <CABCJKuciRBnz4JxBDJC=+kuJn4pU2uBkWPBov7-VL2o2j0F4SA@mail.gmail.com>
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
To: Peter Zijlstra <peterz@infradead.org>
Cc: Joao Moreira <joao@overdrivepizza.com>, Kees Cook <keescook@chromium.org>, 
	X86 ML <x86@kernel.org>, hjl.tools@gmail.com, Josh Poimboeuf <jpoimboe@redhat.com>, 
	andrew.cooper3@citrix.com, LKML <linux-kernel@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 5:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> I think we'll end up with something related to KCFI, but with distinct
> differences:
>
>  - 32bit immediates for smaller code

Sure, I don't see issues with that. Based on a quick test with
defconfig, this reduces vmlinux size by 0.30%.

>  - __kcfi_check_fail() is out for smaller code

I'm fine with adding a trap mode that's used by default, but having
more helpful diagnostics when something fails is useful even in
production systems in my experience. This change results in a vmlinux
that's another 0.92% smaller.

> Which then yields:
>
> caller:
>         cmpl    $0xdeadbeef, -0x4(%rax)         # 7 bytes
>         je      1f                              # 2 bytes
>         ud2                                     # 2 bytes
> 1:      call    __x86_indirect_thunk_rax        # 5 bytes

Note that the compiler might not emit this *exact* sequence of
instructions. For example, Clang generates this for events_sysfs_show
with the modified KCFI patch:

2274:       cmpl   $0x4d7bed9e,-0x4(%r11)
227c:       jne    22c0 <events_sysfs_show+0x6c>
227e:       call   2283 <events_sysfs_show+0x2f>
                    227f: R_X86_64_PLT32    __x86_indirect_thunk_r11-0x4
...
22c0:       ud2

In this case the function has two indirect calls and Clang seems to
prefer to emit just one ud2.

>         .align 16
>         .byte 0xef, 0xbe, 0xad, 0xde            # 4 bytes
> func:
>         endbr                                   # 4 bytes

Here func is no longer aligned to 16 bytes, in case that's important.

> Further, Andrew put in the request for __attribute__((cfi_seed(blah)))
> to allow distinguishing indirect functions with otherwise identical
> signature; eg. cookie = hash32(blah##signature).

Sounds reasonable.

> Did I miss anything? Got anything wrong?

How would you like to deal with the 4-byte hashes in objtool? We
either need to annotate all function symbols in the kernel, or we need
a way to distinguish the hashes from random instructions, so we can
also have functions that don't have a type hash.

Sami

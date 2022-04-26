Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A57B
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 12:21:36 +0000 (UTC)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MpUMc-1oF53S1Xoa-00ptel for <llvm@lists.linux.dev>; Tue, 26 Apr 2022
 14:21:34 +0200
Received: by mail-yb1-f172.google.com with SMTP id s30so4632213ybi.8
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 05:21:34 -0700 (PDT)
X-Gm-Message-State: AOAM530sKoYpxB9Kh4F60i/tkk590VcB/aRJuOHDIqpDcqFcFlTaNo2h
	0QnGXsMlbo3Ssphq4wjFuUve2tUbZ3E1iPf+q8M=
X-Google-Smtp-Source: ABdhPJzjs7JW6GF56sq10ZlQTzqisqPIQczw22cICj7x+y726qsY9a27Hnd215DiwGOjMT2hPt1HhHgeNBWZtT8Dldw=
X-Received: by 2002:a25:9b83:0:b0:63d:88ee:10b4 with SMTP id
 v3-20020a259b83000000b0063d88ee10b4mr20660056ybo.480.1650975693127; Tue, 26
 Apr 2022 05:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com> <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
In-Reply-To: <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 14:21:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>
Message-ID: <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Mauro Rossi <issor.oruam@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Chih-Wei Huang <cwhuang@android-x86.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7W7zqR4fn9bloZFp7hQ2HLap/UbgUbrs5C5Nii/eF4sFH2z4sdY
 ni32PRqsIlabaxqePvqW7jKGTBvHv8rYvl7izsXhd8AJg+0olljAJEKAlNdMvKllw26ycD7
 hQOyXdaNCNRY9F5jdMw3Jjhk4t1eby7TA/VAi0ox1Z2KweCGvd+c5AFhfCePoGgdllk4+hZ
 dYnuBFJPZA5oxnYsRan6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ndY0AFuTpTs=:epO+nbuFxbJrBc0WlApvWy
 YgUJXWc+iDtlBMiOZ2l8tk0mXTJw1g/sTJI5V7XPvf51N6pmb4+HoH1SFW2+Z3ctF4lq1T84Z
 pEQAwhVC8kChKP+ie92+xvl55B/LanRz0B5codPomZ2fxQVUXMy0VrlSUGu1Fgj1e5QHDJ9PT
 nhH3OX7qcAr0YltgZpMrV7Tc54qQsYh7SSEx+b7+6goMk+ye2Oppv0Dqqa0wqlizBve1n0Y5F
 X/+Rvi6TPi24DTMQAV2qkBgU3PHFc8xcmiFd407cSkApfC7UnYbHddu6Yq/hfmpsAisKpP4jn
 zAISNrTHPIrBrF0YV94kwaeJGjk8xrMetETpdx/yXorjg6ziCl2wy8Wc6vob9QDiHN/eLpdT4
 BggfxAq9shs/FnIWvMfPROQ3vHL6sGRahiiCd/jlAxrh5str9zxMdMeNwew2IqZ1i0Fi6DgkF
 yToTblUzHdctLkdTmY9uG/rRkz8RgBOVaqqFKCOn0HO48Rnmse6YN8TWikexOYOqGB3LAIsLr
 3eI6QXqTvczDdMIVLeoJaQq8WKGI9wIJ7XvkZGjZttaHPvkvLgsuWqB/0ojj/GvxvvI5OL3ZQ
 Pqww6X/C6bOjK3wgWTWmnTOvDLDX2FK9qm1jdIOkMZg0tXcGBZga5xhHHJhPnJ8LzlLrebFLA
 fPp48oYdGvKnyCpQrLd3TMzk/Pljln7YxXrg3RVhB7N+MLbCrxRT8NJVTlxGwHVBk7II=

On Mon, Apr 25, 2022 at 9:13 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> I have checked also with kernel-5.17 and the same build error is
> happening also there, so it is not due to commit 34737e2698 ("uaccess: add generic
> __{get,put}_kernel_nofault")

Ok, that's good to know, thanks for checking! I suspect the problem is
using a slightly too-old prerelease build of clang, where the released
clang-11 build had the asm-goto-with-output feature enabled. Maybe
we should just increase the minimum version to clang-11.1 for the
kernel to keep others from running into this issue.

> In the attachments the defconfig files I am using to build ARCH=x86
> kernel target

I see that the 5.17 kernel is configured using gcc-4.9.0, which is another
known broken prerelease compiler that used to ship with Android.
If you want to use gcc, I would recommend at least gcc-9 these days,
though 4.9.4 was supposed to work until recently.

> As far as I remember x86 32bit target has always been tricky, maybe I
> am doing some gross mistake, if this is the case I apologize in advance

I think generally speaking x86-32 support in the kernel is declining,
and anyone who has a 64-bit capable CPU should migrate to a 64-bit
kernel with CONFIG_COMPAT=y to run the 32-bit user space.

If you have users on early Atom or Pentium 4 processors, or something
even older, that of course won't help you, but I suspect that eventually
those will get too hard to support anyway.

We have similar problems on ARM, where running 32-bit kernels on
64-bit hardware comes with even more problems. In both cases though,
the kernels likely miss features and errata fixes for modern CPUs,
and as soon as you want to use a substantial amount of memory.
either physical RAM (more than 768MB gets you into highmem
with its own problems) or virtual address space (32-bit tasks on
a 32-bit kernel can use between 1GB and 3GB depending on
configuration, compared to 4GB on 64-bit kernels).

The cost of running a 64-bit kernel in comparison is losing around
20 to 30MB of RAM for kernel-internal data structures, which is a bit
annoying but much less than the cost of running a 64-bit Android.

       Arnd

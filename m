Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988333ED
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 16:45:15 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id f73so9309214yba.10
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6xB7M6A4P1AMfjXfWJda8QvVyDqS4kOzrpqMR+pNpWI=;
        b=FCh/HbjSDHY7j9j0rQNQ+FpagZCUWdYJsukcgjtVhBTTJ1d/KLvurNpZO+TxZDjf0m
         QxPoIyNTLLpOhsMxD5anYs5fOQvq2f26vbkwwRjOO7nGQt+4qFtkuFHNJLeq/DaUd1iB
         TbH0K6Enl69FKr+xBR0wecz7616/3U9GCo9P985aL/rfbVM5V3+logFH+0iLmUE9izo/
         WPMqjya4WZbZNLeV9QX4NH2BRdNCxZEsJifWO7DM6+EI3MNFVpbIDZHAKRa6LVtZosAF
         hKxghUVNg+GsgnvE7BApRnIOxVQU40DNdE5GO32lJ068YJtdhWoXuPdyNuPTMo3AmXmx
         yBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6xB7M6A4P1AMfjXfWJda8QvVyDqS4kOzrpqMR+pNpWI=;
        b=RO9vSD++w7j5KffE1p4wW8BhELyagCXUXhrCivaqfqdVC0l4gsgLePfbzbixagJFpE
         4UHG/+anbItJDcNf60Y/h4AABB1aC3gtTULKeWqbGIerNbZlFPDMYgj/V23Re73Rp4ps
         DK1euMSEL266HhYzlrXyAauE/j0t7KWQXcNih6G9kwjy3cQ+JrG3rqNSm34fix7gd7O4
         y7PxoWmSeWhMpQSBRmqKpmMcKQmbILHSDUmLaQ2hMKC4rw7fNKAmEZH5RzLGMu3Pg2ie
         lnJuC5VqeWqqFIlDYGvZeV6l37RLFlmCl0JKDzPma1dku74TH7IZ9krnt7nTGxfuzYnz
         kpDQ==
X-Gm-Message-State: AJIora8nFb/gN/C8hG8KEKIOEqtgIJrlsTnTz5vhdaSJb7oFoEJRozf3
	aYD6u4ATwaY6lcbB1xadnjv9eOlMtoiOX4cKApm15A==
X-Google-Smtp-Source: AGRyM1tp5s/zvoPeD8IbswBVsd9vBaOGVB/5P5zNq9I2jBOcq4cDkMY6ybUaDS5jfDXdAlxsRzbpdmFAF+cCNl4NZuM=
X-Received: by 2002:a25:6b0b:0:b0:66e:445a:17bb with SMTP id
 g11-20020a256b0b000000b0066e445a17bbmr14392652ybc.147.1657903514733; Fri, 15
 Jul 2022 09:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220701142310.2188015-5-glider@google.com> <202207021844.0J4s1Gjz-lkp@intel.com>
In-Reply-To: <202207021844.0J4s1Gjz-lkp@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 15 Jul 2022 18:44:38 +0200
Message-ID: <CAG_fn=UOWkegr1oeD8h1OKXBCv-ZM0uePGcGtCrdVv+CRGkWGw@mail.gmail.com>
Subject: Re: [PATCH v4 04/45] x86: asm: instrument usercopy in get_user() and __put_user_size()
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrey Konovalov <andreyknvl@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux-foundation.org>, 
	David Rientjes <rientjes@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Pekka Enberg <penberg@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 2, 2022 at 12:46 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Alexander,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on linus/master v5.19-rc4 next-20220701]
> [cannot apply to tip/x86/core tip/x86/mm]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenk=
o/Add-KernelMemorySanitizer-infrastructure/20220701-222712
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git for-next
> config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/202=
20702/202207021844.0J4s1Gjz-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a911=
9143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/0ca0e4029535365a6=
5588446ba55a952ca186079
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMe=
morySanitizer-infrastructure/20220701-222712
>         git checkout 0ca0e4029535365a65588446ba55a952ca186079
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

Uh oh, this is a very good catch.

> All errors (new ones prefixed by >>):
>
> >> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field req=
uested
>                    FPU_get_user(instruction_address.selector,
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_=
get_user'
>    #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } whi=
le (0)
>                                   ~~~~^~~~~~~~~~~~~~~~~~
>    arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_=
user'
>    #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,=
ptr); })
>                                              ^
>    arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_g=
et_user_call'
>            instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(p=
tr))); \
>                                                     ^
>    include/linux/compiler.h:56:47: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                               ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_=
var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
>                                                       ^~~~
> >> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field req=
uested
>                    FPU_get_user(instruction_address.selector,
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Actually `x` in get_user(x, ptr) and put_user(x, ptr) is not
guaranteed to be addressable (e.g. in this case it is a bitfield).
We can copy the values to a local var, like it's done in __put_user_size:

254         __typeof__(*(ptr)) __pus_val =3D x;                            =
   \
255         __chk_user_ptr(ptr);                                           =
 \
256         instrument_copy_to_user(ptr, &(__pus_val), size);              =
 \

, but this won't help KASAN or KCSAN detect the bugs accessing x.
Perhaps a better solution would be to declare instrument_get_user()
and instrument_put_user(), which will unpoison/check the values for
KMSAN and do nothing for other tools.


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

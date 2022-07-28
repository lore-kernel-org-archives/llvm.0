Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9F7A
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 08:14:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com ([209.85.218.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBjA4-1oBW4f0Jn2-00C7gJ for <llvm@lists.linux.dev>; Thu, 28 Jul 2022
 10:14:29 +0200
Received: by mail-ej1-f47.google.com with SMTP id fy29so1803010ejc.12
        for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 01:14:28 -0700 (PDT)
X-Gm-Message-State: AJIora+gKeT/lLCBu7wL5f68MK7mvY2B2owkqfRJOaR+W+VqbYTQbPIb
	H1cshNW6AdptwuAWMyNnrgE1NH9smZNug5a+p3g=
X-Google-Smtp-Source: AGRyM1uZnW6rr1bCPNxIQUdrp0kM6xPGCPcbhZeXfyDuLh9ISG16R0mxcxin51/wlw+v1h4OcmNKLuYUaimGsuAUJj0=
X-Received: by 2002:a17:907:75d3:b0:72b:48de:e540 with SMTP id
 jl19-20020a17090775d300b0072b48dee540mr21044634ejc.547.1658996068658; Thu, 28
 Jul 2022 01:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220724122517.1019187-8-guoren@kernel.org> <202207280822.VHS6qieH-lkp@intel.com>
 <CAJF2gTQRV+6CZVkvhtsY19zv6XVbyDeRY-SdLPhkF0akHqvBWA@mail.gmail.com>
In-Reply-To: <CAJF2gTQRV+6CZVkvhtsY19zv6XVbyDeRY-SdLPhkF0akHqvBWA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 10:14:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
Message-ID: <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
Subject: Re: [PATCH V8 07/10] riscv: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Muellner <cmuellner@linux.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/O5IS52bxe4K2TXaN2cKvLf1WhEqPrOfUqtU4LGV0YpKQ/XZcoR
 9iYlaFV40bLFGpTnv5XM8etIn0pS84g1OP/CChUGChj0q8PiSnCTi2mmb27sChJHPVMDd4L
 of1YWf7+J0ZPE1HUKrVH2WbHKEPjBcX0YvGsSI4FTK9vd3hHNSQkF6NpFmDeEIk+H00cKq3
 xXz+GpIJQ95B+kn6ZedOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3aMwZpRzxJM=:UVlVZIA4CShO8BG+KFAshT
 Fvte5Df/VmAZOQ6ijnf/7qEyKJHG/+hZ9YONfMMyLQ/yLVHDh9U/f84QmI7ceregopRubrHuY
 62DAIfy/0MLbj+4L9klaFYw6bH63CjQ38UKr5ivimdwxG8BJ3Rf1ZibygDy37FhvMsX8BThR7
 /Je69yKOkSoDH7WI4MoBhPcWVkpWfeHRT2lJvw9UU08WeBI2sWC1W4mHXJQv9NozFmwL7cSGc
 pxZyTTR7DsQ0MneaoLthhRi/05XZTBoB4NJIo1OcdjC5lf8BeyHXPI3wXYWhtlpCgBYsOWWNZ
 hKe5P6XmtEDmNH99ymgvUIUm4/dbD3JmvDfLvlBi0z4I4HWA08bv954iFlQlapZT7T2iz79dr
 uclvidnTDAigxOWjHa1VlpoJRHYA8WBtGW3rb4zFHQagLHQHyCipIW7ZwpXv5tUhrP/CUUdhA
 1QfFmMv/SVgTAqJKn7DCa9kc0i7XvzKhyGnVIvWx4fAKQANva29isgs/yCi5g15eOxYzff1/Y
 xnD6Wetz278hwAIbwfa7Tbh4/BT22qUwfhzq6x227z8bnhN/gBMSMAf11qZ0bJbrPqpRnluDS
 fv1/vceVFO4FL1g1lz1aX8RBwzDzNqVj5bmbG6sgiCb5XgEPkiS/g8pDjQbrtsE8CW8yj3R5Q
 e8DrAfAxvnBkFW9Z1k/Xkp2kjxMe5/i+KXEqDwlasguDHF8IKJqSmZJY8YnWDr8y73wxkck8J
 faul/RrGqqgS88R92KuDT2vfaB/wgCqroRapP3hrvTa6A8tfk9XcUui5UwSK4g99v3BWPtClD
 FlUFeHARu1eImgS/JBdMYePjhBRZaZsryIzQXlukUByMrilkbBmS8ALc5zOygdWZMjJxBQlk1
 /afgMZh6baZKDCKUzXYQ==

On Thu, Jul 28, 2022 at 5:35 AM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Palmer,
>
> The warning is from a clang problem.
>
> drivers/net/wireguard/queueing.c:
> static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
> sk_buff *skb)
> {
>         WRITE_ONCE(NEXT(skb), NULL);
>         WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
> }
>
> The queue->head is 64bit pointer size.
>
> #define __xchg_relaxed(ptr, new, size)                                  \
> ({                                                                      \
>         __typeof__(ptr) __ptr = (ptr);                                  \
>         __typeof__(new) __new = (new);                                  \
>         __typeof__(*(ptr)) __ret;                                       \
>         switch (size) {                                                 \
>         case 2: {                                                       \
> ... Clang shouldn't give warning from here, because code won't enter the path.
>                 break;                                                  \
>         }                                                               \
>         case 4:                                                         \
> ...
>                 break;                                                  \
>         case 8:                                                         \
> ... The case would enter this path.
>                 break;                                                  \
>         default:                                                        \
>                 BUILD_BUG();                                            \
>         }                                                               \
>         __ret;                                                          \
> })

I assume it's this warning you are referring to?

>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);

I don't consider this a bug in clang, it just performs the normal type checking
before dead code elimination and complains about code that clearly violates
the type rules.

I would suggest you split out the 16-bit xchg() into a properly typed inline
function and add type casts when calling it. In fact, I would love to
completely eliminate the 8-bit and 16-bit cases from the regular xchg()
and cmpxchg() interface and require all callers to explicitly call the
xchg16()/cmpxchg16() instead, as we require for cmpxchg64() on 32-bit
architectures already. This is something to do for another time though.

> >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >            val = __raw_readb(PCI_IOBASE + addr);
> >                              ~~~~~~~~~~ ^
> >    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >            val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));

Not your bug, but I see that CONFIG_MMU=n risc-v has the same bug that s390 has
with missing I/O space support.  The correct workaround for this is to mark all
drivers using PCI I/O space as 'depends on HAS_IO_PORT' or similar and then
leaving out the definitions from the asm-generic header. Niklas Schnelle has
spent a lot of time working on patches for this, but they are somewhat stuck
in review. If RISC-V has the same problem, I hope we can get more people
interested in it. I think OpenRISC and C-Sky have this as well, but I'm not
sure if there is any plan to upstream clang support for those.

        Arnd

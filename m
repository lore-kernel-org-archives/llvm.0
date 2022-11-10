Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05337138C
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 10:15:20 +0000 (UTC)
HMM_SOURCE_IP:172.18.0.188:58510.456354312
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-10.133.8.199 (unknown [172.18.0.188])
	by chinatelecom.cn (HERMES) with SMTP id F38C12800D9;
	Thu, 10 Nov 2022 18:05:13 +0800 (CST)
X-189-SAVE-TO-SEND: huyd12@chinatelecom.cn
Received: from  ([10.133.8.199])
	by app0023 with ESMTP id faa22b8ad1a34afc97177a92b20272eb for boqun.feng@gmail.com;
	Thu, 10 Nov 2022 18:05:33 CST
X-Transaction-ID: faa22b8ad1a34afc97177a92b20272eb
X-Real-From: huyd12@chinatelecom.cn
X-Receive-IP: 10.133.8.199
X-MEDUSA-Status: 0
Sender: huyd12@chinatelecom.cn
From: <huyd12@chinatelecom.cn>
To: <nathan@kernel.org>,
	<guoj17@chinatelecom.cn>
Cc: <peterz@infradead.org>,
	<mingo@redhat.com>,
	<will@kernel.org>,
	<tglx@linutronix.de>,
	<bp@alien8.de>,
	<dave.hansen@linux.intel.com>,
	<x86@kernel.org>,
	<longman@redhat.com>,
	<boqun.feng@gmail.com>,
	<linux-kernel@vger.kernel.org>,
	<hpa@zytor.com>,
	<ndesaulniers@google.com>,
	<trix@redhat.com>,
	<llvm@lists.linux.dev>
References: <20221108060126.2505-1-guoj17@chinatelecom.cn> <Y2rayPgDfL2NYcjQ@dev-arch.thelio-3990X>
In-Reply-To: <Y2rayPgDfL2NYcjQ@dev-arch.thelio-3990X>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBsb2NraW5nOiBmaXgga2VybmVsL2xvY2tpbg==?=
	=?gb2312?B?Zy8gaW5saW5lIGFzbSBlcnJvcg==?=
Date: Thu, 10 Nov 2022 18:05:13 +0800
Message-ID: <001d01d8f4eb$f0f37a90$d2da6fb0$@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKFEmH8zKzDbyVrnMB6jnsnqOop9AI9ItAUrM3JQRA=
Content-Language: zh-cn


Thanks your comments,=20
And if any concern to apply it on upstream?

Yadi

-----=D3=CA=BC=FE=D4=AD=BC=FE-----
=B7=A2=BC=FE=C8=CB: nathan@kernel.org <nathan@kernel.org>=20
=B7=A2=CB=CD=CA=B1=BC=E4: 2022=C4=EA11=D4=C29=C8=D5 6:40
=CA=D5=BC=FE=C8=CB: guoj17@chinatelecom.cn
=B3=AD=CB=CD: peterz@infradead.org; mingo@redhat.com; will@kernel.org;
tglx@linutronix.de; bp@alien8.de; dave.hansen@linux.intel.com;
x86@kernel.org; longman@redhat.com; boqun.feng@gmail.com; =
linux-kernel@vger.
kernel.org; hpa@zytor.com; ndesaulniers@google.com; trix@redhat.com;
llvm@lists.linux.dev; huyd12@chinatelecom.cn
=D6=F7=CC=E2: Re: [PATCH] locking: fix kernel/locking/ inline asm error

On Tue, Nov 08, 2022 at 02:01:26PM +0800, guoj17@chinatelecom.cn wrote:
> From: Guo Jin <guoj17@chinatelecom.cn>
>=20
> When compiling linux 6.1.0-rc3 configured with CONFIG_64BIT=3Dy and=20
> CONFIG_PARAVIRT_SPINLOCKS=3Dy on x86_64 using LLVM 11.0, an error:=20
> "<inline asm> error: changed section flags for .spinlock.text,=20
> expected:: 0x6" occurred.
>=20
> The reason is the .spinlock.text in kernel/locking/qspinlock.o is used =

> many times, but its flags are omitted in subsequent use.
>=20
> LLVM 11.0 assembler didn't permit to
> leave out flags in subsequent uses of the same sections.
>=20
> So this patch adds the corresponding flags to avoid above error.
>=20
> Signed-off-by: Guo Jin <guoj17@chinatelecom.cn>

Right, my reverse bisect tells me that this error was fixed by [1] in =
LLVM,
which landed in 12.0.0 and was backported to LLVM 11.0.1 [2].

We could bump the minimum supported version of LLVM for building the =
kernel
to 11.0.1 over this, just to avoid further issues like this down the =
road,
as the kernel will always be adding new sections for various things. =
That
change would not appear to be disruptive, as all the major distros =
either
have 11.0.1 or newer or older than the current minimum of 11.0.0, so =
they
need to get clang from elsewhere already.

archlinux:latest: clang version 14.0.6

debian:oldoldstable-slim: clang version 3.8.1-24 =
(tags/RELEASE_381/final)
debian:oldstable-slim: clang version 7.0.1-8+deb10u2
(tags/RELEASE_701/final)
debian:stable-slim: Debian clang version 11.0.1-2
debian:testing-slim: Debian clang version 14.0.6-2
debian:unstable-slim: Debian clang version 14.0.6-7

fedora:35: clang version 13.0.1 (Fedora 13.0.1-1.fc35)
fedora:latest: clang version 14.0.5 (Fedora 14.0.5-1.fc36)
fedora:rawhide: clang version 15.0.4 (Fedora 15.0.4-1.fc38)

opensuse/leap:15: clang version 13.0.1
opensuse/leap:latest: clang version 13.0.1
opensuse/tumbleweed:latest: clang version 15.0.3

ubuntu:bionic: clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
ubuntu:focal: clang version 10.0.0-4ubuntu1
ubuntu:latest: Ubuntu clang version 14.0.0-1ubuntu1
ubuntu:kinetic: Ubuntu clang version 15.0.2-1
ubuntu:rolling: Ubuntu clang version 15.0.2-1
ubuntu:devel: Ubuntu clang version 15.0.2-1

At the same time, you are clearly using LLVM 11.0.0, so I think this is =
a
reasonable fix in the immediate term.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

[1]:
https://github.com/llvm/llvm-project/commit/1deff4009e0ae661b03682901bf69=
322
97ce7ea1
[2]:
https://github.com/llvm/llvm-project/commit/700baa009dc685a0adc5f94d258be=
4ae
24742471

> ---
>  arch/x86/include/asm/qspinlock_paravirt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/include/asm/qspinlock_paravirt.h=20
> b/arch/x86/include/asm/qspinlock_paravirt.h
> index 60ece592b220..dbb38a6b4dfb 100644
> --- a/arch/x86/include/asm/qspinlock_paravirt.h
> +++ b/arch/x86/include/asm/qspinlock_paravirt.h
> @@ -37,7 +37,7 @@
__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath,
".spinlock.text");
>   *   rsi =3D lockval           (second argument)
>   *   rdx =3D internal variable (set to 0)
>   */
> -asm    (".pushsection .spinlock.text;"
> +asm    (".pushsection .spinlock.text, \"ax\";"
>  	".globl " PV_UNLOCK ";"
>  	".type " PV_UNLOCK ", @function;"
>  	".align 4,0x90;"
> --
> 2.25.1
>=20


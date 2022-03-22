Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB1A54
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 10:57:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-9-Lon-t17yP1qoUoOghi9yew-1; Tue, 22 Mar 2022 10:57:01 +0000
X-MC-Unique: Lon-t17yP1qoUoOghi9yew-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:57:02 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Tue, 22 Mar 2022 10:57:01 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ammar Faizi' <ammarfaizi2@gnuweeb.org>, Willy Tarreau <w@1wt.eu>
CC: "Paul E. McKenney" <paulmck@kernel.org>, Alviro Iskandar Setiawan
	<alviro.iskandar@gnuweeb.org>, Nugraha <richiisei@gmail.com>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, GNU/Weeb Mailing List
	<gwml@vger.gnuweeb.org>, "x86@kernel.org" <x86@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [RFC PATCH v2 3/8] tools/nolibc: i386: Implement syscall with 6
 arguments
Thread-Topic: [RFC PATCH v2 3/8] tools/nolibc: i386: Implement syscall with 6
 arguments
Thread-Index: AQHYPdalMvftIu2CIkSH1LImoy2kmazLOrmQ
Date: Tue, 22 Mar 2022 10:57:01 +0000
Message-ID: <35ec31089f724a74a584f946deac6248@AcuMS.aculab.com>
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org>
 <20220322102115.186179-4-ammarfaizi2@gnuweeb.org>
In-Reply-To: <20220322102115.186179-4-ammarfaizi2@gnuweeb.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Ammar Faizi
> Sent: 22 March 2022 10:21
>=20
> On i386, the 6th argument of syscall goes in %ebp. However, both Clang
> and GCC cannot use %ebp in the clobber list and in the "r" constraint
> without using -fomit-frame-pointer. To make it always available for
> any kind of compilation, the below workaround is implemented.
>=20
> For clang (the Assembly statement can't clobber %ebp):
>   1) Push the 6-th argument.
>   2) Push %ebp.
>   3) Load the 6-th argument from 4(%esp) to %ebp.
>   4) Do the syscall (int $0x80).
>   5) Pop %ebp (restore the old value of %ebp).
>   6) Add %esp by 4 (undo the stack pointer).
>=20
> For GCC, fortunately it has a #pragma that can force a specific function
> to be compiled with -fomit-frame-pointer, so it can use "r"(var) where
> var is a variable bound to %ebp.

You need to use the 'clang' pattern for gcc.
#pragma optimise is fundamentally broken.
What actually happens here is the 'inline' gets lost
(because of the implied -O0) and you get far worse code
than you might expect.

Since you need the 'clang' version, use it all the time.

=09David

>=20
> Cc: x86@kernel.org
> Cc: llvm@lists.linux.dev
> Link: https://lore.kernel.org/lkml/2e335ac54db44f1d8496583d97f9dab0@AcuMS=
.aculab.com
> Suggested-by: David Laight <David.Laight@ACULAB.COM>
> Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> ---
>=20
> @@ Changelog:
>=20
>    Link RFC v1: https://lore.kernel.org/llvm/20220320093750.159991-4-amma=
rfaizi2@gnuweeb.org
>    RFC v1 -> RFC v2:
>     - Fix %ebp saving method. Don't use redzone, i386 doesn't have a redz=
one
>       (comment from David and Alviro).
> ---
>  tools/include/nolibc/arch-i386.h | 66 ++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/tools/include/nolibc/arch-i386.h b/tools/include/nolibc/arch=
-i386.h
> index 125a691fc631..9f4dc36e6ac2 100644
> --- a/tools/include/nolibc/arch-i386.h
> +++ b/tools/include/nolibc/arch-i386.h
> @@ -167,6 +167,72 @@ struct sys_stat_struct {
>  =09_ret;                                                                =
 \
>  })
>=20
> +
> +/*
> + * Both Clang and GCC cannot use %ebp in the clobber list and in the "r"
> + * constraint without using -fomit-frame-pointer. To make it always
> + * available for any kind of compilation, the below workaround is
> + * implemented.
> + *
> + * For clang (the Assembly statement can't clobber %ebp):
> + *   1) Push the 6-th argument.
> + *   2) Push %ebp.
> + *   3) Load the 6-th argument from 4(%esp) to %ebp.
> + *   4) Do the syscall (int $0x80).
> + *   5) Pop %ebp (restore the old value of %ebp).
> + *   6) Add %esp by 4 (undo the stack pointer).
> + *
> + * For GCC, fortunately it has a #pragma that can force a specific funct=
ion
> + * to be compiled with -fomit-frame-pointer, so it can use "r"(var) wher=
e
> + * var is a variable bound to %ebp.
> + *
> + */
> +#if defined(__clang__)
> +static inline long ____do_syscall6(long eax, long ebx, long ecx, long ed=
x,
> +=09=09=09=09   long esi, long edi, long ebp)
> +{
> +=09__asm__ volatile (
> +=09=09"pushl=09%[arg6]\n\t"
> +=09=09"pushl=09%%ebp\n\t"
> +=09=09"movl=094(%%esp), %%ebp\n\t"
> +=09=09"int=09$0x80\n\t"
> +=09=09"popl=09%%ebp\n\t"
> +=09=09"addl=09$4,%%esp\n\t"
> +=09=09: "=3Da"(eax)
> +=09=09: "a"(eax), "b"(ebx), "c"(ecx), "d"(edx), "S"(esi), "D"(edi),
> +=09=09  [arg6]"m"(ebp)
> +=09=09: "memory", "cc"
> +=09);
> +=09return eax;
> +}
> +
> +#else /* #if defined(__clang__) */
> +#pragma GCC push_options
> +#pragma GCC optimize "-fomit-frame-pointer"
> +static long ____do_syscall6(long eax, long ebx, long ecx, long edx, long=
 esi,
> +=09=09=09    long edi, long ebp)
> +{
> +=09register long __ebp __asm__("ebp") =3D ebp;
> +=09__asm__ volatile (
> +=09=09"int=09$0x80"
> +=09=09: "=3Da"(eax)
> +=09=09: "a"(eax), "b"(ebx), "c"(ecx), "d"(edx), "S"(esi), "D"(edi),
> +=09=09  "r"(__ebp)
> +=09=09: "memory", "cc"
> +=09);
> +=09return eax;
> +}
> +#pragma GCC pop_options
> +#endif /* #if defined(__clang__) */
> +
> +#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6) (   \
> +=09____do_syscall6((long)(num), (long)(arg1),               \
> +=09=09=09(long)(arg2), (long)(arg3),              \
> +=09=09=09(long)(arg4), (long)(arg5),              \
> +=09=09=09(long)(arg6))                            \
> +)
> +
> +
>  /* startup code */
>  /*
>   * i386 System V ABI mandates:
> --
> Ammar Faizi

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


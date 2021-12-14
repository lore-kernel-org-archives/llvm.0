Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B113A173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:09:17 +0000 (UTC)
Date: Tue, 14 Dec 2021 19:09:06 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] MIPS: boot/compressed: Disable abicalls
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Desaulniers
	<ndesaulniers@google.com>, list@opendingux.net, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <67D44R.5C6XHAZPCYVU3@crapouillou.net>
In-Reply-To: <YbjdQfrC+EjeJjRV@archlinux-ax161>
References: <20211213224914.1501303-1-paul@crapouillou.net>
	<20211213224914.1501303-2-paul@crapouillou.net>
	<YbjdQfrC+EjeJjRV@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le mar., d=E9c. 14 2021 at 11:06:57 -0700, Nathan Chancellor=20
<nathan@kernel.org> a =E9crit :
> On Mon, Dec 13, 2021 at 10:49:12PM +0000, Paul Cercueil wrote:
>>  Avoid complaints from Clang/LLVM by building the decompress program=20
>> with
>>  -mno-abicalls.
>=20
> What is the message?

ld.lld: warning: lto.tmp: linking abicalls code with non-abicalls code=20
arch/mips/kernel/head.o

Cheers,
-Paul

>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/boot/compressed/Makefile | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>>  diff --git a/arch/mips/boot/compressed/Makefile=20
>> b/arch/mips/boot/compressed/Makefile
>>  index f27cf31b4140..4c9ecfbb0ef4 100644
>>  --- a/arch/mips/boot/compressed/Makefile
>>  +++ b/arch/mips/boot/compressed/Makefile
>>  @@ -27,10 +27,10 @@ ifdef CONFIG_CPU_LOONGSON64
>>   KBUILD_CFLAGS :=3D $(filter-out -march=3Dloongson3a, $(KBUILD_CFLAGS))=
=20
>> -march=3Dmips64r2
>>   endif
>>=20
>>  -KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS=20
>> \
>>  +KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__=20
>> -D__DISABLE_EXPORTS \
>>   	-DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE)=20
>> -D"VMLINUX_LOAD_ADDRESS_ULL=3D$(VMLINUX_LOAD_ADDRESS)ull"
>>=20
>>  -KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
>>  +KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -mno-abicalls -D__ASSEMBLY__ \
>>   	-DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE) \
>>   	-DKERNEL_ENTRY=3D$(VMLINUX_ENTRY_ADDRESS)
>>=20
>>  --
>>  2.33.0
>>=20
>>=20



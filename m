Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028CE525F
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 10:40:13 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2588BD420A
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 10:34:43 +0000 (UTC)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 55EDD100004;
	Fri, 24 Mar 2023 10:34:27 +0000 (UTC)
Message-ID: <877d03e1-b00b-7863-6104-21b42bc63711@ghiti.fr>
Date: Fri, 24 Mar 2023 11:34:26 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?Q?l?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, nathan@kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com>
 <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
 <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nick,

On 3/22/23 19:25, Nick Desaulniers wrote:
> On Fri, Feb 24, 2023 at 7:58 AM Björn Töpel <bjorn@kernel.org> wrote:
>> Alexandre Ghiti <alex@ghiti.fr> writes:
>>
>>> +cc linux-kbuild, llvm, Nathan, Nick
>>>
>>> On 2/15/23 15:36, Alexandre Ghiti wrote:
>>>> From: Alexandre Ghiti <alex@ghiti.fr>
>>>>
>>> I tried a lot of things, but I struggle to understand, does anyone have
>>> any idea? FYI, the same problem happens with LLVM.
> Off the top of my head, no idea.
>
> (Maybe as a follow up to this series, I wonder if pursuing
> ARCH_HAS_RELR for ARCH=riscv is worthwhile?)


IIUC, the goal for using RELR is to reduce the size of a kernel image: 
right now, this is not my priority, but I'll add that to my todo list 
because that may be useful to distros.


>
>> Don't ask me *why*, but adding --emit-relocs to your linker flags solves
>> "the NULL .rela.dyn" both for GCC and LLVM.
>>
>> The downside is that you end up with a bunch of .rela cruft in your
>> vmlinux.
> There was a patch just this week to use $(OBJCOPY) to strip these from
> vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
> https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/


That's nice, that would be an interesting intermediate step until we 
find the issue here as I believe it is important to have the relocations 
in the init section to save memory.

Thanks for your answer Nick, really appreciated,

Alex



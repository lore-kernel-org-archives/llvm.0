Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB72C9E
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 09:05:03 +0000 (UTC)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru A692C20E8F18
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <faadff42-e769-cc8b-5ae2-793b2c006b91@omp.ru>
Date: Wed, 8 Dec 2021 11:55:59 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] MIPS: Loongson64: Use three arguments for slti
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>
CC: Nick Desaulniers <ndesaulniers@google.com>, <linux-mips@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Ryutaroh Matsumoto
	<ryutaroh@ict.e.titech.ac.jp>
References: <20211207170129.578089-1-nathan@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211207170129.578089-1-nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)

Hello!

On 07.12.2021 20:01, Nathan Chancellor wrote:

> LLVM's integrated assembler does not support 'stli <reg>, <imm>':

    Perhaps slti (as below)?

> <instantiation>:16:12: error: invalid operand for instruction
>   slti $12, (0x6300 | 0x0008)
>             ^
> arch/mips/kernel/head.S:86:2: note: while in macro instantiation
>   kernel_entry_setup # cpu specific setup
>   ^
> <instantiation>:16:12: error: invalid operand for instruction
>   slti $12, (0x6300 | 0x0008)
>             ^
> arch/mips/kernel/head.S:150:2: note: while in macro instantiation
>   smp_slave_setup
>   ^
> 
> To increase compatibility with LLVM's integrated assembler, use the full
> form of 'stli <reg>, <reg>, <imm>', which matches the rest of

    Again, slti?

> arch/mips/. This does not result in any change for GNU as.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1526
> Reported-by: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
[...]

MBR, Sergey

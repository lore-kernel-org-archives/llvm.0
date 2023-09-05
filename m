Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C31CA57
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 13:22:27 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qdW0L-0002Yj-32; Tue, 05 Sep 2023 15:22:05 +0200
Message-ID: <ea283ec4-5db2-488c-90e7-64dbb0e16b17@leemhuis.info>
Date: Tue, 5 Sep 2023 15:22:03 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Vincent Chen <vincent.chen@sifive.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
 Benjamin Gray <bgray@linux.ibm.com>, Qing Zhang <zhangqing@loongson.cn>,
 Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
 llvm@lists.linux.dev, nathan@kernel.org
References: <20230825050248.32681-1-andy.chiu@sifive.com>
 <ZPDIQEVaEJHXR5IW@google.com> <20230831-resize-spherical-4f46639097b8@spud>
 <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
 <CAKwvOdnGy_R_C3KsjMZ0+1+r0hVcqKrw9yDOUJuK=CCYL18gNg@mail.gmail.com>
 <455be372-ee2c-7d96-9aaf-86256e018d25@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <455be372-ee2c-7d96-9aaf-86256e018d25@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693920148;d6c9e699;
X-HE-SMSGID: 1qdW0L-0002Yj-32

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 31.08.23 20:24, Thorsten Leemhuis wrote:
> On 31.08.23 19:59, Nick Desaulniers wrote:
>> On Thu, Aug 31, 2023 at 10:50 AM Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>>>
>>> On 31.08.23 19:17, Conor Dooley wrote:
>>>> On Thu, Aug 31, 2023 at 10:05:04AM -0700, Nick Desaulniers wrote:
>>>>> On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
>>>>>> This patch add back the ptrace support with the following fix:
>>>>>>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>>>>>>    conflicting with gdb's NT_RISCV_CSR.
>>>>>>  - Use struct __riscv_v_regset_state to handle ptrace requests
>>>>>>
>>>>> Hi Andy, this is causing an instance of -Wunused-variable. PTAL.
> [...]
>>> You mean the commit-id of the change currently known as dbe46b094026
>>> will change? 

That happened in between and the fix was folded in, so tell regzbot this
was resolved:

#regzbot resolve: culprit updated and fix was folded in (currently known
as 9300f0043974)
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

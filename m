Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF748F57
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 18:24:29 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbmKy-00081f-MC; Thu, 31 Aug 2023 20:24:12 +0200
Message-ID: <455be372-ee2c-7d96-9aaf-86256e018d25@leemhuis.info>
Date: Thu, 31 Aug 2023 20:24:10 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Content-Language: en-US, de-DE
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAKwvOdnGy_R_C3KsjMZ0+1+r0hVcqKrw9yDOUJuK=CCYL18gNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693506270;68b85ea2;
X-HE-SMSGID: 1qbmKy-00081f-MC

On 31.08.23 19:59, Nick Desaulniers wrote:
> On Thu, Aug 31, 2023 at 10:50 AM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> On 31.08.23 19:17, Conor Dooley wrote:
>>> On Thu, Aug 31, 2023 at 10:05:04AM -0700, Nick Desaulniers wrote:
>>>> On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
>>>>> This patch add back the ptrace support with the following fix:
>>>>>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>>>>>    conflicting with gdb's NT_RISCV_CSR.
>>>>>  - Use struct __riscv_v_regset_state to handle ptrace requests
>>>>>
>>>>> Since gdb does not directly include the note description header in
>>>>> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
>>>>> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
>>>>> conflicts.
>>>>>
>>>>> Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
>>>>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>>>>
>>>> Hi Andy, this is causing an instance of -Wunused-variable. PTAL.
>>>>
>>>> Please use the following tags on the fix:
>>>>
>>>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>>>> Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/
>>>>
>>>> Let's see if I can get the regzbot tag correct; first time trying it.
>>>> #regzbot introduced dbe46b094026
>>
>> Nick, thx for trying, but FWIW, that's was slightly off, but there might
>> be a easy workaround. To explain for anyone that cares:
>>
>> Due to that '#regzbot introduced ...' regzbot will consider the mail
>> with the "#regzbot introduced dbe46b094026" (e.g. the msg from Nick with
>> the msgid ZPDIQEVaEJHXR5IW@google.com) as a report for this regression
>> and thus look out for patches and commits with a tag like this:
>>
>>  Closes: https://lore.kernel.org/all/ZPDIQEVaEJHXR5IW@google.com/
>>
>> Which is kinda correct, as your mail *is* a report about the regression,
>> so some developer might use this. But in this case that's not what Nick
>> wanted, as there was an earlier report that was even specified. But
>> well, that might make it easy to fix, as we could simply tell regzbot
>> about the duplicate.
> 
> Ah sorry about that. I tried.

Again: thx for trying, I'm sure we'll get there.

> I'm still unclear on what I should have done though.
>> Should I have replied to
> https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/
> with that same regzbot tag that I used instead?

Nearly, just that you need to use "regzbot ^introduced <commit_id>" in
that case (with the caret) to instruct regzbot to consider the parent
mail as the report (the one you would have replied to).

/me wonders how all this could be made earlier and if the regzbot docs
are not explaining this well enough; but well, doing this by mail brings
some complexity that is hard to avoid :-/

https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md

>> Nick could have done that in his mail, but I can do
>> it in this one was well (as it's a indirect reply to the report from
>> Nick that regzbot track) that 64f03ea1.170a0220.d3dbf.11fd@mx.google.com
>> is a duplicate of ZPDIQEVaEJHXR5IW@google.com:
>>
>> #regzbot dup-of:
>> https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/
> 
> Thanks for cleaning that up; sorry for the mess.

No problem.

>> Let's see if this works. I haven't used this much, so maybe something
>> might go sideways; but in theory this should work and then regzbot would
>> do the right thing. At least normally:
>>
>>> See <20230830203754.24940-1-palmer@rivosinc.com> for the fix.
>>>
>>> That has you gave regzbot prob won't be stable though, branch needs a
>>> rebase to add missing SoB tags from its committer.
>>
>> You mean the commit-id of the change currently known as dbe46b094026
>> will change? Ughh, yeah, that's unfortunate and something regzbot is not
>> yet prepared for.
>>
>> Hmmmm. Haven't had this case yet, as regzbot until now is not used much
>> for -next. Not sure how to best handle that. Sure, regzbot could notice
>> "the commit formerly known as cafec0c0 is now now c0c0cafe, as the
>> subject, author, and modified files roughly match" -- but I'm not sure
>> if that's a good idea, as developers like Conor might integrate simple
>> fixes like the one for the problem at hand during the rebase. So maybe
>> at this point it becomes "some human needs to look into this and tell
>> regzbot what to do". :-/
> 
> How about if someone drops a patch after it's been reported to
> regzbot?  Is there currently any way to instruct regzbot to "forget
> about the previous report?"

Simply send a reply to what regzbot considers the report (or a mail that
itself is directly or indirectly a reply -- e.g. a mail like this) and
use mark the regression as resolved using something like this

 #regzbot resolve: culprit rebased and fix folded in

Or if the culprit would have gotten a stable commit-id and the fix was
separate something like this would work

 #regzbot introduced: <new_commit_hexsha>
 #regzbot fix: RISC-V: Remove unused "size" in ptrace

(for 'regzbot fix' one can use a commit-id, too (if it's stable))

In this case regzbot will ignore all of the above due to the spaces
before the ' #regzbot'.

> Perhaps that's only a common workflow in -next.

Yeah, for this case it for nor likely is good enough.

Ciao, Thorsten

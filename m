Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075D29CA
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 00:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id CC478382B7E;
	Wed, 15 Dec 2021 19:26:24 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2oKk1HJHT_qE; Wed, 15 Dec 2021 19:26:24 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 40356382DF7;
	Wed, 15 Dec 2021 19:26:24 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 40356382DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1639614384;
	bh=/Ckylx+5hLXAqPc4niPYm3IeQClHNE8BpRXxidpu2/M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=D3zh82mMHz6OKJUeNw93BKxs7MfdR4DoKXkasqn83fkSKhGcVKVMO/a0mDqzUMTR5
	 jwKYv7O9pHtJcKjE/9atcwpyWFDxbSiYO/12gEdjvyzulXR2544OHPw02lwLrE8hlC
	 Y17BEv9E6p1dWCQbVmFx96vB1zc2l9lfOn+1a0+IRU8CCgurc92ufj2F1hFFVPb/a4
	 Cinxs9haHubmwOMSnInslOX/eSgjgdJ7rv73tynug3XYMkFERBpPyL4tUa3i34hdKE
	 hAM8Uw/Z0+hQpdnDdQIfJOLvVQAvLGewmq+mQ+fyGgKmf3gkIT+3n29ecPLs1UhQRd
	 eyZRCJB1dGq/A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6S7pYieOaVDa; Wed, 15 Dec 2021 19:26:24 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
	by mail.efficios.com (Postfix) with ESMTP id 33C463832B5;
	Wed, 15 Dec 2021 19:26:24 -0500 (EST)
Date: Wed, 15 Dec 2021 19:26:24 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: ndesaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, 
	James Y Knight <jyknight@google.com>, 
	Eli Friedman <efriedma@quicinc.com>
Message-ID: <843148451.34243.1639614384115.JavaMail.zimbra@efficios.com>
In-Reply-To: <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com>
References: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com> <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com> <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com>
Subject: Re: clang asm goto issue small reproducer
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - FF94 (Linux)/8.8.15_GA_4177)
Thread-Topic: clang asm goto issue small reproducer
Thread-Index: Q7N9jwoUcBjHlkqEqDYtMCN7Fvhn1g==

----- On Dec 15, 2021, at 7:18 PM, ndesaulniers ndesaulniers@google.com wrote:

> On Wed, Dec 15, 2021 at 3:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Wed, Dec 15, 2021 at 2:06 PM Mathieu Desnoyers
>> <mathieu.desnoyers@efficios.com> wrote:
>> >
>> > Hi Nick,
>> >
>> > I have a small reproducer for the asm goto issue we discussed over irc. I have
>> > axed away all code that is not the problematic function by hand. Hopefully this
>> > won't change the overall optimization context too much.
>>
>> If I cut the compilation pipeline off at after "middle-end"
>> optimizations, I can see that `this_cpu_list_pop` returns `NULL` for
>> test.c while in test-asm.c, it's a phi node of either NULL or head
>> (which looks correct; for the test-asm.c case).
>>
>> "GVNPass" seems to be converting
>>
>> return:                                           ; preds =
>> %cleanup.thread19, %cleanup.thread
>>   %retval.118 = phi %struct.percpu_list_node* [ %9, %cleanup.thread ],
>> [ null, %cleanup.thread19 ]
>>   ret %struct.percpu_list_node* %retval.118
>>
>> into:
>>
>> return:                                           ; preds =
>> %cleanup.thread19, %cleanup.thread
>>   ret %struct.percpu_list_node* null
>>
>> Which drops the
>>   %9 = load %struct.percpu_list_node*, %struct.percpu_list_node**
>> %head, align 8, !tbaa !9
> 
> Ah, Eli pointed out that I'm chasing the wrong squirrel. From test.c we have:
> 
> struct percpu_list_node *head;
> load = (intptr_t *)&head;
> ret = rseq_cmpnev_storeoffp_load(targetptr, expectnot,
>     offset, load, cpu);
> 
> then in rseq_cmpnev_storeoffp_load():
> __asm__ __volatile__ goto (
>  :
>  :
> [load] "m" (*load));
> 
> Did we ever initialize head?  Isn't this equivalent to:
> 
> int* foo (void) {
>  int *head;
>  int **load;
>  load = &head;
>  asm(""::"m"(*load):"memory");
>  return head;
> }
> 
> Isn't that equivalent to:
> 
> int* foo (void) {
>  int *head;
>  asm(""::"m"(head):"memory");
>  return head;
> }
> 
> For which neither compiler warns for -Wuninitialized? They would if
> head was an argument to a function call...

This is a situation where I had to work around the fact that older
gcc did not support output operands. I expected that having both
a "m" input operand and a "memory" clobber would allow the asm
to write to the memory location pointed to by the "m" input operand,
and the "memory" clobber was expected to prevent the compiler
from presuming anything about memory state across the asm.

But I suspect I was expecting too much here. What would be the
best course of action to fix these asm statements ? Do I have
any way to do this without requiring a dependency on gcc/clang
that support asm goto with output operands ?

Thanks,

Mathieu


> 
>>
>> I think GVN may be eliminating a phi that it should not be.
>> Specifically, it seems that GVN thinks the default/fallthrough
>> successor is unreachable, which seems incorrect to me. The predecessor
>> lists all look correct to me, so GVN may be stumbling on callbr
>> itself.
>>
>> $ clang -O2 test.c -emit-llvm -S -o - -Xclang -disable-llvm-passes > test.ll
>> $ opt -O2 -print-before=gvn -print-after=gvn
>> -filter-print-funcs=this_cpu_list_pop test.ll -o /dev/null 2>
>> test.gvn.ll
>>
>> Then using this reproducer, I was able to narrow it down a little further:
>>
>> $ opt -O2 -print-before=gvn -print-module-scope
>> --filter-print-funcs=this_cpu_list_pop test.ll -S 2>test.pre-gvn.ll
>> $ llvm-extract --func=this_cpu_list_pop test.pre-gvn.ll -o
>> test.pre-gvn.this_cpu_list_pop.bc --recursive
>> $ llvm-dis test.pre-gvn.this_cpu_list_pop.bc
>> $ cat repro.sh
>> #!/usr/bin/env sh
>> set -e
>> grep -q "%retval.118 = phi %struct.percpu_list_node\* \[ %9,
>> %cleanup.thread \], \[ null, %cleanup.thread19 \]" $1
>> grep -q "ret %struct.percpu_list_node\* %retval.118" $1
>> OUT=$(opt -passes=gvn $1 -S -o -)
>> echo $OUT | grep -q "ret %struct.percpu_list_node\* null"
>> $ llvm-reduce --test=./repro.sh test.pre-gvn.this_cpu_list_pop.ll
>>
>> Then pared down further manually, see reduced.ll
>>
>> I've filed https://github.com/llvm/llvm-project/issues/52735, let's
>> discuss more there?
>>
>> >
>> > on x86-64:
>> >
>> > Buggy code:
>> > clang-13 -O2 -o test.o test.c
>> >
>> > OK code (added a dummy asm("")):
>> > clang-13 -O2 -o test-asm.o test-asm.c
>> >
>> > Thanks,
>> >
>> > Mathieu
>> >
>> > --
>> > Mathieu Desnoyers
>> > EfficiOS Inc.
>> > http://www.efficios.com
>>
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
> 
> 
> 
> --
> Thanks,
> ~Nick Desaulniers

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

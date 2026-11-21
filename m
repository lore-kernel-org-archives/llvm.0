Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269465;
	b=PsgcfoDfA0JdOhNYJgUp91gvYLMRJ2ldoAEHDfqHZX1ZSwd6B17hN76pdvGmZABW6cig
	 w8N042SG1zVTgZ+lk5Z+glRsgVyFHxqQmesGRSF5Zk9+NRadK4aiEnZJE4mNrLc11dItU
	 qqIMJmVnTSXgnIyN48BemDGtUHJ0Pv1bSAmBLsqVaqYg34vq5dwEzQEygZim4FrMgOnqd
	 pt0xPHdg1UypDTnsOmNg3rJyYJsqANlHLLcCNsaLKrlL79FotAEZyHMc17SCTDZzJWnRR
	 sNQ1job4C0PLSnySG4PHzW4HtADnlurRRuJyToGwyb61sWnUYcBdccnt6mM69O7HvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269465;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=18/Vs9GqpUyKpNSmHJAMt/cDQkuDqfrI75+lCyBsTo0=;
	b=t0pqzW7xHAPTZExpSWgrPkVW8CeXc+CyviiGtwnfRgNpjD0nW+6qkRSLrmC3tR3TOVNU
	 d+Nk2Yso0LrDmyjxg9cHu1vOpX59CUXB95iywOn6qHtRbMtHIiuA3RSL0/iUjPJhpN2XS
	 LukVX9XwWzSqZmXrWFvSour2UPX6ZFVsfIgISJYbxN7psT8olGKJ0JtwTxEypQlRv+SRq
	 rTOv3tJHTjhtnNgtPaAOK+dLwsLFwSWdpCT0JmHYknopF2tfEaEQQnwbA9Dxp7rO1tbEn
	 Sr0mM49rXbj0EPJf4trex8wXC3ehmewAHdEw3lemjEXcMippricNJiDOit4ZjU+1pvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="w/uS1uJG";
	arc=none smtp.remote-ip=95.215.58.205
Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECF3606A32A
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECF3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w/uS1uJG
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=2dvE1j/J7GOZSLNpwQfYKuzbzCKoIpTpgn7v4dkyvXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795269461; v=1; x=1795874261;
 b=w/uS1uJGXlgVzwAbgvs47kIIknHR2IigKYDN9/OMhSBKszCBKBoajtWDm00P4Fjt/scwk1fc
 LrEXhsgGwTvaCgGVXqOjNa78PcB9tyeS48yy9BVZPoU/VpQqAqgqVoCXRshDpOPhjI92u2DvzAu
 gWRt25czL6xEtmRYJanz/PME=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2e59e907da1d8a68;
	Sat, 21 Nov 2026 13:57:41 +0000
X-Mizu-Trace-ID: 2e59e907da1d8a68
X-Migadu-Flow: FLOW_OUT
Message-ID: <ee4847f9-53ba-4f0a-9297-7ca8b6408f7f@linux.dev>
Date: Sat, 21 Nov 2026 13:57:39 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack fills
To: David Laight <david.laight.linux@gmail.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org, hpa@zytor.com,
 gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
References: <20261119213147.1094488-1-usama.arif@linux.dev>
 <20261119213147.1094488-3-usama.arif@linux.dev>
 <20261120185513.0445f0b1@pumpkin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261120185513.0445f0b1@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/11/2026 10:55, David Laight wrote:
> On Thu, 19 Nov 2026 13:31:08 -0800
> Usama Arif <usama.arif@linux.dev> wrote:
> 
>> With KSTACK_ERASE, every return to user space poisons the part of the
>> task stack that was used since the previous return. The generic
>> __stackleak_poison() does that one word per loop iteration, so a syscall
>> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
>> running many small VMs, stackleak_erase() accounts for about 1.5% of
>> non-idle host kernel cycles.
>>
>> Override __stackleak_poison() on x86-64, as s390 already does, through
>> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
>> specific stackleak poison function"). Fill spans larger than 512 bytes
>> with REP STOSQ and keep the word loop for shorter ones, where the fixed
>> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
>> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
>> slower.
> 
> As a matter of interest (and separately from the exact code) how did you
> measure the performance to get the 300-400 byte gain point?
> 

With a userspace benchmark pinned to one CPU. Each sample is one fill of
a stack buffer straight after a getppid() syscall, with
lfence;rdtsc;lfence around the fill only, an empty call subtracted, and
the mean of 15 times taken. The size stayed fixed for a whole run,
so the branches were well predicted. The plain loop and REP STOSQ
cost the same at about 430 bytes on Zen 5c and 320 bytes on
Cooper Lake.

> If the count is variable - likely in real life, you'll get a branch
> misprediction penalty (about 20 clocks on zen5) every time you change
> between the two choices.
> The copy loop will have another mispredict penalty for the loop itself.
> 
> So you are likely to get an overall improvement if you use 'rep stos'
> for all lengths - even the ones for with it is slightly slower.
> Unless, that is, you know at compile time that most of the length
> will be short.


I timed every stackleak_erase() in a Zen 5c guest running a
futex, epoll, procfs and unix socket mix, with the variants switchable
at runtime and alternated over 15 rounds:

  Unpatched                     68.3 ns per erase
  REP STOSQ for all lengths     47.3 ns
  v1 / v2.1 (loop up to 512 B)  46.6 ns
  v2.2 (4 stores/iteration)     43.7 ns

The spans aren't random. Unix socket and /proc/self/stat exits were over
1 KiB every time, while getppid(), epoll_wait(), read() and write() exits
were under 128 bytes almost everytime.

My preference still is v2.1 because of the simplicity.

> 
> David
> 
>>
>> The fill is inline asm, so the noinstr function still makes no calls.
>> memset64() would be the same instruction, but it is only static inline,
>> and with KMSAN it is an out-of-line function.
>>
>> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
>> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
>> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
>> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
>> index 77488ff5eb8c7c..049231d484ad0e 100644
>> --- a/arch/x86/include/asm/processor.h
>> +++ b/arch/x86/include/asm/processor.h
>> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>>  			       current_stack_pointer) < THREAD_SIZE;
>>  }
>>  
>> +#ifdef CONFIG_X86_64
>> +#define __stackleak_poison __stackleak_poison
>> +static __always_inline void __stackleak_poison(unsigned long erase_low,
>> +					       unsigned long erase_high,
>> +					       unsigned long poison)
>> +{
>> +	unsigned long count;
>> +
>> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
>> +	if (erase_high <= erase_low + 512) {
>> +		while (erase_low < erase_high) {
>> +			*(unsigned long *)erase_low = poison;
>> +			erase_low += sizeof(unsigned long);
>> +		}
>> +		return;
>> +	}
>> +
>> +	count = (erase_high - erase_low) / sizeof(unsigned long);
>> +	asm volatile("rep stosq"
>> +		     : "+D" (erase_low), "+c" (count)
>> +		     : "a" (poison)
>> +		     : "memory");
>> +}
>> +#endif
>> +
>>  #ifdef CONFIG_PARAVIRT_XXL
>>  #include <asm/paravirt.h>
>>  #else
> 


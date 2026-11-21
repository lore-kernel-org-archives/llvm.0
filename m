Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285332;
	b=Z8obBolN4oieU8rwCEvHhFTLy7oTOmdJpfB9cNO2RW4oeCgLe5mfK/9BTraa+JpFQ7/r
	 HCqrL15yNA0hfPlotPtLJWyr0V9G6QTOTyn1MZPw0AColNYVGQGX12hntiNkKnqhIxd7z
	 0vN8/PZh8FWZR2T8+K7bSAQY58SlOmJh3JMMpyYDXP7ngWdwxACczFOqzWNv7yYntlKkc
	 5A47j3jMCauZsyptscAAUMeMQ8O4bmvb3j8nDbgEzXZwfsY30rIOOpNoqXvGrGfcu/Ude
	 H89Usz6EsBuV7jhjWQmMUsJ4LcSP9coKfB8MP+LeeEey/c/Zi1Oex+xc2puT6YE1Arg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RrMX+i8/tOMeoT04UhvV0NGNh6gnX10PkADwXNkmHBY=;
	b=lbtKoOrhlqoPmx5mw03a14MG6qWNUTnDzdMsEBbX/rynWFTqhjwlHPL3FHVFpMiWXIGS
	 8k1fMDvRhACXTL/tImg5U7+YY5txEHIxGNmugThfNcZqV44I3qshkb58xOCRP0WwyLgCV
	 UTur2c2uPlwJ9DDeyj0XUFKlD0DZUnJ8IPXJw5ZhidNbR0l7/HkLD9HTtLCebqHqgzOrT
	 wp99rBrXXAGUGa7PhTCOA5NhODtNuJ0XDi4GWgEt20HebGJ1qGfkm4+LWHnq4cCyvg8S4
	 OQ7l3aF0bNdCb827n9akuBpzPztsleCZ2MLSzBRc+7g2tYFpykRhXCs/PCqMdUKKz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mquMU6ek;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB7606A320
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 18:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mquMU6ek
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1499641f8f.0
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285330; x=1795890130; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrMX+i8/tOMeoT04UhvV0NGNh6gnX10PkADwXNkmHBY=;
        b=mquMU6ek30ecXbh2Tsz98N2OalBanbYkHRp1qkaAeddDJQDUpMQ60NesVSpow8CLrz
         p4KrBfJYKBZp5rjCelZomVLzAbSJeGm7v/cxYHCZ+nJlxQp9agtUvGRoL8/TVhj8rjtC
         sUAzxhXAGDhgmu9Bji3pzlKfp7hLVT7t+7cev2qpD1kOgi+Vr2Q8Y/FIOZFUMY26+VJo
         ezZ+kBwFF8Mmy+cRurTzFsZtPzw7uXWYzZMNSrg6P69i0JwQXeatsNbAaWCCiN2uiiHc
         d3UW07RhvI8N3dmgpEkFjszSzJJM4dSSU7Gtw9Mn0KSu6VLs4MDKuCGxdw7i7rh5d81F
         1aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285330; x=1795890130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrMX+i8/tOMeoT04UhvV0NGNh6gnX10PkADwXNkmHBY=;
        b=Nwvph0MWkFrk1zqb2Bjq1ce9t9DcYE3s22yTThq6ZZQnP6ZgdIY+JCjOxZ5y/mboJe
         H3KOXt4DpdVmGYhz+g0YHiDiCdPHNz8ONIo/rbiYgJ/mTkrWURXyUVPlKYVTykAzl+JI
         bS7oslcK14x2j9VPPpcb86cr46Xov3f3njRLHuZv4zcMHgCLnKAqHcN5lbcof5iWL9wU
         rs4vivlfHi46XKO+ENDKRE98044+L3ToRShPuDU9pUtCcpNXJVZzOcWSdGRexIV7UxI/
         LQfRTzpKiiYwdTrxHCvFdtKUEd1wUNc6CHPM2I5agdr0pdILCZtM8T+G6FV+/m1GU85R
         dgUw==
X-Forwarded-Encrypted: i=1; AL+hErGjknizxtZVESZiMhVU64/KT4TDTxZhXSPWG6CpeqI5nG3XJmt9Xfn/tdcjWOgUqCyW3Nqk@lists.linux.dev
X-Gm-Message-State: APuU4Z/qlyEiazAifWw2KfXAmnykOW1OK3oIk7oJLdto9xun+rvpne5M
	D1ayf+ewQhrY4CFo9P7BNz2Hi4lWGEDLznaP5wSGoLhFpfPEzFcxJUn6
X-Gm-Gg: AZFdTZfJ5og3hl7ajbjCOyX67tunYymdZZGC00rGOz6bwlTe6iFq7lqtY2NL0lFtOra
	uPQETSF2GaUbRnVw0mxu2PXxRmfVdSgh9KFCZ6rSatc7lAdiEUNyKp89WPrR5NaiBNu9x2e9dso
	SpfCSVWo9HDccG6ElTp9kUguB5aYCmDVMrFrudY1EF0ZNb58NXv3b5UoT4L9W+zoDvxJPcoLSly
	ImQEl5oQo+9eZhK/o/3rkRn0mO7REIWY2bD+NYOYmVT/HgV8J7+QVZpDgQNOQKlZ9sGhtPSLbmb
	rixpTVW4dNmCV4b42/yEQLRABxiIOPIqYYk12U3rdB/NG+FdEnKJ0bKOBhG5mBx9JxQnI5MI4bN
	DGStmmvQs8xFZ+0anctRbHFLnFRwc2Cxeeb8iKKsvzKYN8+RZhSjo6MS7a2FMOq3Cd+4RpwVTcE
	nI5Jfxh2bt7T6N0JOPvhy0WVCkRGDK8cl6nKQEvrJsv9vkBxGFzbDGPXxuXGt61ujipSGYtXRD9
	yg802i9OOmaM5glhfZLlGjxaVmn9R2K0g7wC5bmhoO2mGNzWwQOg/A5DdkFDzvtD54jk8Eb1wNe
	ojrgmKAegzi9rGz1ETmchlQCcOn/wwwCo3oZ8fzzBvUz8eYw4kqWQFkX1LhRYJHLIA==
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr14171006f8f.13.1795285330333;
        Sat, 21 Nov 2026 10:22:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm13143736f8f.31.2026.11.21.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:22:10 -0800 (PST)
Date: Sat, 21 Nov 2026 18:22:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261121182208.19594445@pumpkin>
In-Reply-To: <ee4847f9-53ba-4f0a-9297-7ca8b6408f7f@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120185513.0445f0b1@pumpkin>
	<ee4847f9-53ba-4f0a-9297-7ca8b6408f7f@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Nov 2026 13:57:39 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 20/11/2026 10:55, David Laight wrote:
> > On Thu, 19 Nov 2026 13:31:08 -0800
> > Usama Arif <usama.arif@linux.dev> wrote:
> >   
> >> With KSTACK_ERASE, every return to user space poisons the part of the
> >> task stack that was used since the previous return. The generic
> >> __stackleak_poison() does that one word per loop iteration, so a syscall
> >> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> >> running many small VMs, stackleak_erase() accounts for about 1.5% of
> >> non-idle host kernel cycles.
> >>
> >> Override __stackleak_poison() on x86-64, as s390 already does, through
> >> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> >> specific stackleak poison function"). Fill spans larger than 512 bytes
> >> with REP STOSQ and keep the word loop for shorter ones, where the fixed
> >> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> >> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> >> slower.  
> > 
> > As a matter of interest (and separately from the exact code) how did you
> > measure the performance to get the 300-400 byte gain point?
> >   
> 
> With a userspace benchmark pinned to one CPU. Each sample is one fill of
> a stack buffer straight after a getppid() syscall, with
> lfence;rdtsc;lfence around the fill only, an empty call subtracted, and
> the mean of 15 times taken. The size stayed fixed for a whole run,
> so the branches were well predicted. The plain loop and REP STOSQ
> cost the same at about 430 bytes on Zen 5c and 320 bytes on
> Cooper Lake.

The lfence (or mfence - which is the one you really need) take long
enough that they don't give meaningful timings for anything short.
I think they manage to overlap with the setup times for 'rep xxx'.
You also get the problem that the tsc doesn't measure clocks and a lot
of benchmarks run long enough that the cpu speed changes.

I've updated my benchmark code and run some tests on zen5.
This uses the PERF_COUNT_CPU_CYCLES counter but directly executing rdpmc.
I then use data dependencies from the original count to the test code,
and from the test result to the second rdpmc (which nicely has a register
number) to get a time that includes the test function with little overhead.
The clock count for an empty test function is 25, 32 with a memory read.

Each test is run 10 times and the clock count for each shown separately.
The first column includes the cost of the I-cache loads and any branches
that get mispredicted because (in these cases) the length changes.
This is most obvious for the libc calls.

memset() to 4k aligned buffer
0: len   16 ok  445   32   32   32   32   32   32   32   32   32 no_memset
5: len   16 ok 10538  107   52   52   52   52   52   52   52   52 libc
6: len  256 ok  193  101   48   48   51   44   51   44   44   44 libc
7: len  512 ok  120   83   51   51   51   51   51   51   51   51 libc
8: len 1024 ok  111   56   56   55   56   55   56   55   56   56 libc
9: len 2048 ok  117   71   72   72   72   72   72   72   72   72 libc
10: len   16 ok   90   78   74   55   54   55   54   55   54   55 stosb
11: len  256 ok  112   78   78   78   78   78   78   78   78   78 stosb
12: len  512 ok   80   80   80   80   80   80   80   87   80   80 stosb
13: len 1024 ok   90   95   89   95   89   88   89   95   89   95 stosb
14: len 2048 ok  105  111  104  104  104  111  104  111  104  111 stosb
15: len   16 ok  104   88   84   58   58   58   58   58   58   58 stosq
16: len  256 ok  125   80   80   80   80   80   80   80   80   80 stosq
17: len  512 ok   82   83   83   90   82   82   83   83   82   82 stosq
18: len 1024 ok   90   91   91   98   91   98   91   98   91   91 stosq
19: len 2048 ok  106  113  106  113  106  113  106  106  106  113 stosq
20: len   16 ok  133   65   57   33   33   26   26   26   26   26 longs
21: len  256 ok  159  152   80   42   42   42   42   42   42   42 longs
22: len  512 ok  187  115   88   58   56   57   57   57   57   57 longs
23: len 1024 ok  146  211  167   89   88   88   88   88   88   90 longs
24: len 2048 ok  213  213  209  167  153  155  153  153  155  152 longs

memcpy() between 4k aligned buffers
0: len   16 ok  119   63   59   33   33   33   33   33   33   33 no_copy
5: len   16 ok 7333  103   51   51   51   51   51   51   51   51 libc
6: len  256 ok  447  105   51   51   51   51   51   51   51   51 libc
7: len  512 ok  405   56   56   56   56   56   56   56   56   56 libc
8: len 1024 ok  421   96   66   65   64   66   64   70   64   70 libc
9: len 2048 ok  406  139   81   83   81   85   81   83   83   81 libc
10: len   16 ok   91   81   76   56   56   56   56   56   56   56 movsb
11: len  256 ok  115   77   76   77   76   77   76   77   76   77 movsb
12: len  512 ok   80   81   80   81   80   81   81   81   80   81 movsb
13: len 1024 ok   90   89   90   89   90   89   90   89   90   89 movsb
14: len 2048 ok  112  106  105  106  105  106  105  106  105  106 movsb
15: len   16 ok  108   87   85   65   57   65   57   65   57   65 movsq
16: len  256 ok  119   78   78   78   79   78   79   78   79   78 movsq
17: len  512 ok   81   83   82   83   82   82   82   83   82   82 movsq
18: len 1024 ok   91   91   91   91   91   91   91   91   91   91 movsq
19: len 2048 ok  107  107  107  107  107  107  107  107  107  107 movsq
20: len   16 ok  110   62   56   32   32   32   32   32   32   32 longs
21: len  256 ok  203  128   58   57   57   57   57   47   47   47 longs
22: len  512 ok   97  152  190   95   65   63   65   63   65   63 longs
23: len 1024 ok  226  185  155  100   99   98  100   98   99   98 longs
24: len 2048 ok  201  262  260  179  171  166  170  169  171  166 longs

I added enough barrier() and OPTIMIZER_HIDE_VAR() to get the 'longs'
loop to be sane - it sets/copies two 64bit locations each iteration.
Both tests manage a loop iteration every clock (on zen5).

The cutoff for 'rep stos' is pretty much 1k.
For memcpy() it is a bit lower.

'rep movsq' is slightly slower than 'rep movsb' because of the 'len /= 8'.
But it is much slower for counts of 1 (included above) and 0.

I need to boot up one of my other systems to see how older Intel cpu fair.

David

> 
> > If the count is variable - likely in real life, you'll get a branch
> > misprediction penalty (about 20 clocks on zen5) every time you change
> > between the two choices.
> > The copy loop will have another mispredict penalty for the loop itself.
> > 
> > So you are likely to get an overall improvement if you use 'rep stos'
> > for all lengths - even the ones for with it is slightly slower.
> > Unless, that is, you know at compile time that most of the length
> > will be short.  
> 
> 
> I timed every stackleak_erase() in a Zen 5c guest running a
> futex, epoll, procfs and unix socket mix, with the variants switchable
> at runtime and alternated over 15 rounds:
> 
>   Unpatched                     68.3 ns per erase
>   REP STOSQ for all lengths     47.3 ns
>   v1 / v2.1 (loop up to 512 B)  46.6 ns
>   v2.2 (4 stores/iteration)     43.7 ns
> 
> The spans aren't random. Unix socket and /proc/self/stat exits were over
> 1 KiB every time, while getppid(), epoll_wait(), read() and write() exits
> were under 128 bytes almost everytime.
> 
> My preference still is v2.1 because of the simplicity.
> 
> > 
> > David
> >   
> >>
> >> The fill is inline asm, so the noinstr function still makes no calls.
> >> memset64() would be the same instruction, but it is only static inline,
> >> and with KMSAN it is an out-of-line function.
> >>
> >> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
> >> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
> >> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> >> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>
> >> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> >> index 77488ff5eb8c7c..049231d484ad0e 100644
> >> --- a/arch/x86/include/asm/processor.h
> >> +++ b/arch/x86/include/asm/processor.h
> >> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
> >>  			       current_stack_pointer) < THREAD_SIZE;
> >>  }
> >>  
> >> +#ifdef CONFIG_X86_64
> >> +#define __stackleak_poison __stackleak_poison
> >> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> >> +					       unsigned long erase_high,
> >> +					       unsigned long poison)
> >> +{
> >> +	unsigned long count;
> >> +
> >> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> >> +	if (erase_high <= erase_low + 512) {
> >> +		while (erase_low < erase_high) {
> >> +			*(unsigned long *)erase_low = poison;
> >> +			erase_low += sizeof(unsigned long);
> >> +		}
> >> +		return;
> >> +	}
> >> +
> >> +	count = (erase_high - erase_low) / sizeof(unsigned long);
> >> +	asm volatile("rep stosq"
> >> +		     : "+D" (erase_low), "+c" (count)
> >> +		     : "a" (poison)
> >> +		     : "memory");
> >> +}
> >> +#endif
> >> +
> >>  #ifdef CONFIG_PARAVIRT_XXL
> >>  #include <asm/paravirt.h>
> >>  #else  
> >   
> 


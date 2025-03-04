Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3120A5F3
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121578; cv=none; b=R6nsjeHtaIAstVXAuRoDVf+uKAM11ysRhvXm/q9HT+0h89A/fgz+p/X7OKVOsKiW2EtQ0a4BYbaPvWqMVshyLhytr5s9xrDHDxLiglsK/xH/tCrzGXjzG7cpIM+710SwSgZ6w7CPjU+Mfw8oi+Vs4WEn1mK8JfQLoT+UKRzH3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121578; c=relaxed/simple;
	bh=8TGIq1q44b+qp3FLCmZL7K9wxstC6+u4YmdJY/0I/fY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNyrRMNwfsiFsw6+mRKkcwFFJym0Dfo7eZgEYeAMkCT3KINbFdoTH3ro81lsbmmju6HyYNG1ypyyXH7Nl89uaTwGQNH5uTrSr3t3QI8QtHUkKggMDFUpMSr9AIeLHMuj2EaPFfIdfHr4QbdxTedbgvAP5N9UlYEumRAua70UDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE7B6HgY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE7B6HgY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso41680055e9.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 12:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741121575; x=1741726375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+Cr75GHycePdmToZOthHca+hof6tEcpP1zkSAQCixM=;
        b=YE7B6HgYbukyEeH9K9dSs+ypL64cSj6SH25C896zMKh6/hotlzpfdhdbB3Fa+De1iS
         CKHoqCnBL1vhIKuhWtSXmu8sUrt2eaFryb2J+HlNWVCsof+qsVwQm8s33SETiPr6Gt8L
         f1VZzc8Tvc/vW3BMAIPFHSq9Vv10eJ4yI4EPGqxICwHbq64zHgxcx0xIJRIuZZSYkWOX
         DgRBQTSHnNxvuWqyLOUG/8mEE1IS8CjonGiDe4kZUapGQdbLQZqNiXqnGSiLc9epJrWG
         nSW6VKmCtDFEntDOBt0WRQ1qJELC2goxpHr2SbH3wdCrCSQmdjgYrVUygA+Ag3JvVtki
         u0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121575; x=1741726375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+Cr75GHycePdmToZOthHca+hof6tEcpP1zkSAQCixM=;
        b=ICyURzMN1H5Q4apymvHZmSHAa43mBRz+TWKBWwvl/Mp6DQH9JARz0Bd+WYhPaxSp+c
         4tVQmPTQ4SqPSSzU7FmE7gYDn2Fh/4nkaFVM5Xut7AvNuFiWvahqL2VMtvGYV7kn2gRr
         bonB7QpaS0GN8Nv+wR4eaBy3DWMB4MxtRtRItOC0YnV/NPOyHsBGpAPXbT1fVVUxFwhL
         u5k113ECkYoTUgv3Q9pe8/VRgH8mj8hFvm6osCC+wiX4EvNTe8Ko/53Z0KVQWlOlpfXW
         RVm+eV2uPE173Se7YaqnQWMNwArj8Ma6khmZdJXLYa3BI2qYe91gCGVfSCY21vdrjv0V
         9czA==
X-Forwarded-Encrypted: i=1; AJvYcCXOF8cD0GDvy4ItcqZRd8rFbURWrDb/aYquINtqUUwxnHumv+Y2DwIThzgYxsms4DI7rD4N@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9xHYEZPgoQAFy7GdnEk/cQFUXGOG51Hi26L1lvDNQafjWAEBK
	R19SlHn/rU+XJV8qAL+4j2mHsH2g3r6RwOpoc/XnfV60w22sEoI7
X-Gm-Gg: ASbGncvBWrU1sD3jld19HN75ybhWpgodAUi3pA5p3pdQHdCgqgCgo3ePZSib5xz/zOh
	bWF+EhK0LrmBxzB3PCVP0avQcfMP/807X4MG99kPa0BlKBR+KVY4RLa3/5bq9YC9vMoggwltaAd
	XWMRIEII0cjTA+CZgzIynEJ9JRKDkfAHmNVfreWRWW2DEWECFS1tkCLTxlyYH3FpxoTR+kMOYv7
	wXKQ/jz26uPcSyS+SeK6ygI/TDxmt67TPY8lh7bYzX7sRcnOPvcxMD8Tc6KFA9qhtg3JogvazNp
	7fAiWGSp9Is8lkLedjMoePv3aVFCSkGhq5NQPqJAEctzNEE5UxRch2V/v+2cQCk+lK9Yr67hdYo
	alB2mFoI=
X-Google-Smtp-Source: AGHT+IG4gl9/y2mSBBQeEvhJ/k5Q2wNPs8UzTb/dxy71zQ14qKO+eanVQBwO22bXET0n7B3/dGWkVw==
X-Received: by 2002:a05:600c:4f84:b0:439:a138:1d with SMTP id 5b1f17b1804b1-43bd29b8545mr1955695e9.22.1741121574529;
        Tue, 04 Mar 2025 12:52:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f990esm217040815e9.5.2025.03.04.12.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:52:53 -0800 (PST)
Date: Tue, 4 Mar 2025 20:52:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] x86/crc32: use builtins to improve code generation
Message-ID: <20250304205252.59a04955@pumpkin>
In-Reply-To: <20250304043223.68ed310f@pumpkin>
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
	<CAGG=3QVkd9Vb9a=pQ=KwhKzGJXaS+6Mk5K+JtBqamj15MzT9mQ@mail.gmail.com>
	<20250303201509.32f6f062@pumpkin>
	<CAGG=3QV1iDn2r39v5eroO+kCvpbmJNtSeqJS+fpwb4vBG67z=w@mail.gmail.com>
	<20250303224216.30431b1d@pumpkin>
	<7BC89461-A060-462A-9B42-7C0138AA0307@zytor.com>
	<CAGG=3QUnUQL2=YxN2ozwSba2A_x-S7sAEUP5oGhCWOzu4Q9SQA@mail.gmail.com>
	<20250304043223.68ed310f@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Mar 2025 04:32:23 +0000
David Laight <david.laight.linux@gmail.com> wrote:

....
> > For reference, GCC does much better with code gen, but only with the builtin:
> > 
> > .L39:
> >         crc32q  (%rax), %rbx    # MEM[(long unsigned int *)p_40], tmp120
> >         addq    $8, %rax        #, p
> >         cmpq    %rcx, %rax      # _37, p
> >         jne     .L39    #,  
> 
> That looks reasonable, if Clang's 8 unrolled crc32q is faster per byte
> then you either need to unroll once (no point doing any more) or use
> the loop that does negative offsets from the end.

Thinking while properly awake the 1% difference isn't going to be a
difference between the above and Clang's unrolled loop.
Clang's loop will do 8 bytes every three clocks, if the above is slower
it'll be doing 8 bytes in 4 clocks (ok, you can get 3.5 - but unlikely)
which would be either 25% or 33% depending which way you measure it.

...
> I'll find the code loop I use - machine isn't powered on at the moment.

#include <linux/perf_event.h>
#include <sys/mman.h>
#include <sys/syscall.h>

static int pmc_id;
static void init_pmc(void)
{
        static struct perf_event_attr perf_attr = {
                .type = PERF_TYPE_HARDWARE,
                .config = PERF_COUNT_HW_CPU_CYCLES,
                .pinned = 1,
        };
        struct perf_event_mmap_page *pc;

        int perf_fd;
        perf_fd = syscall(__NR_perf_event_open, &perf_attr, 0, -1, -1, 0);
        if (perf_fd < 0) {
                fprintf(stderr, "perf_event_open failed: errno %d\n", errno);
                exit(1);
        }
        pc = mmap(NULL, 4096, PROT_READ, MAP_SHARED, perf_fd, 0);
        if (pc == MAP_FAILED) {
                fprintf(stderr, "perf_event mmap() failed: errno %d\n", errno);
                exit(1);
        }
        pmc_id = pc->index - 1;
}

static inline unsigned int rdpmc(id)
{
        unsigned int low, high;

// You need something to force the instruction pipeline to finish.
// lfence might be enough.
#ifndef NOFENCE
        asm volatile("mfence");
#endif
        asm volatile("rdpmc" : "=a" (low), "=d" (high) : "c" (id));
#ifndef NOFENCE
        asm volatile("mfence");
#endif

        // return low bits, counter might to 32 or 40 bits wide.
        return low;
}

The test code is then something like:
#define PASSES 10
        unsigned int ticks[PASSES];
        unsigned int tick;
        unsigned int i;

        for (i = 0; i < PASSES; i++) {
                tick = rdpmc(pmc_id);
                test_fn(buf, len);
                ticks[i] = rdpmc(pmc_id) - tick;
        }

        for (i = 0; i < PASSES; i++)
                printf(" %5d", ticks[i]);

Make sure the data is in the l1-cache (or that dominates).
The values output for passes 2-10 are likely to be the same to within
a clock or two.
I probably tried to subtract an offset for an empty test_fn().
But you can easily work out the 'clocks per loop iteration'
(which is what you are trying to measure) by measuring two separate
loop lengths.

I did find that sometimes running the program gave slow results.
But it is usually very consistent.
Needs to be run as root.
Clearly a hardware interrupt will generate a very big number.
But they don't happen.

The copy I found was used for measuring ip checksum algorithms.
Seems to output:
$ sudo ./ipcsum 
                0     0   160   160   160   160   160   160   160   160   160   160  overhead
 3637b4f0b942c3c4  682f   316    25    26    26    26    26    26    26    26    26  csum_partial
 3637b4f0b942c3c4  682f   124    79    43    25    25    25    24    26    25    24  csum_partial_1
 3637b4f0b942c3c4  682f   166    43    25    25    24    24    24    24    24    24  csum_new adc pair
 3637b4f0b942c3c4  682f   115    21    21    21    21    21    21    21    21    21  adc_dec_2
 3637b4f0b942c3c4  682f    97    34    31    23    24    24    24    24    24    23  adc_dec_4
 3637b4f0b942c3c4  682f    39    33    34    21    21    21    21    21    21    21  adc_dec_8
 3637b4f0b942c3c4  682f    81    52    49    52    49    26    25    27    25    26  adc_jcxz_2
 3637b4f0b942c3c4  682f    62    46    24    24    24    24    24    24    24    24  adc_jcxz_4
 3637b4f0b942c3c4  682f   224    40    21    21    23    23    23    23    23    23  adc_2_pair
 3637b4f0b942c3c4  682f    42    36    37    22    22    22    22    22    22    22  adc_4_pair_old
 3637b4f0b942c3c4  682f    42    37    34    41    23    23    23    23    23    23  adc_4_pair
 3637b4f0b942c3c4  682f   122    19    20    19    18    19    18    19    18    19  adcx_adox
        bef7a78a9  682f   104    51    30    30    30    30    30    30    30    30  add_c_16
        bef7a78a9  682f   143    50    50    27    27    27    27    27    27    27  add_c_32
        6ef7a78ae  682f   103    91    45    34    34    34    35    34    34    34  add_c_high

I don't think the current one is in there - IIRC it is as fast as the adcx_adox one
but more portable.


	David
 



Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB627136E3F
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 03:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742701800; cv=none; b=N4d0djq4GmgddrrUYPjxzD5S42xnO4f8EnEXv62Oc06FI/saAgzqliOitDlXun9qlYOkQqsHG9UbI99LwX1kIE+s5HA8YBCA6nBHGiJl2DWnuX/L8xzjb41Zu/mL1pCeMMDLIWsKXi+N/iuANXUyNrTJhExOnGLt6G+M75N7wRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742701800; c=relaxed/simple;
	bh=xLM6LykXakU9e8TajiIjcM/MXZewxiiJE85ejB3akTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZNA211N/jBXSmZrYvq51PlsTNPSXyxtuTs0p6AogcP/jwjXgQ3RrhmAlJRDN5ZcuUVaYSmYHWRBdY/20ZqlaoXCHNR1BmpYvkpl4hgI8c66ZKIquE0dbugz638BorBgIY4Wf0vT4ie47gV6reIdUx+tfXtlT8tzKjn14NM77Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS/u5Q7q; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS/u5Q7q"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-6efe4e3d698so29276937b3.0
        for <llvm@lists.linux.dev>; Sat, 22 Mar 2025 20:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742701798; x=1743306598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0FRMX9aBKnekAkOBfw/gbWkw+xrCQaz5CvPCEHncCk=;
        b=eS/u5Q7qBMhUVDFyaI0sz5Ei4GJyRe80N47dXshixk5UPUNHWZE43nSAUG6NCc8FqG
         Wf+o8lzOx4+TsHsYIGsnRJKnQxVDUC7KtVwl33qYxRHmbUr4yootBHLjbzkgSLgk6516
         9l6OHDyaMFWF8I4K8/XfEEZ+14a87CKg4AEtRwCtk7Se7+5CI23qu5scHINlqaRJwIMz
         to+NUcxRQxBDLLVedLoC36jGIa26VTFtdGoXpSQ3YOGxusX5H5+nRJqTnFwxAmFWN4De
         Vxjf4TcA52WMZ1pFX7xm7mG45Ttk6/jhZ1nOyHtZJKcA6DYQOWLQpzzlwt8nahQ+6S2t
         aJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742701798; x=1743306598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0FRMX9aBKnekAkOBfw/gbWkw+xrCQaz5CvPCEHncCk=;
        b=AEUQTXGOZq8ag0si/UNEhoAePHXqlLWwEVgY6bu/n9V0qrii87cMBXX24IbVkIuEoQ
         x3qUC3I05hEYcphbIvGbhgo80fko2zmLwGRqtjx5uof7oxX1ZCvaZg55CEr41i3gKuCU
         FHG7kXn6tIOsd/u5MVMe+oJpjcR0pMhHQi3sf1CuDM4mSoq3Hl5QsAuslESVQ8U7TKz/
         jHGqZ+JPXpGKd0fVGMFfNdTGySqECWbqUse3RgCaKFmqV1xNJ8mF9IA9fe2Ar9I1MMtp
         KcoClOhm8INyjTDOyRHpkb2d3xdTF/AP2NELWIVWggkK3gjwWj9AFbVwxw2tnlmsGG//
         mMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVmzErfMzzTvVx7IN2ZUNrXePYH6XO1j9prn87wpegoQKdKDY3HLLtJBD183JqiL/DHgggE@lists.linux.dev
X-Gm-Message-State: AOJu0YzRl1DwhIGHAKwNiU2hEtK+twMtEivCLPoH3SPzmdJtbVY61vGB
	DFZAucxLU5cqR5314vbypc+Sk8o5ngI+cD2FvQk/QgNvqS84sUrIpVvFqeuRCbDNIF8edOAo7qG
	LYqXiKM3VONe7/t+9AP0Jrk2YWDs=
X-Gm-Gg: ASbGncuCHU9N1/yFuXAGSoFfUxNlEoByeOBb59L03aksHVROBDVlwPfOSz8+A9+3CuP
	khUm7kafSuU39p1wATgIp2rk1/urNbmTDvbfOjfErE2MirniTSFtMtLb8wFgWUuSnLmcX7r/pzv
	SJ9TmeRRmUNaW/4Zj03mPY1q/Q9A==
X-Google-Smtp-Source: AGHT+IHrRRGwnzoEVm9rPtAOLwXv3Ds9wIlF/k9E56Cd7/IsdGAe157sqosMk0nWoRQCnTz/jDyzC+GOxDdPuG1Zei0=
X-Received: by 2002:a05:690c:64c8:b0:6ff:28b2:50bd with SMTP id
 00721157ae682-700babfd2e1mr111396127b3.2.1742701797513; Sat, 22 Mar 2025
 20:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
 <20250305100306.4685333a@gandalf.local.home> <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
 <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com> <CADxym3YMeAPpc+ozM2E7yW1qpB_arKJiDyAcRs8pW8sRqJZOZw@mail.gmail.com>
In-Reply-To: <CADxym3YMeAPpc+ozM2E7yW1qpB_arKJiDyAcRs8pW8sRqJZOZw@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Sun, 23 Mar 2025 11:51:41 +0800
X-Gm-Features: AQ5f1JrZYkyvJMf2b6Drb-R-P7CuIuoIpnCVtLn7V-eAwU_iQgNyMkTt6IvDE_Q
Message-ID: <CADxym3aRTo0GfhfTKKxbig+QmrGfiBGoqs-Rtr6y_WFzNpgmgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, dongml2@chinatelecom.cn, 
	Mike Rapoport <rppt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 4:50=E2=80=AFPM Menglong Dong <menglong8.dong@gmail.=
com> wrote:
>
> On Thu, Mar 6, 2025 at 11:39=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Wed, Mar 5, 2025 at 6:59=E2=80=AFPM Menglong Dong <menglong8.dong@gm=
ail.com> wrote:
> > >
> > > I'm not sure if it works. However, indirect call is also used
> > > in function graph, so we still have better performance. Isn't it?
> > >
> > > Let me have a look at the code of the function graph first :/
> >
> > Menglong,
> >
> > Function graph infra isn't going to help.
> > "call foo" isn't a problem either.
> >
> > But we have to step back.
> > per-function metadata is an optimization and feels like
> > we're doing a premature optimization here without collecting
> > performance numbers first.
> >
> > Let's implement multi-fentry with generic get_metadata_by_ip() first.
> > get_metadata_by_ip() will be a hashtable in such a case and
> > then we can compare its performance when it's implemented as
> > a direct lookup from ip-4 (this patch) vs hash table
> > (that does 'ip' to 'metadata' lookup).
>
> Hi, Alexei
>
> You are right, I should do such a performance comparison.
>
> >
> > If/when we decide to do this per-function metadata we can also
> > punt to generic hashtable for cfi, IBT, FineIBT, etc configs.
> > When mitigations are enabled the performance suffers anyway,
> > so hashtable lookup vs direct ip-4 lookup won't make much difference.
> > So we can enable per-function metadata only on non-mitigation configs
> > when FUNCTION_ALIGNMENT=3D16.
> > There will be some number of bytes available before every function
> > and if we can tell gcc/llvm to leave at least 5 bytes there
> > the growth of vmlinux .text will be within a noise.

Hi, Alexei

I have finished the demo of the tracing multi-link recently.
The code is not ready to be sent out, as it's very very ugly
for now, and I did some performance testing.

The test case is very simple. I defined a function "kfunc_md_test",
and called it 10000000 times in "do_kfunc_md_test". And I will
attach my empty bpf program of attach type BPF_FENTRY_MULTI
to it. Following is the code of the test case:

-----------------------------------------kernel
part--------------------------------
int kfunc_md_test_result =3D 0;
noinline void kfunc_md_test(int a)
{
    kfunc_md_test_result =3D a;
}

int noinline
do_kfunc_md_test(const struct ctl_table *table, int write,
                void *buffer, size_t *lenp, loff_t *ppos)
{
    u64 start, interval;
    int i;

    start =3D ktime_get_boottime_ns();
    for (i =3D 0; i < 10000000; i++)
        kfunc_md_test(i);

    interval =3D ktime_get_boottime_ns() - start;
    pr_info("%llu.%llums\n",
        interval / 1000000, interval % 1000000);

    return 0;
}

---------------------------------------bpf
part-----------------------------------------
SEC("fentry.multi/kfunc_md_test")
int BPF_PROG(fentry_manual_nop)
{
    return 0;
}
------------------------------------bpf part
end-------------------------------------

I did the testing for BPF_FENTRY, BPF_FENTRY_MULTI and
BPF_KPROBE_MULTI, and following is the results:

Without any bpf:
---------------------------------------------------------------------------=
-----------
9.234677ms
9.486119ms
9.310059ms
9.468227ms
9.217295ms
9.500406ms
9.292606ms
9.530492ms
9.268741ms
9.513371ms

BPF_FENTRY:
---------------------------------------------------------------------------=
-------------
80.800800ms
79.746338ms
83.292012ms
80.324835ms
84.25841ms
81.67250ms
81.21824ms
80.415886ms
79.910556ms
80.427809ms

BPF_FENTRY_MULTI with function padding:
---------------------------------------------------------------------------=
------------
120.457336ms
117.854154ms
118.888287ms
119.726011ms
117.52847ms
117.463910ms
119.212126ms
118.722216ms
118.843222ms
119.166079ms

It seems that the overhead of BPF_FENTRY_MULTI is more
that BPF_FENTRY. I'm not sure if it is because of the "indirect
call". However, it's not what we want to discuss today, so let's
focus on the performance of the function metadata basing on
"function padding" and "hash table".

Generally speaking, the overhead of the BPF_FENTRY_MULTI
with the hash table has a linear relation. The hash table that I
used is exactly the same to the filter_hash that ftrace uses, and
the array length is 1024. I didn't do that statistics basing on the
function number, but the hash table looking up count, as I find
that the hash is not random enough some times. However, we
can compute the kernel function number if we image the hash
is random enough.

BPF_FENTRY_MULTI with hash table:
---------------------------------------------------------------------------=
-------
1(1k)                    16(32k)
--------------------    --------------------
124.950881ms    235.24341ms
124.171226ms    232.20816ms
123.969627ms    232.212086ms
125.803975ms    230.935175ms
124.256777ms    230.906713ms
124.314095ms    234.551623ms
124.165637ms    231.435496ms
124.488003ms    230.936458ms
125.571929ms    230.753203ms
124.168110ms    234.679152ms

(The 1 and 16 above means that the hash lookup times is
1 and 16, 1k and 32k means the corresponding kernel function
count that we trace.)

According to my testing, the hash table will have a slight overhead
if the kernel functions that we trace are no more than 5k. And
I think this is the most use case, according to the people who are
interested in tracing multi-link. When the function count up to 32k,
the overhead is obvious.

According to my research, the kprobe-multi/fprobe also based on
the hash table, which will lookup the callback ops with the function
address in a hash table, and the overhead is heavy too. And I alse
did the kprobe-multi performance. I run the test case
"kprobe_multi_bench_attach/kernel", and do the "kfunc_md_test"
meanwhile, just like what I did for BPF_FENTRY_MULTI:

BPF_KPROBE_MULTI:
---------------------------------------------------------------------------=
--------
36895.985224ms
37002.298075ms
30150.774087ms

The kernel function count is 55239 in the kprobe-multi testing.
I'm not sure if there is something wrong with my testing, but
the overhead looks heavy.

So I think maybe it works to fallback to the hash table if
CFI/FINEIBT/... are enabled? I would be appreciated to
hear some advice here.

(BTW, I removed most CCs to reduce the noise :/)

Thanks!
Menglong Dong

---------------------------------------------------------------------------=
----
---------------------------------------------------------------------------=
----

Following is the bpf global trampoline(x86, demo and ugly):
---------------------------------------------------------------------------=
------
#define FUNC_ARGS_SIZE        (6 * 8)
#define FUNC_ARGS_OFFSET    (-8 - FUNC_ARGS_SIZE)
#define FUNC_ARGS_1        (FUNC_ARGS_OFFSET + 0 * 8)
#define FUNC_ARGS_2        (FUNC_ARGS_OFFSET + 1 * 8)
#define FUNC_ARGS_3        (FUNC_ARGS_OFFSET + 2 * 8)
#define FUNC_ARGS_4        (FUNC_ARGS_OFFSET + 3 * 8)
#define FUNC_ARGS_5        (FUNC_ARGS_OFFSET + 4 * 8)
#define FUNC_ARGS_6        (FUNC_ARGS_OFFSET + 5 * 8)

/* the args count, rbp - 8 * 8 */
#define FUNC_ARGS_COUNT_OFFSET    (FUNC_ARGS_OFFSET - 1 * 8)
#define FUNC_ORIGIN_IP        (FUNC_ARGS_OFFSET - 2 * 8) /* -9 * 8 */
#define RBX_OFFSET        (FUNC_ARGS_OFFSET - 3 * 8)

/* bpf_tramp_run_ctx, rbp - BPF_RUN_CTX_OFFSET */
#define BPF_RUN_CTX_OFFSET    (RBX_OFFSET - BPF_TRAMP_RUN_CTX_SIZE)
#define KFUNC_MD_OFFSET        (BPF_RUN_CTX_OFFSET - 1 * 8)
#define STACK_SIZE        (-1 * KFUNC_MD_OFFSET)

.macro tramp_restore_regs
    movq FUNC_ARGS_1(%rbp), %rdi
    movq FUNC_ARGS_2(%rbp), %rsi
    movq FUNC_ARGS_3(%rbp), %rdx
    movq FUNC_ARGS_4(%rbp), %rcx
    movq FUNC_ARGS_5(%rbp), %r8
    movq FUNC_ARGS_6(%rbp), %r9
    .endm

SYM_FUNC_START(bpf_global_caller)
    pushq %rbp
    movq %rsp, %rbp
    subq $STACK_SIZE, %rsp

    /* save the args to stack, only regs is supported for now */
    movq %rdi, FUNC_ARGS_1(%rbp)
    movq %rsi, FUNC_ARGS_2(%rbp)
    movq %rdx, FUNC_ARGS_3(%rbp)
    movq %rcx, FUNC_ARGS_4(%rbp)
    movq %r8, FUNC_ARGS_5(%rbp)
    movq %r9, FUNC_ARGS_6(%rbp)

    /* save the rbx, rbp - 9 * 8 */
    movq %rbx, RBX_OFFSET(%rbp)

    /* get the function address */
    movq 8(%rbp), %rdi
    /* subq $(4+5), %rdi */
    /* save the function ip */
    movq %rdi, FUNC_ORIGIN_IP(%rbp)

    call kfunc_md_find
    cmpq $0, %rax
    jz out
    /* kfunc_md, keep it in %rcx */
    movq %rax, %rcx

    /* fentry bpf prog */
    cmpq $0, KFUNC_MD_FENTRY(%rcx)
    jz out

    /* load fentry bpf prog to the 1st arg */
    movq KFUNC_MD_FENTRY(%rcx), %rdi
    /* load the pointer of tramp_run_ctx to the 2nd arg */
    leaq BPF_RUN_CTX_OFFSET(%rbp), %rsi
    /* save the bpf cookie to the tramp_run_ctx */
    movq KFUNC_MD_COOKIE(%rcx), %rax
    movq %rax, BPF_COOKIE_OFFSET(%rsi)
    call __bpf_prog_enter_recur
    /* save the start time to rbx */
    movq %rax, %rbx

    /* load fentry JITed prog to rax */
    movq BPF_FUNC_OFFSET(%rdi), %rax
    /* load func args array to the 1st arg */
    leaq FUNC_ARGS_OFFSET(%rbp), %rdi

    /* load and call the JITed bpf func */
    call *%rax

    /* load bpf prog to the 1st arg */
    movq KFUNC_MD_FENTRY(%rcx), %rdi
    /* load the rbx(start time) to the 2nd arg */
    movq %rbx, %rsi
    /* load the pointer of tramp_run_ctx to the 3rd arg */
    leaq BPF_RUN_CTX_OFFSET(%rbp), %rdx
    call __bpf_prog_exit_recur
out:
    tramp_restore_regs

    movq RBX_OFFSET(%rbp), %rbx
    addq $STACK_SIZE, %rsp
    popq %rbp
    RET

SYM_FUNC_END(bpf_global_caller)
STACK_FRAME_NON_STANDARD_FP(bpf_global_caller)

>
> Sounds great! It's so different to make the per-function metadata
> work in all the cases. Especially, we can't implement it in arm64
> if CFI_CLANG is enabled. And the fallbacking to the hash table makes
> it much easier in these cases.
>
> >
> > So let's figure out the design of multi-fenty first with a hashtable
> > for metadata and decide next steps afterwards.
>
> Ok, I'll develop a version for fentry multi-link with both hashtable
> and function metadata, and do some performance testing. Thank
> you for your advice :/
>
> Thanks!
> Menglong Dong

Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91813D279
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741137650; cv=none; b=r4jNgooU/Wsv+i/Hyn8+749/b2EUFbYJcw0inC4ka7Iar+7UFJvsGI9VbsIZ9DLeCSlYGsceIgHf2sa0RW3sd0moIhXKC3eYV8yjo9qYopVGgYnADAEqAJyOIErd3LlMQ344DBrfed/2sH2KEzkS8mW3GK5Az8oATqWcByjt9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741137650; c=relaxed/simple;
	bh=xqfh+/z+RQyzw3ZjPbcTSHPRwuHVteqzMjyMDRsSiD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYMOxTpLIB/WfEeNCMCKaF7AuBoUrpgfm1U02Gph19JzzTWDw9UCyrLzrfJeQcEXJBTCL1PM7uMNSmvoFPgGfxT7hivchh2jM1ne1egCXEQ92Droxct5T/4rk9MVj0YuzesOWSbNGshYjD0BlT5Yj2DOGi34yWZvwVtmNxGLE4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcabK76y; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcabK76y"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-6ef7c9e9592so48173127b3.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 17:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741137647; x=1741742447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=;
        b=WcabK76y0wqGS2TxQc+LJOkvTmqDSORxGZUexHFUNgm6sscJ7yInsdBzbHRDhWsd9c
         1lu635VEt8tNsEsah9w+H5vqjK/9IFOTLuCuIguxFZMz5XyWYd+Ddt3iNPh4thoZyz/z
         u8OSjJGSbKDxRG1XqbLgk8QWrD7Wc2Kuy5pkvN6xsoPmr8Igy8oN48UtqNukJIy4U5cX
         yD7WxJ9MXV7zleaEHOALkSrFrSshK8JhADWnops04tZprClrOkV001QCA1bwntGj2uIV
         Pviw221Ip/eWTewKZzCUafuBjqd9CEEzLZWeMuR+yB4aVgNhxV9qdi2rw69kT5ivhB1H
         PSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741137647; x=1741742447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=;
        b=n2rJ/VKUERaQEoqvTgq+0+XSH8gZPK8cyOBzUv740gm8kBHN1pCcZjm+TDfu9IrTnS
         9HtN/FAA3ZgW3STHlpiM3Ed9ZZL4gLzfKvTvMvpEQJWGS0wLC4fUtak8A8lddBo5IJ+2
         ZsZ/7cOL1AwA9oJ41I+jr6XI8SYFmkbnx4QJ5Ibj9agTuXA10wPgRw1eibqGat9x4ozD
         pLA1i6UCPC4nl8QeG5ClGgNX5cSzJvcS1yWNXsdv0DlyxhBq8uN92cfvLtWlbKks/lX1
         QzmSvzLrB4eE1PJe2dGsRFslgYzKJs234bWqmkDx+354SKTeQ7LZ+eIr6nSrXXu5ZdSq
         YMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpH8UjfwH3Fci2/oir4c6/FI+OGTu+amGU1A4ieJn8DQRfLV48gFqWsD2Lvd1yVqYsNIpM@lists.linux.dev
X-Gm-Message-State: AOJu0YxRPorvnSkAAn5wBclF3yHvsdLd5pw2ze9Z34NajeufDGokdPzw
	hDZCjJWUD9poWqzstoQ+SENgqYxDZUGnmSoPjoFvF2RVNEjAzq6ACrRDSw8cC03WvKN+S/EqpsD
	RdKwS7Q49qsiAhFjxK9HfUDeoB28=
X-Gm-Gg: ASbGncsTjUn7HlwOJxsuDnZBk5MOPMQO6BNwCIagGp+sWyVyq0GMoO4diHJ2LDiMqUm
	SxZtkvK09+3jSH+vXILZX4BkNRmu3yyw6Q7dglZRd0KSRsMjWilD4fKcRtHbMKcYXbj5bR8G9XM
	x0EO1lUBBYjB/QCd2wJ5pARHfnBA==
X-Google-Smtp-Source: AGHT+IEUFgZnl6Hm/lrUNqrNCPW/Rgad0I4A7NRpQso6+OmPGRY6t9+y0nrp+PzU9oYzztzRMxurMDXN8Jy0BacmWdM=
X-Received: by 2002:a05:690c:3690:b0:6fb:a376:3848 with SMTP id
 00721157ae682-6fda315fdfbmr21998337b3.34.1741137647462; Tue, 04 Mar 2025
 17:20:47 -0800 (PST)
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
In-Reply-To: <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Wed, 5 Mar 2025 09:19:09 +0800
X-Gm-Features: AQ5f1JovIrYFizMaqP4MsodnwT5N7qb6QoTLb6VyR_6OCJq8SQkboYm5nSKxxpw
Message-ID: <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 10:53=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> >On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
> >> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> >> worst case is to increase ~2.2%.
> >>
> >> What do you think?
> >
> >Well, since I don't understand what you need this for at all, I'm firmly
> >on the side of not doing this.
> >
> >What actual problem is being solved with this meta data nonsense? Why is
> >it worth blowing up our I$ footprint over.
> >
> >Also note, that if you're going to be explaining this, start from
> >scratch, as I have absolutely 0 clues about BPF and such.
>
> I would appreciate such information as well. The idea seems dubious on th=
e surface.

Ok, let me explain it from the beginning. (My English is not good,
but I'll try to describe it as clear as possible :/)

Many BPF program types need to depend on the BPF trampoline,
such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
BPF_PROG_TYPE_LSM, etc. BPF trampoline is a bridge between
the kernel (or bpf) function and BPF program, and it acts just like the
trampoline that ftrace uses.

Generally speaking, it is used to hook a function, just like what ftrace
do:

foo:
    endbr
    nop5  -->  call trampoline_foo
    xxxx

In short, the trampoline_foo can be this:

trampoline_foo:
    prepare a array and store the args of foo to the array
    call fentry_bpf1
    call fentry_bpf2
    ......
    call foo+4 (origin call)
    save the return value of foo
    call fexit_bpf1 (this bpf can get the return value of foo)
    call fexit_bpf2
    .......
    return to the caller of foo

We can see that the trampoline_foo can be only used for
the function foo, as different kernel function can be attached
different BPF programs, and have different argument count,
etc. Therefore, we have to create 1000 BPF trampolines if
we want to attach a BPF program to 1000 kernel functions.

The creation of the BPF trampoline is expensive. According to
my testing, It will spend more than 1 second to create 100 bpf
trampoline. What's more, it consumes more memory.

If we have the per-function metadata supporting, then we can
create a global BPF trampoline, like this:

trampoline_global:
    prepare a array and store the args of foo to the array
    get the metadata by the ip
    call metadata.fentry_bpf1
    call metadata.fentry_bpf2
    ....
    call foo+4 (origin call)
    save the return value of foo
    call metadata.fexit_bpf1 (this bpf can get the return value of foo)
    call metadata.fexit_bpf2
    .......
    return to the caller of foo

(The metadata holds more information for the global trampoline than
I described.)

Then, we don't need to create a trampoline for every kernel function
anymore.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata, which can make the performa=
nce
much better.

The per-function metadata storage is a basic function, and I think there
may be other functions that can use it for better performance in the featur=
e
too.

(Hope that I'm describing it clearly :/)

Thanks!
Menglong Dong

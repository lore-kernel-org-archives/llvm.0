Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D963D1CC5
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081623; cv=pass; b=btw74sffBxWx2Qq/denhnJDfLpXQLgRLgN0YPi3MLpjXrvZz5A02nXrU91c21Z1k+mngPx1hDjS5LT/+/2O+nGycFrGVAD9qUtuB/JgQnchhKgbFSElR3/U9dt7dFQe8FwSZQPPb9sRX2gdztJGWpdaOyf9lNfPUTG4KUUKz5Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081623; c=relaxed/simple;
	bh=GUfkYu7J9XEsKoG+enQvpADK4Syud+mLtRMB/3CPQ1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyqeZSaDxlAxyGn66uueJ95YG/T2rU34zT4zKA++VwnbV5n4HJnuTFXtA45wuW0eh3daVffmPQnf0kqY5bC+PVOWdLOijq6oC387HY2DDyL05PCt5sBSZ2AguJ2PAEtv58E4YvxfUhN7NKDi2XAY1O9hhGc0MnWk+LPbiufJml4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zw6QOoQ6; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zw6QOoQ6"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44cc65b0a7fso1184181fac.0
        for <llvm@lists.linux.dev>; Fri, 03 Jul 2026 05:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081621; cv=none;
        d=google.com; s=arc-20260327;
        b=QRJXGGate7nLGPYcbb05crD5GJTKPaSWVLgyW+yCpG4+DYIfKSIrkghEXw8DUQxjz4
         ni+lLU/J7x2mS09fVvZKtFlti/txAR/uwAig04fJHo+aMg2yBl805Vxj5+flMyQg6Xii
         uEeLCcJwX+aT6JpBmmoPSg5899UZOysHjsR9T1tyvdrzbWHUsYuWtcfeKM8EDVGSxkX5
         Z4RwmPnAnYufmci6VGjC3vXL6YCe7GdeGJEvbE8DrO6t2Dpvqc/RKG2V2Y/FDLT2dnhm
         +GmRV9BsGTSDHusbFRFYYcT3mLOmubMPsVwcW1ak5/7i25N+Fi5IiZnmxISImfYhBR3Y
         WDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        fh=aN/QWMv6+f7ROibvgk+SHvd/ZimVHiPYPl2wdBo419c=;
        b=f1v6CDbsnDs2QA+vnM4rKiyiOlpMZdOD6Lmg+M7RzLiV1Ax8fH1T7yPnac5CiFgRtN
         n7YpKTrZ3N9rr4Y4X5AYZaUOZgosvw9kKgmrf4pPZLEbeU8TvMyA8isq0KUJfjmhGMnj
         D/wJtZsDKhK/DE8OjsBThg6rS2bVN7/ynfow8QBDEi94GZtuMWaIp/OJTdIGBI0ZOFgG
         MUiRg94TFEK9GPN+5dqgz/DSSAnhx6GSHov/orTEeoOJmZjRDDJAvqUpIrTwrxIg5tBh
         qNESlKFZdGzSjQy9PBMpwuEMmrRcjXf7unU7cxqgo6pGBlOc3UgI73mgzbUWycvX89Oy
         411Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081621; x=1783686421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        b=Zw6QOoQ6s/DFcTlvVXCp68UZOJgnM6siqMAoHttCpdw8hykVX7GNaOtuOgyLOaCGwK
         wsjofhcABLVfSf2paa5xpa5Bc88XLcm3nq/iSN41OoEYvUpW/Z627B/JWT1P11yuxu0O
         mHYAvLFs08KVHJHtZpG/lPBAPIgD3XK7xLxpKTQdMAFGaryYLmmaI/uKwAXal/CN4gOt
         d2/9mHTqPs1tjtLcLvRz4FThyxnR/i0SYcSD4NPCcTn26IRMWgeGSdR5DblvbgidklVj
         tfCoBUoDqDYE2CSDgrhyLLpu1OmTTFe/wgPGq6mUv3nntOg9AeZhKhfMA+iGwfLSKFoR
         UlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081621; x=1783686421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        b=QdSgJTnBQXua6I2RM3/BJRLeRrMkUIpRikw/ts9LrYhDvOL07uA8hjtdpCx2SvSjJi
         V0SqQIowWkdnf4NQT+FZpx5Dt7+tBVVHUyvFeB+Rhe46oesFkS6tMj5e5T3xh87ZUc4+
         FU55bHeb+uA795j9fbaXNAL2rd3tJN6oM0bx0UdZRanBTdXkNLt8lNXBvTkIIaK/6TuG
         diacYI9i2cYdWxcb8VcsS/YPcAP1Imyb30ZqXeUkxECSQuUQZD689GV7BTCAlE2kJMb3
         J5PEsVixI7ziOCOc4C+vAz8bREt3xN03lPL2C/qpZEeC3RQ63u5z3Hoo2lNtrE9+ySGO
         cJVw==
X-Forwarded-Encrypted: i=1; AFNElJ9966DT+SlfsJ3nxnqi0WP7EFClFG0ljgYQDieJOGqj8m47uE42/qQAp0gnsJte5EdAut62@lists.linux.dev
X-Gm-Message-State: AOJu0YysfTL6ATLOCQ2WB1I0H9vg1O9RyPKscHXVQvzQY5EYmq/lMTS+
	YcE6nf6b1a+YArVZVZFVKJ7m0abc51AL1OVy5vJjgoy1CByJjNuHPXiSZsxPLJVkY2r3Yj0U8ZF
	yx5jedniD9Z4gaENdLgiPe/mmUUgyrKl+UYPAh03MfA==
X-Gm-Gg: AfdE7cnXRnnK4nXPI6YSQ0PW5iqg8jFyKcFixzIFCm+nGMcmU1uEJ7TTyI/xFc4jI0O
	Jag2fyv8Wf+QaCeU0GD+s9ag/BFlkZ6ENIgbrfBZxwXbDcq6r5CVSGcQRNKtHk9aiJrbTOtJv9j
	MdWDMFjYDftZn0CJyjLEzY8F8uy49+gIPArCO/ZkNEipcjDhdE2/4ANOEJTwIxTzBTiGFCVDKZt
	p9DTq1duBIfXTd60jQ3+xOCbvUoEXA1BW3XmvFcGg3U38tgs3qlTLfSMQ2ctkA37EY8H3wtIbi1
	x5oT9okQKCvhcg==
X-Received: by 2002:a05:6809:6:20b0:496:100e:35f8 with SMTP id
 5614622812f47-497e1e43cedmr1478072b6e.21.1783081615982; Fri, 03 Jul 2026
 05:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702025443.83389-4-cuiyunhui@bytedance.com> <cee66b78b5bad62e6107ce7579d7e613ad05a258aef8d0ab279b706543651a13@mail.kernel.org>
In-Reply-To: <cee66b78b5bad62e6107ce7579d7e613ad05a258aef8d0ab279b706543651a13@mail.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 3 Jul 2026 20:26:44 +0800
X-Gm-Features: AVVi8CcDmMKspGUBCgXqug4CkmXz20IK78kFtcg22LCfN8fJHodpSJeX2_dNFaw
Message-ID: <CAEEQ3wmTJU1-5e81fy0wnv6gCP4n0cdydOW-Hj7pFJxhFj+6MA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 3/3] riscv: store percpu offset into thread_info
To: bot+bpf-ci@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	llvm@lists.linux.dev, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi bot+bpf-ci,

On Thu, Jul 2, 2026 at 12:08=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.=
h
> > index e9e8ba83e632..137a49488325 100644
> > --- a/arch/riscv/include/asm/asm.h
> > +++ b/arch/riscv/include/asm/asm.h
> > @@ -91,11 +91,7 @@
> >
> >  #ifdef CONFIG_SMP
> >  .macro asm_per_cpu dst sym tmp
> > -     lw    \tmp, TASK_TI_CPU_NUM(tp)
> > -     slli  \tmp, \tmp, RISCV_LGPTR
> > -     la    \dst, __per_cpu_offset
> > -     add   \dst, \dst, \tmp
> > -     REG_L \tmp, 0(\dst)
> > +     REG_L \tmp, TASK_TI_PCPU_OFFSET(tp)
> >       la    \dst, \sym
> >       add   \dst, \dst, \tmp
> >  .endm
>
> This isn't a bug, but asm_per_cpu was the only reader of TASK_TI_CPU_NUM,
> and it now loads TASK_TI_PCPU_OFFSET(tp) instead.
>
> > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-of=
fsets.c
> > index af827448a609..fbf53b66b0e0 100644
> > --- a/arch/riscv/kernel/asm-offsets.c
> > +++ b/arch/riscv/kernel/asm-offsets.c
> > @@ -38,6 +38,7 @@ void asm_offsets(void)
> >       OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
> >
> >       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> > +     OFFSET(TASK_TI_PCPU_OFFSET, task_struct, thread_info.pcpu_offset)=
;
> >       OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_co=
unt);
> >       OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> >       OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>
> A tree-wide search now finds TASK_TI_CPU_NUM only at its definition in
> asm_offsets():
>
>         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>
> with no remaining users (TASK_TI_CPU is a separate symbol still reference=
d
> by entry.S).  Could this OFFSET() line be dropped as well?

 Thanks, will fix in v8.

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/285624=
50933

Thanks,
Yunhui

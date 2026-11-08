Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794122901;
	b=P8nyacI+awBunkYYQxFjA/0zrqjXobNohSueylybhJUq2h2NPDjKbTHFEsD5ZnR/nEfh
	 ilwJqiGGyTp85Rk0FyMCogKZ6j1otlfeSrrfyCLmSULi45MoG+5/tcjamJRIjvDgCbVVK
	 pp6jGgzcHFCEAc+Ax6En+n5BiDpep1n5nYHo+lUpQklCsJUlJ4/xZZh8nehp40uSi/x9t
	 UNggxDYMKQYPx9dFiO901f/Is8dNdHmE2UjWxE+CLqkDhRvZQtzZ7OVEKljYnjT+9GzSA
	 LshLdAc6ySE6f85PqBJ6GYfTXdhTa6UJzGA8Fi9TnVSatAyKyfj5ehGuXa5/wXMDaLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
	b=IQbG0eNDGCK9y8PeK/7kvKMrvnO6nf9T1HMjJQPFfnwaRAHGkCvC9HdHBUKzoyf7RoCj
	 B4pnzZ0no25WI2sXpHYG4ldIYXKujbvBiuVq7oeSFDOBFdw7NolztuqKRZiAH1cxruWcZ
	 7MpGzBq25121K8xK69CMkMY/DTC0gEr+iheq/VR/2O2BriRPN6SlzTIXIUmuuO4jcewXE
	 vkLu/F0uvmsCtCX+TdTaGaVD/oQbdGQ89uMepqBGg4+1WK9wdqj3FyDw9kUE/KSkAWTYi
	 MB4tShGyJD9u9YAd6qHJgdyKryokzmp6tFPbjWLflXl0x2tYWS1UqCzNcbHC0BMvg4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cgKaNGd2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9C606A323
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 07:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cgKaNGd2
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f84a55e31aso106071a34.2
        for <llvm@lists.linux.dev>; Sat, 07 Nov 2026 23:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794122899; cv=none;
        d=google.com; s=arc-20260327;
        b=ObrQe0BRWInCBueRacvT3SB2APyoScmh8Dbqb4eRdjQo4F0SIlVW+1PvoakJ7+RBh+
         fff4jKvomtuCM8YBAmeOqCenBg1LrQ1b/5qV2A2yyWwpK+8bPWYhdhf5BScu5kiZ7tgm
         tk5iB35h/pINlqaTdRsIz6O34VwIIeLBnZEBEp9GnpBpf1wnIB6q/t7friveURATLtrH
         +w+H27sthLpa6jFV9Gudove1PB0KXamPu0EvwmH6UQxX2yiAwW4G5fY8/vZ6RWQrURSi
         X5h+ZJX9qLo0MCdK8filhLNegAn8mLtel6s/jQVkg2bt9LFRkyywsNiZYCs19qVnmld6
         cf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        fh=37bsX/21o+UmWGMb2kPd+Ek1Yt2/gPvv2I2WfGq+nhs=;
        b=BaZ9JIipN4ANVb3gtuA0sQoOzm7EHrAsbs/XvuMzdZ8T0tJPRrX0XmquNjXuWf+46S
         qaIJzstfiTsXcBFEfzzprQn1cKMDTsm3iJvn0A4xvzkO4Z3htC6uXjmbhZ26ZeSxlWWV
         iFfE7pfkb8fr81wQvqOn6SRWjEsHbUF5XX8dxz1gpJnLo8Xu9qdCiD5MenxXVwfmcsU8
         sAnkmdmaVBdJG9RwYi2mQB3A0tT/ybFPyx+cCWjIRXs1z5X7uZKpedkonixfbmxk/BLg
         eBXmgw2e5oGVR59LxxMJnZL5IqvLF3hmMoABAY2ZeeFcjDloxUNG+afz2bJ7nIcLahDX
         rplw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794122899; x=1794727699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        b=cgKaNGd2nwi9VRFVm8Eixy1STAGY1XMZ45QbX8Hu//w2ihfnQkBtbh97f4bAYRidGE
         1gcIRibb+wtKjEm2MIr8/ieP5u7CbCXhyIIgz7Wpsv20sssXI++Z/plr73r3YDhn6LmQ
         oPrh2aSS8ipI9AHn16GR3vxR0RUDDVPP7HSHpcndLdHF3haSKiEsnzOOrU/XqJOr1Mhu
         mK99yp4eoqtzNxkGs2iv09RtxtwycRBXW5eFZZcA0DRaK1t1wGOMv/jOmpPgWVdBcko2
         +PT0ktKn5CQ6KYQhuAXbW1s0b3xf7ZVOX853yYGzKuOGaQGQYuYUL/0A3ID/wFBVAy5d
         KVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122899; x=1794727699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        b=I2Hr0buZ4dz9IhgE8V/I1xtchFxdaYm4QJlzuhpX3WbiFRkEX28DwUlVoH82LZ1j3E
         VsR/OzoXERxXPS/WN+j5vccQ+GU0qwFpxzyT9LzMvTGsGj7aWlszDseRogtrRDvPMcZT
         6Qu+0oPPQ2l/hX3Y4kIUVY3Ykb6egEPD70KOS2jU5fuuSdrMlok/RRkp83epJLOMp6tJ
         8AnHmuoap0Js5D/RvfEBj5gEH36AumD1p47Q3gjn2cjp+ATm+HvPYfap9PU5247JezEJ
         uDHPRC9v0TktVJxIh9bJ4RdwRcjDqfnXzqDH1R43MpPipxbO8d0o8SmTutbqS+Nh2V9p
         30qg==
X-Forwarded-Encrypted: i=1; AKwUvBwowavTb0a3wRQwvY6HcuJrxEXbWQ8u/tVN+iUnKSIPXNYGRkuevU+rSHj+cqUDJbJrrJQ/@lists.linux.dev
X-Gm-Message-State: APuU4Z+tm1BJwHgZBlN9jHurx9HHn5MMJvX9sWwaEqeyxtlf7xBGLlIG
	OaLdIxTlYxWMYhmAHwQ8qVEq9vz4GZTCoSgX3GlUo2Em4MXFiFUXbl9yx4h12UCslj+Xs63ypxL
	N5gzmRNDb1/WddwWiKDB9YVfTLze2Jr3RLBtwjh+l8w==
X-Gm-Gg: AYBFou2v5+JLM01Kv+HRjMl/gDlfJtklAYTU2y1boy09WnDk//ReAeyB/MDyal/ELSl
	g6HtmDDcdB/7KPnq9teUJeACjx4/royKmCPQgUBGI2NkEdMWzz+L5kkQtiCtlKXgCWH70/OwEce
	UuxEqhzH2sYmeCoSHcTjiP1DytxAE09WTdYc63OHzyT+8x12MA6gZ4nSNw+DRBIfhSsbZmrtHK/
	xb9mty2ljDZOgyxniTYkxxhe0N89D2/Iw4cOc+zxGp0FLenu5mISDzdrApdW+wK0MhwlgMUmGPZ
	RuK1kC4MMsDxB5KVJ19qIPT8C+/rZIHlmvCmZ5X3wSK61skHXqUgzhXC27VnLxWdQ5rSe/wUCUi
	Ge+/zzdJ70zMI2YdusqwLdt7wLiE3dTjR5Cj0fy+/AEk=
X-Received: by 2002:a05:6830:4492:b0:816:a9dc:6d05 with SMTP id
 46e09a7af769-85f50450ebemr666748a34.4.1794122899111; Sat, 07 Nov 2026
 23:28:19 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-3-cuiyunhui@bytedance.com> <20260826010748.zphu3wh2hlm4t4o2@offworld>
In-Reply-To: <20260826010748.zphu3wh2hlm4t4o2@offworld>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 8 Nov 2026 15:28:07 +0800
X-Gm-Features: AclHuK_SNtR7Na4NEO8eC4WpcHN1PCPzaC_4JypevS8z-dbzdNtdoctuDfoYllw
Message-ID: <CAEEQ3wn2+coQyDz1+cvGRDsFZu8u0d--HTyxqSz2sxq1obZFHA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 2/3] riscv: introduce percpu.h into include/asm
To: Davidlohr Bueso <dave@stgolabs.net>
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
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Davidlohr,

On Wed, Aug 26, 2026 at 9:08=E2=80=AFAM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> On Fri, 03 Jul 2026, Yunhui Cui wrote:
>
> >Add RISC-V specific this_cpu helpers so common percpu operations can use
> >short architecture sequences instead of the generic implementation.
> >Native-width operations use AMOs, while 8/16-bit operations use Zabha wh=
en
> >available and a local 32-bit LR/SC fallback otherwise.
>
> The subject and changelog could use some improvement. How about:
>
> riscv: implement this_cpu operations

Agreed.

>
> riscv has no asm/percpu.h, so every this_cpu_*() read-modify-write
> takes the generic fallback, which disables local irqs.
>
> A single AMO is atomic with respect to interrupts on the local hart,
> so this can be replaced by one relaxed AMO under preemption disabled.
> Native-width operations use AMOs, while 8/16-bit operations use Zabha whe=
n
> available, or a local LR/SC sequence otherwise.
>
> Some comments below, but I ran this on my sifive p550, feel free to add m=
y:
>
> Tested-by: Davidlohr Bueso <dave@stgolabs.net>

Thanks for testing. I will add your Tested-by.

>
> >
> >Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> >---
> > arch/riscv/include/asm/percpu.h | 296 ++++++++++++++++++++++++++++++++
> > 1 file changed, 296 insertions(+)
> > create mode 100644 arch/riscv/include/asm/percpu.h
> >
> >diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/pe=
rcpu.h
> >new file mode 100644
> >index 0000000000000..76b1b8c1fb953
> >--- /dev/null
> >+++ b/arch/riscv/include/asm/percpu.h
> >@@ -0,0 +1,296 @@
> >+/* SPDX-License-Identifier: GPL-2.0-or-later */
> >+
> >+#ifndef __ASM_PERCPU_H
> >+#define __ASM_PERCPU_H
> >+
> >+#include <linux/bits.h>
> >+#include <linux/preempt.h>
> >+
> >+#include <asm/alternative-macros.h>
> >+#include <asm/cmpxchg.h>
> >+#include <asm/cpufeature-macros.h>
> >+#include <asm/hwcap.h>
> >+
> >+#define PERCPU_RW_OPS(sz)                                             \
> >+static inline unsigned long __percpu_read_##sz(void *ptr)             \
> >+{                                                                     \
> >+      return READ_ONCE(*(u##sz *)ptr);                                \
> >+}                                                                     \
> >+                                                                      \
> >+static inline void __percpu_write_##sz(void *ptr, unsigned long val)  \
> >+{                                                                     \
> >+      WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);                          \
> >+}
> >+
> >+PERCPU_RW_OPS(8)
> >+PERCPU_RW_OPS(16)
> >+PERCPU_RW_OPS(32)
> >+
> >+#ifdef CONFIG_64BIT
> >+PERCPU_RW_OPS(64)
> >+#endif
> >+
> >+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)                 \
> >+static inline void                                                    \
> >+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)         \
> >+{                                                                     \
> >+      asm volatile (                                                  \
> >+              "amo" #amo_insn #sfx " zero, %[val], %[ptr]"            \
>
> So afaict that rd=3Dzero could steer the AMO away from the hart, no? From=
 the
> Zaamo chapter, it notes that complex implementations "might also implemen=
t
> AMOs at memory controllers, and can optimize away fetching the original v=
alue
> when the destination is x0". Similar for the others (PERCPU_8_16_OP).
>
> Maybe use a tmp register instead and force the old value from L1 ("near")=
:

Agreed.

>
>         u##sz tmp;
>         asm volatile (
>                 "amo" #amo_insn #sfx " %[tmp], %[val], %[ptr]"
>                 : [ptr] "+A" (*(u##sz *)ptr), [tmp] "=3Dr" (tmp)
>                 : [val] "r" ((u##sz)(val)));
>
>
> ... which arm64 now does for its pcpu ops:
>
>         /*
>          * Use value-returning atomics for CPU-local ops as they are
>          * more likely to execute "near" to the CPU (e.g. in L1$).
>          *
>          * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85=
@paulmck-laptop
>          */
>
> >+              : [ptr] "+A" (*(u##sz *)ptr)                            \
> >+              : [val] "r" ((u##sz)(val))                              \
> >+              : "memory");                                            \
>
> Should not need this clobber either - these don't imply barriers (but you=
 also get
> them with the preemption disable/enable).
>

Agreed.

> >+}
> >+
>
> ...
>
> >+#define this_cpu_cmpxchg_1(pcp, o, n) _pcp_protect_return(cmpxchg_relax=
ed, pcp, o, n)
>
> This triggers that cmpxchg variable shadowing issue you mentioned in patc=
h 1 with
> that __cpu_fallback_try_cmpxchg also using '__old'.
>

Agreed. I will put arch_cmpxchg_relaxed() behind a typed __always_inline he=
lper.

> >+#define this_cpu_cmpxchg_2(pcp, o, n) _pcp_protect_return(cmpxchg_relax=
ed, pcp, o, n)
> >+#define this_cpu_cmpxchg_4(pcp, o, n) _pcp_protect_return(cmpxchg_relax=
ed, pcp, o, n)
> >+
> >+#ifdef CONFIG_64BIT
> >+#define this_cpu_cmpxchg_8(pcp, o, n) _pcp_protect_return(cmpxchg_relax=
ed, pcp, o, n)
> >+
> >+#define this_cpu_cmpxchg64(pcp, o, n) this_cpu_cmpxchg_8(pcp, o, n)
> >+#endif
> >+
> >+#ifdef system_has_cmpxchg128
> >+#define this_cpu_cmpxchg128(pcp, o, n)                                 =
       \
> >+({                                                                    \
> >+      u128 ret__;                                                     \
> >+      typeof(pcp) *ptr__;                                             \
> >+                                                                      \
> >+      preempt_disable_notrace();                                      \
> >+      ptr__ =3D raw_cpu_ptr(&(pcp));                                   =
 \
> >+      if (system_has_cmpxchg128())                                    \
> >+              ret__ =3D cmpxchg128_local(ptr__, (o), (n));             =
 \
> >+      else                                                            \
> >+              ret__ =3D this_cpu_generic_cmpxchg(pcp, (o), (n));       =
 \
> >+      preempt_enable_notrace();                                       \
> >+      ret__;                                                          \
> >+})
>
> With those above this_cpu_cmpxchg() you could now enable HAVE_CMPXCHG_LOC=
AL.
>

Yes, I will select it in a separate patch.

> Thanks,
> Davidlohr

Thanks,
Yunhui

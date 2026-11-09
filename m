Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203358;
	b=BfmYlhcavoIHyJuIQyDgimBjOackHcDdszZSlSfM8CCPZbFNqNyfDdqqWT23EgKEhMko
	 Y2ZNGnux6jB8ORKP+Za4lPTX6WIgqAdGLVXFHETsIfxCqQQ4fRrRfosVzF8Y9a9nC4iM0
	 OU3/pkAVX3o7Qh2i0MAHmoBxSz50ccBHlYNEtx6gYA9XAAeHoYjV9roUR//uE5C+120Lz
	 o6qhYKZTbvr7SM+6By+tNh+9CuGQqkdk6GPLS1wrsvNeOyCN8bRFEP7uYHXrjiq9H1RsG
	 xLk7qVMIAvXYg6S+sYHrCuH836zPhJrWtmKjXrXmiez50Q/gWrWb2ESx9fv8nRYQRQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
	b=stws5CrsMrIrsu3BpBLW0XBjyFO4I3Dg5Tjv0GHjRHA5zozPRX84kFph5oJLU2a9N0iK
	 WSXR0R94gxA4F+V/IfKoE6nl6SGHN8OdVkkRkb+9KOr18Mx/cdJRjFki1KzxPbwff8zdZ
	 X+b6J+MACu0VOIosQA5TnINjm1DTEW+rZJE04DxCbjJ5GcvCxOgraWzwoxhUwDKN+r+Eq
	 fomaA2XZDXLsc/Hk0enwm07zNrRLqhZlUy4zIVtRnokfL+jB4nCF3RsHL1B5Xrxj27iKd
	 5fzGi616244xePhUwKIEpvbanCk5KjFfKLjKQ7NPlLirNm+5J/YmzQVAheWA0Awj57A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="R5X/UWZz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09245606A336
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 05:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09245606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=R5X/UWZz
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-714d57774d8so301891eaf.1
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 21:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203357; cv=none;
        d=google.com; s=arc-20260327;
        b=il/famgL0AykFoUPypLzXpDZNdc2tHVQ+vvXwazTMSPsxcI4+nC7HCVZ4V1JtewMuA
         r4pGUK7YKRR+qYYiNGpKkJmC3u+xp+KR5DVH+Ij9uZt2iqYVrNV38/6kmbsnwD8JjJrE
         JU5xYiOPhNslbgk4xz6NFmVsE/pevnOT4xY2aLO7sX4p4k6WZ3eAeaW7E+/Zkwtd63wq
         bo82KC7+GxDTf6jot/voyvY4L5/jLAjmdAbgR/g4Rnhjt3o8yDE0flusdDD43tkIiQTt
         aamaHMS0oRj24k614o1rhhdG8K5IYNRVWOq1mfxc+ptRaEjWcpdZGjQAesR5uY8Xoc4M
         cPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        fh=87NRwGj9rXS39wlA+gHTlqE3TPMCy+DOeIMg+V62FXw=;
        b=Kyuo7Gn1dnNtXVV+Z1qirVbHKOIhaowVQpAJMmSm9YCR721YFZBlv/ipiq0qflIUXQ
         B8OEWpK55c+PXeoDoahpNoxQ9B6r0nObKtLbNY9jN1bwyq3wKNYtcu1Ia76oR00hJVCJ
         wiboeeSvLCGtBAkTw85z0Put0HNW5ryZBKk/4X/ID4+oIDZnHVeLOYSfEtJQyefzZZzp
         VndSAi+kcPlJNvZJp1s8bjYJa3/NfMcd8X4KDfZKNZP3t55kZflyANDtGJrg9d8xlxkL
         DGAjItGwsYlO5vXRPwWVpDI8WjEAwD6IXeCspbGyqSfJg4D22RFgdCBIeHHHE7sUjDuG
         ldvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794203357; x=1794808157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=R5X/UWZzR0tYc7CbaDgBpS1GJBrMkPloEFwZrpZpLszzylOZ2k/L1T5uLzY5m64WYZ
         h1ZBiQMRX5XkVJkQUhut/AG6nFh0PbL8X0RjYVTEXUyNXEYkE63R04FXrniGvc2eCRuO
         6A/O8bVTYYaHIDbewgi3tPvdmvVT0HZ60BIQ+DIXwN8rZzmW0ENyjBcF9doGNWVXdMhy
         Bz6AgtzuFA64d3o6XP3AEThpwjXcIf4b/VBklHzTLp1lHKpx+9XccRK1vKW9js7T/E72
         p3qaWIWE6HbE3VO4xC7jjXLWY9M+jIJuHVRljXihv08Um+O7MVeRkbU3CLWHR2sCDviS
         IjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203357; x=1794808157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=Qjw1w+5B5yBCIGMIbp06DvfcLG7wmqVyoEZuDn5+SkgqcrVTpESLpfUXD2XMwZHWVq
         yGYS4mfLKCezkSVE8WeLRI1qrgvmT9Xcpxh7+x4pgOuEXoG4tT267r7uHps3NUxEldRa
         EX1kAfAvC4XpvmUnqyPnrzvIomEunsQAbtTzNyIHrwyWTWBPv32X8ofdAwDkurYcJqwp
         Lz6NyEmyLKLhixesRrmyaVWvpKPzbaaTEwYfgcyCW1ogoPOIQONMHm+lGRZedLE4tP+o
         Chy9Ux7xssm/G6TNp6HSFjXp8zKLjkj2aUrVxQVdLRJRH5YvrqqgmhOntmRd3HLOMDmE
         6NuQ==
X-Forwarded-Encrypted: i=1; AL+hErG6eyeqHSMkhJ8DKQk8eqCDTqvKGkavQO/tYecq5Yyy2Rz2CyblDFjNfe/hAlxRol4qw7Dl@lists.linux.dev
X-Gm-Message-State: APuU4Z8HBbMCOHrXxNbvIUsB9l5cam6cQSr+OFugotebDDZYeHKLdeqv
	k1Y9XeRLPley0uJ2gFoyjRqtzvzYs4i2JL6aQLCPyqnjZgV6U+fHtx5VEWHuLc6GMYNAanI0KpQ
	qpuGBxqWSgb1hMS4ECv/vga9Zqdoa7GUQMkspe9+x7w==
X-Gm-Gg: AYBFou1BXXrEB7zjAoSvZ9RJ6NfyVVdl3w5mejfmnojT9a0X294LNXF/3t4Fh3R/QzQ
	JkCHkyc05GHsNomg3ZO6hoA9uHb6nBa7NObdpaypnUwtXsRh+6XH7LPgNjKCPRGtQ0S96mrQ0vh
	VWx243dEoyvXYFUnoxrvgsslKjvNdWlhygrhMnicOqcf+NVUDG/znXtwZaSfuDDWQ+v/bARxluS
	wFI+rzRNGLQUi853PJv8JK7aWU804uI18Gs32Nd8xDV/9dtUoueT+U9i8HT+BGuQCLnKGcym4wQ
	j81+NySehzJtX5C7Dx24Dd/K7okLacSByMkgHNOHZIcG+hxoG7rIreznJwRsl+uDU5JCtRCfHMr
	ID8skYvQ5ErNt5zM2VMkpcd0DxLnQOGpgcmka9aAZgwQ=
X-Received: by 2002:a05:6820:160b:b0:6d8:bba5:6589 with SMTP id
 006d021491bc7-7170f303df1mr1702563eaf.48.1794203356632; Sun, 08 Nov 2026
 21:49:16 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
 <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com> <avFN7LbSK0q1gsB6@xhacker>
In-Reply-To: <avFN7LbSK0q1gsB6@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 13:49:05 +0800
X-Gm-Features: AclHuK-yA93Gg5bVt8kCNssew6sQnM_Z05Rmq56zAts1z3WwIhtyQX6D4YptSkY
Message-ID: <CAEEQ3wmViZNwxXr8q477yHjtABStEJecCHS8=5s_UAk1hYgyfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: Jisheng Zhang <jszhang@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, 
	cl@gentwo.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com, 
	ajones@ventanamicro.com, ben.dooks@codethink.co.uk, rkrcmar@ventanamicro.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, conor.dooley@microchip.com, 
	tglx@kernel.org, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, dave@stgolabs.net, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

On Mon, Nov 9, 2026 at 12:57=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Mon, Nov 09, 2026 at 11:47:43AM +0800, yunhui cui wrote:
> > Hi David,
> >
> > On Mon, Nov 9, 2026 at 5:33=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Sun,  8 Nov 2026 19:04:04 +0800
> > > Yunhui Cui <cuiyunhui@bytedance.com> wrote:
> > >
> > > > RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> > > > operations use generic implementations that disable local interrupt=
s.
> > > >
> > > > Implement RISC-V-specific this_cpu operations with preemption disab=
led
> > > > to keep accesses on the current CPU.
> > >
> > > Have you looked at some of the schemes (I think arm64 has the latest,
> > > but also s390) that do most per-cpu ops without disabling preemption.
> > > In particular they save the pre-emption check when pre-emption
> > > is enabled.
> > >
> > > Basically the code tells the scheduler which register contains the
> > > per-cpu data so that it can be 'magically' flipped during a context
> > > switch.
> >
> > Many thanks for pointing this out and suggesting this optimization. Thi=
s
> > is a very useful suggestion. In the common case no preemption or migrat=
ion
> > occurs, so the preemption bookkeeping and reschedule check are unnecess=
ary
> > overhead.
> >
> > Implementing this scheme for RISC-V will require additional changes bey=
ond
> > the current series. If this series is otherwise acceptable, I would lik=
e
> > to land the current this_cpu_* support first and then prepare a follow-=
up
> > series using this approach.
>
> Hi Yunhui and David,
>
> During the merge window but before rc1, I implemented a riscv POC
> following arm64's preemptible this cpu scheme. Each operation records
> its per-cpu pointer, offset and address registers. Exception entry saves
> and clears this state, and a noinstr c helper repairs the saved offset
> and address registers on exception return after any migration.
>
> However, my PoC is based on current percpu offset.
>
> I planed to sent it out last Sunday, but then I found Yunhui sent
> his percpu series(which is up to v9, I didn't know this before) on Sat.
> So I hold on the sending.
>
> Now would it make sense to rebase the PoC on Yunhui's series patch2 and
> patch3, especially the percpu offset optimization? I can post an RFC
> with this rebased implementation.
>

Given the substantial effort already invested in bringing this series
to v9, my original plan was to land the current implementation first
and add the preemptible scheme as a follow-up.

However, if the consensus is to move directly to the preemptible scheme,
I will implement this scheme in the next revision, building on the
cached percpu offset introduced in patch 2.

Thanks,
Yunhui

> Thanks
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

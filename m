Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794126475;
	b=gnVuQ5rqCmNlMUFQpGbsygTJQ60B4mmN/HUGX/EHO8LIRw5AmJ1u6QxKHo8hGzfgiLRo
	 jk28PCzkfaKwp1ciN4KyYKPXVz7t1yHCOHsAI1Tzt2f9P7lEsYyVcla1hN4YHAC2LyyGd
	 HL2ypLaL1Gh777dlvfgXYm4Yhc6U7Qkxs2L12sgcM+te4J9bpctmxBar+T+/5TvORNCNH
	 SmmJkNHaLoZ+EfFPFpH5swHoU+1zzPGJ87PxvXZFzQ3epm+deM0X9WCy6/K3ZDEABE5PX
	 ULDwrqJJ7/MT+T+n+zMhgxNTH/yOvoqbRSweKHj1H+K3TvmR47C+idS3yJsk5nIRZMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
	b=dtVK04NYYPjLRrJQBQp1o+MQVOHy8i/Jepvw4DWBAh0MOt2wK3mbs/IOi5bsrpFdVjjE
	 394NAKG+0Si4/fIAoGvHkd8+GUMc2b0NBYiBJvG6a9fawuwQSovDfosdD0aWgPipdAGrT
	 npdyOzApiDbQ6YaDLfgLR9Wib40lIpr3TZ+owTX0H9QQv/hZxUCEEUZLngBnEUCQR+IqC
	 +uXLh2/HYVed4skbIswW1/5+AZIB44EsPp7YmXmUNRoTLoYb97Jl1Xo+cY9Elb8MSkg9e
	 C/cwd33PyTeJIMxsGACgR9+6bQHhuazhqsozavNp5KVcpkS/7ANe6oES3Iz9kx9Wg/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XF6hG47G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FA606A31C
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 08:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XF6hG47G
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-847ac7ccd85so138439a34.3
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 00:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794126473; cv=none;
        d=google.com; s=arc-20260327;
        b=YsIOmRPbHXSysm6RZ5hDUVsyuL65xK5iNnkwuy3mieJ2U76pQo3da+Q9eusLRv1NqU
         jaW9JzZmyTLPeTeIVoY09VIFwWfnkvu2pMaqIYVaeBu5DJhwPJ3Z6flb5x0zJD8nnRFd
         rwbkzWKsmM73wH7ck85jiwi7WZ5359fM54fqk/KDmzcPiz+LdqDxz/wW2KSh7tSxVHD+
         umztWQzEudE9ACZhJ6nHN5jqiuTdWy+P+Dz6p+a+w6b5t8YTlRRNdposiypxufCDA1cq
         Xz3B/tiPiILIDPSDAcKA4UrKkbSBjbKItRg5+Ay5kp/Q6vwmpe/kDUPedeNew+P450V5
         13Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        fh=x5fYh93xXxuqjG2egIsEItxP6KX8VPtd2qNC1LFBbDI=;
        b=LBNy3uHQ0y9bZgtlAZmvgs9dwUMp/YZ8ym9ixLFVpNqR8wf0LUK+v3FSjUAwZyhr/F
         0WAWVtdYhcikZ7NeX1smeFThX97Ks16hfVb8m2nSmB+N9Ad+Ky19aNmPem/P3JHTaq4F
         gv0GGnLR3e5e2yglKlrYS7777yU35RZXK5tueLKJmNC5XH0O+wT9E9ZidhVHAicgUhh+
         ZRmuFG8Yintw7ja3mUUomeK2zDBJbkz7eRY5Y4Z7IMoaceIq3I/T527PzH9dUUIViP26
         /PPE3QCXFro6wJGGAdj7zdIdSNvfpiG3KVwxB/PCZRbJXRY2ByeLuLDD52jPQGpS34Y4
         XQkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794126473; x=1794731273; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=XF6hG47GzoXOfvpl42rkMvQIccfulD4MRJFTTxFvxgS9+duM10fL+2V0UqCr5XSs0i
         d8JF0FJ6x6Bd4QXN7DB+l8DzBoOo9tAseX4YWChiOPsykw5Vg0AANpS8kDuLY2rnwDhJ
         Wx/4i4cCXy9JC0RB15oQ6sO+1hrrHnlu5RvtHtLh37+4PIwBYWyOlUE7RNe68Cnbdcmg
         /4YDbuM10pTDoYwslO3Y8hPo4njyK/h5MNwiDIRGhdqyjzIlttPipBj93/9vpn08p8si
         YB24dgiJUe9vOyy0gU7/kOE9IxCeoo/EZanA4a3MSkWXz/m+V6Xnd65qcrPwDI3Qu3aU
         V9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126473; x=1794731273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=NM26Jy1Qal6/bFk6rF5/U42Z1ECC8T9c4AMJtVWRiHML+b9iHow4idgvgVMTO0Cet+
         4IZCRgRklJstxR0kDM8QO+Mn1cveBvGeNNLRGBU4Kah6EhpvAuNu/v2p0NYW+QytDNeV
         aK3PxN+v2jMB/VHPtGR9hrNPTI0Z9FFXEW/ZK6LGKMIkmRu6GzhUaMjmgBlI/OPlpTgY
         zIwofmIdaWWKkByAV/bAmZrr+WNbIjEbW+S37YLxTuO/vR6hRvIyRgs0Mw3UJbBytUNR
         qoT2qOj4vZYF1Dw0/siT0XE4pokLp96eHzoDUemoh7U3Rz2wcR/eL6Sn9opX9GnOG/6r
         ziwQ==
X-Forwarded-Encrypted: i=1; AKwUvByfZaM3D6tsRKaNyFAoWbdAuKIoDdtXzG0yX7wC4Rqq0o6Y7CdAqihdi/j00G1lowH33UBH@lists.linux.dev
X-Gm-Message-State: APuU4Z/RrOlBUBGtczfS39KEftRc/UoTSJwINkgxHeBHaRBXxA8nwgOS
	nikkm+H6YbpfPMGdV15ciqKVYzqcvA1YxDp2UyR79CcDkNxGMQ5SZbgIiX95HwI+Mpr5Nh559zc
	ixmeDLDj8PvZgft+1DSFnQN0zzD2Nso8nQLMd70ElzQ==
X-Gm-Gg: AYBFou2cAb4W0NDvByU7Jkw3uRJuxX2NMs5p2ubqOmEHqjD5knlwXfRMsK0aHRiKC/g
	xHFKxcd+Pg9brL+lFpLWZjTcqkHUchBTBhTfFH/2/ZADkl7Aj4CgPJ0NOPiZwTAysa7j2/L9vAl
	OONivxpinwp2C7363VyOM0XFiGtdFzGynJCQF7p4Jn6KqLiWRbmt9hK0HKsRLBqpOV+qJd9Fr7o
	wZqp0yeVHURHOPG0riP3aHMRqK03RsSvrzjWcX5t+UaVk5XbvV6zLGJwIwIegD/74lGmtEOPnvV
	TGkLgchKCnAcPeupOq7JWDIAKY/tAU7hhjhTnd0bqrXQmVhGgWMVlZuP8XSIuS9Ta9Y1iLCdDuR
	oXJVOfpFbM2pBI/Y5EMvjc8wyuSFa7n+QVexr0NjUNnTl
X-Received: by 2002:a05:6830:71a3:b0:80c:d34f:5f5a with SMTP id
 46e09a7af769-85f5075a36fmr645255a34.19.1794126472981; Sun, 08 Nov 2026
 00:27:52 -0800 (PST)
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
 <20260703122832.15984-4-cuiyunhui@bytedance.com> <87bjcnlrbv.ffs@fw13>
In-Reply-To: <87bjcnlrbv.ffs@fw13>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 8 Nov 2026 16:27:42 +0800
X-Gm-Features: AclHuK-No24RzFz5kz6KGOgepjfUU9hWv2-yH0FoZIN8FZ2Py9-_ynkukYR0a6s
Message-ID: <CAEEQ3w=B4p-_4pg3ffrkSA_AXuz86FCd-w4FSB50HoijcSL74w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 3/3] riscv: store percpu offset into thread_info
To: Thomas Gleixner <tglx@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, Jul 4, 2026 at 5:02=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Fri, Jul 03 2026 at 20:28, Yunhui Cui wrote:
> > +
> >  extern struct task_struct *__switch_to(struct task_struct *,
> >                                      struct task_struct *);
> >
> > @@ -122,6 +129,7 @@ do {                                               =
       \
> >       if (switch_to_should_flush_icache(__next))      \
> >               local_flush_icache_all();               \
> >       __switch_to_envcfg(__next);                     \
> > +     __switch_to_pcpu_offset(__next);                \
>
> Why do you want to go through the indirection of current:
>
> > +static inline void __switch_to_pcpu_offset(struct task_struct *next)
> > +{
> > +#ifdef CONFIG_SMP
> > +     next->thread_info.pcpu_offset =3D __my_cpu_offset;
> > +#endif
> > +}
>
> instead of using __prev->.....offset, which is right there available?
>

Agreed. current is __prev at this point, and both forms compile to the
same load/store sequence. Passing __prev explicitly is clearer, so I will
copy its pcpu_offset directly to __next.

Thanks,
Yunhui

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227623;
	b=sSY3EFjeitIrUEfSuXmqks3yUCvVU4LsmxVKsCsC5IMMEMgh+0W1lx3dQ1taOtaAbmHV
	 qEVoD6RVdT3apD068GwGGgB1GMhIQliqDnRtk7LSS2x/Age1EP9NhGBhhec5df8QttoGP
	 WIrXe/83Zh07Hp4B9ZA6GDC50iJ7RpCIadJIRP5ZMRORMi1hZBEaciSF5JxxvJj1Ek6Ht
	 ercWS/aHNWPuGbfxFDOJ2+L00bNDseDRAYwocSdHLRIRn8iWbHCASQTPaCmLWW7TKDIAd
	 SGGZkSGz6cspwi2mAaZyPsxzAav/LlLbBoX0w+fignbEtKvgjB2Pq7AfhLLBR0kBw1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227623;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2JV1b4sF9Bv6mNizFqSbv38ZX8zLnn64bzrFb3DOKnc=;
	b=oOjODcQ2HsBiRrM9KVsv5ruPU2g7pDEwa5KeHsjCblhp4/+8gCMwOI1xWJcE9EHga16o
	 zAw1dAnK+ySUORxXf8qABXRvdXDGOiT3JjEqXnV+gVzpQ0nMzKoD2VxZwvplR3HJhXb2y
	 ZTTNUVHRhkari8Ysdt7KB3TqGfTq3EJoO6myKO4nyA7YyIiFGoLPVvmrQPKezseqUdgc+
	 dtANCVm58NLMLue+NTi7tLcEt+Tw6m7+2d1bzm5462R/ls+lorFjFPDlzQUkap76Lb5gL
	 jY+DYrcJpBRdr/T2iIif1+72vYDFUwtd2/+I/o2cNziPlId/sVWAuJ67QFC4hLmQ5xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B018606D804
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 12:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B018606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so1156616d50.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 04:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227622; x=1794832422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JV1b4sF9Bv6mNizFqSbv38ZX8zLnn64bzrFb3DOKnc=;
        b=XZuJzl/X9FS2YFJjBjpVe1CTIUiGvtIP0NM6c6JgLbsk7+Mc+Ngw5vD2dh5XXSnqwQ
         1fNfwX5+jYAiFZYkPUgBfnDmRyBAs7pcyjMn7fo4OV3WCAVDb0Mucbb2IttoR8g7Oa+S
         8E/KfrLGgmM6dPADdgmwV27qcZoVD1FMhoSkYYXmJIw3tNZhNLIS0rjTl+Muu7QPKngq
         3a/ZucJ4F+bYWGrwwCdOjbWvtzit5n6bOO3WSRCl0GsL54Zb6rTbTGiZ0tTGqNeVM9tN
         u8FTtbxqOZYoPSR/NqmA4Brg8X/Rj4rRvv2WNeNRvkfwN9gcwQLR2KkPedmklfRgk2f/
         khsg==
X-Forwarded-Encrypted: i=1; AL+hErHLXnCwo208tpjW4tO77Qklu697Vjw24kiWfx9xBXjfj8W53O6lD1EmtUpwTdpXaONqlQfq@lists.linux.dev
X-Gm-Message-State: APuU4Z/SHOmHsZuOWmXupsZIXaf72uJo3RV4PRn6bx2kUBRd7MdJteTb
	Ou2YaYsP1O8W7cCeqglJ+y/NbYuZhR/pf3Yfels6/hYflOkpDEtMpRf8
X-Gm-Gg: AYBFou12R4BexdXM2m7OlyJHQ2xQYiU9EE7iNQtC9ZotPexvVv7OXx4TNyB9qZB149I
	S7pSe+rEjS7mWWQP9KALbq46R9KS7r2ruNvcy1ZR9hVT89xICbIgac570ExODgiCk/NbNyudyg1
	nMW3DlVJXLC98ZAcbf+54DyZAhYz0y5una4DA1B56dp7rIeYMqQHPL/C57rI4OG1iIIrL6pJ31i
	aDzrSduzZEnWMnSgZFeDr1FRoHZxH7GaGQmXfqZDRSJzUu+PCZtUdFGf188O1E4+uOA1I3JRgNq
	4xYI+wGBLwIw4FhkDrdbnBTirLEJlUVPzu32uzdDCQELs5Lq6ANkkL3uDcs7Y9AYsdK/Ov9zk8+
	tSm6FyT3rZI2lHMgsJ6fYfQuooiUvYYvL/BZi/WwoBpHYWNQ8rA5Ab4ObWh248Pi3p0ZkF5njFj
	s+ofcZhoOMdBvjsR3Lr359ylte/EdBVfOeVAuAofuxRkZBxBU2pPtXYFHPwbZSmNxiZVrHwV9wV
	yJ2u6W2ESYLiU8kI+7UL/CyfNn3bzUcMbzOL/EhhgO2xKDX/A3VBGgnV+rI/eVVvHvc2lcysR5j
	yDTy172IesOJGyCwKTE=
X-Received: by 2002:a05:690e:1442:b0:67c:175c:df66 with SMTP id 956f58d0204a3-67c3d963260mr2729393d50.36.1794227622290;
        Mon, 09 Nov 2026 04:33:42 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b93be27sm3766906d50.11.2026.11.09.04.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:33:41 -0800 (PST)
Date: Mon, 9 Nov 2026 04:33:40 -0800
From: Breno Leitao <leitao@debian.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, acme@kernel.org, 
	netdev@vger.kernel.org, llvm@lists.linux.dev, ast@kernel.org, yonghong.song@linux.dev, 
	bpf@vger.kernel.org, kuba@kernel.org, tj@kernel.org
Subject: Re: [BUG] bpf: tcp: bpf_tcp_ops_set_rcvlowat() missing from BTF with
 clang KCSAN
Message-ID: <avG9bk0kxRUvonhD@gmail.com>
References: <au27Y9m78_3EH2v1@gmail.com>
 <a69dd097-7e71-41f0-9a6b-eda001773236@linux.dev>
 <au347UiVUe5oUuxM@gmail.com>
 <au4kpSGVSH3tYiZm@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4kpSGVSH3tYiZm@google.com>

On Fri, Nov 06, 2026 at 07:05:25PM +0000, Kuniyuki Iwashima wrote:
> On Fri, 06 Nov 2026 07:58:01 -0800, Breno Leitao wrote:
> > On Fri, Nov 06, 2026 at 09:16:24PM +0800, Jiayuan Chen wrote:
> > > Thanks for the report !
> > > 
> > > 
> > > On 11/6/26 7:38 PM, Breno Leitao wrote:
> > > > My arm64 KCSAN builds of linux-next fail since next-20261015, because
> > > > bpf_tcp_ops_set_rcvlowat() is missing from the vmlinux BTF:
> > > >
> > > >   WARN: resolve_btfids: no BTF func for kfunc bpf_tcp_ops_set_rcvlowat in bpf_tcp_ops_set_rcvlowat_kfunc_set
> > > >   WARN: resolve_btfids: unresolved symbol bpf_tcp_ops_set_rcvlowat
> > > >   Failed to generate BTF for vmlinux
> > > >   Try to disable CONFIG_DEBUG_INFO_BTF
> > > >   make[4]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> > > 
> > > 
> > > 
> > > Has pahole fixed this issue?
> > 
> > I don't think so, see the line below:
> 
> Could you try this ?

Thanks, it fixes my build. I tested it on top of pahole master (9eb594d)
with next-20261105 and clang 22.1.3:

 - arm64 KCSAN, CONFIG_WERROR=y: vmlinux links again,
   bpf_tcp_ops_set_rcvlowat() is back in BTF, __bpf_tcp_ops_init()
   returns 0, and progs/tcp_autolowat.c from the selftests loads.

 - It also brings back scx_bpf_tid_to_task() that was work arounded by
   tejun.

Feel free to add my "Tested-by: Breno Leitao <leitao@debian.org>" tag.

--breno

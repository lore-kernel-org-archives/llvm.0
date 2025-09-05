Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AF2F746F
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061778; cv=none; b=L24JGT0YqO8q4GD4KCHvUgTfLZU8vDAS5bMlb5A95phlOfgWV6aKXxmKVS+AR0Uy6I5emp6E13H439hcBOITk6VxnBdNpb0bQzsb2f8obxaqgpjQNNOq4V+xeBUkBh/aiJYJ06oVBSVPZim98FM9qreE1CCo9ybqMsQWAVhwcHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061778; c=relaxed/simple;
	bh=EoMaYTYHFXEwCGBlN/IEjhrPWRNTs6kRsDou2dH4cSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc35QLhcUG796Rqtlvmb8jYxnCkjw+8ju4qG8RbrFCEjaJ7JPXwnOyW6xjH74uDgSXJzwHgZGcelO5ABKCJhCCUuwi+cLM5YwG7TIZVVwrov8vkJ6CBevkZt3UuK0gxSpzyEIUpg5GZGXZU8aGuPLANJx6R+KXqrlLaPkfFcYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BJ+WuTPp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BJ+WuTPp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so87483f8f.1
        for <llvm@lists.linux.dev>; Fri, 05 Sep 2025 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061775; x=1757666575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Upm3gtoelWKi/OiIlfN8TaykvgP8Dbo7GPj1kZ9zlhE=;
        b=BJ+WuTPpkQtiHSdtwEf8V3mvxmeJbNuuCc96E+KD3sbxNMfNLNYGcG5dSq7Yl/r6Y2
         r8caLMDEtcucKoDH40LmoklyRIp19NzRLSm05ajWcEUTKmbgVSPbNuYXJrKYOUqsUg1a
         1BzRZae1iDsEyg2ShwJrz1gajRD3EtAN8+pEK/Job9wDu66sBvq+HQp9cozVs6a4h0Ys
         Kp62M930bYX7rkvMh75+BMaRUkNB6+v3dBYcd+G2Gg1b4sxTmFTi+lh+xcm150eCEdOl
         9QhV9wMOth6VppQrErUAuwyUVHMH8swG3OdjvaNhG9OTK2kJA8XYYyiUnT32No5HZlZ+
         /r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061775; x=1757666575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Upm3gtoelWKi/OiIlfN8TaykvgP8Dbo7GPj1kZ9zlhE=;
        b=tz2Z5Z90DU7fzoYuWHUnZp68XIyIanG9mAyAn4TvQfkJ22/IsWocNyyWeMkxs41ORQ
         LAG5X9UxstfmP2eaULH08OmwdxikDemYg3qKvpKps5RCZgFm33qmw1WDSQPxFqp2kvyV
         p5yR5xsHJx2K9/774SGLVSdiWlMU8WJHdH9rgSCvJu6VRBx791HgbMRK85mPUcL2Fcph
         Z2bBqwuCFhBlgToXi5PBRIjPLD6n0CPN55uAtHq88Y+2AXkz7b51+c3SvUO8CHiKISdP
         A2I0XlSGAqFQYyjd/N++B/nEsOqc1HB3gg5gyZ2T3IbzKwm4S9h4hyf1HIIccpZmVteC
         IYGg==
X-Forwarded-Encrypted: i=1; AJvYcCWR88M4txNk91Kc5QZs/8sorOQ0xQJv5UpUwlp6M2Qpv2ypeyRZ4UgGzaegpKybI3bjOkUo@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyuq2cjWxIn2DEM09WV+N94IFhjbrrDMSL6zj0/GT17P4grOlq
	oUMf8Xa8tijbjeKC8FMfcelWnJPfZnJ9GZJLZc81bgCP5d0nbXuFRxVJQ0+FDPUg0Io=
X-Gm-Gg: ASbGnctgEAuDCIoRiQBF5GmM32nY0iw5rGMBHUEG6uf+ij2uft74HKn9ko3KafT11nm
	ZSh8+MPZbX2DxovHeb+jBQU1TvOFgffDUYNb+OKG6JB8wMiHzsdQKrXkY91SYWXCirak2X1CJ7D
	X6c3nPjADy1NIdotqDj0aQ52XdoAfE32l1fyGrK70yYpjQjnvL1oYLqWLAvY397z4Rh1hS3DugP
	sj7jD7ZkFOzyWA14EKCR0YI88517VKTLpUB09fGr2rd4uZZP4HwEzu0o6kNtVKfFJlBHnFhwYaD
	zPdZ7Bvm8NtPqjS/bG8ZlodZFpJwMRefEHkEy5r3W5E3SkKaBxGTPwv5IrnL1SlKyoGvOhfmoxD
	MeGHC4UgRMVH2vJUT1xpMsXWRFrpq
X-Google-Smtp-Source: AGHT+IEQbkpijCuIHkSH8MhrhTJtQwPADWOBz/A63pVWyItEyOmzIbf0dkH52+ncdnxv4u3S/9wKgA==
X-Received: by 2002:a5d:584a:0:b0:3e3:24c3:6d71 with SMTP id ffacd0b85a97d-3e324c36f9amr1793548f8f.1.1757061774650;
        Fri, 05 Sep 2025 01:42:54 -0700 (PDT)
Received: from u94a ([2401:e180:8d68:75a0:8d2:dc87:a659:a9df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm19618409b3a.79.2025.09.05.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:42:54 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:42:43 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: bpf@vger.kernel.org
Cc: Hoyeon Lee <hoyeon.lee@suse.com>, netdev@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [RFC bpf-next v2 0/1] libbpf: add compile-time OOB warning to
 bpf_tail_call_static
Message-ID: <3pevfugpcd2j44b2wkrjhspn2a2ta627nhnqxc6ty7dxy3nt3v@qhytbn7lmqum>
References: <20250905051814.291254-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905051814.291254-1-hoyeon.lee@suse.com>

Adding some context that I think was miss per off-list discussion with
Hoyeon.

On Fri, Sep 05, 2025 at 02:18:11PM +0900, Hoyeon Lee wrote:
> This RFC adds a compile-time check to bpf_tail_call_static() to warn
> when a constant slot(index) is >= map->max_entries. This uses a small
> BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.

This is an attempt to see if it is possible to warn user of out-of-bound
tail calls, with the assumption being that with bpf_tail_call_static()
users would not be intentionally calling with an index that is superior
to the number of entries.

However, there concerns with the current implementation, so this is
being sent as RFC to gather feedback, and to see if it can be better
done. Currently the concerns are:
- use macro to override bpf_tail_call_static()
- only works for Clang and not GCC
- uncertain whether this fit into libbpf conventions

> Clang front-end keeps the map type with a '(*max_entries)[N]' field,
> so the expression
> 
>     sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)
> 
> is resolved to N entirely at compile time. This allows diagnose_if()
> to emit a warning when a constant slot index is out of range.
> 
> Example:
> 
>     struct { /* BPF_MAP_TYPE_PROG_ARRAY = 3 */
>         __uint(type, 3);             // int (*type)[3];
>         __uint(max_entries, 100);    // int (*max_entries)[100];
>         __type(key, __u32);          // typeof(__u32) *key;
>         __type(value, __u32);        // typeof(__u32) *value;
>     } progs SEC(".maps");
> 
>     bpf_tail_call_static(ctx, &progs, 111);
> 
> produces:
> 
>     bound.bpf.c:26:9: warning: bpf_tail_call: slot >= max_entries [-Wuser-defined-warnings]
>        26 |         bpf_tail_call_static(ctx, &progs, 111);
>           |         ^
>     /usr/local/include/bpf/bpf_helpers.h:190:54: note: expanded from macro 'bpf_tail_call_static'
>       190 |          __bpf_tail_call_warn(__slot >= BPF_MAP_ENTRIES(map));                  \
>           |                                                             ^
>     /usr/local/include/bpf/bpf_helpers.h:183:20: note: from 'diagnose_if' attribute on '__bpf_tail_call_warn':
>       183 |     __attribute__((diagnose_if(oob, "bpf_tail_call: slot >= max_entries", "warning")));
>           |                    ^           ~~~
> 
> Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
> compile-time warning can help developers detect mistakes earlier. The
> check is currently limited to Clang (due to diagnose_if) and constant
> indices, but should catch common errors.
...

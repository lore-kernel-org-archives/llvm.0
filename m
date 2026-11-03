Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680540;
	b=ayctvhdEd/G5YKdTI+h71rIn/TWAr0ff6xClLBD4SgDEHycfAFxD02Po3paaMoQQUTT9
	 FIJ1ocMdbeAV1igcQL+ZpqafNkxc1AoLPsDZ8GDxp35/OCCoBmjla5sfDRSjRMvqdVbuB
	 FH6xJ5u2ZKKkUJwnY8YwY34q5bkH+TBcu0caCZQhVedwjAf2wtpnvoJl/C5+25P+ToAVf
	 1wqODWBSonslpIh/5/2pkwiZxIc+QfxnVzkKnAWI2jZzE99uaBSnyezeP/CQ8A5xmNNse
	 R+D6giXVkXay7Xa4aytKwy/Q+wL/JDxMD9vB6RTEVGZLstp7WKCWQEYGpDdaczGpLKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
	b=CMJOc7utYSTTKo/1uegyLpCTZ835gopvnrj0lHkKePtYoAqTysL6HUSrSWmKyPydr4bm
	 AyyitMOzZK9piOUuTkzcChvyMEymi17sz2+LzuK6WpbHrkBAPe6VdFAT/cSX4ZiItUKos
	 rnSDIOYPzTyegKrb3anN/WnoKMdktpw6GymlX4Ybw0e5fTx/+a7VTRrGzgtG8uBZ1Zcpp
	 /i1QwSSDOD8WGg+sy4Hx8IhlocDJ+eJ10T/+zy+r7IYWrmRR+RrKE3MVzZ1Kr2srTCBP3
	 5fR6Tp3ZADWT/cfpNWuXNW+DuLUj14AhvE0jEL0Tvk6125eykQe0eYe7vkKf0aSModw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUZNsxka;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF8606A324
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 04:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AF8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUZNsxka
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1992877a91.2
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 20:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793680533; x=1794285333; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
        b=yUZNsxkaiieEFocX/U4mFkhM+Cxw4xT11F60BOZdP84wAAR5wVCgFtYLpx+gLPA48s
         zo9E8faODMREN+UAl25FNDRIlgP10hSpz//XsBwmFIWMTUm2fcp3MiQ5iQvbwbbf4ucA
         K5cZf2IzqNhP/SlVYCt9OR4VCOTKz4cgMyTxy34/ukPCXpCz08/qb8A0gJ9WKqRvBASp
         YLrmovPZbca9AyyOdRKsg7fONSkqaaF8RlpH54LDpHrxZEhdOcrs28XWKt4/ACDs7BQh
         pCe+prAEl/nxH2f1xL65X7zkMXwHuaHGeJQR9qGDxpyMQ394iP6vmKc40ZStczjXFVkt
         c+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680533; x=1794285333;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
        b=vMs0A2qWeF+IrDSxK9ktUBTyv+f4Rqdjcyu00Q2wfbn7ICX68w87nx68GFmV4ywzNm
         8h8syvWYYb6nJqs0Vasy2qGXRJZhBv+j4xHIOU749TkqpbapyHrEQyMs0SOoRGTa3Uem
         vkN6vQ/DNKUwnV2eHWFbAPsis3Qu54KRxGHMCYvu+n4Avlwa5GM57s/yGt7QaCVcqbMb
         xwf2M7YRPsBmK9bV7rRwZfh6hfui8heu9puWNWZsl91gHjasqv/nWoBA+g/wt+pRrUHd
         Cl3/MxDbbTO0eDjcWJ9UcAXUeyXs1DDRLB8FB4qVB6trnPvl7i1zIAaBBJJiHIe9bT8L
         IBgA==
X-Forwarded-Encrypted: i=1; AKwUvBwjmSGmgFkYvbGzFXdfJS3VmYs1Z+XYfNtOYAKwIUx19XtCpzrNIIoBVZRSS+1LJLeY9N5N@lists.linux.dev
X-Gm-Message-State: APuU4Z+ykdEXZEneYQquYyYGCa4BseFxfCkLaGsGCqiiV9TysC8o0d05
	H9QoFaDpy02ELXMaCCkum11vJ0Acsl6gSlPGwlN2WqTPd/E4PADgoRx3
X-Gm-Gg: AYBFou1EkMKrqkGd/ISXZm6HdRxFGG3G/1uNAhorjPYJRgewpBd83g58JLV49ueKrwz
	vScf/hBh0EZs6ZZakUGQQ3YAlH+V566SxK0aNMzeS8AMcR6RteLmHfrFOA6ZYYcAp8HCrDz19hO
	Y9kT08xtX970cqBteAp87COPW7/BdUONNlf+Xpk56GcwpfzQUTnn9aHV3j9dZ4K4idFsGyIwV5V
	McO3HQhKWx0OpCUhyp2OIocGgkFVx14pqnvGcoeHt21kByRaxDxVrYQ+YzR63jMn9cXUKD0YTTI
	A7gd8xVsIeaIEgk+v9+kNbzjZKus8jUoMF1ICs0mRP7Q8DTHn0NXpUrt6vKDg9mY4rwQprB2BxA
	bJyj5AQisMWA9pXBL5AGvKZCEfTX4yi3zmIwEhMfASxxzilu7LU5WWChdHSykWzPQegrYBBl/ny
	5899bI1F9nvRAPcDDeR8N0i2TKhid9Dx5MIHVKmCrW7Jaydr76NxlXwaYB7VC5z2nSOkDjPu/Ce
	hbI2pPVS89osXKoCKIVjNWdifWeUgPnLqLkCJdFllpBXcNjbzqWn6si24dLsWePIVYTN1S72AeG
	T7ZNqHBCt6hfx1t53frwzl93VfqgWIYMpwvQG6eYa+qLucKbGxHYrgqEIhQJWc9agTsTIPFxokz
	S/mOzi73esfGzqbb5iBlHdikTDaSo/tUnhL0=
X-Received: by 2002:a17:90b:4f87:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3ae897f6e6dmr9433576a91.35.1793680533365;
        Mon, 02 Nov 2026 20:35:33 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm9616698a91.0.2026.11.02.20.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 20:35:32 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 04:35:32 +0000
Message-Id: <DMLAOL0238CH.43SXF0SFHONW@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v4 2/2] bpftool: Make the LLVM disassembler an
 optional runtime dependency
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <socketpair@gmail.com>, "Quentin Monnet" <qmo@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Nick Desaulniers" <ndesaulniers@google.com>
In-Reply-To: <20261102-bpftool-plugin-v4-2-5a853e973db9@gmail.com>
References: <20261102-bpftool-plugin-v4-0-5a853e973db9@gmail.com> <20261102-bpftool-plugin-v4-2-5a853e973db9@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 04:44 AM Mark Korenberg via B4 Relay <devnull+socketpair.gmail.com@kernel.org> wrote:
> +  else ifeq ($(words $(LIBLLVM_SO)),1)
> +    # Don't link with libLLVM.so. "prog dump jited" loads it with dlopen().
> +    CFLAGS += -DLIBLLVM_SO='"$(notdir $(realpath $(LIBLLVM_SO)))"'

sashiko is right. realpath was my suggestion, sorry.
Today DT_NEEDED of bpftool has the soname of libLLVM.so.
Every distro makes that name visible to ld.so.
The name of the file behind it is up to the distro.
The two are the same on Fedora 44, where you tested.
Where they differ dlopen() fails and "prog dump jited" doesn't work at all.
Pls use the soname. Something like this (not tested):

    LIBLLVM_SONAME := $(shell $(READELF) -d $(LIBLLVM_SO) | \
                        sed -n 's/.*(SONAME).*\[\(.*\)\].*/\1/p')
    CFLAGS += -DLIBLLVM_SO='"$(LIBLLVM_SONAME)"'

[...]

> +	lib = dlopen(LIBLLVM_SO, RTLD_NOW);
> +	if (!lib) {
> +		p_err("failed to load %s: %s", LIBLLVM_SO,
> +		      dlerror() ?: "unknown error");
> +		return -1;
> +	}

"bpftool prog dump jited id N file F" fails here too when libLLVM.so is
not installed. It doesn't need a disassembler.
prog_dump() only writes the image to F.
But do_dump() calls disasm_init() before it parses "file".
Call disasm_init() after the arguments are parsed, and only without "file" ?
It can be a separate patch.

Also common_options.rst still says "linking against LLVM".

pw-bot: cr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649765;
	b=OwlCOs4l6gyyMXaUaLpsS54alekIVFirs6aNDMK2Pw17eiy8bElz1fNFX36y+MNN8gyM
	 fdgiAALSQEdwt1Yx5YOuiGHu4dgn6G9zrelXlE2MNuUGAhQIxUQSmUfP8a4xasHZDGfFk
	 R95Z29oZeB5NLnqJNdjKkZbG/ZrO9T90W96xEzqevD2+NStKO0Kp2KblbHL5Fre1gBTwr
	 5wjGTDDF41xwZxAF9/OTOulPjr/r7gx+3WNE3nI2ML74JdRVp6TwSULmL9GsikMHONpTy
	 VLNwwdM6upMVLLfI7obmIK3akA1iDDuV30rZ8gmysz7TRcJMdm0z6HSkUH0ND0LjIig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
	b=hZjlow6SJBm0+o+ngSwLPAJOtsL3eSHHA/ya5t/43t6joLjhYo+cQMseAmrv2/qjeuBL
	 F6NbNngybvtGQ0nddSkDMUuYbYIR5cX6wG1XNiY52nhd84Gj6W4dNHqRHt2AG0kDlgWoC
	 8eL8FgptHadXWWawrACaITyvk6QL8OlpZoeKE+G92GeQtox1L9VGDmf/pgMO4hpfYXIwf
	 CiKrgfWOKWPQv+q3MFV23AZyXN41rO0owkYrWsCT78gF4bHXmCNuuRmX6QSK8aBY+egTi
	 9UceNHTZ/HoeNZHr18Y+V4pKu81OQ91VmyNzORLMDH1WLZ4raqhutCdts4MLFvfMgVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OvcKou7t;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F9606D803
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 20:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674F9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OvcKou7t
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c49b431f022so502264166b.1
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 12:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793649763; x=1794254563; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
        b=OvcKou7t4D4vGnZjt6HG5xZRuaabsvg+G0+PzsyB9TQ1VwbUjrzyWkd0kcBrBMJWRN
         i32oJRn7SB9a8Z8T9EmyOlvjQEldK6urLrmLv7PK2YD60aVTxGRjTF5e79n+862yNvjx
         wVG/WmgeoPJKyI1xsZootcNHXLjL+WaXDU0B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649763; x=1794254563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
        b=eKusDgtMM7XUhVshJ3p9HMQbH0wD5ZyEEdzHMvoglEsKS1KYs2Y5tpN+KZPCG4vCZR
         3dulbP/Rq8u/uo/erHI6Z8SLjhSsVZfid0FXux0Tz6WKoi51Dzwo/yTCmncZetb7b7Jh
         ypA5JUWSK8jaTm5IYgJ1fgtjE98NMuSW7XKbd7C1iZzt/Ha7EkfCQRdiGovr6/Ra10Ba
         RCcHt3wtqX58woQB2twJUNTSFsHYydvv1HjXjlNMTdJ0Fo3ycOMtQf1NM4v3rISu7qft
         4ii1L31+spMvOuoKfupw1lrQaATHJ41O39se3uHIR5nx1wFjAV7955DPPbR31L2RJugs
         I/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlvsZguqLY+R9UHDFYJf0iOTupHvgYYuEww1WdTeWRLw7DbiTIu1hipOkmlTy4uG28CIRC@lists.linux.dev
X-Gm-Message-State: AFq9FYLgMoUvzBlfHNeMYrL4D9f55ijAnEptXFc3cp4+QaSQPIF0zi7D
	6DMkoQAQZxQCkrZfzMf11gc+kwMQb/TA7hc7bGkufejerAPt6snyBYfAibhgDcOCA0SkftXeZOW
	Juf+J735U0Q==
X-Gm-Gg: AYBFou2yxb+X1+CqhxZve7tDUGyCxTHJOFchqNSEV4aYeXoXdSjqlAZvx18iqt7dfUV
	EKTqQH+Hq7YouMfZiYjuEckgkoUgxs8wJhBpWcv0Bo5mKYr2Q3pCO9QCWarjxdUG/qOItxZDJnp
	H36x5GQCxN62iP/73iTAgm+xRxMXsy6O4jl5CmuLHe5b0vay+7L2NycLXgxIfF4H9eqAMzbW/1p
	UWQKHK89IBBXRUXUClUXgsX9IuPwTCs5RgcodtV/5FF6mgv8WXtvz1rCX8qE/a2TawO3wb4Yb5k
	Cf/7cmaOuLq0wsh321dXVQ7PcWuyAc0juakrKAZ858paPakrx2iLMrHzM+pWaYPnlWN8OUWBjA1
	Pm7J9noJHrh4HQmSh73SZwltHdjgv3qsuMq5TDo7G2yyZjqoLG90DcSSF9PvQPucoS+UPpxxvkB
	AWlRZxH7Uj+uhWoIqzSapY30FDjksO6wEMS2XnmRuB5gbvHVoAZdrsssK7fY8IV24+Qd083HIBQ
	3qVoaoJnbEgKd2DAa/IXwZgyRIEqPrhzjmDr1lBTx2+IZtkde3WTZ9DTKs4XUVzrUTZ/HF/YNLA
	+JuWlLfja6FJT7ziYzvCMW5F48NFI9GFUMWiNA0Wct56rBmoPO0zSNj3BwfW/Bff07quiuSk+5z
	dBA==
X-Received: by 2002:a17:907:969e:b0:c41:8e21:4d5a with SMTP id a640c23a62f3a-c4ca793c08emr887155466b.5.1793649762652;
        Mon, 02 Nov 2026 12:02:42 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebdb4bsm20022566b.15.2026.11.02.12.02.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:02:40 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so558542566b.0
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 12:02:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzea49MHUII5H3hKUVFcTQ1ezaMVqvo5A4EZTUw025cD+OVlpmLrVYGnJJNKqCO9zHWM7Iz@lists.linux.dev
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c4ca793bcd1mr889097566b.1.1793649759046; Mon, 02 Nov 2026
 12:02:39 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com> <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
 <aujZL2d08hMp7FK7@gmail.com>
In-Reply-To: <aujZL2d08hMp7FK7@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 12:02:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTusHLshsm+9TXmrhVrrnKGe2v+7H+v2ts-3iKXz81-Q@mail.gmail.com>
X-Gm-Features: AclHuK8so_cX0Chmq8CoJqiKpip5709cIPe4kHMQDG4wgsRmhFrlietYcPQWT60
Message-ID: <CAHk-=whTusHLshsm+9TXmrhVrrnKGe2v+7H+v2ts-3iKXz81-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Breno Leitao <leitao@debian.org>
Cc: peterz@infradead.org, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 10:49, Breno Leitao <leitao@debian.org> wrote:
>
> I am looking at this on top of Peter's "x86: Harden syscall dispatch"
> series [1], and before spending more time on it, I would like to
> clarify how you see this suggestion fitting with Peter's series.
>
> Peter's patch 1 makes -fno-jump-tables unconditional on x86_64 and
> drops array_index_nospec() from the dispatch. Patch 4 then marks every
> syscall __noendbr, since dispatch is only direct calls.

So I'd just make this all a generated asm thing.

It would have to be done as asm, because I don't think gcc (of clang)
understand to use computed branches. They always generate table
lookups.

And doing the system calls as __noendbr is fine, because the resulting
code never does an indirect branch to the system call. The only
indirect branch would be that

      leaq table(%rax,%rax,4),%rax
      jmp *%rax

which does the computed jump (the "table" isn't a table of pointers,
it's just a table of 5-byte "jmp" instructions).

But *those* would have to be marked with endbr, I guess, so they don't
actually end up being 5-byte at all. I guess they'd be 9-byte
sequences ('endbr' is 4 bytes, no?).

So the actual sequence would have to be

      leaq table(%rax,%rax,8),%rax
      jmp *%rax

with that nasty generated sequence of 'endbr ; jmp syscallX' for the table.

           Linus

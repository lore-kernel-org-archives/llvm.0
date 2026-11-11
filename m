Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422911;
	b=QhA4KsFnpgN7HhkFzzDrCa94A6L3ZjUs9cJWGcUxpYRCOyB98RTsdtfO1/9jQ8E9rATv
	 BvywfO7yHZpR4BXMeHEbraNZSXKq3HBTgzWl3THvUXtinK4EnBfUOXEjo8Okg7cuRRzyb
	 O88t1WnjEXqBuQ0Rn+vbthELMs8BysQUrhh3npmVtpPTca2zXQtv3vhMydkVnDXSWG1zW
	 x+G0Ggv8j6ETKfuS3a+ZAjJvJi9pGp9BGyywf0qK7Rtj+dAUyM8F+zu/1JRkxcYu8l02P
	 AkZKt5+YnljIdvLffI0hjYSEK5on0C0xLyquqfyZjfwdgvhh/3C+HhskuuMRni/Jggg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
	b=pMt/ZBmA408F18jrr6BmcIfpO5EhGCnUQyBMJyXV9ZH6D1f9cAgm8gabWnDOe3wv/Bj8
	 /J0Oov4zJN45j7xL7SgF83CCuXsAG3NpBCO+gHxVD5+h8r/MoXEsSohLrWG9J10v/E5Rd
	 Fd+sP0uMW/6frxoMmiIpXRk5DeK/ceK1wCfGamo50cZcry8PJo0rjw/r64flU8AmSp5Yc
	 Sf+C/hOOTqhRylsqFAnZw5EHq/zSlPf9tCPtt3p2XsgMI7nHAI3mlQAa/EmnLN0JgVIcz
	 aa0KX1MeGrukP1FfHKPf2PEI9w5mxJrpZuU51LDSa+3PmW+J0oqvYQ/q99mJiLl+qcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFsggIjJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592D8606A321
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 592D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFsggIjJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37123334649so87442eec.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 10:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422910; cv=none;
        d=google.com; s=arc-20260327;
        b=QpK+ozrMaTxeb4D5D7No1P5i9EbyI1TsgpvN2+L4aY8zEOZprF6PM/lWhhM+SJ76wc
         uPSA1zVGGM4wtcdg9wGvbZnDmgEJtml3sVPxj792MvgRgRh3D5Tqpj6JEhTWj02dBFwg
         j9KU6mhH7F7kZSj3iGO6CFM3n0/MqH6BgWeSt/4MAsm2Hmnlth7IxuZz0qQwQt+XwJ/+
         fmyJSE6fauUCHfepGZLirutlKVkffTEZ+0QXBYsWgm1ehbWVSHd4lMj46p9F8tMgS8dV
         y4Caxi3Dv9jegA/LC5+sCGqHydmyNsJWnU9Rp4I1YPWWWYQUhaMdtABrHKgNeuganb1u
         ayWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        fh=HfxcvW+k8VJP7nBo9EE8ROiYpXr1hgkARV/+rnA7j34=;
        b=RWpdIaeK7OhRyhyXATjmfG5iKVibFZxOAZX3lT1KTcw1kXygC3XhZocCGMhx61njOi
         Au0zW2hy2y0+QK4iaNEZxDQlhY1KBIw/y2qeq0b0sQu1YN20BsVrExDjoVLScs8HozNl
         UMplDTXfRU+6LTcwoWrfwOIzkLW2T7Kkl17bA0K1vRD9BGlkgDiGK9bn3079y/NFEtNO
         b9QRioW2VTOWT90YPcTBB+l8mV5ipvLcHxzAJhuQ4Y5/W1dBsBEQXQOvbiFEQs5k6/4B
         nm/gXffJLlYINb56Ah+3BSyWjwTh6KaYgNN+gXq90XDlRQgaR6H/fgRoRDb1EcOg1976
         82bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794422910; x=1795027710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=TFsggIjJa4dMMT4q2vmrzOHJeo7N2bTJ/qoQueW68hTMBu6RelzyxDLYxIEC1ZvvlL
         SlT0Na+K71srTW+7Pu9+1ro2+UQtJWqgxY1rnP7IDKy0Kc/9uAKr9unFpLoAdHXvVSZU
         nXcUWA2VCMJYh7FeL3SgplyKqXVh52XRCO2BzRdYXe/K1Mj3TR+gFwN7lXmpfpnJWCRO
         FB5V5uQ7IzpYIpMeBq32U8hnDkkDGkBoaGc9koMX1MsiQWE7KOq5wa+Yz1D/rdjbukqZ
         4RDWwU0QXiKAsi3aiky3aPJMZi+2QPLdcRzW4Q3287+CoOhGE1zpxt0bG10NB/PcKPyr
         rZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422910; x=1795027710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=LMeEzymjCuSqq0QRySx5NbaGdqCYI1b+ITev+V758Hhbhad7Ugyt4d+Q7xX+4C6FBa
         lfHPvmIMMVUA91RFGV+B5a9jwz6M6hKZgHBEAxqEnbDLLEvCf96Dr5OTeODDoBJzUQQa
         H5OprgeB1V0xFtsvSIJ+RpB3CYbbXKfU1/QzXDpuvgCov5MWkVJxEf+m5jrV7QIz6BTW
         URP1TIT/B9Hrgj4vFwa+ytFeXj+TIRwkVco2BTrIUdwHcwRmH6/xJIb1Z53gQbF52zMG
         uc0e1NenXqSZcbqRVQp2rSqfleOmJaeaTw4hLFmHoaCDpKQNTZudETXQmSOlME0yPfV9
         1lww==
X-Forwarded-Encrypted: i=1; AL+hErH9BjUEHWKspaKJvZQJSAsF4Z3i+HtI0qgt+iBFSm6s9k/ECeX2rZd1OmMiSz8Ti+/h1Qf7@lists.linux.dev
X-Gm-Message-State: APuU4Z8B8QDw0U8+Pd+pam3F/rhhulD3lw3vlpqQPkcwzES9NommnlzG
	JXi4AHaL2ZZ2GyOy4bMFmIaYiMBTevHwr0KWQQ5lpnBdk09XZCXY4+s7Z8ZNSfIooJJxvcnYioe
	IJ/MrB+w7LkrLhwq1sEp2l9zzUTR02RE=
X-Gm-Gg: AYBFou3jAuTXVvE9qUyKWAacsKGwnFkvmIRwL3yIIFkkq1jo1EH3ehu7w4u/W3L7Fqc
	F1+qQ0Sq1UNMdXhjL9xkv7Y+qWDIFL6v+pTQU10D34qLdVT+U3DfIndJsP51Dlyi11ss6JpbFLh
	L12DiuFzvvAZSUCAS1YQJMnz8a4jvpsMq70aRs5IBGAT/h+tgm+t8TFzn2fTZ/5tBZOXHWVWzIw
	0bsG25WQCVW8OneyS+6xLRJzlJJ/xsNWnMT6Z+cM+z2zTOHhj0mMmg6We3KuWj+sOZPfrP6LSII
	5YO06pdAmIo6uEFjm/CKpmZpN0DFaGebxZbQbKau9eQc+GTpZwW8jJ8vc1emqBa4rXLLzcL6Uys
	TAKb58Kt9Yj6mG+W+W4Ai8cd59NtrqP20kmeuTgiV3IC4K7vE4mrtrWrSg0FmdB7hQSFp7AWul6
	0VCSupChkGGLui/mbIB0OoeRvWVGRqzpzMxL/thB34Msfjjy04MhWTXf72Q4gTbEzDrObBFqU3B
	RfTfAl+A2igCGrFraUa/byNYsZdR302vEI=
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3768460b9dbmr4877420eec.1.1794422910327; Wed, 11 Nov 2026
 10:48:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com>
In-Reply-To: <20261031030807.4101384-1-jenhaochen@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 19:48:17 +0100
X-Gm-Features: AclHuK9PxmaMrHpe5K4M3MU9aV3mfSN5iKc2YgWLgeAIQXIiJu5uOX8RyqAehXg
Message-ID: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
To: Jenhao Chen <jenhaochen@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:08=E2=80=AFAM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
> and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
> post-llvm-link $(CC) invocation in scripts/Makefile.build and
> rust/Makefile.

This sounds reasonable, but my LLM spotted that Clang will run
`AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
`rustc` produced. So the profile ends up indexed by Clang's renumbered
discriminators, and then the build that uses the profile will not find
a match for some code (depending on inlining decisions), i.e. that
part of the profile is silently dropped.

It proposes `-mllvm -no-discriminators` in
`CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
using the `rustc` ones.

Rong, Han: is that expected?

Cheers,
Miguel

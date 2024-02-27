Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2813A869
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709035986; cv=none; b=hSrjv7QCCdjDwjs+hPKTI7VumZ/FeTWB0Ay8dHggJVVjguwy62YvAbWAwWZByFBqKn4hTohF1ltmt7+x8zIf/vM1lYOh1PYGwm30/Degg4DGES9VLZFbvDAkYEAQV5xZvFAPvw9Xb5f5M5LOnwf3QDHXLN3gRZnhGjshZ9QnZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709035986; c=relaxed/simple;
	bh=PNfuFy5Ba+D5qLkPXV/F9tZVKt/ke8CC3TLHGloyd2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgM1DsJkUa9/Tdtri+bw0ikMfdU0rrAF1xxfxPAxvkCv66W9KfSgQc+nxnfYATv2gkExG5p6WkIWZG2MhN0oUHQAMwjjPQMIsAYp6qnLquicrOtkoULgkAHjY7ZRv+97aJmt80Hw5Eml8kqJxh2smgnjz+QQvjuQTiiHf91qpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQqZCz7t; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQqZCz7t"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29a430c3057so2256451a91.1
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709035984; x=1709640784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNfuFy5Ba+D5qLkPXV/F9tZVKt/ke8CC3TLHGloyd2k=;
        b=MQqZCz7tjOUeRAAfvU/M6izFJTDEGgEPmA6MfXf+BLSu/Gi3Qy+QpuGLMjL3G6UpGH
         DbNChCLEn6Z1wcloNTmlE9FMNXSSWEWdSSqcjRDUSj5kDwZRJkwfK1snnWePIKAs8mwJ
         D21PVe2wsbzcEuuioTC901DUjmCX+BwQiV/0RpJkGwM4xVh7Lm0pzSBLALlBIDgUeeB5
         iPXOUYifOPpSRncX/BHQiiP5Vhbf2l2BmQG3yZS5MzM5mh6PYHH5Hykh90cbsD2IR1gM
         xrIlZDyjIITqWzGAuNW8UDx8XrhDVJP5qMzQjRoSRa22rdGu0p/RaZ2rRBWWQwJgTI2S
         jQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709035984; x=1709640784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNfuFy5Ba+D5qLkPXV/F9tZVKt/ke8CC3TLHGloyd2k=;
        b=ZwY/VNdEgzFwcdypGjGrVRQpuB/kpdocRa8HUXAX7VRprTFrgzQQnlj0aY9hXP8WfT
         AK0QldwPOnZGTE9Jp3RrRcAFDzyWMJVhBZv01W8sTWcOi/LG5edY6zLS3ZNSmOpLLwEa
         qnJlxKUirvGdTxT9Zh8zPosQfIUqksZFSr+0U5k7xWiBOoltXg50UBE2MfzSnzb5J7nZ
         AGjrW4pPgxVQjPNVm68IFc4CgGnJoBgswBjufLbd2EHNkc+VW0OQKAFp1prxZ8UY4Uc3
         J2SGIgp4DIOB+qtUjdDek/9llslcFVqNXXYWvU3dUu5dBOIjBL0GAhPgaohHS5gOoRZO
         xzCw==
X-Forwarded-Encrypted: i=1; AJvYcCXVKd1G9w3gxU5Ar6p+IHRZ8TGau+vpsXwb7FQ4pqjAzj9SzqyuTDTMUgJMx74dgOiPcN8Nr547BLbL8MOjje5Gqxs2QA==
X-Gm-Message-State: AOJu0YwLnxq6u+CIZ2vwqoM2p9LNDxMfS7xZw0B/iBm6n8iBAQh1hD6t
	sLbuFt536tk2i7nmyHXV0weNPJSA8exe2bm4iNnGS8TxnvWZiNL4DeBeRcWczYXosc1xHwTYlGp
	xQk42r34x2IQKR4rnFk8dmRT68jM=
X-Google-Smtp-Source: AGHT+IEZrxxC5KTd1mUmyNpa02ckU0dvc0XT6naKz7W71hSie5HLJAV5L6JVbDjYli/t99gdzmOA0c0J+BbxKw9TRZg=
X-Received: by 2002:a17:90a:1b85:b0:299:6a7f:3f55 with SMTP id
 w5-20020a17090a1b8500b002996a7f3f55mr6019384pjc.45.1709035984277; Tue, 27 Feb
 2024 04:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy>
In-Reply-To: <20240227-glove-underwire-f562a56cf2c7@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 13:12:51 +0100
Message-ID: <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 12:05=E2=80=AFPM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> My point though was more
> that either this was acceptable for v6.9 or would be v6.10 material
> with the same mechanism as arm64. Rebasing after v6.9-rc1 but not
> adapting to that way of doing things is what seemed silly to me, since
> if a resend is required then the other improvements should be carried
> out at the same time.

If avoiding the `target.json` is possible, definitely.

I didn't want to assume it is, though -- e.g. the native integer
widths you have is 64 but the built-in targets use 32:64 (perhaps
there is a way to tweak it with an LLVM param via `-Cllvm-args`, but I
don't see any obvious way from a quick look; `opt` does have it,
though).

(That is why we supported `target.json`, since it gives the most
freedom in the beginning.)

Cheers,
Miguel

Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EA215F48
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001180; cv=none; b=DnemjHFTApoi0Rd2JUvHE/u5VdN8BExL1nfaWDNzqisSUqjfo8Ufyh2jyCp4oss1oE1/UbaYNiQf+B+LBGUHv1CCGXdtDg+osEPBziNKK+F+cV8eNj9/d3RpM05E5P/BWwKuoGLrI/AA0yGzQB39/GOztW+Hx0IgWXxbCBu3gQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001180; c=relaxed/simple;
	bh=ou5tcv9JxiL2u1j3f5J7z0CBvUbEeh6Xv6UWW41q/Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIKGvnzxPoBsNSjHGV7G/i5tIHPHR6XzM0SRVp8mU2ReJjuX74SQDJE/fVYLmQU8vUswxRfxZO9ekltSaDgzF4IhHnKpiLMnzD4ZzyAz7uGnmeBp4Ug8Oe5BFCzhmYcbptKDMBG5W3rQ089BBi5FVewIBDIO0qZ8nftemLsRoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFmCBZsl; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFmCBZsl"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b03bc41695eso237884a12.3
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745001179; x=1745605979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFANXjtKTfEx9kV/YD0moYxXkPIgDxsA41WYPtohNLk=;
        b=EFmCBZslGzy308AXDtZKZl4tZpTknkbVKHA9jp0JqroRpZ2qPKEs956fpOCRmGuAH2
         JPBlMfzTH7Hv9/W92qgNA0zOJt/e7uilJuaY21EJ0rUYq9TXlFN3Vz9JDfHG1c/VdctV
         luoshN/9E0gAFK1fXiUSGepA6miAzGo0EjR7HNFVt3ioRggL2uWrrTtMDYDUQoRblzOF
         e0hcUeVrU9APZNOMyq0Q3K5omse2k60zFn88yWWKZNrHm8Cn/6LylejB0hjg73DkgaA+
         D9BdNAKtWg9/6zWlJyPHydZABCoxXpLn+Ewz/BFB9Uw/pkkU/mfV3TwZ0nlyYUV4HOXk
         3GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001179; x=1745605979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFANXjtKTfEx9kV/YD0moYxXkPIgDxsA41WYPtohNLk=;
        b=OeetaFWrTGy4+Z/ebTyxotJcAClASKNIN6hislC41rTqP8TB0cAdJhNewkndVcTU32
         3/REWfHfDFDB+nI+4cKbkIz1Vrawr5H5VgMN3JfG561Fr8PIPlYQE4qANdOe50OTyb4+
         y0BqEXiQNNq/GBFQRvzEDxx7lf1YcuLleYe9rcKZVvtl5MuK4uweAYZgpiNZWk96fZpg
         SYZ4jOQKgst3mYELzoBJTezkMdfnPHy+t79TSZ4FQelwYT87KOUtrE3tSDiyd/XAOFwq
         XBALB1wIeVQs32cMYzkXwhBMwDnQ7lsuNTVlAt1lW5eX5C1q0zk9Tf0jebukUVd430V6
         iZdw==
X-Forwarded-Encrypted: i=1; AJvYcCUxpmNGwrV9uWcEoYFOUKSRjuRBG5B0nLoyw9A6ZeIn0jtKxcL25yEG+clRNHltaRkdJLSs@lists.linux.dev
X-Gm-Message-State: AOJu0YwPmsuj9wYJpAtfrILOblplkpuLdDWmvsdoO4flWb/n1UYBZQvB
	s4KV4XTjM5cXDmEpAHg9QKiPVOfH9MsTThNsjTPrgrHQz7a7cyMO2ixtEpHkXUs2cLOnnXmvKka
	5SJpkflgavUeHs+vk948TywIPKNQ=
X-Gm-Gg: ASbGnctZkuD8p+ytQ0uIWlGyyR9OhdGaQyaPhidUHbbDuZEIttUO/Nzfzqls0RzuGgp
	WOeFX9/MaLDV15cQ0G3YOoVXvJ8O556+eEa2vzfgGtLASzgkzSAliGbv4imf6siyIHUFo5tJTW0
	GifnlKUlpb1m8Ut0kroATS6w==
X-Google-Smtp-Source: AGHT+IFADhdep+T0QJPWyAyGB7omOjzqUUQUGaXKFwOncpJL98lO4epAjyTx4Uxd27a0AOpj/taau4IzgTr9RsgnsRg=
X-Received: by 2002:a17:90b:1b44:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-3087ba5cf08mr1856703a91.0.1745001178768; Fri, 18 Apr 2025
 11:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418161005.2425391-1-joelagnelf@nvidia.com>
 <20250418161005.2425391-13-joelagnelf@nvidia.com> <CANiq72nCfBdsfKzP72DWxLBh+Eueack9sS-E97wtsr0UtkAnUA@mail.gmail.com>
 <42da7c8e-08ff-4b04-ab58-6c0c2e287eb3@paulmck-laptop>
In-Reply-To: <42da7c8e-08ff-4b04-ab58-6c0c2e287eb3@paulmck-laptop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 20:32:46 +0200
X-Gm-Features: ATxdqUE11d5kf2E85BZuTAmKAI_UEsrp_SwqW-Oi0y3Ijarw0S_IvhRNYkCwLgs
Message-ID: <CANiq72nE2cH93W2qZrzAxfbz3hjsw4Xy0YYNwOUQ74SeGiirgw@mail.gmail.com>
Subject: Re: [PATCH 12/14] torture: Add testing of RCU's Rust bindings to torture.sh
To: paulmck@kernel.org
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rcu@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 8:04=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> Suppose we fired up a guest OS and captured the console output.  Is there
> a way to make that guest OS shut down automatically at the end of the
> test and to extract the test results?

Ah, sorry, I thought you were already doing something like that, i.e.
that perhaps you could reuse some kernel build you already had and
avoiding a full rebuild/`mrproper`. The KUnit Python script uses QEMU
and parses the results; e.g. you could look for the results lines
like:

    # Totals: pass:133 fail:0 skip:0 total:133
    ok 2 rust_doctests_kernel

Cheers,
Miguel

Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83914D26B
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3DrfCGU"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7b6043d0bbeso2042513241.1
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698834033; x=1699438833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz6VSHMner62jDzigXvDmGikA8eTXSz2/q7goADHTxs=;
        b=g3DrfCGUnuBeGweMV7WNVsQKrvfgHtIQdskMPLiuwkGK2pPF1+mNg7AXTicY/HmshT
         Ayl5bWWQSzVWvtSZIy+nWJnj/zFX7CW9fN2/VQO/wqOjAa3jJygSerGZs2yhrO0dKBbV
         OQrczLnXcnHoxxuenxd4SYmoGvj7/xsg7JG5ZqmP24JrdVSCDZGCqpKd9ENQvqUBVrBh
         ANnBde3jZOxyaoFlExxD1/Ty4dKi2WGtJf13YnCYjm0NZ99IjfOdmF75gQw3ZUIZESO1
         BqbvpIX2A2wj9CnBLS4EzqrqEsX9uI4uuJixbdEqDXOjx7VMLlg9JtGhu9PKTgbJzGwz
         J13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698834033; x=1699438833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz6VSHMner62jDzigXvDmGikA8eTXSz2/q7goADHTxs=;
        b=RON0+wWBkGqAV9RCqTtKZKOHrRnaQAXNoh4Fh0PLGPeHOFqYpt8pLEztaPxQaAkTgL
         5IgLW+acclwdMm+Zns2cgkKWMI2XE6h0alj8xXp+EwrU0o1ADpzjhaaEYzwK/7nBAIuv
         Jbacxlbf70rAnu4bqY3b1ZbopgnI1Ay9K3a/Ae8ZYUj/WHsth2SmSHb37d9dxXj2Cato
         Kv9UTiWMIwpRIwIzxn8KAV9dbqDIOd+cmAK59WmKhcQrM/O5chMPfXsTDTzBo3zDjcqo
         YkfDgnfyOvJrEaKmvHOI1h41GQANwTHuXxgx3jACaxOkqBD9yCu7BtP6/fPe8iMbqNyY
         K+Sw==
X-Gm-Message-State: AOJu0YyyvFoGMmhYQ5rr19tC/B6lDzaeP/HEPwKdjcd7lKwvn+XLwKak
	ozYDrwJT0BAov8nB5wVx7WBeFmERZYc2ApAmv3vPdw==
X-Google-Smtp-Source: AGHT+IHdsVmFFMJ9OQqgYB/RwOFuXkwU/9iXlbSEOFRRZoUtRdN6idmJL2hW80l6eDsFQldYkXn4iC8CPPcau9py4/0=
X-Received: by 2002:a67:c38f:0:b0:452:4e56:5e19 with SMTP id
 s15-20020a67c38f000000b004524e565e19mr9811075vsj.13.1698834033149; Wed, 01
 Nov 2023 03:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031201945.1412345-1-mmaurer@google.com>
In-Reply-To: <20231031201945.1412345-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Nov 2023 11:20:22 +0100
Message-ID: <CAH5fLggk=YEtB798S+vWHV8J6GZ39rXYcvVnm1apt_BOZvAooA@mail.gmail.com>
Subject: Re: [PATCH] rust: Ignore preserve-most functions
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 9:20=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Neither bindgen nor Rust know about the preserve-most calling
> convention, and Clang describes it as unstable. Since we aren't using
> functions with this calling convention from Rust, blocklist them.
>
> These functions are only added to the build when list hardening is
> enabled, which is likely why others didn't notice this yet.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB9F42BF5
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 22:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE/xGTnN"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f6492b415so43410067b3.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696888850; x=1697493650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaFaP65UCsCQ7UFZs55oDxqvd/C/aEIgYAqZMLZc35k=;
        b=HE/xGTnN6mtbQUhU95YKQRxmu9RS2Q1FROvhur8W6uMnsxi1VZB7OH28a2TMl72EVt
         j+ZiVTZQNzPxBKbqOatthstrC21LZHQJwz7WP9EbCkiexi0WKCGVMZKg2g/D35ePDh3P
         AkCfpic77QfBTLqjqbOypdwi548FIcDXbKBRawt8kzUrjU2VXVVdpnL2gJeGOgamiIHq
         cmKZvL6bQHzCL2hWAP9vYNT28mXZ7fs7pkcvdGyWWDi2VasG6bF4U6xAJK1df08jGz8R
         lsmLtmA3dlOiMVHcFl0FCQK68R4GzeqAzj+mSoiWH52vpIbNY05nJCRzi2CloxDBWdD/
         cGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696888850; x=1697493650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaFaP65UCsCQ7UFZs55oDxqvd/C/aEIgYAqZMLZc35k=;
        b=tW8n2HacGRR5LTyNviXyc7yuAVaeKaXJ9bNHsbJ2fkyQeWe4mYQZiSj3IPBzzwPaWX
         qIh1VcY6OhFFQPUvsnBgKp5lC7OXcuoQeG1nxZS1atB0OJ6n69zs+0lBMo4ZuZtvaD7u
         PKN24tuudC4n3iSOfXzIMM8lvUf/UErSla2b1dwr6NJh3tjLAMPOWkFRgQ3iH58JnnhM
         Y+xs2akGVg+Op6XA16BZZfbFIPkt33molhr4sgHAV7wIv1By8JTydF7gvnbQVEsXhnWc
         skRJBuRDgt93wcd8G1Z5rTBwSVK7jDLx7UdpUugrTAV5bp2os6qzLuU1qiRVR/ZsT5GS
         rQxQ==
X-Gm-Message-State: AOJu0YySZpF+a2aLucTtXvXDrwl8i6KJP8J6TK7vf6MohKVfpdaqTzd5
	wAqROf620j+O/ruFwP8hT1Fv0Fu1flRskWPU4Gw=
X-Google-Smtp-Source: AGHT+IHJn5aLVv8I0nHEAFYZqkKXk9+RdR00KxRNGwBs89E5Tf4VBtacqDxZFEYWVNFBVlRVBv9vOmV6h2CUAHAtCNw=
X-Received: by 2002:a81:6e44:0:b0:577:3f8c:fc60 with SMTP id
 j65-20020a816e44000000b005773f8cfc60mr8032221ywc.1.1696888850022; Mon, 09 Oct
 2023 15:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com> <CAK7LNATBBk-a0EJcxpWGJ9n+9BHQUw3a4s41LTtC-R8fYrVMpw@mail.gmail.com>
In-Reply-To: <CAK7LNATBBk-a0EJcxpWGJ9n+9BHQUw3a4s41LTtC-R8fYrVMpw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Oct 2023 00:00:38 +0200
Message-ID: <CANiq72=Dsaa77n-OKDZCcv6TWgxZf7R00n=X137WbsUzwgU4RA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 7, 2023 at 5:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
> if Miguel picked this up.
>
> Please let me know if I should pick this up.

Thanks a lot for taking a look Masahiro -- either way is fine for me.
If you want to take it, please feel free to add my `Acked-by`.

Cheers,
Miguel

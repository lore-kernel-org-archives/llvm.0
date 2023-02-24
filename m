Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE73D92
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 20:42:20 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536bbef1c5eso11271737b3.9
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ldkH3+tipVLOPM0MWXmtHwekgdqITx22yGZynxWxbI=;
        b=dtF6STP7th/ajy1mC0vEUSVWlM9pVmOG3Gn6XA5sl3LA9B9wF3UHwni7+m64GxjbOR
         VJ8YtDgIepMCXzo3IqidR6Cotkep2peyv5PLBE1o4qjySmPFQpBz1gTEVu5KwgHz/Avx
         eYeoxs0AEnbKsW+Lwxf7bJsfpZIVDXS8zZWVLrJl03lvJ4GG2rCmVqfdsSFMTAvwZ9hp
         Jvc/8QtR/Kx/MlWRP2gXnMW5ZZ1S0BWrIDDqfxxr2ZopFa9eZs9Inw++1fPcqsN9pfeu
         HkTMFCZv5T8sYU5ua56Z/XQ4SqtIwDjglQCvQA22GnAvaT5WFS0PSBOy/wmaUJuWNFfX
         HUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ldkH3+tipVLOPM0MWXmtHwekgdqITx22yGZynxWxbI=;
        b=B8lNoATNOWZegHv+6Pi8Pn95AW6RE4IlP65xb0McnHlk2ANIVyLZJDXdxPcmDCC0da
         GJe/q7k/EnV7Um3cC2K6e6QIVmaFGfoE3p8yWOJI/QMnA5LKVOfKXC+OOfpcIv5MzqeT
         2SNsQJHpNmLoBH0BRtbLEs5YC8sRg9kogw62ENi0+vhbjs8Fqpuk/9cHIZM6I+vapMdD
         Uc/uReFUO6Ga2TiW51P3y2bYtmdbq8L2CyLjQkW5jqq+YjvOVmEANO+TuUUJdQW7VhAD
         vHSrzHNYXgMdJY/URWp7Y7bQ6+pwYuAUulRNGQamYRfqQrAh+FcyoPioT9WAidanMiZB
         vSEQ==
X-Gm-Message-State: AO0yUKWl16bXl9XpMRIOfXFK/JrUOb7tQa54B/PXCbrLBBbOQ47sXSxW
	w2h7dv3ZSBIeeei3hg3+G/GSsTQ2myqLFhlKfaA=
X-Google-Smtp-Source: AK7set/+ywY8A6LUpNjag7/xfz0UOWYQ6RUky53j75FCT+hoIcIZqEDUzCcFtByz4LcO4y0MEBVqzL7jJFm3tgkYRFc=
X-Received: by 2002:a05:6902:1602:b0:8a3:d147:280b with SMTP id
 bw2-20020a056902160200b008a3d147280bmr810737ybb.3.1677271339810; Fri, 24 Feb
 2023 12:42:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
In-Reply-To: <20230224133609.2877396-1-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 21:42:08 +0100
Message-ID: <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, Feb 24, 2023 at 2:37 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> This is a somewhat blind (and maybe foolish) attempt at enabling Rust
> for RISC-V. I've tested this on Icicle, and the modules seem to work.
> I'd like to play around with Rust on RISC-V, but I'm not interested in
> using downstream kernels, so figured I should try and see what's
> missing...
> I've tagged this as RFC in case I've missed some "WAaaaa you can't do
> this" somewhere :)

Thanks for sending this and taking the lead on RISC-V -- I appreciate
you put me as the author, but in this case, it was actually Gary that
started the RISC-V port [1], and then I sent three PRs on top later
on.

When submitting something on behalf of somebody else, I suggest being
very careful and ideally contacting the authors beforehand. In
particular, if there has been any modification (including to the
commit message), then a note should be added explaining so.

Therefore, please double-check everybody that contributed to the lines
you are sending (e.g. via `git-blame`) and add them as
`Co-developed-by`. Also, please add a note of what you changed/wrote
e.g. square brackets, and `Link` tags to the original PRs/discussions.

See, for instance, what Jamie did at [2] for arm64 or Lina at [3].

[1] https://github.com/Rust-for-Linux/linux/pull/225
[2] https://lore.kernel.org/rust-for-linux/20230125163739.3798252-2-Jamie.Cunliffe@arm.com/
[3] https://lore.kernel.org/rust-for-linux/20230224-rust-vec-v1-4-733b5b5a57c5@asahilina.net/

Cheers,
Miguel

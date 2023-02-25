Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188317FF
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 08:20:52 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536bbef1c5eso41507177b3.9
        for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 00:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rltlccYYLls/6/80VLpV3Rr0SI6i9Yf8jKNTUIakO0=;
        b=N1+ynUBP7BIR8yJMHSCe2coIJ9/FqCzScTFU5QefhCaAtsPLV2gl/fke00KY3aAQ34
         gPD6eDZbDEFK9pfdcCc9u5rjZAKIZJPTp4CzUH4S00DYx+A8kqDSWoWYWgMSWwUzVjPt
         1/IuNUiTrGEWQNlkt5fobCt/CdVl/29/1SeP6QdfOI7ZcKl8Rw0NlufJPiNRmQGXau/d
         nRHYTbmcKdSeDGwmwFHGPDtpyrfbRvFtnqsAoFH/oBTwyYxMdBE7uijjrwrGn5ym/CDb
         nON6om1eA2m0SAHZQzzNC/iTKPX+HssPbFK4+hVk5mWJuCnT3ofpCsnPS2SEPlTskSU9
         5PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rltlccYYLls/6/80VLpV3Rr0SI6i9Yf8jKNTUIakO0=;
        b=t4ybovQ98mZnda3kJQFXXlTNSQS4EFNhBH1N8+YY9mkfjIdLAm5esPSkusKWPjISDC
         wcqMGEM3l70m+mH9r4O2c6hpKXTriTDEKMVB4k4yEMLlX7ArfynJXyNU5uPpWqijdPr7
         b7+pxD8NVOaOZ9zcgLVVZpDWZuIMMgjkx+1I7MTIRAtB0d3w+DAuoEaOLgbouU1UFdCA
         69D7xWNH5NiNSs4qPyET3WSOpM0f9ZFARAwDw5F4Ykniusco4ysWccEmwlbUuP3WuWGV
         LKn9igIIjE03+KG3iQXYvGTnDEhPjzXqdjY9xz3N7Dg4yrI4hrCbme4LM0Ga+E+vruvK
         0Z6w==
X-Gm-Message-State: AO0yUKXJ11tYU1gS5hcob2Ir/mxjP2AMOxIU+tLIqcUUenfsexabEw2Z
	gF07nkK4UpVZD6PL5ZnfxpM0+JMGezELdGvdYMg=
X-Google-Smtp-Source: AK7set8e++moIBaY1NhFio11TdxU4kRfW6YaKQ1izSqLuJaajhPq5FeZvpdANs36njnJ85ehD+Io941NVzULcQEL6AY=
X-Received: by 2002:a5b:50b:0:b0:a36:3875:564a with SMTP id
 o11-20020a5b050b000000b00a363875564amr4043718ybp.2.1677313251960; Sat, 25 Feb
 2023 00:20:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
 <Y/kldmYcl7+2FBRB@spud> <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
 <Y/k65INC1//tXe2U@spud>
In-Reply-To: <Y/k65INC1//tXe2U@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Feb 2023 09:20:40 +0100
Message-ID: <CANiq72mX+vCw=4a7X2oDR-WkVcaQ4KEV-FjYUQZKonJ0anw47A@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 11:32 PM Conor Dooley <conor@kernel.org> wrote:
>
> It was a few hours ago that I looked properly, but, IIRC, it was a
> conversion from config files to code? My understanding was that
> config files were not copyrightable, hence I looked only at the
> authorship of the code. I'm usually on the anal side about SoB stuff,
> so it is not a matter of me not bothering!

It is not so much about copyright, but about crediting people fairly.
Gary has done a significant amount of the work that eventually became
part of the patches here, and I would have sent the patch with at
least a `Co-developed-by` from him.

Not to mention every commit in the kernel has a SoB, regardless of
what files are modified -- I would not remove a SoB from somebody else
when forwarding a patch even if they were all non-copyrightable files.

Cheers,
Miguel

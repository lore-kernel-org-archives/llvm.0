Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385726FC5
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 19:28:59 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id t39so9322936ybi.3
        for <llvm@lists.linux.dev>; Mon, 06 Mar 2023 11:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678130938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ttfPrW0GRQ9nbvMrVtjoiB2Knz31FGcqjmMbmblOGw=;
        b=SU2Xcpc8fy/jDn5Hq/sgA44RX6PMSz8Z/CGlbTyvJvLrVhvSx8x2b1d6eRLg5UuFBZ
         9eVJz2MI5oZX+kbqnjMoreoLj9gtAXJEVmsGQH9WiYH5SIAaxVOwcUykaRPeUNNBY40Z
         p6N5Gg6h45DIpjQLit8V41JA6snJWQUyo8I+WomncvbRMQ/Q1RKTSADQcVgXWYMWXW3U
         BANkIPKJO9EOekb2ftXDbgdEMXarRb//A/+hqBYV49Ckk/3AGLVxvnH3CoiHh7ycyQEx
         DZ0cS4Sn1p/f5m7wcYMPv3Iio7GI4kQP1JdUN7MUomAf4xMjU4WiVFbT47UReR3zYTHi
         Sgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ttfPrW0GRQ9nbvMrVtjoiB2Knz31FGcqjmMbmblOGw=;
        b=f8r6ok4/qkYKdVLvSS2RC1Cgu20URt+p7DaOqWjDzbPv8l5FBnIJV//lu/k3ZJBYPn
         qsz0IrzRbtH+hGcTGHpWZu67gIYixTBSJq0oDvfnd2l87sKBzKUHzf1jbjRKG7ab5HrY
         KtRiWz9Jyw8Q6haj0N1iqM2VaAOd8Z7H/+jMubI2M+r6xe3vHIgOnEpQk+gzT/1wgofy
         kER0HbHN6MH8grhsQHu2c55HaisV8dluwKqzvLD/eLm1V6JlnfFXKroT7EeneS2s6eMV
         29NmC1TkL0znyHAh1ldYu7bhTQBQlMKiJM0kOnI4ZS3/Lo07DCMZjFpzl14aQ2FT4a4s
         0BhQ==
X-Gm-Message-State: AO0yUKWM6oFwHYgyWQTXRvBvG3b3N3TFnJY7Qu1pw6EElMETAe8hvVY/
	y5wQXIfOJ35ZbkNx5cEc3bjvCPw5B7uq7DL6E84=
X-Google-Smtp-Source: AK7set+Md8UTQSh/AP0LixVNnGi65tvY4YYP3IbXzgyvl8DJUVpm6e49kNmGaSXZTytFJEf4T12wESB3k1aIa0rjZuI=
X-Received: by 2002:a5b:191:0:b0:a6f:b921:cded with SMTP id
 r17-20020a5b0191000000b00a6fb921cdedmr5516798ybl.2.1678130938238; Mon, 06 Mar
 2023 11:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
 <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
In-Reply-To: <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Mar 2023 20:28:47 +0100
Message-ID: <CANiq72=hvS6KxxkLocFOrU4E4pNi=y4OuJLm3iSiPGmi5B178Q@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: gary@garyguo.net, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023 at 8:18=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> It's time for the next release.  IIUC there were some authorship issues
> here, did you guys want to re-spin this with those sorted out?  I can
> give it a shot if you want, but I'm probably as likely to screw it up as
> anyone else...

No problem on my side, and either way is fine! Thanks!

I think what is important is that Gary is aware and agrees.

Gary: do you prefer to be the main author or the `Co-developed-by` author h=
ere?

Cheers,
Miguel

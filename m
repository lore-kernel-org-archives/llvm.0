Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8D33CF
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 16:32:43 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5491fa028adso65901027b3.10
        for <llvm@lists.linux.dev>; Mon, 03 Apr 2023 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680539563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVyyKhZhVKFELaIeQcqrXX4LwNgdwjSlp3Qd8NQAQ4Y=;
        b=alovpYhaZ6LPgZSHYZtdkBDDP0URHuvySe8G9XIGLclC488EV1E3u8rlGcp9dZbnFJ
         /i8Lzo6P6svFjgqn96yjhxT0ADCbnoj2Px0Gowwg4kddCMBKZwm3AmjpfV+9Gkh1WaV3
         Z97HoGa5/whNh0FKrEWHg/Svs0YwBmikaDdmu7JOj1JqIRkjxiafRgY58IWwyeOxGfHk
         qxn0OLjqQ1rLbUhR6XiXIjMbK3SGCGFnx64x3b0ilnbiCCWmir8GsI6733wJ47xX31MP
         8LOYK1RonB8ftVBLCb7+O1MaQS79d0rkBJUTkpeJKXOg2rDoN4sEoZgmxBq1BSBKjYCH
         gitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVyyKhZhVKFELaIeQcqrXX4LwNgdwjSlp3Qd8NQAQ4Y=;
        b=WLM6lLzNSSwqic2hm/VnaYqEKHpVkajRYcxE5peAe9ROkba7yLuNdKBuRWpC1AEG7+
         ZnVUI3Pqb9xH/0Cgo75U/owACuEWunj6lG0KqGjIo07KP1D4LnadJTQvPh0L1zcNXKV3
         qF8wpkct3gsq87qB1qrgCH8rPYE2Yq/WkGM1FCAlvayvZzMCUw37AFLPKMxugN8SB88h
         9j9YMG/lb7JKOXH96DmZEajrqfydWz5y1p7l3dp+uDzf9sp1bXxiGTD3HlIVrZBdIEoN
         hrzCkx/vpMOGyDdzkQr0L6gRBFlMyppbA07ljNAf+ml/R4qQqcfsTRn5DSr1D7VQkJkk
         HDLg==
X-Gm-Message-State: AAQBX9eP+hZz9aebs1flVjOAacCXLwZuLbRgYeAF6FnMp8DlzEpFmrQf
	teH3eBN5OZy0NTwebkHavjzCOXRirUC80K6pA28=
X-Google-Smtp-Source: AKy350aADD43LM+6Fyr445lMNk19yeKF5hWPrYO4YfT7Tju/V/ectKNIFIvehRrqfUvXOPFrQuLZ31r3hVYGzRsmpTo=
X-Received: by 2002:a81:ac46:0:b0:533:8f19:4576 with SMTP id
 z6-20020a81ac46000000b005338f194576mr18159721ywj.0.1680539562651; Mon, 03 Apr
 2023 09:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com> <a6220e52-9934-422b-9b05-95705b8fd684@spud>
In-Reply-To: <a6220e52-9934-422b-9b05-95705b8fd684@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Apr 2023 18:32:31 +0200
Message-ID: <CANiq72=FN3zB-gajQYDxXmnmx7J0UNstFuexSCOg8Oe2fnG=yw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
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
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 10:24=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> Aye, but that does not mean that I am entitled to add someone else's!

Yeah, definitely! I meant that, from what you said, it sounded like
adding the `Co-developed-by` was OK without the other (i.e. due to the
"too" in your sentence).

Cheers,
Miguel

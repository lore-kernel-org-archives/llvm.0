Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2E1119D
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 11:53:00 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-565ba6aee5fso4319967b3.1
        for <llvm@lists.linux.dev>; Thu, 08 Jun 2023 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686225179; x=1688817179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl1R25aFlMknfZ0TZaTg0XuHD/qftBgk3A9a/qrvBxE=;
        b=JkWwFpUHXV9of/EMlxEglfiJIwG1whJEIcTeXTzj0r1UXBhS3QQTuzkkduG01/PtL+
         Dc6zQvaguzzgwBx7WI0aYdeB7ZdtueyKcmvT7IKVzNRsqhuqwtYMPUyjy1gqCKi7EY23
         SDoM2b1Qy5nIPOupVMsQuZokYSz/qFGraoOECWmgxh0wTrApXG7k5bt7SAB/kFmj9Ux4
         H5IMMf5fkjKmupydwZm55ILHeDzk4y1Otqyjwmj34EZ6NbSwkuOhAZc6ig5rU70vV4i/
         Y8Mwh64R+JCNUx3ml3+xihLvBqH1Ja3Dh1iA1tYZ2SdKKDpJQVjhW0iAhUfUpepA3d1x
         UUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225179; x=1688817179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl1R25aFlMknfZ0TZaTg0XuHD/qftBgk3A9a/qrvBxE=;
        b=ieae8LVRwaZXGtNuxfIOmYtZfLx5akYAyD/sSzvdM4s2qMq9wDkB741tKBxQ40YSTI
         dv60vHwqOgcuX7+fAxbPQAo3alh2/LsPNsjnNMbK7wCBmH0Ar+mXCByGtnYTt7nQrwI5
         jxwI1r/D+F0jIVITl8kc72TlGf69/NlhtNOmr8ryGL2ajObE7autyD9H8FQBrhOyPJJv
         yQa75YBIUM1ul1Rk1ntPvctTkjo4cJiNJsPbdOFHVth6CVq5sUGXT98hyDvX5kmzJxsI
         Bl5bbz5+D/lo56dzZHQQJ6Ic5XvPTTFOE1yr/J3y2R2rSNRl5/ntrl17v8+JkDJnmo3q
         F1XQ==
X-Gm-Message-State: AC+VfDy6FLZNzUqbjGsYoZYHKRvTS4aaGEK7E98Vx0cCApHwXgLsRVQr
	c9eEX2gDg8Jdzj6JXei+pqIFbjdHnBUfT0MU21s=
X-Google-Smtp-Source: ACHHUZ6h6dDyv4SxutQEfzo1GDIGkQqE4VT4CGwB81++CdMgJ3EN0Xs26iS4UkX3+1xwEFlXbP9izWEIR2g4zFlOcTk=
X-Received: by 2002:a0d:c584:0:b0:561:b246:77ca with SMTP id
 h126-20020a0dc584000000b00561b24677camr9370671ywd.28.1686225178967; Thu, 08
 Jun 2023 04:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
In-Reply-To: <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jun 2023 13:52:47 +0200
Message-ID: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
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

On Thu, Jun 8, 2023 at 9:01=E2=80=AFAM Conor Dooley <conor.dooley@microchip=
.com> wrote:
>
> I do intend revisting this, probably after the min. version for rust
> gets bumped, I've just been really busy with other work the last weeks.

Thanks Conor! That would be great. We are increasing the minimum
version after the merge window to Rust 1.70.0 (assuming no unexpected
issues).

This is the branch I have in case you want to use it, I will submit it
soon: https://github.com/ojeda/linux/tree/rust-1.70

Cheers,
Miguel

Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B333D2
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 11:21:58 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 82so11016546ybn.6
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 03:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6M7Rrz8d9sk58/G5zmHZtDU4PDW4DV0zcA0ptQ1Png=;
        b=UvPobudrKein15cSeOXHadW3ZwXyETu9tdRk/e0W67OcmbQVHqprMAqPs5BFbtRInN
         bMb0324eNAx+3ZRMjr0fYXKGBZ//61yIXN3o9Xz87LSxsjbWhsu+oDg0E6JsnjeENazR
         CZgdgsEndyjCgUTVtXV4OXqJ9POmLz7IwIanvZ4YrF91nK5YWyZjnaIO32evJzdmPd07
         pp4n5JdsJTv2tOXxrOaaZ4LdXFJwVLjcJV0mbdPq9cV385dnSujp9ht4BW9THOovXQO8
         iU7s9FaQ4pw1yIkqdjsnDZvp3YOrtzvlEg0GrliwRMC8uHJ/W6ibcE2v4OG0RdrEAKyk
         Rwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6M7Rrz8d9sk58/G5zmHZtDU4PDW4DV0zcA0ptQ1Png=;
        b=gf9yawQu3+RRubeml3if4cmy+VwHncKwD70QT55H3BZ0FKosZ7dzF0oqnHRjqYKxxW
         2mYwTK0lBha+lzspyG4uNfApcP4IK5MgSFE+DjrGZbyFzjOpGGNw1gtyyPELhneZRKBG
         bF1frX2cSoVwY7obHkvI0Fb3mnodcAnwsI8IBbxgcgtzkR6GWYuCUChDGzHGHSRnqHbO
         IbMhccWtft+OTpH3hZ9KJcJcFW+Pt2s+dVLp79sUWajUysLGv4ab72DggRj9Uo/uc9aI
         JSV0unxAD21pJrtbzG39+JUPJPMhAljNWnn3Y+O9KrdYNRCi+S28oCEcbkERHZwYICkV
         DsGA==
X-Gm-Message-State: AO0yUKXpYy6y22cf1VsV6jQ2i1x8C5KEcTUlhcnjsq3nkKstCqKRM3Z1
	2NfbgCDYjN0eUlIKZujHGjOu/K8/9XYtUA8D2UQ=
X-Google-Smtp-Source: AK7set9Xm/+t4RsbYIh8ZTtsG14e7fG27l8U4WG+CAhTtfNoZ/TFjDRHLzJOC1Pb6hQWIxMo+D0M4xfhEHmOcmY6vLs=
X-Received: by 2002:a5b:b03:0:b0:ad7:b81e:69bd with SMTP id
 z3-20020a5b0b03000000b00ad7b81e69bdmr6382804ybp.2.1678188117463; Tue, 07 Mar
 2023 03:21:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230307102441.94417-2-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-2-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:21:46 +0100
Message-ID: <CANiq72mB5jXPuLy4mcYsa-q4yjHeryVWZrDf6wavvpj5FkwMOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] scripts: generate_rust_target: enable building on RISC-V
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

On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> Despite removing 32-bit support, I kept the structure of the if
> statement, despite early return being stylistically preferred, for
> alignment with the Rust-for-Linux tree. I'm happy to respin to sort that
> out of desired.

This is a case of 2 "equal" sides to the branch (though at the moment
an error), so it sounds good, and it will mean a smaller diff later.

> +            panic!("32-bit RISC-V is an unsupported architecture")

Nit: if there is a v2, please add a semicolon to be consistent with
the others in the file (not sure which style we will go for, it looks
like `rustfmt` accepts both ways).

Cheers,
Miguel

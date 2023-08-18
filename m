Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2CE56C;
	Fri, 18 Aug 2023 07:42:25 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d71f1bc5735so652137276.1;
        Fri, 18 Aug 2023 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692344544; x=1692949344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umfRL0MpWoTpYd4eriIsZ7c3FD2yks3ZslXFGgBsLn4=;
        b=XdgKOepCjrtZhzCYElxYbGmZkvnFAhOOVKJ7XajE1CqtbKlSyuYPfD9wnkHFWKsAZK
         /qgFHNi/Am3zXi0FIRM7RO8HKvsPjEtzoOhggLD9sdFtcl8gPuiVqCzou5qGOJ2iTm+r
         0cmuqhf0FNw6HG0FmGOLJ/1nSAwqSoVRkBgqVoc6oTAgSw6Cr0h3wI3thw8TIHd70mng
         k4NwDQb8/8zYd4EBRD5qvJ8nuN09j65EkLhxX8+5Ggo0Ae7gjMMaCniSMBzM/F4hR1uQ
         1M0a8beVX4f3vYIxZ/jhOS5pCna6zWoLkNUmpMS7H2vRB93RZC7hzHSH9Hqe/ozOMEEW
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692344544; x=1692949344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umfRL0MpWoTpYd4eriIsZ7c3FD2yks3ZslXFGgBsLn4=;
        b=ccHzndqn7xAF3RPaEZgHG+PHOud8hoiQV0cYRfWKQ3Gl42ah923c/cB2E1WCcTMHPK
         TwohRkGbC8del4MgHayksGDAkgtT51fB7l0q6TXlUb8dTdLvemS2OE09In6692gYEdEp
         cldGnBwyrN2s+JeIhsAQCIAr6ZFG62bYrG9aJx8olagDQetfWTjCeVhV6lWnmHVCXTsd
         5CrNf7aarScGnxXYrq8k/jYZBVmPN5aBVhh1lU/htEfsiHMSpmhvnAm1RGrnjHpDFpnB
         g1tiDZbZI6BTtB2Xg9REcoy1vE1igr5wjkvtH5/Bz+Wua0d1t7WGd/fUVRVt+wMYYLkb
         opgg==
X-Gm-Message-State: AOJu0YyZfWSoHCSVgrLcHupoC2RXwpzVmncmKIDMWnuItYYQJrqHkocZ
	3/MetZGuNonns+UuW9XRpwltM/piEYXPHxEcE6k=
X-Google-Smtp-Source: AGHT+IGIawVbtin0TkRKDL3gBQm9Sj3hVasR4SGaVCXvIfZaCQ+HJ7dbDEcvhTnWuR57N7WHEpL46n7V55UiG4915Ao=
X-Received: by 2002:a05:6902:1890:b0:d4b:6a0:fe2b with SMTP id
 cj16-20020a056902189000b00d4b06a0fe2bmr2607567ybb.36.1692344544234; Fri, 18
 Aug 2023 00:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308171545.aknH9sjQ-lkp@intel.com> <CANpmjNMFjm0QZqaTwAKdQrBi7qnLv2wAPOXz7frYch-9dUkArA@mail.gmail.com>
In-Reply-To: <CANpmjNMFjm0QZqaTwAKdQrBi7qnLv2wAPOXz7frYch-9dUkArA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Aug 2023 09:42:13 +0200
Message-ID: <CANiq72=-VSH6HF47GdmF7+12+vdb2Lw1_b-_jPA6gQ2QTmQdjw@mail.gmail.com>
Subject: Re: [linux-next:master 9940/10848] thread 'main' panicked at
 '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_174_2)"
 is not a valid Ident', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 12:21=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
>
> Looks like the commit added some lines before this union, and so the
> line numbers have changed. AFAIK this is not a new issue:
> https://github.com/Rust-for-Linux/linux/issues/1013

Indeed, this was fixed by the upgrade to a newer bindgen in
`rust-next`, see commit 08ab786556ff ("rust: bindgen: upgrade to
0.65.1").

Cheers,
Miguel

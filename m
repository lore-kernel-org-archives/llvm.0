Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204891E507
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 23:22:52 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-586a684e85aso4962117b3.2
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 16:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691623372; x=1692228172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX5nWD6nwZ0YC8lAKmlrsyt9YLZW2gcQQXpVISIcYTw=;
        b=AJNodbB7pULEKvvBelok1Ue8AtbYE5YoY2LJFzSuTvJ2057iIwbUJkFxbNtk6HWbaG
         OIhJvq/ESdzOfHt51sFqcN2+IiZkiHstvhGAnaKI3CwLt+90qu87wZ32eeQjPiYJvucb
         pE9pwsVFYRtWQyJkrWEEUL7eFaLUFWu7DcC9fwHRy7dAu6A17Bp0yrcA0ccFkgkHHb/f
         kQNbKOrSQk+kU1CWvILxr81y/MuNUCLWIhhhsLaun/IfBf/U9VmjdYzN8K92DQd+7OCF
         TvDfMcBS+NG5fIpf/o6fopNkk/sTEBAdfVOTbVqyb3PF7EdSc45YGPyKCZL/4N7XePmQ
         i9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691623372; x=1692228172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eX5nWD6nwZ0YC8lAKmlrsyt9YLZW2gcQQXpVISIcYTw=;
        b=JnStheVRdz8uBpGGXu+o1ObGu4ArcyQsr5L9Q1/fZSSp9a+Cg3WSfe8NdksRFjsEHH
         SFTD40mCpZfQF7XR0JFqvsYsJeVJEskF3aHykEDwJI+1cGV6Wo/EsQfrp1Yqt0MwGJuK
         GucHROn5tU9S/q/h+Uo0xENlWKdY+sGDYXIv7hxtitJI3CDy9Aj8b3POtE9yTeg21pNz
         tRf1xCdjFc9Sra3s+Gk2tFTZGpCXn7B2LnS3OxJ7b4RYDkwWvcX+LvCpA8IP7iaMnWZx
         ckoKnKe+zep33AwvJNllONuzM/0nOwE6dLynGkvR9Cgx/XxQQnwmp4t6zLVcgoPhVPT1
         u3dg==
X-Gm-Message-State: AOJu0YyjAS085zfHINIasY3ctiLWpaQfFWPUWt2r9a8TsoKbMrsSJqey
	qJVgRrU44k49SNHF06H+r74ouPBAZwddvGKlz2XI6kjJh5yoUw==
X-Google-Smtp-Source: AGHT+IFn55l2ROQqeZHkpSZOOhd0mCtO8jpn4+XKjy8ae5184Z1cAa3UXVDgV//VNUDCROb/2ZiZ84hhaM5qmlcmGAs=
X-Received: by 2002:a0d:d602:0:b0:559:ed0a:96c4 with SMTP id
 y2-20020a0dd602000000b00559ed0a96c4mr779650ywd.44.1691623372031; Wed, 09 Aug
 2023 16:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230704052136.155445-1-andrea.righi@canonical.com>
In-Reply-To: <20230704052136.155445-1-andrea.righi@canonical.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Aug 2023 01:22:41 +0200
Message-ID: <CANiq72k8M=9rP_D_0Ew0hDbsx+qmO92oSyD_LDFnQCKnE3eq_Q@mail.gmail.com>
Subject: Re: [PATCH] btf, scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 7:21=E2=80=AFAM Andrea Righi <andrea.righi@canonical=
.com> wrote:
>
> With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> we are now able to use pahole directly to identify Rust compilation
> units (CUs) and exclude them from generating BTF debugging information
> (when DEBUG_INFO_BTF is enabled).
>
> And if pahole doesn't support the --lang-exclude flag, we can't enable
> both RUST and DEBUG_INFO_BTF at the same time.
>
> So, in any case, the script is_rust_module.sh is just redundant and we
> can drop it.
>
> NOTE: we may also be able to drop the "Rust loadable module" mark
> inside Rust modules, but it seems safer to keep it for now to make sure
> we are not breaking any external tool that may potentially rely on it.
>
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

Applied to `rust-next` -- thanks everyone, and Andrea and Daniel for
confirming my summary/recollection sounded right in the other message.

Cheers,
Miguel

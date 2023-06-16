Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908C36C
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 00:31:01 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-570282233ceso2583127b3.1
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 17:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686875461; x=1689467461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYppjytCFIr8b6N24PrdO/vwx52yFU4wiVFPzdB6o/w=;
        b=EeqE/CoN2E30JfaUsBhHUZOFslau4cVO2/iBL5J0/7AGbMrgi0haWK3ojJUlNRhBQu
         WN7YCeFgrBZY1onVUqhUglKRKfJDm44fWF1p8OG9zfhxqFyHaQKueFzZRtiahOllRhYb
         B5IJ60EztBTVUxj4q10/4T/+2TW0tLMMGRCgT6zh+Thb3uCipyFqiNSk+2e1Y2FXYOBm
         Chwh2CyI7jl8+01ITrGWBiWKvwqS7E6O2yQq2zpcfmwFgeaSbDwLB/4jqtv3Bx1yzxzd
         9U9FlWL8wgsXKZBeOkHN5VS6fkxbZtllMsKUo7Fl1pbxgd+f9SbCzEnwSBNXx10fbc7j
         z74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686875461; x=1689467461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYppjytCFIr8b6N24PrdO/vwx52yFU4wiVFPzdB6o/w=;
        b=K0nnjpQ8np9CJk6pp5j0TN0WJnWqSXEvE5IY/BejOi/wqEZdS9erW1aw2+IWvNM1e2
         4XgKo/iWqdBhV6KXSz9VKPr9f0YL5wf85pxY4m09EJsu/qCxIc9YaWdfqznHJTlvdUQE
         8ULuA3U28YOHgYoH7LaEdNup3rymMwpdMt4GsOq0zgNxckU66MjxVpE0roalmSk1sQ/o
         hNRtY52ESl4uFM5tOZvcDcynWsc63H17XC1kWhced1xDkZfmtuwG/3R1oTC9YG5tu7Oc
         EZQFlv3iJx7eXQTxXYslaba7wXguAweNk0YYvqHedYrEYll9e4DQI/vWI5Yke18kBGMJ
         rmjw==
X-Gm-Message-State: AC+VfDygL7tXC8YXYj/2UxP4knCK2MbNnu6qkwKE8qBmloszNeFp8Szo
	mgEaw+zbm8ldFx9b/1zEQK/NAAu1ptxGKtWG2wI=
X-Google-Smtp-Source: ACHHUZ6me3DutGktFufi6C4IhFzVFXSoM4Q3B7EWRJ6iJPtHftHM2HtFPlIExlo6yy+DskRRBQiy1nyVPPwnK/3Z9/k=
X-Received: by 2002:a0d:e242:0:b0:568:8b24:fd5f with SMTP id
 l63-20020a0de242000000b005688b24fd5fmr380613ywe.7.1686875460787; Thu, 15 Jun
 2023 17:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230528131802.6390-1-ethan.twardy@gmail.com> <20230528131802.6390-2-ethan.twardy@gmail.com>
In-Reply-To: <20230528131802.6390-2-ethan.twardy@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jun 2023 02:30:49 +0200
Message-ID: <CANiq72ng7Ss=s36EXZyG+nx+DRd=XNM+ZU6kPmY00LKaXsjjSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version check
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Tiago Lam <tiagolam@gmail.com>, Kees Cook <keescook@chromium.org>, Finn Behrens <me@kloenk.de>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2023 at 3:21=E2=80=AFPM Ethan D. Twardy <ethan.twardy@gmail=
.com> wrote:
>
> During out-of-tree builds where the path to the kernel source tree
> contains a version string, scripts/rust_is_available.sh incorrectly
> identified the version string of libclang to be the version string in
> the kernel sources path, resulting in CONFIG_RUST_IS_AVAILABLE
> erroneously set to 'n'.
>
> This issue was previously affecting builds on distributions, such as
> Gentoo Linux, where the kernel source tree is under version control,
> and placed under a path containing the current kernel version string
> in /usr/src.
>
> The fix is to take special care to match only the version string
> following the string 'clang version' in the output.
>
> To reproduce:
>
>   $ cd ~/build && make -C ~/linux-6.2.0 O=3D$PWD LLVM=3D1 rustavailable
>   [...]
>   *** libclang (used by the Rust bindings generator 'bindgen') is too old=
.
>   ***   Your version:    6.2.0
>   ***   Minimum version: 11.0.0
>   [...]
>
> Fixes: 78521f3399ab ("scripts: add `rust_is_available.sh`")
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

Thanks a lot for this patch! This was previously reported and should
be fixed in this patch series (I added you as a reporter in v2):

    https://lore.kernel.org/rust-for-linux/20230616001631.463536-1-ojeda@ke=
rnel.org/

If you could please test the series, to make sure it solves your
issue, it would be great!

Cheers,
Miguel

Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE86FCE
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 18:28:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so6503927276.2
        for <llvm@lists.linux.dev>; Tue, 04 Jul 2023 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688495332; x=1691087332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3PJtAPnB3IiOfzd5jucwamisnKKM0e0SB/4qZ4XKIo=;
        b=PkS7NgwqRmfIMF+Qr68qlEEcL0GZwMKb9hLfgb6BG/0Ru1T8ToIIZ2UVzCIWv04Msd
         y3Ku1mPqmecCsdTmAO50wznMyefunXF2YM3+L0TXcYCLqyRkKmzBnXZVk7Oi7xtuMltj
         zF1e984lnshfnm3M5wnfYegFdfBfgG2uS5pATaTAbClfIfWQu81OMKyO4Uiy2PC+5fSJ
         IxWDFiQiJ3n7CUSo9xSHkO9EAKKC7D+AtqeQkmmIIPO65OIPJxHRrOFfBR3b4teGgj+E
         /ytTm6PonxiIpbOlClF8jCdpJO6xoPBN1znQIK1iEcOaV5YFoQEvX8Iw8V44awyKOqSq
         4Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688495332; x=1691087332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3PJtAPnB3IiOfzd5jucwamisnKKM0e0SB/4qZ4XKIo=;
        b=QyoAJtQV1UWf7oGsWFtt3hCYsgl2jrQepRzPH2rc1jZnCW4XOZQW7+MBzcsnXqv6kc
         NimN7AL8ROQau9KV+8OYvF5K6wcI/qb81LGjCuMhua2hXY9KxvRU/yWWeM4B7B5WNA/R
         g5phK7kgJbOXSdSbBZ/2vp+IgHGaRANi8EvVcvVRa1ABTGgDdreDOhCEv9ZVU+yXIsGs
         EX568BzH43tqZlWn0UhRITDEjkkLh/Tu8e72UG/S8aERlLLqo3nmM9F7GXD7CwSToHiB
         ZwTseh9hqUnbsgB99ARmDgOamqYq3Cm0/zHXoCM+zLVUz6MRYYNmW15chXFXrCK/ZO4r
         U1dQ==
X-Gm-Message-State: ABy/qLarO/kQksD+TdFY+4vO4opnmK4QVqybuHByWygF7RoTkk90YMvi
	a7VFVYCq+GLLCeoCTM6e/mb9OnErGGqqdZR4iyo=
X-Google-Smtp-Source: APBJJlHqL45XLlvtAgnlxZhS+dQ462SKuqcXGbxGvaYICYWSwfqPu0MLxOYOn+xW9zmnVGFgd9FkKt5LT/osIExGN5A=
X-Received: by 2002:a05:6902:287:b0:c41:a05d:5da7 with SMTP id
 v7-20020a056902028700b00c41a05d5da7mr11166993ybh.5.1688495331770; Tue, 04 Jul
 2023 11:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <327e5e5a-5aec-316f-c4b1-b1dfcbb4c44c@lineo.co.jp>
In-Reply-To: <327e5e5a-5aec-316f-c4b1-b1dfcbb4c44c@lineo.co.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Jul 2023 20:28:40 +0200
Message-ID: <CANiq72kZeLs1oWbUeZtx3CkGQxMa3Qnn3neV_yEfC+T_D-xtww@mail.gmail.com>
Subject: Re: Rust for linux build error due to Clang (bindgen) version
To: Yuta Hayama <hayama@lineo.co.jp>
Cc: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 11:06=E2=80=AFAM Yuta Hayama <hayama@lineo.co.jp> wr=
ote:
>
> I am a beginner in Rust and LLVM, so sorry if this is a rudimentary quest=
ion.

No need to apologize!

> But I think this patch is still in the rust-dev branch of the rust-for-li=
nux
> tree and has not been merged into the mainline. The current mainline kern=
el
> seems to have a issue where if the Clang is too new (16 or later), the bu=
ild
> fails even though `make rustavailable` passes.

The upgrade to `bindgen` will be merged after the merge window is over.

> Does this mean we need something like max-tool-version.sh? But that might=
 be
> a bit silly... If such "error occurs because the tool is too new" is repe=
ated
> in the future, I feel that it is necessary to check not only the lower li=
mit of
> the tool version, but also the upper limit.

`make rustavailable` already warns for "too new" versions for `rustc`
and `bindgen`. We could add something like that (as error or warning)
for `libclang` too, but that particular issue goes away with the
upgrade in place, so (at least for mainline) it is OK.

Cheers,
Miguel

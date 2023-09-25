Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748711C8B
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 14:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E8CC433BD
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695651889;
	bh=2g1Do3iFHMaQciL0KcyWXZ2okrnEVOiE1mgLnj8LAgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GI5rpfG3PkhGy1YcUrhfgJmBWCc9uJwdnOtPzUjPoeZ+zVlpjAVYCyuolmzL/aZHC
	 zIl89ThNvjZogsBGfAFc9zDKVJIY0cd/Udn4bXvvRUSOWWh+UKDWvKLEly8wAQCIQE
	 SnJzwq/mNBa/L3q70N6aT+6qrxWPy/CtuICd7bU1Q3Bcj8MVvddUcsdG1Z0g/wZCO2
	 9TWGfDQ3j1ycaoZ3L7O+FCTaHa1IxWjFxQErXpbuc6QrIYYxx3DlyizTPRPvBSYxe6
	 jdQnOXiLyT72sHuR8LJnoI6T+UL+Ta+l6vA6k8/Cx15wIN7ktUkXu4a+LOi7AeuYwK
	 eN/s+uORb795Q==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd5b98d9aeso225322fac.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:24:48 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywg7ik8m9q/anqUotGRL7hIYwKB3kSYPcD1ulr4rLMY0u76nGei
	T2i3fWhOAFl+phWa2cjgCAN0OrwoICG/Jx3CVyo=
X-Google-Smtp-Source: AGHT+IFshSJHajEwbbMkZ0LtWy62unM/P0wOWiHyadRVQtrQkJjUZgSH+LL12pe1k9VdSCb/77ZDGX7LiC9tPmq5FuM=
X-Received: by 2002:a05:6871:4a02:b0:1dd:4e2:f825 with SMTP id
 tz2-20020a0568714a0200b001dd04e2f825mr2565808oab.8.1695651888307; Mon, 25 Sep
 2023 07:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918210631.3882376-1-jbrennen@google.com> <CAK7LNASSgCFYequw+0zQpUC-9yLHvJLHZ97Ko1ejUYZVTkM81w@mail.gmail.com>
 <20230924222019.dipusbpgntepnq2y@google.com>
In-Reply-To: <20230924222019.dipusbpgntepnq2y@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Sep 2023 23:24:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATg+cnvs9P5Ud6FPAoqQUozrGif5SJm+Pw7cs5qJ1C3gw@mail.gmail.com>
Message-ID: <CAK7LNATg+cnvs9P5Ud6FPAoqQUozrGif5SJm+Pw7cs5qJ1C3gw@mail.gmail.com>
Subject: Re: [PATCH] modpost: Optimize symbol search from linear to binary search
To: Fangrui Song <maskray@google.com>
Cc: Jack Brennen <jbrennen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 7:20=E2=80=AFAM Fangrui Song <maskray@google.com> w=
rote:

> However, the `- 1` part in `unsigned int hi =3D elf->symsearch->table_siz=
e - 1;` can be improved.
> I'd prefer an implementation similar to typical C++ https://en.cppreferen=
ce.com/w/cpp/algorithm/upper_bound implementation.
>
> lo =3D 0;
> hi =3D n;  // or replace hi with count
> while (lo < hi) {
>    mid =3D (lo + hi) / 2;  // we don't care about (lo+hi) overflow
>    if (less_or_eq(&table[mid], &target))
>      lo =3D mid+1;
>    else
>      hi =3D mid;
> }
>
> // lo =3D=3D hi: the index of the first element that is > target
> // if elements equal to target are present, they are on the left of lo


Ah, it is much more elegant!

Thanks.



--=20
Best Regards
Masahiro Yamada

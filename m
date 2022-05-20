Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386602F34
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 19:11:24 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id e9so1655787ilq.6
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wptJPrd9ShEK3CQfYj5PR/gt1bv2ny3OuBRfAu5sXS0=;
        b=GOg/uDohocVj9i9MP1sIPXrrla5HSXP6WCujXrvSGuDdPmwkVbHpvqaJ5qVncsdRJb
         BKGCM4g/sti+fEQs3lpcf3/rU5JER024GOHkT3Q+DO8KI3Y/j1ALYhTP5TFR8iTILbsu
         uOEL4r1G217uCwRZl71Fxls80sei0ZtXUFIE2LkgM/Eq0r4htk7vpZWkPlT3U4lymObd
         TzxX3OX7ZLIf+kihPema3anBffoM0zAwXQcvn/sbFKPKbwaHSHUtwuL79CqBpFEuReKW
         FjPaVr+ohUi7bD3MWRhPle8fWPTL9TdY+CCMwBcjV/+sicfvMMe8S3t7jmWrL5xf/PQW
         jPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wptJPrd9ShEK3CQfYj5PR/gt1bv2ny3OuBRfAu5sXS0=;
        b=n4/6HWKighSAInLSPliyM6B6fwTQHxwzSyD4POmC1NSA+Ixx0niKV2VoG6Iw1PMqDo
         41ykMKXL2rqEXGaojN6m/p3+oNw8ZdJmvq+RgtQtu1EGfvLAtQur4GyFGcMFknB2zxFd
         A3wWcouUKo2aVinUI83oAxTV4Tn5MnKVUK0MrWGo/tsifYQa2pQIpUbcm9DliDjBdPz/
         Gf5q5Snf814CUflTFXqat+v3cDRw9BDQRVdUrSWO2KZpq6ioXSYM68st51sew6SO+G4P
         nD3HQJAVV2BWzU2xG61HAVGyx6BiCyR2hHLZpR4xatYN85rrPtrqTXGYbkCcNa9V08yT
         yuAw==
X-Gm-Message-State: AOAM533GBgy/3MMgyvgJku2ZQlwIzhItrmxeMiOnSBzjVDLlCDLez/8N
	6U7fRUU5lvET6+tIM2gQ4Zy0uNkjfN1yxzgW0/c=
X-Google-Smtp-Source: ABdhPJz0hkN3Jsa0b6iL+Jci3ARkkJmJ6TPKvhUwrFcX11MbRumXs2OBTPindZlxqMklv4JxHlOM4D22C2kOhCxK4Lg=
X-Received: by 2002:a05:6e02:1c88:b0:2d1:87ea:18c with SMTP id
 w8-20020a056e021c8800b002d187ea018cmr1119297ill.321.1653073883338; Fri, 20
 May 2022 12:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net>
In-Reply-To: <20220506160106.522341-1-mic@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 21:11:12 +0200
Message-ID: <CANiq72kaKhkcrTrOXiVZ_NA_FktJZhCqib-Fj0jWYztuiKPAQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix clang-format configuration according to checkpatch.pl
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2022 at 6:00 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>
>   clang-format: Update and extend the for_each list with tools/
>   clang-format: Update to clang-format >=3D 6
>   clang-format: Fix goto labels indentation
>   clang-format: Fix space after for_each macros

These 4 applied (with the mentioned changes, and on top of a few
cleanups to simplify the first patch etc.) in -next.

After -rc1, I will submit an RFC series with other clang-format 6..11
features that we can now enable but that merit more discussion.

Let's get the ball rolling! :)

Cheers,
Miguel

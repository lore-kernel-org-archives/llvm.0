Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA252DBA3;
	Tue,  6 Jun 2023 22:22:57 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ba81f71dfefso7688512276.0;
        Tue, 06 Jun 2023 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686090177; x=1688682177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szkQq4yfYJ+bwjPXw6p2sZXA23EsVrsV0xUmhIPCi8k=;
        b=S2YQuwF1uZOjB0UDsXy5fXobjN5upNAH64fiNpFChZVGRdzqdkBhIusFHa2Q77Ec9W
         bByqVI7C3BJqxCAuLKwj+TNPoQaETlEXnvgVvE1efQtgTSOTqUjgs/6tZU5hK5mXCcca
         Mnu4puTGkG3b5eLZbI7mX/BMSzdSXSOUcQbqiAfLqtNeoU89ZvxxOBhSFwwF6a3jUfVJ
         4HWaIo3EgiE/2qjbLk79lJrHsEBqb2JHx4pS8TcUjHkX/CfHmopAyn8US+u8iEZTmYkg
         bortE4YiiLdE3hr3UP2q9tVdziBYhhH7VfsZxv77g1W4W2Sghh31mhEZDbfPslGdef0Y
         4HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090177; x=1688682177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szkQq4yfYJ+bwjPXw6p2sZXA23EsVrsV0xUmhIPCi8k=;
        b=jIeykjot2kQEw9XKbdpCCcggR1Pua0ffrlk2fVEVtcZKt7zij/OkLBIqeD+ffpwu5B
         d6bV8lKBD/VVk1lDT1NQOBL4pucI0ObV1bkcYZuoN0SPN5OB7nXkrRZq/WjZe1piMOvT
         0nyLFe2J7LqwbsNsfOgY3+ja4ykCozSdEvGFpZ3sRY3+goDo3hvz2MYyil2imoBhzGQu
         nX6aVDayXfkxc6/wgSVEBBlm2acZlG0UFRpKHiJI8Kn231QBMKaSoj6A1XGMqBTJDYKB
         2o8dldJpLexvPz9ga1zON9u/8GjEKxcBBJ7dClYQNkeeUgEZ5InTvUxY9Mi0k5mjirvb
         ZQ7w==
X-Gm-Message-State: AC+VfDzkUHLqlK80zf/+AT5Ut80wTuP6N/lrAJQOfiBuw77jUZBashSA
	X4oWI44OMOonZMGyI+x9cUbHMiQJqSXsJvQ7GZQ=
X-Google-Smtp-Source: ACHHUZ5SivPFq3FeibULtWhCaGloOXRl/EK8sBbqT2tSRYU/16E8ROOobMK4yLEBJ7o+2h7CcvW3h6axthCRL3lP1/s=
X-Received: by 2002:a25:900e:0:b0:bac:69be:9494 with SMTP id
 s14-20020a25900e000000b00bac69be9494mr3919754ybl.36.1686090176774; Tue, 06
 Jun 2023 15:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306070408.EFxuDoRs-lkp@intel.com> <20230606215212.r7if2gsynajugf6j@treble>
In-Reply-To: <20230606215212.r7if2gsynajugf6j@treble>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jun 2023 00:22:45 +0200
Message-ID: <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>
Subject: Re: [tip:objtool/core 8/12] vmlinux.o: warning: objtool:
 rust_begin_unwind+0x5c: rust_helper_BUG() is missing a __noreturn annotation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Miroslav Benes <mbenes@suse.cz>, kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 11:52=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> So it seems to be an issue with bindgen, though that github issue has
> been resolved.  Any idea when this will show up in a toolchain?
>
> In the meantime we may have to get objtool to manually silence the
> warning, unless you have any better ideas.

We were going to update `bindgen`, so we can just do that -- one more
reason to do so! :)

If the update goes into the upcoming merge window, would that be fine
with you? Or do you need it for this current cycle?

Thanks!

Cheers,
Miguel

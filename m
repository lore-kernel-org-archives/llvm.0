Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49682B554
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 17:21:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso1570816f8f.1
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692724909; x=1693329709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsUwj2O0QlrcEW9NpP/XIQy8tRK8Cwy9R0XymaCyX6k=;
        b=OqUXjPvS+2NJE7N7FUzF1h5yo04GOE7ukz0dtFBxe4aIzQ5fUSEU3lKmd702sUfl6X
         d0GHo4rFgZ41j3grf4kThOjxOWF15PRWZn8Uz6yJ0uzsqaDfHRuK86AjmD+MsuYBqikL
         6R/H7gLZjmQdwB0TPFuXH6ZCkYB49TyB8jVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724909; x=1693329709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsUwj2O0QlrcEW9NpP/XIQy8tRK8Cwy9R0XymaCyX6k=;
        b=IKWRZ6NGhrpvXqnAFiSa8OoMmbVdfIZ/B1AK/2jUxbxDonuQ+yw6LqYRSbpIvPZg4U
         e2OM+FTTMzSq0ILLQ9Vgi2cvjcMrL0tZ77OUYWgQ98BMtwon7w2f0pyYVCtgUQgECIS5
         GT4qhZn8tMnIkUpGwmw1F99wsujihGNzNSr2dgRLFKvreT6xSMQ+G0Y2tnOQwe2eboo3
         TQFHl7AbMjTgliFIGrGEeK2gsoI2z62ZoIaZZtDg1WNLExCb1/3xyYXY1vHp+nzKPGE4
         d+kGl6s5M0BxbXo9UoMhDMUmLxi7B/wiz2yoCSwTASVmfe0xR0qzvBW8+lstCzSAHzGD
         XmKg==
X-Gm-Message-State: AOJu0Yx3EIv0pHEe+LH+rZWs6XgnP8r3eciMcLSGZGrYOIFgfTKeWpIi
	Sm2Ww4qCunlZ2M41woT1V4tCYyvTen9k0kiAMxdlmw+hU3QXCUE+
X-Google-Smtp-Source: AGHT+IF3Z4djchwRgxM1JEfE6eBbPj+67XFA+OLB6qoat0hpUFzR5kZ0PS1zGhdT3w2TJ9C+P1TCgzaXGqNiGQDpF00=
X-Received: by 2002:adf:e4c9:0:b0:31a:dbd8:95d4 with SMTP id
 v9-20020adfe4c9000000b0031adbd895d4mr7434871wrm.12.1692724908335; Tue, 22 Aug
 2023 10:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <CAKwvOdmvUCKDk0kU0DVywRRPS9qT09PsQ435GzzuinHkBcRZ0w@mail.gmail.com>
In-Reply-To: <CAKwvOdmvUCKDk0kU0DVywRRPS9qT09PsQ435GzzuinHkBcRZ0w@mail.gmail.com>
From: Denis Nikitin <denik@chromium.org>
Date: Tue, 22 Aug 2023 10:21:37 -0700
Message-ID: <CADDJ8CXD05H22G=NsUcZy-uG5+4xQRpCd-UPVL1Z1a0Lybx9+Q@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 8:47=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.or=
g> wrote:
> >
> > .llvm.call-graph-profile section is added when the kernel is built with
> > profiles (e.g. -fprofile-sample-use=3D<llvm.profile>). The section hold=
s
> > metadata for symbols beloning to other sections and hence doesn't need
> > modpost checks.
> >
> > This change fixes the kernel build with sample profiles which fails
> > with:
> > "FATAL: modpost: Please add code to calculate addend for this architect=
ure"
> >
> > Signed-off-by: Denis Nikitin <denik@chromium.org>
>
> Thanks for the patch. If you send a v2 with Fangrui's suggested
> changes+additions, feel free to carry forward my reviewed by tag.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>

Thanks! Will do shortly.

- Denis

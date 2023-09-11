Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2284CF9F4
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 16:21:24 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-655cee6f752so16460336d6.0
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694449284; x=1695054084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeFJiodoKA7hHhrPJOWFs8NZnEvUY71O9fR/UOYGmEc=;
        b=V56XErH5qAOBcoogeqZkB7xsSyfhZKGEH0sMR4W3f9y0R1IPil6Ud1iKAxygVMUW3F
         3h6sZ/iLtpTHzruRcrJ2UC2k3jdD1G2ouL94yOFm7FWkIkk+pG9y1imDi/aE689SFUUG
         xdY8gBR1krMYl4LdMpI1zXCkhci5MkJqqJHKnmF10oSxK5ArgKfIPvu1C49tbCA7yPXc
         6c3KWLx8RBiUFBGhL6K+5JGz8W9abjw5P3yYxnBv5PvGrCe6sXhzZlBmQy/tpYWU63Pz
         UtpYIVsB7me3xuNOxYOdBruhckA16hiWe29MgTY5aAOSBTjBAQk4PBj/o+Jl5QGzDx44
         i0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694449284; x=1695054084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeFJiodoKA7hHhrPJOWFs8NZnEvUY71O9fR/UOYGmEc=;
        b=p5Y0yudomhDpBGpKIexYWar3xKW+1AADuZKySWc9oS7wOozEbs/qyV7otXku1CVK1m
         eenhGNlv833Zp/K8esrkFurs70lSM6MKCEjzRQfjh3iarvMJUVbZuiw88mq3ewOl9uLn
         1kx6vhMtIQQ4UyToZ9e93lgFpYNCLGBl4VJ+Bc9rOJiFjP9NbPiHeCaEsFQFgXnIo9Im
         baYWa1V7oicpNASv0xHyElPjqqdg+U9dMp7iSn0+YtVQZWFtL1hpLSYqtZOfFTmoNdwK
         0iOU3Bf2Obw5aKvsJkk8Jnj2SR/BJG5HzwFp6qgumIMUT5hyuLN4PvPb/K6x/AC8xmpJ
         iZPA==
X-Gm-Message-State: AOJu0Yyfkh39WSKszAx/NzqOlHUUWkJzblxjbxIzPrQCX2VefvOxTGAs
	p8OVof7MxFW6LB2X+AHeaJMhXY81asOWzgpnQKAJ7Q==
X-Google-Smtp-Source: AGHT+IGps5w/lebxuCKKA14q4iU4eqcA7x01Ibg5/Dx8gzqfnml8MGL/5o7ANavlbSOkGBx1RqjeRVpMISBMpPpCFGc=
X-Received: by 2002:a0c:b3d5:0:b0:651:69d7:3d6a with SMTP id
 b21-20020a0cb3d5000000b0065169d73d6amr10206690qvf.15.1694449283791; Mon, 11
 Sep 2023 09:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava> <ZPsJ4AAqNMchvms/@krava> <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava>
In-Reply-To: <ZPuA5+HmbcdBLbIq@krava>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Sep 2023 09:21:12 -0700
Message-ID: <CAKwvOdnRDuDSZ=wHHRBFThz368MP-JvdsS-afF6ATje9eeUUfg@mail.gmail.com>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Marcus Seyfarth <m.seyfarth@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Stanislav Fomichev <sdf@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 1:15=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> but I still hope we could come up with some better solution ;-)

I have no preference, and other fires to attend to.  Thanks for the patch.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

I see Marcus replied but in text/html; I've encouraged Marcus to
re-reply for the public record.
--=20
Thanks,
~Nick Desaulniers

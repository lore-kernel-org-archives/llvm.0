Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DB2D23B9
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151159; cv=none; b=q4iI17pIH8Ggm9cL/jfOkH/qGPU4zzgaQ2ZJbVE3su+qzTi1xEu7/WB9lEk0ZQcemeq+I8HpG151MLNqBNwH5cMnvefFxg5MBxINHj0kgWy9oZL8b8uFD1TpaepQ6ABaSawfYlq6yx8nsDKOWCFhAZjCYctA1cg3GPQHIqzhFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151159; c=relaxed/simple;
	bh=Mq30Q/ygl6vuWzwAY+4nh9b47GM7X3mCuqI5h6P3BLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/QQZA8mMQ22kdN70Pi4dnd/FuGnBkuZ2Q33FjFmdFNNMZcfJmU9L3nDtVlz3hiGi9Qcl6Ioz5Q5OhJJ2X02c4RJzlsnGLsefe4SawrIYaXRkFwVMX4ooIPvUiN+/X+R9zaUhQsajy9FWYCJ8eck0r7y3A8OpZgGlir/WnDn6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUYmZ591; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUYmZ591"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27d67abd215so1805ad.0
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761151157; x=1761755957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dyRsVRqc2L33WX8RRMU6pDd7nF1eS3Q2aDL0rKCUTQ=;
        b=jUYmZ591iWbRcvOWXdXr0kb2V3u9qFSnm0yMqtwFhe26TgEls7HdPm4WXA2Y5UGctx
         z1zTQAFcj+6eyrzDu1xP3Rm2HtrvXpCAWWifSuGGgNjPm7L6g09bPFTMLiGvy78JshA+
         DJs8pUmftn8uO5D6Fi6ZVpV7klCYBVafusk21ynqT0nfqxc1qXqfbWmhlNKfPaRdtosg
         MGrx4npxKm9Cwq0ISp08nspSZFtA81GlVuGPdE1Ha4zUPODyl+8oMewcA6giMdO63sot
         y5Ciq3XpPlB9kymI1pR3a680SpFBC2ccOcR8b9fCR4/0G2v83V8Aw25CipENceuhRuda
         vHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151157; x=1761755957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dyRsVRqc2L33WX8RRMU6pDd7nF1eS3Q2aDL0rKCUTQ=;
        b=CUquJ+ZwW6gYGlzres0syC9vAwyxwfgFWpIrpiIcEO/AnqnThlxD+9TDDzb1yUVSgJ
         6uq/vW7iWvUsVdvDdk5FphFFEhEvy4uT49OjtammMGCrGBml2o3yyU+G2frXgOd8r4Hg
         VDueJHmdPY45LFpN821Luda7Upms8gqLmovlPduP37sQd2SKL/B/Vs9dfQTp7nRUIyhT
         uTO9WCSx9jtyWzcgZfhh4zUiaD2hEel70i2pa5tvsulSip9Sx6LQFLEtzOiyHE307aQZ
         8PzDkIruT8Mt/UH9jU2aXcsT9uZEPTSpweDmjDJMOvBIVt7SVbd8ozVp87KTvvW/aeuN
         tdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW1CiMgfAH33ZuRVdWmaouPp89fsrbU8RneqNIWgpU2VGtEcFxxd0z6yofjFaFP0ynuxKD@lists.linux.dev
X-Gm-Message-State: AOJu0YyEWbbjj6x459XhvJqhuyp3VajWg7zMeqa7Ca37biuaettTo6nP
	FPkujLhDBFOktONt03VGdPQHb1ivTfmZ5Syig6fzk22CLyf/pDpqyWgwq1B7Vojna3Rwdciuuzy
	S8UCvmmXZ6FE2O0IBdyuQGlS+B0DkLyRDQGsDMgrb
X-Gm-Gg: ASbGnctfBWCTNXcGAFvyolbrkwlQq3Mos8UtEk168zhKZ7mD/nemuC6E37fJ1/ERKHg
	yLTepu/N1pP87hSslQRBT6hwcn9qLq+Mr452M44EHSrAbu+qC9kDbdx9NmQJddI6SYws6t+DJuw
	n0xsDWi2+ZRcuoqCqKhZ4XKXjNCu4wI8jvzwren8sljATEBm2bjiSUO8xe+lQ046+iG0/HI9hck
	/HUxl+0pVJ4eoXRt5uul6U4zC6B1KBAPjc6Cg52yaq+kS77/vN9d1I5DiJAFL6JAVQKXuAvzOB5
	ul/kDIe1brjRapL9lenH9tWNfPk8RH/IphbW
X-Google-Smtp-Source: AGHT+IHuo/tpCr5zMmwopYH1l3fZ57heRmdwQKT7jq6PWjrxm3n0qt9zvzIfVYp2QgVFiEGiNDaGFyUDFMxdAO+7wlg=
X-Received: by 2002:a17:903:124b:b0:265:e66:6c10 with SMTP id
 d9443c01a7336-293009e6711mr2507235ad.4.1761151156642; Wed, 22 Oct 2025
 09:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022110241.1283519-1-james.clark@linaro.org>
In-Reply-To: <20251022110241.1283519-1-james.clark@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 22 Oct 2025 09:39:05 -0700
X-Gm-Features: AS18NWAil3nUEi8qILrmxdeia1X4sOClLr1HZR-99gBc_cScrIcebtFbWKMy2uw
Message-ID: <CAP-5=fWi-xCxuiszt538osE6KKWop7cYkN9Gjog65QgGQ-HhPQ@mail.gmail.com>
Subject: Re: [PATCH] perf annotate: Fix Clang build by adding block in switch case
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, namhyung@kernel.org, acme@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Zhiguo Zhou <zhiguo.zhou@intel.com>, 
	Wangyang Guo <wangyang.guo@intel.com>, Pan Deng <pan.deng@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:03=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Clang and GCC disagree with what constitutes a "declaration after
> statement". GCC allows declarations in switch cases without an extra
> block, as long as it's immediately after the label. Clang does not.
> Unfortunately this is the case even in the latest versions of both
> compilers. The only option that makes them behave in the same way is
> -Wpedantic, which can't be enabled in Perf because of the number of
> warnings it generates.
>
> Add a block to fix the Clang build, which is the only thing we can do.
>
> Fixes the build error:
>
>   ui/browsers/annotate.c:999:4: error: expected expression
>   struct annotation_line *al =3D NULL;
>
>   ui/browsers/annotate.c:1008:4: error: use of undeclared identifier 'al'
>   al =3D annotated_source__get_line(notes->src, offset);
>
>   ui/browsers/annotate.c:1009:24: error: use of undeclared identifier 'al=
'
>   browser->curr_hot =3D al ? &al->rb_node : NULL;
>
>   ui/browsers/annotate.c:1009:30: error: use of undeclared identifier 'al=
'
>   browser->curr_hot =3D al ? &al->rb_node : NULL;
>
>   ui/browsers/annotate.c:1000:8: error: mixing declarations and code is i=
ncompatible with standards before C99 [-Werror,-Wdeclaration-after-statemen=
t]
>   s64 offset =3D annotate_browser__curr_hot_offset(browser);
>
> Fixes: ad83f3b7155d ("perf c2c annotate: Start from the contention line")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/ui/browsers/annotate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/a=
nnotate.c
> index 3a81912279ad..36aca8d6d003 100644
> --- a/tools/perf/ui/browsers/annotate.c
> +++ b/tools/perf/ui/browsers/annotate.c
> @@ -995,7 +995,7 @@ static int annotate_browser__run(struct annotate_brow=
ser *browser,
>                 case 'H':
>                         nd =3D browser->curr_hot;
>                         break;
> -               case 's':
> +               case 's': {
>                         struct annotation_line *al =3D NULL;
>                         s64 offset =3D annotate_browser__curr_hot_offset(=
browser);
>
> @@ -1012,6 +1012,7 @@ static int annotate_browser__run(struct annotate_br=
owser *browser,
>                         annotate__scnprintf_title(hists, title, sizeof(ti=
tle));
>                         annotate_browser__show(browser, title, help);
>                         continue;
> +               }
>                 case 'o':
>                         annotate_opts.use_offset =3D !annotate_opts.use_o=
ffset;
>                         annotation__update_column_widths(notes);
> --
> 2.34.1
>

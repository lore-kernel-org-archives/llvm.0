Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D23A1C1
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706826390; cv=none; b=DX9PjuhG0jRrbDr1HtL0x8AMzFG25ygXY95IyRwXyhS/RkodLm448Sb2S6vtcZUcanSZkV8TRQpmPAY0mvVuxJJ+duBnwjze9mGw3JzD5HxvsfGIMpkwRNOFcHRowRZaM1XHWGhpZ6TemlZAzAIplo13/n8TpyL9dQ4cAMnziGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706826390; c=relaxed/simple;
	bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaZqCTQuq0Downn/zlLc0WsrKmnu1Zqa8t++c9+0hZjzk8qaRS4IPMVxx6HTUDMKZhcsaSIgEpmkoXWTK/ZlH2jCszm1GsH44ol8HpDfFvDGPPb98zs94kYpCegynqc6Lw9syYY0UGrd9k5RHQyDyw0sbEexceqK64MRSg2SFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ZvTsGEU; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ZvTsGEU"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46b1cb24266so480653137.2
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706826387; x=1707431187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=4ZvTsGEUD36ywiVvSNSL8l4geXnS291lZzEC1gDbyUDkgYZDNj5iqLg95VRqSKBzy+
         iwuWyoF1C+7RYg8UhYK8Y4p8S+C8DcFSzXh/gURnpocyxYq7yYhtNm5TszYvZGbrMs2c
         TmCgsOn4FTeDnsiJtV0TNa+jskkViaKO6b1MxSbNjaFdoAv+FzeoN3y9z2qA5jOZt59k
         cwUNaF7/H3IrelTym/qVCRt/wcHSsksT+FbQZV0xDJK0UABfAksQo+5Wv6jyTS5LWye8
         Idr3w4Jq/KeXvrIIJ18vlNCFVDFGIvvLSJRv5tmw9Q65SmvjbIE4O96WnZxY3x9Hy6K2
         vGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706826387; x=1707431187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=Vaf4CPnIIJgDE6oenAjiJTrTkiPA9jVa3yjOQh2uR1WhU0E5eV3mWuggq/uh8bZs1f
         i0PleHw5qAS8ECkNLt41XEKQfLp0n8RvjIbmhs2XgILpeu+2HS37q8SD9zOoixGL8hrs
         HWUl2tXyzpeIoEJGWEYCSsA+S2gSYOpN9T6JEkgMDL5+O5gx4IqIlnQ2Vm1VFg/3x9qP
         jK+cbo9EMuTAU85F9tD3xsXYqwuGC6vQ+RzzZZC7nGTYewxYoc19l9nd4+Nsgg+4iCCF
         vGLIKvVuLygsUhp+e55k9AQHkEz7iU0yxcQqefy7cI912kKyJ67PPTWvAk/F1caSDoXG
         HZ3A==
X-Gm-Message-State: AOJu0Yy6poN+MawpB9kPCC0OvADVyjq4z2nl7grRZ4ytfO6Q3zcrzT6R
	Qxue/Ye00WBT8wpzRAJ0O/InGBg6NKwvOMe5okbl+iuc4IC7zXh03RXKGZ32gcuBQgqx33MNpoZ
	4ZULdPlethfbtB+p6e8yF5T8p5u8FBDYAH1oe
X-Google-Smtp-Source: AGHT+IFCuKF6QiU+ny6kuZUF3GaDPIhQfm+qSFreoCq2anMqN2UYkMUcoGIgF+ZV3z+Yz9/V09IBhzG82IgRKFYsfqw=
X-Received: by 2002:a05:6102:806:b0:46a:fd91:c15b with SMTP id
 g6-20020a056102080600b0046afd91c15bmr339945vsb.13.1706826386679; Thu, 01 Feb
 2024 14:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org> <20240201221654.GC2240065@dev-arch.thelio-3990X>
In-Reply-To: <20240201221654.GC2240065@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 1 Feb 2024 22:25:48 +0000
Message-ID: <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 10:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> > Building with LLVM=3D1 throws the following warning:
> > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32=
: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsign=
ed int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned =
int, void *)') converts to incompatible function type [-Wcast-function-type=
-strict]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I am not positive because I don't have any hardware to test this driver
> but I suspect this patch is just hiding the warning without actually
> addressing the issue that it is pointing out.

Agreed, this won't fix the issue. The correct solution is to drop the
cast and change the handler type to match the pointer type (i.e. use
const void* for the first argument).

Sami

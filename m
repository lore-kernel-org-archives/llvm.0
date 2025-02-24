Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706E264A74
	for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416443; cv=none; b=uYvLvIpRulAn9qXre+r509KwyR9+o6Dayo1qzhHItkw349cgV2dBBw97Csq4UwPX7udo9NGKhGIEver7GuFo8OYMIrtyhLE80HCSsjO0TFjZH9X3Uo3plPlxH2ZnnHokOcSbDtzMsT10x5Tn1Y0CObeCwzYUle4T23lqzTHMQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416443; c=relaxed/simple;
	bh=bTOtbXAYGDMeeWId57hTH2KaX9ZYq4OA04dE5E7f3QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFIFNyEcIfIM990Nd/h1ytVIg33AeFw7601H5rD/uWU0k0gyTIcAd/kMMMQSputAWCdWSNMnRA9q5N5/Fb0NpMfTaGJ+4TLxwlqOB6dOJqV5WzikYFdhPVTalF8LpliOP+thQR1mVTCl4Xm8XOSQdqQkR5ukstpTpfVoL87+yeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b4p10tfU; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b4p10tfU"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-471f1dd5b80so423811cf.1
        for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740416441; x=1741021241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCDPYfQc9hPFOiWzrMrQ09gp/CGBhAXiyMFfJAzvH6I=;
        b=b4p10tfUITCdsXO83pkFXlhzNkpvIeQ+STqHoLr0wGZ7zaudOTrWvFEHi1awJq5LwS
         +fCLSoLP6YwnNCCjiHYpcOLrmSvr9sZwi6kt/uoxpbsIi6udXtEq5oDxBlRnDYdIqsZY
         znW/qkgCi8nyDs6/Dz3dm6CdApPPFPWZ44kZHr2mw/CjPS9YgorG2MS63qvxa9VOYiW2
         gPbZD9JfSVS+mdDTGd0E/X5x6CGhsG5O5aridZa/U99t9lRVRyEEnUIW3FU0qAJf5Rbw
         37uivBKe2Ylq1s9vJybbnDpzeLOKYC86ytOSQA2Ftc2mJi0e8LTHff15iXdClwm75cjf
         Grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416441; x=1741021241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCDPYfQc9hPFOiWzrMrQ09gp/CGBhAXiyMFfJAzvH6I=;
        b=fd51SB/WBujTCyI2mJu4A74qaf4y2IE6AvdT5rDpaAKqOk+YwBPnjSleyWLiUGmsWt
         EW+JfwbeL39owAdahfE1DcS9Qgu+C+hJcqdYnpytk+hzlObGBleRkG+A4jfhk9S6ILOy
         gulOFqZFFyZA4Mb5eFDsFR8FBQY8ByRjkYKVVLMW4FZKJhhWGg3/XmYeaRHuTKC3MwOt
         x6thNw5+KYS+A78GSeXtnYgz5O6onUJ2aUGz+x3Syu6fgKBQi+O+3MQmdTCb/NlVTywf
         d455oOjknQer75HHME8/SQDRWxSJJP+0KV/V+w4KrW+oDKeNEhSymmxsLAKNDAIkAYcJ
         34+w==
X-Forwarded-Encrypted: i=1; AJvYcCXo/T+pyuFTLjGFMSvNUSy4Ci1W+E/BZlELcem9M/6b7EX2OaxUZXANQvAH4HvGplVe2Osx@lists.linux.dev
X-Gm-Message-State: AOJu0YxBuzeThf2GCkszzlrC24yUpJmCpylh3wKpOj5fmZGJoxqBbCWs
	beEGE6xmM812Ign39jKj2eW50F8NxRiMGwOewPHoCRsmNTDYObGZImGxVvJ6NEKUCsvCIchdqYP
	3q2SmBKaP9yhB2O4dmFhW0p/of3RkG6qQ9PMJ
X-Gm-Gg: ASbGncs9vRy36+pXzieTCp5zBPkJNtTb9wkNIuM0+kDEv8LvfIWjO2hk/w0bUUiPksi
	Hq9odOXH/1jBTMTsF3peKWeYNoDJzxnZVt5vn+krrfywb0VLaGEcwvv+aUTP51gkuQYplRauBat
	CSUdJY
X-Google-Smtp-Source: AGHT+IGDiL/NzinuvOUr3+fEdY5ydwqjWixBjK5chxqAB4cgY6b/E2u3NNO77Wm/fNagSnSSnlNVN6JFC7ja6T0wMdw=
X-Received: by 2002:ac8:5dce:0:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4723358478emr7710481cf.26.1740416440442; Mon, 24 Feb 2025
 09:00:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250224141120.1240534-1-arnd@kernel.org>
In-Reply-To: <20250224141120.1240534-1-arnd@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 24 Feb 2025 09:00:28 -0800
X-Gm-Features: AQ5f1Jp7zC3xCebv78f9PiKcuUbXObQC3P1hoiW3UFkiO3HxC8Bls2jmj40XTdI
Message-ID: <CAPTztWbLJ1iQ96okvTZX3JL2fkpHhOj=jPGULS2RriYg0T0eCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm, cma: fix 32-bit warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 6:11=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang warns about certain always-true conditions, like this one on 32-bit
> builds:
>
> mm/cma.c:420:13: error: result of comparison of constant 4294967296 with =
expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werr=
or,-Wtautological-constant-out-of-range-compare]
>   420 |                 if (start < SZ_4G)
>       |                     ~~~~~ ^ ~~~~~
>
> Replace this one with an equivalent expression that does not cause a warn=
ing.
>
> Fixes: 4765deffa0f7 ("mm, cma: support multiple contiguous ranges, if req=
uested")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/cma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/cma.c b/mm/cma.c
> index 34a4df29af72..ef0206c0f16d 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -417,7 +417,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t t=
otal_size,
>          * Create a list of ranges above 4G, largest range first.
>          */
>         for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL=
) {
> -               if (start < SZ_4G)
> +               if (upper_32_bits(start) =3D=3D 0)
>                         continue;
>
>                 start =3D ALIGN(start, align);
> --
> 2.39.5
>

Thanks for fixing these nits in my patch series - which, btw, needs
more reviews, if anyone's reading this - please :)

Reviewed-by: Frank van der Linden <fvdl@google.com>

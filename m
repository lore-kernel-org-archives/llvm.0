Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA01D174E
	for <llvm@lists.linux.dev>; Fri,  6 Sep 2024 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634470; cv=none; b=p0/G30s2yz2q1vdw7bX9cbCYvVBaZB9XE/rvuEqX/8w0bSZ3ZCQFkZ74+GiLsEba4iF0H1Rt/dNio+Vow3yvGSj5kzj7xf3Yv8Nph1ceuW0drpYpP8D8x0rWAn/r7JPfbRT4+iSiFTDcu7jqhnzJW5OQyGXhpEqKRt+g5VJ/neo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634470; c=relaxed/simple;
	bh=ClKhqxGbstKanb0/jRi/QInpRewdF+k/fJjdYaHj2XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDCcnGQCcxIWvIN22LRNMOAssvqq4OeXUntRgH5wAEkuapvevUsUnT0NstAFm1QqDE3qqvUTiXIJNfDuGqBvG8n95GC5232HuYZrNMxPu2Aus6Ucdj4vhGiOCJW9gjcDSkOcwI071X1xOESYmVM1FmhuhP4SkbN/K8apQD6O7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XWz1B73x; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XWz1B73x"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-846d74770a4so467020241.0
        for <llvm@lists.linux.dev>; Fri, 06 Sep 2024 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725634468; x=1726239268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
        b=XWz1B73xxhyM0NMJgqB/sY80ombrtkHtF6nBFwOqzaDbZaByvRP+xm9K7Y4VF/pTb/
         21nidN4NMHrAx3PP/7DAT/C0uOdLslol7chIb/OqqXFCJTd/xUYhFrAv/H1gVhkxFcdw
         A4wtJ9OkTvtbBJZ76EJ5nAhlNA9/ikVYSqys4CPC1SpNdRcyvDihMpFr5G0V5q+Tv05w
         KsvLkYWNI6RrK1qV+BzZloh3p/8c7+ASaV98GhIV2cwDXs1K9Eb4PZLclI+VdgI/mrP6
         wUgpDZB/uc/sYC8CsX58ow0E+K7EEBXn/KNbxieM6wpk6hnq6g/XoAdWdO9bAvo8tN8n
         woxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634468; x=1726239268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
        b=TV5Ubosxf3S/bgkt1FDcFNa73vYujqaaT/AFrGzf2O5eyVY6GY1LUrSa4PMy4IAL+L
         ighDNlD7jd3A7Q+gjVFp+hExmxePl8aSEhnX02xbDBj+epnTxtuVKy6gZxNT7o8eppKU
         rR/A0kn6ps8KvJTpYjNW6OMpP/k8Gvuqs7nG10CVqf1UEZbxyBvWoMVSSNdCuIocB/lt
         lOyji/aLZNOlGoINwDU667vXINfV2v4Fle7z9kJeo+16qmXTz8IMqUVGqegYCBrycSgW
         znugVK7g+G7Fm/dSuFiV1WrZRl6Y8RJbmdwh5Iqq96JARnIT3b0nBZHcpOGQYEplBtCQ
         /vrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO/ZAgtXCZ1hAtnaEZaUIT4gYpDqO6EQwgatNHBzFQpZxpr28Wrg8f6tf88w/NniSTjkyy@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4BwepVa6rM0ECLOGshQvUYu2HSeqZeI9zd3utdmZzHE99oiqY
	kbcd4sqM8xAvU3lUQKbFdvI/CJ7cLrvNlEthJimFuDNhs1o8xtEl2qOjeL5PiKNfGyImKEyP5hR
	4MsXnLq9/1MqTZ2BP35FiAPeTW52h8SA7fPRi
X-Google-Smtp-Source: AGHT+IE2ETqS8j5INGhOJuEC0LfB5JoY7mno+WUbnlfQDVox+nEHO2zDE8qlvEGgTlm1b5qEJlJi4b2dA1AvozrG+1Y=
X-Received: by 2002:a05:6122:318d:b0:4f6:c44b:2504 with SMTP id
 71dfb90a1353d-502143c9c06mr2840417e0c.10.1725634467954; Fri, 06 Sep 2024
 07:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 10:54:16 -0400
Message-ID: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	speakup@linux-speakup.org, selinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
>
> This tool is only used in security/selinux/Makefile.
>
> There is no reason to keep it under scripts/.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/remove-stale-files                                    | 3 +++
>  scripts/selinux/Makefile                                      | 2 +-
>  scripts/selinux/genheaders/.gitignore                         | 2 --
>  scripts/selinux/genheaders/Makefile                           | 3 ---
>  security/selinux/.gitignore                                   | 1 +
>  security/selinux/Makefile                                     | 7 +++++-=
-
>  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
>  7 files changed, 10 insertions(+), 8 deletions(-)

Did you read my comments on your previous posting of this patch?  Here
is a lore link in case you missed it or it was swallowed by your
inbox:

https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moore=
.com

Unless there is an serious need for this relocation, and I don't see
one explicitly documented either in this patchset or the previous, I
don't want to see this patch go upstream.

--=20
paul-moore.com

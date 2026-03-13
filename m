Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824C396576
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408958; cv=pass; b=EnqK+EHgfccbSfgscmtm2nlIM22g9b8d8AQVwktEcXFdhiRB9QPh1R8saVo6QXUV0QYfNwP5VODrZlY9kqNMBorRulNqSAdvl54xRIaXypS59g14747Eyp7OMJru28ENDpQHPXB3QR1X8vCq9u0TXOasLGncVU4T0JbH2SDBSlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408958; c=relaxed/simple;
	bh=Vew5/pNVzaHeCl6MkP4hTQXVcpyhFe4CeyXNr9m8cEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZuiXav2QhJz2HWcbEiim880xmFUOIB70vYRtPtuF6Qjm00SU0XAQlDJl2fXIE6UvPz+83h/WbQVZaNq5SSx9zIszgwPjFKAkBovjBt6as/rSbwdPJ+1ETAA0iQiFTWnM4eJ+EAqdyvxH2T8/LoXzqXUXsftjAxSkD4rmuadST8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3UCo/zZ; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3UCo/zZ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124b07e5fe4so103791c88.3
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 06:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773408957; cv=none;
        d=google.com; s=arc-20240605;
        b=lXkoD4ideVFslcwPY2Tf2Z0Z4AmUxNqPu7Z1WjfxUAZjIydrDTzBMQtuUeCL9Hivuv
         /+DThqqyLOLSnB1MnWmSkCIPeGUUXUhVsh4CUObYhpQSgOGXZQ1wjjpTENW8Cgu8Eusv
         BjbE6KDdswfmbQAgZ9p/QPOwmKWG6yKZV/0zAT6El8Y3Vf10foraVP1esdGzx3CSJjNG
         SVKr9XK7pR0FW3nNHdwuheFsDUT549R9WqZ3KP3znySL5I8Cfs8D35Pd4s+y3mrlv72d
         UxbfjHa3gYZKYEf5EAEOzlfE5HezMjTD8kPBw0ipQKI25L2pDUmR/WvK5fICBzSqx5gp
         3MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhMxT5t81umetHP7OJdIfPfi7qUU4Lkh+7YuNP7wTXU=;
        fh=CsFnVQpDvFtd8MdZ67H2SkJftjbYuPFosvGmTyq/0pw=;
        b=V1B0GnZAMrCZQiBVLI4jT1IU15umxBp38IywAIp7BXUf4Cdsp+OXY9OdJAGPDbMd/l
         L6Qb+Mqu9kgBEcYI9dDH3UaQu2lCYFUYdwk6e6+M/RUxxnBib5yFFJcHIrhjNp0O6Tm4
         OCAPCpmCrA1EOrU5LPpC2tos7QHBJ7j0tHFCKbSyQT62MSODJbGmGXaZ/fbkcRubTcir
         uaQtwda3I4VBBqGJ/pRWK+DnMxUwBQCCfBDVMfvN7igYpvdFAY0LIqzDvwpqeH825sAW
         fSPud2+LQF7ct0paY2BFZitegHoZU9WFYVDcvTwxGZe6PNY+LWb1CRNMYBl4kuNdltZE
         2EDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408957; x=1774013757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhMxT5t81umetHP7OJdIfPfi7qUU4Lkh+7YuNP7wTXU=;
        b=k3UCo/zZKqfjdyWR/JW8dnDqkTAbrLQUfNzQxEjT8FNFsqKVKoObhXgbGsso2WbQOr
         7bjQkylvkGbpmjNesPtISuqCJv/bf4QLACX7I8rSrg6lGhZw7Xe1HPf2ks/lnIWvGfrI
         WeXEtEJZTIv1YDUfjnG0TCMhIT7xq8J5WqKjFicYdKxfUX3lP8AXZc4vwHR06ZjooumU
         lcIio+mZClEKmOK69ka+uCHaZvNxxeWZeCgiTP0k0Q6FXxK17abH1JNptXoxRPTy/CVh
         GJO3xdjaPT1UkgVt778o8X9NzBz/LCzmcomQYLKw46X4EffX1j7Cv12BvJXd80bd7v/X
         yWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408957; x=1774013757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhMxT5t81umetHP7OJdIfPfi7qUU4Lkh+7YuNP7wTXU=;
        b=XdGnQOcYh/P9K2Icfz8GdRI4Er/ApMBWGdVPTEpIxObnSmJbM2cuYA7rJ5mVo0VnR5
         JcRFwZhu+0UyvxhpeI9H9DOabINm6Cl229tVfltrktNUpllPo7311T2TxWG/r41GR+Qo
         n9vD8ykS9kHEFo8VZN2uhldKU7ciOSNjmuh5SM1RLLWOkqnvKhRJK0AQGjMI84zjUosV
         aIDl5tCwLtoLE+H7wA8w6y/P/aBVi1l4ANp8Y5Uo4FHeFdGQ/Kip9NsUITa+6hbU6knk
         nhVdieuQXjB/DLo9IxYoPjPvSPzQ8i0UzIe3POSJAOFydpIaAUPZk5QzcKIMxV8Efb87
         Hy9g==
X-Forwarded-Encrypted: i=1; AJvYcCV2mEGIAEl1Xhcu4AHe7eHh7nI+6PmGtj1XXBxCid8Lde7SgDO/ReI8A1hDBf7mLMfuEroO@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0lOVpveRC+/IacPM2QzBwSsisq6Y1wvulM9Y99diPT5bvpbVo
	t1oEbXjnL2frm1vpwNhDO0mp/W3ZypRDQAV0rO24n6wLqAM3Pn7RLySZ9aKd3K4P/G8eBDI/hXb
	8TTbjDs812NCWk60KXGgXjwzxUZNuHDQ=
X-Gm-Gg: ATEYQzysQVkBqgZ0oz3Qe3oWtQhNZTBmmkedCtfAyvPiiu6li0UNzwvs0cSVPzElU1e
	dTArNHhc2Rk+fxsniTFjltMl0qlL8Y9EWnVm4nPcKspgj8ICfcD6DgUyfY5KMlFbG7eIesLvaTe
	2UjQ1N8UWZML4d915+XHevU8EuG9KCZ2thpKHxTqpYYW647o4oXCkKHb6Brhu2Gp9dyIMd4i59c
	kNFJhHoW+QhsfZJWZd22U3dUVAech7jI0T11txocfo+LGVKlSUdGiKwq138PNdou9OTneMNtUNS
	SPH0vr8d/Tr0rRRzgpsMPflh5Bj6mlEFofXY6P7od9iQSlIAO5tKRExZIKLTmOTOf626aA==
X-Received: by 2002:a05:7022:2391:b0:128:d4d5:93b9 with SMTP id
 a92af1059eb24-128f3ddb7e9mr736853c88.7.1773408956533; Fri, 13 Mar 2026
 06:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312-amdgpu-fix-clang-c23-extensions-v1-1-59883120a451@kernel.org>
In-Reply-To: <20260312-amdgpu-fix-clang-c23-extensions-v1-1-59883120a451@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Mar 2026 09:35:45 -0400
X-Gm-Features: AaiRm52K3lFtnPCDTCHQ46AGp4JF3gz3oOt-LlB3C1NBMH_-HZtICTmqKkOb1PM
Message-ID: <CADnq5_MbW=jfGJE=jJi4EXacQs37P1d9KV4a8HjNDLwicwZV7A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/discovery: Add braces to case statements in amdgpu_discovery_table_check()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Likun Gao <Likun.Gao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building with a version of clang that supports the narrower
> '-fms-anonymous-structs' (as opposed to the wider '-fms-extensions')
> along with the associated kernel support (such as in next-20260312 [1]),
> there are warnings (or errors with CONFIG_WERROR=3Dy / W=3De) from the
> switch statement added by commit 47ab777c16c7 ("drm/amdgpu/discovery:
> use common function to check discovery table").
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:560:3: error: label follo=
wed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     560 |                 struct ip_discovery_header *ihdr =3D
>         |                 ^
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:568:3: error: label follo=
wed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     568 |                 struct gpu_info_header *ghdr =3D
>         |                 ^
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:576:3: error: label follo=
wed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     576 |                 struct harvest_info_header *hhdr =3D
>         |                 ^
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:584:3: error: label follo=
wed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     584 |                 struct vcn_info_header *vhdr =3D
>         |                 ^
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:592:3: error: label follo=
wed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     592 |                 struct mall_info_header *mhdr =3D
>         |                 ^
>
> If '-fms-extensions' were not present, this would be a hard error in
> older clang versions.
>
> Add braces to the case statements that declare variables to clear up the
> warnings.
>
> Fixes: 47ab777c16c7 ("drm/amdgpu/discovery: use common function to check =
discovery table")
> Link: https://git.kernel.org/next/linux-next/c/0d3fccf68d9873a3c824fb70be=
0dbb2c4642aa90 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index f9f785c5d8ac..4209945af66f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -556,7 +556,7 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>         checksum =3D le16_to_cpu(info->checksum);
>
>         switch (table_id) {
> -       case IP_DISCOVERY:
> +       case IP_DISCOVERY: {
>                 struct ip_discovery_header *ihdr =3D
>                         (struct ip_discovery_header *)(discovery_bin + of=
fset);
>                 act_val =3D le32_to_cpu(ihdr->signature);
> @@ -564,7 +564,8 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>                 table_size =3D le16_to_cpu(ihdr->size);
>                 table_name =3D "data table";
>                 break;
> -       case GC:
> +       }
> +       case GC: {
>                 struct gpu_info_header *ghdr =3D
>                         (struct gpu_info_header *)(discovery_bin + offset=
);
>                 act_val =3D le32_to_cpu(ghdr->table_id);
> @@ -572,7 +573,8 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>                 table_size =3D le16_to_cpu(ghdr->size);
>                 table_name =3D "gc table";
>                 break;
> -       case HARVEST_INFO:
> +       }
> +       case HARVEST_INFO: {
>                 struct harvest_info_header *hhdr =3D
>                         (struct harvest_info_header *)(discovery_bin + of=
fset);
>                 act_val =3D le32_to_cpu(hhdr->signature);
> @@ -580,7 +582,8 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>                 table_size =3D sizeof(struct harvest_table);
>                 table_name =3D "harvest table";
>                 break;
> -       case VCN_INFO:
> +       }
> +       case VCN_INFO: {
>                 struct vcn_info_header *vhdr =3D
>                         (struct vcn_info_header *)(discovery_bin + offset=
);
>                 act_val =3D le32_to_cpu(vhdr->table_id);
> @@ -588,7 +591,8 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>                 table_size =3D le32_to_cpu(vhdr->size_bytes);
>                 table_name =3D "vcn table";
>                 break;
> -       case MALL_INFO:
> +       }
> +       case MALL_INFO: {
>                 struct mall_info_header *mhdr =3D
>                         (struct mall_info_header *)(discovery_bin + offse=
t);
>                 act_val =3D le32_to_cpu(mhdr->table_id);
> @@ -597,6 +601,7 @@ static int amdgpu_discovery_table_check(struct amdgpu=
_device *adev,
>                 table_name =3D "mall table";
>                 check_table =3D false;
>                 break;
> +       }
>         default:
>                 dev_err(adev->dev, "invalid ip discovery table id %d spec=
ified\n", table_id);
>                 check_table =3D false;
>
> ---
> base-commit: 7a9419ab42699fd3d4c857ef81ae097d8d8d5899
> change-id: 20260312-amdgpu-fix-clang-c23-extensions-1fb28eee64c2
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

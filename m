Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69691862BB
	for <llvm@lists.linux.dev>; Wed, 14 May 2025 03:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747191992; cv=none; b=CXlEtse2tXe6kjqMOl9LlYuWaOf3JEkAWQekIVWj4M570yn18PBEfTR75i365AcyYOxslsB7Z8nhMBKK1WIPFPOX9dKC/SO0KWCcNhlBMFrQEHeSmvycRxfYktorHboYEU4WaALP/ZWzqll3f/oHfSqLpE0Rle51YYTgTPAZBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747191992; c=relaxed/simple;
	bh=QJlpMcodJFABVCXdqNlhN3+5p9vJ34o3HcUPNXekMzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnTVcnDlH5rUPv0f5ympKhr/UycStaq1HM3f2qHYYlHBtUPqhA/ZENA4xxsCGpwKPh9fUIHL6BhzJyYECcUzQO2mGnKeX6+CiEURfBbkeNaVMvtSILmN8nOy2vcCX3B4+CdD3o6FunDxvdvD+z5/NIRl3Cw+IhLOdV7TG9I9zGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PIQtl8rQ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PIQtl8rQ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7080dd5fe92so56225587b3.3
        for <llvm@lists.linux.dev>; Tue, 13 May 2025 20:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747191990; x=1747796790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmR0DV4kjICn6tOrrkeV1rJdypEVd85y6xmhHZSq2oM=;
        b=PIQtl8rQRQDzK11Rjzy4YgjUzmfejK465TBLJHOB/y8K1QGs5cfj2ERl/ZfRvm08Kg
         F/ZDBlU7HpJZGsO48OFav4Mcdni+7E0XXDmHZPPxBGgCvDrsHrGmc78Ns1UEMAiH5BHZ
         LaBbsI4uISpICqnBCzsSZgFtFLfJovSh2nJc86dRvpfwGdMnhc93DpmbnRB5habEdxZ4
         YOodutglAc5NE19Z3CPLrR56+yuLRfq1EZ+8GEAKH2P17au+Z2ZS/wqzAySV19xkJca1
         X9GXuGkSIjeIM+PlXzpkswDEs+I1PU4zRu/qFR5rGxS3XUiN9DbAem0X50+3UtItnbWi
         s+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747191990; x=1747796790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmR0DV4kjICn6tOrrkeV1rJdypEVd85y6xmhHZSq2oM=;
        b=MvL1yrktHOpxfe7OMGdNiBmZmEgYLclVgENl1hjtj3PvktmX7rx/QCcRJ1GpoEd8Fm
         MZHzlvP4IgwXpsVqxNg4j0eDNqVJy6DiqdAaJk5iqQSNxtF1nL1bCOLxYQOmLG/j5WGz
         /qJpSvj8Vjpjb1+X5O6A71SGozIBDV5IKKMw/Q03NLLXsS0zb88plGVd6sdbRNebtoTh
         SMGftWHwjLgQfvKz3VK5Xv2Yo9D/hWC1l2O/ApRQtu5q96QBjrxt2idB0RB4h8K1MzeP
         M6fkNtE7oKXN3I9A6HdNMz0MAiaRtLSOq8F67R7Yvzm9dPQANiZA5PIaAaC+b1yUiNMa
         WxwA==
X-Forwarded-Encrypted: i=1; AJvYcCWnRAM9SUcL2+hwFdAHvtPxqfL40XP+2KuROx8fvk9iUltEL2Wmnj1NrM7zDUulKn442D0n@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8fAZtqM5CV8MlUMLfUo1oqf7MrA8dfu3nuJNgY18Dyj5zXHN2
	BDzLph/y1Q/cvJQlC/Z8+kOYgnZLLH/7KKes4HGUcPybzDlLjf44YdUFDzt9xgdDCyuor+oLCCH
	h79KsAyEidqvCS1fLmfpZ/pqYH7dcc6S10dVG
X-Gm-Gg: ASbGncvSXKn/BAmNVTh1CPGiWhsmJsHov+3wsr4q44ADJAgqJ2MEAjAVL5T8HOQvfFy
	cSeD/09a1FpQTfNuqHkYAcYkixCWDrq5ens1zih5ZlfCkkoBrzQRoEyeUCsTQAVG+3nnqSDMFqQ
	1zSKsdzAsH1saq9e1kPnC0T7X9lIxCSkK1
X-Google-Smtp-Source: AGHT+IHoF4lWdSffdXGrv/OfRi9mN4zsQKU0Wx09452hnzxCArs6kDfkdHSQP63wj5stxfEFYGHGU4RZ0y2yDDB9wL0=
X-Received: by 2002:a05:690c:6809:b0:708:b7c4:89d9 with SMTP id
 00721157ae682-70c7f12b587mr29661517b3.11.1747191989825; Tue, 13 May 2025
 20:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com> <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
In-Reply-To: <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 13 May 2025 23:06:18 -0400
X-Gm-Features: AX0GCFtmtl8iZvt0__SZY16ZDtDEOONW5PvqEMj_YT203ANGlWr4B8M9PmCIO_o
Message-ID: <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com, kysrinivasan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 10:01=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrot=
e:
>

...

> The signature check in the verifier (during BPF_PROG_LOAD):
>
>     verify_pkcs7_signature(prog->aux->sha, sizeof(prog->aux->sha),
> sig_from_bpf_attr, =E2=80=A6);

I think we still need to clarify the authorization aspect of your
proposed design.

Working under the assumption that the core BPF kernel code doesn't
want to enforce any restrictions, or at least as few as possible, I'm
expecting that the BPF kernel code would want to adopt an "allow all"
policy when it comes to authorizing signed and unsigned BPF programs,
delegating any additional restrictions to the LSM.  With that in mind
I think we need to agree on a way for the BPF verifier to indicate
that it has verified the signature is correct to the LSM, and we need
a new LSM hook which runs *after* the verifier so that it can inspect
the results of the signature verification.  While it might be tempting
to relocate the existing security_bpf_prog_load() hook, I believe it
makes sense to leave that hook before the verifier for those LSMs that
wish control access prior to the verifier's inspection using criteria
other than signatures.

With respect to the LSM hook, since it appears that the signature is
going to be included in the bpf_attr struct, and I'm *guessing* the
best way for the verifier to indicate the result of the signature
verification is via a field inside bpf_prog_aux, this means the hook
could look something like this:

  int security_bpf_prog_verified(bpf_prog, bpf_attr);

... and be called immediately after bpf_check() in bpf_prog_load().
As far as the new field in bpf_prog_aux is concerned, I think we can
probably start off with a simple bool to indicate whether a signature
was verified or not, with an understanding that we can move to a
richer construct in the future if we find it necessary.  Neither of
these are directly visible to userspace so we have the ability to
start simple and modify as needed.

Does this sound reasonable to everyone?  Does anyone have any other
thoughts on the authorization aspect of BPF signature verification?

--=20
paul-moore.com

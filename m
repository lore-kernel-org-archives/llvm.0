Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5A1F91FE
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908557; cv=none; b=uaa1sXrPQs8XQz54D/OX0dPhAzeTwR8UhEJm01W3HucxKcElBWH18Iz7m5NphJBbMb8XSV4TdRHV0yGJpF/Yoox35mhI8C50VqJnf8MFrhrSyXeHt5HUUyUCIsFJR7SfO/YFjqMuVUKe6BefyaPercE0eux8Sccrs3JgLUQx4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908557; c=relaxed/simple;
	bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/4LibNP7GvMjIN6ZuqJ213Ql6NHEQ6jw0szzKF7RyX8/BnSzXqk8ilmuLr/6/czsocF1P2XcgewIrv2PfZ3+75ARSkVOa8z8YxRoT1kmem8itceEVK9sScz9oNc+zZUKJV/qSa27kxuQOUDAO290Mf+WzeE9dc17ZlMGy1n5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHtzot47; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHtzot47"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac297cbe017so483238266b.0
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741908553; x=1742513353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=zHtzot47hIPMbQPGzLkn0w/rsiAxkwMFYWxNoP1e0pc6cglUgGWB9eVG7RJfkVqZC9
         TtHGWzWWDl27Buxq/IsXimQyZ3jKWb0NboWzj/4iU8TXe5Ihiv9Ffx1HxJD+r6UHS5Y4
         uxbKr1eboyjf7ZaC10uFj+9fuCcZGytc+fShpiW1DH8uM8tv5Z21zVIVH2ps+N3ILJZV
         h6xNUsmmpNuIkxlWuHgOciXKBkQvAKaDCONuQacxpAcfnK+smlWlVyi42Uwwv30g7l2z
         vOfZBc5kyasfQh4LwhjlPyMxZggukrhaxuI+9QSenVVTQ1g9JbKWzMF+raiCbtJIR6bK
         aOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908553; x=1742513353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=DpxVGhYgCAn6fYidIW5VAqIvsTIXzI5ATlCjqCS76OmH0VnUa/y6fTpOWQoVk7JM8m
         wz8zD7b7N189kZQPfR6A4VFmBAnnwMW3PDOffoeZSoeQ+o57/tslwQvHQJQRj3k7kokD
         3UHuI+mBLIdVOMhXAObBPsZKGH3IH8AeDHwOtZD7ypqhQzNFQzgiKNU1UuOgyV9rkBV6
         E1wNYUr6suvX1/b5nhaf2c7WGhKTkfRe1KVaQt3eh1tJhSQQKccJhxqt36z9STIQB28V
         eRi1B/wabG6SgKgXmKdegXraHJeLCf2nFslLQkxPCSoFR91mVqXfFdviLHYbo04xccbk
         8yiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmiXAao+erMyNtQCVI8taLW0fMkOq1Bq3Hlr8uh45k89ywjiDPkxTRDgo3rvfE+41Lgoi+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2exvKC4XdEq/0ZEgBND8c36EAg1e4fp9yv3xAed60rICWZis3
	ABekhiJO55Qo6CfIwnRUOxKBreW5ARGs4y5E8qod6ni49rUCDlA5zRj+ula8AeGEiL58f86dT7v
	T3dRpo91Y7K45vojSfxh8Llb/wm93skJR2kFo
X-Gm-Gg: ASbGncuUgVgg+bvm110s7ohc29fy+653FYKn9sVsdCbTMNkATvJHACXmNSjpSFhupBQ
	vydBPMsZ57lbd3avJG+IpZsu5IzPzdDoau5eTHTGi87J5xuJgo0wr4gSFgr9FpyYYyXcWLYSPiE
	AmiPoH3nICJV774TEBJoRR9mvR7FddABU+8YMCv5Sn6vZeyY2IRYjzbaMeZIwUUBfLog==
X-Google-Smtp-Source: AGHT+IEhG6Uj2ZgXODFDQkPgzEVnFaKEkMeOMCOgSAKxsS7ffAl3Oika6RfeExnwIHlB01YBUlfrm+cZgMXZ8GfGSBI=
X-Received: by 2002:a17:907:6ea9:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac330de660fmr24794366b.0.1741908552998; Thu, 13 Mar 2025
 16:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312195951.1579682-4-jthies@google.com> <202503132357.RnlF5A0E-lkp@intel.com>
In-Reply-To: <202503132357.RnlF5A0E-lkp@intel.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 13 Mar 2025 16:29:01 -0700
X-Gm-Features: AQ5f1JrveV3I6ofpSQly6Maa1d3lFcNQ3Xq7VBo9SbjQm6kMIPtOwMRmVpnj6fw
Message-ID: <CAMFSARdJgVQitDWmszbhSiVfu4hCoyyNVj3LPHb+7wq64C1BiA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: kernel test robot <lkp@intel.com>
Cc: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Echoing my response on patch 1/3, thank you for taking a look at this.
I=E2=80=99ll follow up with a v2 series to address your comments and resolv=
e
the build issues. Additional responses below.

> > devices will be created automatically. None of parent devices should
> > ever check if the child exist to create a child - it makes no sense.
>
> This is still valid - none of parents should be poking around to see if
> there is a child or not. The core handles it, DT handles it etc.
>

Understood, we can remove this for DT. We need to keep part of this
check for ACPI because there are platforms which need this driver and
haven't defined proper ACPI nodes in their FW to load cros_ec_ucsi.

Thanks,
Jameson

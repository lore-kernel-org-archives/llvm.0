Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33790260A3B
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855737; cv=none; b=H78ySI18emwCIcrPRxbIm/TRH9FxxO8J1tMxTmZt4oJeaaXKoKmFQDiGISJTZdsTb+3N8bUM8jFlK1JHBzG59fSwCgaL1pf0T7HkjE6vaUwZdCpk70f2Kd5MLDIpzSFSmyf9VSx1oiZTs3e6dZdw7grMdBICn6Y7dRouR+J7lb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855737; c=relaxed/simple;
	bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkgOnNi9Ghow21L2UuyNG/jThqKCjcrZ0rR0eMQBSVfnVWiNiKCUdSscwh5n81Bv1W3j0SH0I2e+f8EDswCq2zT4H1F04p1/0TebUWS4Qyn3wn2HmIEq2B+CCBe+69HYmt8gpDFvER9OP+FcPDCyKnSbexySJCRGyBKB8DvkuzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baxLNBtD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baxLNBtD"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30795988ebeso7700121fa.3
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741855733; x=1742460533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=;
        b=baxLNBtDFUOMqPzAG3XMKy3cp32sYmAhj/EzWbkBMRlkPyMhuO3fiNi3YfHP4zIxwb
         HJEol+FU7lY/C34Hq9Nygh5j62yibgKJFVLjcHDxjUt5f47zTOXH/yPXaErDG/BH6CXh
         65XpIqn0WFXxwE+NfFAuywY1gdIrtkMHPGdW5nNt8TQIg5mKk6vRPl0QfxqCP1XlXdSb
         MuUHJEEopNUr/cVheNN/iFMv7AAix9hCopW4OY6HobiEynA07z/yClwcsyUKsUtrjOcj
         W1I621EUJkI3J+gBcN1pJGOweJ3AlvzFBNcWeJwwuJbii3o5LxGWvmQkl9Py+GB/U4bS
         pN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855733; x=1742460533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=;
        b=aGquT633P6oo1Ui/Xu7A9QjQ+c5u0X7wHPHvz2GBI46c0wKZkiy4jt5ix2ZFakdMey
         +SQEDCpB+2nPQPQr+vRcNUfmDJabi+n0P33BBRRnd0RHIg63IJ+RQH/9iRW4o82OcAmx
         Fc0aQh8V3HYLPUNvu9aX6GTiVICfHMgfgMcz1gpv6iE+huQB3K21qrxfawEkhHuFTUUl
         K0jBB0dzz+LnJQcRwZaLM6OOxVBgK1x1Gr2Rkjm7t7Ew0zE8ZgqzWuh3E+aG5hp8yPCj
         cUI0qqjGTVH+1R+T7z1N4NdULouRcIIGfc4Bs/ngKafsfeDtNfcqgGL2NDHbJLKhgQVq
         trGw==
X-Forwarded-Encrypted: i=1; AJvYcCXUNLDJpE5mR3zxuMLnIogCV6+qHfpE7IXAVtsXdjpKnlZ2IZbCKYzX7cY8Ag3NIvBBPJ/H@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu2WOUwMoRoMoFQzlLXEea5P2CGPOMJDKVx2Q9xgFQO3VSlfA+
	8UMQsH001IRC5i7Oxlh5e9QehV+8RqfCz3vXtaHAuqKeSRpXsUVDjR0g6ZSCYmk5cK3Td//Qi3a
	nOUKDRCi5ibY6A9rOZUwQU63FKjyvL5Vm5UTleQ==
X-Gm-Gg: ASbGncuuorWXv9zWOXouP1z2AUSCKW+eZ0yGmbRT40pYs2aLdbBzLPoOHzDjWo0Jqd/
	GmOmVzdTeZp0yE/pRe3xpxrZl+NP/8f+KKL9SFp09oR6tpbStFU1UI2k0Jds1gJS0aQuGYx64Io
	iOrDq2O59tTEC0gX/vbrL6goQ1Bg==
X-Google-Smtp-Source: AGHT+IGI8tFaOVTeJQCqFzI9EQ42o/9graFjduSws1PVhjUTSRn9EgLXRgQWygDrvrGqu/hZbh3Ks12WRVjlfFyAipk=
X-Received: by 2002:a05:6512:ba6:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54990ec17dfmr7466352e87.53.1741855733121; Thu, 13 Mar 2025
 01:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 09:48:42 +0100
X-Gm-Features: AQ5f1JqmIPVBXkWKiQ4L7FkcGH2_zJJXfhNRe652n92bAmXjxmmkzkQ8l-fLCmw
Message-ID: <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>, 
	Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
> overlay description, which may be needed to avoid discarding necessary
> sections within an overlay with '--gc-sections', which can be enabled
> for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>
> Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
> within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
> conditionally add KEEP when it is properly supported to avoid breaking
> old versions of ld.lld.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e5=
5ec99b1620dba7d8c
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Very clear and easy to follow.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF53D1AB5
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474521; cv=pass; b=JrLv/GKDn96fVIp1joSMyHtKNRjWPJtRDe5bS5NpBCFpbib+tAz3ZbYoOzROdXkkxS7TkJxxNeXarc1Sa/eXC3s1xYpW6XaN04V7zINbD32E0gUISgOoNly76/86bUKkexhfDuINqIVVZgE1syuZFD9rKfly0r1zTVnn+Dpsty0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474521; c=relaxed/simple;
	bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nawyaCgHYJBQry4V/MANYZ3PGbyBIYWRVG1woJfSYMgM9vZZMoXp9uHI3dID/+NBQS4OiQgLSoLlw2ebJukXoV4407hH8KHzMC5/HgLJ7P9x+rXW+zSQGeWxenF/eC9UBdg9s5CdCtubJk/YDVbRdOtqDP+UThDyUvNVQIGlHYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYID9E3M; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYID9E3M"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so252644a91.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 11:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786474519; cv=none;
        d=google.com; s=arc-20260327;
        b=eRLYEgIFN7h6H1xbexji1iaJsEdD7ciUwCIz0wG0VVy6Rfun11es0Svb+RoONEmRkt
         KTTirPVnuOZKP4XygLopLkal0PhgVGiWZG+sTUoPtpMvTCxWVXfzQWMh+OGunf5Mcpkc
         i4FbQq8Ye9oN611ff8pMnfbSFkjFhFzdpgqhfNR7TeYjGEIzPTmUpoFwee8TzV95KYhp
         r+htjsr9JBEzWhVIaF2z4UhAJVdEUu1Kh2fjAT2ogL2GhVFbXEz3a6mxCWJKjz8qDfJG
         4lo7GZa3qPal69KcQpaxNyvK9jp9rPO1+8X9VN8xwb4k2SAJzH/str5oMMTrUUvsLau1
         QbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        fh=0KWcKRq4ZHMekWWHnJFmS2CBPGca1JS3nOSaK4bDric=;
        b=K3K79XoHLJKftZ/r+FFM3MGiYTey8uz4f/V8xmfz8ph9falCnfSKpl3+VeFwCdWtsl
         OkOD+I2dUZ94wyCw3Ho+XfL2CBj4KvOtL8WcYIinIEM5pNZ/05DzjlX6oW/8cHh26BBz
         wqHhrPF0iumGT9DlFL09Fo2SY5XrHMfd67W1+50n+dwSQ1A/xoms9KrizM/HyKKbs+Xr
         Aag1b6hIrLbgANg/zEKroR6cHcTk+l69geWrG5xdNtgB0VbXImNWNIWpfQigWE/aT2Ve
         goIqTCcbyTHhzvReom2O/x8r1VngIS5v35C912TmarPQE527F1zL6ik7V3q0twyH4oH2
         +a6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786474519; x=1787079319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        b=GYID9E3MlQR7nWDGm8bMJouGG1XZ/3dexcUHxBzqO7F9i2dBulksfejWIbNI/BxcVY
         9qRDF+VHXUW0x3anE0kUQjCT3cofMlSoPZVnqvKshRCpPRsrAKI0SG421xEbuUm4JsfC
         EPByYre80OCxBDMP/8sLgo0DdaWtPiMWZbAG1ORmdFmSVNwICMCpnSfxZltzRbFhKKxF
         k07G2hyhObsrmJykUfnN/vDIHWx6WRcCMffQ42RHjbwRXTR3OjgNle97h/C6S+prYGQu
         y4AxbESEa1SjAjL5a4AO9eotfm5VHLNlT8dYcEc53shJqAX5YWn6SAGtk11fTEswOImA
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474519; x=1787079319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK5DpGIYIZ4Q5mypA8J7nQL3JpavjxnvYneVp4Wv71c=;
        b=mepKhZzb2LPoRRourfTbQiAk6GCbd3pdobuqH5Nkmdpp0D8teviDaRWRbHL7hsHSeN
         H2dQVkZuUhVQz/oJ5J/8IJOBzEy0EYgtDnBqMtITI2gdAsJBwtGBK0zOXwQ2ASZ+riUD
         ixZducIrzDPUEfnb28FDSoBo+Rnr4dC3A9PaomGrtfRvVcDB+J+UfLlCQGFMZW3oSZIK
         cSVbfMnCdsX09OXrgwOd8LY+aR/AREBZEuyr7iKwX+WK8fozvVky4bn6FC/fIXPZm49x
         dfu4chQ+vDc58OJ/nAyajCa1BplNj2hy/F3L5zUpB1HOn6XoKVYJSzxbnl3qDwE/Wqn0
         LUpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUcvjXJaC1Zy0eSv+lx3Ab4NlkZNcICRPsvaiiNuPXIm8LkzxbPNk8vqgZllK9wXGYmGPN@lists.linux.dev
X-Gm-Message-State: AOJu0YwBC8Q+1FC/y8hunsz0nn8MKEMYeXpQtdOAQ46VJGxKLVj0TcvP
	VivIZ8pjtHug2gIBkU7RHeGEw5P4VkHxi7fBZ6wv1BI+IuDZCky9AeO9wgcSB9LmTy1rNbEPJYA
	jqRZ2fDE8VbdbyZH8wfCeTSqARL0ZVV1sGpvIQqUN
X-Gm-Gg: AR+sD10Vk0Bly75CvcWue8dLxbLnSbiKcv6ap/a07NzrpTeeqZAVUPemp0VS/14PMpS
	Ot0gZZALM4xoQqRSNGUjzS7AxNUFATUsl+RGrQa1RgxTIinns6jq0f3TMY7QZ6cTYDtQLUROxlh
	hmlzyOxjtC54tQNG5e5d+QvXblZsNTnGxBJkkWjssTZlUPQScTBo/cH3UaPku4oDwwWWPeV3Eg3
	M17hSLYSec5R4/++EJt5WVugQDvLjQsa46AfwKsjPzVEz/ctnxW/9XHCu8X/dG7N/0WPeEMTRbV
	eXEgClkzn76fwneJH6ucLU9ZmknO9BTokGYTSSa2ATy4
X-Received: by 2002:a17:90a:ec90:b0:38e:2860:253f with SMTP id
 98e67ed59e1d1-392ec53e6c1mr6200831a91.12.1786474518666; Tue, 11 Aug 2026
 11:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com> <20260805183702.GA72896@nvidia.com>
In-Reply-To: <20260805183702.GA72896@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 11 Aug 2026 11:54:50 -0700
X-Gm-Features: AUfX_mzn4PfVgkS4FrNbhoBz42phR-uhV7z36r-0P3XLSgGGUO-8rzrUFVLpZk0
Message-ID: <CALzav=f5oUW+B9RvOyaRGtG=6CX_4g-2Di+obFZ4O6B-chZtAQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] mlx5 support for VFIO self test
To: jgg@ziepe.ca
Cc: Alex Williamson <alex@shazbot.org>, Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev, 
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:39=E2=80=AFAM <jgg@ziepe.ca> wrote:
>
> On Thu, Jul 16, 2026 at 02:03:16PM -0300, Jason Gunthorpe wrote:
> > Add an mlx5 driver to VFIO self test. This is largely a remix of the
> > existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> > to issue RDMA WRITE operations which effectively perform memory
> > copies using DMA. Since mlx5 has a stable programming ABI this
> > should work on devices from CX5 to current HW. The device FW must
> > support the QP loopback configuration.
>
> David I was going to respin this to fix the minor nits, do you have
> any more feedback or are we good to merge it ?

Sorry for the delay. This has been on my to-do list, but it keeps
getting preempted.

I will do a pass through it today and make sure there's nothing else
needed in the respin.

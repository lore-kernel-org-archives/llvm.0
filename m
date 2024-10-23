Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5B83CDA;
	Wed, 23 Oct 2024 19:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729712270; cv=none; b=fUZfaxzjheUgxAVcIIvgogW9tCJBq4mEOGU7L6axWtyjq6iJ3yr68Qv6v+HvJQoExGNzrYvAXkgD9jd3vnz0NAZrvZ+2CmGS9dpC/YnVd1bEfpg4ECh3dgtIw5T5/a9mZfw04Axw5q4Z2Lket4bNbwVFT2yVEv7qucImLhGGVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729712270; c=relaxed/simple;
	bh=vk/FW0uRyjtg6oxehehOKzEOIARdwQsuFnOoLse/8iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9Px4MptLBC79aoyTdT4lJrROgaIiQ7DjKjegq5Eko9brinIpL1CH2U36JyHisuYoVsAEKkSiVHMxDJMwYmJdnaCqCfEPjjq58AwdCeNuyvs0FGr2uy0sF83xngRx2b2HP3MDg+8mBNcSGI1bedtoiz3k1j25qduKGwIcLQ2Q+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghIGXDhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghIGXDhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7DAC4CEC7;
	Wed, 23 Oct 2024 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729712269;
	bh=vk/FW0uRyjtg6oxehehOKzEOIARdwQsuFnOoLse/8iQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ghIGXDhNVew32ZD2gMYlCt9/Pt1neNoOGigXStw4tc/98IiT0GqedekdnXm9UH+WM
	 cUATonbfsih9F6Snpj/d7OSeX4g23jygN8E08c1v7mVHOQNIIIFmqzrisbLpGn1cHj
	 dppdmDZ1GfzUizbjehCAmcCDXrpUysl9vglyIwIk8tDEnENo9+9QB8zc7o9WCm7uMg
	 Dz642l3sOhAFmALPJr17iNQX8NdEPgMAhdGgvqUce6ss30duPqF9HPsLbqxL4PrAEQ
	 dP1cjlyuWZgOSoufbw7EFP86+JlqwGAMdWoyUguIdsQ0vf98lg785QExfeWMUwJysD
	 jYxI/D2Tp9kYQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so136798e87.3;
        Wed, 23 Oct 2024 12:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUJiQ8+Rh6Ouv4Z0KwJXTEDwfdD2PZYsrH5d3AaYU+dofOqnTYfHYs3iNg8I0Em6lcAD9b@lists.linux.dev, AJvYcCXIn2hTRFNtj7n713JTe20FfI6fL4hqMedPj0BtgRd9eL1rOHGsX5Q9eaosm3oWgb3+I0lr2xD2r1UGzWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfpGIqhtqlf3HswAJQ8rgR++9LjHzNF1N7/HV6ygAWA3zlrWz0
	phqvfjJgVQZVnqSeFcubY2tahRhFYRqOabvE+PBOT8y+pvJzKbhQ4Mh94af5HhDgHzHSm7idwZN
	uKTS1zGA3bbwLYdiACwG+mXa1zKo=
X-Google-Smtp-Source: AGHT+IFQGuMX2jeh0Jz5r6yINKID7eudPZRo77vcpztx/Pw+oCsd+qyagqPgVWuX6sGYES1W9s3KudctWdki1aWxFYg=
X-Received: by 2002:a05:6512:280b:b0:539:f51e:17d3 with SMTP id
 2adb3069b0e04-53b1a303093mr2066930e87.14.1729712268212; Wed, 23 Oct 2024
 12:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuVefYJx9JsVx1Wz5pV1jKCp9eCPtwZD+FVhdk841q1Zw@mail.gmail.com>
 <b153383c-797c-42f6-801d-a6dcc7bfc4f7@stanley.mountain>
In-Reply-To: <b153383c-797c-42f6-801d-a6dcc7bfc4f7@stanley.mountain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 23 Oct 2024 21:37:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFXimHaGdeDBH3fOzuBiVcATA+JNpGqDs+m5h=8M_g+yA@mail.gmail.com>
Message-ID: <CAMj1kXFXimHaGdeDBH3fOzuBiVcATA+JNpGqDs+m5h=8M_g+yA@mail.gmail.com>
Subject: Re: drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned
 argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
 unaligned pointer access [-Werror,-Walign-mismatch]
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Anders Roxell <anders.roxell@linaro.org>, kobak@nvidia.com, 
	"rafael.j.wysocki" <rafael.j.wysocki@intel.com>, rui.zhang@intel.com, mochs@nvidia.com, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 21:06, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> > Config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIm4ZOkWenPJ71UOZG57R0jXE/config
>
> > drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to
> > 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
> > unaligned pointer access [-Werror,-Walign-mismatch]
> >   156 |                         (void *)efi_pa_va_lookup(&th->guid,
> > handler_info->handler_address);
> >       |                                                  ^
>
> The problem is that efi_guid_t is alighned but guid_t is not.  I would have
> thought that Clang would say that even though the alignment in for &th->guid
> isn't spelled out explicitly, it would still end up being aligned at 8 bytes.
>

Yeah this is bizarre tbh. The alignment of the type should be irrelevant here.

> typedef guid_t efi_guid_t __aligned(__alignof__(u32));
>
> The relevant code looks like this:
>
> include/linux/uuid.h
>     13  #define UUID_SIZE 16
>     14
>     15  typedef struct {
>     16          __u8 b[UUID_SIZE];
>     17  } guid_t;
>
> drivers/acpi/prmt.c
>     54  struct prm_handler_info {
>     55          guid_t guid;

So this should be changed to efi_guid_t.

Doing so makes the following pass:

static_assert(__alignof__(((struct prm_handler_info*)0)->guid) > 1);

(it fails with the original guid_t type)

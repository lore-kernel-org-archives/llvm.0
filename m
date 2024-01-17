Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BF24B32
	for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 20:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523393; cv=none; b=GDqWTeDUekgJ68rMYkhW3imT+bYeY3VvVpznMKSw41S0i6L0yUGBIfVMzr+OzGEO/Jc7HAd2PreuO8XgJxLI3Z/zzxwvXoUgtoSGRoev62z1otP5pElZHYVzm1n/44qBXa1D8GfiLhhtv8XeU1xDrRbQMZrqW2bnsLbwDFeL1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523393; c=relaxed/simple;
	bh=YD575AqDWxtRQQng31p0N7tpxf/VKKoFokMvFPXs22A=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=lb8yQLj1sKgxN6IYKVa3Nrj6VE4zlgB24Tt2yUpFRG1aNndKxbJbFOhA4Gf1ncBAzKHt6bKxJIYHjv65d4yNvT8sAtUKAFjFJMn1RKoD2MkqQSGS4ccTs7t/GkW1W/9oSVwDv5iKoxo6TIZ7gcq1JKujt8SA5lbbJQAVjIQb+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zgROcvOY; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zgROcvOY"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-466fb1cbfe9so1726681137.0
        for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 12:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705523390; x=1706128190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD575AqDWxtRQQng31p0N7tpxf/VKKoFokMvFPXs22A=;
        b=zgROcvOYDDbT15XgNJYPJ+5OMUbJFa1DgVFScardpuJenoNVKnBggWB7kyhT1XnZ/P
         C7SzZdlMObFX/FpI+4UgcC22w4BsNq6ZFlnMTlACn3WfsWuNZgNor7RPQQmSHIJUjKeO
         CZ/QjMdR5GoZtKvfcTA/tHNHSKtx0mYCKmAXuf+ZjJJu8xyHHwbVO2GMfTIxWBwcJq7L
         dkVwjvZxmFBU1frEQwL0gUsMqgpJT6NVCbdhe8+XNX35q0QiXMsfWC3kGsIsG108J+bL
         BU7OQZI/LDVxwDxiYimjU7RQe4YzDPlrMuCXdOjxigINwp23e4dgk2b9ja9RiXX7IUDN
         nAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523390; x=1706128190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD575AqDWxtRQQng31p0N7tpxf/VKKoFokMvFPXs22A=;
        b=pD2188BRKzn+7Qo9El18VbNf55L+j9hAh94cvVLVzzhuPRAQWEmGJyYwqYTnxVXUEl
         CqJNzk54tGafO6MxEH1mbWJvlWqmZsXKxcJQmhDYydsdzC0iw/8RGTNVu5RsOQRmVTMg
         1AFT3pWHsrq+rAn3lSofMq+ejnnXrkw1SgIF4JGAb54uCKInyQn75Ci/nxxKVDzHEAvw
         35YZaUXqiO/w62zDMz1zGtMANUtYL8nto+f4Gzkup+LdOPDBPRQtnLmZfOI3nqWL/Tkd
         kHsRR0XUK+YWb1VeCNcYjmrrEOEZtXJAxwe+/7NMLv66fMgpsdnn64gK+RnhFwxbgmPN
         qCWw==
X-Gm-Message-State: AOJu0YxYuMiyJMKCgQI/GuyS5/dx+M9GBOOR5XfTrnFICoUfuIKgjXy4
	EZ2X4rLYtchYGAMdOXg3darrUXllLeEG8gIC1aYZ9Drmkmbn
X-Google-Smtp-Source: AGHT+IEcHVbqKvU1d7EVd9t6CRSCb7KpK6x0WFogReXb/nzS1/CfbAfHDdma8k5FrNqyvEeozP9wt5g6lskJL31I8Ig=
X-Received: by 2002:a67:ef8b:0:b0:467:ddc7:e7c0 with SMTP id
 r11-20020a67ef8b000000b00467ddc7e7c0mr3765571vsp.17.1705523390532; Wed, 17
 Jan 2024 12:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com> <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
In-Reply-To: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 17 Jan 2024 12:29:12 -0800
Message-ID: <CABCJKudpbeJ+Orie3oMiWrYS0qsh+ZxXbz9tTJcHKvJjiOX+=Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	akpm@linux-foundation.org, keescook@chromium.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Wed, Dec 6, 2023 at 5:14=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> On Fri, 29 Sep 2023 14:11:56 PDT (-0700), samitolvanen@google.com wrote:
> > Hi all,
> >
> > We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> > even if the hardware supports a larger virtual address space size
> > [1]. These two patches allow mmap_rnd_bits_max to be changed during
> > init, and bumps up the maximum randomness if we end up setting up
> > 4/5-level paging at boot.
>
> Sorry for missing this, I'm just poking through old stuff in patchwork.
> As far as I can tell this is still relevant, the discussions are just on
> the mmap() bits (but we'd already screwed that one up and have since
> fixed it).
>
> So
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> in case someone else wants to take it, but I'm OK taking that MM patch
> with Kees' review.

Is this still on your radar for v6.8 or would you prefer me to resend
the patches?

Sami

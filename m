Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B881724
	for <llvm@lists.linux.dev>; Mon,  1 Sep 2025 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756701039; cv=none; b=A56e1RXQKaGNksGFn8Y7YovM09k9vLbDebzjEa9FN0iYZ7sgtbkL4iuJUhd+z5mFoUjBgKSkHmp8YVXkHSKrlMPdgG0PmYpKrMUSt6zNwsqqTcIZS1tUvvia7IlRMcWNAzw7+KGzKT6KeH8dSOShPomiJ62m3dhsauXL7uJRp+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756701039; c=relaxed/simple;
	bh=pSzCqOyvvoq5Jt9kSV5uDNs9QJ567H1LEks3EmaQerM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5uFB+Wt6LMC6wvxAJHBVCs5ZGwiWVtfDd95vpM7Ruqij2mvOgsBicpO+myzCRiovKI74Tonq88J3icuGQIslEVqW4om2eeQmZ25Pi7ERvRE4sNjc1gkXPVq/ca872SbW0xQv5g0wqj9ou925GOf32C0QU34F8///1qQH+uAbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=NmpTKA+g; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="NmpTKA+g"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0225483ca0so244690466b.2
        for <llvm@lists.linux.dev>; Sun, 31 Aug 2025 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756701036; x=1757305836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDQIe0i3X76egFX6529AeV7wfu/j7t3pxfvYUfSQIbM=;
        b=NmpTKA+gB2W8Bc/FHBw4qFyLD1aMM5GP/JYSK8UhNTnc4b8qOXTIP6MwQGmdO8rZUy
         2KSmjagD7VHqs2Zlcnxgz2owW2omj087WAHxMrpkxDG5GIHMfjOh29CEciSFgA7sVax9
         uf6FQydUHCD7KZtgo98ODaEuL+a6Rx2sZIpIa1vDUpLjhZ9heciH3xn9mGXldLr2lOZ5
         pN/GSMH3HMe0jt+rBRmzruBRB72xyFIUnJchv6XV53HJFfINIOAtpRPgyqM97gAuR3sw
         i0HDdjal2zrZp8IeX22nOueFxXQmS2v5t0JOJw1cVXMhIEgYIWdeWlmPDqFYW0935ulG
         p1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756701036; x=1757305836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDQIe0i3X76egFX6529AeV7wfu/j7t3pxfvYUfSQIbM=;
        b=JHe0LJaAsAFhdxGG73TEk+DF0bZVdzcP0yiHYO5g0iobTrjDYkMZ2fscbiwiNq3F/M
         hNN96Nq6JZe16QK3mhjQCorf5MOmr2GC33Gh+kftfXgEkE7JCDJUkpBRe9+bbf4kobYA
         77rBlmtSQ3Rr55asEP8+8xVNRyvVJ0RsOD27qowEaF2uC2da+5OEPHBgyjfpNml/Sb6V
         bc3s+0RsPaewdSu1ot0Lvq7DSwjgz1ZGCjlaM5WyY7U915PiV4C5mpvZ5gvwyS9qB9uy
         06nfGW/d8aBxK7HdrIWX2m/qDLosPRwJePQPQbkEH2PPbO+k5kpXiScIfD8GtWRNa18i
         U16g==
X-Forwarded-Encrypted: i=1; AJvYcCXLJN4dhfTD12g2Rc4MYvhBtZ3t3tAbEIC+1xPx/3dF9jvaPeuG2bfkbZIpzjNF2zPm3vf9@lists.linux.dev
X-Gm-Message-State: AOJu0YwCHNX+MgJ6KrHilPnnV0cK/iwgoV6t+la406nIR8B+jybYs1jV
	7xcZ/O80n3lqO2c7QKeRobXkG06Y5EEU1DVXAKzolk3rt0KjRRTMtHwTbGWv620bmqBYwqT+rvO
	rFrnHezQtPn+HoF2LRAyRm2uIzcu5flWlfHgYSg0JRw==
X-Gm-Gg: ASbGncsQCCwvZLEtx3xEEOBtCvj3vrDJzXtDqhmtPiM/ozeVWGVA0qzTl83WMGUyAxK
	n9SQvb7oALeDtxt2JILNws8QUooTiunkDl267s4KWzFuPWwXA6SkepunHkg/Bt5i9gkJ9P0pDfS
	iyg/nDR1UfPaKDRz55xzDXFOlWIzaEaW+ZHpTU9Z+MWZimgX7N/A0Zx9pzlyAWh1G8jBj9cHITg
	4dyqFZO6Qf+wgaEGnMzU73gkFfMeQt0JTyQW+ygsEUhSA==
X-Google-Smtp-Source: AGHT+IGfZ9IK7/pUtfeHc6DgLv6HZzhwz9kNk2kkDLAQy9Iwa65qh4E0Ue47kA3UHq9LU15ooN9UNEALddPaiQniOhA=
X-Received: by 2002:a17:907:3f10:b0:af6:2f1d:a73f with SMTP id
 a640c23a62f3a-b01d976e782mr648284266b.53.1756701035779; Sun, 31 Aug 2025
 21:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831093918.2815332-9-max.kellermann@ionos.com> <202509010724.bSPPSD1X-lkp@intel.com>
In-Reply-To: <202509010724.bSPPSD1X-lkp@intel.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 06:30:24 +0200
X-Gm-Features: Ac12FXx1zNxU809yDaeQgGpOMM6Li-1LYjsJkwZ1JPL5dRiRDC0y6VWcjO3jTXw
Message-ID: <CAKPOu+_7w9kd7aOp2J2YtYMDbrV1pfrdUT-CnPmHfexGb7RScg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arch, mm/util: add const to arch_pick_mmap_layout()
 parameter
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@redhat.com, axelrasmussen@google.com, 
	yuanchu@google.com, willy@infradead.org, hughd@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	vishal.moola@gmail.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 1:44=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
> All errors (new ones prefixed by >>):
>
> >> arch/sparc/kernel/sys_sparc_64.c:1:1: error: unknown type name 'ickj'
>        1 | ickj// SPDX-License-Identifier: GPL-2.0
>          | ^

Oops how did that slip in here...

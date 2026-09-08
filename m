Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173C3B95F2
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901593; cv=pass; b=J7QsrWagusHkocB6MFGEm3u0r2soK7gOgjNk+URmcL4w9xMFR+MFzb0tZYQMz8C0WITtW79PvVf+xrEFSdVw0WpLvcEBaQtjp4/ycv2TJeZZee5RhsHHQxD3/3sEs2ADeSQjsSD0PnDW8bOsvnBqwBI7pL1UHc9HH94Dt2slLMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901593; c=relaxed/simple;
	bh=cIOFXtCuNna/zYNDEeDAmAkgX9xNg/vNmHFdct8PtpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoG5nZf+Tafp2FecC9fy6rLLKsOV70AqILfKP2QaCqrOmuT1vO/NxtaVLvET7jKa3QY/yByHaEYmy/d3UzE52N4BeYu8ZkGrS/ht0MHTPXXZU1+iFmGp6FlElmqjJHzNJ/eZKcFZEOTQeMsQp6mx77KwM04dlmdxEph4wpI22RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vh6EJ2pJ; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vh6EJ2pJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso48914905e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=LDmIVzKLDbKirHBnDq0/854UVS0U96YntM/cC9dheHOQXvjppReGOhCVz/iMfY7x0z
         XzofmAO3tTnXlir1sgcw1pqXFH/7CeCxduwz+JdgD4jnVZjPhb1pLxYB8Rsvs9syvmlE
         oSrcvi0pjTpJRxgnkU41NuezgSFE2O1w+8eq0zR6DufriaGDSB35c+6oNdPI/k5xOANc
         1/srcwgKdp8f0rms1+x70MC7h+ey/W9S8KY6EsccSqwlRvDmDg5wNSCQ9FrLVftC7TWB
         ZTYJm+8fctzqcNnAltg/2EUTjVjhZnJfSjXtR3TjAJvWg7GFbI3BR+dr5ZxGPp2g3JLX
         6S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=Ril7n8yXuqn0hhC43yYs2Xpku+4eTqsFkngWlJWJymk=;
        b=SKjilm9esacEmv94jFOKqs6lj3pvj+Z8Gh8tvmqWOz5sRVJJbpsR/ycXzVMbHRiY60
         nZMzOY3R8WP4Sfnkf3x8l5pb6GE2d6q3KGwxnQQ3MPK88mqQJ9IYUo66FinN/XMIVvj4
         z7uwMfg4j0ToBbIdfIy5KAqF+97avXGidYSjVQZQGH041tTW0p5cpnX753CuuUiCfYi4
         h1R7/RyfUdkmpiRfD9MSPXMLZ5H8NHunKmFDlOGHe6FSewjXw3EGzElYtDkaPyM8hWCC
         LO0HKVznpKNr0uWC/NuhpZUnRlby7m5kPfTQCfIWI4xdS2LyMzQHEjmMGJQmxgBvHPor
         nK0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=vh6EJ2pJ3jbYFk+U+AOYSgSrs9xA/E5muD3A7usbulnHtE11hU4A5DN2JicGFggcs6
         7o21zEBWXKURe62D0P325eiq864dFnLSB96OfgA14IOZ4zE+jBGgRMhZxKqHoHzGY3td
         vuLTvoXmTvHcuajhLNMw7xbqi5tt8masjZL/Se7B7ywU7Ukp8xPqh4u2EpxV7EFojKd1
         GPpWDVQxrl1UpCi85N7QJpOyT61pRSGT/voCrOrqa5nntq83vanpUOr1ztqj/ecTibdh
         vCjJ/rnZCUKN0byWtATKkGTO/F9NjKNg5dJJjM4SmlIPgoiwEieWFzgSIfycwTnWzip4
         +Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=WhNviFSCg3OCXA+sMZJbEZcYPmU0tc7GUyeqR2KJ0mUJcM772FcD+ZA06SU0gFLlCf
         hor9yCWP7vxgqJsub9DrpWGwg8HW0UHRyn+1t1MWdRt6JLWg+10BKFYMMfhLgMENlWAz
         8RKMzwzoHelWziKnYaCtUXGukRXtExUU1lxwL9E4vSx4oZzogLkLF86bCC0qVvEiVSjT
         me8LcNZciN2ifG2pXxGMqsYBkHGj99+r0MxbvfxFwvfu2QTZEQLEOf5EBowC6e4CZaMH
         MNdPJvz24/A3vMZrg9sLs/nTgdNrBUkclwI/TqjX7BtLf5XhEpASlF7SzdGuwuQfibCy
         5tMA==
X-Forwarded-Encrypted: i=1; AKwUvByrRTvPuDYvcYBUSEN040mbo4A0UB2eN5pa9EfwQyLYxuqMHLDeVfzZuTQyfYCBTqL3O5xi@lists.linux.dev
X-Gm-Message-State: AFuF++k2gIXBUJece4rUAd0Z/pi+ltsEjbLyBQuA9Df5gc2GhLU6PJfI
	K8MaGFMeBNnSlBFHfUiCAJt3Us12hnTWp3+PUl/Nr4XvrZXDx97Xt9OzN1pPt/TZWUjqlhtAAx3
	e4bKsdfxtRueKqf7uTkGqNZkp4ltH3CV+wOBXSZtR
X-Gm-Gg: AYBFou1Jhpo9owUF4yxKvu9RsFkdq3BGVedZUGhiBq9Urv5MXK+JO6Py8tnPTLGFkTH
	CGQm5FiY/6uSx/6nxLETJEcEbyCIvI7A736rEezfUieScA37OZekF2HNiJTF0tgFUwQh41MEb79
	ZUvBHllz9eX7SdgPHmsYW5z+fCUVZRt6vne/4zwY9NfV2E6NIH4d4txPLJulpn56cP5h/AhSRx8
	tGvEivk45NaRIMkSDZepzlNc2QvRaE+ILZ/pRmUSO2royfL/3FLNSPQRnzIkSvsxaMu4koKABbD
	AYd7Xqm4TLxmx6yzd5CXWXOF2Z8jCUFYNdlBqV/cHl94X8m1wvFvvusKI4/Nh1j2DEue/1m2RvB
	zkBfQvHXbP+7RidcGO3HpiAq7zmWwHXtXvqIf0kFTMFvRx9gC72S7mFiX
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:55=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
>
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.


> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.

Cool!  I have not reviewed this patch series, but am supportive of
solving the problem, since I do recall this being an issue;

i.e. it always annoyed me that despite have a 128 core machine, much
of the build is sequential!  Having all those cores and not saturating
them during a build was always something I noticed (usually have
system monitor always showing system load, always) but never had time
to look into.

It would be cool if your LLM could generate any visualizations of
what's going on during a build? Seeing what's serial vs parallelized
in perhaps useful. Particularly when you can compare the before vs
after.
--=20
Thanks,
~Nick Desaulniers

Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF23599A5D
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097248; cv=pass; b=cHRxWginWQBJFxsxOdCPItlzZhgwbJM1+dpfKH1ajOcjZ29GMpyc3126FlutyjU7AogLhdDOzoSljw9NrSPiP6GlL3SJ9nSFaNBTIFvs5t5EQlTrHH7vQZDQGy3268IRRq45rBEQLjeixX7RlhWFvQK3TWO6nvS0izJ4/vuK+jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097248; c=relaxed/simple;
	bh=L1vTqlNSlo5T5a/keujEElxWpHoRIlrc2YZnv8bHcdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtbWUc6/GPvFNv/PRGtFscUxIF80vpgQPcaO1og6M/Pq/oyH6k9sff50k0Ch028ZkxN1WvIJGFZlwmw4+Lsbf5KpqOapdnbZtwau/RT+yCjUa5O7Ji6QYO/J92LFFLrPApfb00mVt4fgVrRwtDC3UpkXx7u3A2EjWE8J6rP8k2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+8jywis; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+8jywis"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso42228805e9.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 13:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792097239; cv=none;
        d=google.com; s=arc-20260327;
        b=rvLyes/V++C9r41mUYEMf9g62EBELKBWsH57uQ5vjCOakCvn81ldgELXwojvhaK3D2
         ZJqO2ftrnVaGQyxbcOqGU0ZMMJe5jIkwmGwrlSnXE2UHrmJMeKvJOOO99OIoogFL4ctB
         +z6mad2T/LFeYoopO3utuIJyYF1gZYAomJeBXf0cEKtzbF2/Rs/F07dTUhw7TVh5oSTo
         8FRi/W96XY5WijVCGsmNTIX0xTP4f0pZ3bGjcBI3tMF4FiWY1/KelddEWxZZjKVls6RT
         mEO3Z/fr5jyFLSLPG1Pn0xUZ5u8E0kFTzSb6IhccrnrjPAckWKkl5JQKvtJyu2BDHlIC
         60Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        fh=qoECMmTzzPnHvcljmSDcA+HjSov4YOA59VTh8JI3ers=;
        b=RnO75nPpFqu8yPUUILMYnyvcxpbscT6+nE1Og0jEDkNcHYN1cDC/f2aQU0FXIz049T
         sxkyR2vI/RKm1gqMPOUHaB+pmfwsjZ+cL5Wj+3/YW25HGJ9toIFLkfusBwTuAXTYvVgO
         CcwN6YFFGLGTlPOouegNcVz82vyO6HQ3MmsUVhaXh/iYOgVpinxIytJMDc6ZhPMGeZFp
         d8Obtnpi9onMfpo90/wol//ENO59SgZI4FJeTeOzveIo86g72P7wJnZfS4DUzqzQDaS3
         JX1w5BYZwTIASWci2aUCwChIHjNW6XNsiydAMRoaJZmC2sILy98PEA4h3NO/P8IGnx6B
         ftvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792097239; x=1792702039; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        b=g+8jywisp5c9LgAnSz/i7Mr+L6PLTC/5rgRuYaxE4gXobj1mAaMi3aox9LLGokxIyA
         W6/fn8pr4vbS4WlZCz1btUVC2OlmYgN4qWhkobd2vXwwP87MDUphrWZpouveF5fVwDO1
         1zTi/tqLU/Uy5W91V0Qqdov6c1qqM09vvKwlPIPCa3wQyE1qWx1O079D7ykE+2CJEIjR
         8jYMtEIzybS4wtIOapbqIysfGW7HvQzMaSO9k6t5Lih5lwZwVoX4XaJjvx1WMydwmOz8
         U93S/CfXjEHMEDPNkN+Nt1CwRv7JVOIn53lxQVw0LLyASS5CBuFdEDyZJ+DHsWfHVe+I
         iXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792097239; x=1792702039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        b=x52kkpYamc+pPi7e6D1HnmBA70+U9qZHyztuYrnC2B8WJUXek+KFpmTcKAHtqfDHZk
         MBIwUj/UpvRClKu8ZJYShtpV0NAtZZ4XKRyiKNyRpDWsSj6+cqQlMWVBn8SG/mzvjYA9
         nK9Wdv6B11UvXbzX0rU1d8v7VC0+fSoyZQm3adBVWR4+dOONtJWlfacfN1l3FAnzmhzQ
         inGXOKe+dL1xYQcoSnvSezxTuGQm+67qOvhRI3lCaOOCEmXPRF4yjgDF/qk7NBMHC44F
         AE2fkGzxVnm62oD/lptkg4Pi8FRlxKsOJrEO+GLu5z4T8TmiMBaO0v2riks13204V/Cv
         jHHQ==
X-Forwarded-Encrypted: i=1; AKwUvByyzMkSlvBdKiBAkbHvSnin5m9mC2xDUakW9yOLfOEtQrQnkuDIET+2sAOncX0uvoqq4ts+@lists.linux.dev
X-Gm-Message-State: AFq9FYJViWJ86nHAAvQd69pXsgnOfj2aia3N1a2EkQwMo/0VOsUaAErX
	Cm5Rd8No0gFnZPftrdCi2aC7DZ3OhmhvppDMyrx7w8kQQUt0c87k4AlSS2yOmPA3yEpvJayoRiy
	IawriWR6gBoEn5jcJYzqDuqviMKdux6mEAP0cjs1i
X-Gm-Gg: AYBFou2z66ATC1clqC7OILbXY//SblyRXQjIZgaPN1i0sAStUk9AN65t+Ks3G0U9m1v
	tdAtf1x+x/1RncK9Ucpe9C8Aj8jV8Q5wqBgVB3GGxcT5b1+tg74dzkcuK9wlAU+bAqqHVIp4N9R
	v/fG+g3bT9akj8zBJWtQF3RDkwFlLhfsUDW6zGD5rQOdHp1hAwyeU5k7loggu+HLRbR0uUAUoIU
	7SrPO2lCy9f87BfEY0hONWeqdaqA+ByzfmT0kASlp8cm3Ahc6cOR2+FXFdTrjux4+/4qXvHGqoS
	9DSXQpHWWPwAu0kOYUej/4kliPvrtlYJBRRQQh1coeKvHZoAEqu1DOsA8sl7tssPteggnsJlhyH
	15xq8+s4Z+prc8aEgXsOw1OAfbEH3LMDbiB91ufV6h37hMDxA2DzvC9yirNyz7iM4T7m6ND36QY
	M1GCAh9SSaS2hAtPaLHTv79taISK29G5AXU1O+K3s92+q37uaRhcZw
X-Received: by 2002:a05:600c:1d20:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4a18e4f50ecmr425834315e9.34.1792097238491; Thu, 15 Oct 2026
 13:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
 <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com> <202610151304.AA5EC855@keescook>
In-Reply-To: <202610151304.AA5EC855@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Oct 2026 13:47:07 -0700
X-Gm-Features: AclHuK-rLxxhEDBL9-rcDMumk-sd1jsus0ssxmyF55pyppHSQxHMSWMGokd2Kic
Message-ID: <CAKwvOdkn-CniSBEb6ospWuLSGHmXkZwM0JuPcnNbW8biv7TC9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ian Rogers <irogers@google.com>, 
	Greg KH <greg@kroah.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:07=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Oct 15, 2026 at 09:47:34AM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> > >
> > > __must_init might be smaller?
> >
> > That sounds fine too. I like that it says that something *has* to be
> > done (like the original name did). Hmm... On the other hand, I guess
> > "must" could sound like one has to initialize the field "somehow",
> > i.e. writing:
> >
> >   struct S s =3D {};
> >
> > definitely initializes it, yet the compiler would warn. Would
> > "explicit" hint a bit more at the fact that one has to actually
> > "write" the field, even if it may have been initialized anyway?
> >
> > (Of course, if one knows that the attribute only applies to fields,
> > then it doesn't make much of a difference)
>
> Hmm, I just noticed Clang isn't diagnosing for file-scoped definitions.
> I've opened: https://github.com/llvm/llvm-project/issues/232483
>
> Do we want to wait on this attribute until Clang has full coverage for
> all initializer cases, or land the attribute so we can continue to add
> coverage for function-level coverage? I'm worried about a compiler bump
> (once the bug is fixed) suddenly exposing a bunch of missed
> initializers, but then again we also have no users yet...

This is a false negative, right? When it gets fixed in clang, the
existing uses in globals start getting checked.  Nothing that would
require compiler version checks, IMO.

>
> -Kees
>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers

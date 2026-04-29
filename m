Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F673FD122
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467151; cv=pass; b=uxXXNq+X2hy64WVMcGEuflJKfpGWGGZcpi7kgKJaKlaYffg0sgbreWJtZfEA0WzU/LpPjepImadtpcmgeTZgSSkDUT+Tmy2IRe6MkapTIZBUF/v6IPYbUq7QQyiLlPJwIto0dj89qpyxAOPyRZLZSFSGBGXceB2F6CveziwfWQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467151; c=relaxed/simple;
	bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXyoukEHTa9WCAgyj8AjA/GDD27iWvUx/GTPOJ9TS5wyAdqwGtvjcxAqF15fbOcxwM02FYAYBLQpK/G1/D+v6mNDP/+ZI2zssBB0AWA/TVgJN0EXf2ZQEnRQZInOZZjW3PZO4+zoDH1MEKhIUNOUkhPzRnpWzyRo7YPnpWA1LOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdP51JhA; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdP51JhA"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d96243c8a1so557643eec.3
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 05:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777467148; cv=none;
        d=google.com; s=arc-20240605;
        b=OtrOM1WtqtLXIaNFuZXTzQlWkKVZe8ZCBntZLmI1vzNLK9/i0Q8rIhpjBfLeIM5b7s
         AI48cKkVwYKUFQ3jKuG9jCYjAJZWPabdCvFEDOLYOig+BrBWjgdsX1oL9igjkE3/rHuK
         /ajJm6H+ZdX/ECcoARfFNRFBxghhOT12BCuNd73wMeYkq5zE+jkKkjl/T3bttHnnuZOp
         v8pxZTjdy10KwgTrp5gN4YhUOk8fSorQqFA18Sxq8ZfRH5Kzj/x9iwixm3f/6NPeZk5P
         VTMuw3c1uXQ5Uzb6V0wDWpIqc1awo/X8dG+TXpIAJ6Myg6red1n/6F9FyrtmmEYiZ/gw
         /c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        fh=WoOynqBefX5xYZAKHmiDaG86TM9B8Y+zCK708LXpyw4=;
        b=URDmaQ7HnwZbae4THkJvzywgF4Ze9OiP8gwa+Ups33y9hwI8hPur4lS9sVwImMtEE6
         NuhxHAGamybb1RTpC8n1vSVSJlywi6KUrscOFxI4X4QoEtAi6vJxlFfM2iBcaQiSJpkU
         kknH5oOO1qemXORMHrhrQZW0IV5RYjRnU1pt2SwAFcDiTqI7dwvWLJf43QkDYH+yeKEq
         BSrLHgDvNzOeKWQoW2JmujQZY4yLCjR6jZWmQPqVRzGiMkeGfHF4ibSjITBnYDO+qglK
         dWeRphrG/TCeZOanqr/w7dWpX/64F5FlBBqYXz6XjKDyDGvNDnRObTQCHKL5GchMAebI
         HFUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467148; x=1778071948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        b=AdP51JhAPSq6vRPWNmPIt3cH3PreEE+KWuwd0nkSwgkBHZvTf/vbnUTeHBi8FdGS99
         jRm4M+EXPp7vpQRrS3c+N4hIJiluqxbbyYIfJ48kcd3bqK+UD26AP/8NRJ3d5MeIitsh
         TSIAHfOmlZbPAnzh6gYesE/CSIEJ+T5yCHRLiIbJqaDEj9DSKdQ02F/0y1anJVPQVNhl
         D82FrACXKL7uPfwL1ttxq7EXydaxycMbDShPGd4tXi8RQ8L1Y4BvNW6PIA2NNpsz6heE
         ekYuferdW1X3CwyRPUads4kviUAcfGMsk5xDnP1QadDRhhXJcKy5efIU/UG2e946Ak0o
         Fdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467148; x=1778071948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        b=dmDge2lJueXThF98wMz0jSRO5CDfNCHCEzFvTBNsMEV+DT/9qL/389hzk4BGwE8U/P
         79vEiiUP077SQFnjGBEAj5uhaKN48XbCR410SvsjbtRzDlHyZseWut35WtGcIHoQlbQS
         6Ro/o+b6yUgu4iCEWIA2iRl6eCSG6bad3MQDB2LywzvRw+3ONAsgmUykHNvwS75Nfgu1
         dsvTaxkHBbbxo2YOSpkhk2JC5g8t9el8Hkt1gVG6BrtqHsDnwVx1yWvju6d0jWDBObGi
         vvwElAR9vyy+H5HPeX5gEAdbe7bfJ4cX09APtyp53CrSKufwAT/+ANEMFiqF4zbhblNB
         z9kg==
X-Forwarded-Encrypted: i=1; AFNElJ9899uCERBjVUuXMJscatyn2IopEVv62cbhBpFe2cntU9iG0VZsFHfKc3Hz8O9kL5zMz4gX@lists.linux.dev
X-Gm-Message-State: AOJu0YxkLkXWtJybB9s1h6uxlBO/gcD5/t5ngAGlWEnAwphRR07+EYEl
	Z6Cm2SlHvKVBWr7UX514qUSsg+NUCqRHYR25GeMUctnJOAcnx+UAxVOsSFEMoSE1CXKOVP1NEEr
	KHuEntNPinh6qb2lss7D2FRgA7SWfUtM=
X-Gm-Gg: AeBDietpu+JDWXYy0+Y05LfF0w+gGMEo+7HX7uSrijxcebmnNZrQdUgbJxnSIebDAd3
	CRleJ5Wlm4xoBW4QDBd55AGdskicYb+NZx4tIQQVvVeppzqaI/QHG97kOyfgzX585ELDI6FQrtp
	0EtgsKEO+WXgTJ08ljhkE2zXRCPL+JcjQwT0In1GumCbIzHS8TW2lpMY3C0jOvVMDT04vIlM3ex
	WPP68e28Pt0AQlGf4BysmhrK7+pHJohxBD1imC0JNFFGdpe5Tm/EaqC50JptfpeU6KsmXPcabzS
	960vQYSMUS2Bc8dtdv0Gd5RwXwJLHlFA2T1C7jJuI4kYYGmkb5yzAjz+RDSd+y81RBjDo7slupk
	nWpgwGGRDzqzun8RtYBzKpJnKEZx5A6f17g==
X-Received: by 2002:a05:7300:a148:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2ed09b6b8a5mr1583361eec.4.1777467148218; Wed, 29 Apr 2026
 05:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426105932.2270364-1-mkchauras@gmail.com> <20260426105932.2270364-8-mkchauras@gmail.com>
 <afGT_RB1-PZVKzE3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <afGT_RB1-PZVKzE3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 14:52:14 +0200
X-Gm-Features: AVHnY4KoUZeS1E-bxbPJDpxvSamSjAegTpsH1f0vqRtt_t4Wuwp8ZSXNfFVNGW8
Message-ID: <CANiq72ncgvqJ_TExZP9ebe6vGroYReGzqn8NuhBCPpNWmnnMVA@mail.gmail.com>
Subject: Re: [PATCH V15 7/7] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, 
	viresh.kumar@linaro.org, prafulrai522@gmail.com, gregkh@linuxfoundation.org, 
	arnd@arndb.de, tamird@kernel.org, mark.rutland@arm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 7:17=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Upstream issue for powerpc64 and powerpc64le target.
> Link: https://github.com/rust-lang/compiler-team/issues/987
> Link: https://github.com/rust-lang/compiler-team/issues/988

Great, thanks -- linked from the PowerPC issue:
https://github.com/Rust-for-Linux/linux/issues/105.

Cheers,
Miguel

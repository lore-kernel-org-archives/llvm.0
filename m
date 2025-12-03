Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C669D2D3A69
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804328; cv=none; b=qs4XCh58KRvtwpaKsFrGSTNyrM8X/iJLhUR4Uj/S/JvT43e4AfMHzUqdkZky3bXbsN8v7nxPWfQgrIEXo1awEy7VC5YK6nD+zcKn/6Uj+nwCQrcjXVVEHOndvjGzbKJolFJ3PKgbFvxq8rvXA2LPiiHnZ18sFphDYWTLGuYSols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804328; c=relaxed/simple;
	bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDPKYTTQyRpDuM9vmhbfL2gTql62i1CgAcpNk8+81CQ/kT3xFjEFuLpEPm43vmvFlJv7n/tuSdJxZ8Xv3LSDoWtWNWR5zubvA7CrAGs2fEuY88c8Qw2zVVOZqVhl18G4+C+boiSQziZcRRexszS6kE8Soz++jqQyC0xKZoyjGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxk4qoDS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxk4qoDS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so4098a12.0
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 15:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764804325; x=1765409125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=lxk4qoDSnIHCruePdxXZosLuqutaHRzPje3Yi7qNDj2gaeVoRyGVaVGIv7hMyOn5qy
         FRzvOqn5CRN6Ba1HCZGKJxII4gZimpFlN324HomKNxIikuIPID3thgDX9KGpqoW9LhB9
         x6haOOWOQwKE2CDOZL0ozbdw60/VcJnTyvmTWshmJ+vXHr+F5gLBU/JrF0et8UgXBTLo
         Ws+CNhr5OXMbRmjQY2pwXuJ6KVhOfwRz04fZtjCfTWoE4kXCeBXNgtU7+gd2UAQB6X+I
         lOCm5OBqEg/zmlPIit4kxMQuuiSXdoN8P1/fxFGen7To/7HonT0r8b9YexDDUFC4T8w2
         YmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764804325; x=1765409125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=LCl6XYGjC/+W+Fz148NGv3+yz+R4SP63+56ihE9w0Bskvv5qyy9WQBmhEIdf5dTIjX
         tV706UU7T3MpHR1C+0SUpfllve/zlW9bbJvW2OqHyXLwiHOf0QH1ISWtsn6Ex1aD4OG9
         7TevDmD6r2Vmp8hblcXFwa7aa2xkenR1//KK8mhVsVHZPIs0xzt/tXdV793a9W1BbBDW
         u7riS1yRmXsAPaxcMhV2XWigh4iiLkPrjeIJrEGIV3qcaVLDInNQ66ZeX+gXPVbuO8VB
         V9UCkRGrwJgrfB/OftfndfaeZoObDN3aRWYxm7J8n/0YUwgJZHnDv6RGjsWP9ecezq7i
         Aeog==
X-Forwarded-Encrypted: i=1; AJvYcCWf4bby2mNIybYUZC1UmG9FXEASUwsOANYdIGLb1eYw0gHEblfiaF+eJZR/GKUZtqj0yaDs@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo7neZPHYtuKnW9ZS6Xa8F8rhx1xc6yIzMOE+u2vVpbACYH/dA
	CvxGv4e6K2P6ftK9qaid2z/CjB4VUXfXpPBDh4SgDDXNZLsy+qRD5IwogG3fIBoXQwFFHMz2a+q
	G1CW+rfvpYjzB+UerxwCgjHcHWxKTxUU9ZQpyvQpM
X-Gm-Gg: ASbGncuAykd770gpHETMeqfa+n3yDOFm0eeJw6zrdQ9cDgwgH/9fKicbc1vWJKYA1g4
	n7m7TFfOCI7EeYBBcD2mFLoJgRgO6UiXFx6CfweEmdFwykudGwSXo4t0vJyxCzrraHLP8ZM6R+N
	41EX4Gz8kgCmY9k75Ek9MXNetmyGeV/PlJgZuzfhOpRvF2Aj7FdM0O2GJbPh5yLarb8pOVzctlJ
	XqMk9mcKC2fRPk2xRHbNvEi2rhCrspqFTrsqRNp+H852IwQw9k4hPIVhG90XnsVx2KSwV5zSLw/
	sA6K5AK8EZ8gGTRZLXeFWbrC
X-Google-Smtp-Source: AGHT+IEXEQTgoa3Tuakna4skmZg2pw/mrECwMwVvdW0fQYVmXvi58ZGexwzvZpC2XAuu5b911WZjF7TrDbbogWoEqU4=
X-Received: by 2002:aa7:cf02:0:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-647a7728a14mr14606a12.6.1764804325007; Wed, 03 Dec 2025
 15:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251203212558.GB3060476@ax162>
In-Reply-To: <20251203212558.GB3060476@ax162>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 3 Dec 2025 15:25:13 -0800
X-Gm-Features: AWmQ_bmE-9G2UW0Equri3aRgg0NngGho89_DAwKEs6T1gQOz1p2ws5lgLkHiDf4
Message-ID: <CAGSQo00bG7QF+u2WJQwMTiq6iGATcSfaAurkkppykkn+yTL-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

The main situations where someone would want this off are:
* Not using `clang` (should already be covered in config logic)
* Out of tree module build without the whole kernel build tree (the
`.bc` file produced here would need to be shipped to your out-of-tree
module build environment - it essentially becomes like a header file
for purposes of building an out-of-tree / DKMS Rust module)
* Don't have matching `rustc` and `clang` LLVM (kind of covered in
config logic - if anyone is using a non-release version of LLVM, the
config may indicate them as compatible incorrectly).
* Requires out-of-tree / DKMS Rust modules to build with the same LLVM
revision as the kernel was built with - may be a packaging concern

While the usual inlining tradeoffs apply, all of these functions have
been explicitly marked `static inline`, which indicates those
tradeoffs have already been thought through.

I think that if we had a reliable signal of "`clang` and `rustc` use
compatible bitcode", turning this on by default would be reasonable.
As-is, we have a mostly-reliable signal, so defaulting it to off seems
reasonable so that people don't get surprise miscompilations if they
use a `clang` or `rustc` which are not using precisely a
release-boundary LLVM version. People who know their toolchain story
for x-lang is squared away can turn it on.

>
> Cheers,
> Nathan

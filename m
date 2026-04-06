Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A1358D00
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502110; cv=pass; b=Ufiu6uvXG+KEZBUWZBXiLk3S4a6GmnGhd5fKRTsmIRVdTXNIfMhj6TPZvP5d5LMJPJRvJ4NpfF4HxETEFZy4AgnqpnolU2OKF2DwbT6HCjDEW+NCLNpXF70mB4KSXgtVGJ8VZqw3y2/eHWynAOh00DlktM04zND/OWPNRDeqozk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502110; c=relaxed/simple;
	bh=WRVPBP1r3UEupcj81ppPFlfizIU+h6eu8Pvb+T1BfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsRG9egQvZ1SbIoIj8RUL1WB0yvy51LKnVf8YtIm/2wbdiUkynNlqiB2DA76b9hTe3NRhXm5eHrOyaJLDM+ysx9pdSXtHycAq4ob2ZffHO7Irj9qospbnDo4E28Or8S/NaI6ggKS5wvYakHZO7guQT21laDvenucHnpqPJI2mMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNyaNvsU; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNyaNvsU"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cc43ca447aso146054eec.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=c22lbTbSlazeRG6DEbPcEW6E8JYkY8j0VCazKnLHAcTyLnIeLgS7owvFPE/unBtzDh
         +fyeQBbg2fKCKpsDKiwuERy1MlA+3k5VB8x0VyDV2bkAGrhLD//Yggb8Nym/iC0YSfef
         tk1Jd4gerGtvHIXq+A1yDTduGQirDBLc+DF9+TxoJ/DWTXdwic+solO3RMYniZPtg8y1
         H24+emRQ1Vn2Zl2ul7BqNHaq0eQ1xpm5YQdBiONIFekZDbO1SahNp+maQeYUr7lfrCwx
         oY+IQU/HIWIjwcKfOq+05lzmZ+eKUinpDdqPWJZPSmf3ahGk+nTrJA7MYmFIYWdvj1GI
         F1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=gtmFg4H5gWp2LxG4QvFNrtIvBdhqrdOn+whNsThXzeM=;
        b=VFoMqI4XofAl12ANkmHv1N1FqDlRMjSse5Xp4RLnnEZWf0m4utz2zUFKDXJF2QehqW
         ybQjWGjeCp9uQQr9DTNxYny7mTQM7oMYMAwNgsncYgKxR7MHxi91VYMV0nlZozbT8aad
         EebNcQB1a8LXlQRRoB1WHLSWE02oCq1yfa7ZL8G3931nrGlToCLy+/Y6S/1SiHYVm2hP
         27XBo20E2VT1xLMWQkYq+fZf3UkeT554h+y5bxOL1FidNhj7a3R51Xh5MK1TyBndTuaO
         cemHqN39y+L8LEtnZ0CUuB5yKeJzQasmKj4PQmgNzn2KzWEEITwbQvq4p7Zgco7hQOj4
         6iRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=JNyaNvsU08uAPJppykpvI3IH16A5jUO69tnxrEuY1HCKaL7rl+FOD26tzor0cq3FjJ
         cHwrRY3/qHTrgahs422K5WSyEv6cfwarQTDc9IY8MbY0ny0dTXmlQcWPiVbfa/i+EChs
         OjCdpcmE55YN1HKttABgds8QtE1QJhyH3DqsR3lQy/6yIydBbrZHwKDCNGwleh+HJZmA
         fb6oBoChNwtFR6bLubWWn+COQDc8RCdwrIJy6j0CStxJvoF3TzPJHens6CfzuTsq8vFc
         vUImVWPrcfFF4YBCR2UTVJeK/nZFpOUx7tOhHwjWpE7WtyjCNWSMCiAs43jbT5thq++I
         wtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=NlRFgselpp/yt57jhgn1F4P5mZYC//WODGe4lwecKBj8u2tM/DJ2Osjfz64YEekMiR
         n6o2G/uHYxcwdW78acx+ydOqtBoHHOdn0JbotLaZEKGr/BicBbnHpYcGxO6MmFuvjtfh
         YexjNko+bIWKKPF/S9W4BNkKfE/dOFTpQdk7k0EMw2Zb/oLxxKoLB4iXRN+NOpIQ3h3n
         gflbVLqchY5XBC6yi7ZYCfAU+8Xe9F5OQfVd1wSOLOvMLRnLylc5pRBKSAl/zsQk0vcY
         RwQcHTedARy048lemTFaJlVIxQdPA3LFyZWrVeObFEOQkjulqmAh5BABEi4IEBzeofKx
         Zffw==
X-Forwarded-Encrypted: i=1; AJvYcCVkdO5jag1gTnbDmRnmXEdft1akdNbwjFKQO8hUdN6SPqIqgdiA7oaKUoOd2iitximFw8Db@lists.linux.dev
X-Gm-Message-State: AOJu0YwScQkhx6UyyDQ8wo7nfdyNzjHX4VgDgGkc9s5E7mL2VVtTd9M+
	fOikIs5w8SsDQN734UttTjc/aHZC1VyJQQQNlpIiYgpOwgDevD2D1gZnHXvNVKl+AE7MiOLMVEO
	n0LvvysqBp0vdtHgZg/difKnk+2EIoe4=
X-Gm-Gg: AeBDiesj/GSZIdoDkg+xzHVKxqccSny5H4Tbk6i4ZA05qjJxVCHWp/JUurWAri6EXBP
	yO6SpZGKg223LpBqauqk9ISz/YTng0BNoRMTWJ/F92eA8tzgVFamSp1qL6bc398bmNTmG566aI5
	qrO/V/g2Kgo/6gZ/Ix2R6wP2EuOZGtbLu9gk2BahTgcQuUMKDOeKnIGiO7Y6Ig5+tLXm9557Clq
	ijXMEDb11Ap03nI2vgmJvUOpliASqbA7vGpQNH9lB6ngWnt+1X06oBGA18no+IWlQ0nw5jkeoTl
	pIg4sLiOCAgLBYHqOWbSq47pNBvvjGAuCjc+949wUzhIt8fy8v9TTVaHs60N+zQHNmdNwI0h3nL
	sPPKdHlVZtKMbPlYRE35RTdM=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel

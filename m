Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA4477E53
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065000; cv=pass; b=C8oGsVVgTBPdC1Ms7945EdtFwMGbmXWkZ1RrMh9EQWaH4VgXI6tkhuxoRd++XmsDglgP46D0fTewvJGxOS1EWfGOAgl/V/lw5wOfd4A5/zHo9GaXOAGK+rOK2lSZEC/1jbEt77mZhtCZ1zjWopBW8Dz1Rs56CG6WQ1FJc7ztvJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065000; c=relaxed/simple;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWZC0YERdfOJ13u4gPXlFLbijEK7ujvnCzxGV4/aJRrRLUqUeagUYVeDzdcq93mAUmc/pAvcqX7Bv1PPdvCTfbiWr4deHc01m7XrBgIcTRh+rWNprkYjvUzhwCI/hdFkhrN4lUdB6MyrtUWx42KZMiKBPWZg2C3BN5dluTRtdeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO/Ic9Dt; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO/Ic9Dt"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a7216c9cso5567c88.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=CQjKC/qltO6UIvh30cCCL74eUPx8n1tFQfmq+27M+w5UGggFFpC5MJFgad2ThqVT2s
         ElgTD0G5H/NNWbcjAEYtzlItxmuPBsiRiehGyPavz1da8CWKlMAgM6Hok52Hsu0DOUmI
         bXgncbjDlpwMyz5mtPHYNr4+BnfJwhsGU3JW/3yj5q2i6SkQkllUGAQ9lcTJqhYet2u6
         a2U9sev3yFY3CzCxcWbL8CEKchE9KlxouO8QUH6kVlYgCNbxRyBPcsV7l4WuKjRwR4OM
         LAvrGWvh6XEoUlrS4hyw56+nErIZr4JfhlT5f8galIVis2h70jOcorzn/AvUCuEtsnBl
         0csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=NFLoiMYP0ZC++Q7wBLVirdfb/3k3wmJUOTdEHeQ96jg=;
        b=OBT7lljwe2pwTHKdGnghoj4j9P2lH2P/7r57ViWd18RGDIlIVU+8K800o7NbZPRCWx
         DnuSwMJ9IGWYfyCGp1K3Oc14ruYarC0VJetGweEq8MZ64pvH6URpzO6OF5/mBenjRSS+
         mNXSnzOqYa2Q/62jgK6llxQkk2eeoBV6BuFKXJJTrUpfip/xXMkyLrnIPCcnkDCN0A7Y
         W6jiW7sBEN0klvf9ZEBZwG1wyqDp9bxW+gwlwz5iz9AhF25NsJ5rBnW/JFnwVYY3GOCp
         +WX+Z2s8eGzOhE6/nisdF/0epzN9/Jfz95ctlZ8ZRJNKwQ3SXQdFMnmTgQh2KElh0yJK
         tr+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=RO/Ic9DtQ5ICAEhGMCoERl8F7tQF/Lg98rvvDKAA429Y0xk9F8y+4OEpCL+6OJQyL5
         KM1E+oM8WynwUcXYxBrvxSgPlyKGH2vkqtl5VK0f4+xI46hgGyhLxUj/6yuIuXjCJglm
         ew4qPskoInLWSFK+AlvoTlkP9FCzpmf2PjGZGnMSFmNxMbXrTX+LKIYC1gXPMgfPsDmy
         VNhHQEWH+iJ8KG9jhNNqstx/sDrB+NcGuQPnGwQiuBipHLF7TV6TV75v/G8T/nZ/Rekm
         imEZ/xXWq4GmDqBnVTA3NdAODL+BEw2iA5yJBeh0qSJS/63kyrR2/pv9cKzIRDTCok02
         rqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=I7qbPYenhL50ubSnif5VDoirYzonov1i3tC5izYVM3RSzk2tTZPkxaz4kx0mQI8YRg
         PeoO4kHFNaKfVWy9pAL0cu+5h2kK+wECsmn5OiH89yr27xLhKdc60Kn2Xfq760kKsFFh
         IZEhH3rV6zbSduUkMDuVwIz3/KGtfh5g+CR5I8+RQhYn3ilTmE4qpUgDvMzvgrpER5t2
         KluCfaNm68j1vqRyFSBTDBxWJkV0FArgjboqLVRvw+2RtSvCZS1npX1+LT7Yv2OwIy2x
         wWIz314ZcLw/Ci0eCmZvgoFufPghwEr89A5C3eiOTPoGby9gN8WEyP+sbR/MYFESaqLz
         PQAA==
X-Forwarded-Encrypted: i=1; AJvYcCUewPGbfQQTmnkwQmWZRiGdFPq3utgEicrWwcDmIC7ksxSBAPlEEWi3UNMnW+q8ZpfMQ5bI@lists.linux.dev
X-Gm-Message-State: AOJu0YwmAPAfxO8ecB1PcPw4DjpHKisBmKi0f7sNWwA9ZzAH95H/H0QY
	CTjjaFYYyNMKcKY+pgTlM7Hi1XtAGiJ8SlZWX6u/ZFJUl89dWIx8w/VW3G1tsuZlV2NGhlaN3jJ
	y+JJnxeTmlcSSUOvoSCNc5Bh6Ck0dyAE=
X-Gm-Gg: ATEYQzxsw1FOR0B27EcDCpLDTihXqx+cSRumlVGFJs+3kZbCOl6oU1Rgzpny0uO0YoZ
	CG0KWPc7VKdiH/M/Bib5wHrSz844ZlvsE0snrfPlj3kS3gsR+iOhpRA9kqICc8nGwDE1M5ZJetn
	XhJPkDrAYhmYiK/2Xc0bqTf0MkfPTlQlnoUewl5e2ZH5U/iT4P9AgFsev6LBxgHUN9an2itbEye
	RbFaTutwTGRrAKLJJsafi0QQXbiv6KhFqcQ/F7mep69lDt4eW2HTN/rYu7svmiFl+w9UpIgVVin
	2FRfhFsDV5Io9UlfUtg/Ulf+Dz4xSREhqg0t2LZX3tGBo9OLbSj4yVJRkSAiuCH5xHySXpsK3/L
	NiJnFQ63bkaPJx6rZ8x1DnYk=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
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

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel

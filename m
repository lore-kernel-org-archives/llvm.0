Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DB30F545
	for <llvm@lists.linux.dev>; Wed,  7 Jan 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787203; cv=none; b=Jm9ksOsEYi9kdgt/b+7Ilp5VJLZ+hDoxNStpveCh+rremfmX0kaUO48e3Gn3uMz422LViZHKkZHNoxbFzdYZ6vVowTxw/bTlGNKuyT+iW8vf7MYSdt1xkGjRfZElwh0RQ8AwqE6YIAQrDpZVeDujL+nht3vdpfSUazP78VZG/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787203; c=relaxed/simple;
	bh=TfMWykcf+8UXGfHGmT9UsPj0B1MObIutniI9d+Q2eso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txe39kkSbAalyi7As0dzETgsV2ATwIKLvRfmK8LCFUbV25880svZwiMGaZpnJfyzpEck4e8Ao2TdTtC1vXe5N4tyVn3++N4A2E0NAyzv4qPzyfQzq7rHEqOOcByCJolaVlHS8QZhpgkjOxXfm9pKAxVfqYtqvTrqDIeh9eS9sP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yj9kdNe2; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yj9kdNe2"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12055b489e0so140987c88.3
        for <llvm@lists.linux.dev>; Wed, 07 Jan 2026 04:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767787201; x=1768392001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvnLNPW39tzQQ3hSPGDk4srbtyERtKsm0TVoURbB78I=;
        b=Yj9kdNe25NZrRV/bZoHSjQJoc3eFoQidoxhAD+OPzwrGPyGmH7eUKm5gHcmhjBwCFY
         WgisE7//ogKMySewI8DjzzpP1UQDeh8+vvTPy0pBRQxooAsoOLLD1JFFMMyVbeGONVsd
         yij4eLk1hlYtuCbiok/dNRMglglRjkPtyJjfbs1aWFP8ussxuGRoPedTHSJKgDEUypYu
         5EJ34F5Um9KDrfHvx9ASHpjUwmZJsU2wwNTLDJgctIgyZV9X2vkpKEFiOCUGC0luqqk5
         xwZK2ZXwSpVliUEPjAtUwm8n+PmEQU3dalELuycjOJ6JSbkgl/MUWtoFRygErAxaHM07
         jO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787201; x=1768392001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvnLNPW39tzQQ3hSPGDk4srbtyERtKsm0TVoURbB78I=;
        b=iPeTXEzXZh8X9w5RzFdqjyCMCGpIIk29SBXdJWYY74yQMyxJuzZIr/1pu/tcnY/6ZY
         9hM0C9mWkVppQntqxpwYEcAmB8ntSQcVLrJbr7cTGJRryczN/rDtcy8ExjOpBzUvwOnX
         Aja458p3foSlE2qPQtbDpbhKamgZy7TKdhZASXCFVtNtRq1JaoDBALsWazkD89T7HZTN
         wNlTrBmk9DF1oIlIbg5HxLM6KE3G87Ndrg9h6Ymzyw6vjXEW40znvM6RPHGMGQd0oTxJ
         i0GKMF/mli6oEk28m8lh12jkcP1eKfRE99r/jVBsacbWIt+yfLPzVvZLGgR4kb2nkLJL
         O6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC5f0sqWnxEJeZe6zBdMUA95VY2YwUYT+WvrS7NJhDqjstiqWs028PbS/p7sC2lspKz6LZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzpzOYHHwV8czBb+DLkN0kZf7LbWIoqhglusqBQsSkwVWn0Z5Dl
	aRJx89MiCd8TbZm0RQ2D0qW8FOKXk5ofDuzRkFjT0g6O8Xk1pD0Fuy9QZM07naxloZCc9aFqOGf
	+NyhSWghJk9APzr34P/SUGUIT2seKGFI=
X-Gm-Gg: AY/fxX79V0FwRH145qstDfSQ6F3qC160yKmHmL9hXwtyUSE+/6bVv4m1BMcjq+3RMzC
	2IzOWp+9HeRQfa+j29c0Fq2U1BRCWdefBkNxbGwKcv+EzM2OBZTj8qEYUM8+BODxCSNMQJyxBIV
	ljVo7MhcGVkpFj0Ua4/9NXVHZzfKXYTFx0TMBAahp9rCmjI2oDxjfPeMTPgJNHouEuGCa0kO5H8
	M0sxQtbuYp+gc1Sij/aXTxq66zDKzPbk7P8V9mfhg9wzyMtKNGKN91unmtcd1ovTfAKTJJk+XWI
	lhSNMnpHCdhLQJ3fjVcjq8Egzzz8ro1nbSqkPBRDzGiEOfFF/fSzgCX+xM74mWhB4M05IALWAv/
	PMGD3UOz3uwSS
X-Google-Smtp-Source: AGHT+IHl2VXT8tuqTG18KAX87XjyJCanrQuK31sAG/wWGLYWMCAEZ3iuh0hHmV4OVYAR5S0P8i88XR+h9IHEV+IH9n8=
X-Received: by 2002:a05:7301:4288:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b17d0d4b88mr704118eec.0.1767787200933; Wed, 07 Jan 2026
 04:00:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105150106.567830-1-gary@kernel.org> <aVvdt90YmhJz3i5i@x1> <aV4TkNE_hAyByISq@google.com>
In-Reply-To: <aV4TkNE_hAyByISq@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 12:59:48 +0100
X-Gm-Features: AQt7F2qCZtVjBpQW4g-uNITeBCmbGHFYwnjYgECDW25Z8q9F1kvT6B953AVTAIo
Message-ID: <CANiq72kUVvMznfFtcjks=0iJ7HE2uvCSyD-Xu5NV=_9ZykVXhg@mail.gmail.com>
Subject: Re: [PATCH v2] perf symbol: remove Rust symbol workarounds
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 9:04=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> I'm afraid there may be some outdated kernels which don't have the fix
> yet.  Maybe make sense to wait some more time for them to disappear?

Hmm... Do you mean that someone would use a new perf with an old
kernel? Is that supported etc.?

In any case, the fix is getting backported all the way to 6.1.y, i.e.
all the supported LTSs:

    761e965d2c61 ("kallsyms: Fix wrong "big" kernel symbol type read
from procfs")
    d5fe0c115bbc ("kallsyms: Fix wrong "big" kernel symbol type read
from procfs")
    d46ef2bf91ef ("kallsyms: Fix wrong "big" kernel symbol type read
from procfs")

And the one in this thread could in principle be backported too to
6.18.y now that the fix is there, no?

Thanks!

Cheers,
Miguel

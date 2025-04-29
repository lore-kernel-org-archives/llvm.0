Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A125334E
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957129; cv=none; b=SIiKofGMe9jHiTtpI9jk/Ql3nfyj/IqoC+hdCBhEhka3CGYqhtaMiwpmH/EAK0NP7Mnmw5+wZNIfd620HQBO5CCHQEKEwCRuPr/D0QzZFDz5EPbZlYc/feLqTu6OOG1sdMGinP2SnekCDt7P04vmJAwEht9fqgnrhRpfzvNmEfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957129; c=relaxed/simple;
	bh=EPaDz9srlvFWoL0LgrmxpJ5HNRLE1J4tFa1bEpEb/Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlThINGr9bq+GelIYaCHjy34/8oCvM5HDp2S78QHIUtAZt71o1t5Vq8saN0tdH797N2PxiF4RJ84dCJJtYTZYyYl7cMK20aXAQ5ATdLosC5KU7/JhUw/rUATG44nGrWq7BS0BOs6CrMaM41a5KfhB9GqT298DCwa66K+ZIW3JQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHGfWuI9; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHGfWuI9"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b078bb16607so702719a12.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745957127; x=1746561927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPaDz9srlvFWoL0LgrmxpJ5HNRLE1J4tFa1bEpEb/Wc=;
        b=aHGfWuI9HeXz1Tukds+YcjRoWDYCfvCpss7vliTO4J8BKXCdvi5x8YBgxr/gXclqEJ
         r9J0D20YaUVz9o1g9P3NUZpPmT6nKpJGEc9luaIAuCFOcCariOlhVTCQ9Tneer8VMK1l
         O1L4uQI3naq9OKp70Ley+1XBDloTRXufKd3FrozNRRe5MH0uFB9NfoRPFkAeURJ4Sl5s
         lwqv72mlNj6SBYk6uoOxbF+5i3ifjdEF85nS39VmX10gKNWAf4r2mPMMDedewOaHe2BH
         yHoO+bsCNoZKNEVNSRRPwUvnoib84HjuGfygz/ZO5TlL286D7g7iRVky1j6o4LqtP1MG
         tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957127; x=1746561927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPaDz9srlvFWoL0LgrmxpJ5HNRLE1J4tFa1bEpEb/Wc=;
        b=BB9OPsGwQOX5ip47Yv0VDIQmiDan9lc1vf2MNHYIgIJjta/Bnls71pNUOBbjNgEu/n
         o0k68XGEAKTPLy4GrO0dnAqqwBus8QgrvdCiIUzYBGy7EMFxYuB2Tyz0UPOGq99QkIhC
         H0ML2bArtxdwXHkHf9PAXy78k8eh3tLFrLaa+EVmqBCiZpfygMJqRfrfMzn23CR12J5w
         AqrbRnzoDtAcHVJy++EK1Pm0psyKuHchT183tKX9PwObgo1SGzMB2GElNc8S7OAGL2Z3
         hda6lmzXhHTUR2mrSeki8qFnEgSTg9z6GcxLRDQ4wCgLvpS3D5ee5B3m22ZvK4TZAwtm
         J2vg==
X-Forwarded-Encrypted: i=1; AJvYcCW3cYosYdSZw97OBReMEQu2jgsB3UmmbPVBSrc65HmirCN6LsbxJoaadePTBX4T3ZCuMlaq@lists.linux.dev
X-Gm-Message-State: AOJu0YxP0JfOGezjC/Rtv/wKO35+jQch2pvOaeneR36vzm9NiDFTV8PT
	0xDRb4ziSBX03ysMRxZ+a/HbE44Atppa1jQh/DJkNQ3dDtcuWppdDnR/pE/niHoQmxR34o5Cy7k
	lKcMT+fnkVJkk0kLkW/YaOfM4hcI=
X-Gm-Gg: ASbGncsOmZQDpBf23234zRF3bttQzRghSUiaTARFDKb1UYswdJj16T+06SWVKuLQPhY
	4PcgYQCoX+0qgGtzcLQeoLbcYsVM3JlmZj5wfExcVr5ArRa3DxXvhixrAYPZwJ8aQ0v2nL35zcC
	L4x6yxmb8yHdRyblo10ZbHnA==
X-Google-Smtp-Source: AGHT+IGWF+l7or88VbtVsoih9aXdUV02U9Qn+pFOHncarixgIstYhZ3FKuRbLZND0+TvviOL031nXIBqToZtnStd7r0=
X-Received: by 2002:a17:90b:1d06:b0:30a:28e2:a003 with SMTP id
 98e67ed59e1d1-30a333537cbmr236830a91.3.1745957126955; Tue, 29 Apr 2025
 13:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com> <20250429185839.1807005-4-irogers@google.com>
In-Reply-To: <20250429185839.1807005-4-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 22:05:14 +0200
X-Gm-Features: ATxdqUHM5AHs_-EVk1tBU6W6vNSJKG_yZ1Vj6N1JMNl33Yw5FxIdRgkNWcOtSx4
Message-ID: <CANiq72kw97U_5dy1MCVRHfKUVWDfrrE50anfEa1gL1qy=yQUxg@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] perf demangle-rust: Remove previous legacy rust decoder
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:59=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Code is unused since the introduction of rustc-demangle demangler.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Looks fine -- the only two calls I see are gone in the previous patch, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

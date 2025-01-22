Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB081C5F13
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 22:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737585763; cv=none; b=qqjmI/cVS1iHIIlII9u6N2Ucx2h97vemwkauHJ2wMpT8h0vFbQJe1Xx8pYG8DUXF8IH0gaEBT9/ANWwjInn+m0eV3GRciHPsgTef1QxRlNTeOza5G0xfG48VAR7JdOxES/zNZ9verfXfFY/Bwg1f4NE048KGrMX9cyMruzmlNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737585763; c=relaxed/simple;
	bh=WxRxLNmAPyUcLLxVYpsAStNNFy32ldZHtuS8YS/VnZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDUccyn8Mp27J1eACNq0tc5TgQyBL7Xupix76ikWlw0YbmWkdI+Zq8vA8lPwINUW0caXxFzyQlXSISRLr5z6J4MBNltlDKCf62DbGv9V8yBBsb5xF3L/t9WltFyS9ZXDxLkHc+R2XCDfZ0v6lTwYIkwYcwya5mQs4qsDtH07als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lEL/dRrl; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lEL/dRrl"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so59095ab.0
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737585760; x=1738190560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdQqEYylhQnR7GmUoqf/ZNlCgiFdYKItjGOj+KMaLn4=;
        b=lEL/dRrlIsbqOX44YMh2lNTx/NPM339DLNSjlQXC5diVLAKnQKpZnPNsT2JhMysDQ1
         1CDkJzFr9ZEfr/hyTbg3GeyGuFZ0VeCdU87lOMN4aTnFh+6vSBdhY5d/YQ5M44wJsTDe
         CAKcNU1ozLSkHzlMZbwQRmQ00kGmBawpwnLzviAE7qrgwR69sjwYI9pLgQd/MmmmbEd1
         ZGmRrAPxKSjQdIBgS+Uy4AkMtPbXV9dAMomuOs42gxiPwRjXUJJUjbQW3zfh9GK5Se70
         IVNbirmk5scXwp8SBJSV4UIJs4XR4jIo/ADq+cTN7YKGLxEqxzVBqU0J5S20JgNXE60N
         +OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737585760; x=1738190560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdQqEYylhQnR7GmUoqf/ZNlCgiFdYKItjGOj+KMaLn4=;
        b=EUG+uEbERz0uVIvvcAca6Y2Ojz6f67fU1C3osp3c2+tRgiLfh7qJxu+j/bheBuQlPt
         0QIfhWqnuyI0I0h2BXvO4Z0sg2rcOK6RBygUzSoLzX9lugv9Qz7JFTOs1W8T6KeanwRE
         dd0ibs8WfAnkYUnMrLwZkdOjwztEIJRW/1j5dUXasMv3+x3PahdWDi+WAAHZCypKsXKQ
         eVmSoIxrfd/+X2xx+2EJXywibqiopRNQDvpu+VuTxx5WT1XNWAsBGPvGAKwwtISRNq1s
         NDwntOr5pbu1Cn321xFZ7ImukxCnSeaCNZppkhmoTaEM5sFG8h39L2QRlEx3jbiQI6DA
         wVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWuMS4nnBff2HVAqEqEU3XSv/1jjkHaaOylvtoIG4YL+Wd4UvFDGepwVDHzdW7tE3giue+@lists.linux.dev
X-Gm-Message-State: AOJu0YyQDupqqhzbepXu+DyEZM8uQlScgzaq5B2q/YzcjnL+hUOvXd64
	+6yKLCNG6w5M8au1ipzRELzorUwo0rjocNx8aMBmJdgi2o+l0HGvPEucPTAUXJpYPYeXSdH/Ssf
	jT+HonUQRA7gkuCVfBTiVh24F0wa5tgduxWeO
X-Gm-Gg: ASbGncvTDgSg8HJ0Tta8RX/VhnoQGGYN8DSddLaMQ9ktrbAIH0012eVvzhw4Ytrndvu
	JpslRns/TdAPAW+/Xq46EW/1g1TRIQjLOCna3hoNC1G3SnGNh5t3I56zwfE9MqrWSEvfMt6H+0i
	t/RBg=
X-Google-Smtp-Source: AGHT+IGbhqyoaqIScjShtSZ3NK5yA9WeXZYjaOofa6tWB0i9NR0wrImqL2d01e0QGGh2Hae78dUu0r3/IV0owzY7wBM=
X-Received: by 2002:a05:6e02:1a0c:b0:3ce:6758:24fe with SMTP id
 e9e14a558f8ab-3cfbdd83c7cmr384555ab.1.1737585760333; Wed, 22 Jan 2025
 14:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120173208.344231-1-irogers@google.com> <20250120173208.344231-5-irogers@google.com>
 <Z5FwusFZ_bYlu6aK@google.com>
In-Reply-To: <Z5FwusFZ_bYlu6aK@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 22 Jan 2025 14:42:28 -0800
X-Gm-Features: AbW1kvZPdNegWIwwKqz2CFL7jWTDXTlWqfLgpKyMAo5cBo1YUpx2gsEF0tmQ8Qw
Message-ID: <CAP-5=fX4vtKzMtrEbZhqH0dmKpXY3Ke+pVJ-ZbnHnAVuto7Z8g@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf capstone: Support for dlopen-ing libcapstone.so
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Mon, Jan 20, 2025 at 09:32:07AM -0800, Ian Rogers wrote:
> > If perf wasn't built against libcapstone, no HAVE_LIBCAPSTONE_SUPPORT,
> > support dlopen-ing libcapstone.so and then calling the necessary
> > functions by looking them up using dlsym. Reverse engineer the types
> > in the API using pahole, adding only what's used in the perf code or
> > necessary for the sake of struct size and alignment.
>
> I think reverse engineering the types is fragile.  Can we simply change
> to dlopen if libcapstone is available?

The current behavior is if HAVE_LIBCAPSTONE_SUPPORT then we will link
against libcapstone and can assume the header files are present.

The reverse engineering of structs and constants I agree is brittle,
but these things shouldn't change, it is used in this code when the
capstone/capstone.h isn't present. If capstone/capstone.h is required
we could change the ifdefs to indicate:
1) capstone is present and we're linking against it (this is
HAVE_LIBCAPSTONE_SUPPORT today);
2) capstone is present but use it by way of dlopen;
3) capstone isn't present don't #include, don't link and don't dlopen.

My thought was that this is less good than the reverse engineering.
(1) relies on the builder having libcapstone, which at build time is a
warning that flies by. (2) also relies on the builder having to have
libcapstone and to opt into a dlopen behavior, they'll need to read
Makefiles to discover this. (3) gives a less good perf tool with in
the source lots of __maybe_unused and ifdef-ed out functions all over
the place.

With the reverse engineered values if you have libcapstone then
HAVE_LIBCAPSTONE_SUPPORT works as before - no change. If you don't
then you will be opted into getting something better than objdump -
albeit it could break if the reverse engineered values drift from
those in capstone/capstone.h. Less build options also is less
complexity and cleaner code.

Thanks,
Ian

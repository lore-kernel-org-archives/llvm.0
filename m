Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4E258A
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930459; cv=none; b=bcEeno1g/abfl5REZce8Z/a+3I84uDWgrwPHR0InI05gz1yv6tQxNq0b+8pnLg2GO/6CyDgORSUsvDD+4DykbjmGHgLQwfGPa+Jd3YSjHObuQL76QCgWwAyc9ZlUB/jdWAwED1mapIdm+in8Ag+s+rx+fXXYxtCHqNsbKgdD+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930459; c=relaxed/simple;
	bh=n4tNp56tq6z5EW0Qy91aYPbEKWEtOFMdSPmch9pmErE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5nAbGdYzINHyN9kcBPuH9av8VSgrMMJRGZ9yoEJc4IJXzHJboBFPN2ViSWXdP+Ed6YzVZ6J94an/MSNqg8Lm3HezdOiedYNZpuoHqupaerpaf+SDhxYHAKequMwNXsBuraspBANO5rtvSXvT+vLn3omOyHnM7EFis7B2pslfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=lfpDthZh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lfpDthZh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f47ed1f40dso27041607b3.1
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1740930457; x=1741535257; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL+Pb6+3LP0e5E6K/WXHBL7Tetw+ktOPyQjrugSsppc=;
        b=lfpDthZhQcpqrrdKG6deCszI6xKFEANPfqG36++UYGMxdfnbFaUwTlQx051YHSFJfq
         8Dyy56jLeGtgP31V7nvzMrsIGlGI20sVWEiNmyMpOL/2WC73a0r339GDCoRqN8puOPLN
         /L3RwOsX38BcgN/0uEDLc8OAiSIBaVm7k9GAsSW9nSTUx9ELIOYVXN9cd+f1807GCwzL
         v+ynJpSMgD2Svh3WRquM9OOxTshKapmp3EY2MvkdXLY8593PGxSjgl3xNiIYwsMWJIEP
         lsKLDMbEhV18WT60e9coUb28vBUZ5EnAgh0i8R7YtuzluQ83QQ0M78H1/HI+hTN9HxaN
         8T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740930457; x=1741535257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL+Pb6+3LP0e5E6K/WXHBL7Tetw+ktOPyQjrugSsppc=;
        b=O18vI9kpfOHpKmZupUEhrIs2HtylK5QQnXoLSASZGUQk/TPvK/ECSYH00hWdHwYvpp
         lk+7gbs4aS1qBn9X0f39Q9koPosBUqlGeYDTZFbdGtwyzB8T0ds/wp0nbKRM9I0T/v7y
         GbruUFyiSsueqR/zXYVnUm0nlZ9Ls9QHwUae3wFq1gOIvQM6j5ynnI/qn2R/D4h7J63d
         h317GIZIVtv2MqSHNm+q5tgxqcW8O8z5ZrAFAKdX7riKxwKsKpmlbO9T6CE3Iz+9qyHD
         EkEF3G3McoJ5q8Sbg17JTkSesbpwngpbkkFwD4yEivi4OzvKbG5AVQWHuQhVR7sWhoOZ
         5sgg==
X-Forwarded-Encrypted: i=1; AJvYcCX8403fyudo+8jfq05ZgfnM2KenU1eyZixlm9IPh2CCNHtdzUw+XsTa3CnAtHhof2eUKgSW@lists.linux.dev
X-Gm-Message-State: AOJu0YwjebJw4qZnEHitaaEBiuBvI1dJ9rWzm+s/Uv+E/qr4lVLLZQf3
	hb3CbPb1l9z9fCVuCN4bHsH+IxYAcldaeceAy1s5sq5HDAYIlXXzS1k4uQkjJQ9BVNDkPf4Rtvm
	U9OqVpwJjLN/ftpeRgwk/isTWk0w=
X-Gm-Gg: ASbGncvT4PQaNy+QokFmjUVSM3HoBj/pra21+X52yZxVmSuqHjktVpecwG0fRR5S+nU
	+IaKp2yAAee/IjNORm52OIEj7wnraoOrmNc60jBwyLK5WyLAltD5Fpjg/uUf7gM9fhMdmrZaxMb
	rbXLwTVcii/QNaqdbKVA1oZOCU
X-Google-Smtp-Source: AGHT+IECfeIaLvATjf7x+fKIEl9KKhtoIMwfOdbC/luMAZVqtF6DjvXHnsacHL30hRniywMWTxjOHNruJyO4D9foBM4=
X-Received: by 2002:a05:690c:360d:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-6fd4a15e96amr135680557b3.32.1740930456795; Sun, 02 Mar 2025
 07:47:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125105240.44219-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241125105240.44219-1-cgoettsche@seltendoof.de>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Sun, 2 Mar 2025 16:47:26 +0100
X-Gm-Features: AQ5f1Jo4-nZ2PKhNgmOMUX9U6MF0Mz3tvRHEWQV-RQnSBNgDnFm30mQewFKZxuU
Message-ID: <CAJ2a_Dc1-KSsV9aS8P0x4SePRrjO228wRF=4=5f18wAk0G+AAQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: constify return of string literals
To: cgzones@googlemail.com
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Nov 2024 at 12:36, Christian G=C3=B6ttsche
<cgoettsche@seltendoof.de> wrote:
>
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> The function kunit_status_to_ok_not_ok() returns string literals, thus
> declare the return value as such.
>
> Reported by clang:
>
>     ./include/kunit/test.h:143:10: warning: returning 'const char[3]' fro=
m a function with result type 'char *' discards qualifiers [-Wincompatible-=
pointer-types-discards-qualifiers]
>       143 |                 return "ok";
>           |                        ^~~~
>     ./include/kunit/test.h:145:10: warning: returning 'const char[7]' fro=
m a function with result type 'char *' discards qualifiers [-Wincompatible-=
pointer-types-discards-qualifiers]
>       145 |                 return "not ok";
>           |                        ^~~~~~~~
>     ./include/kunit/test.h:147:9: warning: returning 'const char[8]' from=
 a function with result type 'char *' discards qualifiers [-Wincompatible-p=
ointer-types-discards-qualifiers]
>       147 |         return "invalid";
>           |                ^~~~~~~~~
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Kindly ping.

> ---
>  include/kunit/test.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 34b71e42fb10..ae1b57578476 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -135,7 +135,7 @@ struct kunit_case {
>         struct string_stream *log;
>  };
>
> -static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
> +static inline const char *kunit_status_to_ok_not_ok(enum kunit_status st=
atus)
>  {
>         switch (status) {
>         case KUNIT_SKIPPED:
> --
> 2.45.2
>

Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3F41843
	for <llvm@lists.linux.dev>; Fri, 15 Dec 2023 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kozaidjO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-67ef4c73e02so6012976d6.2
        for <llvm@lists.linux.dev>; Fri, 15 Dec 2023 11:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702667382; x=1703272182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWbxY3Q+EoYq5mueLiLO42QJaTQBT+r4FmqbmlCjarw=;
        b=kozaidjO9uju4iUbV+xYMBAlI/a/BJXdQkxvl23miFipA3J3Xbw6n9O+1Mjs2lTXEq
         6QQ5hjtgDZDvUEHp2yK/L2ZRFpjeYPNk6ASesGLTn+G3erq7A4L1SFFjJN280K2W7iql
         oRGiqGFKT2HXY7nMNVoQnXLzyQ1iHbGPbQR+swX2E1/H/k5NBqeNDVV6tkDtWxNum6Li
         hI03n0aChf6CK1fFCx+ZKTCrT4C7TOMt9wxvDRcdsXzIUGdiJpkGg/q/hE1GAJVnUHr6
         I7ttQ6g0F7c5p4kOtFLbDXlwHPxoY4naXmWB/lkU4B+t9r4sulNiR82JroPpGvgMk7PN
         Mfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702667382; x=1703272182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWbxY3Q+EoYq5mueLiLO42QJaTQBT+r4FmqbmlCjarw=;
        b=P9EAr3UMW2YNqliX7Ze6c5/wge+kMOGfM+6E9M6vd++Y3oPKJTwuxbUzxPAxWEyQuB
         YmLlYFwOhd/SiAeXktMD2eOvLtAIDUVjywKLcT8a3EokkZMkqQC4/y77qQNzGCy+EpyR
         KVc5gCsA3ACmkB4jj4ZJ7EvoPNpjbfbO+DqQCn9VgpA4tWPM1ltjkbzQfqgF3CaLLV7Q
         pjHyvvHbHxAIqOifzOo2SZTghrcduzYsRkakOaiVNz+243DH/HxgRf5d29n29T8GFNn+
         RUecYneSQrxFTfkoZd5PPGSVbk3iUgzKdyJ7n+V6gIJCZ/b6VnGb651QgH93rFMMdW7B
         pNtA==
X-Gm-Message-State: AOJu0YxCE1OJLtgSXqG24yJ5epcf3gGc81koOtgjXyyFhdJptmscHQAw
	mVy0xklq01QAcXXVMrKyzKMsarRu+T8eRm5CDWY=
X-Google-Smtp-Source: AGHT+IGRu4Yn+bj/EYigKT4CfJMHoTJnMispB2cjumjYp7+2ke+qfRMcDdJG/cL79FzU5aowwE2g1m0EgVLQmvaKh6M=
X-Received: by 2002:a05:6214:1023:b0:67a:bce4:e2e3 with SMTP id
 k3-20020a056214102300b0067abce4e2e3mr10532467qvr.5.1702667382352; Fri, 15 Dec
 2023 11:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
 <20231214-libstringheader-v2-1-0f195dcff204@google.com> <ZXx5DyidpHFhRevy@smile.fi.intel.com>
 <CAE-cH4p5VJ_A91BAkURBN67ACA0_u7T8UhApUYLQDWeeRY6FWA@mail.gmail.com>
In-Reply-To: <CAE-cH4p5VJ_A91BAkURBN67ACA0_u7T8UhApUYLQDWeeRY6FWA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Dec 2023 21:09:05 +0200
Message-ID: <CAHp75Vdo=g7ZBAuk79PtLOYs-YHo5sCTp1WVFESHA0xN0zGEmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sh: Added kernel.h to word-at-a-time
To: Tanzir Hasan <tanzirh@google.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick DeSaulniers <nnn@google.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 8:31=E2=80=AFPM Tanzir Hasan <tanzirh@google.com> w=
rote:
> On Fri, Dec 15, 2023 at 8:04=E2=80=AFAM Andy Shevchenko <andy@kernel.org>=
 wrote:
>> On Thu, Dec 14, 2023 at 09:06:12PM +0000, tanzirh@google.com wrote:

...

>> > +#include <linux/kernel.h>
>>
>> I highly discourage from doing that. Instead, split what is needed to
>> the separate (new) header and include that one.
>
>
> I think it would make the most sense to do this in a separate patch.
> What word-at-a-time.h needs from kernel.h is REPEAT_BYTE and to my knowle=
dge,
> almost every other version of word-at-a-time.h includes kernel.h gets thi=
s by
> including kernel.h. A future change could be removing REPEAT_BYTE
> out of kernel.h

Just create a patch that either moves that macro (along with upper_*()
and lower_*() APIs) to a more distinguishable header
(maybe bytes.h or words.h or wordpart.h, etc) and use it in your case
and fix others.

--=20
With Best Regards,
Andy Shevchenko

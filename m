Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54E6359FA1
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898183; cv=none; b=n5x2EKJcKwXt+lEuCK/oRMKRNKn8MDZCe8wvauA2D/1AQIEcZLkS8jezSMMrw9nRxTiCWQ6ALMiChx5+pRHblECfXBsiqSqDJEgfN1T/j5JslvWNgpQIzQPgppYn477XWGb/nj5gOqAidsQVyXycSHUaLnSHyCQFaTQUp0tftiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898183; c=relaxed/simple;
	bh=XydU0zYPi34+6gSjQxNPZvQ3IrEKTjskKmZnjkotDnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osAA7ZQfXvE1SSAp5Xyb82ghyWrrgN98UXiiiO0rm2CdvgIEKgdwYRwF2IT482G9xNJMSX7JfqI1JaoulD2nmQwipXx73pZ4SgWzkgEJcnROZAoDJgIf1vIn9NWZuQaEqKkSuduJFt7pARR8Xk0W48xKd44nTadPtngl1g87WE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgUxIads; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgUxIads"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a110548f10so4207435ad.1
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 07:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898181; x=1766502981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Prk++bNPBbw7llSvdyWuyKrdatVuaHMUXvtiIeDQebI=;
        b=QgUxIads2TrBzccDXsBRGXf+sOdsHDqJTqM+wAb1+cUNhoxxNQQhwY1jZroUthNNlA
         zJEC6ioFq47n539GP0GXmWqfXgauBp0VQUitOYYUuZcoov4AHCOQ08HGIv/6NGszCjID
         d/ldOmVJfP6CFb1hX0zHtto7FYNfia4fzPwO1l7jRYI3f7EpMFq+qKQ64AI0QsIEZq39
         b4DzFzGuBQloiZBJ/Blh9iG/TZsoCT9lB1ggAwdCQZVyS05BFoSAvJLhdf++ULvGcLuW
         sVRJmez+cm9NAy+Q6hogN/8uCiIJI2JYJkB8MZQBM5MGUXWCXajcW0LjnOTzSu080QvI
         CHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898181; x=1766502981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Prk++bNPBbw7llSvdyWuyKrdatVuaHMUXvtiIeDQebI=;
        b=gmz+UO/86mH0xBwU/rLMuKr0p9Pk93eME8jg6KA/42dF5Kz5s8HuFqB5Q1ABt6P8ji
         kZQBN7K9g/5q3Fc0PAD+oqZmGmWGfn/vkfJGvJj2SBgYLyazfd+0JD+JKhP8TtHs3JQN
         ZaHrbD0h1BRRKR7E4dpOEOFovgJzXPRMMd9pk34aDpgX1J5F7ihokJ4GWa3VDjvCEKTt
         lP3fOIdWujJQboGakTdMYKpjn4VkW9Tp8Q14c4TVo1Qn38ATduTXjmf5/4imCZNt4n0k
         3hUnZ1D+BHphMOZp+koTAEKga2PtwBidLqFYyNnFV4UCofpIgaB9fHC1tYOCwj4SrESN
         bVVg==
X-Forwarded-Encrypted: i=1; AJvYcCUARY7BpFUKy4qh5TuiFOefK1D1stnzD7KDLRMzEiDNWaFzN0FjW8NSv47c+Zr2Ukie7FNT@lists.linux.dev
X-Gm-Message-State: AOJu0YwVtqcy4HP/KM9KuOr9tSbOZd/OPD81oOykH19bGA6xiN3bRptP
	yKrbX6dtKEwY2dWxULsRjcAOO8ilDVgBREH+upjPKAhJ10kSIX7XtaPauP4EuRXif4MsqVh1CRE
	TUZa+RdB4Yl1RBASNIJzwTCcIgIxsf3g=
X-Gm-Gg: AY/fxX4ffGvKD03v+70kBYiGEledbkWHEX4efQmZ58wVOOGKLz/y/K9RHIv8jmKd+7R
	oHOu/lape190iPcjLaS2r5GBWdZKinKIiqaHbHMVSdF0Li58uQABtgMnMkvEklnC6odWYiw3OjC
	3rCrVXKd4yTBJBEHVItXn15Uhu4LuVjXCt1kxSkB7hiJJI/dD5CTL7abkPEznN0aBcXf2Axa5OK
	ryeYlRlT06wApO6ThuOIsqYCf8QyUrdiVJiUvNPtXmuZ/FXgjasAC6OZj8flS1A1eQNI8Ez
X-Google-Smtp-Source: AGHT+IExL4bbWd8dGz3R1du6C5PQxAQFN3higbgXbHR2p3Vd8GWbSJj78l5nGqz1hyDQKAFC7gD/XLUbhsxrspplMLo=
X-Received: by 2002:a05:7022:698f:b0:119:e56b:c3f1 with SMTP id
 a92af1059eb24-11f34bd3d6cmr7088129c88.1.1765898180806; Tue, 16 Dec 2025
 07:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
In-Reply-To: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:16:09 -0500
X-Gm-Features: AQt7F2o9ouuY7f1i8nUGZF2nlb34bshqvLmZP02ymrNXjm02AX6gvFlIqpRP0n0
Message-ID: <CADnq5_PLd_v9n=dHFmAdPcWY2NbbyCocOtE-9CoMX4D1H4sL+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amd/display: Address -Wframe-larger-than with clang-22
To: Nathan Chancellor <nathan@kernel.org>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 6:04=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> This series addresses a new instance of -Wframe-larger-than in
> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c with
> clang-22 (current main). This is similar to previous fixes that I have
> done in other dml folders such as:
>
>   a3fef74b1d48 ("drm/amd/display: Reduce number of arguments of dml32_Cal=
culatePrefetchSchedule()")
>   c4be0ac987f2 ("drm/amd/display: Reduce number of arguments of dml32_Cal=
culateWatermarksMALLUseAndDRAMSpeedChangeSupport()")
>
> This was done fairly mechanically, so let me know if there are any
> issues, as it has only been build tested.

I'll run the patches through CI and if they pass, I'll apply them.

Thanks!

Alex

>
> ---
> Nathan Chancellor (2):
>       drm/amd/display: Reduce number of arguments of dcn30's CalculatePre=
fetchSchedule()
>       drm/amd/display: Reduce number of arguments of dcn30's CalculateWat=
ermarksAndDRAMSpeedChangeSupport()
>
>  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 545 ++++++---------=
------
>  1 file changed, 139 insertions(+), 406 deletions(-)
> ---
> base-commit: f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
> change-id: 20251213-dml-dcn30-avoid-clang-frame-larger-than-36afd349190b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

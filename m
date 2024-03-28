Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448713173E
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663104; cv=none; b=AownLE6MlepUKUBypBAVQWE/T7KR3SSUdmCBT4+I12rEhJjuenu4SBrDCjz1wLGmcLq/ypZesSkpx56RLpZ/M81QaE4N5w75FMhS5FRQ7nzPTjhpqpPdfZU4JJQgL6v+k/fN45Guc0tcSmYp06ATL1jX6HG/ZueOi6P9GmVR+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663104; c=relaxed/simple;
	bh=EVOmIevOY7yIjg6tCh+xVx1hJEYZK8SikqOcoPFgsDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tY4SOtyBFIiT7iZxf4ky2tIlJuDFin00JkTimxQyvAH8vMogYkb9VDJzB96B2bZlyqpMN30e4cq6kvyLNOH5kiI9QGe0qnpi/Gb5AXaSH3M87zGL9rtz4fZuNVyYyvKs4OXN/mgFkzA6nyIiJmwxQRwFvNcEqYlJeQuu8FCL75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XxEKbh+c; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XxEKbh+c"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56c4ca65dc6so1797392a12.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711663101; x=1712267901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxsKZxZUzuDOnaAX/evvGdiqGyKkkrreXD8So3xuleM=;
        b=XxEKbh+cXawiyANgc9VlUT9+qy/oocydkhUGdGnReAHyn6xvx8y/acHCDliZU6oY6m
         K/aIYM8fQdHPEUQIEUzp5PHfnfEZ67vaSVUYXxx5z7E+1I0Y6xQntquv/K97pFToIGOF
         wFPFkjGsJ/THw5WX5LSxJvlnzHvT+0P2bkAmh5jH49ArDDNUGTBYk7Vfzp3+yTUTfl5i
         ARry/fuYk6LzXhXgepKKKsXvzaVq22JsBaug2bgKbDoiayNp1g8nAe9X0yVx7hW+9mHH
         nLAjIqMwZs0avVGNaIw3O8RMtYR/u893wMG1Pb5N1yp3KzX2fLhZjCToqQKqvwTablfn
         dDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663101; x=1712267901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxsKZxZUzuDOnaAX/evvGdiqGyKkkrreXD8So3xuleM=;
        b=Pd7iWqGcj3lzj+nWn+O7EhM8N2QZc3SFcUVhPQQd+fweFlSE+BmRJWnm7lbtj+Y8z+
         3bYqnN1x6drpQLsZmOfFovNspxE6b/tXoq1fUCgbeJgCgZCRUguBEJ5sbne64HWtX4Fy
         p1lsUrWrdqeKVvHZpAGLaiXV1BBqY4fW5u+DERF+kfTDq28ofYZHfrv+iHClz03mULTN
         iFGfP6fYDppuoWECwAYRvj0vgZAEEfvF2dnYxLvg9iVf2ULxp+KF9b2PDQr6/VyoyW7g
         SWTU72U4Z1ZEptH+suNTOauNTcResCMQxNtbyjeSW8XwIvL+mr8Xih9UB4nBBKThrbEm
         eROA==
X-Forwarded-Encrypted: i=1; AJvYcCVKB9j3kRuCuUgyP+4wyDaAoYFZFzsBuDFyQPFIPsTUDL8VSQr8duJ034G62wrTVV5VXRXi0xZbW3E9BwQPhmJn099Syg==
X-Gm-Message-State: AOJu0YzVDwuZtGQCDyUB4NHJHGerY0L7+/+0b6UbFpOq0mpJiMg1Ts/p
	EHxqQnVH028U+abk0bs9iwVHsB/1UOBNadl6isd07UcgNbMQqsPAAfWAus1mbeOvH8VW1L75RBH
	09a6N7JTHujgm/Mcznj7HyQpm5Ojt0P8UUOWI
X-Google-Smtp-Source: AGHT+IE0y1seF6MQXvRRM3kwa+kdGhzZ45RQ2GHfTY+7iJdVAkXbLfTYxpaWZJXiKbseniIrUcFPm/SQhMOY2Slfwn4=
X-Received: by 2002:a05:6402:51c9:b0:568:32f7:6c53 with SMTP id
 r9-20020a05640251c900b0056832f76c53mr421604edd.3.1711663100915; Thu, 28 Mar
 2024 14:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-2-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-2-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 14:58:08 -0700
Message-ID: <CAFhGd8ortE-ahJD+BDss7qbW-=Hn2_L_r2OZfa0V87mG2KV3+g@mail.gmail.com>
Subject: Re: [PATCH 1/9] dm integrity: fix out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Eric Biggers <ebiggers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:31=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Depending on the value of CONFIG_HZ, clang compares about a pointless
> comparison:
>
> drivers/md/dm-integrity.c:4085:12: error: result of comparison of constan=
t 42949672950 with expression of type 'unsigned int' is always false [-Werr=
or,-Wtautological-constant-out-of-range-compare]
>                         if (val >=3D (uint64_t)UINT_MAX * 1000 / HZ) {
>
> As the check remains useful for other configurations, shut up the
> warning by adding a second type cast to uint64_t.

Yeah, nice.

>
> Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/md/dm-integrity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> index 37b9f8f1ae1a..7f3dc8ee6ab8 100644
> --- a/drivers/md/dm-integrity.c
> +++ b/drivers/md/dm-integrity.c
> @@ -4221,7 +4221,7 @@ static int dm_integrity_ctr(struct dm_target *ti, u=
nsigned int argc, char **argv
>                 } else if (sscanf(opt_string, "sectors_per_bit:%llu%c", &=
llval, &dummy) =3D=3D 1) {
>                         log2_sectors_per_bitmap_bit =3D !llval ? 0 : __il=
og2_u64(llval);
>                 } else if (sscanf(opt_string, "bitmap_flush_interval:%u%c=
", &val, &dummy) =3D=3D 1) {
> -                       if (val >=3D (uint64_t)UINT_MAX * 1000 / HZ) {
> +                       if ((uint64_t)val >=3D (uint64_t)UINT_MAX * 1000 =
/ HZ) {
>                                 r =3D -EINVAL;
>                                 ti->error =3D "Invalid bitmap_flush_inter=
val argument";
>                                 goto bad;
> --
> 2.39.2
>

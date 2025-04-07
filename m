Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B699254841
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052546; cv=none; b=Jlld0il79F/2/stw85z6Rp6arGITZ6zQK5HP20tg7S7wl2U5PXc8oj8eosl1+X1X+emX3EZOgCwLI4C6WbsZrIbEhkAWAQQlBq4FEAkQJTdyIpXW2TqAaRlZmCwzbE0ut259xKNxM5076+ct5rXfGOY9LV5Wwht9F8cL8IJ2FfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052546; c=relaxed/simple;
	bh=tpFwO288Tb8nOdpntE32gaJlCk1gAnYqdxjp9nQSYPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnyca7N0/hvg0nkymgJtTIr2Xn9pbh/nosR7KwawGS2iKtaTWPt87uDfBB6pgMGW9UhK6SD4bX0Aez/FqJndbLbU3SZVY6bR2CDGZUUPEEyp3YiiHPD5GjL8Cp11oX/r9LdvsQZkZQZGovYYxBPQqFDa0G0A9YK+oVs1WBJNQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YNORKGg0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YNORKGg0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso554855666b.0
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744052542; x=1744657342; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKDCjSJ25xQvHRgBvdt+RYZW/uH0S48oMFdtUEyp/oc=;
        b=YNORKGg0y36/0tFoNfZUhfZ9oYFva5Qymb+3OXOhI5wK/JwF5C83c1dphOLYOLhE8e
         khCSyVvrNRCS7s3+aRPNJAyPahR61IDLC5kDKOVRNgZBX0WyBiQpcTIcRQaUZ/p/mek1
         wJz75e4teC4NkgaDW6Ge6YaLN4Xqq/BDK6MhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744052542; x=1744657342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKDCjSJ25xQvHRgBvdt+RYZW/uH0S48oMFdtUEyp/oc=;
        b=AGeMo6ZKXBQ9sr/EPqL8NzS/yJprpLt+WMWOjusFxE7H8giRzCbgBqy16Eq2Sxn7Lt
         gARu3keS5ilaBl+1zt7VjsYTZa2tN78UOm8JFzopyQNUs0JDLzdc8qkWufOUqcaJ23RT
         iAOkkVtl2N7z+t6oHlFkOlA6j7/CxpsXPmLsx1TmE35VVL8g/9nAH0W2F51CTO6ffnNg
         1geKf4/+duMErLf5TT1kGXkUakG9phWTV62QnEukNU041PbBbFfuw6ncwQG5d8+5uSps
         YAl2070+fG+27b0f6dAElgp/T1qGRIAo1hRLqngQJgTcBPqEYKKeQLtMZv0wzCgzp2rm
         74Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUr2nUu+Ewb6XOFs3g5/U8HPXUXP/143HmBQbKlq5Zbe1fGHaLE6+l/SLBbNEOwQM+mtLrg@lists.linux.dev
X-Gm-Message-State: AOJu0YyK1adrMxxKDVwIkQv7Q2PXewhBBlVuZlGUEezkHyCaAj39htHE
	dbvlFXuRKjrnl0K1FLSBJ/m7Z9/FbWQb7YshS9b4sspHRNRd0sCur5XvPq/watWUPnDUi2jNP73
	OO1Y=
X-Gm-Gg: ASbGncuNAxFpXrCWd62yjJ9T/vzLdX/MuxB9/s6cmtmbWkdpgVmJ4ApuwL12Z3cx3Lb
	1hsAq+IE/K7V6hERVyQspvegdW7xLiVrnb1KPug6xGLx6F89j//JWpvd4adV1o5jIaTDdGOSIg2
	jz8COpvOoEDcodelRYIY5JiS1gcuc06pUiW60VnV1RXM3WlRiTCJO7JN11q/flh2v4HV1cXor3Q
	Yy/1kBuPlmA9RBkHpBmRMbHJdw0IqnPToY62O95k0vv/9uExLUUI2g7RZty/On1oNqR4qPdTynC
	NyR+aCSJaiUrnlmqBk0hvtD5FMD65i49NlGWc2go0M0ugtdGDUXZITjr0/5ovBNGc61BaHgE1/E
	UEpPEXiUog+C7MsdT7jU=
X-Google-Smtp-Source: AGHT+IEPpc+o9biNH+88t+DmBJwM1BSJXiD3ZjjcnaHkwRaskF6/cKVWBqB4m2UKXEBhG2u6SaR0sQ==
X-Received: by 2002:a17:907:1c92:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-ac7d18c050bmr1372756866b.28.1744052542254;
        Mon, 07 Apr 2025 12:02:22 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2c3asm797966466b.176.2025.04.07.12.02.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 12:02:21 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso487001466b.3
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 12:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1Dp6JZIsu2OgYrPJC//H22nT2CnniLS8rrrbms18V3IftTk2Ey8evJecQsmjvut6N1heX@lists.linux.dev
X-Received: by 2002:a17:906:7149:b0:ac7:ec31:deb0 with SMTP id
 a640c23a62f3a-ac7ec31df15mr624002466b.9.1744052541214; Mon, 07 Apr 2025
 12:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org> <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162>
In-Reply-To: <20250407173741.GA3847400@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 12:02:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
X-Gm-Features: ATxdqUE0ltJpng-EBWeE1UKan15wl_Wwyop6M2frZ8rfpKkAr90nfs4qcjQcUm4
Message-ID: <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 10:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> So would the following change be acceptable? I can draft up a commit
> message and send it along today if so.

Absoluterly. That's the right thing to do.

> +# Ensure clang does not transform certain loops into calls to wcslen() after
> +# https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d
> +KBUILD_CFLAGS-$(call clang-min-version, 210000) += -fno-builtin-wcslen

I think you could just use

     KBUILD_CFLAGS += $(call cc-option, -fno-builtin-wcslen)

instead, and not use some version check?

          Linus

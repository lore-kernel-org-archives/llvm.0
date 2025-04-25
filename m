Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCD15E96
	for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745551873; cv=none; b=iAC9IRq9UKYfw9OBkaV1PSRltoHZOI8jjdjFoPWd3qpOwuYxY0yp0JGcA5JYcinuLRy4bKr/hmhEQ5h7aadV7OQQgj1xEkTTNV6CodQYqteH9EKyATywabTcXBCaeVOP5AyDp6xcNbdyymBdvjEvTXnKrbvCn96uU52hnCFmARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745551873; c=relaxed/simple;
	bh=jrRGhxPyf95ypPJHo2BAQFIRKdPXSpjIpa1ctUMjIXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouh6RzCKMkW+YqYH8Ncp4vO3nleU6AEwDXdSxU71ry46vHUiGGydavCMIsdv87RiVeeUMdPGquDWd0Bdx5Ax7BNA9tq/eqvSG3hi6W35DsnRu9PJ7EpWEt6ZQ+sUhGiZFnngFqJhCfT2zGUj+TvK+MpUnMhbcdjadA3cfGbTNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HftQMqO/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HftQMqO/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb48bad09so318944866b.0
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745551868; x=1746156668; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3+X7UpAVVUSxTxgawTFy/Rtqo3IuG46uus58xF7sJ7Y=;
        b=HftQMqO/FfFyavoRkBN1zjXCrPP/GwOrh9djX64KelbGCf3W/Q/Pel/MwxrZdWmwPw
         dpijaFucq9GrFHHxsik620kbNFsJ7c/Q+WWeGQuIbRgcXwzBseU0N5smP2axqxCHdS2k
         hANt7/NalypV46LAAkZjDZTz17vK5oAEjo1Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745551868; x=1746156668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+X7UpAVVUSxTxgawTFy/Rtqo3IuG46uus58xF7sJ7Y=;
        b=TIOQ0qofEjt/UUgFEYoEY++fZNbCfjhGzAVP3HXycw4IzU3S4P9ca+oVqBrw/Pd3kp
         9859s5vzm8JsSlJBXWH1G1mHIgDNNy8vnZt2kVwuVM08IMbroyMgmo+Q1tkdgIxR2ZbA
         Ga/z+P4FLDe3l6At2merAEsXPi5HlYbOs4ntQ6w8QAeukiB7M2H49nKOxyj/YtjRzWhP
         m1Dp5Jj4wJccAWFhICc4nJXEfev53ihyj4tGw9TTPUk3uia8Id4EqnhsUZmQitZTt6gN
         J8l/EFaPz4jnw9WZfoH2iZOIkWNW1PzoaZ0ZS1VJ2nsE3VLysFUw9WaDxwQY3hK8G6JG
         IagQ==
X-Gm-Message-State: AOJu0YwuInwtHugtei2nVYn0yyjjjFiw8pvJRuYiYc4TKendWhJbIyPB
	LI45mk8/8A1XhAEExOgf0rNyadw2O2GZ1jFLef/msDPMnkfSReML4r0ASGnFmPojEb1LlIUg+hp
	lO7ih5A==
X-Gm-Gg: ASbGnctlo9m9CcWh217EqCfCBkuxWeKH+TscfgH+vjzOv3Eb1iHl5XyrTcSiPZYIaeW
	azTXW7fCxwQXDCcEA9gAvjQSDqkxAoH11TBU8vuwQ4mt6Ig+aPxmW6xjeHUNofcQ2Z4aAV26DUF
	TjsKgUHiia7OC4uaemqoDIiWJxRrb5AFnUWG9kVT1Gyq3+w5eycZ09Lz+FvWdhRvlb+UWcYbbs6
	b/6iny4wzLi3RKq9daM/N0LThxoMz3ECz0W2tQ5tge75uYDrLdTefaAu1nezCik7CE2MeUTua4a
	YtLE63So54eei0MaP1LUmEVZm+gwm2+NbEvbeaId1ivbzJURdigF8KGbOIkBhItQvTDr5UD+4uq
	4bMtUWJM0cv1Cjv3zOV8FJK3YWQ==
X-Google-Smtp-Source: AGHT+IGawm/cTxUEWoJe4NwDRPhG4vqYXfuyPhlDkfW0h3epQ879bBeTybMpq5TYEYJQWD4uRlgQxg==
X-Received: by 2002:a17:906:eecb:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace7103b316mr68858366b.1.1745551867692;
        Thu, 24 Apr 2025 20:31:07 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8603sm58672466b.112.2025.04.24.20.31.06
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:31:06 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so286227966b.1
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 20:31:06 -0700 (PDT)
X-Received: by 2002:a17:907:6ea0:b0:acb:5c83:251 with SMTP id
 a640c23a62f3a-ace713cfb98mr63838566b.53.1745551866239; Thu, 24 Apr 2025
 20:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
 <20250425021138.GA3800209@ax162>
In-Reply-To: <20250425021138.GA3800209@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 20:30:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
X-Gm-Features: ATxdqUH-bKC0VcMIV-F2AOd9j-f5mi3EXH_KaqVlz4TTORr-ZxoTf-cSfjxOSBI
Message-ID: <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 19:11, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I will test declaring __popcount{s,d}i2() as aliases of
> __sw_hweight{32,64}() to see what effect that has but I figured that
> calling the __arch_hweight variants was more correct because some
> architectures (at least RISC-V and x86 when I looked) use alternatives
> in that path to use hardware instructions and avoid the software path
> altogether. While there would still be the overhead from the function
> call, I figured not using the software fallback would at least soften
> that blow.

Once you have the overhead of a function call - and all the register
games etc that involves, you're almost certainly better off with the
simple unconditional bitwise games.

                Linus

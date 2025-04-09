Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E842905
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744157716; cv=none; b=QbxPhRO1m8lkgDGExlDhAKP7fS4hmci4Buy/HbfmdPFCJ9HMwm2H38HK9U/oGrWQGxv95wv7DXN3UpWYFk0LC1YdMqecwS/uvOXagVdc384ymjqR+H/N7kDwjqPbIeYuUbFea8g+alr8hKvrb9LksseSsoxwFxDD9hEWAFPfskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744157716; c=relaxed/simple;
	bh=kzUr1f5PApCyyaQsNWZA+8T6s6ncUwpR5rXya9vt64M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbsHWin7Oy8pc99+F2PeR6BmzcByF/HyaTYtpkfbEZmVBcw5oFOrl0iaTLK1tZ+3zsbrVXKyGq9wM72af5cC0PayEwc+rccoCVRN3u5lY7kNwLYVvNQ4OehFhwU+Q+w3qtj1HlnD90UD4XmsHjwKSjHzM8oQ9pNiSQnIyCsV1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FcCqmNNs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FcCqmNNs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso381560a12.1
        for <llvm@lists.linux.dev>; Tue, 08 Apr 2025 17:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744157712; x=1744762512; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=FcCqmNNsCUz8Ji+DYIgj/Am7IBwO2Dayml2aQkG68Xgk38YPbS5PGpbEEe3hxQRUYq
         KnWUOmDHiHNxOkSzdB/W4u6HMcvvjsrmxMqKZo2YaWmU/xA+uKrnxB7UadUNpyZOE4VJ
         hJrvb2pgjxAsyh6LeGKUFnokylpYqzZ/h5Wko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744157712; x=1744762512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=nU6PUrMl/UXV9dskKZw4LHSVQ5oKmSHcOCw1luJoUwuMiJ/IYAAusghz8lEpBh8nhS
         hYhAmfJ4j1iHQiTbciuCrjSQffcI+yQoPuWC1byNT1N7ZL23cPNrniJp61x6fjspzqyu
         7yJVLmMY/KB0mvOQd3BhNdiGXD4/6SfRyRicMZmGYuXJPFzq6Aohq1v5gLkwjbzGiGZE
         l2/QymqUWW/FbHxtOGkzpHgjCTtJUDJfx0vc7B2f+jjpRGL3FjnKw7y/7JroiU2VGSS0
         i6fytbJLO4hHcToomGKWf5IDoDXzGfrE2RfGLmIpF6ftBFVlfyA/Gye21fc/y6BP8UzM
         jNlg==
X-Forwarded-Encrypted: i=1; AJvYcCUsl+K6sJh/P/uv6T9fwObLaj+ZvmUY8iWkCq7XqEZqAi0ka6hfwwYxd3mp52hLT1gtGqg2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70B2DNBBDyb59+y4r+0t3vU+hLVTesXJ5XqxnAG4yNoduKCdD
	4FIC11tYRtVAY/paQjaS5bvjMhzddjXVJru9rINA/1xf6FcjJrP1pciTP4w7cAk14RrJKMavqWR
	TDho=
X-Gm-Gg: ASbGnctSedX1fzUJvZj24i4byJJ7n5kklLvbV3R/MjYyqiEUCyUAZo2oxvqu1YYw/jZ
	uNNOaAOQGeqRl9zPs8k19Gjpu/8H5huW+1Z2Sj6CZAd9pQt6Q813srQaEDN8M2YPVq4Z7AcGjdo
	ClrY8yFKaCQJfiyx7lxfjScWHdnR2BXYjjoxG9PbO9GXR9fgyS/boOjaJocZQxWqLU1fA48Z21G
	tesYA0JhGSSWHZs35WQWNf5P/dvHKUJKi+ZNvcJjymYc14A+r/I5CBgwxgIgejFFeMUVDEoY4pZ
	S7lpznECsG+b8u4Hfnji3v86wkGt8rozIdqAqKfsKZhKXiV67OGDKWDftGnCmXX85fjc5jNzCXd
	h9Sr3apYPcZEcwDBJ+c8=
X-Google-Smtp-Source: AGHT+IFJvKFBwqcUefkyawjXaeGWado30Cy5uKyb5l0yEiR8UT0zeo2lAx1lCJO+eCit9UhxI6ZkWw==
X-Received: by 2002:a17:907:7e95:b0:ac8:1bb3:894 with SMTP id a640c23a62f3a-aca9c0175a1mr77478066b.7.1744157712367;
        Tue, 08 Apr 2025 17:15:12 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f358sm987738866b.110.2025.04.08.17.15.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 17:15:11 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso36352466b.1
        for <llvm@lists.linux.dev>; Tue, 08 Apr 2025 17:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2Q7NkaNa9uYreALq4+bsUZKWN6QIRiYgsCfMw1iMpjDSgOkEXJHc43sgdlk/VK049S1IC@lists.linux.dev
X-Received: by 2002:a17:907:97ca:b0:ac3:ef17:f6f0 with SMTP id
 a640c23a62f3a-aca9bfb0d37mr81837666b.5.1744157710814; Tue, 08 Apr 2025
 17:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org> <202504081632.00837E7921@keescook>
In-Reply-To: <202504081632.00837E7921@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 17:14:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
X-Gm-Features: ATxdqUEzxdv_c924M2x5edBsLVmXTsnFzfYKX1p8a7EiZ3toGIQu_4WxIx108FY
Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add '-fno-builtin-wcslen'
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 16:33, Kees Cook <kees@kernel.org> wrote:
> Since I have stuff queued for -rc2, do you want me to snag this too?

Well, since I felt so strongly about this one, I already took it...

           Linus

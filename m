Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD3156E9
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 16:45:50 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-64f4ac604c2so23558246d6.1
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693327549; x=1693932349;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gd7wbDLNyz8eBHL7fGCPyOOExG5MY/ZyAjupuh5K/2U=;
        b=HaXmMM9EX6NG/E/ePntVX4MvLS/9Bx4fRXcv7ussLeXTZOdZOS/LqfmjBM8ohryTt9
         wvBkhAnaAh9sYZ8KMb9StpU5wQ78P4J//rF2vCmv6OtBEmW4y6c0ZPzOV8Z92s1j465E
         6BJQVeujYC6QBknB+9VhksHfV8vWWR+U56HltBfS8MYs341LnooqP6sfzTMVDYPr7/j5
         5fYnCGD1dMdnL5Tp+f4DSIgcqd59EKNU52fLtXhcp8O8EhE0UZEjnk2CPXe36aIcNIvM
         BV7URAe3NbqVPg1m+61uFXuXgFuaxlMuqD2P2cHRbRALOrQUMeU1ntTM7eY2AQVVmjhM
         ukoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693327549; x=1693932349;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gd7wbDLNyz8eBHL7fGCPyOOExG5MY/ZyAjupuh5K/2U=;
        b=Xu1EnWOIf5RqL/XPjgFpYWZkxJDZRfBqrXOoN4s5po2eV3Z6v8/7g2KIhj2vk2yc0f
         tDfASsxNPpJnjjQvgUuH5XexePfm2TIJXLgg4kjqk3kvEauDTkbYzyh5JShz/J5ZflCW
         esGGNF2d/z3gMJh1uIOW1AHWXZI58lTKiNSZrre38Vwh2tAdAoA6R8AImmXen+slM0Xj
         tAvRa39WfVTU42W+MCy4dKjSUNApd37UrdMZ23WI+pCvOegNQle5kINB3WkGBDJlGpCJ
         72BjYOrFgHlFnmESKp50nKpHICQyGQH4MRgoFaOEB3kDpoA748CzFgBPet3InV6OnXBM
         L9lw==
X-Gm-Message-State: AOJu0Yz8jtqzfDDfXXbv4Q13hbDdGAPqRgv00KwbglUnO8aUCulEMFgi
	H7dQiIJD811NTgS5ni6VJ0oFJXxjffaCc5tWGDdIrA==
X-Google-Smtp-Source: AGHT+IFMxQxI9GFxNCtBrC7GsH5CSI9yib7ImtOZtC9YNFMY9C889/jaH2b0JivfMTd74M/lUF+8Hsx7eUcoq7MLAFE=
X-Received: by 2002:a0c:e451:0:b0:64f:91de:2ece with SMTP id
 d17-20020a0ce451000000b0064f91de2ecemr7657913qvm.21.1693327548975; Tue, 29
 Aug 2023 09:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Aug 2023 09:45:38 -0700
Message-ID: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
Subject: truncation in drivers/video/fbdev/neofb.c
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Helge,
A recent change in clang made it better about spotting snprintf that
will result in truncation.  Nathan reported the following instances:

drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1963:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1967:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1971:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1978:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1985:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1992:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]

https://github.com/ClangBuiltLinux/linux/issues/1923

Clang is right here.  `info->fix.id` is declared as `char id[16];` so
indeed string literals like "MagicGraph 256AV+" indeed lead to
truncation. But this is declared in include/uapi/linux/fb.h; I assume
those headers cant be changed? Can the strings be shortened then? Is
it perhaps time to delete this driver?

I see AKPM mentioned alluded to this in
commit 0e90454 ("neofb: avoid overwriting fb_info fields")

(Also, snprintf probably isn't necessary for string literals that
don't contain format strings)
-- 
Thanks,
~Nick Desaulniers

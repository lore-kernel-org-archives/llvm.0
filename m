Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BB433B5
	for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WudVkIjc"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b4bdb89177so701048b6e.1
        for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1700064046; x=1700668846; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eFmbaY0oGVZ7sScVBLanmu7D2D9vxvb7T+NtcQ3NkJ4=;
        b=WudVkIjc130onkaO+a2kazMPFg9efmmhjTnJ1rb7b/pEkQrxbGh7rhBB5ylIeTd9yU
         ZmL1zvFFsDGA00xU1f/yBW7WnmdUQoi2+BZCWJeWpPcLO7CbJVhPMI9ENPVA4nCd4pnG
         tDgjDB2JlVRCd5H3/Ww8YnBpl1Jm3wkBikKTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064046; x=1700668846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFmbaY0oGVZ7sScVBLanmu7D2D9vxvb7T+NtcQ3NkJ4=;
        b=oO6c50j6GxOoGrFdYxUwjOkgHgyRm6eLIr2ahEalCZiOnPiaTgGQLq+QSuy08NjeSI
         UVrKTiUl47t3xwAVDAGY9Umt29oRd60OW1DMDUeKKcvhwRmGcnC/VPv/JT3YdhUeJbyP
         E5Zv49rTiQBc6KnXUUVMUM/BoRhiYpt76u12kSIHkfaKwoEP6IrPgOfNiX/595MhcHkf
         abxAUuHAdLbPZyz9jDYBuXVqyyKYfAb9fUOiS8qwGvkE+g2vppW5zogvieHv+8k1XRnm
         UnEJFf910veXTo3vyMFckpfa0qjn3AkAPmnm3soztdO3dmsHr1D2kHOFpfPOrMTV+mwW
         j4NQ==
X-Gm-Message-State: AOJu0YzrKL2XvlPlI8yttz8Yaeeg68cmC8WEjQZCe8lpxv0dzHyqRC89
	sCKbgIjtx9klH6mHdA3vkau4cCjUf5uDdVSXiX5lxw==
X-Google-Smtp-Source: AGHT+IEC7e0xzEZvfFar3WHPgtO7pOAY07ejbJf+y9ARFz7vkcAW/xxvlGk01OR2uItXzOvVmoLvaArE9Pf6m0XXx+0=
X-Received: by 2002:a05:6871:5c47:b0:1e9:bbfe:6458 with SMTP id
 os7-20020a0568715c4700b001e9bbfe6458mr7237902oac.1.1700064046168; Wed, 15 Nov
 2023 08:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com> <4e0c8bb796a67af5fb901f831c5f87fe.mripard@kernel.org>
In-Reply-To: <4e0c8bb796a67af5fb901f831c5f87fe.mripard@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Nov 2023 17:00:35 +0100
Message-ID: <CAKMK7uG-FH6iLpNpQ74xXPZoyGoDGvg+L99oCK3nFZT43o6GcA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kunit: Add a macro to wrap a deferred action function
To: Maxime Ripard <mripard@kernel.org>
Cc: David Gow <davidgow@google.com>, dlatypov@google.com, 
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Arthur Grillo <arthurgrillo@riseup.net>, Benjamin Berg <benjamin.berg@intel.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Airlie <airlied@gmail.com>, 
	Emma Anholt <emma@anholt.net>, Kees Cook <keescook@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Nathan Chancellor <nathan@kernel.org>, Rae Moar <rmoar@google.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 16:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, 11 Nov 2023 04:08:26 +0800, David Gow wrote:
> > KUnit's deferred action API accepts a void(*)(void *) function pointer
> > which is called when the test is exited. However, we very frequently
> > want to use existing functions which accept a single pointer, but which
> > may not be of type void*. While this is probably dodgy enough to be on
> > the wrong side of the C standard, it's been often used for similar
> >
> > [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Daniel Vetter <daniel@ffwll.ch> for merging through kunit
tree, since I guess that's the simplest way to land this.

Cheers!
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

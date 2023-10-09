Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9738DCB
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSarhJpz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27ce160938fso128924a91.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881100; x=1697485900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=iSarhJpzlZ8JbQl+QOQ8zCj/d9y+4WgtpQKrVGIwsEOcxiZlB7sqvYphP8qKHe2htL
         1awThamgJiUpVnT4bHv9+rK7IDV4q+I4c4o/yQ+TVsBHMXIOzX3V4Y4OxaU0TlrFzuaE
         CHbysyI10/g6t6MezcNBq5ZHFH8Qp7tyvIrVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881100; x=1697485900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=DJOBxiY2sThUSEUhlylJ5jbE62VRDCSsenyAlqnKx8KVh2Wz3NMPiqTQqtyk155T2T
         svQtb5Q76KOHSrW7lyHkUxNqMHzp1VfaH0GWp8J6I6tT/MXCJX8gnj+ZZ2p/pO13HRzS
         0vadHdAUvrREstNc1li8XqVMKP5mR0iHLtmN2wiaoUGcW5ummreohaHst+GqRJkimUDs
         C8DNRXuj6OXvC15ESv/jNpNFjJmXMjjA7XMVAMngqfT4tsS5ZcpVCtTz+/D6d0n8Q+dF
         BaRCccGRAOvAKTfADc0vIGHWyS8Mx4wDBTnxOwpKA5301Fcv8K3dOjlsV9tqHfMPKY1t
         r6+Q==
X-Gm-Message-State: AOJu0Yx/s0RhPA1SGdHQC1W6yWRyc8t5aQU9Jnx8IE5Gh/RTeNaHYOmz
	RxAbXNZvX9ffKmfu5Wrfw0g+jQ==
X-Google-Smtp-Source: AGHT+IErKu5nijcGQNO4C5TTmPCzq/DLxiROmTLvRJ5rM8E6o7Mvo2fsCJGqYmjn1eMmUSEOjczf4w==
X-Received: by 2002:a17:90b:4d8b:b0:27c:df02:88b3 with SMTP id oj11-20020a17090b4d8b00b0027cdf0288b3mr787340pjb.8.1696881099801;
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ct19-20020a17090af59300b0026b3a86b0d5sm8806769pjb.33.2023.10.09.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:51:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310091251.B877B4AF@keescook>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
 <202310090958.27F5025BDB@keescook>
 <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>

On Mon, Oct 09, 2023 at 08:43:44PM +0100, Mark Brown wrote:
> Off the top of my head I'd say wait at least three weeks for this sort
> of patch before doing anything and then prefer to do a resend, that's
> should avoid most issues.  If you're going to just apply things yourself
> I'd suggest waiting for -rc6 or so before doing so (assuming the patches
> were initially sent reasonably early), that does seem like a reasonable
> backstop so things don't completely miss releases.

Okay, sounds good. Thanks for the clarification!

-- 
Kees Cook

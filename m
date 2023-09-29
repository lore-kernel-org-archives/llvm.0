Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F66669B
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:21 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso110576245ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015281; x=1696620081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNsDO1TdEpCGLaLxGAq/gTTVsrbL7yU9yl9SCIkPcCY=;
        b=S11CvAWJ/6JL2xF2HibYU+6NyImCBy8e+2JgUQuXuRWwFmN7Wwaby+ajfZgkyX6+lD
         j1zaDGsQFmNs0//Ghp3MIKnpjDT62Xx32OdFRA8rrc7+IjJkjL88NmZ/aoGQLUKohedA
         fsOsOywJ6KnhIuLcT3M6SvvixfmQoLsqDFYB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015281; x=1696620081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNsDO1TdEpCGLaLxGAq/gTTVsrbL7yU9yl9SCIkPcCY=;
        b=OFzbRltYLbc+uxfFA58StvYZqHGUgvhl4sXZ9KUJ+3d70mYijzBF8FoFuMoHBi4miR
         UAldyAfAPYKG9aM433WmM0dBUlpBxaNTVSz5HQS9g8QvJbyj/phiYWAvbqp+panBBkz1
         jh2Q4JFw86ny8Z6D5IFImExQ7mL1ZAwK3GnBoHGT9ku2pEUsQMr0QtYqu0E92A4USzl0
         PbodQr5thYXR4X8LCFn52YbnbsgMIudDLqvgTQNy+1b29fFCPvWB3j1tSHZuUx63RlzI
         /i/6r0IMBZCgY/orDvJHF8i+rslnwcN4G1gVXQ+Q7WIpKcNoquonp4L0lMXy2S76UFfO
         igww==
X-Gm-Message-State: AOJu0YwGCOMg/h4NZJmzH+urybM1Nnpah+hgC/5y947IaBXNJgZixS2O
	fkJVqphQT4PHVTrd83n2w8+6eQ==
X-Google-Smtp-Source: AGHT+IFjyLlRRTeaeUecf9XWMNrkK0uGGpsZzK0vctMS8QPYI0ipJfXP8O++f7NHEfdRJEQBswkXCg==
X-Received: by 2002:a17:902:c409:b0:1c5:ea60:85c1 with SMTP id k9-20020a170902c40900b001c5ea6085c1mr6240720plk.12.1696015280740;
        Fri, 29 Sep 2023 12:21:20 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l16-20020a170903245000b001b89b1b99fasm17247784pls.243.2023.09.29.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] usb: Annotate struct urb_priv with __counted_by
Date: Fri, 29 Sep 2023 12:21:10 -0700
Message-Id: <169601526966.3013632.8979451725349830093.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915195812.never.371-kees@kernel.org>
References: <20230915195812.never.371-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 12:58:16 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct urb_priv.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] usb: Annotate struct urb_priv with __counted_by
      https://git.kernel.org/kees/c/a5683963b3f5

Take care,

-- 
Kees Cook


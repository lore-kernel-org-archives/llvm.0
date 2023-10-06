Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5143ABF
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2PC9f+C"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5789de5c677so1702763a12.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624092; x=1697228892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdDFi4NoIdKfky4gxD+eJQUbrV7mhgqDmFd2bTgvDgw=;
        b=G2PC9f+CxWpqze5mJ0GLRRD3VN7g+RrnGUzoM5WbcHj2oObKVzXxpOjsgm8UlsrMWS
         wLkRPIbgttKXep6XYokv9AYTO4UJ6pASfShLK5wJaKjQ2chR7Ftjbo1tuJ7aqGwtQB5u
         cgYuxIl1CEG7OgirA4/YnFINQrUtwoQg3v8yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624092; x=1697228892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdDFi4NoIdKfky4gxD+eJQUbrV7mhgqDmFd2bTgvDgw=;
        b=By5PVkkRQKAurmVMdj+fr1sfdbc4xkDhEa22jFnGNcPTubePsGl3ZyQ4ta4Hkan5vT
         mGw6nLu1y9rlvoifUNuBEfOgxbn12kt4YqdxhLXIz3YP6H8Z0d5KU/O3veVw29UPJ5BP
         8tKrDL1BZK34cOGdLNp+LFBwojPgTDvjA1/Z45Pe/BlGbhp2HghepxQKc2LS7gNwalpi
         x+/WI9xIz3/c6BDQ30od2bqMF/RlB9OBjXRTy8yTgZ+ghyPMKkokQblhpjcg+ZEU3xrf
         ZTcPKemUqxYtJpU5TeDaq9CyhjO1BYk2sNasvScYdBNRMNukZPj1a660vLdAOp084DOH
         YRuA==
X-Gm-Message-State: AOJu0YyQaTRkAJ6OwUw7fFNdEbMB7gTCky8dQHhfVKXF6xUGu9MymMpM
	z+TNGLhcmZb+EBoQ5nrbmVa9gQ==
X-Google-Smtp-Source: AGHT+IHzavjcegg0su2LV3PG5i2JGplCgrkDJGkfhDYDgXFWCha9xijJu8LR4T++xQ/Q93fkWVoRgg==
X-Received: by 2002:a05:6a20:3952:b0:163:b85e:631a with SMTP id r18-20020a056a20395200b00163b85e631amr10348902pzg.39.1696624092561;
        Fri, 06 Oct 2023 13:28:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ff18-20020a056a002f5200b00690d4464b95sm1974172pfb.16.2023.10.06.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:28:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Kees Cook <keescook@chromium.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: allegro: Annotate struct mcu_msg_push_buffers_internal with __counted_by
Date: Fri,  6 Oct 2023 13:27:57 -0700
Message-Id: <169662407189.2154681.1298231079393484992.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922174935.work.699-kees@kernel.org>
References: <20230922174935.work.699-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:49:36 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mcu_msg_push_buffers_internal.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] media: allegro: Annotate struct mcu_msg_push_buffers_internal with __counted_by
      https://git.kernel.org/kees/c/63eed8dcdf49

Take care,

-- 
Kees Cook


Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610066DCD
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:19 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-565334377d0so11120343a12.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015279; x=1696620079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCv+kMrx/0UVGQCBQ46tqfp9gvNT/0LM2qgPxtgaA9o=;
        b=AbGrwaOhVMiMwjSjGGiPYplHFPpoz0JFw6VOCNow3jH1XfHcbaW9EKg/iwqbqVPTH4
         8JbFlZndrlgI6zs00f1ELKxGvg2jhFNP5+UpkzygbwA+x3lyrP6AUdXwIjHS/sNQ24M/
         cggRVA5CS+kN5BAc8s6mm2q+/lVmlxIcteGvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015279; x=1696620079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCv+kMrx/0UVGQCBQ46tqfp9gvNT/0LM2qgPxtgaA9o=;
        b=aiSijoWTg5ryzu2oX/E8jJEJ1gHl2JWhytVy9QDJcr6bAV8ZmOiRSsFOkgMau4Xryu
         lDy2Sjqyj1ir5niZqHr7RH+qurpzMnMzdWlcTAvgqe7Co3znsGwIdjV6hsfJkYgLSt1J
         V+cFBGpL419anG8L/4vb/rmcj7Eh97uXfMI8qMCb4pW+/1jwFvvWixFicQxrRpimTWwP
         GwF34YS0Pz6A2ENiwlB8FrWz30lb5Xz/MBjC+QrCZ/BKU67qTH6d8JgArht1AhPoH5Pw
         gLZArhBFH44JSetleaGiK0odEGBsK3fFF1PVOoRTula5SYMGC/getFr4ZkN2Nof3HqsJ
         4rNw==
X-Gm-Message-State: AOJu0Yx4dMYqb/siJg3PC9INIeLsU/VDXOffsgK8dML8ippyGqmBWWcC
	pWt56MHWSDNWcXT7KUNCQzXXVw==
X-Google-Smtp-Source: AGHT+IGiBwStaHPR44R6ANK1/tkrYWC/2DFh5Z+5BULeXdWKDr6O8WVqqWNlE6Fy+1azpzu06/HF2A==
X-Received: by 2002:a05:6a20:3d22:b0:160:a752:59e with SMTP id y34-20020a056a203d2200b00160a752059emr5701827pzi.40.1696015279415;
        Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y7-20020a637d07000000b0054fa8539681sm14767022pgc.34.2023.09.29.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: John Keeping <john@keeping.me.uk>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Jeff Layton <jlayton@kernel.org>,
	Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>,
	Yuta Hayama <hayama@lineo.co.jp>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Annotate struct ffs_buffer with __counted_by
Date: Fri, 29 Sep 2023 12:21:11 -0700
Message-Id: <169601526969.3013632.10440475414357366621.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915195849.never.275-kees@kernel.org>
References: <20230915195849.never.275-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 12:58:49 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ffs_buffer.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] usb: gadget: f_fs: Annotate struct ffs_buffer with __counted_by
      https://git.kernel.org/kees/c/84657a30a0c9

Take care,

-- 
Kees Cook


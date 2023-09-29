Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43B6588D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5ff5f858dso84789735ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015278; x=1696620078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+9SXcyvjGd+Gta4/O6IN/DD1n96uskx63gniN4z8Ko=;
        b=LEM9b5Z/3IaUkLpDWAWhLgkOGwg3kiBQtF8Jkwku6GLMKbEu75wOJmEryvTJKdVBp7
         SLmMekjAVNPRZqPlOtYd+lc/bsTTFsIn2xDd1Ei1x//NJrm1rpJ3WKMz+ZsfhTeEPgvR
         SAtD6mmk2ZmVw/WNJDRcofyZdfuhLKC9EVH3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015278; x=1696620078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+9SXcyvjGd+Gta4/O6IN/DD1n96uskx63gniN4z8Ko=;
        b=xMMFcKDDlspCeg7SYbDHYmbVb7jOH8kfv4I4eJgrs3BYPl9UzvNWk2zZSANs/HIXju
         2vH3ZdIUpY2NNE2FysF2gAYwJmhHNZ3NNkYjIl48yECdbhD7Aba5TOj+0PnfQK2Waqm7
         LulqtfOMcT9TTkAHrdLDjRRjpoT+2FDmWAZRoL3lT2aki5J0dTIxeQW+0LuGodfUTBUA
         bafw/1LA9WV+/E3Te9lCCsBwVnbtYtu4E3V5TBWrGBjLp7J9J9LWinkU7SHcTEwjGwki
         dKQDETG/kTsFEFCbZNklWzOiF7MpIWttj0/w9QAmhFutVkun8xtFMlXBMLV+SHM/oVwQ
         PwEQ==
X-Gm-Message-State: AOJu0YxUvN23tlgOf0Kdj7mJ3Pw3OktFOPD36IxVWKiROJY5UHdCNfbr
	4XbuYd8aGDzOyf5R781Q64V4OQ==
X-Google-Smtp-Source: AGHT+IEL4QFJkNtYGTd3LQFr4m9MDVzMcU8D/M+Brl5u7rqE/vHdG8ltVoVEVCzLGwOap+25wTol5Q==
X-Received: by 2002:a17:902:bc4a:b0:1c4:486f:5939 with SMTP id t10-20020a170902bc4a00b001c4486f5939mr3964184plz.3.1696015278078;
        Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902f68d00b001b54d064a4bsm17218730plg.259.2023.09.29.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drbd: Annotate struct fifo_buffer with __counted_by
Date: Fri, 29 Sep 2023 12:21:08 -0700
Message-Id: <169601526972.3013632.16591134753215081850.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200316.never.707-kees@kernel.org>
References: <20230915200316.never.707-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:03:16 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct fifo_buffer.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drbd: Annotate struct fifo_buffer with __counted_by
      https://git.kernel.org/kees/c/f246956ca8f3

Take care,

-- 
Kees Cook


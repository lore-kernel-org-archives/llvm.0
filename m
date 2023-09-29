Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEA66DD2
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c63164a2b6so7685625ad.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015280; x=1696620080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aEgZXilDM7YqBibwIo+3j857Ar2xHuwGZYUU0Ocu+c=;
        b=Loq9eXV+W8o9cM8zw09YZ6jTcomZRl6NPJNvnN9qidw8NiNRSZgXcvZXgiDxrlEdM5
         ccKIU1N1tnLzk22PtcwqHeSCvx0uYUU/5fb4aA6Zmbyd44pOP2soBDf0FS3jPeiUZECx
         GEQJ92dILv9/OvgBX2lBm+yl8XewNOUWJSRqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015280; x=1696620080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aEgZXilDM7YqBibwIo+3j857Ar2xHuwGZYUU0Ocu+c=;
        b=PUriPu4M5UeFmdJtb1lJ08pUplTSjG5C5YD1HPSSoeFKsHtZr7Cne4KXxJLmG82EkY
         52X6O2IOdoD0Vu2cP1N1JdUNU01dQgT0jFE+YamWXIsgQp36a/znQ2NxthV5xuJHCWtw
         uwmXb3sEwbYeA/p+c6WzjIxo6EWKfNrUgUl8cGgAqQqXTrsXVozAHpBhHgQVxV+lHpAU
         se3uy2BgFxAI/+Y+9/8Vo+/enxwxz/GaCHIzQGusBmpu01g+jg3cHew8wOHX9lQvnyFG
         YbaQOtkuhc6s6J9TwQhMDLjXWfe/GBC7+lnqL7knAzcnFLXswIV7vYs2/Ne+jRLBNrTj
         e7Kg==
X-Gm-Message-State: AOJu0Yxv8ifjtt/lzgm6MEB6LYYdu3AvzVOvPh+gva2mm5EJy0kVK9EJ
	aUpNARsRiBBmU3om6+unNX1c7g==
X-Google-Smtp-Source: AGHT+IG2g06b1pAU8D9HLnGJFm+KvBiJ8WwyJ5eZb/HgchXrkfd9LQ+8XwPTFdERaFnnLTfsp/xOhg==
X-Received: by 2002:a17:902:a416:b0:1c6:362:3553 with SMTP id p22-20020a170902a41600b001c603623553mr6067189plq.31.1696015279776;
        Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b001c5fc11c085sm13354610plg.264.2023.09.29.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Song Liu <song@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: linux-raid@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] md/md-linear: Annotate struct linear_conf with __counted_by
Date: Fri, 29 Sep 2023 12:21:09 -0700
Message-Id: <169601526973.3013632.16756928162777602693.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200328.never.064-kees@kernel.org>
References: <20230915200328.never.064-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:03:28 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct linear_conf.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] md/md-linear: Annotate struct linear_conf with __counted_by
      https://git.kernel.org/kees/c/9add7681e09b

Take care,

-- 
Kees Cook


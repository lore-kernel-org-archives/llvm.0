Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C520658BE
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:17 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-692eed30152so8046119b3a.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015276; x=1696620076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+JwqsH6QF4VOv5yHrt+J+oPhRZNhTjhOsyT6TXu7Bw=;
        b=SkS5u3ccdnK3Z2IIdDg0WmYxF1q8pfADRhlpj3FQDef0Byeo7tDAzSGmNNl2UhsMC3
         z7pwfPGXhRKeXvRJLF8gOqkGZbbYQxcW7v/lbRwBHAy7YUu/LIirwGxk498j5q+k4B0b
         OtxKVMkGKPVu3+fZSHSs3dgqVXjSohoqS1StE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015276; x=1696620076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+JwqsH6QF4VOv5yHrt+J+oPhRZNhTjhOsyT6TXu7Bw=;
        b=vQVGhRhQh8vQovNdVAjvrgSVnoUm3oJ9d8OtJycZbQmc8AMMpSGPTh+ImXbuI8wXfi
         1PFo2YOODLG/yjxVpQ/PobyR1PX8V7/hbCqPVlbDuYW1YHNOalnF+y+4vQxiDRLRiiPG
         w6zbLgmm7fCCcR1oFIvxxZUgIadmZl1cwTkeJRUw+c7Pas+tXvAuYGO8Bf6zA+RfxcKW
         gW+8/mekJmif9kzvB+iGCqlNGhkB7G45pv3eLm9u1EVpIDlbtuJ9UV2/895uuR9EzEoc
         PgsBlVu6oLGje2iNr2iUsKsZJjcjyfratY6HnQFxPlTNwnWBnmeqmtC6eMPBnVowuaGs
         8fYA==
X-Gm-Message-State: AOJu0YxNcurpadiFrnEiP16C4rn5u1lhSgBeeKHiI65Uu/IsSpl1qDl5
	j7PtdlRwFf9gTfKeGsTlMqeunQ==
X-Google-Smtp-Source: AGHT+IEgcLkzDCaWGmIBtqvOf11K/aas1RfwhznJoxkvK95mk2Nx5WuE98B3wrHbauF8RteAbPkdwA==
X-Received: by 2002:a05:6a20:8f02:b0:140:730b:4b3f with SMTP id b2-20020a056a208f0200b00140730b4b3fmr6546747pzk.1.1696015276710;
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00672ea40b8a9sm15729140pfe.170.2023.09.29.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dm: Annotate struct dm_stat with __counted_by
Date: Fri, 29 Sep 2023 12:21:04 -0700
Message-Id: <169601526975.3013632.10720424703998827212.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200400.never.585-kees@kernel.org>
References: <20230915200400.never.585-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:04:01 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dm_stat.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dm: Annotate struct dm_stat with __counted_by
      https://git.kernel.org/kees/c/e9d842d479ac

Take care,

-- 
Kees Cook


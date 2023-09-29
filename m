Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D666666
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:15 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c1ff5b741cso130915515ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015275; x=1696620075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzGyz2MPegojcnBn3+M4x1lpZordUMqcBYgQWes42EI=;
        b=KImRLHkM5skyLaZCMkDpdaQbpZvDshgHp4ecWbia9/GPw2Mu3nvvT2qETytPPVTWMV
         JWtNAKVBy5VXgyDjgN7/D8+eV8xbxXW8L+QNWmklgeq7FyCYPrB+uK/OD7SEEzO2Damy
         HDl3ocP52tk7+ltOgkkuLaawjGaEh9ZImq+yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015275; x=1696620075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzGyz2MPegojcnBn3+M4x1lpZordUMqcBYgQWes42EI=;
        b=tDPD/ct9a0C1g9JZ5j0ciSpt7EWkwB9WdYFovgqwWZQOag8czbqNxDKbzqTi0qkNcX
         oVr+q6GQMKJJhxogqPIx7JN4mUJJzhGTnl97JU6b8E/C36EQv2Wx8TIID4CzdTyUaF2N
         Z1Tmur3T3zbBrXr1taQQIwWnSII7ssBYqUmj8QKPbKzI4jSw1x8OTS3tTLzTu+qXRzgo
         YXZX/GexxQ6SMKvCoeZHldmG2HcqjH+s8jvjfSH6z2aieUa5hDNLJQrSJbpGuS322V0O
         AZxGdwsaIkbh6IKXEkQGoceiBTyxtspz9Nufu3e1GW/w5NK3fpZGPzBcRvJ4MWyPN5u+
         d3mQ==
X-Gm-Message-State: AOJu0Yy9yWKxL6nd13I9FmvphnIN1wOWOoJFE+QCyXPCrYP33ZjvLgrO
	YL+kWtjgGj8vP+NXwsUBlk+bXQ==
X-Google-Smtp-Source: AGHT+IFjwoljz7qSuEmgrS2IYGOuTuCN7jnbI2kAUszFu5hBRn1FsFvHLdskqcLbQYPnmal7cixZdg==
X-Received: by 2002:a17:902:d30d:b0:1c3:3b5c:1fbf with SMTP id b13-20020a170902d30d00b001c33b5c1fbfmr4888238plc.10.1696015274991;
        Fri, 29 Sep 2023 12:21:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902744a00b001bc59cd718asm11031537plt.278.2023.09.29.12.21.13
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
Subject: Re: [PATCH] dm raid: Annotate struct raid_set with __counted_by
Date: Fri, 29 Sep 2023 12:21:07 -0700
Message-Id: <169601526974.3013632.14322525126930729466.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200335.never.098-kees@kernel.org>
References: <20230915200335.never.098-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:03:36 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct raid_set.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dm raid: Annotate struct raid_set with __counted_by
      https://git.kernel.org/kees/c/588cd9b20862

Take care,

-- 
Kees Cook


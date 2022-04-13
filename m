Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050CA291E
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 19:26:43 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p10so2776213plf.9
        for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jf/ZCTZ5Gt2jVqN46dFAbZd9GqgtwDVJ36AS2dLx9QE=;
        b=fDivrUePV7M5M2U9uoSiSeosNah6RKsS1lEZDEDtTtdJ5JoDGOjQVirldSum93E/03
         aor33I8b33rmWXERSUDFzQDlz4xm+t3bXDzkQr1IoDv2fc9FJmmsJpZgtzm4kZkM5y8S
         4AV0eKhTgzGC6KzpOIPEs5CzCZmL+rf86NQeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jf/ZCTZ5Gt2jVqN46dFAbZd9GqgtwDVJ36AS2dLx9QE=;
        b=PHwE/VHItuE5rn661zprxyOKBo24p+sou1xUq+z4kKntgtnACswn1yxVqA9j8VYDNr
         PXLPWF+w7QZ/u3P77Ou2Qop66Tcy56wAooBCFRUYtl/blUhOUAf9PZ5XwIzniERho03z
         YhrCAJE/UE4e1trVYsS6j1Tn2d/x/eJbV6OFxudpPXkbDKA7W6+O/9EWfPP+3FGq2TUq
         jHUK+D2FlMUPjDW9KDO1M0BgWLXG8Ka7rrQFPQlcDzAXrJWWRy8U9IQhQoFtcnvzCRXp
         HqRBlv0tddja9nRsZjkQY9AEA8Jm64la/NBnzhaDsHZF8NinLLsqjcJKHffdtI43QUZm
         kqQA==
X-Gm-Message-State: AOAM530C1880mIg0HEtTUw09xLqvqXZ8CdYsd9FzsVG6+6U4QSvvERxx
	cjm6T72/bTDh+Fy0Ow5+97Vv3g==
X-Google-Smtp-Source: ABdhPJwsDOGUzvY9tZ6EmHG6uOb71mNsqBiP8D5hYRNo/rNgxu/k9B4PViksdjKiE4djMDXlMlspSw==
X-Received: by 2002:a17:902:d884:b0:153:ce8e:66fe with SMTP id b4-20020a170902d88400b00153ce8e66femr44113768plz.157.1649878003377;
        Wed, 13 Apr 2022 12:26:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004e1414f0bb1sm45505437pfl.135.2022.04.13.12.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 12:26:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: samitolvanen@google.com
Cc: Kees Cook <keescook@chromium.org>,
	nathan@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	ndesaulniers@google.com,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH v2] cfi: Use __builtin_function_start
Date: Wed, 13 Apr 2022 12:26:33 -0700
Message-Id: <164987798634.655998.2445977983913600905.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405221618.633743-1-samitolvanen@google.com>
References: <20220405221618.633743-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 5 Apr 2022 15:16:18 -0700, Sami Tolvanen wrote:
> Clang 14 added support for the __builtin_function_start function,
> which allows us to implement the function_nocfi macro without
> architecture-specific inline assembly and in a way that also works
> with static initializers.
> 
> Change CONFIG_CFI_CLANG to depend on Clang >= 14, define
> function_nocfi using __builtin_function_start, and remove the arm64
> inline assembly implementation.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] cfi: Use __builtin_function_start
      https://git.kernel.org/kees/c/e6f3b3c9c109

-- 
Kees Cook


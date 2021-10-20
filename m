Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77282C8F
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 17:35:56 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id kk10so3006048pjb.1
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZU0CzHjZqgy6QBSitXFMa80Tv4uRu9MQakGYwJwWt/U=;
        b=c6/cMfcgmDu7wrlCQvkpDnTEMcB3eyHmy62eHknNhqrmqzlwOZwdWcXSX9tRwwE3op
         fP2y06G96MaP2Ka2jb/Rn6u9NmzO7uLEN6qF27gCbesZmxDI2NHrgFQBks3jAUr/nZAu
         JK4SGunKgL1rU6EcSiEGGAJZlSsVfQLBQ/tWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZU0CzHjZqgy6QBSitXFMa80Tv4uRu9MQakGYwJwWt/U=;
        b=LZfvqHr8gvn6xc3Cu1hDnD9P3tq+cjtGsbrQcjz7SKYTdsHNPTfiSjZ4WoAMMS70Lu
         IknnEC9QMMtoxn6fgpXfhRVNKsFxAKwarlr7nFHc3DrlaEbQnHo5tkvM4N0VrhpAgg9s
         /MegnJTL+han6nhAy5Uj3q7QTziqepvRUHIoDi0EPkfaVcU6NaJC4HQTkQfznWF5Adi6
         4npPxQ4hm/Pu9B6j+k6l1nS9XaN137vWPt00e/NKF13+arY2BrZT6U6TylWzF2PWRzGF
         xvGk5UvcqqztP0/kEcEp3p4tT2OgInj1jSTSwvD9vAkLipumda0nlNqvavPdtLsV79fk
         4b5g==
X-Gm-Message-State: AOAM532s7I61jJIx3VFy/OV/QdDarykYx53Qgt041ldz1zt7QIf2oEsj
	RrlO0WLoS9qi+Wsnj0Tg1Ncfeg==
X-Google-Smtp-Source: ABdhPJwxjmhxwtVVhnG5Cb8sIy1txSJ6l+QOFPga02mOtLur2dPGRmtusTkXH+R+HEi53dWe8AXdEg==
X-Received: by 2002:a17:90b:193:: with SMTP id t19mr379663pjs.95.1634751356548;
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id np17sm7409475pjb.7.2021.10.20.10.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Dan Li <ashimida@linux.alibaba.com>,
	ardb@kernel.org,
	ojeda@kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] gcc-plugins: Explicitly document purpose and deprecation schedule
Date: Wed, 20 Oct 2021 10:35:52 -0700
Message-Id: <20211020173554.38122-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; h=from:subject; bh=rdx4CuMikFQKdDYacNmYRAtQ562gbZptpLcWVVcwDAE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhcFN5/5kSB2NJMC2aEHhmi3yPJdBz+zDw+3m8KEeg m983EFKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYXBTeQAKCRCJcvTf3G3AJqwKD/ 9khEyOKqNaPmZpfVsYUuLt2y7ALxocah3HA2haUyFnlB81apI0SsajBZi6tgC082BM5qHGYqI8afAm Bg81+ba4xE49vEKcGRspCo6Ij9jeh3qQ6FcVd7dntdxA7LL0ekxsNoUAlA35Z3+OxIMf7TdJpJABf3 vFXZT7+1t+dLVniAlFofflTQm/XHHrtCQNR5fPXf2SODdkIf/x96d7bpN8i41dEskVhxkr5Kdv1qyZ tvn13GszbxhF2LXKCaMrFOR26zL+U10R3KIM/jJ6BeWrEXL9pnmJKwFubiRrM8KtcUZaE8w3er6AMe +Nh8V6KZYhrG1oDWiInARmtvNqXaxeegCVWj8OmwNgqAONjNd6W1hsb+8NFdpbA2zYplorO411l8rI 7HWi0FOrNKWCM1n3Y+JlXltxyhouc1ylTtAo0gWndrpaUnpBrkCato8gNL+9AQ602oIJGLhxLTfJwc tIq41BEDdUjXHnUp8r4mAl4H+GaEA5ob/aoZ0Eina3L58wnCbb4yKe8OmaF0y1qXxrxXUXKM89Hc6G cewD2LImYRLJ/oCcFEBnIRCu1GFnbcdlq5RY9gnCNfIQNQeutoZkLO7iYI2cB5sh/cBkGi99+RaxQ4 y76eOiibdFC6dmg0NuvgbQ1lLPH/6o/hseGJ49cqX6tC25gQpPQJawR5i2fA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

GCC plugins should only exist when some compiler feature needs to be
proven but does not exist in either GCC nor Clang. For example, if a
desired feature is already in Clang, it should be added to GCC upstream.
Document this explicitly.

I'll put this in -next unless there are objections. :)

Thanks!

-Kees


Kees Cook (2):
  gcc-plugins: Explicitly document purpose and deprecation schedule
  gcc-plugins: Remove cyc_complexity

 Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
 scripts/Makefile.gcc-plugins                |  2 -
 scripts/gcc-plugins/Kconfig                 | 20 +-----
 scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
 security/Kconfig.hardening                  |  9 ++-
 5 files changed, 34 insertions(+), 94 deletions(-)
 delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c

-- 
2.30.2


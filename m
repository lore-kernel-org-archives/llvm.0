Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780086667E
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:07:48 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c60cec8041so77448565ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010868; x=1696615668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytcIulEB3Bd0Lgb6X1DnmKvq+hrlwdq4lTgiyfurQ14=;
        b=RusNp8vGOCoHvQTogdKuIGqf+XBbfeF3CTFFHnXmwzD0wuUgaICAF/4GDJ015R05mM
         CJN0y+3mmt75PQ/E1v4QSrkWYKR0ImYhUELg3XsWwsKpD/JVgfWz8TRe21+PFIPMwv/H
         2gn/ZuuvOUeES2auIbZZMizJY1Ajhtfzy5fVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010868; x=1696615668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytcIulEB3Bd0Lgb6X1DnmKvq+hrlwdq4lTgiyfurQ14=;
        b=bIAI4MGgCxEhQbYSGEvzI3cYX+/aW+gE813djABx3tImSXiTB1vqf1Gy06kcvygTJo
         KkKXnHQBB1Wr3ArX+ggQdrks5CaG8EpJE9toJ6CnTv12qhkFMaEEeroi9/VPVkGZYiaC
         7S/nX5ys68D8KBVCZOsJA41o6k0XQomJcZHDmsAPQN5/ghYhxUnF5IuGYGR+FdA04t7Z
         +UmK+x2ePJMZEIrkPp3dR3/3rmBZo2vrEMzU9+LKTRZdc8Oq7YbDqDtqPl7+xd2wggMw
         ULluJILey7pZEJjK2zMxoDuZKvHtktRhYPNRW0q89ciEctyb/81KNG9uZaAb7PVSju+A
         RJMg==
X-Gm-Message-State: AOJu0YxrZsKP1NWhiONZvW/B2PFH4p7mKqeyqtlfiiMojegHwiXaXFy5
	GdyqYTsaDsQ+rAE/18ufpxc2rA==
X-Google-Smtp-Source: AGHT+IGMFNLTCNCtA/FqnKOTA460hZC6guf310Jbrn09vBZrg4EKduZUZHOzzcMy8xMUvOVnVjCeYQ==
X-Received: by 2002:a17:902:ea8d:b0:1bb:94ed:20a with SMTP id x13-20020a170902ea8d00b001bb94ed020amr4663075plb.24.1696010867805;
        Fri, 29 Sep 2023 11:07:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jw13-20020a170903278d00b001c74876f018sm1605993plb.18.2023.09.29.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:07:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Kees Cook <keescook@chromium.org>,
	Petr Machata <petrm@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/5] mlxsw: Annotate structs with __counted_by
Date: Fri, 29 Sep 2023 11:07:39 -0700
Message-Id: <20230929180611.work.870-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=keescook@chromium.org;
 h=from:subject:message-id; bh=GMvcoJa22FgGaZ5PVgWxKg4zkvx6Wc5lsJ5JwJVw2fI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxJvZx4KMD65V6zmNUdqeMe55R3rtiwTNYOc6
 EZZ9t3itwqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcSbwAKCRCJcvTf3G3A
 JilLD/9r7z+Y0akNEbzBq9UIK6u9F8wxjl2UhnrMWJV3dIfqBfLZuKWOV5DzIinJVsMdydRvZ7g
 LzeVXCUcQ9Y5xtrOmqzuO7qt1YrYJ2ivzNReGQNY37w5stJlTgoQECYYskZmbIzKLLHbd2PmXEK
 5PVWAtEQ9fgKUA+34HyZ7QplTHvqrrEYeCLOmrKWHvPAW/l+gl0+fV+CF0uEgpKOCk8LCnFlODo
 iBQDBo0ty6OqTWAItcqrMvAzf3DnS/LoznwCjVUtt8Qe4Z16eBkFFrrN09ptZlIGnVEZAI+CBEo
 NiHxE5nHwqvZb4vVFLa37SLJC5Zn0V+W7engScEuW+vmsaIbzyEDWvueXrbFWXxC5L/BEVjt5jA
 RLuI9pH223rzBSA/Fva1nt3P1MHUlopmO9ge7/lAZmSp5h6tYcdxQKOFSqgCmWRjHJttAjzx4k5
 EjHejSkET+0kGXK4q1lm5OYkUUNT7RJBywxrTTVB0X+v1ZTIIYW3kS+jqMsfI3GL8pCXdKig8eW
 lAVjor5R8hTWY5x35fn6Bn0ofB60JmP5BmukdqqVwACrrQ3tb5O0r6Uh/1YObqO5d7wbmd76Sn2
 +NkqwfKsUKtD6BPbF0eEX7oywwTZaKrYh7KjFV3vlVlMy4Wpf6Pt0NkFeGDzTA2RXe0LVTQnGok
 9cFR6xv keo3z+2g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This annotates several mlxsw structures with the coming __counted_by attribute
for bounds checking of flexible arrays at run-time. For more details, see
commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").

Thanks!

-Kees

Kees Cook (5):
  mlxsw: Annotate struct mlxsw_linecards with __counted_by
  mlxsw: core: Annotate struct mlxsw_env with __counted_by
  mlxsw: spectrum: Annotate struct mlxsw_sp_counter_pool with
    __counted_by
  mlxsw: spectrum_router: Annotate struct mlxsw_sp_nexthop_group_info
    with __counted_by
  mlxsw: spectrum_span: Annotate struct mlxsw_sp_span with __counted_by

 drivers/net/ethernet/mellanox/mlxsw/core.h            | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/core_env.c        | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c    | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1


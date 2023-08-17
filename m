Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586C1B7C7
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:15:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-565f58f4db5so234288a12.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 14:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692306935; x=1692911735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMv3jMfXfZeQlh3kTaF/x4qTfcNW/XdUdIa35ziuNSc=;
        b=J1b6KXoDvYCj93J82hNUfzOMePqIyx20asgvfw8HIrBYC9PQtriyzORw0vdYF4+R39
         iWtouRrtKVwKoTVR779ILkxd2+wmXCHXfEl4mQdb3YyVkHP0qxhS5ImIk7OhWfMifhaT
         lzD5DICKg8ck9C4XQbF81Lh+TIIdtD2/lzNFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692306935; x=1692911735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMv3jMfXfZeQlh3kTaF/x4qTfcNW/XdUdIa35ziuNSc=;
        b=jZtZum0RseBUQQ1PyZidVbPf0qm9B0rXBl4641ZSC0X9zSetvi08p07tR03Cf3ZoPY
         /HFprlmF00AiEolJCA8hzMR5sm7D+S13G1Tqjsh/BzoPclJALwMJO1sN1V4CeughMrOu
         TrNIgjhMhlR0yig4chaOdYcWjqYOTRNaHJxYq9/qAam9WZJfzRe3HgivLFoMjDofOBxz
         1golgHnsHD4Oyhw1XjWB8q1r055DlGXACQhhnzCII2iuducUQY8I9m/n0aYrKrsk4iaF
         UzhdWZx/ncLOQECEl0Q2HFjkfu9W1sANAK870YSfC/obf9qVmHgd3+OTIlEUdZMiNTj6
         moCQ==
X-Gm-Message-State: AOJu0YwtdE0h/Rsur/GIfWtpEScGjmOGCFkLRWLmkfn4Z3pktr7Hzist
	X4mVBHPSwutoJsdgTdpqJvACHA==
X-Google-Smtp-Source: AGHT+IFSRStXoIpZytSRGeOX2ux67DF7cS1Gz0NEDNhY067TSw0TiIcAkAihtDsDuM9L/+3asABlTA==
X-Received: by 2002:a05:6a20:3b11:b0:13d:ee19:7723 with SMTP id c17-20020a056a203b1100b0013dee197723mr939971pzh.35.1692306935477;
        Thu, 17 Aug 2023 14:15:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s26-20020a63925a000000b00564ca424f79sm134316pgn.48.2023.08.17.14.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 14:15:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/7] wifi: cfg80211: Annotate with __counted_by
Date: Thu, 17 Aug 2023 14:15:22 -0700
Message-Id: <20230817211114.never.208-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=keescook@chromium.org;
 h=from:subject:message-id; bh=yiiQfq7zNw6Og6zmPL90LK8+bep21Nuhy1wjHFcUIPs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3o3wfdi23SF0O9V7M5/FrNoppSrvOQfoI5J+R
 XT6vWdk1XeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6N8AAKCRCJcvTf3G3A
 JgwiEACXzetgKkVCfCqLwZYnasCT/VOWXlnKrOcsE3M9CS7umMyA5Ao5jkbdGb3iPaj5+695NnQ
 OsDcoof+1Vh27w8lVP186oygdRNYqLvIE1vs9ifMJZapnWrPbbFQ79HYl9OY+nS2JdqAE06A6Hj
 vvRRz8R6kfCnowm3pj9LvnRTcSKuloY5AuvwcgF0vqpzi0MeodvVAjEVnE4zXx89V5zoBOoWCCT
 y3JPlg3p7fHfyhyI0yfZL9EFDLc24rLEdVISCLc67qOBwAmHj1Bb21CfBN6BnQzsft/+bhpMucF
 9fVNFhEHAJd/1c6j46vYzMXLOssCSne+RwiBAJfGkfGANb5oF126fHTwS3wYoAQ8UBe8kYTJFSR
 APxiQjqcFkRUoJ228iVw1TZzrjlS0rrsodImgT3VT9uluwbmZwflgxq5WQN+FXVNjleRZQ32WUz
 7iqzQMKmV4P5k74GLeYqSoVOcV1tDuWgcBcUkz6APY5VF+AeCqM7NoeGIICIWNMJJjcFPHOOCtT
 qk6vSjoWuVXSt62Xl5iVi/cvJSxMOxTyTyRozgDS04DOb8p7C39gewH7M2A2XM9TdftpZhxuKR2
 UEfI5fQ3pj7qjCSHnPhALVrH5ABbSMaQXVYPC9KxgbsZ5i7+2dFQXx8jh0wC2ZU5Dn/fwPlN0/X
 pSqMQ6D R94ZOPOA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This annotates several structures with the coming __counted_by attribute
for bounds checking of flexible arrays at run-time. As a note toward
applicability, had this mitigation been available already, the flaw
fixed in commit 6311071a0562 ("wifi: nl80211: fix integer overflow in
nl80211_parse_mbssid_elems()") would have already been unexploitable
(i.e. writes through an out-of-bounds index would have been blocked).

Thanks!

-Kees

Kees Cook (7):
  wifi: cfg80211: Annotate struct cfg80211_acl_data with __counted_by
  wifi: cfg80211: Annotate struct cfg80211_cqm_config with __counted_by
  wifi: cfg80211: Annotate struct cfg80211_mbssid_elems with
    __counted_by
  wifi: cfg80211: Annotate struct cfg80211_pmsr_request with
    __counted_by
  wifi: cfg80211: Annotate struct cfg80211_rnr_elems with __counted_by
  wifi: cfg80211: Annotate struct cfg80211_scan_request with
    __counted_by
  wifi: cfg80211: Annotate struct cfg80211_tid_config with __counted_by

 include/net/cfg80211.h | 12 ++++++------
 net/wireless/core.h    |  2 +-
 net/wireless/nl80211.c |  7 +++----
 net/wireless/pmsr.c    |  3 +--
 4 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.34.1


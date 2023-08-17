Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD01ADD5
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:15:34 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bdbbede5d4so2109995ad.2
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692306934; x=1692911734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84126Krvj5It4jg9Q1uPzC9d5K5UntVoSjqBC8dGf2s=;
        b=BHz4qEOXdw40B8x8sOfWFvsckDK4ZpX1DduLsCtYUeDJHrXqjzAF9zFyUz0yA9PTh2
         eC/nGE41cN98MhDYLXv7g4Hg0mURamg+YmSIGtq1u4M3cEsm6Mlpm/buNulzWU+ZJe/K
         QrlwgfN8fE+5xgreRerXYyu0HuOHuVQC19cQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692306934; x=1692911734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84126Krvj5It4jg9Q1uPzC9d5K5UntVoSjqBC8dGf2s=;
        b=BMX6YijBgC2Ndtp1bPY1J5Ka+P2WqmMjSsF9PvLzEi8YJUchaPkqj82N9VeO38anbK
         jGLjQVRTeS/HizK4WKV/1TOYT6FfXhnsnf+YublpGSvRNeBrlS6lDlQ8nVBxNV808eZO
         +/Bk9rlPuQ2QHPrdJlvdYVD2lrjMQLhJGOAWnxFTvAfuOf1BOJxOKA690BP71GBrFaMO
         woeGtTSIRy/+LwzZeHb0uEtuMhp/OL14LTBOFcFCV5+0n+SQmMzlr5ZacIuybARJLAXo
         rJQoN1wN4EyC75sipOgG+UFby57rTVsxnG1My7ZIEnYy+zsaYRHshjwSPO+LXt4yo3s3
         AmdA==
X-Gm-Message-State: AOJu0Yxc2cnchRO5ocRmu/vCl/xGbYlFqA5OnHYlUxEDU1gpNFtBjXmi
	NDu6YWBvWlrDhWPSzF+mB6OGew==
X-Google-Smtp-Source: AGHT+IGejMpNDu5iUt5y4pkNg7hjNXDzs6GU7LUwzlDmA1AYeMtiV3uVhEVENEVbaoaSlRg1FcsTxA==
X-Received: by 2002:a17:902:f54f:b0:1b8:6987:de84 with SMTP id h15-20020a170902f54f00b001b86987de84mr625512plf.48.1692306934091;
        Thu, 17 Aug 2023 14:15:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090282cc00b001b8943b37a5sm223595plz.24.2023.08.17.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 14:15:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/7] wifi: cfg80211: Annotate struct cfg80211_mbssid_elems with __counted_by
Date: Thu, 17 Aug 2023 14:15:25 -0700
Message-Id: <20230817211531.4193219-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817211114.never.208-kees@kernel.org>
References: <20230817211114.never.208-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=keescook@chromium.org;
 h=from:subject; bh=vaWHXmxPO1ptoIqyZPI0oaQtbTFkYHcNqPSrVLO+Cyo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3o3x9Q72AWeO3iT9FoMZtrv2vw6MyWouRB7nh
 h1x+UnGyeSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6N8QAKCRCJcvTf3G3A
 JrUyEACKeu7bZ+6W17+6Csyy59kutbcaGWnWoZqfeNWCSYd8tAVhCczdJLuz9/B0R2QrXSpwu5n
 zpIIYGWYvFW7QaNN3Ygc4s35ySoSg3owW7TtTyaCr7IXyJoJ1XjqboBhARy1m1Xf2omjbw68BMf
 7E2D+pVCSVklqLPDnXGQGvI+wuRpG+nlQMh+MkQ7gbU4cE+qrDf2VGKADgzzqFCCtNjsOsm02ho
 R3Fh6czL/VlwYTGdoI/cmyNjZVZkxHLTxOQvl+18zGC/2AbLsX7QRbFN0Qt5ky6gUa0PTo2fW3e
 Z2tQLZDcpZhxgLxNp9sF9eKAfzzQoT5V5oxZ4oXka86BlvZR6b+OgYyFq75wNqabtdhPK02OTmY
 trw7lr+vgki7yU+3+OErnwg0WAMENH7zVcC4WcnpIxwTxaVBM4oFEhytGPLPfNGyfXfUPT5JRen
 ygp8TcPbp1bgT6ITfxI+mP3vMVDrZy0w+385fFnq9xUyJYou6HIOzlr3PXaP0Ya82tLq4T4cKoF
 xOsW6OcFPLf2zsF2H/IvlbgWExJEV3XI0eIz7UXg1axO1xs3z76pyLB1ZwRuOxepVQ9hP2jHT69
 3ihSRWYcbD7XS8UeaSsUR6HfR1YBJrG6hgR0zJDcMztj7DCNSiWrE2eolF9mGGG381h9598oL6j wLHKdDJFXPjvMAQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct cfg80211_mbssid_elems.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/cfg80211.h | 2 +-
 net/wireless/nl80211.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index eb73b5af5d04..5c7d091b3925 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1187,7 +1187,7 @@ struct cfg80211_mbssid_elems {
 	struct {
 		const u8 *data;
 		size_t len;
-	} elem[];
+	} elem[] __counted_by(cnt);
 };
 
 /**
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 80633e815311..9ba4266368db 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -5438,13 +5438,13 @@ nl80211_parse_mbssid_elems(struct wiphy *wiphy, struct nlattr *attrs)
 	elems = kzalloc(struct_size(elems, elem, num_elems), GFP_KERNEL);
 	if (!elems)
 		return ERR_PTR(-ENOMEM);
+	elems->cnt = num_elems;
 
 	nla_for_each_nested(nl_elems, attrs, rem_elems) {
 		elems->elem[i].data = nla_data(nl_elems);
 		elems->elem[i].len = nla_len(nl_elems);
 		i++;
 	}
-	elems->cnt = num_elems;
 	return elems;
 }
 
-- 
2.34.1


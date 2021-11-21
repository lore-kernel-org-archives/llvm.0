Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578A2C87
	for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 00:31:53 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so11088107pjj.0
        for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 16:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ziSoN8dNTceS+AEUygeTrOZSFAzOgkmX+sW8rsZZX2w=;
        b=K2jrqp914UOf51IOtnx+ES8SuLk84CXMFaJ6goSwfc+PK5+O8tuf52wIHCBXzOUYNr
         Qafjbc08V1SmTxzjKePvB4ra4AmSvGL6+45zFxMD+H+yqURo0YK6ksgOIdKa12x8AgKg
         Qc7iLfBbBG+eEXRPkrB+nQWJsdecnAvL9J6ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ziSoN8dNTceS+AEUygeTrOZSFAzOgkmX+sW8rsZZX2w=;
        b=ueYeqd0/7BSEezC/w3nCaBIq/DUvZxS6M0zmYXTY2/hPfrDu0EJ0X59wsTwlxJylg+
         +GrxwxWijr6obTmDZFo724WqhTgjnqfm1dd1gAmoPAJQ2duvBB8/O1yLpZTTJ0rugRoc
         +sg5I1GYbazO/8JQDaV/0EyK2ia7x/6EnmkJvmuCE+SJBGo2ppau2CO7wZSPu5VCIOwW
         BrCnGH/TNmC7J5J6YT+9lrcC5Cp8zkoF7P91h0WlatO5qc3nS3FmIORos4sLBLtOwZem
         WN1NvYIkmwLTL6eP4+6WjQ8XI2w6dsDOKuyGFb6cpTUq7zcgYvh7b9IeiyCbqtpbU05J
         gX/Q==
X-Gm-Message-State: AOAM532jkmCz0zvPv39Xw+nH7VROb80nbdj/p8zdgWH4MyyFPy8+wbui
	we2/2jejeQ+MEvdnGOc/UsUfcQ==
X-Google-Smtp-Source: ABdhPJwtMZ92/dYN7hihllIt1ACZWTsLct1CuRYKNAiK29ayUtRZdAjrEg0xA/gTSg8nQ+4Yc3eRPA==
X-Received: by 2002:a17:90b:4c44:: with SMTP id np4mr15742633pjb.195.1637454712968;
        Sat, 20 Nov 2021 16:31:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s16sm4126910pfu.109.2021.11.20.16.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 16:31:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Alexander Lobakin <alobakin@pm.me>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Marco Elver <elver@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Cong Wang <cong.wang@bytedance.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Talal Ahmad <talalahmad@google.com>,
	Kevin Hao <haokexin@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Vasily Averin <vvs@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 net-next 2/2] skbuff: Switch structure bounds to struct_group()
Date: Sat, 20 Nov 2021 16:31:49 -0800
Message-Id: <20211121003149.28397-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121003149.28397-1-keescook@chromium.org>
References: <20211121003149.28397-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078; h=from:subject; bh=GSZPhgjWW3B9MzgyBC2UjZ6Pa5ou1yWYffBCU3Ae8jA=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhmZN01fgOnpPDIcoXNed116FooNZAuWH2eq6S2dJy IKvF8u2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYZmTdAAKCRCJcvTf3G3AJpHoEA Ch0DB7A1NdB6ZjJfCYrbvm+IHUj6kHrbk6J4qKihWmzX5YmKOmCNROTiYQK7EoSvv9FBFZYQSGCYEv pmgvsTW8a5BosVEKtNI3ccV8WS6sak1hPxXfgabUzNiuhsatQdgdhICdfXRg1rjwpkUTmyT145OqIm 4VE0LEE2LXLsxN2jVJNSDm1uJ7P3YUsRmD/2vvfqdVwlfx/yQTUK8xQ/wTZDzz2ZW6P35EP/fwXTp/ 3ia72u+3vvHfP3GdOK6jA6dd1Bc7mtp4aP20yIlsG5PqbSjvBcgAm664u6df648QAAq3qXErO0XNhy 9sKjihs72YDfrUEyYAyGik+N4+GDq+FpmO9M59geeCeM4aZnAwVMy97JrHNy3XoE/SRk3xs2yFgfBL ReNlS9sO7l2WgPb+bNCA+fqNxvvf+bOwNRddnUxbmVidk50A33WWBp2gVAw88uNzXfGENjlL7EyHia ztp0fpngFJlI1+Y3gJHPV5Y8Sdbzfz6njlzrqYh4Zr/NdW1+4KILvtunZohUA7y2isAvBnUJ7fjvWW jf+tWy6YAP217qnnrj7I97SHaepBUtc9K35GfDk07FPBick+BENiVwLVgjNa5oMobveBZ18PEXUXd4 GOR8VPxhzRdawreEtuNJ67AwvQvaTzEZ0z4JbT6lOAkU+D7wp7FKyn6UVfBA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Replace the existing empty member position markers "headers_start" and
"headers_end" with a struct_group(). This will allow memcpy() and sizeof()
to more easily reason about sizes, and improve readability.

"pahole" shows no size nor member offset changes to struct sk_buff.
"objdump -d" shows no object code changes (outside of WARNs affected by
source line number changes).

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com> # drivers/net/wireguard/*
Link: https://lore.kernel.org/lkml/20210728035006.GD35706@embeddedor
---
 drivers/net/wireguard/queueing.h |  4 +---
 include/linux/skbuff.h           | 10 +++-------
 net/core/skbuff.c                | 14 +++++---------
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 4ef2944a68bc..52da5e963003 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -79,9 +79,7 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 	u8 sw_hash = skb->sw_hash;
 	u32 hash = skb->hash;
 	skb_scrub_packet(skb, true);
-	memset(&skb->headers_start, 0,
-	       offsetof(struct sk_buff, headers_end) -
-		       offsetof(struct sk_buff, headers_start));
+	memset(&skb->headers, 0, sizeof(skb->headers));
 	if (encapsulating) {
 		skb->l4_hash = l4_hash;
 		skb->sw_hash = sw_hash;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 0bce88ac799a..b474e5bd71cf 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -808,12 +808,10 @@ struct sk_buff {
 	__u8			active_extensions;
 #endif
 
-	/* fields enclosed in headers_start/headers_end are copied
+	/* Fields enclosed in headers group are copied
 	 * using a single memcpy() in __copy_skb_header()
 	 */
-	/* private: */
-	__u32			headers_start[0];
-	/* public: */
+	struct_group(headers,
 
 	/* private: */
 	__u8			__pkt_type_offset[0];
@@ -918,9 +916,7 @@ struct sk_buff {
 	u64			kcov_handle;
 #endif
 
-	/* private: */
-	__u32			headers_end[0];
-	/* public: */
+	); /* end headers group */
 
 	/* These elements must be at the end, see alloc_skb() for details.  */
 	sk_buff_data_t		tail;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index ba2f38246f07..3a42b2a3a571 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -992,12 +992,10 @@ void napi_consume_skb(struct sk_buff *skb, int budget)
 }
 EXPORT_SYMBOL(napi_consume_skb);
 
-/* Make sure a field is enclosed inside headers_start/headers_end section */
+/* Make sure a field is contained by headers group */
 #define CHECK_SKB_FIELD(field) \
-	BUILD_BUG_ON(offsetof(struct sk_buff, field) <		\
-		     offsetof(struct sk_buff, headers_start));	\
-	BUILD_BUG_ON(offsetof(struct sk_buff, field) >		\
-		     offsetof(struct sk_buff, headers_end));	\
+	BUILD_BUG_ON(offsetof(struct sk_buff, field) !=		\
+		     offsetof(struct sk_buff, headers.field));	\
 
 static void __copy_skb_header(struct sk_buff *new, const struct sk_buff *old)
 {
@@ -1009,14 +1007,12 @@ static void __copy_skb_header(struct sk_buff *new, const struct sk_buff *old)
 	__skb_ext_copy(new, old);
 	__nf_copy(new, old, false);
 
-	/* Note : this field could be in headers_start/headers_end section
+	/* Note : this field could be in the headers group.
 	 * It is not yet because we do not want to have a 16 bit hole
 	 */
 	new->queue_mapping = old->queue_mapping;
 
-	memcpy(&new->headers_start, &old->headers_start,
-	       offsetof(struct sk_buff, headers_end) -
-	       offsetof(struct sk_buff, headers_start));
+	memcpy(&new->headers, &old->headers, sizeof(new->headers));
 	CHECK_SKB_FIELD(protocol);
 	CHECK_SKB_FIELD(csum);
 	CHECK_SKB_FIELD(hash);
-- 
2.30.2


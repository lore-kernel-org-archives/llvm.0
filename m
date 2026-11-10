Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283067;
	b=te2iQt1fOZpc2CJJzs0bzpfWSkADFT/zZmcMqm3BG46OuCUrfQ7l98rfRlm0Fg/GyNRp
	 ydGvw7jeQX52HlOzIu3kdP3OxsbFhLx/+bwLkpmoEUVwuwnetmL/75Typ/0Qhm5Ws9Hli
	 ycoj1IxlqJ1vSHnsXhWf8y4SpW5XI6Jx5V4nGvvYEA1MufgNljzIVVkT17gbUAVVM186e
	 TjJsMt7TddZbU794U4MMzr6S1Ycz+jIilH1UDSCik3pJlbxTfBoCyEA4khlhzwMOA8S2e
	 /Z8vZIllOUwOiqi8DMzQFul1DwdighB3LsbvRGnVmke5GOwVNTM3LPM+PhTRSBeREtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
	b=ulMxEIyH9FMm6drOzeulC/xSy2zdK8xdFIHkwMJ3jVSTMdAamXA7m6z0gl4hHIMt6g1T
	 MDvXYvJjApUlMM/YEz3G/kUGtf12sakgg/bIfWDU43MOCHqcVTmepcZAkt5MK6a2Ko1DG
	 pGqCfA85DqLpWmXMEFOfslYPP3sLarbspkr+M12TsIyode4euxYgdryIfyIeGDyMEjf3k
	 e3aATHXD/pcCq/zzzzgD0dXLq8QNF8eFv24gyGnNKOLhLsXCZMeXEuLaevcdeXGqlEbJV
	 R5NWxXGNbmqyH949I33wBEEg6d3IhkILPTaDIe2PTF+VXIjJBfLaJO8s5/mi8pTNOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RmL6DBpk;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4560A2615
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB4560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RmL6DBpk
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1927919a12.3
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283065; x=1794887865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
        b=RmL6DBpk5Q9vjYyKA5bCkuipQQ69ebdTkwqBTz8YQPJDDZXfAPA/8HEX4nYWYR1LPR
         bZLdAaAMsouLQVPPh792U9F4cbL4jzAnrNZWjjAvsM+yfkoIHvT4N7YWpIu1g7nm1wOj
         YoZKsj1Wn/YIGWD2HrbuhHmqgOKYwqDIAGMgq+vFbPJXumExxyk0QLe72t9NxjF6CLi9
         LAwabfz2EcER7yHOvH+lMGWCh9dOnljrcA+RlrmohhMF+K8+riHKiet25dZhF1JJL24n
         0O06BChv5590tKsL9sTzv08Vq3WcCMcSI+MO+7zZHNUa489hME9to8Bljz2DicM2l+T9
         oTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283065; x=1794887865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
        b=06hXr+kn6tM240+a+OrdgmyNWHhOSXW68ehvcysS6Vu7cWRuYtR0Lj5ANxoEi1BE1t
         +Y038AN2Ri869H67RlBgr70SL8uiiafF7CMEGL8vz62vwkFITnebWEcG8CO64STQDNIU
         OnfR9n4Jy2tXrcrIld7v3fQ1NdjTSHiHAMZdQE6rrVKd8JOnoPGF+l2fD5Nyyu1c2KfF
         aIGj3mS96+nKNewin9s4c5lT7tiaZoB6PvOq9Ge/T5bcMYCoDcLmfseONWdFSta4Ldvi
         3HlvC6f0z1QzqbLY1e9cggSgO18yuQIknzZs/CEA1G/UPT8hbAozgG6XfEj3KjDqa9P7
         u1/w==
X-Forwarded-Encrypted: i=1; AL+hErGB1aSs22e7w2XSfbCiGQB2WG8tm5OKVYEk80+beKfuokgpzBwt6cJ6Z+xpUcUfZL+2YEy/@lists.linux.dev
X-Gm-Message-State: APuU4Z9agUdUJZ1Si/vGisX0UgY/o+5x9o8Jsm2wiNySBuhGC9BclHdH
	ptHXoL4MZFhSDsqD9RVEVdmaF9Pw7V1i3fsHJdSPp4QdlDLv34FtExW7O8xxk6cp5/A=
X-Gm-Gg: AYBFou0jCLiTIOaMNVUKlCgm3EbKAdEfiLHPUVfqNVz0K+mL45/t+Yg2VIiTTs2FLjY
	jYw+zSqZ4QaHqG6bNrshbcUuYvyDYro5meA6fyNPzTG6iTz1dGIR2BPXh8ll4zOj6g+Xbnx0nhr
	NQL1SpZl/zPAF+Gq4aPDAgfP7qrIeBZRSBVANeYxHuSPFCrLdFodD/iMghz2DQ2YHsOUuRWgcF9
	SEswBWSOve6CPLynEPC6NvrzrlxcH+EDgKHBmolrP1rvF8fqIzxFxCEauoVmK1tJMNg2fELakGU
	fHamZo91RTJODVu0qj9UDqJg/JPdbd8quZWoBkr8Bfv7/YgL7DCGSgkGHy2VcdaX22WdHfGvbY2
	yQ9cmvREHbbkRBsDJkoFuEpoMUaQJVQba4ZkvQxII6n17afgDCEOv5+MQUQLnTBKxvxNzlBJZUM
	5/OGv0DaBXdZ9Wz2Rqnd9cVUswlltNXtCVQEqyfO+OXdn1a0z2AypScT34UG/x7KLuw1O4bpNiG
	Zhgn0s+taIFkqJN8nvulno89e7apRhgcqEDmIM7ZTgQa5L00ig8YC+JSjqZ7LFtqs9avIo7PXmX
	RT6Vt2xkBryaD+Ap5UDfX35+Z89PTs1lL/zPa/XNC9j56AZvc5d7fW3c4/RM0mA=
X-Received: by 2002:a05:6402:2750:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b756af5982mr1263386a12.31.1794283065131;
        Mon, 09 Nov 2026 19:57:45 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:43 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 07/15] xdp: set skb RX metadata from the skb core extension area of xdp_frame
Date: Tue, 10 Nov 2026 03:57:05 +0000
Message-ID: <eca7d73b0881b59f0f7b3cf8d6e022e70c8ed800.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpumap, veth and BPF_PROG_RUN build the skb from an xdp_frame with
__xdp_build_skb_from_frame(). It now calls the new helper
xdp_skb_ext_to_skb() if the xdp_frame has the XDP_FLAGS_HAS_SKB_EXT
flag.

Three drivers (atlantic, mana and netvsc) call the wrapper
xdp_build_skb_from_frame() in their RX and TX routines, and then set the
skb fields from the RX descriptor or transmit the skb. The stored values
must be ignored there to keep their behaviour consistent. So the wrapper
clears the flag. A driver that supports them calls xdp_skb_ext_to_skb()
itself, as ice does in a later patch.

xdp_skb_ext_to_skb() is based on [1].

Link: https://lore.kernel.org/all/175146831960.1421237.9105904582430357235.stgit@firesoul/ [1]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 include/net/xdp.h |  7 ++++++
 net/core/xdp.c    | 54 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index d8b77d80bfbe..7c9a812b6e86 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -329,6 +329,11 @@ static __always_inline bool xdp_frame_has_frags(const struct xdp_frame *frame)
 	return !!(frame->flags & XDP_FLAGS_HAS_FRAGS);
 }
 
+static __always_inline bool xdp_frame_has_skb_ext(const struct xdp_frame *frame)
+{
+	return !!(frame->flags & XDP_FLAGS_HAS_SKB_EXT);
+}
+
 static __always_inline u32
 xdp_frame_get_skb_flags(const struct xdp_frame *frame)
 {
@@ -503,6 +508,8 @@ static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 	return (void *)ext + ext->chunks * XDP_SKB_EXT_ALIGN;
 }
 
+void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext);
+
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
diff --git a/net/core/xdp.c b/net/core/xdp.c
index eea04e7b7204..9f311b3c0d2b 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -829,10 +829,10 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 
 	/* Essential SKB info: protocol and skb->dev */
 	skb->protocol = eth_type_trans(skb, dev);
+	if (xdp_frame_has_skb_ext(xdpf))
+		xdp_skb_ext_to_skb(skb, xdp_skb_ext(xdpf));
 
 	/* Optional SKB info, currently missing:
-	 * - HW checksum info		(skb->ip_summed)
-	 * - HW RX hash			(skb_set_hash)
 	 * - RX ring dev queue index	(skb_record_rx_queue)
 	 */
 
@@ -857,6 +857,9 @@ struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 
 	memset(skb, 0, offsetof(struct sk_buff, tail));
 
+	/* The callers set the RX fields themselves or transmit the skb */
+	xdpf->flags &= ~XDP_FLAGS_HAS_SKB_EXT;
+
 	return __xdp_build_skb_from_frame(xdpf, skb, dev);
 }
 EXPORT_SYMBOL_GPL(xdp_build_skb_from_frame);
@@ -1065,6 +1068,53 @@ static void *xdp_skb_ext_add(struct xdp_buff *xdp, enum xdp_skb_ext_id id)
 	return (void *)ext + newoff * XDP_SKB_EXT_ALIGN;
 }
 
+static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
+				   enum xdp_skb_ext_id id)
+{
+	u8 off = ext->offset[id];
+
+	if (!(off & XDP_SKB_EXT_ENTRY_ACTIVE))
+		return NULL;
+	off &= ~XDP_SKB_EXT_ENTRY_ACTIVE;
+
+	return (const void *)ext + off * XDP_SKB_EXT_ALIGN;
+}
+
+/**
+ * xdp_skb_ext_to_skb - Set the stored RX metadata on an skb.
+ * @skb: The skb that is built from the packet.
+ * @ext: The skb core extension area of the packet.
+ *
+ * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag.
+ */
+void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
+{
+	const struct xdp_skb_ext_hash *hash;
+	const struct xdp_skb_ext_vlan *vlan;
+	const struct xdp_skb_ext_csum *csum;
+
+	hash = xdp_skb_ext_get(ext, XDP_SKB_EXT_HASH);
+	if (hash) {
+		enum pkt_hash_types type = PKT_HASH_TYPE_NONE;
+
+		if (hash->type & XDP_RSS_L4)
+			type = PKT_HASH_TYPE_L4;
+		else if (hash->type & (XDP_RSS_L3_IPV4 | XDP_RSS_L3_IPV6))
+			type = PKT_HASH_TYPE_L3;
+		skb_set_hash(skb, hash->val, type);
+	}
+
+	vlan = xdp_skb_ext_get(ext, XDP_SKB_EXT_VLAN);
+	if (vlan)
+		__vlan_hwaccel_put_tag(skb, vlan->proto, vlan->tci);
+
+	csum = xdp_skb_ext_get(ext, XDP_SKB_EXT_CSUM);
+	if (csum) {
+		skb->ip_summed = csum->ip_summed;
+		skb->csum_level = csum->level;
+	}
+}
+
 __bpf_kfunc_start_defs();
 
 /**
-- 
2.56.0


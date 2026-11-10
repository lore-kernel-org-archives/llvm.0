Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283060;
	b=XJmLDetTtFuhG99DKNya36Om/u3RUZK0XaeXcKcvReIS7/Hden3bfeHTLb36IAK+9hDI
	 jXAKKnZ9C94uwMg81g8qZtHWy1XowPAsaz8RGbP2sbalUvkhG7jKAHOGSL7/PTSPm4YOc
	 x0wcKKzsw0qXWHqtmJ8jpn2HQmYXJoAWawVS/XabzK9iWmDO+aSNAJYjSrtu9W24Dp7Bs
	 x/+cPmfsMZhfkwY/6L96L1G3skEy5oaftKdSxnjPvkA0kI9PaO/hf9i7dMln7itSVLgrL
	 YLEWUuajnj3dJY+GczDa6Km0XuahzOHQBZ9bdUfUWI64c7Q4+V/7ABy/FsP+PZ/MDgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
	b=gepbgzUIeF6Nh+E+GXXJNkDnYTekDpe0v63dnA0O0jetsfqBnuQITgkgdePxiIyeyKA5
	 47Udvcf+4MfEonOLQg40QlDRl31qEsuxwBZxE3yu6rLqr4bt8XQkiG1tw7F4Yma9yxhkQ
	 nWxFhBYL7FTi3WA2j5WZbiehMNuVXJt5ul9HxUDGoSk9olLRHkfCxs4tisu+/bzGQRpPp
	 8Q0ELAFj2xChKOZp9Hg/qGz3I/5hV5x2o/15wwREcPP5AHsXCtVXrjzzeoAQah2/0B6Cd
	 Sdb0UuBgT/GwLq1sDvqs6QR1Wco7MTdOAuHCazvxZiUMRFN/yxZjMKN7xvrX2TQ6wHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Y5eB1QZv;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CC606A321
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Y5eB1QZv
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2381015a12.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283058; x=1794887858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=Y5eB1QZvm8t0lLYwGDa/cni8uLVh4+wwCYVEUfYMRY/UHFKLG37lrGFfu9Qz/JPHw4
         ZacWk2XxmSaxApPlWhWXbyFd4CUPESrH/ptLFmPBhOO8wrIJE3oCsv+eNIzZRplS1Ahv
         8q0YJduNiOPOUlh13h9omnD378KyCPwYQpwsUQOJmaEDk7XC5KPd6KOu9fmczDx9tJzj
         /25/HsyZu0Ch5FEiB278j9Q8/9HpDFay989XCIBRvQsF0hRQl/Su3HJYM32MgHcY19qF
         3zKNmgtV+B6H2yjjgXv+WGo3of9HPH1vZ1luI7vr9/uefzbw68xUdLrIHXxbzwUwjVMY
         EK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283058; x=1794887858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=T8D66xkU9Z1NB+TWArUO2L1JkuM/KM0vPHqEi15qcFfU3AKrRRE3Hh+aPvi+y1E4wG
         2HHI+LDFqbOdBkbKNH88aTmfURKEEHHaHccePnQrxoG3QBJ8jaEgr1z9YPdUgzfsm1rA
         hfqt663lVZu6bwX4lYBYuDwo650zJ5Zzi67+Z/HZV1VnzJTMcWcfB4w0XpvLLB3amUoQ
         tcWs1KCptK6wAT92rMcinrahTY3fF9HJq0Xny2xRZ4J67xjZ4EbViy+V9b6hlFYrnl3T
         lFrmGjWUMWnIKnKv9/a7bb6Bou6e9gAEsIrzzgNgqXLY2akTIyDBKJdjYfAr20Lcrt3Q
         sQCA==
X-Forwarded-Encrypted: i=1; AL+hErHgyczub2n+0nJqeRnC3jgHrdwzUU48oLOyzLFVC7sQPIHpF3jFvPAHuPKMgh/yuzM0PuiG@lists.linux.dev
X-Gm-Message-State: APuU4Z98GCEu1fMDLT1VQ7HwXT8p5CMruWDcZ0mHJ7qyEbqFRkJ/NL91
	yVl6CW37sap6e8TOfd2HSG41xKmDYd3Z/lBwJpQzclI0uBppmUyjKORg2b1akbB18b8=
X-Gm-Gg: AYBFou3kwEDaWdtK7fiNhKKNIqkx//naT4gdgmxm3wI+M22l9K0tqmrJt4GYugyJdlW
	gMAAv3XneBLt61u3/65jJSxsp2+ziscbH2vSUvhE5gE/iJ31PiB7jHfc7U3h2vHMEIp0YmhEaEv
	jgYF1JaBO8OvmkErzhACQjZswWVfFvylKYYwEfx0AgZXbN7jZc1JC4qlpjdrWz9u2ffoUgciOEb
	eS8U0tRGrLRr9YNrgBHaHmJ1/xzQI/NRQMFg9AbL5TQna+7g2V7knXGN9BUhwSKFtTa43Qo7/h3
	Ysab29flmnN33B+/mR4RB+OLxHeuknVsYy47r2tq/tRpRzGZWcecEqZ/SlMtzKFH372Rt3RvXEF
	mu5RkNEPKYHmV8071NvHEE/urkSVEc5vB1nva1/4PmIz4sECC2dx96IjMc7rA1w9oSJRpTjuJ/P
	X1OALP01dI3CsD4KatUfZY4yU/zrACX1xfRTvcjdyWyZTxL0RR188dv3imSVnD110+UzyXpaFtP
	XWcJRYzNlRbBE8ph0yY3NTWHcQnnPTcsVqDLW2dPv1A0eacCuanZX1CQ9/GwidZgSIy89YtKyv7
	YfK/2Ykr1fsQkGa3xT+wPjevitGIM30IhhJLFVfC9PkfVk657USnfOtOogbkDJM=
X-Received: by 2002:a05:6402:4007:b0:6b5:8695:f839 with SMTP id 4fb4d7f45d1cf-6b756b0bf4cmr1096174a12.45.1794283058320;
        Mon, 09 Nov 2026 19:57:38 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:36 -0800 (PST)
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
Subject: [PATCH bpf-next 05/15] xdp: add a kfunc to store the RX checksum status
Date: Tue, 10 Nov 2026 03:57:03 +0000
Message-ID: <f17f2567802dde23ad1cf81b572e0834c6531fe7.1794281983.git.tianyi@cloudflare.com>
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

Add bpf_xdp_skb_ext_store_rx_csum(). It stores the RX checksum status in
the skb core extension area. A later patch sets the stored status on the
skb built from the xdp_frame. The program can read the status from the
NIC with bpf_xdp_metadata_rx_checksum() from Lorenzo's RX checksum kfunc
series [1].

The kfunc accepts XDP_CHECKSUM_NONE with csum_level 0, and
XDP_CHECKSUM_UNNECESSARY with csum_level up to SKB_MAX_CSUM_LEVEL:

- Storing XDP_CHECKSUM_UNNECESSARY asserts that the checksums are
  correct, as in [2]. A program must store it only after it has verified
  the checksums.
- Storing XDP_CHECKSUM_NONE invalidates the checksum status, as
  requested in [3][4].
- After a decap, storing a lower csum_level updates the status, as
  requested in [5].
- CHECKSUM_COMPLETE is not passed to the stack for now, as suggested in
  [5].

Link: https://lore.kernel.org/all/20260715-bpf-xdp-meta-rxcksum-v5-1-623d5c0d0ab7@kernel.org/ [1]
Link: https://lore.kernel.org/all/20260630191510.81402-2-deliran@verdict.gg/ [2]
Link: https://lore.kernel.org/all/20260227153231.78d16b69@kernel.org/ [3]
Link: https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/ [4]
Link: https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/ [5]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
enum xdp_checksum has the same names and values as in [1], so this
patch does not depend on that series. The series merged later drops its
copy.

Stanislav was not sure that any NIC reports a level of 2 or more [4]. A
separate maximum for XDP would give the same skb field two limits, so
the kfunc uses SKB_MAX_CSUM_LEVEL.
---
 include/net/xdp.h |  6 +++++
 net/core/xdp.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 23c976e92898..d8b77d80bfbe 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -701,6 +701,12 @@ enum xdp_rss_hash_type {
 	XDP_RSS_TYPE_L4_IPV6_SCTP_EX = XDP_RSS_TYPE_L4_IPV6_SCTP | XDP_RSS_L3_DYNHDR,
 };
 
+enum xdp_checksum {
+	XDP_CHECKSUM_NONE		= BIT(CHECKSUM_NONE),
+	XDP_CHECKSUM_UNNECESSARY	= BIT(CHECKSUM_UNNECESSARY),
+	XDP_CHECKSUM_COMPLETE		= BIT(CHECKSUM_COMPLETE),
+};
+
 struct xdp_metadata_ops {
 	int	(*xmo_rx_timestamp)(const struct xdp_md *ctx, u64 *timestamp);
 	int	(*xmo_rx_hash)(const struct xdp_md *ctx, u32 *hash,
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 2c1d5ec3311b..eea04e7b7204 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1004,9 +1004,15 @@ struct xdp_skb_ext_vlan {
 	u16 tci;
 };
 
+struct xdp_skb_ext_csum {
+	u8 ip_summed; /* CHECKSUM_* */
+	u8 level;
+};
+
 static const u8 xdp_skb_ext_type_len[] = {
 	[XDP_SKB_EXT_HASH] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_hash),
 	[XDP_SKB_EXT_VLAN] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_vlan),
+	[XDP_SKB_EXT_CSUM] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_csum),
 };
 
 /* Limit the header and all entries to 64 bytes, so that a new entry
@@ -1120,6 +1126,56 @@ __bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_store_rx_csum - Store the RX checksum status of this packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: ``XDP_CHECKSUM_NONE`` or ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Number of consecutive verified checksums minus one, up to
+ *              ``SKB_MAX_CSUM_LEVEL``. Must be 0 with ``XDP_CHECKSUM_NONE``.
+ *
+ * Store ``XDP_CHECKSUM_UNNECESSARY`` only after the program has verified
+ * the checksums.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @ip_summed is not supported, or @csum_level is not valid
+ *   for it
+ * * ``-ENOSPC`` : not enough headroom for the entry
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_store_rx_csum(struct xdp_md *ctx,
+					      enum xdp_checksum ip_summed,
+					      u8 csum_level)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext_csum *entry;
+	u8 val;
+
+	switch (ip_summed) {
+	case XDP_CHECKSUM_NONE:
+		if (csum_level)
+			return -EINVAL;
+		val = CHECKSUM_NONE;
+		break;
+	case XDP_CHECKSUM_UNNECESSARY:
+		if (csum_level > SKB_MAX_CSUM_LEVEL)
+			return -EINVAL;
+		val = CHECKSUM_UNNECESSARY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	entry = xdp_skb_ext_add(xdp, XDP_SKB_EXT_CSUM);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	entry->ip_summed = val;
+	entry->level = csum_level;
+
+	return 0;
+}
+
 /**
  * bpf_xdp_skb_ext_del - Delete a stored entry of this packet.
  * @ctx: XDP context pointer.
@@ -1149,6 +1205,7 @@ __bpf_kfunc_end_defs();
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_csum)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
-- 
2.56.0


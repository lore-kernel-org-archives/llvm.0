Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283045;
	b=KJH4aCEoeFatsGUuSjXNy5nDPBlkGQC30M3EI+xJYh3q3jQVuUInhJVWAzoy2NrSqpDT
	 TA/9BkKYlu6xpbVVG9aZIkAPjk1QH8R27pzdzKpmvXs39Is0qw+z8bRr8COHry/yhYKMM
	 1P58PW4HafPsyprzAsSL8LT1/3vYH7KUkzVptyEisE9vsI1a7KBGMkn+X99cFvsX2tybc
	 9HeV3qkYISsi5gEZvPczATNUNXP79TAUkOIChnIPZIPdhDmSNyVFJorLQb1FxoZoA8RxV
	 M7Vhey629N0gdT8MCmhtu+MEjaI9sELyKTVK7SrAxNYyl6Zoylzro+vXRXYClCYuETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
	b=ABbe0P7ffLSNk0W5haFcHzx4G0BYRAaR//EyFItMDeWGwNRxHjtcxZGAOEpTt2nSIiJ+
	 ijOkGom9lqT7aLADR56GJaJ06J0+V0E3wWWsjxgBsjtJ8chj4VB1xtwvngM5dmhkoKecH
	 P6CUELAq2QM8lZymsVX+HdQoxjAGxb5RzUe+eiWOPF4SiOP7zcMW67+QUhxwxi8osAFsJ
	 92PXci35gSOC7adhf6QgEpHHOf22GogKN2SX9wHg9fsCBWrvLgxF7bAQbUcFE3SOjXR17
	 7KSfcbnwKcE/MlE052BlkptXHswU2h9qS6P1pB4/yarlACpBTVWKmJ6Dq38LLnHWvSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BaAzEdrS;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C1606A326
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BaAzEdrS
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1927719a12.3
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283043; x=1794887843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
        b=BaAzEdrSFlKa/2uSOz6gWAStR8H76GeqSaKYASD2NQfu34S+3hyVr07wjYN2cp4F6v
         eHy5Ef0uf7UNGbMeOKqlzMcgYVgAQclQKh4mxjbQxDpr2lFW+gtfhBNS7+h152mDkcUE
         lIoAfC9ayyE/WftcXlQRFZ08fb56roY87QnflBW+TpNdnk6A2XxAz1q3MZ84aUTAlX03
         R3NiN2rshkizEW4oDBiJzOWDsmKOb45wNluCcgriT+Cj5MyEfLuCkGI6R0A5CKqNrrrn
         09rg1BIDsY8J1xnHckF7P11YE1XtP2OMD5AVzvPC0rNH7shfLcW5xhXYbUQH/lgydpxI
         UHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283043; x=1794887843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
        b=Ig3AXeopjOnTSmpjt1KMd1g0izVu5nsJ0WkpBDy74dLyRl31rMViTapxrSLfFh+6ta
         0vRXbhyVVAQ9Y1fJMmz6DyhHb8W9ErcfG3HrqoPSBYp5IezR8vCllPozRpDDwDTfGsf/
         0o+gR1k0Zz9B7x9mrLg0AsSQqyOM/Cak0Cxr1jN8MwG/4m8hvhsad0L7Zkf/rwsY8BhZ
         IAjYLSKVqvieUJLgO9uuO7wZ3pMb3barf5qAqGjqRO9vweFMHDCrKl4cRyXvKFTRa0Fz
         Hoe4cyzgnuSORppy9U3J0xhoibPzoxqpaLDWB4+XX97WrVYhm8XwsIXgPVoXfxk5byUZ
         Rkrw==
X-Forwarded-Encrypted: i=1; AL+hErGSUcMDisu0rSEusdBVdSGGJYoF+6QGman6bFRTUGUbrrDsAyFnBNQiTf/2h1atWfjgeWFw@lists.linux.dev
X-Gm-Message-State: APuU4Z9+7xQ4MTIpMxtMRVvybRoN92yG9q5ZZaKvk5aSA+jw11msAo3L
	Xkjx6w1a8bRN07As39w+YzNb4/gAOwqXXmRhVGpCSKVuKboVXH+a/3IbAkG4R9aDoMk=
X-Gm-Gg: AYBFou1K+xVVY/92X5HQLGoNNzJc9tznGBhxFRmkac7s7xhqqf5E6F40iwXbEYdvFwS
	yp+s8Jt0II9+gEf0BZXN1Rt+53gcn5K+RKbAWd6wKjlDvGdL3iiafGfkX7UgvJxHaYXkK5j6OfY
	JFDTFRUCAmAbJE+QVowargeD+urjPg6YMmOpLPP8PzhvAtbh2+UUzm4LkmM+ii1RPordKRiDp1n
	+XgSggS+1xJbGILYn4+WYPkzYII9ngrP/t2G4nzISHUzZ4R1t2Wj+mS8ut9Ir+KWJy1t5wWGdHY
	TSaM3fEkHpLR7GSciERhwglbu7D98PEjRzkEduND/TazTM1dg/rlTS6sc9j3ZnB3kr7QeWtsWAU
	EuPgg2eSRLc0vyucFx7/G490Cgsc/8DqXiu5LFhPQBlbQB2RL33SfPPWoBKi97KWtB4q5UYkEbi
	Md8WsaF8hg3DfruB3DU1bVJ+D+8nB+PcJZqYyKrpdWifwDe4gUZsM7kxGmTMS6meORKmziNwoe4
	mVJPBqhvNAz9Txn0ql/1WvUT+j8vJR3LPBxfzNlInAXVtUz1NBDrZzoVaqdRmKLpzLYNprNA4Bz
	nmpqrymNKIuffKaJL+dlYfVGKaiC0v/CukasJ11vZkh5TVVQSr/V8wZnC67QoEQ=
X-Received: by 2002:a05:6402:a6c7:10b0:6ac:73f8:2e4f with SMTP id 4fb4d7f45d1cf-6b756aeaf80mr752992a12.29.1794283043237;
        Mon, 09 Nov 2026 19:57:23 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:21 -0800 (PST)
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
Subject: [PATCH bpf-next 01/15] xdp: reserve an skb core extension area after the xdp_frame
Date: Tue, 10 Nov 2026 03:56:59 +0000
Message-ID: <115997f55d63b507ce54fbe9e22900b59016f3c3.1794281983.git.tianyi@cloudflare.com>
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

Reserve the skb core extension area in the headroom, right after the
xdp_frame. An XDP program stores RX metadata there for the skb that is
built later.

The area begins with a header, struct xdp_skb_ext. It records the offset
of each entry and the end of the last entry, in 4-byte units.
bpf_xdp_adjust_head(), bpf_xdp_adjust_meta() and bpf_xdp_pull_data() use
xdp_skb_ext_end() as their lower bound, so packet data and metadata
cannot overwrite the entries.

The XDP_FLAGS_HAS_SKB_EXT flag indicates that the header is valid. Most
drivers reuse the xdp_buff between packets, so xdp_prepare_buff() clears
it. With BPF_F_TEST_XDP_LIVE_FRAMES, reset_ctx() restores the flags
before each run, and ctx_was_changed() compares them.

Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>
Link: https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 include/net/xdp.h  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 net/bpf/test_run.c |  4 +++-
 net/core/filter.c  |  8 +++-----
 3 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..c888353425d4 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -81,6 +81,9 @@ enum xdp_buff_flags {
 	 * XDP program is not attached.
 	 */
 	XDP_FLAGS_FRAGS_UNREADABLE	= BIT(2),
+	XDP_FLAGS_HAS_SKB_EXT		= BIT(3), /* skb core extension header
+						   * is valid
+						   */
 };
 
 struct xdp_buff {
@@ -146,6 +149,16 @@ static __always_inline void xdp_buff_clear_frag_pfmemalloc(struct xdp_buff *xdp)
 	xdp->flags &= ~XDP_FLAGS_FRAGS_PF_MEMALLOC;
 }
 
+static __always_inline bool xdp_buff_has_skb_ext(const struct xdp_buff *xdp)
+{
+	return !!(xdp->flags & XDP_FLAGS_HAS_SKB_EXT);
+}
+
+static __always_inline void xdp_buff_clear_skb_ext_flag(struct xdp_buff *xdp)
+{
+	xdp->flags &= ~XDP_FLAGS_HAS_SKB_EXT;
+}
+
 static __always_inline void
 xdp_init_buff(struct xdp_buff *xdp, u32 frame_sz, struct xdp_rxq_info *rxq)
 {
@@ -174,6 +187,7 @@ xdp_prepare_buff(struct xdp_buff *xdp, unsigned char *hard_start,
 	xdp->data = data;
 	xdp->data_end = data + data_len;
 	xdp->data_meta = meta_valid ? data : data + 1;
+	xdp_buff_clear_skb_ext_flag(xdp);
 }
 
 /* Reserve memory area at end-of data area.
@@ -450,6 +464,37 @@ struct xdp_frame *xdp_convert_buff_to_frame(struct xdp_buff *xdp)
 	return xdp_frame;
 }
 
+/* skb core extensions: RX metadata that an XDP program stores in the
+ * headroom right after the xdp_frame, for the skb that is built later.
+ */
+enum xdp_skb_ext_id {
+	XDP_SKB_EXT_HASH,
+	XDP_SKB_EXT_VLAN,
+	XDP_SKB_EXT_CSUM,
+	XDP_SKB_EXT_NUM,
+};
+
+#define XDP_SKB_EXT_ALIGN	4
+
+struct xdp_skb_ext {
+	u8 offset[XDP_SKB_EXT_NUM];	/* in chunks of 4 bytes */
+	u8 chunks;			/* same */
+};
+
+static __always_inline struct xdp_skb_ext *xdp_skb_ext(struct xdp_frame *frame)
+{
+	return (void *)(frame + 1);
+}
+
+static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
+{
+	struct xdp_skb_ext *ext = xdp_skb_ext(xdp->data_hard_start);
+
+	if (!xdp_buff_has_skb_ext(xdp))
+		return ext;
+	return (void *)ext + ext->chunks * XDP_SKB_EXT_ALIGN;
+}
+
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc62182e..f25581851339 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -223,7 +223,8 @@ static bool ctx_was_changed(struct xdp_page_head *head)
 {
 	return head->orig_ctx.data != head->ctx.data ||
 		head->orig_ctx.data_meta != head->ctx.data_meta ||
-		head->orig_ctx.data_end != head->ctx.data_end;
+		head->orig_ctx.data_end != head->ctx.data_end ||
+		head->orig_ctx.flags != head->ctx.flags;
 }
 
 static void reset_ctx(struct xdp_page_head *head)
@@ -234,6 +235,7 @@ static void reset_ctx(struct xdp_page_head *head)
 	head->ctx.data = head->orig_ctx.data;
 	head->ctx.data_meta = head->orig_ctx.data_meta;
 	head->ctx.data_end = head->orig_ctx.data_end;
+	head->ctx.flags = head->orig_ctx.flags;
 	xdp_update_frame_from_buff(&head->ctx, head->frame);
 	head->frame->mem_type = head->orig_ctx.rxq->mem.type;
 }
diff --git a/net/core/filter.c b/net/core/filter.c
index 9245009d9f1e..4f6698f75d90 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4243,9 +4243,8 @@ static unsigned long xdp_get_metalen(const struct xdp_buff *xdp)
 
 BPF_CALL_2(bpf_xdp_adjust_head, struct xdp_buff *, xdp, int, offset)
 {
-	void *xdp_frame_end = xdp->data_hard_start + sizeof(struct xdp_frame);
 	unsigned long metalen = xdp_get_metalen(xdp);
-	void *data_start = xdp_frame_end + metalen;
+	void *data_start = xdp_skb_ext_end(xdp) + metalen;
 	void *data = xdp->data + offset;
 
 	if (unlikely(data < data_start ||
@@ -4547,13 +4546,12 @@ static const struct bpf_func_proto bpf_xdp_adjust_tail_proto = {
 
 BPF_CALL_2(bpf_xdp_adjust_meta, struct xdp_buff *, xdp, int, offset)
 {
-	void *xdp_frame_end = xdp->data_hard_start + sizeof(struct xdp_frame);
 	void *meta = xdp->data_meta + offset;
 	unsigned long metalen = xdp->data - meta;
 
 	if (xdp_data_meta_unsupported(xdp))
 		return -ENOTSUPP;
-	if (unlikely(meta < xdp_frame_end ||
+	if (unlikely(meta < xdp_skb_ext_end(xdp) ||
 		     meta > xdp->data))
 		return -EINVAL;
 	if (unlikely(xdp_metalen_invalid(metalen)))
@@ -12794,7 +12792,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 
 	start = xdp_data_meta_unsupported(xdp) ? xdp->data : xdp->data_meta;
 
-	headroom = start - xdp->data_hard_start - sizeof(struct xdp_frame);
+	headroom = start - xdp_skb_ext_end(xdp);
 	tailroom = data_hard_end - xdp->data_end;
 
 	delta = len - data_len;
-- 
2.56.0


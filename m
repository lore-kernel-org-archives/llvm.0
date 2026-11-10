Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283088;
	b=Xp+MazOBFVtmmrRn6OT32FZgs0Sdzemdwm0xGcMCp5gBqXtazcxSBj3zNefLbsY0hLiH
	 msvKQbMddV198qW06mPu+Ty11wmKsmAYerOLmk1rwL+BxRRrh2S0igpQ+PPPX4FZwDDtt
	 uPjh+6MxG/k0BdE0U96azKakO3B+oqUSzD7IXz3AfO9GDQllUl6eZh5UEer46Lqgi86DP
	 ON2HpQ7Qkg4sHBVKKw0VjtKknu3Fl/Tgy6E1i83MnRftNMkVyHRuck6XJbSc16Qfm70EK
	 ltPhALxpUWVgLgCN8NrT5FunQucTKbwh1LOVG905CmcafaA83LslthlR2GBfQzaH12A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
	b=N2ScSipY0avloZ6UHITSFZeKg4qzfv1zOh1ytDF0UcWU6SKxGmKr7jSYW376ODSr/sou
	 lyVCz5BdqeiZyHE7zMxP0IzsAxlwIrtvXaDwfeb0LA7HVEQDKr8VwfbJ8d/jWlIhAaUWw
	 7bxMg02TuOK9+edZL+O9QhBWoJPFrhdxGJMQJZGEAKymx6VrEn/r5g8aKmKIJrRY3XlTR
	 X/ThRySJ6N6ZccrA7pusC+T0gntAF1DPPKhlWc3BUMveLe7ijhwguLsLUgUrRlLRRlIjT
	 juyPLWSE2fxDETsmz9whhgMMqOotSkqo5S+B0Eb23FxC9PIBhKR1M3BQwIG3ACHarng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=dBT7x93r;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C760A3839
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36C760A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=dBT7x93r
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b750e40ce2so958032a12.0
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283086; x=1794887886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
        b=dBT7x93rQGFTAVdGGUWVVpR9cIbshbEFE7P+8bfVpCHvyHNbIgO6M657DpbT2hMo+J
         qJAVJB700GNsR0PKOB1hUO6lwN67CdeFM0zAnGSlAPDKyKFyvfaA9OWAzvvPwHrH6/fR
         biyYBdRGFdtuTK3Wr450JiFY4eLbuBMGbuBs9mYb7RDBaa8sa3HK7vke+r1k9Zn314fU
         CCo9crRTgDzyAv9PpX3nul5WxBU69wxlbKe99ZaX5XLXChPZDmikawvqz6b+pw4witdl
         hSfbiIz5/Jnbdv4I3Cr3mMic9qBBurLMoRTIa20cSr/KeXGAcTsghHsqVk9Rf6FjwMoa
         RIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283086; x=1794887886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
        b=Ck4y59rlQYWL2xDwuHk1hN423zkeZwDD1MufncwCtCn81CNwymmzmJBvTIUymhhmHr
         uFtlb5KwlG4MuDk5nRasxcbw4FTmUtndmfYLt6v8JeyIhbXUZqEGIA8WaNvIvLSPvmKx
         UkRSfCZB88uQtxFsrwVYurjsAS07CB09zHyDO65fmrnIe/SdC0lyGbLXTkaePM7UtO5r
         CrDmjFCSgiCGUqBabEa1lvbH6qyPfLsJjqpi/iS370TgFVNJ+FnLfOSWPpok/F6cQXVx
         KcRNerZQsMQvc0uXp6OujEWbGKVQqh3+fCtYDQvyL4X5BxpM1HMQgr5Fn6BUYKJHwSqM
         S2wg==
X-Forwarded-Encrypted: i=1; AL+hErGGlnlf8tKl1JOTgpJqEyi92cC/bs5vqKMMtKGiBdPXMScAqkd0Q0c57NE7AavYzveE8iWp@lists.linux.dev
X-Gm-Message-State: APuU4Z+rpNXdbwnIBA1f4QFUJsWuTjPkHvwRK7E4GBI6McozhKNSXuj+
	ZhTeFzimU391C63rRniNM1MyKo/5M6n+mTN53PKwI4k3pDyQXdoPRVb/+q3PimQOhmQ=
X-Gm-Gg: AYBFou2byzCi2K2j7cEAX+a5FbnfhzsbntPs1WVJPOsB+kgZldHpi9JTwbapnC6b/61
	y7cyfd9AXep28FfsELQDvPswja64lnPXSGB1kD3TkjEil5A249vOvzeFocfiAijxTxVMS2Rd4zD
	X0QH0IE7YSGw/H7OLfC1inv2GzpPIuQqzwrhDXifefm/hMFRN5zCj1D8cJgRZXSy1KVwnm7IIH3
	JDYkMyycP6SkwWeUiqIaxZRDJkhMippzwid667UrrNEhKRKGUwtjCQP3p+owjUDkrF/zylOaxI6
	0+Gqi0GFCK3IVuRHkHVo8ouCOIvIWwEF8dJHl6Rt8mIMZZa1Rdx0c6o2c11bDEbQYq2JlWuPv4o
	NK8fkV7/Le4bYD4OdhB6ARXLsBsfhdnkW8PK1+uUYegxSqM/M7vA9HHCEfr3i51hEUpQ381mcAg
	EOssYnWyngQmhqZM2MoYNr4gfp+lAakL/N4KuCaNbO60F03twShZJc9jZpEpUxokNOH3bOGJwV8
	KpxxcoTvewY7u0b1hlyBH3hN7xQe1MWOikfrbh1sF0D3Z7X4jADn3CdvGppWzypArZYeMC7BY8s
	6dqgc80JVqsl1JU+MyKk++aQZ3n+ePw25EFlDEsUW6+qdALDSWkEewxnOvxGBUY=
X-Received: by 2002:a05:6402:22d0:b0:6b1:b97b:745 with SMTP id 4fb4d7f45d1cf-6b756af0889mr755303a12.29.1794283086393;
        Mon, 09 Nov 2026 19:58:06 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.58.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:58:04 -0800 (PST)
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
Subject: [PATCH bpf-next 13/15] xdp: add kfuncs to load the stored RX metadata
Date: Tue, 10 Nov 2026 03:57:11 +0000
Message-ID: <1985183a511a2217fe0f42582cbd16f023d8991e.1794281983.git.tianyi@cloudflare.com>
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

A program on cpumap or devmap cannot call the XDP RX metadata kfuncs,
because they need a device-bound program. A program on veth can be
bound to veth, but the veth callbacks return -ENODATA for an
xdp_frame. So a program after the redirect cannot read the values
that the program on the NIC stored.

Add three kfuncs that read the skb core extension area:
bpf_xdp_skb_ext_load_rx_hash(), bpf_xdp_skb_ext_load_rx_vlan() and
bpf_xdp_skb_ext_load_rx_csum(). Each returns -ENODATA when its entry
is not stored. They are in the same kfunc set as the store kfuncs, so
they are not device-bound and need no driver callback. A program on
the NIC can also read back the values that it stored.

The RX metadata kfuncs could return the stored values instead. This
patch does not do that. Relaxing bpf_dev_bound_kfunc_check() for
cpumap is not trivial, and it changes these kfuncs for existing
programs, which read the values from the RX descriptor of the bound
device.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 net/core/xdp.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/net/core/xdp.c b/net/core/xdp.c
index fdda072a5858..4df3984479a7 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1081,6 +1081,15 @@ static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
 	return (const void *)ext + off * XDP_SKB_EXT_ALIGN;
 }
 
+static const void *xdp_skb_ext_load(const struct xdp_md *ctx,
+				    enum xdp_skb_ext_id id)
+{
+	const struct xdp_buff *xdp = (const struct xdp_buff *)ctx;
+	const struct xdp_skb_ext *ext = xdp_buff_skb_ext(xdp);
+
+	return ext ? xdp_skb_ext_get(ext, id) : NULL;
+}
+
 /**
  * xdp_skb_ext_to_skb - Set the stored RX metadata on an skb.
  * @skb: The skb that is built from the packet.
@@ -1296,6 +1305,85 @@ __bpf_kfunc int bpf_xdp_skb_ext_del(struct xdp_md *ctx, enum xdp_skb_ext_id id)
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_load_rx_hash - Load the stored RX hash of this packet.
+ * @ctx: XDP context pointer.
+ * @hash: Return value pointer.
+ * @rss_type: Return value pointer for RSS type, see &enum xdp_rss_hash_type.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the RX hash is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_hash(const struct xdp_md *ctx,
+					     u32 *hash,
+					     enum xdp_rss_hash_type *rss_type)
+{
+	const struct xdp_skb_ext_hash *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_HASH);
+	if (!entry)
+		return -ENODATA;
+
+	*hash = entry->val;
+	*rss_type = entry->type;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_skb_ext_load_rx_vlan - Load the stored VLAN tag of this packet.
+ * @ctx: XDP context pointer.
+ * @vlan_proto: Return value pointer for the TPID, in network byte order.
+ * @vlan_tci: Return value pointer for the TCI, in host byte order.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the VLAN tag is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_vlan(const struct xdp_md *ctx,
+					     __be16 *vlan_proto, u16 *vlan_tci)
+{
+	const struct xdp_skb_ext_vlan *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_VLAN);
+	if (!entry)
+		return -ENODATA;
+
+	*vlan_proto = entry->proto;
+	*vlan_tci = entry->tci;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_skb_ext_load_rx_csum - Load the stored RX checksum status of this
+ *                                packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: Return value pointer, ``XDP_CHECKSUM_NONE`` or
+ *             ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Return value pointer for the checksum level.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the checksum status is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_csum(const struct xdp_md *ctx,
+					     enum xdp_checksum *ip_summed,
+					     u8 *csum_level)
+{
+	const struct xdp_skb_ext_csum *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_CSUM);
+	if (!entry)
+		return -ENODATA;
+
+	*ip_summed = BIT(entry->ip_summed);
+	*csum_level = entry->level;
+
+	return 0;
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
@@ -1303,6 +1391,9 @@ BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_csum)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_hash)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_csum)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
 static const struct btf_kfunc_id_set xdp_skb_ext_kfunc_set = {
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283052;
	b=YEfZhl9AIJLI9rGJr0L2qIyK7+uuiYfIEzQiV1I+DQhsjA84ZpN5VJ+2dWE44rMqcWqt
	 xx0o5EhP3Ix3dUrhVAUAk4tjjoz1rfxySiqn6zP8ahu81JyEncgxblAMYJr0qDidVqgXG
	 tChXaAns8OUagn1W2XNt+givZIrLmIuz0rLFa7AQq6SSdzgQcVzLVuj37apHf+zArErOD
	 EJ5JV12oOHO4WlrSymiug3pKgsA8XvDbgWyT73w++p8xT9TOfCifWwbMHcToOpM7sl3HF
	 YzAaoBpf/8vLj12QUcghKNcHXSLfhvcfSfeuZrbB+HQUvOlGvEvDLrxTxTAvsacA51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m8+xowlUwN+TnOKNDaiztwvEmzRJ1pYtLtKYjKSdRBE=;
	b=ryyI0I6IyzY5rs2BYcuiIOpfnKNgardZwc3UjEBPKwlKD1xxb5gF+LNlHJw/Clw1gf/X
	 8fpakPv16e+hQEh3cB8OcR5bLS1sNEJ70CtATDxag8WKUL8J44l8aqIgjFw/2AjF+9yew
	 obo5cVCWoZCl0AiebqTovaNAO20C5DzGPSUKDNzMktx1SZIijgKNDYcLNC4sPNSSITg6x
	 Ivm2sFrNhf4/LtYxR95yPKYOcaOaRcWvIldC7n8MJAatWclPoThw7FbfY0g6Hy4Dl3Q2C
	 op6tDIoI84+jrNp8QP3ZvBumWSl1cnqvzyJ+/49xTqE8q6+5SR+rEy1fvVDXAomh3DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MK6mtqXb;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE1606A325
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBE1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MK6mtqXb
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so1707118a12.0
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283051; x=1794887851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8+xowlUwN+TnOKNDaiztwvEmzRJ1pYtLtKYjKSdRBE=;
        b=MK6mtqXbNk4WT/1S9ho5NdoI2is2csCT9O3qE/PGUQO8w4LLNVs7f/sUnxu0zaPgQ2
         EmyiaTKquIugpEedHeO5TfdOtAxW74b04ny1GqsCJgREqqcgEjFzIj2lvePnSUfUlu3m
         r9DEfTLMjofEjUdzzjmtBtzUWc3jbeeBPnhNSUvSIOnbzfRZNUFj4Fm/GqbHmp6fGPbU
         tvjKSJipGqwT6d/qujp/Ue5GEOJtN3Zy2j7BoIk1As/9LP/zBBt48Gl6XoFNIkV18axO
         fdyZNdzlxdxpWVl/so5PQ3EGawIK6woM1OgDaP2TOIyDylMbHYboM0etWA16NTV9mYDJ
         LTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283051; x=1794887851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8+xowlUwN+TnOKNDaiztwvEmzRJ1pYtLtKYjKSdRBE=;
        b=P9BDzxZpTXBqK/ka+S5wmlgj+X+0aYMUOW/DGeg+SLD4kGjHanHYj/nSPnsFrGRAXm
         /deM/Oj+70K2IgbRbQ2Bk0DfVaGsREbT15McEEC8+9ZIx7t95DsF+gtg1ek3dz+W0tqz
         mOFjGmxCDQ2MDSqPYs5OcFkzA+9DKluqqpAA1DEZukFeTzDuKA83Pk33wL+Jvi1af+R8
         f+CQQ6pzGEPtmyGYjMrWWX92Y5and2/s3QJHiDm4nm9a9qdVeUc2SanaWV/0AyrDKEQy
         8z3zKE+27pReYCb5lOt1y9gXuUl2CE4ZJkz/O3QrNIgDfKqZTfSun9kd0MrzmYRaGwbT
         z19A==
X-Forwarded-Encrypted: i=1; AL+hErHyYNVLiohHaXeEDuckjS+UOWNDvM6RcD92ufQMaO0mWM79/iFMx+0LD61d8fz31wwbvDT4@lists.linux.dev
X-Gm-Message-State: APuU4Z9AkfldFbVfogDF0PB1Q2p9boxsCYooEAUF2GfGCxIXL9dKn1SR
	pB3WycYp3TsltfhjtvKuTKnwBTRlUItn+0yGdtXpjx/vNLkCMUDUopbEGeYMFYEzkUc=
X-Gm-Gg: AYBFou1cgYZCMOnvlYSW26nTdmzkg5rCnUIfcdwRB92+DqW/PefNdjdo2mumd+qJ8N0
	UQ3tjtHGOudHE2y18EdMhLxUx7FmlC8/OjVpnCfIpdYZGIkCXsG3qvp9HofVpkC2QlgdAG7k5oD
	7Z7S4zv0p/M2oaRwCvbT2ad15eEZne/Aw0p+2SrLG9XlFGZlvEJycUsOcPZ/IYOyupyYTH/3mB9
	cDc2B64m73jy9/rDPpOY1NQofVHzXnxC2jIanMmmWEjavRM4HVxd3qxxcXgSwW02796WnvQB5ja
	4HbLdejUr4Zn6yMQIneI0ieji/4oI5jLZK47y0o9IBlNJfBpfCJ39tlcB1sgj1Bv+Ezd+uCfivC
	13MMfhxD8A+QVBgANWwoyH1QHSHEqLHBzInYQEPp6bKheqo6Bwc0/LF3H6pRtRiQhgnso9CvR3b
	7fUJ37Zf3L7SKXw7I3y5VhaZbvZ0OJvHCX2SVfYGh8nTERpy2nNBgJZhObAODUdSZN2x3A4IFdG
	Hnzi4NmwnYi+u+w1EswCiMMZAxwcvgL2/Xv402c6f5A1IpK+H1qezbmyM++w5+87nMwVCiVHVo8
	KR8T2zIP13NXyGRSLcq2GR6Z3W7PC9fQ8Q890Lnw4AZZdhJrN859Ay0xOtxryWzbxDbHcCy9xyQ
	tSi53KHXH
X-Received: by 2002:a05:6402:3227:b0:6b5:66cc:d828 with SMTP id 4fb4d7f45d1cf-6b7564c452dmr973212a12.7.1794283050804;
        Mon, 09 Nov 2026 19:57:30 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:28 -0800 (PST)
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
Subject: [PATCH bpf-next 03/15] xdp: add kfuncs to store RX hash and VLAN tag
Date: Tue, 10 Nov 2026 03:57:01 +0000
Message-ID: <f865ab08e7e0343bcd6eb380f7003ddd32d177e2.1794281983.git.tianyi@cloudflare.com>
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

Add bpf_xdp_skb_ext_store_rx_hash() and bpf_xdp_skb_ext_store_rx_vlan().
They store the RX hash and the VLAN tag in the skb core extension area.
A later patch sets the stored values on the skb built from the
xdp_frame.

Both kfuncs call xdp_skb_ext_add(), which reserves the entry for an id.
On the first store for a packet, it clears the header and sets
XDP_FLAGS_HAS_SKB_EXT, so stale headroom is never read as a header. A
second store of the same id, also after a delete, reuses its offset.

xdp_skb_ext_add() returns -EOPNOTSUPP for AF_XDP zero-copy buffers. User
space can write their headroom while the program runs, and could change
the header between two stores.

The store kfuncs are in their own kfunc set. They do not need a
device-bound program, so programs on cpumap and veth can call them.

bpf_xdp_skb_ext_store_rx_vlan() accepts only ETH_P_8021Q and
ETH_P_8021AD, because vlan_proto_idx() warns on any other TPID.

A BUILD_BUG_ON() in xdp_skb_ext_struct_check() limits the area to 64
bytes. As in skb_extensions_init(), the function is noinline
__no_profile so that it builds with CONFIG_GCOV_PROFILE_ALL.

The two kfuncs are based on bpf_xdp_store_rx_hash() and
bpf_xdp_store_rx_vlan() by Lorenzo Bianconi in Jesper's XDP_REDIRECT RX
hints series V2 [1].

Link: https://lore.kernel.org/all/175146831297.1421237.17665319427079757435.stgit@firesoul/ [1]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 net/core/xdp.c | 154 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 3 deletions(-)

diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8fd649..97dc0e403a78 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -990,11 +990,159 @@ bool bpf_dev_bound_kfunc_id(u32 btf_id)
 	return btf_id_set8_contains(&xdp_metadata_kfunc_ids, btf_id);
 }
 
-static int __init xdp_metadata_init(void)
+#define XDP_SKB_EXT_CHUNKSIZEOF(x) DIV_ROUND_UP(sizeof(x), XDP_SKB_EXT_ALIGN)
+#define XDP_SKB_EXT_ENTRY_ACTIVE BIT(7)
+
+struct xdp_skb_ext_hash {
+	u32 val;
+	u32 type; /* enum xdp_rss_hash_type */
+};
+
+struct xdp_skb_ext_vlan {
+	__be16 proto;
+	u16 tci;
+};
+
+static const u8 xdp_skb_ext_type_len[] = {
+	[XDP_SKB_EXT_HASH] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_hash),
+	[XDP_SKB_EXT_VLAN] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_vlan),
+};
+
+/* Limit the header and all entries to 64 bytes, so that a new entry
+ * cannot grow the area without notice.
+ */
+static noinline void __init __no_profile xdp_skb_ext_struct_check(void)
+{
+	unsigned int chunks = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(xdp_skb_ext_type_len); i++)
+		chunks += xdp_skb_ext_type_len[i];
+
+	BUILD_BUG_ON(chunks * XDP_SKB_EXT_ALIGN > 64);
+}
+
+static void *xdp_skb_ext_add(struct xdp_buff *xdp, enum xdp_skb_ext_id id)
+{
+	struct xdp_skb_ext *ext = xdp_skb_ext(xdp->data_hard_start);
+	bool valid = xdp_buff_has_skb_ext(xdp);
+	unsigned int newlen, newoff;
+	void *start;
+
+	/* User space can write the headroom of AF_XDP zero-copy buffers */
+	if (xdp->rxq->mem.type == MEM_TYPE_XSK_BUFF_POOL)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (!valid) {
+		newoff = XDP_SKB_EXT_CHUNKSIZEOF(*ext);
+		newlen = newoff + xdp_skb_ext_type_len[id];
+	} else if (ext->offset[id]) {
+		newoff = ext->offset[id] & ~XDP_SKB_EXT_ENTRY_ACTIVE;
+		newlen = ext->chunks;
+	} else {
+		newoff = ext->chunks;
+		newlen = newoff + xdp_skb_ext_type_len[id];
+	}
+
+	start = xdp_data_meta_unsupported(xdp) ? xdp->data : xdp->data_meta;
+	if ((void *)ext + newlen * XDP_SKB_EXT_ALIGN > start)
+		return ERR_PTR(-ENOSPC);
+
+	if (!valid) {
+		memset(ext->offset, 0, sizeof(ext->offset));
+		xdp->flags |= XDP_FLAGS_HAS_SKB_EXT;
+	}
+	ext->offset[id] = newoff | XDP_SKB_EXT_ENTRY_ACTIVE;
+	ext->chunks = newlen;
+
+	return (void *)ext + newoff * XDP_SKB_EXT_ALIGN;
+}
+
+__bpf_kfunc_start_defs();
+
+/**
+ * bpf_xdp_skb_ext_store_rx_hash - Store the RX hash of this packet.
+ * @ctx: XDP context pointer.
+ * @hash: RX hash value.
+ * @rss_type: RSS hash type, see &enum xdp_rss_hash_type.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENOSPC`` : not enough headroom for the entry
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_store_rx_hash(struct xdp_md *ctx, u32 hash,
+					      enum xdp_rss_hash_type rss_type)
 {
-	return register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP, &xdp_metadata_kfunc_set);
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext_hash *entry;
+
+	entry = xdp_skb_ext_add(xdp, XDP_SKB_EXT_HASH);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	entry->val = hash;
+	entry->type = rss_type;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_skb_ext_store_rx_vlan - Store the VLAN tag of this packet.
+ * @ctx: XDP context pointer.
+ * @vlan_proto: VLAN tag protocol identifier (TPID), in network byte order.
+ * @vlan_tci: VLAN TCI, in host byte order.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @vlan_proto is not 802.1Q or 802.1AD
+ * * ``-ENOSPC`` : not enough headroom for the entry
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
+					      __be16 vlan_proto, u16 vlan_tci)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext_vlan *entry;
+
+	if (vlan_proto != htons(ETH_P_8021Q) &&
+	    vlan_proto != htons(ETH_P_8021AD))
+		return -EINVAL;
+
+	entry = xdp_skb_ext_add(xdp, XDP_SKB_EXT_VLAN);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	entry->proto = vlan_proto;
+	entry->tci = vlan_tci;
+
+	return 0;
+}
+
+__bpf_kfunc_end_defs();
+
+BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
+
+static const struct btf_kfunc_id_set xdp_skb_ext_kfunc_set = {
+	.owner = THIS_MODULE,
+	.set   = &xdp_skb_ext_kfunc_ids,
+};
+
+static int __init xdp_kfunc_init(void)
+{
+	int ret;
+
+	xdp_skb_ext_struct_check();
+
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP,
+					&xdp_skb_ext_kfunc_set);
+	return ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP,
+						&xdp_metadata_kfunc_set);
 }
-late_initcall(xdp_metadata_init);
+late_initcall(xdp_kfunc_init);
 
 void xdp_set_features_flag_locked(struct net_device *dev, xdp_features_t val)
 {
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283078;
	b=vUEAq5AT1yOseMG4gAr1WwRRZ1VjnsL6H56qwHEvJj7YLywFm4cdx15jBhI4/eifCAU6
	 wLUZpO6iwEv1JE3ZKGC1xj++l5UWNZBQO0u/aFzNuUDSe5NaNjqWOk1vXM9wnO9GjM747
	 sPWLM1XDvBAtSIdIhul+ReWAW96J+Ep2GZZFv+GG7/IyWfCI8OtaiZL51hhvR0fsIE/RN
	 mg8qk8wKk4cyiiK5hFzypagRwWq5M1Bf4syKGVvCwIY+e+8oP0j9WaPkUPq7mmPoF+/4O
	 N1L3GJmChvOVxM4yDl4oQ6qgp8JmUBRejVC/o41rUmEDfgNPICyvc3/ApjM2WyD42xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
	b=cs4Wj+sKbpDdHUvxAWtjjqhhZ8PJi1tHth1YN4BKImiJTBDblP/ihiqdxk4Q0oLujf7/
	 /8BKP1H/jCQUbuVgsxpA6UDGuNFslun7DomMIS69HGznz2QbH5tchkq5b3SDfIdeOj/VC
	 Y252j5gU1jaZiCzOiD4t+AjtXvHTZHNESXF2zdr2LPVpB90LBeLCdVu6eWRGpYoCj1/4P
	 PvlhBUWhvtpdLlsjhXDoGqQglmTTWXc4zTqL/iRYzK/yrKwovsCA1SAvUOGxTCE5es4Ru
	 ks9LVHb0RBHlFIuE90FogUpGsrKm6QQSsK9q3uqSUd2fKLkEUIX2Pic5wvrdIaiok3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SqDRkRwS;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940060A2627
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0940060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SqDRkRwS
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso321983a12.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283076; x=1794887876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
        b=SqDRkRwS/045hcMMYfctMTXSRuj2/70F6RiORqzz7GdhauBkrwHoyoFDfg9+L4g6I9
         3d8YvcaBpfkU12R6SLBNgmIkhymtuXZ228gOGCg0qajeCEmPvUq9oChPIuKD3QrlEieN
         kG58LUA1TDrRFmsRBpsu/RccBfjpCrnrXJu+Lg19el/eiWvBO2ish9iyFtovD0ezqweh
         uuU85sAALBFDWXp2b/7Ky1hm8iqEUhBZW78fJBsh5Z1x4eYf1geSvYe7wIzk1fkitBQA
         QLIePWwJ/pvYfZBYMsKMYZQwU8De6olnoqkpxbWpsP9cumbVXGliPPtf09r1+guf7Isy
         s0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283076; x=1794887876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
        b=sSQLb5uGgMjTJV1fu9Yndh7iiREU4k0sh3Louw0wc1FvOtV1wZT8kaJk+o/nwO7ygn
         jJEqfMAXsObW+Ub7a3gJPU14Cavw3oNWaNHjWVmDUFUiaL9SYvKIriVp8u9MEv+BEwzW
         ZePQQn1aMHgBK5xb+aMpjVYTgXRm9lOXZY9FAEOrtlFE7CByTj+RW4/suI9FAh1FjRNC
         rtfsdR748ZXT4HBhyVwdHjig1f0FkaneFOtGyM/x5opM2hf2Nv5DUmUSkMxN1lWhEmkw
         VuMMToMNArFSmaJC9TaDHYWP/HbXRQ/QF/b9TD8Ac3pXffJuq7CuzHG0Nwv9Z2iSyPoU
         ejNQ==
X-Forwarded-Encrypted: i=1; AL+hErEFGO977P592s/bme8IMiLXemKhrQHOLzNQk6LW22qnokd4OezjBQ05NUM6ECgFmwa8ao1T@lists.linux.dev
X-Gm-Message-State: APuU4Z/SLfOkRniNDsFfrU9ksPVu6l/oeo7qkiZqysiU2HQjFu12tJ0r
	OxJBli/2EghC7WAwuYrdvHeVEPKcmBnCh90mH74Cv1BYtK95fsBVwrWgcBQmftJ/p4s=
X-Gm-Gg: AYBFou26+vZv+ayzhv6TS7Zl3J9SD28hm4dl1Jm5ngLS127sK+4updRkmSOHLdNsiyM
	cxAdCpTAjpU38CwD/wqizr8Nk+z5CvCU6iq61l2x61dh5mXhokzTZ6Fa6dZV8w1bVArqldZtwPA
	EtBuC5Fm/xjHbUoihLqN1V6Ga3rFGURi+QsdX+IsWVBWjuI9wo8dP8cuKLRbc+8DiVJhTzQ7WBJ
	WxhcaZW0UpPa0ZP+Ge33UEwp0EnmmvRAQcM+BVAro8piy6rii69Q/ot+VrG1i/D/BYIrpIw0ud7
	x7/PCel5DIB0WFy3x9B9f5NOg43/KNz5Dnov0hD3McGMK92Vp+94goo9jDlfESiGBL289kT6/wS
	Yh0udh7IVZjkestr/PSg6xIanULKZei62XwdrSaiW0RPQesONTQflSyzebAYF1s0hXTnfxKjMMC
	iU10vjn5XKlEDV55FnVL/WhodMfEc47XthYpIFLKVxEh7PRfT51vpjGBFdtXyhvCKMjYVZf3c37
	4Hkuoh3HFs5PPCBkOR8J/Hi/crvQ9XdcdGFu6u/rQcKy7QjQFXwTeB5Iidn4qcdB4Z6GVkO0TRW
	/NL7l3QiDItk1A4fPO/tlTInKSEG8Om2ibtUsyPrA6fQ0aTnfrRs+JiKIzEW1q0=
X-Received: by 2002:a05:6402:214b:b0:6b3:c320:8858 with SMTP id 4fb4d7f45d1cf-6b756ae734emr681477a12.24.1794283076584;
        Mon, 09 Nov 2026 19:57:56 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:54 -0800 (PST)
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
Subject: [PATCH bpf-next 10/15] xdp: warn on XDP_PASS with stored values when XDP runs on an skb
Date: Tue, 10 Nov 2026 03:57:08 +0000
Message-ID: <15f830924c4d06d3d8c7e41fb8a9f8c29b63d9a7.1794281983.git.tianyi@cloudflare.com>
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

On XDP_PASS, when XDP runs on an skb, the stored values are lost, because
the skb already exists. This happens in bpf_prog_run_generic_xdp() for
generic XDP and for cpumap and devmap programs on an skb. It also
happens in veth_xdp_rcv_skb() when veth receives an skb from its peer.
veth has the skb-ext-pass feature, so bpf_prog_run_xdp() does not warn
for it.

Add xdp_skb_ext_warn_skb(). bpf_prog_run_generic_xdp() and
veth_xdp_rcv_skb() call it on XDP_PASS with stored values, whatever the
device features.

Generic XDP also runs bpf_prog_run_xdp(). On a native XDP device without
the feature, it would warn twice. So xdp_skb_ext_warn_pass() skips
generic XDP.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Tested on virtio_net and veth: generic XDP prints only the new warning,
and BPF_PROG_RUN without live frames prints none.
---
 drivers/net/veth.c |  2 ++
 include/net/xdp.h  |  2 ++
 net/core/dev.c     |  2 ++
 net/core/xdp.c     | 21 ++++++++++++++++++++-
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index b402f8ed5096..f0d279e2da6a 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -826,6 +826,8 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
 
 	switch (act) {
 	case XDP_PASS:
+		if (unlikely(xdp_buff_has_skb_ext(xdp)))
+			xdp_skb_ext_warn_skb(xdp_prog, xdp);
 		break;
 	case XDP_TX:
 		veth_xdp_get(xdp);
diff --git a/include/net/xdp.h b/include/net/xdp.h
index 7148e8ef00e1..596261ed9cca 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -511,6 +511,8 @@ static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext);
 void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 			   const struct xdp_buff *xdp);
+void xdp_skb_ext_warn_skb(const struct bpf_prog *prog,
+			  const struct xdp_buff *xdp);
 
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
diff --git a/net/core/dev.c b/net/core/dev.c
index 3bf00e7e1a85..e37c881d968b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5705,6 +5705,8 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	orig_eth_type = eth->h_proto;
 
 	act = bpf_prog_run_xdp(xdp_prog, xdp);
+	if (unlikely(xdp_buff_has_skb_ext(xdp)) && act == XDP_PASS)
+		xdp_skb_ext_warn_skb(xdp_prog, xdp);
 
 	/* check if bpf_xdp_adjust_head was used */
 	off = xdp->data - orig_data;
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 36d6bb38b719..984299199906 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -18,6 +18,7 @@
 
 #include <net/hotdata.h>
 #include <net/netdev_lock.h>
+#include <net/netdev_rx_queue.h>
 #include <net/xdp.h>
 #include <net/xdp_priv.h> /* struct xdp_mem_allocator */
 #include <trace/events/xdp.h>
@@ -1124,12 +1125,17 @@ void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 			   const struct xdp_buff *xdp)
 {
-	const struct net_device *dev = xdp->rxq->dev;
+	const struct xdp_rxq_info *rxq = xdp->rxq;
+	const struct net_device *dev = rxq->dev;
 
 	/* The skb is built later from the xdp_frame */
 	if (prog->expected_attach_type == BPF_XDP_CPUMAP ||
 	    prog->expected_attach_type == BPF_XDP_DEVMAP)
 		return;
+	/* Generic XDP and BPF_PROG_RUN use the netdev_rx_queue xdp_rxq */
+	if (rxq->queue_index < dev->num_rx_queues &&
+	    rxq == &dev->_rx[rxq->queue_index].xdp_rxq)
+		return;
 	/* No native XDP, so only generic XDP or BPF_PROG_RUN runs on dev */
 	if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC))
 		return;
@@ -1139,6 +1145,19 @@ void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 }
 EXPORT_SYMBOL_GPL(xdp_skb_ext_warn_pass);
 
+/**
+ * xdp_skb_ext_warn_skb - Warn that XDP_PASS on an skb loses the stored values.
+ * @prog: The XDP program that returned XDP_PASS.
+ * @xdp: The packet, with the XDP_FLAGS_HAS_SKB_EXT flag, built on an skb.
+ */
+void xdp_skb_ext_warn_skb(const struct bpf_prog *prog,
+			  const struct xdp_buff *xdp)
+{
+	pr_warn_once("XDP_PASS on prog %s (id %u): dev %s runs XDP on an skb, the stored RX metadata is lost\n",
+		     prog->aux->name, prog->aux->id, xdp->rxq->dev->name);
+}
+EXPORT_SYMBOL_GPL(xdp_skb_ext_warn_skb);
+
 __bpf_kfunc_start_defs();
 
 /**
-- 
2.56.0


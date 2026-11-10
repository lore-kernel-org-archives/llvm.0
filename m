Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283074;
	b=2DRyfJGpIORyeWL6a56Yrzy/jtJ80ZaOwJBb/j6JCiV7zq+UpzpYuUjGVo5obd7JzdfU
	 B4Gd77onpcMc8J464hRd13iSTZnib/iH7K7np8u6c2fJeyxaDLQhpXIuGrg94a1upUked
	 4JhYsPuPj8fV8IsMxjM13N+uucgTEl7LvW8djDZXluZn6KfHVf9nueZl01zGilnQ5/eI2
	 LxArUtuUbS2mb92v5xdGETqv/3fPvNZjLoKr8wBte9yiSVIZ56TEvfNl/r17P1aBFYzzE
	 kJPsJ8MEUDs52ns6zG2hAZcql88GYZqr/LgMpI8CWsGsgweBx5BR3aH+DQ//CGxc7hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x6UAY2B85t0xEciqSymh7Wj670TZwRf8zeEzMQKeumk=;
	b=1M2rmSIpnLyi6sCG36tntx40Ejj9ttZUat+PpAeoKi0/l818T/4/7QFUVf4itQtwYEzQ
	 lfsm1W2rz5qjiMjpOjkrN810vuf7x49L3PlNMFi3j8PdrUb7ZWQTejx4WV7t63EYOlpyW
	 Z6UpRSy7j7AajZN7U7fKX1xydqfZbBHioIXumCmNbJDNpfRPg4yknGYnFIOXsAgz5l0wN
	 aiJs/abnPbyOYNKwbbqlcnNtSUjqaeaEsB2/sBw9/VbwW7rr1b90hwuwFoW/hLNdWChXZ
	 VRbe/ouC4bY7o1dwXdJ9No+aC/4Wv6cNNjN7mRT70kkRHUFVOt4X8jbPdLjVNAagK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eFGsODHH;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08C60A2602
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA08C60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eFGsODHH
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so355610a12.0
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283072; x=1794887872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6UAY2B85t0xEciqSymh7Wj670TZwRf8zeEzMQKeumk=;
        b=eFGsODHH9PiIXXu6VrkCGpD7HfCff+kbWPc+N+GpoeQTN8QqKegagoIgtfUZPtQx+6
         KdOiBgXCtR2W1SMxmzw1fvgom/Si+2GvQ5A4FnmRkHKoggr8NwV/CgmMTVKAXxlFGuDo
         6tPnJhJFUwt6+fm9A1JboSMpGuhh7Kf5sriw790XTe0bAFDN240E+4ZgYy7YEpninPJ0
         s8cLnV5tM1YvPAIjHoaAupA+K4JCbCfutNNnMM/68y7zhdGnFpJRSlhCv7CKLVEfZvtU
         d+LcEYmEMpTqBBym+mbNwNWswC86TpZm1HLfLf0wLwYXKz5fKZpdFtHaflZ1xv0rhLKo
         12yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283072; x=1794887872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6UAY2B85t0xEciqSymh7Wj670TZwRf8zeEzMQKeumk=;
        b=WFH+v4SrtzJ4KmLrf7RtIEaf2aHBhiIhzG8twFxTCYvsqqA4WSwcnbRE+c+QqyqdXM
         5OFIqCvtGno/mPzysJv1vVHAyxeKDZDPUJnjwdUcXf9EjfO761mpO5Jzqq3SJi98PthN
         Jc39MtSqBEXyWVdLBpKUeSdPB4qzL8sZ+HsJlDDnoKx8h5G5LxhdNdKDUxYz6OXteeu0
         bVKe2nT4Cf5or1+dW1fTH4M2ZxUD762aThLoN5S/n3kZx8v/D+h8i315v/+tDk8HkI8N
         Px7h3s3ichOeMgp26QIq+WZpB8OKlhW9MQ7ZOoRaGl/0830Qn6fGBfuHSADJeQLG3pgi
         JowQ==
X-Forwarded-Encrypted: i=1; AL+hErFTIbPCBrtdf4Bg4xUfhE2TyW9hB3ks6Jx3vJ/lsHB6r5dbyC0fkzUs8B4+rGu11i1akaJ5@lists.linux.dev
X-Gm-Message-State: APuU4Z+a8grMZPwkscx+hhsnZjMunTYD8CR0gvQsB25UTU/fN3vqsGAk
	oEBH6TNSIF09yAxAaUo3R7YBHVI4pDSUmQT8yt98jp638Tcs3gbXXCIXD6ZZxSaMKH4=
X-Gm-Gg: AYBFou2z72i3v78BGtEk6y92xJqba7yMjw1lfh3UcR/0SzMWmg9hTIB1kezb4jXS4+p
	HQ0qf2cKvZK3sHAtwgBk+Mw1HdwcUQpV2lgoaDNhtl6lc71lDA9TqBDAJbDA1ImZ5ffRgbKTI03
	NFkQwFWsgV5iTzIVlCkjx5JfiLjT1VytvLZ2X4w00izbzWtdJCeQH9v4MLcOA/rhip4uxLyESk0
	1ZG87BO0gRbTmWAfecpRT0Rr2YQfWzfRZaFCPQyc+gpjNvwIbVbYZ5cnA4j/eDYJ/gz0ZX3p1Xw
	IP1ZIVyx/iD2iBb9Ovy/8PMrx/ycep5cvlIW4tr1JsGai+4A45c80BZzlTQ28o5ONpqBqFthSzM
	P36S0ue/xHOgmkO3P1rSFg76dYTovj821gSlwjc6ZaOxHplLER34ZmMaXfa9PVGZMIiIsq/3Z+B
	Asvps+Iy7Yr+Gm1t9LAH6jf+6zLoHrKXqQx3mYzsxTc1SGcY4CZmfuZSDrRuOCPxu8ZR+s+eI40
	AOj3ya6MLuu7B4MIfLVczc+81USNGIN2FXrwS+cV9w17IEwiFNSbwioBy7IsvRPBLn6JnxkgYf7
	LhAbV/Pyais63/zTIotnbkvX1L2lrlnmEBjL6UXOwWkmXKJqEU4XAvHgw/VLWQs=
X-Received: by 2002:a05:6402:4489:b0:6b5:8200:5008 with SMTP id 4fb4d7f45d1cf-6b756b229f1mr1030422a12.45.1794283072341;
        Mon, 09 Nov 2026 19:57:52 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:51 -0800 (PST)
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
Subject: [PATCH bpf-next 09/15] xdp: add the skb-ext-pass XDP feature and warn without it
Date: Tue, 10 Nov 2026 03:57:07 +0000
Message-ID: <aec6f3eaaab68e0fa7e4d7ee24695602f08503e3.1794281983.git.tianyi@cloudflare.com>
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

On XDP_PASS, only drivers that call xdp_skb_ext_to_skb() set the skb
fields from the skb core extension area. Other drivers silently ignore
the stored values.

Add the XDP feature NETDEV_XDP_ACT_SKB_EXT_PASS ("skb-ext-pass") for
such drivers. veth sets it, and ice sets it in a later patch. User
space reads it with netdev netlink, and an XDP program reads
xdp->rxq->dev->xdp_features after bpf_cast_to_kern_ctx().

On a native XDP device without the feature, bpf_prog_run_xdp() warns
once on XDP_PASS with stored values, like bpf_warn_invalid_xdp_action().
For a packet without stored values, this adds one check of xdp->flags.
Programs on cpumap and devmap are skipped, because the skb is built
later from the xdp_frame.

BPF_PROG_RUN with BPF_F_TEST_XDP_LIVE_FRAMES builds the skb from the
xdp_frame and sets the stored values. It still warns when its
ingress_ifindex names a native XDP device without the feature, because the
check only looks at the device features.

Update the veth and bond feature checks in the xdp_do_redirect and
xdp_bonding selftests.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 Documentation/netlink/specs/netdev.yaml       |  5 ++++
 drivers/net/veth.c                            |  3 ++-
 include/net/xdp.h                             |  6 +++++
 include/uapi/linux/netdev.h                   |  6 ++++-
 net/core/xdp.c                                | 24 +++++++++++++++++++
 tools/include/uapi/linux/netdev.h             |  6 ++++-
 .../selftests/bpf/prog_tests/xdp_bonding.c    |  8 +++----
 .../bpf/prog_tests/xdp_do_redirect.c          |  8 +++----
 8 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 4303593e5003..7979b1ad38c7 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -50,6 +50,11 @@ definitions:
         doc: >-
           This feature informs if netdev implements non-linear XDP buffer
           support in ndo_xdp_xmit callback.
+      -
+        name: skb-ext-pass
+        doc: >-
+          This feature informs if netdev sets the skb fields from the skb
+          core extension area when it builds the skb after XDP_PASS.
   -
     type: flags
     name: xdp-rx-metadata
diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 3eca92d3dc60..b402f8ed5096 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1304,7 +1304,8 @@ static void veth_set_xdp_features(struct net_device *dev)
 		struct veth_priv *priv_peer = netdev_priv(peer);
 		xdp_features_t val = NETDEV_XDP_ACT_BASIC |
 				     NETDEV_XDP_ACT_REDIRECT |
-				     NETDEV_XDP_ACT_RX_SG;
+				     NETDEV_XDP_ACT_RX_SG |
+				     NETDEV_XDP_ACT_SKB_EXT_PASS;
 
 		if (priv_peer->_xdp_prog || veth_gro_requested(peer))
 			val |= NETDEV_XDP_ACT_NDO_XMIT |
diff --git a/include/net/xdp.h b/include/net/xdp.h
index 7c9a812b6e86..7148e8ef00e1 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -509,6 +509,8 @@ static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 }
 
 void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext);
+void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
+			   const struct xdp_buff *xdp);
 
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
@@ -771,6 +773,10 @@ static __always_inline u32 bpf_prog_run_xdp(const struct bpf_prog *prog,
 			act = xdp_master_redirect(xdp);
 	}
 
+	if (unlikely(xdp_buff_has_skb_ext(xdp)) && act == XDP_PASS &&
+	    !(xdp->rxq->dev->xdp_features & NETDEV_XDP_ACT_SKB_EXT_PASS))
+		xdp_skb_ext_warn_pass(prog, xdp);
+
 	return act;
 }
 #endif /* __LINUX_NET_XDP_H__ */
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 9026e0414fbe..a450e63cb941 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -25,6 +25,9 @@
  *   XDP buffer support in the driver napi callback.
  * @NETDEV_XDP_ACT_NDO_XMIT_SG: This feature informs if netdev implements
  *   non-linear XDP buffer support in ndo_xdp_xmit callback.
+ * @NETDEV_XDP_ACT_SKB_EXT_PASS: This feature informs if netdev sets the skb
+ *   fields from the skb core extension area when it builds the skb after
+ *   XDP_PASS.
  */
 enum netdev_xdp_act {
 	NETDEV_XDP_ACT_BASIC = 1,
@@ -34,9 +37,10 @@ enum netdev_xdp_act {
 	NETDEV_XDP_ACT_HW_OFFLOAD = 16,
 	NETDEV_XDP_ACT_RX_SG = 32,
 	NETDEV_XDP_ACT_NDO_XMIT_SG = 64,
+	NETDEV_XDP_ACT_SKB_EXT_PASS = 128,
 
 	/* private: */
-	NETDEV_XDP_ACT_MASK = 127,
+	NETDEV_XDP_ACT_MASK = 255,
 };
 
 /**
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 9f311b3c0d2b..36d6bb38b719 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1115,6 +1115,30 @@ void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 	}
 }
 
+/**
+ * xdp_skb_ext_warn_pass - Warn if XDP_PASS does not use the stored values.
+ * @prog: The XDP program that returned XDP_PASS.
+ * @xdp: The packet, with the XDP_FLAGS_HAS_SKB_EXT flag, on a device
+ *	 without NETDEV_XDP_ACT_SKB_EXT_PASS.
+ */
+void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
+			   const struct xdp_buff *xdp)
+{
+	const struct net_device *dev = xdp->rxq->dev;
+
+	/* The skb is built later from the xdp_frame */
+	if (prog->expected_attach_type == BPF_XDP_CPUMAP ||
+	    prog->expected_attach_type == BPF_XDP_DEVMAP)
+		return;
+	/* No native XDP, so only generic XDP or BPF_PROG_RUN runs on dev */
+	if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC))
+		return;
+
+	pr_warn_once("XDP_PASS on prog %s (id %u): dev %s has no skb-ext-pass XDP feature, the stored RX metadata is lost\n",
+		     prog->aux->name, prog->aux->id, dev->name);
+}
+EXPORT_SYMBOL_GPL(xdp_skb_ext_warn_pass);
+
 __bpf_kfunc_start_defs();
 
 /**
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 9026e0414fbe..a450e63cb941 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -25,6 +25,9 @@
  *   XDP buffer support in the driver napi callback.
  * @NETDEV_XDP_ACT_NDO_XMIT_SG: This feature informs if netdev implements
  *   non-linear XDP buffer support in ndo_xdp_xmit callback.
+ * @NETDEV_XDP_ACT_SKB_EXT_PASS: This feature informs if netdev sets the skb
+ *   fields from the skb core extension area when it builds the skb after
+ *   XDP_PASS.
  */
 enum netdev_xdp_act {
 	NETDEV_XDP_ACT_BASIC = 1,
@@ -34,9 +37,10 @@ enum netdev_xdp_act {
 	NETDEV_XDP_ACT_HW_OFFLOAD = 16,
 	NETDEV_XDP_ACT_RX_SG = 32,
 	NETDEV_XDP_ACT_NDO_XMIT_SG = 64,
+	NETDEV_XDP_ACT_SKB_EXT_PASS = 128,
 
 	/* private: */
-	NETDEV_XDP_ACT_MASK = 127,
+	NETDEV_XDP_ACT_MASK = 255,
 };
 
 /**
diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_bonding.c b/tools/testing/selftests/bpf/prog_tests/xdp_bonding.c
index c42488e445c2..c61b01c58342 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_bonding.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_bonding.c
@@ -625,7 +625,7 @@ static void test_xdp_bonding_features(struct skeletons *skeletons)
 
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-		       NETDEV_XDP_ACT_RX_SG,
+		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "bond query_opts.feature_flags"))
 		goto out;
 
@@ -646,7 +646,7 @@ static void test_xdp_bonding_features(struct skeletons *skeletons)
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_NDO_XMIT |
-		       NETDEV_XDP_ACT_NDO_XMIT_SG,
+		       NETDEV_XDP_ACT_NDO_XMIT_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "bond query_opts.feature_flags"))
 		goto out;
 
@@ -663,7 +663,7 @@ static void test_xdp_bonding_features(struct skeletons *skeletons)
 	 */
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-		       NETDEV_XDP_ACT_RX_SG,
+		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "bond query_opts.feature_flags"))
 		goto out;
 
@@ -678,7 +678,7 @@ static void test_xdp_bonding_features(struct skeletons *skeletons)
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_NDO_XMIT |
-		       NETDEV_XDP_ACT_NDO_XMIT_SG,
+		       NETDEV_XDP_ACT_NDO_XMIT_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "bond query_opts.feature_flags"))
 		goto out;
 
diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_do_redirect.c b/tools/testing/selftests/bpf/prog_tests/xdp_do_redirect.c
index dd34b0cc4b4e..e1cd3b951dac 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_do_redirect.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_do_redirect.c
@@ -170,7 +170,7 @@ void test_xdp_do_redirect(void)
 
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-		       NETDEV_XDP_ACT_RX_SG,
+		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "veth_src query_opts.feature_flags"))
 		goto out;
 
@@ -180,7 +180,7 @@ void test_xdp_do_redirect(void)
 
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-		       NETDEV_XDP_ACT_RX_SG,
+		       NETDEV_XDP_ACT_RX_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "veth_dst query_opts.feature_flags"))
 		goto out;
 
@@ -195,7 +195,7 @@ void test_xdp_do_redirect(void)
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 		       NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-		       NETDEV_XDP_ACT_NDO_XMIT_SG,
+		       NETDEV_XDP_ACT_NDO_XMIT_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "veth_src query_opts.feature_flags gro on"))
 		goto out;
 
@@ -206,7 +206,7 @@ void test_xdp_do_redirect(void)
 	if (!ASSERT_EQ(query_opts.feature_flags,
 		       NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 		       NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-		       NETDEV_XDP_ACT_NDO_XMIT_SG,
+		       NETDEV_XDP_ACT_NDO_XMIT_SG | NETDEV_XDP_ACT_SKB_EXT_PASS,
 		       "veth_dst query_opts.feature_flags gro on"))
 		goto out;
 
-- 
2.56.0


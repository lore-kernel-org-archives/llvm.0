Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283091;
	b=lVeQmn6nqZpv0zP7HkDNmMxmc0aUa61JuHuktDZ0vH8vN8pt5QpgL4PSwn2FTIgUKoDw
	 JmBgEoiPZgvQvQz6NcE/FVR/w2P6/pdx6ACfPIoRsf0XvvJ4TpGKVRjC1JsQCcFjo7PcC
	 Vtf82W+INC3PYCeaOLoONOA8jcVqK7JIJlOVi5YNIGvVIZiPfTNi6Vjtlc/hDE1ZwmmYj
	 eZyz6LDbx2YbCRAGFS1K4y9a4pBSXC9ER/xwhe2wW6SYHBf6y5MrKsy8tFkVjG7rLaB71
	 VXKGAC6I8q26Qa3wOc6PRFr8+h5qLJFV0/uuILAMYw/HPT9Q7xWjX8601a9kU972oJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
	b=sCI6Oja1qiHrA/a4CBn/z5IxVSN9k8QT8Bxly6m3ItbFXmiFRnZNwqeJKfmAKEUiySAz
	 GAq5oyrEliCzHLvo0E8Kyb2o7bYyzNibheYnz5glg0LLLqAb4DtqwnCh57vOoa7BMQHrQ
	 nJbTLTQ4Ssw2LgePwrl6EbIO22fCFipfyj14KSK/M2PwPiuH+sPDLQui9yOYTEw3MkTe0
	 DRr0JeyH4WjJ0AcTJ6g6aQKEXXiS4fUVjXH/aXlz6x5TEsA6sM5v5N2Spolndxoinv4rE
	 S1sYdSfPd2Ukkty3QCFDqIj+3tvFoIiBWzuVmhkjkeQdka8d36Q83tT9iaL+mWyfjyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=O1+QTaA1;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE660A5BDF
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCE660A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=O1+QTaA1
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso2327666a12.3
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283090; x=1794887890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
        b=O1+QTaA1rH84WAYEUApBAWqciz0LII7WfgC4hQFiEuopYt16Dx0OLdeIqAbCequX3s
         cvfwHDnjm6yN06WcUtkgDFvtHjsI3kW1qiIVNepPPjGqOsep+8LPmGvJKJ7rzxaZSTzV
         vlQ+7u91iiCi6nNBTfBih8trRAbftNA18bO6t8KcoWFoj5hrRHTGdry4Azs6OB+byIK7
         FAcprE0I8kJI6qV1zfyS8eq1mQQiqbyz7VAJLoTD39UrQR5SIYiE62NBAEhyNIqCTcC3
         7Fyua3DvdgRASEG3a7FGVJsgmADaaKryiFKid+eEGHBDsgjItlJ5yn2MhkiL/SimGNmB
         m85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283090; x=1794887890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
        b=D+Y8qvGxKhu5gdoNs8bK7pWbpXmpp6sfNkIT2jU8vaTPZv1o7eGtigE0j0yXFYm4T+
         YvQ0QnDEGdG6K8nGKy5fBbAXFE6U357hYOjGUgcHGVno4JIerD7wSIQSBsjmakuSTPgs
         aE78baXanxpR5S2F7WACDIo4GsOC5XouoEHMnRSa14Dv09kXytEh+baHyDxXUtnuwKnv
         THgtZKOUuPkgfiNEPKsxQJno0oORASOIMeByBUln2kW2qbhfuSlIaiz5BjxmR/ENpYAY
         KQgpX4SkHsCVONba6z5o0CwR3nrkF9AcOFKVL9EkzdD7X5w3p7oUK02Ik1dJoGRc382/
         uzrg==
X-Forwarded-Encrypted: i=1; AL+hErEHBFpPOTYvvGyIhwyiPtgH8CgimrO6XjXLAJxhjICKnMS7F/xgUb4BgoTFrn3InZ+dPJLs@lists.linux.dev
X-Gm-Message-State: APuU4Z/VgapkyNM+XPIvbHJ9KccVeMd2yXu0j4rMC2TFckGNeCxjVXGM
	ZYVAQGGYTNyM4FB+7Hpowem3AQq6ica5GcefGJXfvR4YZ4th0Jv8hp+jLHxNSBSeqlU=
X-Gm-Gg: AYBFou0D/oS5yzHAPzUyCJiGi7SNPCz6cKv1oRfsuLfoctBMX5LNHnYch4kBZWHXtG9
	zptAvHUnw5USfbAYK+SEjRyHjY0b3jOnXZcu/Cpccd5dgLg/e3dlD85kV6rP0pRx8SQgHK2yiwC
	T++mzy8YWnMnJowKce+7MqpBVRabmjI7Hd3JEhNtspUFBTsVNqy/R8wnf8mDHv/qcoAg5t3QtVn
	LZfhnNoPl0P097htPUmN8yIOb84vErAIZAG5sZ2FhcASp2A2cTgwH6Dg7k4KjH8Eu4qklgLFU0N
	B0rDJn+au6GcMw6uepT1b8VBmTrwCXhq5YBbx9MDDI6fkF6yTE/wRa4SyTMNsz1ltSJWOJWBc0P
	Yj6b9448PEPL6tfX/ip2MOmluJO0gpGfSqbsaRbVK5DezAdohpD4q70uSb3bv6OVCYPb604R8qc
	kBaFRMSSImhzQzfbuP/qsngwCD0vTpeXD5JLBVaZGzpLwxLqJVNfxzv1vUZPPkjDyt8uRlQpMbD
	YEOy09zkud2fDwbmOb2XEPP9TgHkOs9vR/pMmpns2uStZRBvLnu7ZcELPd7edWLOB2RexdidX4C
	VBq8mE4xpbbwXlPC6IZSSya61a4Uy/qGdDDX495nha5BrAkP/NJnBr7rTCPgnkwh
X-Received: by 2002:a05:6402:5626:b0:6b6:efc4:9eb2 with SMTP id 4fb4d7f45d1cf-6b7556282afmr914079a12.0.1794283089889;
        Mon, 09 Nov 2026 19:58:09 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.58.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:58:08 -0800 (PST)
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
Subject: [PATCH bpf-next 14/15] selftests/bpf: Test the load kfuncs on cpumap and veth
Date: Tue, 10 Nov 2026 03:57:12 +0000
Message-ID: <87e20fe4ae289764205f33920e90f3283a478e8a.1794281983.git.tianyi@cloudflare.com>
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

Add a test for the load kfuncs on each path of the xdp_skb_ext_to_skb
test. On XDP_PASS, the program that stores the values reads them back.
On cpumap and veth, the program after the redirect reads them. Each
test case compares them with the stored values. A load that finds no
entry, also after bpf_xdp_skb_ext_del(), must return -ENODATA.

With BPF_F_TEST_XDP_LIVE_FRAMES, a recycled page still holds the entries
of the previous packet. The live_frames test checks that a load returns
-ENODATA there.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 .../selftests/bpf/prog_tests/xdp_skb_ext.c    | 47 +++++++++++------
 .../selftests/bpf/progs/test_xdp_skb_ext.c    | 50 ++++++++++++++++++-
 tools/testing/selftests/bpf/xdp_skb_ext.h     |  2 +-
 3 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c b/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
index 64c6f0268d60..0811c09b7747 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
@@ -7,7 +7,6 @@
 #include "test_xdp_skb_ext.skel.h"
 #include "xdp_skb_ext_success.skel.h"
 #include "xdp_skb_ext_failure.skel.h"
-#include "xdp_dummy.skel.h"
 
 #define XDP_RSS_TYPE_L3_IPV4 BIT(0)
 #define XDP_RSS_TYPE_L4 BIT(3)
@@ -167,7 +166,9 @@ static void set_case(struct test_xdp_skb_ext *skel,
 	skel->bss->want = c->want;
 	skel->bss->del_hash = c->del_hash;
 	memset(&skel->bss->have, 0, sizeof(skel->bss->have));
+	memset(&skel->bss->loaded, 0, sizeof(skel->bss->loaded));
 	skel->bss->store_err = 0;
+	skel->bss->load_err = 0;
 	skel->bss->pkts_seen_tc = 0;
 }
 
@@ -191,8 +192,6 @@ static void check_have(struct test_xdp_skb_ext *skel)
 	bool unnecessary = (want->fields & SKB_EXT_FIELD_CSUM) &&
 			   want->ip_summed == XDP_CHECKSUM_UNNECESSARY;
 
-	if (!wait_pkt(skel))
-		return;
 	ASSERT_EQ(skel->bss->store_err, 0, "store_err");
 	ASSERT_EQ(have->hash, want->rx_hash, "hash");
 	ASSERT_EQ(have->l4_hash, !!(want->rx_hash_type & XDP_RSS_TYPE_L4),
@@ -208,6 +207,24 @@ static void check_have(struct test_xdp_skb_ext *skel)
 		  "csum_level");
 }
 
+static void check_loaded(struct test_xdp_skb_ext *skel)
+{
+	const struct xdp_skb_ext_vals *want = &skel->bss->want;
+	const struct xdp_skb_ext_vals *loaded = &skel->bss->loaded;
+
+	ASSERT_EQ(skel->bss->load_err, 0, "load_err");
+	ASSERT_EQ(loaded->fields, want->fields, "loaded_fields");
+	ASSERT_EQ(loaded->rx_hash, want->rx_hash, "loaded_rx_hash");
+	ASSERT_EQ(loaded->rx_hash_type, want->rx_hash_type,
+		  "loaded_rx_hash_type");
+	ASSERT_EQ(loaded->rx_vlan_proto, want->rx_vlan_proto,
+		  "loaded_rx_vlan_proto");
+	ASSERT_EQ(loaded->rx_vlan_tci, want->rx_vlan_tci,
+		  "loaded_rx_vlan_tci");
+	ASSERT_EQ(loaded->ip_summed, want->ip_summed, "loaded_ip_summed");
+	ASSERT_EQ(loaded->csum_level, want->csum_level, "loaded_csum_level");
+}
+
 static void test_frames(struct test_xdp_skb_ext *skel, const char *path,
 			enum xdp_skb_ext_deliver deliver, int ifindex)
 {
@@ -232,9 +249,12 @@ static void test_frames(struct test_xdp_skb_ext *skel, const char *path,
 		if (!test__start_subtest(name))
 			continue;
 		set_case(skel, &skb_ext_cases[i]);
-		if (ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &opts),
-			      "test_run"))
-			check_have(skel);
+		if (!ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &opts),
+			       "test_run") ||
+		    !wait_pkt(skel))
+			continue;
+		check_have(skel);
+		check_loaded(skel);
 	}
 }
 
@@ -266,6 +286,7 @@ static void test_veth_skb(struct test_xdp_skb_ext *skel, struct bpf_link *link,
 		goto out;
 	if (deliver == DELIVER_CPUMAP) {
 		check_have(skel);
+		check_loaded(skel);
 		goto out;
 	}
 	ASSERT_EQ(skel->bss->store_err, 0, "store_err");
@@ -275,6 +296,7 @@ static void test_veth_skb(struct test_xdp_skb_ext *skel, struct bpf_link *link,
 	ASSERT_EQ(have->vlan_tci, 0, "vlan_tci");
 	ASSERT_EQ(have->ip_summed, CHECKSUM_NONE, "ip_summed");
 	ASSERT_EQ(have->csum_level, 0, "csum_level");
+	check_loaded(skel);
 out:
 	close(sock);
 }
@@ -292,7 +314,6 @@ void test_xdp_skb_ext_to_skb(void)
 {
 	struct bpf_cpumap_val val = { .qsize = 192 };
 	int ifindex_src, ifindex_dst, tc_prog_fd;
-	struct xdp_dummy *skel_dummy = NULL;
 	struct test_xdp_skb_ext *skel = NULL;
 	struct bpf_link *link = NULL;
 	struct netns_obj *ns = NULL;
@@ -330,18 +351,13 @@ void test_xdp_skb_ext_to_skb(void)
 	    tc_prog_attach("veth_dst", tc_prog_fd, -1))
 		goto out;
 
+	val.bpf_prog.fd = bpf_program__fd(skel->progs.cpumap_load);
 	if (!ASSERT_OK(bpf_map_update_elem(bpf_map__fd(skel->maps.cpu_map),
 					   &key, &val, 0), "add cpumap entry"))
 		goto out;
 
-	skel_dummy = xdp_dummy__open_and_load();
-	if (!ASSERT_OK_PTR(skel_dummy, "xdp_dummy__open_and_load"))
-		goto out;
-
-	/* veth_dst takes xdp_frames only with an XDP program */
-	link = bpf_program__attach_xdp(skel_dummy->progs.xdp_dummy_prog,
-				       ifindex_dst);
-	if (!ASSERT_OK_PTR(link, "attach xdp_dummy"))
+	link = bpf_program__attach_xdp(skel->progs.veth_load, ifindex_dst);
+	if (!ASSERT_OK_PTR(link, "attach veth_load"))
 		goto out;
 
 	test_frames(skel, "pass", DELIVER_PASS, ifindex_src);
@@ -354,7 +370,6 @@ void test_xdp_skb_ext_to_skb(void)
 
 out:
 	bpf_link__destroy(link);
-	xdp_dummy__destroy(skel_dummy);
 	test_xdp_skb_ext__destroy(skel);
 	netns_free(ns);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c b/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
index a63206ff993d..34db1a986f3b 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <vmlinux.h>
+#include <errno.h>
 #include "xdp_skb_ext.h"
 #include <bpf/bpf_endian.h>
 #include <bpf/bpf_helpers.h>
@@ -14,6 +15,8 @@ SEC("xdp")
 int live_frames(struct xdp_md *ctx)
 {
 	__u8 *mark = (void *)(long)ctx->data;
+	enum xdp_rss_hash_type rss_type;
+	__u32 hash;
 
 	if (mark + 1 > (__u8 *)(long)ctx->data_end)
 		return XDP_DROP;
@@ -25,6 +28,9 @@ int live_frames(struct xdp_md *ctx)
 			reused_ok++;
 			bpf_xdp_adjust_meta(ctx, MAX_META_LEN);
 		}
+		if (bpf_xdp_skb_ext_load_rx_hash(ctx, &hash, &rss_type) !=
+		    -ENODATA)
+			reused_bad++;
 	}
 	if (bpf_xdp_skb_ext_store_rx_hash(ctx, 1, XDP_RSS_TYPE_L4_IPV4_TCP) ||
 	    bpf_xdp_skb_ext_store_rx_vlan(ctx, bpf_htons(ETH_P_8021Q), 1) ||
@@ -51,7 +57,34 @@ enum xdp_skb_ext_deliver deliver;
 struct xdp_skb_ext_vals want;
 bool del_hash;
 struct xdp_skb_ext_have have;
-int pkts_seen_tc;
+struct xdp_skb_ext_vals loaded;
+int pkts_seen_tc, load_err;
+
+static void load_all(struct xdp_md *ctx)
+{
+	int err;
+
+	err = bpf_xdp_skb_ext_load_rx_hash(ctx, &loaded.rx_hash,
+					   &loaded.rx_hash_type);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_HASH;
+	else if (err != -ENODATA)
+		load_err++;
+
+	err = bpf_xdp_skb_ext_load_rx_vlan(ctx, &loaded.rx_vlan_proto,
+					   &loaded.rx_vlan_tci);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_VLAN;
+	else if (err != -ENODATA)
+		load_err++;
+
+	err = bpf_xdp_skb_ext_load_rx_csum(ctx, &loaded.ip_summed,
+					   &loaded.csum_level);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_CSUM;
+	else if (err != -ENODATA)
+		load_err++;
+}
 
 SEC("xdp")
 int xdp_store(struct xdp_md *ctx)
@@ -99,6 +132,21 @@ int xdp_store(struct xdp_md *ctx)
 		return bpf_redirect_map(&cpu_map, 0, 0);
 	if (deliver == DELIVER_VETH)
 		return bpf_redirect(ifindex_out, 0);
+	load_all(ctx);
+	return XDP_PASS;
+}
+
+SEC("xdp/cpumap")
+int cpumap_load(struct xdp_md *ctx)
+{
+	load_all(ctx);
+	return XDP_PASS;
+}
+
+SEC("xdp")
+int veth_load(struct xdp_md *ctx)
+{
+	load_all(ctx);
 	return XDP_PASS;
 }
 
diff --git a/tools/testing/selftests/bpf/xdp_skb_ext.h b/tools/testing/selftests/bpf/xdp_skb_ext.h
index 11feee2fa31c..64d4a0511d0a 100644
--- a/tools/testing/selftests/bpf/xdp_skb_ext.h
+++ b/tools/testing/selftests/bpf/xdp_skb_ext.h
@@ -30,7 +30,7 @@ enum xdp_skb_ext_deliver {
 	DELIVER_VETH,
 };
 
-/* The entries that the XDP program stores */
+/* The entries that the XDP programs store or load */
 struct xdp_skb_ext_vals {
 	__u32 rx_hash;
 	__u32 rx_hash_type;
-- 
2.56.0


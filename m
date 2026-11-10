Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283056;
	b=qdLhDVTuicn2SLuWRom5yPFB+4sR6it2iPsJ2vSH5tcSCgbkWOq78tzmuMZPFH1aDwaZ
	 RZZoUdVz/G9gBZnXNK+qX4Dvuunw+Pf6B5/1r6q4WJqawknW5IK3n2V8vTjEUlxZw+ygZ
	 Xz8yzrdneYLGexTjObaamrH8TCykU7eUBBhGsvd++dgwTSLRpKIf4ZmGY7ftVqiPZxXIL
	 tNgMsdH5eLtpxS78i4f7NIaKbFZimu60ocnKOxu6xBBt8BE9Gl9I2IDQ6CP3XyyTyC9qF
	 jq6fl6v9Na3Fl3WqZIrDzayMHc3pndb83qC0ufvIoK4ccAJkhP5t/6DMWhrIn7wwrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
	b=h1f+4ctpp1epSNgnnSaay8bByZhd7qxf8Sf2guLbC/coz1QRihyvFqG4gF8Luh+IXx0p
	 iTm4x+VsYJ2pfS61YxzoBDSsk4YUHUJQfW2tQdEGMRE1oZj/JGuJTy8o+Ojo2qV3OX+84
	 f47cIpj1pr2L09lD3OovM5Bgl5CRzDcdqQI91/v7pvflf3SIIO3ibO6F3T+M7nt7U1ZsB
	 b8KiKx8wyDwOiWdIiL9YqAlKrWHfpeoRuJwdcgJCS9ErhA6eMTFQfQg1sP9fXOTuK0Iau
	 YyDk2YhOKqrkPP4g9D3e2kL2Co8cYRm1V5MrP87jcdRebf9gDmZnuIZUABRD+YSmYfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ftjh5RdO;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E80606A33B
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E80606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ftjh5RdO
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so232209466b.0
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283054; x=1794887854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
        b=ftjh5RdOl5wL+fP3vEEPlHGc78WRhrX/FmAN3FC3wa9WgswQP99j/RQLRPLLbAVsig
         XT3I9yjudIosnpHx14ClOrawAXywDkFhTem8iQitorVOnRqy3x+tLB8DIKnzhqikll2s
         tufOeYUg5kfmGW0VUD5PcJ6dXy3bqgktJ6lHaN3LpkaFVbbz+4Fswcptx7Sb2gZqxSPN
         MLvTNTMaWzqyFbS+WTmXJklNEMFMN7YYuSSIl0pJxn7l7jw/ZYs8igUkvyTqbs5Knm18
         zFTF/fZycCSK0EUTpHa9FPZv1DEiHKoJYoU+jvVzUmu4xdzoiY7Rs/GBu5WwAUw4RfAU
         9TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283054; x=1794887854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
        b=tiHTlbvRILcaTxJmTVgSjmQATwiEKXrfT7vERRrnDW6zWza5G/cekNuoFuXVwBlSYF
         fYXUcsH1WynRhKmUvZziAvO9mVaNtKn1kv3Wnpd8Vt7tN7z3dyh4XrhqvkQedBPsB/Is
         iKKVh+sa7BAybpgWWvQipclDqRbVK6P+1ZZpzfxUCkl0avl0z/G63GUxQOf48z+ubL/b
         zUF4fx32SFo5B6hZjmMCJx8RasxJwhGiRa/yfAuymivHcM2up8iAHtzL3FYN97rK5BOL
         /WmXsTQc5cQuYxuIiJiOyEISw9yeNb85PzpQTDog+zSPtGYM7PAB5iiydB+K4QjuMOpX
         Kvbg==
X-Forwarded-Encrypted: i=1; AL+hErG17X36fOx1Y+Jwnx7CrcoeyyjX2R6MXHN75Am5msJVRdcz8F6a7K4S/7QWONUBon8VOwg1@lists.linux.dev
X-Gm-Message-State: APuU4Z8OE05CDzSrVRj6bwvnVkLOsGos2t5wIdLzsjzFNow91A/ehzJG
	s8N14OH2jng4n3XJbDFamCjsdP+n80XXBLzUSBScyJ8feJ0U+lvhO2tVDiV+PwyWciI=
X-Gm-Gg: AYBFou20Fggv1klVP4blHbvKx0I5TQdDtpDMxqTjge120kQdILbCnauJtNGk+duIBeW
	RNFFfa3b0qga9c2emJIyi/oG5ureT4ZRAlGJIIlEmyjEX9vb9LL2+2a1/hXgE1oQRdhu8QOoFsJ
	LmwuLDdC9WanJjmp+sP7syzauNfZj0AhGXlee+NfkPIabg1gnPalHH5LaRjMFUyrJzEvNAf6e2A
	5gh0mMZKl9ue60AMpfI5vEAD+9J2y9d699Yv7JwXnSSa/edJaE4QUaJ+mNxIPnh7aORxkivXJ4M
	l05FEnSIJ22C+iT3kq1qjDx6c9qye3LNV8/weq8MJlPoZWjaCsagz1sOMiXIOykr9WI4Wb43tKd
	8w/o9gYjLPOj+nznh7sgA+yEkYRpFqsbxF2DXuon4L8UmDt0S3UAv/P4f0Ij9s7RKMGEfN4nyzo
	EEXYHo1qg0IjqYboSY/dezyc5/gEOeWC1dI7dojVhHQfgiLt1dhErMEpYi1unbnZCWdAkbKFOcE
	d239lLSp5Q034goxski15fykQkS/iO7+P6Md7dVPxQRMipa3lVT1lImSJzI7/YS2yB9PDfS0pZl
	1aaEPYqvf5cS8lUyz8n7kbnJkic+115PQTF+ernU/Ylzy1R3ZcrixL6nl8RUsoY=
X-Received: by 2002:a17:906:364f:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c504952c083mr70409766b.13.1794283054469;
        Mon, 09 Nov 2026 19:57:34 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:32 -0800 (PST)
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
Subject: [PATCH bpf-next 04/15] xdp: add a kfunc to delete skb core extension entries
Date: Tue, 10 Nov 2026 03:57:02 +0000
Message-ID: <2892d19e606e3809c268de0610a4ccc8bf68625a.1794281983.git.tianyi@cloudflare.com>
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

bpf_xdp_skb_ext_del() deletes the stored entry for an id. A program on
cpumap or veth can use it to drop RX metadata that an earlier program
stored.

Without the XDP_FLAGS_HAS_SKB_EXT flag, the kfunc does nothing, because
the header bytes may then belong to the packet.

The kfunc only clears XDP_SKB_EXT_ENTRY_ACTIVE, so a later store of the
same id reuses its offset. The flag and the size of the area stay the
same, also after the last delete. To give the bytes back, the kfunc
would have to move the entries after the deleted one. The cost is
headroom that bpf_xdp_adjust_head() and bpf_xdp_adjust_meta() cannot
use.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
__skb_ext_del() frees struct skb_ext after the last delete, because it
comes from a slab cache. The skb core extension area uses existing
headroom, so it is not freed.
---
 include/net/xdp.h |  8 ++++++++
 net/core/xdp.c    | 26 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index c888353425d4..23c976e92898 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -486,6 +486,14 @@ static __always_inline struct xdp_skb_ext *xdp_skb_ext(struct xdp_frame *frame)
 	return (void *)(frame + 1);
 }
 
+static __always_inline struct xdp_skb_ext *
+xdp_buff_skb_ext(const struct xdp_buff *xdp)
+{
+	if (!xdp_buff_has_skb_ext(xdp))
+		return NULL;
+	return xdp_skb_ext(xdp->data_hard_start);
+}
+
 static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 {
 	struct xdp_skb_ext *ext = xdp_skb_ext(xdp->data_hard_start);
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 97dc0e403a78..2c1d5ec3311b 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -991,6 +991,7 @@ bool bpf_dev_bound_kfunc_id(u32 btf_id)
 }
 
 #define XDP_SKB_EXT_CHUNKSIZEOF(x) DIV_ROUND_UP(sizeof(x), XDP_SKB_EXT_ALIGN)
+/* A deleted entry keeps its offset, without this bit */
 #define XDP_SKB_EXT_ENTRY_ACTIVE BIT(7)
 
 struct xdp_skb_ext_hash {
@@ -1119,11 +1120,36 @@ __bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_del - Delete a stored entry of this packet.
+ * @ctx: XDP context pointer.
+ * @id: Entry id, see &enum xdp_skb_ext_id.
+ *
+ * Return:
+ * * Returns 0 on success, also when the entry is not stored.
+ * * ``-EINVAL`` : @id is not a valid entry id
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_del(struct xdp_md *ctx, enum xdp_skb_ext_id id)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext *ext;
+
+	if ((u32)id >= XDP_SKB_EXT_NUM)
+		return -EINVAL;
+
+	ext = xdp_buff_skb_ext(xdp);
+	if (ext)
+		ext->offset[id] &= ~XDP_SKB_EXT_ENTRY_ACTIVE;
+
+	return 0;
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
 static const struct btf_kfunc_id_set xdp_skb_ext_kfunc_set = {
-- 
2.56.0


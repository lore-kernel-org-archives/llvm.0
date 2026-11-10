Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283048;
	b=KiQCT1eUGwAPYI69tMU+RMHdc4/Ore29JT1xSrMrP3oZZn8x329Mpv3BqLhaaFMM+Ftw
	 4hd+jAaQCwX5uqwV8v+WXoLVMy5p6bsXN3ayVs4+CSbxeCFRlHCoc4YUB8qQUvNUdMaSy
	 r9hAfuJgFcHtcgnMoTt86Falda+8f16qdVv5SgMvqOK5QVIXrq5CLRWMCZZei1W6obFLs
	 95ZGYKsbvXNthHlG6kWTbwM9tTHPMvGtmbNA7PnsT0xqhBg/h2zYw0+veWB8z8G32yfgg
	 5Hs1D8ZSDoFuX/zjWFD6eaOAfc1cqWAQYh7G0Rfc7hUpX4jKqZSMSHJwf/yL6wCPOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
	b=ChRc1P0GF/Qb+DnTxqM+GRW4QFvDJWM5GiiaZwAwSEUHduC3U2XQBw70NzU5DuCto5ls
	 kj4OAUMIAi5tuDhaU2S8TyZbblc0dwTaAD4G9GdbZ8xZ4MtRs9+NlPlBT4QAQeR9GMhMJ
	 v2agC/rjZLKudqd/8Zp/ZWT2khVMeDn9F/BJZ8QmXindX7G6gPyQ7NxY5SA0C2KFsZNrW
	 QA3rkkDgbKNAeON/Go6+EIuTsR4zHtLKYR5OboNrxH4y8ufCbqqPWYmn6n6u6Crr/mqig
	 Lp4lDZenDd3v+24s2w4sN5ZbKhvkvOgW1JoBhfVAlEJEFom8lycX8CHwoT+VQT3/IlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=KF2aW5Br;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A68606A32A
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A68606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=KF2aW5Br
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so693130a12.2
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283047; x=1794887847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
        b=KF2aW5BrMx/OzxECXfNVmCUlzShHWTCL7Fv1R+y/vyeEnB+HBMDvn22nQforwdKCxe
         TuwJ5py+RVg83z61pRCfxwizOB/eBwXZfZnaPKi+KQ6XR6eZ7ityw7F79atnub1OKP8W
         JJC6YsKR9b51d7RnbzTJBv7R+FvaOFT6Rz9S2pev9zVvAvOZBQMj0HCkRNXiv1gCwfyI
         rT7ZQoFhMZvNekVHuqicA2JRJFqFpCr2K+wlx5rU+2Fl1WmBmDUzwIwB14gaUnjJrTvB
         Tl/STKVeBz52bFeH1rvW/CE5yHEyADEdmeyi/I9jLQIuC2FB6sVrovKAd3Kle1Zccd84
         VVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283047; x=1794887847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
        b=nJ+sKYWkr0bJL7ksW7WEm9SeaPCMstKw6BI/16eTOIPW3uDgaad6jcyFA/G3i3BiYg
         XIuAz+Mah9LLWWvl8dJlmnCYQWHZ6XN0T1scpwcwFG9tB4HvMhaPU3aMf2hfx1aVEzFO
         UiaJmjKfVK00/dCBoSHin1Yu43ke8+f5m2eaYxuWCosdHOLiar/zNo27aMc9dg28MtMa
         eg74uzoYcxfBJ0PWyw5lDbxDDPABOUWjgt5ngF01cBsBURpemMsmeoXPg569I8WWVS2B
         eVpVDSOhSO2h8bkk2+ZoIBoMATXKGywuxnUVtpnxZQagltTdtdWTFWy5onrjoJfH/xgi
         NAXQ==
X-Forwarded-Encrypted: i=1; AL+hErHn7VpxMKnxIO/enGgq14Qp0NTk3Ywd4VwCTnIDM0k+8HJLe+Gvz2690pBaIwJ/PA86AxE5@lists.linux.dev
X-Gm-Message-State: APuU4Z/TxqJGdq5NcTNZiHysB0/ds3S8du2mLCPuoPI/+Xl/66/nUExx
	adwf5VWSyuGZpDG7jmWQguX3TyALRIFwWFnrwDN2lFWor2w1ICL9Lv5+EgRRDqNO4SQ=
X-Gm-Gg: AYBFou3FyHeTLJISt6ECKezMlLN+tzSuv1dXdy6OwxQ4NLJNksoULIUbEY77DV7ErVV
	38Up35eT/8YdZsmzT6S5nR26+/LdEfeMBHeQvPKkVcQM+MB0bT5IqCFuVcWbwDe+B2wY4hRqR3N
	psn9XOF5cp1ystdP+sF2yg4c3Vd0bOMIEqZ8Z+yjIDTXzIEF+bh5pyKEmXz2I/z2ndS+Rv9YIP4
	kjAmQaHMs4Z1Wo3zLPpYqlIgsdzuooAkRutgLXM5EXPdb0S6k4YW0azObEsIZpSrTRiwHORPbpo
	L7XkPHWv7gxsXfj6wzlQYDUaeZxq4x2+zeeeRzEdFBrTAkTC8gMEt1VwkGGvGegeAeVJP3yIbAd
	Sh5uVvKsMKRp7cNLYI6lnRdmQLtvaeZYB/vmYz1vuLlwNdwSU2zXF0hIy6SCSa2Db3K0S/jeKbv
	vGnb4uyW+B9NpM2fRBfElzfQgAPQi6imxIQZNartHug3fLv5zhWdm3S8vUhwjk3ica2Cuhoo+GF
	9alc5vcvGM5J03uLgNJiZz3jBep8R0OC2E0r/ykqV91EGzJyyuC/lumAz0uZXDkjC2d+zaye/I6
	e2kc6BRUktPAeZcMW1fFsnmU9OjfGGI9EPXabZf7OpsKqZbGgovXaHphfsPC5b6oBDzSNYvUd1r
	nX2cWQD6Z
X-Received: by 2002:a05:6402:c4d5:10b0:6b1:d344:c62a with SMTP id 4fb4d7f45d1cf-6b756ae6169mr667065a12.30.1794283046684;
        Mon, 09 Nov 2026 19:57:26 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:25 -0800 (PST)
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
Subject: [PATCH bpf-next 02/15] net: dpaa, dpaa2: clear the skb core extension flag
Date: Tue, 10 Nov 2026 03:57:00 +0000
Message-ID: <bff7f72c7c28f67497e23a6629b9e4db74332da6.1794281983.git.tianyi@cloudflare.com>
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

dpaa_run_xdp() and dpaa2_eth_run_xdp() move data_hard_start to the start
of the buffer after the XDP program runs and before XDP_REDIRECT.
xdp_skb_ext() then returns a different address from the one used while
storing the entries. These drivers have not implemented the XDP RX
metadata kfuncs. Hence they now clear the XDP_FLAGS_HAS_SKB_EXT flag
before XDP_REDIRECT, and their redirected frames carry no stored entries.

With the A050385 erratum workaround, dpaa already moves data_hard_start
before the XDP program runs, so the entries remain valid. The flag is
cleared on that path too, to keep the change simple. This can change
when dpaa implements the XDP RX metadata kfuncs.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c   | 2 ++
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ad2d8256eb8d..4cafc0b84dc9 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2654,6 +2654,8 @@ static u32 dpaa_run_xdp(struct dpaa_priv *priv, struct qm_fd *fd, void *vaddr,
 		/* Allow redirect to use the full headroom */
 		xdp.data_hard_start = vaddr;
 		xdp.frame_sz = DPAA_BP_RAW_SIZE;
+		/* data_hard_start moves, so the stored entries are lost */
+		xdp_buff_clear_skb_ext_flag(&xdp);
 
 		err = xdp_do_redirect(priv->net_dev, &xdp, xdp_prog);
 		if (err) {
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 7227a35dfaf2..fcefdc9daf2b 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -472,6 +472,8 @@ static u32 dpaa2_eth_run_xdp(struct dpaa2_eth_priv *priv,
 		/* Allow redirect use of full headroom */
 		xdp.data_hard_start = vaddr;
 		xdp.frame_sz = DPAA2_ETH_RX_BUF_RAW_SIZE;
+		/* data_hard_start moves, so the stored entries are lost */
+		xdp_buff_clear_skb_ext_flag(&xdp);
 
 		err = xdp_do_redirect(priv->net_dev, &xdp, xdp_prog);
 		if (unlikely(err)) {
-- 
2.56.0


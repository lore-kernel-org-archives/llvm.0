Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645514;
	b=OTzzyf9h4KB18+Xf4WXrCT/y/3r6LWKT+lFiUG9pSf6BaojO5v5PJiHraRg8kexaOjXl
	 ts4SwI6z6st4x+6exZO3q5nJAEy6lMY0V17U1B6x5MVjQRUezB0icy1H23TOdMXSmY/oG
	 mfNGfRudoU34j03n70u+nIHlaVfTZmwBkieHkCCcPx0v9NccEPjJOZg8hNc/Hspir/5B/
	 i3MxGNFn7gYbiNTYXl58or/roz2UOw+hU7lqpesJURd9mGpkBvkUoQLdebTGsqiU7OFjo
	 lRUwBpp4ZCKJRJTld27NHm55JOZLsLRDWRncbhqjYV3DrWfhu+t9j26DGIZnMYY3ytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tA8fanYUNEMCKg95/5mIB2W/4rmsixDLYX61xDs+OiI=;
	b=lj5Ql8ePUizOHT8ZAGInfpAZGVvnLbakR8pEuzYj3cV2SeTlNBeY8JSEV62tOFQITi8m
	 ySEAbOlhPUlnAbTTnbYM9YJBDsLntvBNvo6aZOtwbVMBLP6v7r2EBE42+f7hx6eBqsxOC
	 0oMFNISPbldxHYeY5dtdhGafVlwugTT6oTPHZFTYCqZEd/agQ0TeHj99MmAekLrpwqS7J
	 Iu0V58bOVSr+EcRqI6ph7gQGyHFL214y+r6zsMIveQAibDpHuvJEBdPnh7GRxiuGh4KQ3
	 9CAitFBHg4Auc0Y5X7pO1p3vdF+DYxOa8IVg9vwxpE8W26nawDsHzeMCe/im7YDp4Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLZ+jztx;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD147606A6BF
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD147606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLZ+jztx
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso10352762eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645513; x=1796250313; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tA8fanYUNEMCKg95/5mIB2W/4rmsixDLYX61xDs+OiI=;
        b=LLZ+jztxKMdOspnrIEitvmeLLapGHmydpl4vTM72y9uY5E8dggBXOHBJYECb27mdta
         qydh2HSPYKTrJ73e6TwyUDPTtqlms08HIuP6Fm8DFThhSSKuLVgicp9rJ0NYwXlATANr
         pXhZ6bnqY8860rzk4ln2XhZyRl4VaWMfm9zAuJcEnJR20ivdT1W0MyBeQBVCX0CduUmG
         TIiv5+iGCVAK3J9exIkz5NfltbQoebKxfRPaKm9FRRsMUMpefh1ohCWnO/2pv7boMt3Y
         KOxd+bg/zaQXws2JcD1GSttCwcZcxCey4BDJnx8f2HVeXIrafrkELfdwv92d+gHCDmHA
         nYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645513; x=1796250313;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tA8fanYUNEMCKg95/5mIB2W/4rmsixDLYX61xDs+OiI=;
        b=JgM/+Ud5ZbeFdH7yjVnoRiJed0NcnqEkMlgE4E1EGb8+cZQKGySADb5gaD5sh9oNuS
         0kFCi1Fj2JOezLBlCBOWibuymu8fKe7Ur1wOTTSuL3ve0BVOEOzeRhgaVHUj0vmTG8mY
         /nwqrx3+ZtGcr51mbr3vaMIsZcZ9Bg29gqYldb9Q5r5QXe3/3w90GOOaFGfzDaGN61X1
         R2m9sNpQfvvKJW7I+hMHL2lu66O0yH6MFymdYhA2QXlSpFMt/Qyy/+lpsLlRpgdnzlVX
         NAqDNW2sxEDLXEz4MwxT6Fg1QkXQujss6Jy9vBy/ZW3TrlXRSoJOKH+h7JrFLms2E2ZV
         ClZA==
X-Forwarded-Encrypted: i=1; AL+hErHu6FeTz/fr/qYS2EcJXKZrhEf7HzrrtEbiV2VJ3MFb8abynYNzH/5vKw6QG+mlF9i0bIDS@lists.linux.dev
X-Gm-Message-State: APuU4Z+g0PDVt5TNVhVCk5pgGad3h7nZLYTKnqdzOKWyLMgAms7dtn4F
	j48SjypCggFFqXxHiFS4zT3hZASIkhVZCimP/dx9F01SLhndNbffNFGM68KbIXvDOZQo8eockix
	ZoA==
X-Received: from dybkf17.prod.google.com ([2002:a05:7301:3a91:b0:359:198a:8046])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dd8b:b0:372:32a1:b384
 with SMTP id 5a478bee46e88-38571510675mr21473493eec.33.1795645512613; Wed, 25
 Nov 2026 14:25:12 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:03 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222503.1445426-1-elkin@google.com>
Subject: [PATCH] crypto: sa2ul - fall back to software when assoclen exceeds
 u8 enc_offset
From: Elkin Cruz <elkin@google.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In sa_aead_run(), req->assoclen (unsigned int) is assigned to
sa_req.enc_offset, which is a u8 field corresponding to the 8-bit
SA_CMDL_SOP_BYPASS_LEN_MASK hardware command-label field. The existing
fallback check only tests auth_size against SA_MAX_DATA_SZ (65535) and
the unsafe [240, 255] packet size window, allowing requests with
req->assoclen >= 256 to silently truncate enc_offset modulo 256 and
corrupt encryption/authentication offsets in hardware.

Fall back to the software AEAD implementation whenever
req->assoclen > U8_MAX, and compute auth_size in u64 to avoid 32-bit
size_t addition wrap-around.

Fixes: d2c8ac187fc9 ("crypto: sa2ul - Add AEAD algorithm support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/crypto/sa2ul.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
index f8216b5d3991..1d9cb5932b25 100644
--- a/drivers/crypto/sa2ul.c
+++ b/drivers/crypto/sa2ul.c
@@ -1771,17 +1771,18 @@ static int sa_aead_run(struct aead_request *req, u8 *iv, int enc)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct sa_tfm_ctx *ctx = crypto_aead_ctx(tfm);
 	struct sa_req sa_req = { 0 };
-	size_t auth_size, enc_size;
+	u64 auth_size;
+	size_t enc_size;
 
 	enc_size = req->cryptlen;
-	auth_size = req->assoclen + req->cryptlen;
+	auth_size = (u64)req->assoclen + req->cryptlen;
 
 	if (!enc) {
 		enc_size -= crypto_aead_authsize(tfm);
 		auth_size -= crypto_aead_authsize(tfm);
 	}
 
-	if (auth_size > SA_MAX_DATA_SZ ||
+	if (req->assoclen > U8_MAX || auth_size > SA_MAX_DATA_SZ ||
 	    (auth_size >= SA_UNSAFE_DATA_SZ_MIN &&
 	     auth_size <= SA_UNSAFE_DATA_SZ_MAX)) {
 		struct aead_request *subreq = aead_request_ctx(req);
-- 
2.56.1.839.g22a8290db9-goog


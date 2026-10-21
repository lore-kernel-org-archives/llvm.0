Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596439;
	b=BwBHU8XXhdSZY7mcaHWcpZyRJqTbaLjU1gVMgCwvXIS/rEZ8K1Og+cQxJyjnOwzsbgAm
	 2QOZkQYZ568dSrCfDBde48WiNGT516SBtjCGK7KT7Qr7moinqv/1Gse8zS70arr8CAPFk
	 bRssvIj0STzoCO2LmCsaAk5VzkT/oWoJ2AJYJdYaFaZTi0gzaF89IfXgCMzLQo1NlIO9a
	 pl2k3Pa750TrKz/2gNmHxmdrESBTO4yUy4C8inUxhavhYu9l5IPn0ijwfxMbnEKYHTh/K
	 7yynABuDV6n3dxQqgle2WDADm/JqG/G0E79LbC/ODKeozFmoAZ3rlln2TnYwR9J3o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
	b=CClFa/dyh72Od9R+hJiK9PNUlWfNzs07+vBxYkv9LLCr4V3ckHIh5WqPxhQvmFQb5j3o
	 pP2cOAnmjPaFimw3+uEW8cyl3GY+L6R95RBiyxRGjOVyY4W9aXQQYxyWyMPXUyzRjqoyi
	 z6RoveIl1d3ScbhIVVsIgtvvY6LQT/lSti7IP7a3DNatEh92cVabpxghLZOxMmu4F2Bwh
	 TUilL9RSyKSv7BRMEdx60w112zUdQIWDzxD6oy1Be96eE6aLQ3P+ViSoqGAuHLyThys8a
	 PCIxn5GRbUTBF9IlHr2yOu6EmklFF5luzLhJIHXVxJwbIep5PD+7fCN+6c2cRMyZb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Xy4lOznk;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFB606A323
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FFB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Xy4lOznk
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so2015205eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792596439; x=1793201239; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
        b=Xy4lOznk4C7aNjRzxBzkntaDnfQXJbTX9sbWStHNreQ5KckoY5eK+BsYUEWBHCvUQp
         VUPYpWRmGQDLu89d7yWniGfML7TQxmZOGa8QLLAZ6fXiybO6+J6Bn3S4ZxZWRjvL1L7p
         FdfoXrwi+7OIdOFWKdcOfd16+35Yu1k5ZVJsPPBij5NlnJUFG3TKHrbzPJ75mkCSE+hi
         EevZH4xHpebr2gLihWHykBcP6zN74SCV+elwGRYzoW0jXWMnBT/RKEnIvLf1A/y3ruV4
         qMm874xn06kaimxs6vmbycp8C7QZ+yCSFM1kJFzAYW2lAlYEEgPr67+YfwGj+TCpQZO7
         omHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596439; x=1793201239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
        b=zjyp3enYWDaCNEEGrHGlpCTTi0Sknr627SBJSSR9pXnmjUl/VG9xaqoLscy0EtBPN7
         SYZlPnpP87EQTCBFi2IE5LhI90aGZUq3V1+7Bu254mUsIO5GhU6w67IbcoXiWy7jgUTI
         bS8CxUJexzW8mlhOzUIxMGomXmV4dGd1kp5FUq0Z2NC/2brRDCVcEW6p6WfVM/Zv9JBL
         ks7pZ8MHFTaw8QD7b+pEltXZmNgAGMmTLl6u8UvuR9+bp77Ed8Hj0m0+cMAsLmRN8Adr
         ZsIZP/0BofN8/N6bvWXxveO7UxX1XWza+39Kx3sEZO1Pn1xwEwXWtjYfJsFs0qHvkIMH
         SUrw==
X-Forwarded-Encrypted: i=1; AKwUvByNK6YS/18Gwkh0Qjdt0DaMZ6S/8313/ia33VYyEP4FBzobW16F3QlGs871cmt9dpoSL760@lists.linux.dev
X-Gm-Message-State: AFq9FYI+c5Dqh8oYzSmrqfwuGE3Tls4aia3b8JBPD+iwU9Z1LDnrpFUF
	ifIynvdIw+PJpJe/Qa/rfmmn/I5QzCGMLnv4F+7T/MXxyPyMAWOKvxfOVulcDFB/c8tc7TwAGrP
	Q47aC8PkGfw==
X-Received: from dycpq4.prod.google.com ([2002:a05:7301:fd04:b0:34d:46b2:7513])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d185:b0:359:a6ed:41ab
 with SMTP id 5a478bee46e88-3674db50cd0mr3750142eec.36.1792596438073; Wed, 21
 Oct 2026 08:27:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:26:58 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021152658.2618709-1-gthelen@google.com>
Subject: [PATCH net] selftests/net: tcp_mmap: remove unused -k option and keepflag
From: Greg Thelen <gthelen@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit aacb0c2e524c ("selftests: net: tcp_mmap must use
TCP_ZEROCOPY_RECEIVE") removed the only read of keepflag in child_thread(),
leaving the file-scope keepflag variable set by the -k option in main() but
never read. This triggers a Clang 23 warning:

  tcp_mmap.c:91:12: error: variable 'keepflag' set but not used
  [-Werror,-Wunused-but-set-global]

Remove the unused keepflag variable and the dead -k getopt option.

Fixes: aacb0c2e524c ("selftests: net: tcp_mmap must use TCP_ZEROCOPY_RECEIVE")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 tools/testing/selftests/net/tcp_mmap.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_mmap.c b/tools/testing/selftests/net/tcp_mmap.c
index 487ae659a1f1..86241bed7f08 100644
--- a/tools/testing/selftests/net/tcp_mmap.c
+++ b/tools/testing/selftests/net/tcp_mmap.c
@@ -85,7 +85,6 @@ static int rcvbuf; /* Default: autotuning.  Can be set with -r <integer> option
 static int sndbuf; /* Default: autotuning.  Can be set with -w <integer> option */
 static int zflg; /* zero copy option. (MSG_ZEROCOPY for sender, mmap() for receiver */
 static int xflg; /* hash received data (simple xor) (-h option) */
-static int keepflag; /* -k option: receiver shall keep all received file in memory (no munmap() calls) */
 static int integrity; /* -i option: sender and receiver compute sha256 over the data.*/
 
 static size_t chunk_size  = 512*1024;
@@ -456,7 +455,7 @@ int main(int argc, char *argv[])
 	int sflg = 0;
 	int mss = 0;
 
-	while ((c = getopt(argc, argv, "46p:svr:w:H:zxkP:M:C:a:i")) != -1) {
+	while ((c = getopt(argc, argv, "46p:svr:w:H:zxP:M:C:a:i")) != -1) {
 		switch (c) {
 		case '4':
 			cfg_family = PF_INET;
@@ -490,9 +489,6 @@ int main(int argc, char *argv[])
 		case 'x':
 			xflg = 1;
 			break;
-		case 'k':
-			keepflag = 1;
-			break;
 		case 'P':
 			max_pacing_rate = atoi(optarg) ;
 			break;
-- 
2.56.0.212.g129ede20d9-goog


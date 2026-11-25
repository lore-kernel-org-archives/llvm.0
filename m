Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640478;
	b=b9W8IXgLDxCFOVdtsUyrRatDjFnInd3Ez6ZgYedVCQu5rhYJr8/OH5ylfRJikcW6qPoQ
	 Va9fyG+70mK6VqgSHA0ltuqyXtG+t5lMTeWbd2HRXUrFMeQsOawwJu7e2vvInsRbta0ZF
	 +hqeOcJ2WZNLCsWcNvLTQsnfcJMUvfx20L0btnVFcxwV22alOYVisZhyZtaK0NHRleExI
	 oSDt2kwOpV91Vu8y9LRL4e2LIRs2F+N8iODcLafgPppmFUR2v3j6s6Ju2llkCVNt7lCBm
	 c49KbUtpEASZrHd3zW/ACG9PBA7dAgbjV19j/+jx/iBQ5ut0n85bZNggfVKyUC68pRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
	b=pfEHigrMgn+o4Axw3Z9iPC3R4hQ8ZNMtI757H7ev+MqZyrIO9lWnJcSw1lyRx54vOb0x
	 6aAqBnAxZnfe2DERJnty5BN2UQLb3s4PJ3EMVEsTiCS30dRhhHdmV7xFOj1RUyI7nv8LN
	 ppAu7VHVVDpzJIgBfbjR8GR8MJB6+RiCelUnR5DztayMPKABO3fGVFCdje1i+JqgpZWbT
	 Jp/JFclBzTs6fmJVYRGtm0jk/pIPWvlHnJsWBw1s2YKA1FZvA9v/49GVUNMsQ34BTnpW6
	 MEGUWjJseWFa1g3Gf7481D679tvw1BToczKOeRg5EGJWdPB7COr5Nt49ZaogJFjE6ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S9Fl7pOp;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDDD606A334
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDDD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S9Fl7pOp
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so349544eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640477; x=1796245277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=S9Fl7pOptUhEsaWQbNweLDExVsXksYWzw5lNeswvv00fevSOGkoep4TRtxFf0kxSEk
         1hVPIBZYX46oZthF104XZkvnZ7m7Sx3A3o4DqqCjLU4cuaCXxA+suJOcDdQwqFaC8vP0
         99ZKvcvIXERtDHNPJaMiCnVrMIVVBuWmYB4w9hRdMsgrY0X44md55TP+fHUC175FwjIh
         pfCXlWy32xv7iow6+JNunogMSG3/m3QFNE+eTDGiilcQKIINXgwrgwkWE7ITmP5vkadE
         hC3lAJrrpbGrgBJXuA3Y1VPW4P1NV133buxBElsep1yoQLS6vc5FzdnEruQtFJ0pQoO8
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640477; x=1796245277;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=HUdjW0teQpKfc8p+LIT5FKuAAf+nJn3zsBVdjUNSbZLemvxaoIFt/DG77qtOyhK+sG
         +PyqMe+ZvYRX7uCuF2HpL31E0rFoMowC3P9kIU7kSO9RIVuRiICwE5EPm7ye4rmcxUGj
         7S1beQOjvQi+We1hbwyKq+BEpzeyDwh5RU5haxSPjYRTvxVzYLXj8m3uPhmLl2YpuO2K
         85w2fKjFX0QYKGqt/Ug5BDLlQdla5fRSn0+t59yM4KXu6sVwT81EVQ80bX9AVcT0d3vc
         cmymV56joyk26ZqtBrZAOXOTCPjCgtMdFKsVSXaOXK5/J4LUw0IktXrnXySCzyIpVbd9
         LX6Q==
X-Forwarded-Encrypted: i=1; AL+hErG6q6At8mWk+p/eQZun9F7bJAOpQRP43yt/bj41F8hEqTKIBEj8fucG/bJibNLYCgi0YpJu@lists.linux.dev
X-Gm-Message-State: APuU4Z+2hQpDoe/Paw1eoVjYTkXa693q7aIq5wFaL4wE4I3ImRKaRyk8
	lLFBdN4Ug+wdWWo67oe5vd2jeAx/YqJtn/ejB7EaMU1WSu8nB7F5oCBpaQlblFOF6OkXKxbfAdh
	Y8w==
X-Received: from dycue8.prod.google.com ([2002:a05:7300:88:b0:343:520f:7a80])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:880b:20b0:386:b025:1e1e
 with SMTP id 5a478bee46e88-386b02522d2mr10999574eec.16.1795640475439; Wed, 25
 Nov 2026 13:01:15 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:35 +0000
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
Message-ID: <20261125210038.1277960-1-elkin@google.com>
Subject: [PATCH wireless 0/3] wifi: mwifiex: fix UAF and ext scan TLV bounds checks
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (3):
  wifi: mwifiex: fix UAF after skb_realloc_headroom() in bridged RX
  wifi: mwifiex: check TLV header size in ext scan report
  wifi: mwifiex: validate ext scan event envelope and TLV lengths

 drivers/net/wireless/marvell/mwifiex/scan.c   | 30 ++++++++++++-------
 .../net/wireless/marvell/mwifiex/uap_txrx.c   | 13 +++++---
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


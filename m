Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107833;
	b=hZpFMKVP8e0x58gPPbDNuevGRzuolgXr+lSx4Ov3L68DpC+qF9t/wGqPeTAccXb7/9aJ
	 OnzhPG92+/KzcATa87uYrJ7AZBrLt8dPTPwu0ihdDLfW0tLz7dkeLD1T8/DleIUy0erLM
	 3nfdu86U2tOWB/Zlv5psYSJ7imG8nxnCVgcl+F/7qxaqIaQFkN5YgRGLlNJXvi/f1sJw3
	 kxBMA2jiC+RRO5bzK54N4pl43en9lsYPC2pxTU4piULaBx81xDLZbKgqmMF8sASqv4IVZ
	 3k988YDStw4T/whZfd//eeOQhMxb1cz1KYYyKvVXTbMUa3p9oN5+d6JkWjflK8IXY2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
	b=JKEe88RDb0k6JErYYkXZsIyqgVLhKy10dcFU6P8bYOUpQ9TpaATXj/LjPG8mMSIg7YGU
	 xfWLP74VJOO5SZH2q/qHDn1y9jzYl4rQWbRRJjZ4eHUzSk1kLASllKQWDXePlkl5Arz7d
	 /Bot3/J6ojvuJNW1NAqTLthUiWXl7wkIyuM27KRxfL3V4xC8d945wlt8SVWLALILBb9OA
	 c+a+7c6rcVYIUDiAHJgylqt45g82ZTsxh1lJL/FPWe8xU4Nkx2GRd5U11X5Hn9kP6TImM
	 M6+BXhRHI85S+CSgicF3hAQWUCbMShDonz7oZ6aZtZnxte2baABLXOS/zWCzgLdwDpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CyyAhHdq;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA80606A32F
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA80606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CyyAhHdq
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so1725094eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107832; x=1795712632; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
        b=CyyAhHdqZKKkgvsd9+QkD8zDOlImT08fp60MYqSkYxi2jLBmjkAm1KqnRIrGCH5P+K
         JIT1X1yBfksn/zFns7/QWc/JdEy0qeb4RnSMh1Iaj/IugJY0sEtBLM35DB1tF4aR/bll
         kYf6WngvTEp0amRN4peFcMMZ7HFVDriIcPqvNbkQ+EWj/WkRnY4ZNFHwih4Uopui7HYw
         lHHD3z7J+ezn3BPkFVIrY4t2YivEnuh/TbuIrmJDuV/kJ+wUKPwH/x1RWhnVKgmmS+RB
         E9RNaPaNavT0t2MWw4wtpdI2MnhYzAexGIkX3Wnm6MPCCqTPKCl3FBzcU7dBUVaC7DGm
         FhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107832; x=1795712632;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
        b=hpbG0DtfArGkDihtCsu/HorpoCaWkcvxI1MaC8T3vbIFW0JIH88My6roVa3v/mSKf3
         5T2YsaXY253prcxqK+zzr++ODYFePqX0hyiWVKVcI8lljzxRcyXlg1YA4SmMwal/2Px1
         +DK6ymLGkmjGtKOB1TDsnE7U8LOa9t/DOPNopBLHMeCj5oFkAqGi9c/wcG//X9xD7H8v
         v75iOHMWW0yiV3zR0XQ2e/qEQb2b3KgATI608yORnPQcXlNI4D8Vrl4K5r+dY4+PmWCt
         KLPCOdTKx/3OtFLyn2EZ13/y5/hUiMsQux5PIMVHmT6qnBywkbn3iQoMBmB6qvW6aCjU
         BEjg==
X-Forwarded-Encrypted: i=1; AL+hErE8cqERnI21+yYlDQ+HF7rLkpxjz1Amfj6tOskp4fGswHkTUCISsKbJpC8PYxw+COar+pWY@lists.linux.dev
X-Gm-Message-State: APuU4Z9vRhV7DR6SfHK3te2FvRo58nxz4ZlLOfX0LhcTYVbr2jUj+65K
	Mzuv3tmZlLSFTX2XEfbb/4AOI7te24wFeKJ7qr9yCQHQuVYSb3ucbJSJMZljX2keFCyTKLFhH3y
	JTEDEjsTfTQ==
X-Received: from dycuf3.prod.google.com ([2002:a05:7300:103:b0:383:9b3f:7909])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6a9b:b0:367:185e:867a
 with SMTP id 5a478bee46e88-38281cf60d3mr5573598eec.38.1795107831376; Thu, 19
 Nov 2026 09:03:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:48 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170348.1509147-1-irogers@google.com>
Subject: [PATCH] afs: Fix uninitialized count on split reply in afs_deliver_fs_get_capabilities()
From: Ian Rogers <irogers@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In afs_deliver_fs_get_capabilities(), case 1 extracts the capabilities
word count into local variable count, saves it in call->count, advances
call->unmarshall to 2, and falls through to case 2 to extract the first
capabilities word.

If the RxRPC reply is split across packets such that afs_extract_data()
in case 2 returns -EAGAIN, the next delivery call enters the switch
directly at case 2 with local variable count uninitialized and passes
(count - 1) * sizeof(__be32) to afs_extract_discard(), corrupting stream
unmarshalling or hanging the call waiting for a garbage discard length.

Use call->count when computing the discard byte count in case 2.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested against
an AFS fileserver.

Fixes: b537a3c21775 ("afs: Fix corruption in reads at fpos 2G-4G from an OpenAFS server")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/afs/fsclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1a3f186a6a11..7b5fb8b122ab 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -1707,7 +1707,7 @@ static int afs_deliver_fs_get_capabilities(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		afs_extract_discard(call, (count - 1) * sizeof(__be32));
+		afs_extract_discard(call, (call->count - 1) * sizeof(__be32));
 		call->unmarshall++;
 		fallthrough;
 
-- 
2.56.1.708.g77570a6a1d-goog


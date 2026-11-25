Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645231;
	b=J/sBJvyytkMphQ/HfAMWx4UJOhGBaugepEHjMMRtfRArKwRnXjJnx2UDWecVC0BRa2ck
	 eqJ6VfkGMuYyxVSovwNMZnG0RDMXBXemaeOWvY3df3y/YO2x+bqxnWyRUrkUsuUdPgkAy
	 Ai5zYCYlqveRDuTI4F8H2971yuIRFcHlFnl7xyVRLIHmlN8cD03SrtqUxJpqp4WV7PjSg
	 NWIyfRExP96G8XcNiYz1K84X/Bh33mUzScblg8pWDhy5ZmwrcYfw17Ayoq5+dW1BjPY+R
	 pYTxE7KKx7pyURFtUwsig2p70iRfi7NRqT7b818qK0ZNYZTr3Mi1S9IzNV25Wv7AkeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=K4o0fdb77C2dnHpzdq2HhvHCDm+wfEBJJb+Gee5/SLc=;
	b=H0UW/8d2gi44vM71SOwdZtYEgCS11Z53NM1+O5T6oE60Tbz8FVU4Hheyu8vLXAayPQHs
	 pUBzlU7nDpH5cxMir/e+e4zFkuiXboIx9MC5/Vsvix406/y8KIlgi2Mk3JpC2u2wJNHdv
	 UhwHBHHppDO7C7QrZN1Mi+1JlaX8waCFTwv2QQXvq/4SRJZQeuTVhayTgsfz9Y/b0HgtJ
	 UWlwoimk9qFTUIhOt0Ot/LFnfw94844XbEKJQpUKb6ru/O3nVt2ZzEZtIYtzE77jtrUjk
	 NLJkQoEdtGZQAqIWXDogHLBsJxTIvVrjEYfCHHUxwEw40S6lDc6/UyvJ6nXqG2Gjraw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nCmD9Bqx;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A7606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nCmD9Bqx
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7332925eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645229; x=1796250029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4o0fdb77C2dnHpzdq2HhvHCDm+wfEBJJb+Gee5/SLc=;
        b=nCmD9BqxD6vBJBD4jh11vcNuhZQ5DLIeiav9FFrqxjrvpFnAFKQSq8c4LPR/x+LwG1
         HMhuYDhTM58kjOYdmx3EfBmR8siD1ph4z8yy8CTYreUJDt6dK92mj4kGU367XA/9Da3z
         AlOCJfZX6+XsAWHc85sRD9Gi1WMUJPrAnQJ2YjExsC2rTV3BThBs2jTJFkQfBoxAgBup
         lXrqtw2NlJmx3LmsOCfougjw6eGF0TLmiCwjyT0XLRZSIinLlgXRlA5YoS5vrerhtmOb
         v+Y8N1aRVOAp2tYMcj268B069WA3gh3DySnuCmn2J8z36ZNhJkZhViOTNrctysdQDlNu
         A70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645229; x=1796250029;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4o0fdb77C2dnHpzdq2HhvHCDm+wfEBJJb+Gee5/SLc=;
        b=0s71IAWkIvkHvn/Ef09ek9kG3z39iaqKRdQsHqKWucodLo6KDGR1nIlqQvDN2yEZO+
         y47ZzIFCe0j87s0yrUNRecyU4yqikXXep3cOy+AoMH8UMtBbhbHTOP8UkeyJ+BDJ+X+7
         L8LanSjQJbKYc/kYuCBQJixVVuXxqf23MpLiKcpch8SFkML/danwEpL/9RMRKDMNBi9C
         uCL1bY9qmc1gLre3kLw3uPKfUQcEQHuFFiIX/tbUGnn2S8IggEk93cuy3eY3133ii0OY
         REjlHt26GH0aRiDYwnltkUFdwq7Bs4IjmLCpTBS7FvRq6VL7hufxyAQf1MFEhdeF7ke8
         LGyQ==
X-Forwarded-Encrypted: i=1; AL+hErEcjRtEqRx4rti+X34IIWYqS+jhZqn649fB117+e8ABzvL6z2gf4Fyl9azO612Lb1CywyYX@lists.linux.dev
X-Gm-Message-State: APuU4Z/8bKQuHB2FpYLaf6N1H4+enzkpj1qRKXrvCfQDSN3w7JmuuYK7
	7ep+uZvdnWlZbt+4v3tCWceX80WYZBwVNYUH51Z352OK3R394smOmG6+qnS5cVGUIpmn1WwvshP
	WLQ==
X-Received: from dlbts11-n2.prod.google.com ([2002:a05:7022:b04b:20b0:1b5:2d3d:de79])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4193:10b0:144:eaa7:2763
 with SMTP id a92af1059eb24-1b55689a0fcmr20424343c88.16.1795645229068; Wed, 25
 Nov 2026 14:20:29 -0800 (PST)
Date: Wed, 25 Nov 2026 22:19:45 +0000
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
Message-ID: <20261125221945.1426279-1-elkin@google.com>
Subject: [PATCH] scsi: esas2r: Enforce minimum header length bound in esas2r_write_fw()
From: Elkin Cruz <elkin@google.com>
To: Bradley Grove <linuxdrivers@attotech.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

esas2r_write_fw() is reachable via EXPRESS_IOCTL_RW_FIRMWARE on
/proc/scsi/esas2r/ATTONode (created with mode 0444 and no capability
check).

In esas2r_write_fw(), the driver validates that the input buffer count is
at least min_size and caps header->length at 1 MiB, but does not ensure
that header->length is at least sizeof(struct esas2r_flash_img) on
FI_ACT_DOWN and FI_ACT_UP transfers, nor does it bound the header cache
memcpy() to min_size for FI_VERSION_0 headers.

If a caller supplies a non-zero header->length smaller than
sizeof(struct esas2r_flash_img) for FI_ACT_DOWN or FI_ACT_UP,
allocate_fw_buffers() allocates a DMA buffer smaller than
a->firmware.header, causing subsequent memcpy() and do_fm_api() calls in
esas2r_write_fw() and esas2r_read_fw() to read and write past the end of
a->firmware.data. Meanwhile, FI_ACT_UPSZ queries upload sizes directly on
a->firmware.header without allocating a->firmware.data, so header->length
may legitimately be zero for FI_ACT_UPSZ.

Require header->length >= sizeof(*header) for non-FI_ACT_UPSZ commands
and zero-pad a->firmware.header when copying min_size bytes from buf.

Fixes: 26780d9e12ed ("[SCSI] esas2r: ATTO Technology ExpressSAS 6G SAS/SATA RAID Adapter Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/scsi/esas2r/esas2r_ioctl.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/esas2r/esas2r_ioctl.c b/drivers/scsi/esas2r/esas2r_ioctl.c
index 901c5d40cda8..4a4489a2485b 100644
--- a/drivers/scsi/esas2r/esas2r_ioctl.c
+++ b/drivers/scsi/esas2r/esas2r_ioctl.c
@@ -1708,7 +1708,9 @@ int esas2r_write_fw(struct esas2r_adapter *a, const char *buf, long off,
 		/* Make sure the size is reasonable. */
 		length = header->length;
 
-		if (length > 1024 * 1024) {
+		if (length > 1024 * 1024 ||
+		    (header->action != FI_ACT_UPSZ &&
+		     length < sizeof(*header))) {
 			esas2r_debug(
 				"esas2r_write_fw: hosed, length %d  fi_version %d",
 				length, header->fi_version);
@@ -1729,15 +1731,15 @@ int esas2r_write_fw(struct esas2r_adapter *a, const char *buf, long off,
 			 * Store the command, so there is context on subsequent
 			 * calls.
 			 */
-			memcpy(&a->firmware.header,
-			       buf,
-			       sizeof(*header));
+			memset(&a->firmware.header, 0,
+			       sizeof(a->firmware.header));
+			memcpy(&a->firmware.header, buf, min_size);
 		} else if (header->action == FI_ACT_UP
 			   ||  header->action == FI_ACT_UPSZ) {
 			/* Save the command, result will be picked up on read */
-			memcpy(&a->firmware.header,
-			       buf,
-			       sizeof(*header));
+			memset(&a->firmware.header, 0,
+			       sizeof(a->firmware.header));
+			memcpy(&a->firmware.header, buf, min_size);
 
 			a->firmware.state = FW_COMMAND_ST;
 
-- 
2.56.1.839.g22a8290db9-goog


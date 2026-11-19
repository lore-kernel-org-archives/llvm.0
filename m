Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107905;
	b=S6UT+gyKM48QvMsSze1FEh4/fwlAtwCZI9l6YWEYIXqNNsfynPXCsqD96v33yYBw4gjH
	 rJrpcDM+rkVlUnYmvx1nS7+2thsY4ncqT69bgbFVZEbLTEB6M97rxlX8HO+r8lkz3HWQr
	 2y017C4Iwp/QXecVdJ8PoUaXGRw2edDPZexg75bbz2M9k5hjdQfQQ4GTdls9PhYKohU/j
	 PbAdQemfQla6Aa7MfxGgc7n6zkCI91DVapYnVEhP4/XgmHAL0E1uUj6aWynK3j8Pp/4vO
	 1YK4pBu0H3b0C7afNXi9KH0tbLPC2dQwmgqiVaFmm6O5txAzIMUouUJqmpyIZcq1dlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
	b=4ZBJD6UpiEGydHut7AH2sxYmZBI/ZoytpCqARzRJZkDj41LAae+Ygc6PNw3ijQfQkOam
	 l0vkDBE/M22I+qNWQ54nxhD1h0X7z50LqdzKbXwpX0I4MrmxuZmyHIrhTVKHV4epCfcos
	 uczj3OvwbeMgJ8XkV9QB4hDMH37nXgPaC3RtGXmwMgaPR1whxvqDTVhygDGE1eaN0FvIW
	 BIrsvoejZYztBZ9UowJEAXuCNY40TCICBzxubMP2hNwxgkUiffi6BZVz4s6dSi1af18JW
	 pV+I0XMWK07Xduvxe8UGbIz4JpDsDUFsojCKh/ZZDI03yWMr3KL8x0GcfYxKT5MSbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bXUE2bYN;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6360A260E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF6360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bXUE2bYN
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso5076171c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107903; x=1795712703; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
        b=bXUE2bYNt6yjDxk2dgBjDW2jCRetxBGrrbxUdQ6qev+s26OuCUUnb2dRPut9cyUUZf
         OSDhCdAWKwPoaezg9WuUsAXSGbq1q6OUVTdZoOVQHwdl5EYVyGyHovbX+8SR/AXhIXDW
         7U8fMvt+s+apsVyzdsEZ3beTMJnafFoGhy6QGgtaDigUIkW9ZC5Nuo1K7rj4AYBOlLYR
         qBKDNIogD3Z8ot5cgXs8Fh7yoptzk28NHgUHmdoMaIGK3AeVwiCgjtrG9O513D0DT6Uv
         qxxKhjXAcfcfQhdObbNmf5eCm417ByLRvfIaaNxMEJbNRb9XQozen18uiCaS7J7CCzb/
         C8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107903; x=1795712703;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
        b=aYjRbiSBARJUBuDBw/H2/asG/EmzL6DDp+w0Ql2bEibEjjQ07wZjjJIbrh5iqZtWTW
         FhQDWd72NHBzfxiu53NZh11ZIV4cTqavryeeKNFgScC2mSNUvrSPlweGPMEvhP5Htcnu
         NsQuoSN2RWEKmtGBK/WFY+/oaUoAR5aHzFEMorFVdu//MJ6WpQw0W1tG/czjv/YgrRxn
         yH6xaXfkYabIQqX8ZiPSTUUUf4nzVnf6xARhQ6YygaN9aYDE2W2r3lshBD2+J9ns0hDY
         0EejV9UMO/v+Sk4PRS9OXIWfr9OyCjgJT0Fqzk91rQPyp58nKxqWOIUvwyjQHsElF3iH
         Pkzg==
X-Forwarded-Encrypted: i=1; AL+hErHqJ6/pPI24K0GCluCCLsCW0iWC/YAcuY/LbYIPIp0oh1Lt1cqDDWOAhIwzZ+AikTAt8rcr@lists.linux.dev
X-Gm-Message-State: APuU4Z/qEQYjqf/Oit7CJPkCZvUvYnvfhqkpIphryl6BE3IJUapNoGGZ
	aEHjROrmRc3V+tM7yUfpkIJl2hQFB6VnOb9TIwRT2qRVjaC7gL4/7QJlWTCxZa12PHJ8sld/Si/
	ugEk45BM6VA==
X-Received: from dlbsw11.prod.google.com ([2002:a05:7022:3a8b:b0:19a:1425:bb9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4204:10b0:1b5:4cbd:ac02
 with SMTP id a92af1059eb24-1b556895b10mr269905c88.15.1795107903109; Thu, 19
 Nov 2026 09:05:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:00 -0800
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
Message-ID: <20261119170500.1514537-1-irogers@google.com>
Subject: [PATCH] scsi: lpfc: Fix format string and OOB copy in lpfc_read_object()
From: Ian Rogers <irogers@google.com>
To: Justin Tee <justin.tee@broadcom.com>, Paul Ely <paul.ely@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpfc_read_object(), rd_object_name is a 26-element u32 array (104
bytes, LPFC_OBJ_NAME_SZ) populated from rdobject via scnprintf() without a
"%s" format string, and then copied to the SLI-4 mailbox request with:

	for (j = 0; j < strlen(rdobject); j++)
		read_object->u.request.rd_object_name[j] =
			cpu_to_le32(rd_object_name[j]);

Because the loop bound uses strlen(rdobject) (byte count, unbounded) to
index 32-bit dword arrays of length 26, any object path of 27 bytes or
longer reads past the end of rd_object_name on the stack and overwrites
rd_object_cnt, rd_object_hbuf[], and adjacent mailbox memory. Passing
rdobject directly as the format string also evaluates any '%' characters
as printf specifiers.

Format rdobject with "%s", capture the bounded byte length returned by
scnprintf(), and iterate over DIV_ROUND_UP(len, sizeof(u32)) dwords.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Verified with an ASan/UBSan C reproducer for short, '%'-bearing,
and >104-byte object names, and build-tested with LLVM=1 W=1 and
-Wformat-security; not tested on Emulex Fibre Channel hardware.

Fixes: 72df8a452883 ("scsi: lpfc: Add support for cm enablement buffer")
Fixes: 59936430e6a6 ("scsi: lpfc: Fix CPU to/from endian warnings introduced by ELS processing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 9173263c87f9..26c9f5721340 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -22259,11 +22259,12 @@ lpfc_read_object(struct lpfc_hba *phba, char *rdobject, uint32_t *datap,
 {
 	struct lpfc_mbx_read_object *read_object;
 	LPFC_MBOXQ_t *mbox;
-	int rc, length, eof, j, byte_cnt = 0;
+	int rc, length, eof, byte_cnt = 0;
 	uint32_t shdr_status, shdr_add_status;
 	union lpfc_sli4_cfg_shdr *shdr;
 	struct lpfc_dmabuf *pcmd;
 	u32 rd_object_name[LPFC_MBX_OBJECT_NAME_LEN_DW] = {0};
+	size_t len, j;
 
 	mbox = mempool_alloc(phba->mbox_mem_pool, GFP_KERNEL);
 	if (!mbox)
@@ -22283,8 +22284,9 @@ lpfc_read_object(struct lpfc_hba *phba, char *rdobject, uint32_t *datap,
 
 	memset((void *)read_object->u.request.rd_object_name, 0,
 	       LPFC_OBJ_NAME_SZ);
-	scnprintf((char *)rd_object_name, sizeof(rd_object_name), rdobject);
-	for (j = 0; j < strlen(rdobject); j++)
+	len = scnprintf((char *)rd_object_name, sizeof(rd_object_name), "%s",
+			rdobject);
+	for (j = 0; j < DIV_ROUND_UP(len, sizeof(u32)); j++)
 		read_object->u.request.rd_object_name[j] =
 			cpu_to_le32(rd_object_name[j]);
 
-- 
2.56.1.708.g77570a6a1d-goog


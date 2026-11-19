Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107916;
	b=y8hIHSRpmLFPPQGmPak5fIXtuhj/7vFMkSENicwzU2aShXIh2opbISS7Og7WShXSrT+x
	 vRfSGt5i89pHvgBHlsylu6DH6SF15aEg9/hvnPGqB9bW0tSoxg2Zet47MyibKQvsNWw4A
	 NFY5FArrXBnvDdOg9MSMqZKGw1GUlIxSO8kDOs0Ax7fA95HxGaq533ODK0U+tuf82W2rC
	 UIpP+BnNm7qDJRnCvekjJUFBnYd35nw5X57/i2Q5ZXK/ICF+W8ChHjSjm6o2/0jrrWItd
	 K/d+5hpxglc9UVusYKrixJBT4L0qBw4H/HoeWBAMANL5yDUX5TiSIkVSlom3qNh4pFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sqmCZzPodY7a2eZN9hiYKdyxOr9vBaN6CDvJ9v3zNlA=;
	b=RIQsohSB+vcw+WNrAMzEU0yLv+MksoBM7aRTR8Q6WUuXcRQ1HHlux5w+0nvQYhA3bOJG
	 1AqxlRmfoOeOlhOqPzRE9QL/O8+BX+dECvRHY1qoqLeIvnWFLp+yZl/w451Ihieu0gHwN
	 fgMl0KW5ZtbMBwJiXMBiu/4XQNSP9YoUrw29i9uwNSMIjVh3vmsXAMu73QjFcNa7fExc4
	 9KDhf3Xr0T4c4YS6Rc7B/PW0m7Zw2AI58rsAnHIufcIijMlM7OaEz2e8PuZHxMNu5Pphs
	 JSi+jglgYaQEeBvFsnxTKUhdb5bvDa+QBzdAvwnebzB3tZHNEq9LNfI8LTYxKLA75gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cb72dg8X;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED128606A331
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED128606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cb72dg8X
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso766396eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107915; x=1795712715; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sqmCZzPodY7a2eZN9hiYKdyxOr9vBaN6CDvJ9v3zNlA=;
        b=Cb72dg8XuYca+BRWG7UefMSGe4BxRlaOG5RpqsgV2K7xQvIARbLhQvzL0R9hruDbjo
         RWqS74rv0nw7mnRCdxQ8IW2gs1MGDZZjwQsoNxcS/2KaHomaujwgL21xO53siIIjiUTU
         6lG29QgvMWjKNlK6WkVvk7FX4VGiLQZMJxrEjzG9Ek4sbl8ffVD6KEDEM4qsXSI8Pw27
         G/WM9Kn1dq//e8GXZPFVakUURUX3ajudBUwJahF2QnqcQfmNhGuw3PXTKqs1+L2tDuTE
         T2QEdALTZegfmEYF44/RLPBsWJ9/8wrw0aDfw9UDthzCnNB7HqHgqb1BAjYCNFjUUcML
         huQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107915; x=1795712715;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqmCZzPodY7a2eZN9hiYKdyxOr9vBaN6CDvJ9v3zNlA=;
        b=dHYwY+Q7QDWd/HNBc28feY3WWe/VjmytVaLgk0Yw0gYm0ofnDTIrrXEjRKMVumFBfl
         T58KGPqoZJna5FWQ+HhDlOGIM6RYVUMb9kJmcBlDKIt5cEY2fCVNyAE2jEztM647SMrK
         uf5EQLw7U7GSEkBhFD7CVYYcYPugwEdtvwkJtae+3eI3WeTSArlLsUL4RJZkdB3fMPwa
         m7f+Ezr9KDaGdFCg+Wwx/bqvkLCg8cniiIUg4PXExbYV7X5tFMwVmyZbpQCZ/KaWlvpG
         zAUH84p8gD6SN+1LyskcRk4YRH4fezFAJLXUMWdmdE4NbGNRKPE/CSMDd7T4OhunnRhu
         9u0g==
X-Forwarded-Encrypted: i=1; AL+hErED3NGzKP/bG2DIS0EWXgLFlQZzM4HtHOB1sPzZEZl1ZaVoTI7JarIqqnFvTQZVfityZGSZ@lists.linux.dev
X-Gm-Message-State: APuU4Z8kNSGz7476D2WiafBnHfemKvxCCP8UPFeh5nDcVa+U7JZVBENJ
	2UCJ4bBDNFez9RT/lOgXOZuF61dru8ZcTFnH3b+6JCj+Njohs0jugPn3HuPU9D3GAq80boivI01
	ux861YKc+UQ==
X-Received: from dybsl7.prod.google.com ([2002:a05:7301:7307:b0:359:a8c8:38e2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:791:b0:384:e31e:3c39
 with SMTP id 5a478bee46e88-384e31e4317mr1074891eec.37.1795107914692; Thu, 19
 Nov 2026 09:05:14 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:11 -0800
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
Message-ID: <20261119170511.1515433-1-irogers@google.com>
Subject: [PATCH] scsi: qla2xxx: Format SFP EEPROM vendor strings with %.*s
From: Ian Rogers <irogers@google.com>
To: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In qla2xxx_print_sfp_info(), the verbose logging path passes the 16-byte
SFF-8472 transceiver EEPROM fields a0->vendor_name and a0->vendor_pn
directly as the format string argument to snprintf(). Per SFF-8472, these
ASCII fields are space-padded rather than NUL-terminated, and their bytes
originate from pluggable SFP optics over I2C; any '%' byte in EEPROM data
or a corrupted I2C read is interpreted as a printf format specifier with
no variadic arguments supplied.

Format a0->vendor_name and a0->vendor_pn directly in ql_dbg() using "%.*s"
bounded by sizeof(), matching the non-verbose ql_dbg() call immediately
above in the same function.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 and -Wformat-security; not tested
on QLogic Fibre Channel hardware.

Fixes: e4e3a2ce9556 ("scsi: qla2xxx: Add ability to autodetect SFP type")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/qla2xxx/qla_init.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index ccb039d97353..77504cfc0741 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -4126,15 +4126,13 @@ static void qla2xxx_print_sfp_info(struct scsi_qla_host *vha)
 	if (!(ql2xextended_error_logging & ql_dbg_verbose))
 		return;
 
-	memset(str, 0, STR_LEN);
-	snprintf(str, SFF_VEN_NAME_LEN+1, a0->vendor_name);
 	ql_dbg(ql_dbg_init, vha, 0x015a,
-	    "SFP MFG Name: %s\n", str);
+	    "SFP MFG Name: %.*s\n",
+	    (int)sizeof(a0->vendor_name), a0->vendor_name);
 
-	memset(str, 0, STR_LEN);
-	snprintf(str, SFF_PART_NAME_LEN+1, a0->vendor_pn);
 	ql_dbg(ql_dbg_init, vha, 0x015c,
-	    "SFP Part Name: %s\n", str);
+	    "SFP Part Name: %.*s\n",
+	    (int)sizeof(a0->vendor_pn), a0->vendor_pn);
 
 	/* media */
 	memset(str, 0, STR_LEN);
-- 
2.56.1.708.g77570a6a1d-goog


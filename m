Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A37A
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:38:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c10so18819398wrb.1
        for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKMRKMm/sIBLOz8aCTIWcqn9AE+2Z7Npd4+53Q2MO/E=;
        b=ieQZ/xTHf2yNXsOs7niwKGoSi4ae0I778/KnW9pYGmAhm2aPLKP2UEzKhvf3YwgxPj
         MIoRHAAeBygRH+D7Z+uMGyRdb9wMvg28RrcCj8XKQPF2DwVRlR0H+97sznOSPHHsfYXx
         5lngNYsQLoSbqhKmMEFSm2YV4A7BTz97KUnvYp3wV+mpfZ7kuMMuQC3BiPWz6ZRbEDW+
         DRiGVRbj/pyUbuuDeoRPfpnsghFm1Vb8u4r1F6v3Gw00AoSy/MdFSbo/DhpFlSsfcfa2
         dxnJ4cVY3RhbBMAa7dED1fgVpU9j+o/+3aIk9dmtofQHGIR91dM45Hm5NNy1iwzhMxm6
         zseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKMRKMm/sIBLOz8aCTIWcqn9AE+2Z7Npd4+53Q2MO/E=;
        b=g2mjChEjK2hsfwoqtfCTwerMQn67cRwbbfmdcUMAL0Tnt/VibXsJA5cMrRDMVFzuJQ
         AeAU6lmfVWnHYrlV1UrSoQvo3JfVBff3W9+ss77e35ElDUGK8ElFb6Zi8ZU8uUqB9Kp5
         Dn13mxO7u0HoolK+DLal6CoLAzzkuG6A426mM1SanqLcCdz7q8alxVKdouwxTjhn8Hip
         NZqviw5HEvfu436wOZ3ZBQUDt3qQ7PG4nFPnAYBYqrLsj6aGLXZtQt2OH9yViWhUGpl/
         CG3RIBfsflniUljMzWdNkIs0W9aBtXP9u7Q8zTWtylLTfyFbl8D4dOPEiem+0HPDRW6J
         G3PA==
X-Gm-Message-State: AOAM530vBBR6q/v8hTfZ8SCx8ML/GeWyt6+DzyNxi1ZIv8j6AGNngUvB
	kct3bAsXg5PBPNLtyqgjhrk=
X-Google-Smtp-Source: ABdhPJy8arQjfLhPXxOzk2MFna3FKyuUNwtRi1hY8KmnVvLTcbTFvag1qbahCt5byLneQWsqcxDedw==
X-Received: by 2002:a5d:6e0c:0:b0:1ef:7cbb:a5aa with SMTP id h12-20020a5d6e0c000000b001ef7cbba5aamr8326728wrz.5.1650292680782;
        Mon, 18 Apr 2022 07:38:00 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id e1-20020a05600c4e4100b00392910b276esm5419573wmq.9.2022.04.18.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:38:00 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chris Lee <christopher.lee@cspi.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] myri10ge: remove redundant assignment to variable status
Date: Mon, 18 Apr 2022 15:37:59 +0100
Message-Id: <20220418143759.85626-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable status is being assigned a value that is never read, it is
being re-assigned again later on. The assignment is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/net/ethernet/myricom/myri10ge/myri10ge.c:582:7: warning: Although
the value stored to 'status' is used in the enclosing expression, the
value is never actually read from 'status' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index 21d2645885ce..fe5e77330f5f 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -579,7 +579,7 @@ static int myri10ge_load_hotplug_firmware(struct myri10ge_priv *mgp, u32 * size)
 	int status;
 	unsigned i;
 
-	if ((status = request_firmware(&fw, mgp->fw_name, dev)) < 0) {
+	if (request_firmware(&fw, mgp->fw_name, dev) < 0) {
 		dev_err(dev, "Unable to load %s firmware image via hotplug\n",
 			mgp->fw_name);
 		status = -EINVAL;
-- 
2.35.1


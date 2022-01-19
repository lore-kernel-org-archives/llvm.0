Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA62CA7
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 22:56:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so5484307wmb.1
        for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 14:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSd02jBcb0jQ7RFJ96vFIu10kcuFdGI3D3TahyBUmhw=;
        b=NH6kgTlJGInhDsdPsMG2Rx77cwDs75i48T84WLDaZd1kpGpDbXFF+eylTQFpmQGR5c
         Ji6yZAZsdrYVbj4Aau2iX9HSwmitdCXXN37gRgMofTZvd7Gfl6CL6Z0a7nwXNLcKy6zE
         hTv0qoubohVCd2+lsGj4XlK0EAnDFRiRi/H1+9j5fC3BtheES6yh5ALrOBZajHldhCjd
         0qWdOpbG4zSyDTike6sK+NmqLNmKof03IhGPt73kxr4jVNvOqxm2vtXzRCz+XsdsR5fT
         ARBpYobdKVyXTFUK4c0vt0gfnta9vu9PZtXLc5m/xsw47BxS5jqZ65e4cgDHtb1bzxRH
         hN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSd02jBcb0jQ7RFJ96vFIu10kcuFdGI3D3TahyBUmhw=;
        b=3gsfjDbY6qNaiMJUCM4toJI5EklafNAOKXF06ecXH2HoWLfXp4fBjctclhrMdmgtH9
         SXHs7fmBjvDXSelttcv7QSzuwYqBtzZL0f+o5PpRbQCFCLSVpaTpeCBt1LkIXXfBE49X
         j9HZo0/viZgA6f0LjkFxkWmUcC+VVhE/iEpX8lG5XqUf82HXuT8FZKCOkcLjMZgPSSAi
         prGLXrMDixZlB9b7+vpRecLRMLWR2xFxd8RPnnGW7uBkqqYycYVSE3Fx5QMN5vasMIIM
         3FXytOpf/+n3fcJKWtdwGRumnXEisgbY77caK6Q1xVfJqfHYfrEcsjgFK1ItVt7tI2Wh
         KZPw==
X-Gm-Message-State: AOAM532tPWBRBiKyi/yQBLRgxYjqg5v3tn1HOIk9vOBksVe6kH31uv1N
	UaG5QaqMD9aQ7qOUWODUuH6x9XTvCuK9uA==
X-Google-Smtp-Source: ABdhPJwgYA5WZCznkbGu1gMfdgrKvSIe7e9u/EucbW88FoMfiygX866seOD/FSFRR+SJ0j8XdFs+Hw==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr18562326wrs.453.1642632995199;
        Wed, 19 Jan 2022 14:56:35 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id o33sm12359980wms.3.2022.01.19.14.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 14:56:34 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] pipe: remove redundant assignment to pointer buf
Date: Wed, 19 Jan 2022 22:56:33 +0000
Message-Id: <20220119225633.147658-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer buf is being assigned a value that is never read, it is
being re-assigned later on closer to where is it required to be set.
The assignment is redundant and can be removed. Cleans up clang
scan build warning:

fs/pipe.c:490:24: warning: Value stored to 'buf' during its
initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pipe.c b/fs/pipe.c
index cc28623a67b6..d19229df66ee 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -487,7 +487,7 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
 		head = pipe->head;
 		if (!pipe_full(head, pipe->tail, pipe->max_usage)) {
 			unsigned int mask = pipe->ring_size - 1;
-			struct pipe_buffer *buf = &pipe->bufs[head & mask];
+			struct pipe_buffer *buf;
 			struct page *page = pipe->tmp_page;
 			int copied;
 
-- 
2.33.1


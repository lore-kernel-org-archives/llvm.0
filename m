Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52D168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643221311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=41Yq0Jiu/p4386qMAQJe5Ihi0AXyzAek0DT2V3OPlfI=;
	b=FdlAUdRi83s6RL7ZbbBgBSh8CuHpR0ZNYMqDCF2CWLoinnQoeDckRFGbcvcxJZmUL1/bUx
	KAz35+GOeSLWeEGE2jojmvhZjVv0UeEzrGxrnHVmCqQA9rttbBgHGaJBpoqjcS3kbV8c+C
	ZGfecU4a4+LyjfI2jbIAhljhUV4qB3A=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-Bm-ky-etPxyeCGPAaLPstw-1; Wed, 26 Jan 2022 13:21:50 -0500
X-MC-Unique: Bm-ky-etPxyeCGPAaLPstw-1
Received: by mail-oi1-f199.google.com with SMTP id bq20-20020a05680823d400b002cac339e9b0so319057oib.4
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 10:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41Yq0Jiu/p4386qMAQJe5Ihi0AXyzAek0DT2V3OPlfI=;
        b=B0ND8Bza08lGxJSuEn9ALHY3NY9jAgRC+Sv96iC7JVS7vJasvf/k6OliDJ8KjHjs5H
         z9ujmoFntWLzKdxcrjgD0wGm+T8tejpniRbTSGvtBrcOHWgDLhsmQz0hIRGDtVJdJtBH
         92gRr1opVYsPWYOCMoIboE5OT4OlJkNvenE9w81sfatOQJoAalsIKc0EDtZrutTKCBCi
         2VxRWvhXxD38iMFO6psVPpHjq08pmGl1/gxBLHnv3uGlKmm2YivuHa5FKF4sU8lAuljt
         42TLF16WYmLhLu3EqkC8l4xWYp7YcxACSXLaV5j+XK9g02sYqNiMH9TB73v1EQnohDzS
         kq8g==
X-Gm-Message-State: AOAM530rlANJWOkIxpdc0uXsH0slU+92/tHI8t1LTSlm58OKRsropTwn
	cx3CeINJ03Gh30AGHY/b433xfQRbr9DyV+Vb1fxA+FiBi5hq1jcPfjHFYhVDwWZoKN4v4YHLkyO
	XnAawzmKIy6toDg==
X-Received: by 2002:a05:6808:2107:: with SMTP id r7mr4948678oiw.18.1643221309972;
        Wed, 26 Jan 2022 10:21:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEM82EpXlXd4VOeoPb1JwrJ3tw7RGrD/fSFwmY+6hFf0R10tOQz6ajGuRba8/BQVR+U0tLxQ==
X-Received: by 2002:a05:6808:2107:: with SMTP id r7mr4948668oiw.18.1643221309819;
        Wed, 26 Jan 2022 10:21:49 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h1sm3748002otl.37.2022.01.26.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 10:21:49 -0800 (PST)
From: trix@redhat.com
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	kai.heng.feng@canonical.com,
	jiapeng.chong@linux.alibaba.com,
	giun7a@gmail.com,
	colin.king@intel.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: usb-audio: initialize variables that could ignore errors
Date: Wed, 26 Jan 2022 10:21:42 -0800
Message-Id: <20220126182142.1184819-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative issue
mixer.c:1548:35: warning: Assigned value is garbage or undefined
        ucontrol->value.integer.value[0] = val;
                                         ^ ~~~

The filter_error() macro allows errors to be ignored.
If errors can be ignored, initialize variables
so garbage will not be used.

Fixes: 48cc42973509 ("ALSA: usb-audio: Filter error from connector kctl ops, too")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/usb/mixer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e8f3f8d622ec5..630766ba259fd 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1527,6 +1527,10 @@ static int get_connector_value(struct usb_mixer_elem_info *cval,
 		usb_audio_err(chip,
 			"cannot get connectors status: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			UAC_GET_CUR, validx, idx, cval->val_type);
+
+		if (val)
+			*val = 0;
+
 		return filter_error(cval, ret);
 	}
 
-- 
2.26.3


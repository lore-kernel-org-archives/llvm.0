Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA612CD80
	for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968773; cv=none; b=s49j0mZyyZjd4CMyqGYQwm8xojAO2G8ovvNN1JtBk9T4wJxix03Uk4/T82id3poeKAqrkqf9Qe2xYoa0Jk5HqS4FIXZKe1ZXASRYkX5QybKEP2jTewZFF/6sO0Qnu/Rb6+TCMjI3r30N5cBLUq2TDIQrcVH6Jln4Xtv6cdcPCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968773; c=relaxed/simple;
	bh=dcyaGfqQ8aucX+uJmQuZcf9wqW6CMLKxh3VcDhu7drg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDMb0fMuHRNcO51tfttProJiQL3KZR9/JIpnzOmIIF83CVdocq0inHkZJdvKaJHtvjW/PKJ1HSl3t9vC/ZAegXWgAlOOiHzgg3deUqhOcqW3BIdFuZTHoK77atlen0HBfv71TO+pgBi6JD7CXSKwpzd5Bl1KXOM23VM5heFyECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jvjyk+iz; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jvjyk+iz"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-787cb2ef657so94447585a.1
        for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968771; x=1709573571; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaYfpx4jqxqKQ4ygGfIX8XBKNx0fRub/o4Qatc3GlF4=;
        b=Jvjyk+izF3tMEW79QgDwAM1VR/yx0QPuYYOkQ839B+8kdKW72DLi3281O6dWNLOFoN
         o4JV4DcAiOaIOUW+QmKa5QYKy9I/GteI2ILgMM6WHuDh7A0IeAhXtmj6HD4HJDb8WceB
         0GkFspo0dVc23gCs2N38VSJb8kVPInkoBH1PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968771; x=1709573571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaYfpx4jqxqKQ4ygGfIX8XBKNx0fRub/o4Qatc3GlF4=;
        b=ZQY4EsH9sng6GDyVUDb1rM+W/tFBHdqk/LSsL9aNiTFFXGCgC/FhyGWWBaqNUuDUel
         N5yoDVyUW4I+W33Dr+glvDW/coZ64VRpA0fW3JFTMDJ6WZ0Z6hIM9SdDOKX8M12eZQGC
         oNyo/BlEjNaAL0P7p9ctOuoGVdtOgtOZ5lATHnwtL4vdGks2Izsy0s+ZL1a9WOlhAZMQ
         ODM/Ve1Gi5yts/xQqqqo4CaI6shbcIeLwp13IsyBDXLIbee9XYG22gSouZLHFBAVNRCc
         K18JKiEvFNnd1HjJubJw1wOI9yPGRDLllvoMvmNxVDxfC2z/nNVd38+8qcKAh3kwY+3o
         xVIA==
X-Forwarded-Encrypted: i=1; AJvYcCVWlOs0u5AZJclBcboXXDzPE2Oz9iTDNNZnFaq3st2joDIuS0o47sI0aprbmvPldluS+b/tW/r49nInhT4u85BjWoyEBA==
X-Gm-Message-State: AOJu0YxzVQ1XwpoELy5a4csDvVkMYH4hAwdao6LeNCmXS15wDNj/WO5R
	13b9+mLijcXLgQ+AyIPgQE4vJSLjZyWrbSs798x7BMxUWKEeVqrUPFcxnZRPyQ==
X-Google-Smtp-Source: AGHT+IFPFo6h6yoUZfpwUnRcJdbbOQwMO+GXxTDc9YEiO9pMJYeFAGXUAR4HJURnNZTsUOrD6721QA==
X-Received: by 2002:a05:620a:17aa:b0:787:c71f:a55c with SMTP id ay42-20020a05620a17aa00b00787c71fa55cmr7498759qkb.59.1708968770886;
        Mon, 26 Feb 2024 09:32:50 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:50 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:45 +0000
Subject: [PATCH v2 2/3] media: usb: pvrusb2: Fix Wcast-function-type-strict
 warnings
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-2-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Building with LLVM=1 throws the following warning:
drivers/media/usb/pvrusb2/pvrusb2-context.c:110:6: warning: cast from 'void (*)(struct pvr2_context *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1070:30: warning: cast from 'void (*)(struct pvr2_v4l2_fh *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict] drivers/media/usb/pvrusb2/pvrusb2-dvb.c:152:6: warning: cast from 'void (*)(struct pvr2_dvb_adapter *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-context.c | 5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c     | 7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c    | 7 ++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
index 1764674de98bc..16edabda191c4 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
@@ -90,8 +90,9 @@ static void pvr2_context_destroy(struct pvr2_context *mp)
 }
 
 
-static void pvr2_context_notify(struct pvr2_context *mp)
+static void pvr2_context_notify(void *data)
 {
+	struct pvr2_context *mp = data;
 	pvr2_context_set_notify(mp,!0);
 }
 
@@ -107,7 +108,7 @@ static void pvr2_context_check(struct pvr2_context *mp)
 			   "pvr2_context %p (initialize)", mp);
 		/* Finish hardware initialization */
 		if (pvr2_hdw_initialize(mp->hdw,
-					(void (*)(void *))pvr2_context_notify,
+					pvr2_context_notify,
 					mp)) {
 			mp->video_stream.stream =
 				pvr2_hdw_get_video_stream(mp->hdw);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 26811efe0fb58..8b9f1a09bd53d 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -88,8 +88,9 @@ static int pvr2_dvb_feed_thread(void *data)
 	return stat;
 }
 
-static void pvr2_dvb_notify(struct pvr2_dvb_adapter *adap)
+static void pvr2_dvb_notify(void *data)
 {
+	struct pvr2_dvb_adapter *adap = data;
 	wake_up(&adap->buffer_wait_data);
 }
 
@@ -148,8 +149,8 @@ static int pvr2_dvb_stream_do_start(struct pvr2_dvb_adapter *adap)
 		if (!(adap->buffer_storage[idx])) return -ENOMEM;
 	}
 
-	pvr2_stream_set_callback(pvr->video_stream.stream,
-				 (pvr2_stream_callback) pvr2_dvb_notify, adap);
+	pvr2_stream_set_callback(pvr->video_stream.stream, pvr2_dvb_notify,
+				 adap);
 
 	ret = pvr2_stream_set_buffer_count(stream, PVR2_DVB_BUFFER_COUNT);
 	if (ret < 0) return ret;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index c04ab7258d645..590f80949bbfc 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1032,9 +1032,10 @@ static int pvr2_v4l2_open(struct file *file)
 	return 0;
 }
 
-
-static void pvr2_v4l2_notify(struct pvr2_v4l2_fh *fhp)
+static void pvr2_v4l2_notify(void *data)
 {
+	struct pvr2_v4l2_fh *fhp = data;
+
 	wake_up(&fhp->wait_data);
 }
 
@@ -1067,7 +1068,7 @@ static int pvr2_v4l2_iosetup(struct pvr2_v4l2_fh *fh)
 
 	hdw = fh->channel.mc_head->hdw;
 	sp = fh->pdi->stream->stream;
-	pvr2_stream_set_callback(sp,(pvr2_stream_callback)pvr2_v4l2_notify,fh);
+	pvr2_stream_set_callback(sp, pvr2_v4l2_notify, fh);
 	pvr2_hdw_set_stream_type(hdw,fh->pdi->config);
 	if ((ret = pvr2_hdw_set_streaming(hdw,!0)) < 0) return ret;
 	return pvr2_ioread_set_enabled(fh->rhp,!0);

-- 
2.44.0.rc0.258.g7320e95886-goog


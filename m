Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D98F44
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682014032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DAlGbmvVdWeoiiH06KOhyy0LizTfr2FfHgvUIIzCTWQ=;
	b=ND1Ppuxo7nIwogh0wKdgK5HGvGTljzyCkfLI/tab2qs2M8lo08/Po3NdSk6yLHLg9UICXU
	ACfVMfZY6C3gpmp5EkQOORPUDqmO96q7Tg1Y7bGHceUNSgT4pHb0V8TN5AoNmtJ724gZEy
	glksBPyC8oHbw5XRzvhDX+xnazuBhtg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-fayA19tHMgestIT_g56FsA-1; Thu, 20 Apr 2023 14:07:10 -0400
X-MC-Unique: fayA19tHMgestIT_g56FsA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-74e1cdf9cbeso418890985a.0
        for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 11:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682014029; x=1684606029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAlGbmvVdWeoiiH06KOhyy0LizTfr2FfHgvUIIzCTWQ=;
        b=QY33FRLRt2KNb+5rfh9gT4Bx40mq2gTqXw1MeSmzB4nXCLedtVIgKdhGipI07tTMQB
         0vJtmUaTJRvPmprzEDBmf9jdT7CBsIrW3+NMe9GXq+mup+DZyLcugqkywVJhsN2n38Qf
         QBI60qfuDCEsZ54WMu0Vb+zHwpddFKGjdxpj6wnuxXOtLqRyG0RGrScwrtWCkSuBa5a+
         8ENf9P5P3Cd8/AXVvc049b4eQm/Z0WiA55OBKcHPReBkxyyOqFn+dBRjOXxd7x3Y3wVo
         rMr59MNmu7mPLSe9ZzuTPUSJpQDFqjxeihQ1uAjW1BZqlws6fccBLML623qyZfmzJiYd
         OJRw==
X-Gm-Message-State: AAQBX9fSLNjXHXuAhEifoTnvNuGk0UVcHpZxMwOkrlGDFrFvNSPjF6iq
	VyA7ECebsy0Cs0aa6tnScJY05KUpjQUzgSHBAyh/wLBQbPJTKtxM92Z9PVHQFREEeoHCVWxBLut
	ZZLD7PKvvd4arsA==
X-Received: by 2002:ac8:5915:0:b0:3e4:e035:b5ae with SMTP id 21-20020ac85915000000b003e4e035b5aemr5802137qty.25.1682014029752;
        Thu, 20 Apr 2023 11:07:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZtoGbXr5zTKxwxJWHDlD+kzZVK9Rkj0Gg5y9VvHKOIKTnh6wcqzjG9aPwh50t9BtIPzm+YQ==
X-Received: by 2002:ac8:5915:0:b0:3e4:e035:b5ae with SMTP id 21-20020ac85915000000b003e4e035b5aemr5802089qty.25.1682014029490;
        Thu, 20 Apr 2023 11:07:09 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o17-20020a05620a111100b0074e00d6834esm602339qkk.81.2023.04.20.11.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 11:07:09 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	hamza.mahfooz@amd.com,
	drv@mailo.com,
	roman.li@amd.com,
	mairacanal@riseup.net,
	jiapeng.chong@linux.alibaba.com,
	caionovais@usp.br,
	gabe.teeger@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/display: remove unused variables dispclk_delay_subtotal and dout
Date: Thu, 20 Apr 2023 14:07:05 -0400
Message-Id: <20230420180705.3893475-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1003:15:
  error: variable 'dispclk_delay_subtotal' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned int dispclk_delay_subtotal;
                     ^
This variable is not used, so remove it.
Which made dout unused, so also remove.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../display/dc/dml/dcn314/display_rq_dlg_calc_314.c    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index ea4eb66066c4..239cb8160c77 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -951,7 +951,6 @@ static void dml_rq_dlg_get_dlg_params(
 {
 	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
 	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
-	const display_output_params_st *dout = &e2e_pipe_param[pipe_idx].dout;
 	const display_clocks_and_cfg_st *clks = &e2e_pipe_param[pipe_idx].clks_cfg;
 	const scaler_ratio_depth_st *scl = &e2e_pipe_param[pipe_idx].pipe.scale_ratio_depth;
 	const scaler_taps_st *taps = &e2e_pipe_param[pipe_idx].pipe.scale_taps;
@@ -1000,8 +999,6 @@ static void dml_rq_dlg_get_dlg_params(
 	unsigned int vupdate_width;
 	unsigned int vready_offset;
 
-	unsigned int dispclk_delay_subtotal;
-
 	unsigned int vstartup_start;
 	unsigned int dst_x_after_scaler;
 	unsigned int dst_y_after_scaler;
@@ -1127,13 +1124,6 @@ static void dml_rq_dlg_get_dlg_params(
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
-	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
-
-	if (dout->dsc_enable) {
-		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // FROM VBA
-
-		dispclk_delay_subtotal += dsc_delay;
-	}
 
 	vstartup_start = dst->vstartup_start;
 	if (interlaced) {
-- 
2.27.0


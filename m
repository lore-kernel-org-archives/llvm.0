Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108008;
	b=onLZSQBH9sUVJLnDHHu28hyKG5VhMUZZgpqMFx5pcRIURqNibiOcRC1Zhkqltg1upf64
	 Q8BAHEB7t2h/yYVFBsgUAjG/8+HK7WY/730E0VIxBf1V1LE74oJJ8UtIf8cw4dWxLmkVB
	 DpkkZiDiy3IqqP+5AV9KZmRDPlicTVpp90A0bkYGl45ZMyKOfB9KFfmjEmZHrGBFD8qn9
	 irojR5Hg2pxFImID+WdPV2xvbLWAidu2h+59AToM31K6FZeh26QVDVp3yGGb+LwT+X337
	 6XU0qvfPcWKrpSEwzKFinmfoLpLRPUTXJ1IfylPqYXx82MnSd1kVSDUOU7uEr1TgBzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
	b=ybvCPGooZSukX1wyUhM/vHUC/MWqsqqHI8zPBamS5Gj3sboyUOQMwvhGQFNdjM8tZeET
	 AWCQtqdVfD4XlWABtN/g9W600INcDkz/drClNm5R/dY56GbSz0jrCkQDoBkhSERNprTjJ
	 8OgHCY4uqOHkRwIReK6wtJFLlPHyvmqN6K+p7A6ciujhgmTeB6ejLJd+oWHaF6UkdDbfR
	 P3UEUyXlfu9jpYaF5jYaNDLEl0Vg8IpVy5NAsdgtVHtgiM4WkkutHKtmzlbMhHfGf+PZL
	 U0jDCxRRHlEduMUQDZCk/nr7qBMwOYuLRZn4FkqB0K5L1DN+SFRb+mMeOzHsGNaa8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOAG7vpz;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F7606A32A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOAG7vpz
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1846886a12.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108008; x=1795712808; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
        b=WOAG7vpzDFCWmC56dJbA/xRZg3o1XPLWQWd5QAsaaYO0obmK2WQZY7Yjp/Qt/RKapZ
         4RdSDZmtfCnhM7dcspo0N1srlhIohUEWEz6auy7St0UoHqfrGKbZTiiril29OncfOt7h
         p6byewJyFsDbPcwQEJ1doTlQAhuPw1JgrE/kE7zwTARnc1YaCLvzhWcBLJIscJ8ivdhe
         Z4wRk2vALsr0EDYKPWwGSjJ+RArzFOM8U3iEgQYpJY6yeXAKmHPB9CQ7s3WeUkuBKcZp
         zbxIriMGB6iVdwVQcOl9gRy0r5E/R1sjEEVoHTQ/3ILzps0aVJ+03XTAID8YK989ehZy
         mxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108008; x=1795712808;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
        b=VdCEzVGgMEzV/2jsoLHH/zhguGPBBg8iBMrei8gdGbj+S2HPYZMrx8Gqp97GBoqpLG
         e70gHFIVzH1I8IG37yGZQ0H2gtAmitPS7Bdu1/X4EZu3c/H/TzPvpu/h/9/oEzgdavzz
         odbDkvZnSklnDtZ9ZNmlptcR5qSP+igz9IaaHVI03ZnlpsTCmp0/1N0l6U5aCF+I3cxz
         U7+UE2JmL2G3nxEK8tSUuj1XgvhilEdMv3/zo29pTbGedsv8vos9RDZ7Th28FQRmQikz
         gQCKBkfMHQZknxkYMvQQnhagH7n8KaUm4dbHTWZi8+I83IXYlxLui314E7PrqdJPKglR
         g1tQ==
X-Forwarded-Encrypted: i=1; AL+hErHATMqlHgq8pVA5RNXYngRk3dwLAVw75zPBCt/0D34gUp7WHpB8HJsyfLnXQAZKQ4uqzbVF@lists.linux.dev
X-Gm-Message-State: APuU4Z+O2+WrjwcJp5OdckmFw4jWqUZUzQGBfwl5usfu+L4VW303Y69E
	CsAc5aIazsyU90PcyjPXiDC790Uhsh8fW8sZK9P8LATXdl36A3xN488cMmKDVb0BUx2vJcUqMHq
	ns1D+F5nJDQ==
X-Received: from pgfv2-n1.prod.google.com ([2002:a05:6a02:8742:10b0:cd8:b543:4c4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a28:b0:3e1:4424:8f72
 with SMTP id adf61e73a8af0-4014d35cae7mr249471637.69.1795108007517; Thu, 19
 Nov 2026 09:06:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:42 -0800
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
Message-ID: <20261119170642.1521198-1-irogers@google.com>
Subject: [PATCH] drm/i915/display: Pass crtc->pipe to intel_pmdemand_update_port_clock()
From: Ian Rogers <irogers@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In intel_modeset_readout_hw_state(), 'pipe' is only populated inside the
earlier for_each_intel_encoder() loop. Later, inside
for_each_intel_crtc(), intel_pmdemand_update_port_clock() is called with
'pipe' instead of 'crtc->pipe'.

When the encoder list is empty (for example on headless SKUs or VBT
configurations with all display outputs disabled), 'pipe' is completely
uninitialized and indexes out-of-bounds into pmdemand_state->ddi_clocks[].
Even when encoders are present, every CRTC iteration overwrites the slot
for the last encoder's pipe rather than updating crtc->pipe.

Scope 'pipe' locally to for_each_intel_encoder() and pass crtc->pipe to
intel_pmdemand_update_port_clock().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested for both i915 and xe under LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on Intel
Xe_LPD+ hardware.

Fixes: 4c4cc7ac207f ("drm/i915/mtl: Add support for PM DEMAND")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 6aed88173770..e5d7c05e006a 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -695,7 +695,6 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 {
 	struct intel_pmdemand_state *pmdemand_state =
 		to_intel_pmdemand_state(display->pmdemand.obj.state);
-	enum pipe pipe;
 	struct intel_crtc *crtc;
 	struct intel_encoder *encoder;
 	struct intel_connector *connector;
@@ -726,8 +725,7 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 
 	for_each_intel_encoder(display->drm, encoder) {
 		struct intel_crtc_state *crtc_state = NULL;
-
-		pipe = 0;
+		enum pipe pipe = PIPE_A;
 
 		if (encoder->get_hw_state(encoder, &pipe)) {
 			crtc = intel_crtc_for_pipe(display, pipe);
@@ -869,7 +867,8 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 		drm_dbg_kms(display->drm, "[CRTC:%d:%s] min_cdclk %d kHz\n",
 			    crtc->base.base.id, crtc->base.name, crtc_state->min_cdclk);
 
-		intel_pmdemand_update_port_clock(display, pmdemand_state, pipe,
+		intel_pmdemand_update_port_clock(display, pmdemand_state,
+						 crtc->pipe,
 						 crtc_state->port_clock);
 	}
 
-- 
2.56.1.708.g77570a6a1d-goog


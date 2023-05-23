Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090544A84C
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 12:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684846286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bAprbvbicDzO/i64xE13RGPcGm8TJil9TJRhodKNwUQ=;
	b=hVhRB8enzylof6R4Ig1i3YHEyc4XslDvvqKip/RvEgOazSohscBp03djEdFUT9YdPJuIEa
	S/mqJgilESy2+BW0UXbpPxcoQOg0nRmF7NLwrLdW3sSY3AtEkSOHoDwhc1KOJQlu1NBGaA
	LE/0WbN+STxjdRp0QF6zuJ+PDoAbY6o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-5p6GDfpoPIyRykbLBT_MUg-1; Tue, 23 May 2023 08:51:23 -0400
X-MC-Unique: 5p6GDfpoPIyRykbLBT_MUg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-75788e0b1d3so580063085a.1
        for <llvm@lists.linux.dev>; Tue, 23 May 2023 05:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684846283; x=1687438283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAprbvbicDzO/i64xE13RGPcGm8TJil9TJRhodKNwUQ=;
        b=RpnIaOJjK2X8gxRWec3i0s47Eu5MHgjbXMOE8SfIuwctgFKsMIakQ5tdd1yYeM9HoL
         wwOKU9dUowwjWIwAE4ZTTs2507EhqnigAMcCb7wtfCyqFrqbU2RHv1ShBpLBuZsC2MrJ
         kPYCYmssbWfLLSe3m1LyJ+oTiGPHGEtFfiQM7tCem5fsAR/0GoOHWpYjwhfB5/RKseeb
         BGT63RqT0cfPVY8rG97eHgdJsNa6JHyThZdxJyPsJuPFJrXjtlimUARiQDFehjQABEEc
         VElykP99LPKFDTP+hS4RJigU23IKW9DqeVwgmjUk4v8a8sU46bmd3cAEcHAIChehZbmr
         t9+g==
X-Gm-Message-State: AC+VfDyQ0Z7H+shNxSWDGV9I2CYzKvWN3tx2dYsH5jhx1H/geFhLUyqZ
	ttM1tIjawgHEXD+WLY9sElcRZP1lie1RUk0phnQsY/e6pxu7yo6eqDRToFW2u0ne4EAr27S+CR+
	JXuiqUIowz7/h1g==
X-Received: by 2002:a37:88f:0:b0:75b:23a0:e7ed with SMTP id 137-20020a37088f000000b0075b23a0e7edmr3850977qki.78.1684846282951;
        Tue, 23 May 2023 05:51:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GUZvQqUqL8jnjS5iId8YX67qOidNHrEO9Bxwn07WXAbE7b7d2NbJu1BrYJ46XQnyjQLxqgg==
X-Received: by 2002:a37:88f:0:b0:75b:23a0:e7ed with SMTP id 137-20020a37088f000000b0075b23a0e7edmr3850948qki.78.1684846282675;
        Tue, 23 May 2023 05:51:22 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c3-20020ae9e203000000b0075b35e72a21sm7626qkc.86.2023.05.23.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:51:21 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ville.syrjala@linux.intel.com,
	imre.deak@intel.com,
	arun.r.murthy@intel.com,
	lucas.demarchi@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/i915: simplify switch to if-elseif
Date: Tue, 23 May 2023 08:51:16 -0400
Message-Id: <20230523125116.1669057-1-trix@redhat.com>
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
drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated
  fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                case I915_FORMAT_MOD_X_TILED:
                ^

Only one case and the default does anything in this switch, so it should
be changed to an if-elseif.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0490c6412ab5..1f852e49fc20 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5994,8 +5994,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		 * Need to verify this for all gen9 platforms to enable
 		 * this selectively if required.
 		 */
-		switch (new_plane_state->hw.fb->modifier) {
-		case DRM_FORMAT_MOD_LINEAR:
+		if (new_plane_state->hw.fb->modifier == DRM_FORMAT_MOD_LINEAR) {
 			/*
 			 * FIXME: Async on Linear buffer is supported on ICL as
 			 * but with additional alignment and fbc restrictions
@@ -6008,13 +6007,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 					    plane->base.base.id, plane->base.name);
 				return -EINVAL;
 			}
-
-		case I915_FORMAT_MOD_X_TILED:
-		case I915_FORMAT_MOD_Y_TILED:
-		case I915_FORMAT_MOD_Yf_TILED:
-		case I915_FORMAT_MOD_4_TILED:
-			break;
-		default:
+		} else if (!(new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_X_TILED ||
+			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Y_TILED ||
+			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_4_TILED)) {
 			drm_dbg_kms(&i915->drm,
 				    "[PLANE:%d:%s] Modifier does not support async flips\n",
 				    plane->base.base.id, plane->base.name);
-- 
2.27.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F92110F
	for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 05:51:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso51329305e9.0
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690264313; x=1690869113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
        b=Fm732xFUENH32uKlXGBO66pTUcan0hi8UvbXIOsmsajrmKgF65+VKuAsgwl0h2rEvm
         8bVGJCXxJ7Lo3CDTY397Y4mxix0VJtW/pkEXHkkLKO800NxhaPqfFFKex6vpdJLCOa4w
         CmI8aGs1OSFpz1ZKdyfS0I94dx6bSwxKd8BBKpUZIt+arN+GsWHCduZZv9YOaAYpEwDJ
         Kpqga4FAeLkxMrOnhuZRX4J7HcS3KeKVchXAMmblYLn9CvHnXCAxAdBbWFocNGUcqeMO
         Tu3SmXJtzR2hdcpIZzcJs/EIeI/+pl0EtvFzM5PA5rL69dp57n8daVKEcMuVDnfOpImi
         zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690264313; x=1690869113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
        b=IfTdifpkQ1LBJKBglac8dvAUid5K5/LfyBSoVkjS+1rrHbcaWcw67Xo0ln2xVnEtAZ
         yKZ1oHVqKdlcPu9fq06WShHOkZ6OuHCNStIxGaZzINc5H2jNs70QqToRGufWKO++aNCC
         ENfZSCPypUKbBm3gswZrPj+M5VCcpSn1JHqbWooiL4Hk4zmOQtxdCkX2zIgZVOd+fxLd
         r02teMQLNaY5V+FWRZPdFzrHFx9NE3T81b8WoJTZnmb1mQmzKWQdg39fmkM9wpzLEr5F
         87x5nk2fm8BoUd67nDHd2Yv/1+ScU/bZps1L7Lsdwlxht7pqQUCjk2TOKBwTXToIHPOV
         trEw==
X-Gm-Message-State: ABy/qLZftoyFOLRjAXQqMXB8nFUb0KrIaLF8EAftv+aWtJnRT+n3JbJg
	TZyOBe0xP/h3VftoB5Vv2nDalg==
X-Google-Smtp-Source: APBJJlFxsS3y+cMdX48jiFbTMmksWQoLUG07CWaL93WGXpO5sZmPQJoOQhas8KWkVrn1RtL/72a08g==
X-Received: by 2002:a05:600c:152:b0:3fb:e200:b2b3 with SMTP id w18-20020a05600c015200b003fbe200b2b3mr9548144wmm.37.1690264313064;
        Mon, 24 Jul 2023 22:51:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w9-20020adfd4c9000000b0031423a8f4f7sm15243623wrk.56.2023.07.24.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:51:52 -0700 (PDT)
Date: Tue, 25 Jul 2023 08:51:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	andrzej.hajda@intel.com, intel-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mripard@kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
References: <ZL62X3/CnsJcWWU4@ashyti-mobl2.lan>
 <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>

The reason why the first five attempts had bugs is because we are
trying to write it in the most complicated way possible, shifting by
logical not what?

regards,
dan carpenter

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 36b479b46b60..6997b6cb1df2 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -988,7 +988,13 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
 		      const struct tv_mode *tv_mode,
 		      int clock)
 {
-	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
+	int div = tv_mode->oversample;
+
+	if (!tv_mode->progressive)
+		div >>= 1;
+	if (div == 0)
+		div = 1;
+	mode->clock = clock / div;
 
 	/*
 	 * tv_mode horizontal timings:
@@ -1135,6 +1141,8 @@ intel_tv_get_config(struct intel_encoder *encoder,
 		break;
 	default:
 		tv_mode.oversample = 1;
+		WARN_ON_ONCE(!tv_mode.progressive);
+		tv_mode.progressive = true;
 		break;
 	}
 


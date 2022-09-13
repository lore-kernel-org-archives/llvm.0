Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083283C0C
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:55:42 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id d82-20020a25e655000000b006a8fc4506c0so11165834ybh.18
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=s33IIyZmc8+UOGDwcegpipUma0relN3TBfpMpfz2BtE=;
        b=RjSvDvpURFWYgxGTp+hsMgMlof5mN8kvxLIrfLqX4X89vJU6vIXFtmx0+5iAbRnMOl
         AmhQI6ePnBrDnOU4psWJxluoIzalZblllUZva2TEr4N95hjhgz8ZGbLOHTFqvjKegQex
         HWb6RVL597rKKcH75a2RB2G/IRszLtafu+XLKFjl5XN0LrxBPn+c8Q69aA2uJCuI/Pre
         OXID5G2XefTpi4prdWtlr5n9LEccAWLjjHsNyMBuF2bFZow0uM/4qIe4sCcbuQskeeTU
         RRC0VCjDJWvklrNi5KxKkgKM/2yq4MoRMOQLvTqdqMcd8Wtu6wIc4NGkOeV8JKsRLtea
         TIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=s33IIyZmc8+UOGDwcegpipUma0relN3TBfpMpfz2BtE=;
        b=V5qx6i71j9VtWWy6lzl6j3i3w9+c2XmdzYxJx9sROStyNoMBsjQcYnChLRMnrzIzL4
         lW+oFlKjLRIYkpdSUOHNkvCDDoqpy8p+WPHWmnE79gaCmeAMYampYk8E9T2dlHIPQ9ds
         R9BT+FWFi8ywxUVuxjf20s0DP5SJ0qAq7ULqordOStR7qBO4Z4M73ypJjbFLmAtIjsmn
         TTOuXdbv5h86AWeLcXXUPM3YirzcEiaW3NNnx8Xw/hesuNAe1xyClDjHvlEWKOyZ3KJJ
         gWmwtgO3kyLScA9fVTYf9leD3LuOjELLp28q2sES0PFtry8p08l/sk6nCGlyQZ02Jz1W
         frmg==
X-Gm-Message-State: ACgBeo0LynPHFeCgAsPiOPnwXznGj+3csY/1DD4PCKvEtZssTayq3Kxp
	eI+d7RxjBeMNhjIh5KeoyY+2pIsl5g==
X-Google-Smtp-Source: AA6agR5dsFGBClGYLD+8MsGw7ygyHU5aaKZYuov7XnCqBY5RuEfzGEGGFNkCWySIkMRmAQ8phfbVgpv1BQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:a26a:0:b0:6ae:a723:f721 with SMTP id
 b97-20020a25a26a000000b006aea723f721mr15192009ybi.200.1663102541983; Tue, 13
 Sep 2022 13:55:41 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:27 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205531.155046-1-nhuck@google.com>
Subject: [PATCH] drm/i915: Fix return type of mode_valid function hook
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All of the functions used for intel_dvo_dev_ops.mode_valid have a return
type of enum drm_mode_status, but the mode_valid field in the struct
definition has a return type of int.

The mismatched return type breaks forward edge kCFI since the underlying
function definitions do not match the function hook definition.

The return type of the mode_valid field should be changed from int to
enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
index d96c3cc46e50..50205f064d93 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
@@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
 	 *
 	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
 	 */
-	int (*mode_valid)(struct intel_dvo_device *dvo,
-			  struct drm_display_mode *mode);
+	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
+					   struct drm_display_mode *mode);
 
 	/*
 	 * Callback for preparing mode changes on an output
-- 
2.37.2.789.g6183377224-goog


Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77029CA
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:12:13 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id v193so6739464pfc.4
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sa5dbwf1uVEnrK4vxiUJLVmSfssHugVOA16nWAbgTqI=;
        b=gxE7kTQDqXZyXJ2nv9gkrA3D+zCN13eqPEDn0wpuRVPfFQGI3bPsu8uziMzq/Mwu2l
         SmHR7FVFU9//3BG/RtQAMvAzidUsBaKxT0MGg31rW7r6M4hU/B9pvtvMvzSCFaJes+qx
         YK4PueywJ32dehrlNY6FRMWIj/Gsf2mA896JhSv/uaxt/SjqyKVa7rwiWp5sOrEkRw/q
         XnYhWaIsAPjKi//luhYy983Sqo47yMe0ob9ZJqa+h30OKH25PvgMhx/Q3CJ62n+FmeT6
         VGVo/0WODrHGAWV6X3DplaB55URFW6RzHCe9lKKuJg9OS5uGynllxF3U83tg6K5GNaBC
         /NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sa5dbwf1uVEnrK4vxiUJLVmSfssHugVOA16nWAbgTqI=;
        b=aE6uTlCQwViawQqy5ulhET+gx+zs+6rMbT3ZGEoZ2ULg0foVoWgoNylGY0gGXrQ+qX
         Q12w8uTLI3z7Wf3TXk+FhVipJfdjMbIOSHOQXVSB22Ux7F68az1WKo5GZ7QdU2009yRx
         vXARFwAQymU6XmoWAHzAMLso6TpqJQz6LSlrScI+Vv9N/MkXhwTvi2cQW6LWGoGDnEKj
         wmnjuga+WSku2+1YuAXuPQoI8n05iej2f7yffecgvGIOUbo/RKV/NQlNixUOywxOaahf
         AV6Qh236MqLmjj3I4DZjKyRQ61Q65vgAPea7XWLXdJOwADFgGPv5kFszNnKFSA8vM7NO
         4EaQ==
X-Gm-Message-State: AOAM531EhXYY2iARdbn0dOACk9/666YKAdW5AzaXBCGNKA7kj7EVb3ia
	/aWU3wySOxHr7g/bCrS8lY0=
X-Google-Smtp-Source: ABdhPJxofnCkOZ1a4VxNVJqAAfAeca5pvABidxfR2FGE+Qb3BVzrbi2+LVGR1yDY6ViU6qF7cEbCpw==
X-Received: by 2002:aa7:8d09:0:b0:44b:fd25:dd8a with SMTP id j9-20020aa78d09000000b0044bfd25dd8amr24386306pfe.41.1635232332819;
        Tue, 26 Oct 2021 00:12:12 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:12 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org,
	mchehab+huawei@kernel.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@collabora.com,
	gnurou@gmail.com,
	pihsun@chromium.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	gabriel.fernandez@st.com,
	gabriel.fernandez@foss.st.com
Cc: patrice.chotard@foss.st.com,
	hugues.fruchet@foss.st.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	lkp@intel.com,
	kbuild-all@lists.01.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 08/10] media: v4l2-ctrls: Add RGB color effects control
Date: Tue, 26 Oct 2021 15:11:20 +0800
Message-Id: <1635232282-3992-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
for RGB color setting.

with two mirror changes:
- change 0xFFFFFF to 0xffffff
- fix comments 2^24 to 2^24 - 1

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 6 ++++--
 include/uapi/linux/v4l2-controls.h                | 4 +++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index f8d0b923da20..3eec65174260 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -242,8 +242,17 @@ Control IDs
     * - ``V4L2_COLORFX_SET_CBCR``
       - The Cb and Cr chroma components are replaced by fixed coefficients
 	determined by ``V4L2_CID_COLORFX_CBCR`` control.
+    * - ``V4L2_COLORFX_SET_RGB``
+      - The RGB components are replaced by the fixed RGB components determined
+        by ``V4L2_CID_COLORFX_RGB`` control.
 
 
+``V4L2_CID_COLORFX_RGB`` ``(integer)``
+    Determines the Red, Green, and Blue coefficients for
+    ``V4L2_COLORFX_SET_RGB`` color effect.
+    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
+    bits [15:8] as Green component, bits [23:16] as Red component, and
+    bits [31:24] must be zero.
 
 ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
     Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 0cb6c0f18b39..431f7ec17557 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
 
 	/*
 	 * Codec controls
@@ -1394,11 +1395,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_BG_COLOR:
+	case V4L2_CID_COLORFX_RGB:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*step = 1;
 		*min = 0;
-		/* Max is calculated as RGB888 that is 2^24 */
-		*max = 0xFFFFFF;
+		/* Max is calculated as RGB888 that is 2^24 - 1 */
+		*max = 0xffffff;
 		break;
 	case V4L2_CID_COLORFX_CBCR:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 133e20444939..1406df0cc107 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -128,6 +128,7 @@ enum v4l2_colorfx {
 	V4L2_COLORFX_SOLARIZATION		= 13,
 	V4L2_COLORFX_ANTIQUE			= 14,
 	V4L2_COLORFX_SET_CBCR			= 15,
+	V4L2_COLORFX_SET_RGB			= 16,
 };
 #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
 #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
@@ -145,9 +146,10 @@ enum v4l2_colorfx {
 
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
+#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE + 43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE + 44)
 
 /* USER-class private control IDs */
 
-- 
2.7.4


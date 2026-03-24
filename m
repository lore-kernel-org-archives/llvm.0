Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3137C90C;
	Tue, 24 Mar 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774322028; cv=none; b=CRUDFJD6NnROh5MADhtUxVTN+zPUw+Pn2MYZgfhXFvdzhH+oJtq7mS00LI9tILTS73ZYkraDd8tYfNjyszCO6oJ49iZ423YDp46HtoSkKLBNPvukrMhV+RdPY/Tjh1AeXZdYz68VHLuz45LCmB/UhGF4qUGSdii0J0e9RHiHw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774322028; c=relaxed/simple;
	bh=e+eFgd7ldI7FotDOefoxrteo1UBKBAeiV7Taj3MWe9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olONOTXyq6AX6204Cv61JLWxd6ULRduisyPd36uvFIwP8a46OzJTrfzds6yU4sVym2DEAdB/pwsirC0hfL4P92DepwIm9m3QgcHnmz5SSfnh5017BSRH7GcRT+NJiFSTuPgYaTamr0GLQDfVviZ1N36iQvH/V6bWJPh6tGIFKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowACHGw9WAcJpCnRLCw--.5006S2;
	Tue, 24 Mar 2026 11:13:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mchehab@kernel.org
Cc: hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	opensource206@gmail.com,
	jernej.skrabec@gmail.com,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v3] media: v4l2-ctrls: validate HEVC active reference counts
Date: Tue, 24 Mar 2026 11:13:26 +0800
Message-ID: <20260324031326.7274-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHGw9WAcJpCnRLCw--.5006S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr47JFyfWryfGryDWFW8Xrb_yoW5Gr1xpF
	ZY9rnxtrW7trsFvrZrGa1UZF98ua93JFW5JFW3tw1I9F1agr13Jw4UKr95Zr4SyrZ3C3y7
	tr1IqF4DGFy5C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUDl1PUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

HEVC slice parameters are shared stateless V4L2 controls, but the common
validation path does not verify the active L0/L1 reference counts before
driver-specific code consumes them.

The original report came from Cedrus, but the active count bounds are
not Cedrus-specific. Validate them in the common HEVC slice control path
so stateless HEVC drivers get the same basic guarantees as soon as the
control is queued.

Do not reject ref_idx_l0/ref_idx_l1 entries here. Existing userspace may
use out-of-range sentinel values such as 0xff for missing references, and
some hardware can use that information for concealment. Keep this common
check limited to the active reference counts.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v3:
- add the missing `p_hevc_slice_params` declaration to fix the build break
  reported by lkp
- keep only the active L0/L1 reference count validation in common code
- drop the ref_idx_l0/ref_idx_l1 rejection per Nicolas Dufresne's review,
  since existing userspace may use out-of-range sentinel values such as
  0xff for missing references

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395..ba047d7d8601 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -971,6 +971,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_ext_sps_st_rps *p_hevc_st_rps;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
+	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
@@ -1260,6 +1261,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		p_hevc_slice_params = p;
+
+		if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		if (p_hevc_slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_B)
+			break;
+
+		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
-- 
2.50.1 (Apple Git-155)


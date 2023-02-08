Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196F33C9
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 16:33:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e3so591789wrs.10
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hpZMyEZ/ylFXD4s7yPv/vME9OXnH6Xd9zJ2N8eIQx0=;
        b=LxyC/E0bqe18G3gdSR8i5KN4VRhkN00v2Rvd01N61PNvHvfNwMBB3akujYXIYmQx1R
         4RpoNrHQwnKoHRhgK7Og1nhPel4XefF4+0x0kzE9j+MNZ7Huo7yU6pxTxvEu3EKnu33r
         rWC2Le54datl1jCiKBOEKQvKsYWARERkSlCtnEjrOtdqGqOz1ls9wxj8SrCdOX/7hDJq
         KDi+l2KmpxPOL1YDgDUyU1p8hjB8pu+cqDUiil6y/vkcbyY4zrq+OYFN5AkRR7x+EkuS
         +t4MklzjSZY0yF7PbbTZe/nwSvo+3qHj0zHYa5zCHLSmauHDt6m3PWrWU27OrbGerH5U
         Xi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hpZMyEZ/ylFXD4s7yPv/vME9OXnH6Xd9zJ2N8eIQx0=;
        b=ZevJvQ658dETqvLxLjHmq8RXyCqyskzzDy5wpeOXlhlJbvV1beOFILgl/kdHJUU53J
         GRmqrmaulEh0OtGs7syIPR3HwRQjFiCyhgI3oE28U9eujGtbcvjdv+eQN8hRTPMnGemV
         gClbNB7IsiSd2hMCUw5xrd7RW5cOBTEEIOZWr5MljbSC6Wo6Gp5yMd31Jfh2j3EcfxPN
         spf0sP8sfnAPFUE/RESCTAY+F4ThlQyXZGZHGdJdt1qjwHxVu5wnZZaFP/EFjId6H7kS
         8SI97zWcccboZtnLdqUconvj+i8ozPi+JmfEvbJiNCJgEPbc7bRPfSr/nojFzAKCSs+T
         PkNg==
X-Gm-Message-State: AO0yUKUKmWll2qpaJK6pWj9U09yBGErI7QCz6aKe1T2DWuIVrEf6A8nI
	v+Ykpd6cuWeZGKxutzSc68ARzQ==
X-Google-Smtp-Source: AK7set/3d4f5CP6RZwjnnpRNf/g9A59c+dWMr1wXJye3VhvVVTPgqWDW60EKjErND9Gj7H2pSrWNwg==
X-Received: by 2002:a5d:6707:0:b0:2bf:da34:2b37 with SMTP id o7-20020a5d6707000000b002bfda342b37mr7962884wru.3.1675874023653;
        Wed, 08 Feb 2023 08:33:43 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d65cf000000b002bfc0558ecdsm13842206wrw.113.2023.02.08.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:33:43 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 8 Feb 2023 16:33:42 +0000 (UTC)
To: Sung Joon Kim <sungkim@amd.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1085434560.11306.1675874023182@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc6-1149-g5b49da02ddbe:
 drm/amd/display: Enable Freesync over PCon
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11305_1054224065.1675874022578"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_11305_1054224065.1675874022578
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc6-1149-g5b49da02ddbe: drm/amd/display: Enable Freesync over PCon:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22902
# First few build errors in logs:
# 00:08:50 drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
# 00:08:50 make[4]: *** [scripts/Makefile.build:252: drivers/gpu/host1x/dev.o] Error 1
# 00:09:35 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/host1x] Error 2
# 00:16:47 ./drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: 'mod_info_packet.h' file not found
# 00:16:47 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o] Error 1
# 00:16:47 ./drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: 'mod_info_packet.h' file not found
# 00:16:48 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o] Error 1
# 00:16:52 ./drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: 'mod_info_packet.h' file not found
# 00:16:52 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o] Error 1
# 00:16:56 ./drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: 'mod_info_packet.h' file not found

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23188
# First few build errors in logs:
# 00:11:28 drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
# 00:11:28 make[4]: *** [scripts/Makefile.build:252: drivers/gpu/host1x/dev.o] Error 1
# 00:12:17 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/host1x] Error 2
# 00:39:28 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
# 00:39:29 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
# 00:45:13 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
# 00:45:13 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
# 00:45:13 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2
# 00:45:13 make[2]: *** [scripts/Makefile.build:504: drivers/net] Error 2
# 00:47:26 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc6-1149-g5b49da02ddbe commit for tcwg_kernel:
commit 5b49da02ddbe1b9082cfc9be1cd848375da178ea
Author: Sung Joon Kim <sungkim@amd.com>
Date:   Thu Jan 12 10:38:10 2023 -0500

    drm/amd/display: Enable Freesync over PCon
    
    [why]
    Enable Freesync over PCon on Linux environment.
    
    [how]
    Adding Freesync over PCon support in amdgpu_dm
    - Read DPCD for Freesync over PCon capabilitiy
    - Add whitelist for compatible branch devices
    
    Reviewed-by: Chao-kai Wang <Stylon.Wang@amd.com>
    Acked-by: Alex Hung <alex.hung@amd.com>
    Signed-off-by: Sung Joon Kim <sungkim@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
* llvm-master-arm-next-allmodconfig
** Failure after v6.2-rc6-1149-g5b49da02ddbe: drm/amd/display: Enable Freesync over PCon:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allmodconfig/552/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allmodconfig/552/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allmodconfig/551/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-5b49da02ddbe1b9082cfc9be1cd848375da178ea
cd investigate-linux-5b49da02ddbe1b9082cfc9be1cd848375da178ea

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allmodconfig/552/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allmodconfig/551/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 5b49da02ddbe1b9082cfc9be1cd848375da178ea
Author: Sung Joon Kim <sungkim@amd.com>
Date:   Thu Jan 12 10:38:10 2023 -0500

    drm/amd/display: Enable Freesync over PCon
    
    [why]
    Enable Freesync over PCon on Linux environment.
    
    [how]
    Adding Freesync over PCon support in amdgpu_dm
    - Read DPCD for Freesync over PCon capabilitiy
    - Add whitelist for compatible branch devices
    
    Reviewed-by: Chao-kai Wang <Stylon.Wang@amd.com>
    Acked-by: Alex Hung <alex.hung@amd.com>
    Signed-off-by: Sung Joon Kim <sungkim@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 45 ++++++++++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  | 67 ++++++++++++----------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 33 +++++++++++
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  1 +
 .../drm/amd/display/include/ddc_service_types.h    |  1 +
 .../drm/amd/display/modules/inc/mod_info_packet.h  |  4 +-
 .../amd/display/modules/info_packet/info_packet.c  |  4 +-
 7 files changed, 118 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e1d63826927a..9846bd6e0456 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -106,7 +106,6 @@
 
 #include "modules/inc/mod_freesync.h"
 #include "modules/power/power_helpers.h"
-#include "modules/inc/mod_info_packet.h"
 
 #define FIRMWARE_RENOIR_DMUB "amdgpu/renoir_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_RENOIR_DMUB);
@@ -7113,6 +7112,9 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.dpms = DRM_MODE_DPMS_OFF;
 	aconnector->hpd.hpd = AMDGPU_HPD_NONE; /* not used */
 	aconnector->audio_inst = -1;
+	aconnector->pack_sdp_v1_3 = false;
+	aconnector->as_type = ADAPTIVE_SYNC_TYPE_NONE;
+	memset(&aconnector->vsdb_info, 0, sizeof(aconnector->vsdb_info));
 	mutex_init(&aconnector->hpd_lock);
 
 	/*
@@ -7603,6 +7605,8 @@ static void update_freesync_state_on_stream(
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(new_crtc_state->base.crtc);
 	unsigned long flags;
 	bool pack_sdp_v1_3 = false;
+	struct amdgpu_dm_connector *aconn;
+	enum vrr_packet_type packet_type = PACKET_TYPE_VRR;
 
 	if (!new_stream)
 		return;
@@ -7638,11 +7642,27 @@ static void update_freesync_state_on_stream(
 		}
 	}
 
+	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
+
+	if (aconn && aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
+		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
+
+		if (aconn->vsdb_info.amd_vsdb_version == 1)
+			packet_type = PACKET_TYPE_FS_V1;
+		else if (aconn->vsdb_info.amd_vsdb_version == 2)
+			packet_type = PACKET_TYPE_FS_V2;
+		else if (aconn->vsdb_info.amd_vsdb_version == 3)
+			packet_type = PACKET_TYPE_FS_V3;
+
+		mod_build_adaptive_sync_infopacket(new_stream, aconn->as_type, NULL,
+					&new_stream->adaptive_sync_infopacket);
+	}
+
 	mod_freesync_build_vrr_infopacket(
 		dm->freesync_module,
 		new_stream,
 		&vrr_params,
-		PACKET_TYPE_VRR,
+		packet_type,
 		TRANSFER_FUNC_UNKNOWN,
 		&vrr_infopacket,
 		pack_sdp_v1_3);
@@ -10311,6 +10331,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	bool freesync_capable = false;
+	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
 	if (!connector->state) {
 		DRM_ERROR("%s - Connector has no state", __func__);
@@ -10403,6 +10424,26 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		}
 	}
 
+	as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
+
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
+		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
+
+			amdgpu_dm_connector->pack_sdp_v1_3 = true;
+			amdgpu_dm_connector->as_type = as_type;
+			amdgpu_dm_connector->vsdb_info = vsdb_info;
+
+			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
+			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
+			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+				freesync_capable = true;
+
+			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
+			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
+		}
+	}
+
 update:
 	if (dm_con_state)
 		dm_con_state->freesync_capable = freesync_capable;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index d89f2eaf9117..ed5cbe9da40c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -59,6 +59,7 @@
 #include "irq_types.h"
 #include "signal_types.h"
 #include "amdgpu_dm_crc.h"
+#include "mod_info_packet.h"
 struct aux_payload;
 struct set_config_cmd_payload;
 enum aux_return_code_type;
@@ -577,6 +578,36 @@ enum mst_progress_status {
 	MST_CLEAR_ALLOCATED_PAYLOAD = BIT(3),
 };
 
+/**
+ * struct amdgpu_hdmi_vsdb_info - Keep track of the VSDB info
+ *
+ * AMDGPU supports FreeSync over HDMI by using the VSDB section, and this
+ * struct is useful to keep track of the display-specific information about
+ * FreeSync.
+ */
+struct amdgpu_hdmi_vsdb_info {
+	/**
+	 * @amd_vsdb_version: Vendor Specific Data Block Version, should be
+	 * used to determine which Vendor Specific InfoFrame (VSIF) to send.
+	 */
+	unsigned int amd_vsdb_version;
+
+	/**
+	 * @freesync_supported: FreeSync Supported.
+	 */
+	bool freesync_supported;
+
+	/**
+	 * @min_refresh_rate_hz: FreeSync Minimum Refresh Rate in Hz.
+	 */
+	unsigned int min_refresh_rate_hz;
+
+	/**
+	 * @max_refresh_rate_hz: FreeSync Maximum Refresh Rate in Hz
+	 */
+	unsigned int max_refresh_rate_hz;
+};
+
 struct amdgpu_dm_connector {
 
 	struct drm_connector base;
@@ -649,6 +680,11 @@ struct amdgpu_dm_connector {
 	/* Automated testing */
 	bool timing_changed;
 	struct dc_crtc_timing *timing_requested;
+
+	/* Adaptive Sync */
+	bool pack_sdp_v1_3;
+	enum adaptive_sync_type as_type;
+	struct amdgpu_hdmi_vsdb_info vsdb_info;
 };
 
 static inline void amdgpu_dm_set_mst_status(uint8_t *status,
@@ -719,37 +755,6 @@ struct dm_connector_state {
 	uint64_t pbn;
 };
 
-/**
- * struct amdgpu_hdmi_vsdb_info - Keep track of the VSDB info
- *
- * AMDGPU supports FreeSync over HDMI by using the VSDB section, and this
- * struct is useful to keep track of the display-specific information about
- * FreeSync.
- */
-struct amdgpu_hdmi_vsdb_info {
-	/**
-	 * @amd_vsdb_version: Vendor Specific Data Block Version, should be
-	 * used to determine which Vendor Specific InfoFrame (VSIF) to send.
-	 */
-	unsigned int amd_vsdb_version;
-
-	/**
-	 * @freesync_supported: FreeSync Supported.
-	 */
-	bool freesync_supported;
-
-	/**
-	 * @min_refresh_rate_hz: FreeSync Minimum Refresh Rate in Hz.
-	 */
-	unsigned int min_refresh_rate_hz;
-
-	/**
-	 * @max_refresh_rate_hz: FreeSync Maximum Refresh Rate in Hz
-	 */
-	unsigned int max_refresh_rate_hz;
-};
-
-
 #define to_dm_connector_state(x)\
 	container_of((x), struct dm_connector_state, base)
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index a50319fc42b1..5c733d445fe9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1133,3 +1133,36 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
 	// TODO
 }
 
+static bool dm_is_freesync_pcon_whitelist(const uint32_t branch_dev_id)
+{
+	bool ret_val = false;
+
+	switch (branch_dev_id) {
+	case DP_BRANCH_DEVICE_ID_0060AD:
+		ret_val = true;
+		break;
+	default:
+		break;
+	}
+
+	return ret_val;
+}
+
+enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
+{
+	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
+	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
+
+	switch (dpcd_caps->dongle_type) {
+	case DISPLAY_DONGLE_DP_HDMI_CONVERTER:
+		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
+			dpcd_caps->allow_invalid_MSA_timing_param == true &&
+			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
+			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
+		break;
+	default:
+		break;
+	}
+
+	return as_type;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index c624c768cc3d..7ce9a5b6c33b 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -199,6 +199,7 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
 		const struct dc_link *link,
 		struct set_config_cmd_payload *payload,
 		enum set_config_status *operation_result);
+enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index 3610f71891a3..31a12ce79a8e 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -35,6 +35,7 @@
 #define DP_BRANCH_DEVICE_ID_00E04C 0x00E04C
 #define DP_BRANCH_DEVICE_ID_006037 0x006037
 #define DP_BRANCH_DEVICE_ID_001CF8 0x001CF8
+#define DP_BRANCH_DEVICE_ID_0060AD 0x0060AD
 #define DP_BRANCH_HW_REV_10 0x10
 #define DP_BRANCH_HW_REV_20 0x20
 
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 91fe039c0c95..66dc9a19aebe 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -44,8 +44,8 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_NONE                  = 0,
 	ADAPTIVE_SYNC_TYPE_DP                    = 1,
-	ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST     = 2,
-	ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST = 3,
+	FREESYNC_TYPE_PCON_IN_WHITELIST          = 2,
+	FREESYNC_TYPE_PCON_NOT_IN_WHITELIST      = 3,
 	ADAPTIVE_SYNC_TYPE_EDP                   = 4,
 };
 
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index a8a31d0a7a7f..ec64f19e1786 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -533,11 +533,11 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		if (stream != NULL)
 			mod_build_adaptive_sync_infopacket_v2(stream, param, info_packet);
 		break;
-	case ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST:
+	case FREESYNC_TYPE_PCON_IN_WHITELIST:
 		mod_build_adaptive_sync_infopacket_v1(info_packet);
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
-	case ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST:
+	case FREESYNC_TYPE_PCON_NOT_IN_WHITELIST:
 	default:
 		break;
 	}
</cut>
------=_Part_11305_1054224065.1675874022578--

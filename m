Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14912320C
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 23:26:51 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id u24so9556927edd.13
        for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 15:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KADbkbvz5yKtUAjjD7EFGnJDyfmWlCmlphZCWi3ecKk=;
        b=haTxYvS1p3x6WRXW+/uw4Spqrhef7suYhTD/p0c3D2eKFA1NOkl8VwOTHWDoRcIiCH
         BtXWTCTt8IjVaixm8mDDGON/FHTxF5LflyJUWAGuBuIJYTu2ywLhNGDD8vl4uDuh6Kue
         zRtAgQRkVib+D4cDu33pZVm1o094TqFpNt44Jm1oZaBF8F+1/2iQDU5IfTMXp1Umba7y
         YeyXu1wAzvCs1aTlkcybBz37K4zPjJURRT78ZIDIoQBHqo1S4ENdNAzKS1IQAB94VNP/
         ZK1vfPp+JqYsNS80E7IPczRhzeLH4ZlDo6DboMqHuYXPELJl9+kOz9KqBoSEAcJKdPEI
         c/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KADbkbvz5yKtUAjjD7EFGnJDyfmWlCmlphZCWi3ecKk=;
        b=XEcHD4XbECjrksZ6qyoBkPGCo4oZl7MCqR+AnmrOdxnraNdGp4atgKEpW+wymXpVen
         FW8O4blrqc7pCHNeU1FkqavGwXYzYv00YBPwbaeJpfP7VDu6ATtzJzF7a+6Rklj0jgkt
         z5hqmg8+lmPslBmKt7JJz+M3PuuMZ27/ImvTLpYzJARDfpMPm2pQWa9rnuvpviyjA2iy
         BH6dTNS70Yn/enciacFGfT592QCz++Q2lWlYETS823xesGtj7g92+F2tlDr6diqNq7Yd
         eXvy9ubCqZQDCpe0Z9B5kZ2iShPHFR1YljKhG3hvojHESHixgyfjlXLUfwU1R0m3Ejpj
         SQvw==
X-Gm-Message-State: ANoB5pnBPy8uJLYs0r+QkgOhZmrmcvmFAdQ94bIU4XJxkmXM2tZf2MV7
	3DDmBj+V3DZCB5/QN09haFZ7Tg==
X-Google-Smtp-Source: AA0mqf4Y9zjU3LcqG1AJk4amuVxlMIe65MWsU7Lc9fpx5in0gByrgVQczs1gUW5IJHYyckNETbSl4Q==
X-Received: by 2002:a05:6402:5a:b0:45a:1bfa:98bf with SMTP id f26-20020a056402005a00b0045a1bfa98bfmr3421911edu.413.1668209210271;
        Fri, 11 Nov 2022 15:26:50 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090630d000b00795bb7d64d8sm1359639ejb.217.2022.11.11.15.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 15:26:49 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 11 Nov 2022 23:26:49 +0000 (UTC)
To: Alvin Lee <Alvin.Lee2@amd.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1176602956.26279.1668209209899@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc2-818-gdc55b106ad47:
 drm/amd/display: Disable phantom OTG after enable for plane disable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_26278_562985603.1668209209392"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_26278_562985603.1668209209392
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.1-rc2-818-gdc55b106ad47: drm/amd/display: Disable phantom OTG after enable for plane disable:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23498
# First few build errors in logs:
# 01:03:14 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1134:20: error: no member named 'disable_phantom_crtc' in 'struct timing_generator_funcs'
# 01:03:14 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1135:17: error: no member named 'disable_phantom_crtc' in 'struct timing_generator_funcs'
# 01:03:14 make[5]: *** [scripts/Makefile.build:250: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o] Error 1
# 01:03:30 make[4]: *** [scripts/Makefile.build:500: drivers/gpu/drm/amd/amdgpu] Error 2
# 01:04:24 make[3]: *** [scripts/Makefile.build:500: drivers/gpu/drm] Error 2
# 01:04:24 make[2]: *** [scripts/Makefile.build:500: drivers/gpu] Error 2
# 01:04:24 make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
# 01:04:24 make: *** [Makefile:1992: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
32271
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.1-rc2-818-gdc55b106ad47 commit for tcwg_kernel:
commit dc55b106ad477c67f969f3432d9070c6846fb557
Author: Alvin Lee <Alvin.Lee2@amd.com>
Date:   Thu Oct 27 10:51:15 2022 -0400

    drm/amd/display: Disable phantom OTG after enable for plane disable
    
    [Description]
    - Need to disable phantom OTG after it's enabled
      in order to restore it to it's original state.
    - If it's enabled and then an MCLK switch comes in
      we may not prefetch the correct data since the phantom
      OTG could already be in the middle of the frame.
    
    Reviewed-by: Jun Lei <Jun.Lei@amd.com>
    Acked-by: Alan Liu <HaoPing.Liu@amd.com>
    Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
* llvm-master-aarch64-next-allmodconfig
** Failure after v6.1-rc2-818-gdc55b106ad47: drm/amd/display: Disable phantom OTG after enable for plane disable:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/575/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/575/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/574/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-dc55b106ad477c67f969f3432d9070c6846fb557
cd investigate-linux-dc55b106ad477c67f969f3432d9070c6846fb557

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/575/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/574/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit dc55b106ad477c67f969f3432d9070c6846fb557
Author: Alvin Lee <Alvin.Lee2@amd.com>
Date:   Thu Oct 27 10:51:15 2022 -0400

    drm/amd/display: Disable phantom OTG after enable for plane disable
    
    [Description]
    - Need to disable phantom OTG after it's enabled
      in order to restore it to it's original state.
    - If it's enabled and then an MCLK switch comes in
      we may not prefetch the correct data since the phantom
      OTG could already be in the middle of the frame.
    
    Reviewed-by: Jun Lei <Jun.Lei@amd.com>
    Acked-by: Alan Liu <HaoPing.Liu@amd.com>
    Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c                 | 14 +++++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c        |  8 ++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index da808996e21d..9c3704c4d7e4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1055,6 +1055,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 	struct dc_state *dangling_context = dc_create_state(dc);
 	struct dc_state *current_ctx;
 	struct pipe_ctx *pipe;
+	struct timing_generator *tg;
 
 	if (dangling_context == NULL)
 		return;
@@ -1098,6 +1099,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 
 		if (should_disable && old_stream) {
 			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+			tg = pipe->stream_res.tg;
 			/* When disabling plane for a phantom pipe, we must turn on the
 			 * phantom OTG so the disable programming gets the double buffer
 			 * update. Otherwise the pipe will be left in a partially disabled
@@ -1105,7 +1107,8 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 			 * again for different use.
 			 */
 			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
-				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+				if (tg->funcs->enable_crtc)
+					tg->funcs->enable_crtc(tg);
 			}
 			dc_rem_all_planes_for_stream(dc, old_stream, dangling_context);
 			disable_all_writeback_pipes_for_stream(dc, old_stream, dangling_context);
@@ -1122,6 +1125,15 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 				dc->hwss.interdependent_update_lock(dc, dc->current_state, false);
 				dc->hwss.post_unlock_program_front_end(dc, dangling_context);
 			}
+			/* We need to put the phantom OTG back into it's default (disabled) state or we
+			 * can get corruption when transition from one SubVP config to a different one.
+			 * The OTG is set to disable on falling edge of VUPDATE so the plane disable
+			 * will still get it's double buffer update.
+			 */
+			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				if (tg->funcs->disable_phantom_crtc)
+					tg->funcs->disable_phantom_crtc(tg);
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
index 2b33eeb213e2..2ee798965bc2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
@@ -167,6 +167,13 @@ static void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
 	REG_WAIT(OTG_CLOCK_CONTROL, OTG_BUSY, 0, 1, 100000);
 }
 
+static void optc32_disable_phantom_otg(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_CONTROL, OTG_MASTER_EN, 0);
+}
+
 static void optc32_set_odm_bypass(struct timing_generator *optc,
 		const struct dc_crtc_timing *dc_crtc_timing)
 {
@@ -260,6 +267,7 @@ static struct timing_generator_funcs dcn32_tg_funcs = {
 		.enable_crtc = optc32_enable_crtc,
 		.disable_crtc = optc32_disable_crtc,
 		.phantom_crtc_post_enable = optc32_phantom_crtc_post_enable,
+		.disable_phantom_crtc = optc32_disable_phantom_otg,
 		/* used by enable_timing_synchronization. Not need for FPGA */
 		.is_counter_moving = optc1_is_counter_moving,
 		.get_position = optc1_get_position,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index 65f18f9dad34..43eb61961e0f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -184,6 +184,7 @@ struct timing_generator_funcs {
 	bool (*disable_crtc)(struct timing_generator *tg);
 #ifdef CONFIG_DRM_AMD_DC_DCN
 	void (*phantom_crtc_post_enable)(struct timing_generator *tg);
+	void (*disable_phantom_crtc)(struct timing_generator *tg);
 #endif
 	bool (*immediate_disable_crtc)(struct timing_generator *tg);
 	bool (*is_counter_moving)(struct timing_generator *tg);
</cut>
------=_Part_26278_562985603.1668209209392--

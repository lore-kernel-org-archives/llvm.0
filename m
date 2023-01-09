Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD63C1E
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 17:29:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso10395868pjo.3
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EtTRoaHTnsAMb/E+aYwARhNrumDjyq1sW46G7YD9G0M=;
        b=JXXB+M5Qn7UNOfx51fPzRb4xttjpG1VpVYzs6u7AdG0Fmkf3zyOcekGPyXhkU321GI
         7mObyQ9z2r/XxjjzykYRzKSOJxCIt7DOj2nHaLHEsYCN07skYsQoWwfJHEfb7ALoeJMR
         W0RWl/KvNxpgUqc6kV2XFuApVzhTZWokohawyoz8hu2ZfhTXMLjUWDwF1KosgjSPn4EF
         b3weTUQdCDTpV8k6c9Rfpf98bTcC3O+SJWJZNtdHsSotWWeK0NGHdszmrYDOgEREaYuX
         is1RXSYNDdhDJPPdWDfgJ7wECON9rfZ+IJ+ikYfjUnxLna9N6AL6rAB5TD5gmw/A9qgR
         kP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtTRoaHTnsAMb/E+aYwARhNrumDjyq1sW46G7YD9G0M=;
        b=JeHddT4hYAMMy700TAaoy1T9C40mM4SOS9wqOMfi68ukGtoWfZDFgRjRZRSGp4vmvl
         j5Ixdt4rRgJyJDa8f20NFqVfahNFJuFgQWPG32ZY4E0wa23AkRXlEUqfYJrwj194PDWJ
         bXztFFXY59AMHDmi45S2WgepkSx/aw/yVyDbScvc1B9rzEsOKRIOwJIxr8iOY+0xz7RX
         T09ovqbhTmcL0lo1d6NJk+o+d3KM8sQ7IbwsK2yrJt7CCXQAdrWg5yyDJyyZnuQflTQn
         ZO83DF+kjhbeq2DK2msA5XnEu86W7NnbcgDtPkHdT5m4KXz12t2JAnD2GB7H4aM5mCgg
         0sQQ==
X-Gm-Message-State: AFqh2koZpj0AI2ddirImcTJK5LYTd/LDK4JVWBEfkhYcfw+pr7NZh0EF
	cDaL7C/m+9ACqfXgZk6Z81lzEHtIQWyfzqMQfB0rJg==
X-Google-Smtp-Source: AMrXdXuKw7KO43bj8VlPdmoLKYGT/f7cRZualGiaD2W7n9/KR25z1y1Y9BdVv40a5dVMyCcBRWypYlitWDvs18WM9Gg=
X-Received: by 2002:a17:902:a407:b0:189:f899:bc23 with SMTP id
 p7-20020a170902a40700b00189f899bc23mr3707660plq.33.1673285342732; Mon, 09 Jan
 2023 09:29:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <653462903.13152.1672960268772@jenkins.jenkins> <CAFCwf11pfNpQKTm295M8ifQ6mpD+DmpDzVUfmh4j9WTaePijRQ@mail.gmail.com>
In-Reply-To: <CAFCwf11pfNpQKTm295M8ifQ6mpD+DmpDzVUfmh4j9WTaePijRQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 09:28:51 -0800
Message-ID: <CAKwvOdmXQcwt9kCAimis-_U0Eh+RKk60doHKRoy6pgqbvH6jbw@mail.gmail.com>
Subject: Re: [TCWG CI] Failure after v6.2-rc1-33-g520560c30621: habanalabs:
 move driver to accel subsystem
To: Oded Gabbay <ogabbay@kernel.org>
Cc: ci_notify@linaro.org, llvm@lists.linux.dev, arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 1:33 AM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Fri, Jan 6, 2023 at 1:11 AM <ci_notify@linaro.org> wrote:
> >
> > Failure after v6.2-rc1-33-g520560c30621: habanalabs: move driver to accel subsystem:
> >
> > Results changed to
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 20998
> > # First few build errors in logs:
> > # 00:14:32 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
> > # 00:14:33 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/tests/drm_mm_test.o] Error 1
> > # 00:14:38 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/tests] Error 2
> > # 00:45:44 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
> > # 00:45:44 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
> > # 00:49:50 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2
> > # 00:49:50 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2
> > # 00:49:52 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
> > # 00:49:52 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
> > # 00:49:52 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2
> >
> > from
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 21030
> > # First few build errors in logs:
> > # 00:16:40 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
> > # 00:16:41 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/tests/drm_mm_test.o] Error 1
> > # 00:16:45 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/tests] Error 2
> > # 00:47:00 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
> > # 00:47:01 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
> > # 00:50:01 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2
> > # 00:50:01 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2
> > # 00:50:09 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
> > # 00:50:09 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
> > # 00:50:09 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2
> >
> > THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> I don't understand how my change below has caused the above errors ?
> The two functions/modules are not used by my code.
> Was it maybe due to changes in order of compilation because of the
> makefile changes ? I have no idea.

Same, probably a bad automated bisection. We're still paring down
-Wframe-larger-than warnings for allyesconfig on arm.

>
> Oded
>
> >
> > For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
> > Status of v6.2-rc1-33-g520560c30621 commit for tcwg_kernel:
> > commit 520560c306216414cf8614f58796ec79618419cd
> > Author: Oded Gabbay <ogabbay@kernel.org>
> > Date:   Mon Dec 26 23:05:00 2022 +0200
> >
> >     habanalabs: move driver to accel subsystem
> >
> >     Now that we have a subsystem for compute accelerators, move the
> >     habanalabs driver to it.
> >
> >     This patch only moves the files and fixes the Makefiles. Future
> >     patches will change the existing code to register to the accel
> >     subsystem and expose the accel device char files instead of the
> >     habanalabs device char files.
> >
> >     Update the MAINTAINERS file to reflect this change.
> >
> >     Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > * llvm-master-arm-next-allyesconfig
> > ** Failure after v6.2-rc1-33-g520560c30621: habanalabs: move driver to accel subsystem:
> > ** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/541/
> >
> > Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/541/artifact/artifacts
> > Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/540/artifact/artifacts
> >
> > Reproduce current build:
> > <cut>
> > mkdir -p investigate-linux-520560c306216414cf8614f58796ec79618419cd
> > cd investigate-linux-520560c306216414cf8614f58796ec79618419cd
> >
> > # Fetch scripts
> > git clone https://git.linaro.org/toolchain/jenkins-scripts
> >
> > # Fetch manifests for bad and good builds
> > mkdir -p bad/artifacts good/artifacts
> > curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/541/artifact/artifacts/manifest.sh --fail
> > curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/540/artifact/artifacts/manifest.sh --fail
> >
> > # Reproduce bad build
> > (cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> > # Reproduce good build
> > (cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> > </cut>
> >
> > Full commit (up to 1000 lines):
> > <cut>
> > commit 520560c306216414cf8614f58796ec79618419cd
> > Author: Oded Gabbay <ogabbay@kernel.org>
> > Date:   Mon Dec 26 23:05:00 2022 +0200
> >
> >     habanalabs: move driver to accel subsystem
> >
> >     Now that we have a subsystem for compute accelerators, move the
> >     habanalabs driver to it.
> >
> >     This patch only moves the files and fixes the Makefiles. Future
> >     patches will change the existing code to register to the accel
> >     subsystem and expose the accel device char files instead of the
> >     habanalabs device char files.
> >
> >     Update the MAINTAINERS file to reflect this change.
> >
> >     Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >  MAINTAINERS                                                         | 4 +++-
> >  drivers/Makefile                                                    | 1 +
> >  drivers/accel/Kconfig                                               | 2 ++
> >  drivers/accel/Makefile                                              | 3 +++
> >  drivers/{misc => accel}/habanalabs/Kconfig                          | 6 ++++--
> >  drivers/{misc => accel}/habanalabs/Makefile                         | 2 +-
> >  drivers/{misc => accel}/habanalabs/common/Makefile                  | 0
> >  drivers/{misc => accel}/habanalabs/common/asid.c                    | 0
> >  drivers/{misc => accel}/habanalabs/common/command_buffer.c          | 0
> >  drivers/{misc => accel}/habanalabs/common/command_submission.c      | 0
> >  drivers/{misc => accel}/habanalabs/common/context.c                 | 0
> >  drivers/{misc => accel}/habanalabs/common/debugfs.c                 | 0
> >  drivers/{misc => accel}/habanalabs/common/decoder.c                 | 0
> >  drivers/{misc => accel}/habanalabs/common/device.c                  | 0
> >  drivers/{misc => accel}/habanalabs/common/firmware_if.c             | 0
> >  drivers/{misc => accel}/habanalabs/common/habanalabs.h              | 0
> >  drivers/{misc => accel}/habanalabs/common/habanalabs_drv.c          | 0
> >  drivers/{misc => accel}/habanalabs/common/habanalabs_ioctl.c        | 0
> >  drivers/{misc => accel}/habanalabs/common/hw_queue.c                | 0
> >  drivers/{misc => accel}/habanalabs/common/hwmon.c                   | 0
> >  drivers/{misc => accel}/habanalabs/common/irq.c                     | 0
> >  drivers/{misc => accel}/habanalabs/common/memory.c                  | 0
> >  drivers/{misc => accel}/habanalabs/common/memory_mgr.c              | 0
> >  drivers/{misc => accel}/habanalabs/common/mmu/Makefile              | 0
> >  drivers/{misc => accel}/habanalabs/common/mmu/mmu.c                 | 0
> >  drivers/{misc => accel}/habanalabs/common/mmu/mmu_v1.c              | 0
> >  drivers/{misc => accel}/habanalabs/common/mmu/mmu_v2_hr.c           | 0
> >  drivers/{misc => accel}/habanalabs/common/pci/Makefile              | 0
> >  drivers/{misc => accel}/habanalabs/common/pci/pci.c                 | 0
> >  drivers/{misc => accel}/habanalabs/common/security.c                | 0
> >  drivers/{misc => accel}/habanalabs/common/state_dump.c              | 0
> >  drivers/{misc => accel}/habanalabs/common/sysfs.c                   | 0
> >  drivers/{misc => accel}/habanalabs/gaudi/Makefile                   | 0
> >  drivers/{misc => accel}/habanalabs/gaudi/gaudi.c                    | 0
> >  drivers/{misc => accel}/habanalabs/gaudi/gaudiP.h                   | 0
> >  drivers/{misc => accel}/habanalabs/gaudi/gaudi_coresight.c          | 0
> >  drivers/{misc => accel}/habanalabs/gaudi/gaudi_security.c           | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/Makefile                  | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2.c                  | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2P.h                 | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight.c        | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight_regs.h   | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_masks.h            | 0
> >  drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_security.c         | 0
> >  drivers/{misc => accel}/habanalabs/goya/Makefile                    | 0
> >  drivers/{misc => accel}/habanalabs/goya/goya.c                      | 0
> >  drivers/{misc => accel}/habanalabs/goya/goyaP.h                     | 0
> >  drivers/{misc => accel}/habanalabs/goya/goya_coresight.c            | 0
> >  drivers/{misc => accel}/habanalabs/goya/goya_hwmgr.c                | 0
> >  drivers/{misc => accel}/habanalabs/goya/goya_security.c             | 0
> >  drivers/{misc => accel}/habanalabs/include/common/cpucp_if.h        | 0
> >  drivers/{misc => accel}/habanalabs/include/common/hl_boot_if.h      | 0
> >  drivers/{misc => accel}/habanalabs/include/common/qman_if.h         | 0
> >  .../{misc => accel}/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma0_core_masks.h             | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma0_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma1_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma2_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma3_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma4_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma5_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma6_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma7_core_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h             | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h             | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h             | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h    | 0
> >  .../habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h             | 0
> >  .../habanalabs/include/gaudi/asic_reg/gaudi_blocks.h                | 0
> >  .../{misc => accel}/habanalabs/include/gaudi/asic_reg/gaudi_regs.h  | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h              | 0
> >  .../{misc => accel}/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h           | 0
> >  .../habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h      | 0
> >  .../habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h       | 0
> >  .../habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h         | 0
> >  .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h         | 0
> >  .../{misc => accel}/habanalabs/include/gaudi/asic_reg/stlb_regs.h   | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h              | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h                | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h               | 0
> >  .../habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h                | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi.h            | 0
> >  .../{misc => accel}/habanalabs/include/gaudi/gaudi_async_events.h   | 0
> >  .../habanalabs/include/gaudi/gaudi_async_ids_map_extended.h         | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_coresight.h  | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_fw_if.h      | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_masks.h      | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_packets.h    | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_reg_map.h    | 0
> >  .../habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h       | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h     | 0
> >  .../include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h | 0
> >  .../include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h        | 0
> >  .../include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h         | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h     | 0
> >  .../include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h         | 0
> >  .../habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h                | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h       | 0
> >  .../include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h     | 0
> >  .../include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h          | 0
> >  .../gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h   | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h       | 0
> >  .../include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h     | 0
> >  .../gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h        | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h  | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h  | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h    | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h    | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h    | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h    | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h    | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h        | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h | 0
> >  .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h   | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h    | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h        | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h         | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h     | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h      | 0
> >  .../include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h  | 0
> >  .../include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h           | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h           | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h  | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h    | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h   | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h       | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h          | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h         | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h   | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h  | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h   | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h           | 0
> >  .../include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h        | 0
> >  .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h        | 0
> >  .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h | 0
> >  .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h   | 0
> >  .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h   | 0
> >  .../include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h          | 0
> >  .../include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h           | 0
> >  .../include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h    | 0
> >  .../habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h                | 0
> >  .../habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h          | 0
> >  .../habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h             | 0
> >  .../gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h        | 0
> >  .../include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h   | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h         | 0
> >  .../include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h  | 0
> >  .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h   | 0
> >  .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h     | 0
> >  .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h     | 0
> >  .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h  | 0
> >  .../include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h          | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h             | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h            | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h   | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h      | 0
> >  .../include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h       | 0
> >  .../include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h          | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h          | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h             | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h | 0
> >  .../include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h       | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h         | 0
> >  .../habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h             | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h              | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h     | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h      | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h       | 0
> >  .../habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h             | 0
> >  .../{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_masks.h | 0
> >  .../habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h       | 0
> >  .../include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h        | 0
> >  .../habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_regs.h  | 0
> >  .../habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h           | 0
> >  .../habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h            | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2.h          | 0
> >  .../{misc => accel}/habanalabs/include/gaudi2/gaudi2_async_events.h | 0
> >  .../habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h       | 0
> >  .../{misc => accel}/habanalabs/include/gaudi2/gaudi2_coresight.h    | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_fw_if.h    | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_packets.h  | 0
> >  drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_reg_map.h  | 0
> >  .../habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h           | 0
> >  .../habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h            | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/cpu_if_regs.h  | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/cpu_pll_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_0_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_0_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_1_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_2_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_3_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_ch_4_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_macro_masks.h              | 0
> >  .../habanalabs/include/goya/asic_reg/dma_macro_regs.h               | 0
> >  .../habanalabs/include/goya/asic_reg/dma_nrtr_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/dma_nrtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_0_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_0_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_1_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_2_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_3_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/dma_qm_4_regs.h                | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/goya_blocks.h  | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/goya_masks.h   | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/goya_regs.h    | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/ic_pll_regs.h  | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/mc_pll_regs.h  | 0
> >  .../habanalabs/include/goya/asic_reg/mme1_rtr_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/mme1_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme2_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme3_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme4_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme5_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme6_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/mme_cmdq_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/mme_cmdq_regs.h                | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/mme_masks.h    | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_masks.h | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_regs.h  | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_regs.h | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/mmu_masks.h    | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mmu_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/pci_nrtr_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/pci_nrtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/pcie_aux_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/pcie_wrap_regs.h               | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h           | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_etr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h       | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h        | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h            | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h            | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_spi_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h          | 0
> >  .../habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h          | 0
> >  .../habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h          | 0
> >  .../habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h          | 0
> >  .../habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h          | 0
> >  .../habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h          | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/stlb_masks.h   | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/stlb_regs.h    | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h               | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h              | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h               | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h           | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h            | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h              | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h               | 0
> >  .../habanalabs/include/goya/asic_reg/tpc0_qm_masks.h                | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h | 0
> >  .../habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h                | 0
> >  .../habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h               | 0
> >  .../habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h               | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h | 0
> >  .../{misc => accel}/habanalabs/include/goya/asic_reg/tpc_pll_regs.h | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya.h              | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya_async_events.h | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya_coresight.h    | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya_fw_if.h        | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya_packets.h      | 0
> >  drivers/{misc => accel}/habanalabs/include/goya/goya_reg_map.h      | 0
> >  drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_general.h  | 0
> >  drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_0.h     | 0
> >  drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_1.h     | 0
> >  drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v2_0.h     | 0
> >  drivers/{misc => accel}/habanalabs/include/hw_ip/pci/pci_general.h  | 0
> >  drivers/misc/Kconfig                                                | 1 -
> >  drivers/misc/Makefile                                               | 1 -
> >  430 files changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ce47d05693d9..0fb59aa03856 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9043,11 +9043,13 @@ F:      block/partitions/efi.*
> >
> >  HABANALABS PCI DRIVER
> >  M:     Oded Gabbay <ogabbay@kernel.org>
> > +L:     dri-devel@lists.freedesktop.org
> >  S:     Supported
> > +C:     irc://irc.oftc.net/dri-devel
> >  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
> >  F:     Documentation/ABI/testing/debugfs-driver-habanalabs
> >  F:     Documentation/ABI/testing/sysfs-driver-habanalabs
> > -F:     drivers/misc/habanalabs/
> > +F:     drivers/accel/habanalabs/
> >  F:     include/trace/events/habanalabs.h
> >  F:     include/uapi/drm/habanalabs_accel.h
> >
> > diff --git a/drivers/Makefile b/drivers/Makefile
> > index bdf1c66141c9..9ea6eb3b5d7b 100644
> > --- a/drivers/Makefile
> > +++ b/drivers/Makefile
> > @@ -189,3 +189,4 @@ obj-$(CONFIG_COUNTER)               += counter/
> >  obj-$(CONFIG_MOST)             += most/
> >  obj-$(CONFIG_PECI)             += peci/
> >  obj-$(CONFIG_HTE)              += hte/
> > +obj-$(CONFIG_DRM_ACCEL)                += accel/
> > diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> > index c9ce849b2984..a5989b55178a 100644
> > --- a/drivers/accel/Kconfig
> > +++ b/drivers/accel/Kconfig
> > @@ -22,3 +22,5 @@ menuconfig DRM_ACCEL
> >           major number than GPUs, and will be exposed to user-space using
> >           different device files, called accel/accel* (in /dev, sysfs
> >           and debugfs).
> > +
> > +source "drivers/accel/habanalabs/Kconfig"
> > diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> > new file mode 100644
> > index 000000000000..4df38885d6c6
> > --- /dev/null
> > +++ b/drivers/accel/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-y  += habanalabs/
> > \ No newline at end of file
> > diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/accel/habanalabs/Kconfig
> > similarity index 86%
> > rename from drivers/misc/habanalabs/Kconfig
> > rename to drivers/accel/habanalabs/Kconfig
> > index 585235531b9b..be85336107f9 100644
> > --- a/drivers/misc/habanalabs/Kconfig
> > +++ b/drivers/accel/habanalabs/Kconfig
> > @@ -3,8 +3,10 @@
> >  # HabanaLabs AI accelerators driver
> >  #
> >
> > -config HABANA_AI
> > -       tristate "HabanaAI accelerators (habanalabs)"
> > +config DRM_ACCEL_HABANALABS
> > +       tristate "HabanaLabs AI accelerators"
> > +       depends on DRM_ACCEL
> > +       depends on X86_64
> >         depends on PCI && HAS_IOMEM
> >         select GENERIC_ALLOCATOR
> >         select HWMON
> > diff --git a/drivers/misc/habanalabs/Makefile b/drivers/accel/habanalabs/Makefile
> > similarity index 88%
> > rename from drivers/misc/habanalabs/Makefile
> > rename to drivers/accel/habanalabs/Makefile
> > index a48a9e0969ed..98510cdd5066 100644
> > --- a/drivers/misc/habanalabs/Makefile
> > +++ b/drivers/accel/habanalabs/Makefile
> > @@ -3,7 +3,7 @@
> >  # Makefile for HabanaLabs AI accelerators driver
> >  #
> >
> > -obj-$(CONFIG_HABANA_AI) := habanalabs.o
> > +obj-$(CONFIG_DRM_ACCEL_HABANALABS) := habanalabs.o
> >
> >  include $(src)/common/Makefile
> >  habanalabs-y += $(HL_COMMON_FILES)
> > diff --git a/drivers/misc/habanalabs/common/Makefile b/drivers/accel/habanalabs/common/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/Makefile
> > rename to drivers/accel/habanalabs/common/Makefile
> > diff --git a/drivers/misc/habanalabs/common/asid.c b/drivers/accel/habanalabs/common/asid.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/asid.c
> > rename to drivers/accel/habanalabs/common/asid.c
> > diff --git a/drivers/misc/habanalabs/common/command_buffer.c b/drivers/accel/habanalabs/common/command_buffer.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/command_buffer.c
> > rename to drivers/accel/habanalabs/common/command_buffer.c
> > diff --git a/drivers/misc/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/command_submission.c
> > rename to drivers/accel/habanalabs/common/command_submission.c
> > diff --git a/drivers/misc/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/context.c
> > rename to drivers/accel/habanalabs/common/context.c
> > diff --git a/drivers/misc/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/debugfs.c
> > rename to drivers/accel/habanalabs/common/debugfs.c
> > diff --git a/drivers/misc/habanalabs/common/decoder.c b/drivers/accel/habanalabs/common/decoder.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/decoder.c
> > rename to drivers/accel/habanalabs/common/decoder.c
> > diff --git a/drivers/misc/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/device.c
> > rename to drivers/accel/habanalabs/common/device.c
> > diff --git a/drivers/misc/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/firmware_if.c
> > rename to drivers/accel/habanalabs/common/firmware_if.c
> > diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/habanalabs.h
> > rename to drivers/accel/habanalabs/common/habanalabs.h
> > diff --git a/drivers/misc/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/habanalabs_drv.c
> > rename to drivers/accel/habanalabs/common/habanalabs_drv.c
> > diff --git a/drivers/misc/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/habanalabs_ioctl.c
> > rename to drivers/accel/habanalabs/common/habanalabs_ioctl.c
> > diff --git a/drivers/misc/habanalabs/common/hw_queue.c b/drivers/accel/habanalabs/common/hw_queue.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/hw_queue.c
> > rename to drivers/accel/habanalabs/common/hw_queue.c
> > diff --git a/drivers/misc/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/hwmon.c
> > rename to drivers/accel/habanalabs/common/hwmon.c
> > diff --git a/drivers/misc/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/irq.c
> > rename to drivers/accel/habanalabs/common/irq.c
> > diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/memory.c
> > rename to drivers/accel/habanalabs/common/memory.c
> > diff --git a/drivers/misc/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/memory_mgr.c
> > rename to drivers/accel/habanalabs/common/memory_mgr.c
> > diff --git a/drivers/misc/habanalabs/common/mmu/Makefile b/drivers/accel/habanalabs/common/mmu/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/mmu/Makefile
> > rename to drivers/accel/habanalabs/common/mmu/Makefile
> > diff --git a/drivers/misc/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/mmu/mmu.c
> > rename to drivers/accel/habanalabs/common/mmu/mmu.c
> > diff --git a/drivers/misc/habanalabs/common/mmu/mmu_v1.c b/drivers/accel/habanalabs/common/mmu/mmu_v1.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/mmu/mmu_v1.c
> > rename to drivers/accel/habanalabs/common/mmu/mmu_v1.c
> > diff --git a/drivers/misc/habanalabs/common/mmu/mmu_v2_hr.c b/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/mmu/mmu_v2_hr.c
> > rename to drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
> > diff --git a/drivers/misc/habanalabs/common/pci/Makefile b/drivers/accel/habanalabs/common/pci/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/pci/Makefile
> > rename to drivers/accel/habanalabs/common/pci/Makefile
> > diff --git a/drivers/misc/habanalabs/common/pci/pci.c b/drivers/accel/habanalabs/common/pci/pci.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/pci/pci.c
> > rename to drivers/accel/habanalabs/common/pci/pci.c
> > diff --git a/drivers/misc/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/security.c
> > rename to drivers/accel/habanalabs/common/security.c
> > diff --git a/drivers/misc/habanalabs/common/state_dump.c b/drivers/accel/habanalabs/common/state_dump.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/state_dump.c
> > rename to drivers/accel/habanalabs/common/state_dump.c
> > diff --git a/drivers/misc/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/common/sysfs.c
> > rename to drivers/accel/habanalabs/common/sysfs.c
> > diff --git a/drivers/misc/habanalabs/gaudi/Makefile b/drivers/accel/habanalabs/gaudi/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi/Makefile
> > rename to drivers/accel/habanalabs/gaudi/Makefile
> > diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi/gaudi.c
> > rename to drivers/accel/habanalabs/gaudi/gaudi.c
> > diff --git a/drivers/misc/habanalabs/gaudi/gaudiP.h b/drivers/accel/habanalabs/gaudi/gaudiP.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi/gaudiP.h
> > rename to drivers/accel/habanalabs/gaudi/gaudiP.h
> > diff --git a/drivers/misc/habanalabs/gaudi/gaudi_coresight.c b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi/gaudi_coresight.c
> > rename to drivers/accel/habanalabs/gaudi/gaudi_coresight.c
> > diff --git a/drivers/misc/habanalabs/gaudi/gaudi_security.c b/drivers/accel/habanalabs/gaudi/gaudi_security.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi/gaudi_security.c
> > rename to drivers/accel/habanalabs/gaudi/gaudi_security.c
> > diff --git a/drivers/misc/habanalabs/gaudi2/Makefile b/drivers/accel/habanalabs/gaudi2/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/Makefile
> > rename to drivers/accel/habanalabs/gaudi2/Makefile
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2.c
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2.c
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2P.h
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2P.h
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight_regs.h b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2_coresight_regs.h
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2_coresight_regs.h
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_masks.h b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2_masks.h
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
> > diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/gaudi2/gaudi2_security.c
> > rename to drivers/accel/habanalabs/gaudi2/gaudi2_security.c
> > diff --git a/drivers/misc/habanalabs/goya/Makefile b/drivers/accel/habanalabs/goya/Makefile
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/Makefile
> > rename to drivers/accel/habanalabs/goya/Makefile
> > diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/goya.c
> > rename to drivers/accel/habanalabs/goya/goya.c
> > diff --git a/drivers/misc/habanalabs/goya/goyaP.h b/drivers/accel/habanalabs/goya/goyaP.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/goyaP.h
> > rename to drivers/accel/habanalabs/goya/goyaP.h
> > diff --git a/drivers/misc/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/goya_coresight.c
> > rename to drivers/accel/habanalabs/goya/goya_coresight.c
> > diff --git a/drivers/misc/habanalabs/goya/goya_hwmgr.c b/drivers/accel/habanalabs/goya/goya_hwmgr.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/goya_hwmgr.c
> > rename to drivers/accel/habanalabs/goya/goya_hwmgr.c
> > diff --git a/drivers/misc/habanalabs/goya/goya_security.c b/drivers/accel/habanalabs/goya/goya_security.c
> > similarity index 100%
> > rename from drivers/misc/habanalabs/goya/goya_security.c
> > rename to drivers/accel/habanalabs/goya/goya_security.c
> > diff --git a/drivers/misc/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/common/cpucp_if.h
> > rename to drivers/accel/habanalabs/include/common/cpucp_if.h
> > diff --git a/drivers/misc/habanalabs/include/common/hl_boot_if.h b/drivers/accel/habanalabs/include/common/hl_boot_if.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/common/hl_boot_if.h
> > rename to drivers/accel/habanalabs/include/common/hl_boot_if.h
> > diff --git a/drivers/misc/habanalabs/include/common/qman_if.h b/drivers/accel/habanalabs/include/common/qman_if.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/common/qman_if.h
> > rename to drivers/accel/habanalabs/include/common/qman_if.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
> > similarity index 100%
> > rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
> > rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
> > diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h
> > similarity index 100%
> > </cut>
>


-- 
Thanks,
~Nick Desaulniers

Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF046B5
	for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 15:06:01 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id n7so17341861wrx.5
        for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 07:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BkSUqZWMeZKVzKhiXO+ME3iOU+7nVh8EOP2pS4JSDHk=;
        b=pm5Kt+1xFUjO+/tA1En5NnW+iB1X6cb+z6ws/fJ6yp+APi5QUPNO4lLdqZqYDvnAWF
         vmC79mW7hGuCNWaYgGrgh1ZiIBoN8f1k4dKsXgBDPvlP164J0sJ71+7kmsvY0CdLngdy
         r8pisUG+oEt3fi1mwBIuCKkR/KX5wHcjaaLt9lLHtrzXyYM9dub9gTKwAD76luR+gzpA
         fRwk4Qfmr7qKD8yb6/fHCT+h8ne5LV0NVrTwJ6xyIto8/5FqfOqdeKzy65sPBzM4HIRP
         yp1jj5aSSjcKmNdviyVZzT4ByG48E3Yj0I9eIUBsjoZu/50zgE3Mnniiichq+vo7eFrd
         /1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkSUqZWMeZKVzKhiXO+ME3iOU+7nVh8EOP2pS4JSDHk=;
        b=VJ+Fe4rYZjE2YoEc7i5e7gvsLFk4Qhkt6aUx87rGl/HR2bYgHFqurRqqpMRfg9jFiE
         d0GbIa9MFu8/DuLH4gLWplg4sn/PPQFKp717crltAA0HsagOOwy8Ym7zLrfycNmzwqMb
         r+KFx4fotWYiJU9JK17FNIn2dpJ4h9IqyF9Sidat+m4InlzuoC5QiGfgFrlzyX0TdV8y
         HgN2j27c6p0vlTf3BOtr0/TSkWGTRrpcdMlfw+iaKCycurVT8pH/I98aftXypIUFd8Z2
         NLoDTAhgMr2Fm7gpN6J46hAjv/L9vTj8MQ7k+JTi/CiIwzJcLDaQFaq2lruVStsVQ79m
         yNYg==
X-Gm-Message-State: AO0yUKWJ1npen6xXoU9148JhJ4PaAxCFYS1rcs82ZSUdWyxsAJOd6JID
	IOcm9POnKOWLJhzcCAiPx78=
X-Google-Smtp-Source: AK7set/wQ+37CgFbge5PWcKRfAPog2dI1ab9mJdFRTdZzk13Uw1WQ8F4y3kqvHrOHGQ3ixy37HIFhw==
X-Received: by 2002:adf:e189:0:b0:2bf:ae19:d8dd with SMTP id az9-20020adfe189000000b002bfae19d8ddmr6897863wrb.37.1674659159649;
        Wed, 25 Jan 2023 07:05:59 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d6842000000b002be5401ef5fsm4704041wrw.39.2023.01.25.07.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:05:59 -0800 (PST)
Message-ID: <879c35aa-35a3-b6dd-21f0-5355bcedbb55@gmail.com>
Date: Wed, 25 Jan 2023 16:05:57 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v30 00/11] Add MediaTek SoC(vdosys1) support for mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
 singo.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Whole series applied, thanks!

On 13/01/2023 11:44, Nancy.Lin wrote:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add mmsys and mutex modules support by the patches below:
> 
> Changes in v30:
> - rebase to next-20230113
> - fix reviewer comment in v29
>    - fix mmysy binding doc for vdosys1
> 
> Changes in v29:
> - rebase to next-20221226
> - fix reviewer comment in v28
>    - fix mmsys binding doc for vdosys1
> 
> Changes in v28:
> - rebase to next-20221107
> - fix reviewer comment in v27
>    - remove change id
>    - fix mmsys config api typo
> 
> Changes in v27:
> - rebase to next-20221102
> - change mmsys compatible for mt8195 vdosys1
>    - base on jason's series[ref 1]
> - fix reviewer comment
>    - only register mmsys reset controller if num_resets > 0
> 
> Changes in v26:
> - fix reviewer comment
>    - set mmsys num_resets to 32 for 8192
> - rebase to next-20220819
> 
> Changes in v25:
> - fix reviewer comment
>    - refine mtk_mmsys_reset_update func
> - rebase to next-20220708
> 
> Changes in v24:
> - fix reviewer comment
>    - refine mtk_mmsys_reset_update func
> - rebase to next-20220622
> 
> Changes in v23:
> - separate[7] mmsys/mutex and drm patches into two series
> 
> Changes in v22:
> - rebase to next-20220525
> - rebase to vdosys0 series v22
> - separate dts to a new patch
> 
> Changes in v21:
> - fix reviewer comment
>    - fix rdma and ethdr binding doc and dts
> 
> Changes in v20:
> - fix reviewer comment
>    - update mmsys update bit api name
>    - add mtk_mmsys_update_bits error message if lose gce property
>    - list all mt8195 vdosys1 reset bits
> 
> Changes in v19:
> - fix reviewer comment
>    - separate mt8195 mmsys component to a new patch
>    - separate mt8195 vdo0 and vdo1 routing table
>    - separate mmsys_write_reg api to a new patch and simplify write reg code
>    - separate mmsys 64 bit reset to a new patch
>    - separate mtk-mutex dp_intf1 component to a new patch
> 
> Changes in v18:
> - fix reviewer comment
>    - fix rdma binding doc
>    - fix ethdr binding doc
>    - refine mmsys config cmdq support
>    - refine merge reset control flow, get reset control in probe function
>    - add ethdr reset control error handling and remove dbg log
> - rebase to vdosys0 series v20 (ref [5])
> 
> Changes in v17:
> - fix reviewer comment in v16
>    - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
>    - separate mmsys config API
>    - move mdp_rdma binding yaml
> - fix ovl adaptor pm runtime get sync timing issue
> - rebase to vdosys0 series v19 (ref [5])
> - rebase to [7] for modify vblank register change
> 
> Changes in v16:
> - fix reviewer comment in v 15
>    - fix mtk_drm_ddp_comp.c alignment
>    - fix vdosys0 mmsys num before adding vdosys1 patch
> 
> Changes in v15:
> - fix ethdr uppercase hex number in dts
> 
> Changes in v14:
> - remove MTK_MMSYS 64 bit dependency
> - add ethdr.yaml back and fix dt_schema check fail
> 
> Resend v13
> - add related maintainer in maillist
> 
> Changes in v13:
> - fix reviewer comment in v12
>    - fix rdma dt-binding format
>    - fix dts node naming
> - fix 32 bit build error
>    - modify 64bit dependency for mtk-mmsys
> - rebase to vdosys0 series v16. (ref [5])
> 
> Changes in v12:
> - fix reviewer comment in v11
>    - modify mbox index
>    - refine dma dev for ovl_adaptor sub driver
> 
> Changes in v11:
> - remove ethdr vblank spin lock
> - refine ovl_adaptor print message
> 
> Changes in v10:
> - refine ethdr reset control using devm_reset_control_array_get_optional_exclusive
> - fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue
> 
> Changes in v9:
> - rebase on kernel-5.16-rc1
> - rebase on vdosys0 series v13. (ref [5])
> - fix ovl_adaptor sub driver is brought up unintentionally
> - fix clang build test fail- duplicate ethdr/mdp_rdma init_module/cleanup_module symbol issue
> 
> Changes in v8:
> - separate merge async reset to new patch.
> - separate drm ovl_adaptor sub driver to new patch.
> - fix reviewer comment in v7.
> 
> Changes in v7:
> - rebase on vdosys0 series v12 (ref[5])
> - add dma description in ethdr binding document.
> - refine vdosys1 bit definition of mmsys routing table.
> - separate merge modification into 3 pathces.
> - separate mutex modification into 2 patches.
> - add plane color coding for mdp_rdma csc.
> - move mdp_rdma pm control to ovl_adaptor.
> - fix reviewer comment in v6.
> 
> Changes in v6:
> - rebase on kernel-5.15-rc1.
> - change mbox label to gce0 for dts node of vdosys1.
> - modify mmsys reset num for mt8195.
> - rebase on vdosys0 series v10. (ref [5])
> - use drm to bring up ovl_adaptor driver.
> - move drm iommu/mutex check from kms init to drm bind.
> - modify rdma binding doc location. (Documentation/devicetree/bindings/arm/)
> - modify for reviewer's comment in v5.
> 
> Changes in v5:
> - add mmsys reset controller reference.
> 
> Changes in v4:
> - use merge common driver for merge1~4.
> - refine ovl_adaptor rdma driver.
> - use ovl_adaptor ddp_comp function instead of ethdr.
> - modify for reviewer's comment in v3.
> 
> Changes in v3:
> - modify for reviewer's comment in v2.
> - add vdosys1 2 pixels align limit.
> - add mixer odd offset support.
> 
> Changes in v2:
> - Merge PSEUDO_OVL and ETHDR into one DRM component.
> - Add mmsys config API for vdosys1 hardware setting.
> - Add mmsys reset control using linux reset framework.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> 
> This series are based on the following patch:
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      20221126101220.18179-1-jason-jh.lin@mediatek.com
> 
> Nancy.Lin (11):
>    dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible for MT8195
>    dt-bindings: reset: mt8195: add vdosys1 reset control bit
>    soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
>    soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
>    soc: mediatek: refine code to use mtk_mmsys_update_bits API
>    soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
>    soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
>      vdosys1
>    soc: mediatek: mmsys: add mmsys for support 64 reset bits
>    soc: mediatek: mmsys: add reset control for MT8195 vdosys1
>    soc: mediatek: add mtk-mutex component - dp_intf1
>    soc: mediatek: add mtk-mutex support for mt8195 vdosys1
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
>   drivers/soc/mediatek/mt8195-mmsys.h           | 146 +++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c              | 149 +++++++++++++-----
>   drivers/soc/mediatek/mtk-mmsys.h              |   1 +
>   drivers/soc/mediatek/mtk-mutex.c              |  37 +++++
>   include/dt-bindings/reset/mt8195-resets.h     |  45 ++++++
>   include/linux/soc/mediatek/mtk-mmsys.h        |  25 +++
>   7 files changed, 366 insertions(+), 38 deletions(-)
> 

Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5837E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 01:50:44 +0000 (UTC)
X-UUID: 8ec07c6be33d424b929b1cb900b4b319-20220311
X-UUID: 8ec07c6be33d424b929b1cb900b4b319-20220311
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 759593367; Fri, 11 Mar 2022 09:50:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 09:50:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 09:50:37 +0800
Message-ID: <b9c16bac0268fd8646b3e359f07303cd1c7d9041.camel@mediatek.com>
Subject: Re: [PATCH v14 22/22] arm64: dts: mt8195: add display node for
 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp Zabel"
	<p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<srv_heupstream@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 11 Mar 2022 09:50:37 +0800
In-Reply-To: <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
	 <20220310035515.16881-23-nancy.lin@mediatek.com>
	 <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi Angelo,

Thanks for the review.

On Thu, 2022-03-10 at 11:53 +0100, AngeloGioacchino Del Regno wrote:
> Il 10/03/22 04:55, Nancy.Lin ha scritto:
> > Add display node for vdosys1.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223
> > +++++++++++++++++++++++
> >   1 file changed, 223 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index dbca699bba05..e650ec759235 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 
> 
> ..snip..
> 
> > +
> > +		ethdr0: ethdr@1c114000 {
> > +			compatible = "mediatek,mt8195-disp-ethdr";
> > +			reg = <0 0x1c114000 0 0x1000>,
> > +			      <0 0x1c115000 0 0x1000>,
> > +			      <0 0x1c117000 0 0x1000>,
> > +			      <0 0x1c119000 0 0x1000>,
> > +			      <0 0x1c11A000 0 0x1000>,
> > +			      <0 0x1c11B000 0 0x1000>,
> > +			      <0 0x1c11C000 0 0x1000>;
> 
> Hello Nancy,
> looks like you partially forgot to use lower-case hex here...
> 
> 0x1c11a000 0x1c11b000 0x1c11c000
> 
> > +			reg-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +				    "vdo_be", "adl_ds";
> > +			mediatek,gce-client-reg = <&gce0
> > SUBSYS_1c11XXXX 0x4000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x5000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x7000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0x9000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xA000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xB000 0x1000>,
> > +						  <&gce0
> > SUBSYS_1c11XXXX 0xC000 0x1000>;
> 
> ...and here too: 0xa000 0xb000 0xc000
> 
> Please fix that, after which, you can add my
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

OK, I will fix it. Thank you.

Regards,
Nancy
> > +			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> > +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> > +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> > +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> > +				 <&vdosys1 CLK_VDO1_26M_SLOW>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> > +				 <&topckgen CLK_TOP_ETHDR>;
> > +			clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +				      "vdo_be", "adl_ds",
> > "vdo_fe0_async", "vdo_fe1_async",
> > +				      "gfx_fe0_async",
> > "gfx_fe1_async","vdo_be_async",
> > +				      "ethdr_top";
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS1>;
> > +			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> > +				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> > +			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH
> > 0>; /* disp mixer */
> > +			resets = <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> > +				 <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> > +		};
> > +
> >   	};
> >   };
> 
> 


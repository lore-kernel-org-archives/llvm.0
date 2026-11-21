Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303616;
	b=BzKMa1m0GC2JBfc2yLNu51mDkrrGDCZnXuOC/rnN+d1Lkz52Cvhd6YyzSl9F2K8/KHD4
	 bsns8Ye6OZ+8xYF9x7ZXTWGmofm9AtkMOdYLSC9v0Rkx7nyoIro+k8+j8sG/+IPPyqRSx
	 6/JvWJruZO/cRh9GqOiUbL3gph+1getdkjXGEBNOXVDXJ/SESzVLNz6heMr0X1WdE3CFR
	 Yt8UzTE4vllAyfINO0o9/AIwfeNunZi672LBkbNKpADQgPn2tdsshWBFbfrwK479jZGSa
	 7pJxASmY5APM7lR/csBU53zVd1bZh8NyN6wvHLa4pnMWoD6n64RPNtMMY4YlL5FW2Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303616;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YFsCL2i1V6NyqpaP2q7D3KQnFi8V3ctySjIQMW+KeOM=;
	b=CtkFXhM5fUYDsAl+dNZHrJ4K4Ax9a7MeffpMpqZsx+btrq+Jc/kKlNqx2XDL+OUe8Hdh
	 2OzXL7l9og6ABg45prw/S5tyI4dwYOPZvmwA1XahencuUc1KFLL0aFS0Ck9ltIMYjnB+U
	 6Qk5SM5F63Gwb6TcTy7nnXr68/hbBO6SKdFoHrdPCpuFyH8zL5H68eyBAtC7urvdCCQPv
	 zpUdDaXCbUqvbIE8whjCu+iULRRZ5rBaSMWu3dmjvYb+SIst1Yp9fcBJOKFBx1IQdNK13
	 1ryny2OycnfFdZE1V2pk66+Zv4+dw4I+biuO5WdghWj6VEDAXK5M2HldvxBsswTka7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2eFaUs4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F230606A684;
	Sat, 21 Nov 2026 23:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2eFaUs4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992C81F0089F;
	Sat, 21 Nov 2026 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303616;
	bh=YFsCL2i1V6NyqpaP2q7D3KQnFi8V3ctySjIQMW+KeOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g2eFaUs4bdYjMV1wgATf2eobd8R8mA2xt3gbCTtYNYWLp/n29YUvLmG1fEiBnt2Qh
	 eZNYnTVHe5qQ/e8RyiP7ebE7f5VZh+4DPu8oJU1CPanyArLb4ow99LSm6qlQFN7gyj
	 l+/WmLMpL4RuYvRt0e+NF+SvWenoLuk/iJ/9hBU8dIf4ryRpH/Hjwv+V8IB2UXO+2b
	 2xh8Y11P4I/1VBEJSjNaMNqGMGxz2qoet7QdDQ/1qDJYdcxFlThq8Mumau4nrEOIsa
	 gVzNcbTKK/zSX8ffyz7yGBftoo3sM5o0mBzERa1qu4ASJlkFAKD+N1zGlx5mNxvapT
	 3LOxSYnUb2NTw==
From: Jakub Kicinski <kuba@kernel.org>
To: ansuelsmth@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	p.zabel@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH net-next v22 13/15] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Sat, 21 Nov 2026 15:26:54 -0800
Message-ID: <20261121232654.1365615-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-14-ansuelsmth@gmail.com>
References: <20261117123956.11981-14-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: net: pcs: Document support for Airoha Ethernet PCS

This adds a DT binding for the Airoha AN7581 PCS blocks on the Ethernet,
PON, PCIe and USB serdes ports. It follows the new PCS provider model,
where consumers reference the PCS through #pcs-cells.

> diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> new file mode 100644
> index 0000000000000..9c1d116c1b016
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

[ ... ]

> +description:
> +  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
> +  the various Serdes port supporting different Media Independent Interface
> +  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

[Severity: Low]
This isn't a bug, but should 10BASE-R be 10GBASE-R here? The commit
message has the same typo:

  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

The driver later in the series sets PHY_INTERFACE_MODE_10GBASER in
airoha_pcs_probe().

[ ... ]

> +  airoha,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the SCU node required to configure
> +      the serdes line to the correct interface mode.

[Severity: Medium]
Is a bare SCU phandle the right interface for selecting the serdes mode?

The SCU already offers this as a generic PHY provider. In
clock/airoha,en7523-scu.yaml:

  '#phy-cells':
    description:
      The first cell indicates the serdes phy number, see [2] for the
      available serdes port.
    const: 1

In drivers/clk/clk-en7523.c, en7581_serdes_phy_set_mode() handles
PHY_MODE_ETHERNET. It writes the REG_NP_SCU_SSTR XSI0/XSI1 select bits
while holding priv->lock.

The PCS driver later in the series writes the same bits through this
phandle, using its own regmap, in airoha_pcs_setup_scu_pcie():

    regmap_update_bits(priv->scu, AIROHA_SCU_SSTR,
                       AIROHA_SCU_PCIE_XSI0_SEL,
                       xsi_sel);

Doesn't that leave two unsynchronized read-modify-write paths on the
same SCU register?

Probing looks like a problem too. airoha_pcs_probe() does:

    priv->scu = syscon_regmap_lookup_by_phandle(dev->of_node,
                                                "airoha,scu");

The scuclk node in the example has only the compatible
"airoha,en7581-scu". It isn't a "syscon", and nothing registers it with
of_syscon_register_regmap().

Won't the lookup return -EPROBE_DEFER on every attempt? If so, the
eth/pon/pcie PCS never probes when the DT follows the example.

The phandle also has no cells. That means the dual-lane pcie node can't
say which SCU serdes port each PCS instance drives.

Could the binding use something like this instead of airoha,scu plus
phys: false?

    phys = <&scuclk AIROHA_SCU_SERDES_PCIE1>,
           <&scuclk AIROHA_SCU_SERDES_PCIE2>;

The usb variant already uses phys.

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: airoha,an7581-pcs-pcie
> +
> +    then:
> +      properties:
> +        reg:

[ ... ]

> +        phys: false
> +
> +        "#pcs-cells":
> +          const: 1

[Severity: Medium]
With #pcs-cells set to 1, a MAC that uses one of the PCIe serdes PCS
instances has to write pcs-handle = <&pcs N>. Will the consumer schema
accept that?

ethernet-controller.yaml still has:

  pcs-handle:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      maxItems: 1

That allows only the phandle in each entry. airoha,en7581-eth.yaml
references ethernet-controller.yaml# for its ethernet@N subnodes. A GMAC
node with pcs-handle = <&pcs_pcie 0> would then fail dtbs_check.

At runtime, fwnode_parse_pcsspec() in drivers/net/pcs/pcs.c parses the
"#pcs-cells" argument. airoha_pcs_xlate() rejects a PCIe specifier when
nargs != 1.

No patch in the series changes ethernet-controller.yaml. Its pcs-handle
description also still refers to a PCS PHY device on an MDIO bus.

[ ... ]

> +      required:
> +        - phys
> +
> +additionalProperties: false

[Severity: Medium]
Should resets and reset-names be documented here? The driver later in
the series requests them in airoha_pcs_probe():

    priv->rsts[0].id = "mac";
    priv->rsts[1].id = "phy";
    ret = devm_reset_control_bulk_get_optional_exclusive(dev,
                                    ARRAY_SIZE(priv->rsts),
                                    priv->rsts);

airoha_pcs_setup_scu() then asserts and deasserts these resets on every
interface setup.

The SCU reset controller has matching lines in
include/dt-bindings/reset/airoha,en7581-reset.h. Examples are
EN7581_XSI_PHY_RST, EN7581_XPON_PHY_RST and EN7581_XPON_MAC_RST.

Because of additionalProperties: false, a DT that provides these resets
fails validation. A DT that passes validation has no resets, so the reset
sequence in airoha_pcs_setup_scu() does nothing.

Wouldn't the PCS then stay in whatever state the bootloader or the
previous interface mode left it in?

[ ... ]

> +    pcs@1fa04000 {
> +      compatible = "airoha,an7581-pcs-pcie";
> +      reg = <0x1fa04000 0x1000>,

[ ... ]

> +            <0x1fa5a000 0x1000>,
> +            <0x1fa5b000 0x1000>,
> +            <0x1fa5c000 0x1000>;

[Severity: Medium]
Do these ranges overlap the existing PCIe PHY? In
arch/arm64/boot/dts/airoha/en7581.dtsi, the pciephy: phy@1fa5a000 node
is enabled and claims the same blocks:

    reg = <0x0 0x1fa5a000 0x0 0xfff>,
          <0x0 0x1fa5b000 0x0 0xfff>,
          <0x0 0x1fa5c000 0x0 0xfff>, ...
    reg-names = "csr-2l", "pma0", "pma1", ...

airoha_pcie_phy_probe() and airoha_pcs_init_named_regmap() both map these
ranges with devm_platform_ioremap_resource_byname(), which requests the
memory region.

Won't the driver that probes second fail with -EBUSY?

That would also rule out mixed setups, such as PCIe on one lane and
Ethernet on the other, because both need the shared csr-2l/pma blocks.

This variant also sets phys: false. The PCS therefore can't hand the
analog/PMA side to the PHY that owns it, the way the usb variant does.

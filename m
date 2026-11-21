Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303618;
	b=5bw+/zukIZjuCUkywbbBznYoyMqM4uoaEHZ1ALP911dciKV7trSK4Cw7lYvpBs3mg4pR
	 6YgQc4kIs+OG/iG5YlJUwY6Cxh45SjZlUaGzz+qLiBHdrVN8zI9nrpkCxgzZLz5/NsvWn
	 ybitgE0vaooPsFtaz7FOB9GY1FjQFevoDM436pXvtmwX6oMtJt8brdeCwKqwNbHdEImEB
	 Lcww0C0awFQsUTMktgOnru6nh2FCeIDp6U8RHIDZa6VhflNzqH7nVkvf3JWHBksUnN1Jo
	 aa21OCvnN1fd2COLBhurFvz+Nd7GNSFag3U5PIzfHzY1gIRlcwSDbD4CjHWwmpbGARA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303618;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uNHo+Sfo4SO6w4MKR8YizO7/Dz3BQ3/Jvkiq3N5ai4Y=;
	b=bJ1HL2zsn26AYDRXTiOMJWYOe3KCs7d4BXtXxY2RCH0iOkFIrNvl2WP8FEa9FyypGz2W
	 AAg869JFN0sBQspLhQejUr5b2ct4sBDhsxXlWovmvmxpnqOxcOIL9Jm8+1zOHCK5EBi56
	 GsgTdRnwg7iZnNfnyW3WQsVW75ZLQsfsEz0ciaqh/FcpKwjgghTTIM+DkoQnbx0TD/FTt
	 Oq5wWp75UnLqjhngogL9V9iHNx4UEC9gZUV+Xm60but1i3caqGuD0xaqnoq45Ux7EZb4i
	 p2CjzENmYA3DbZMr7ou25bOzwj/fheCI8rH4eS10tzsO+GhhA0EfAEvNghR+KoxdNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpBjouCj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB11606A6A3;
	Sat, 21 Nov 2026 23:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpBjouCj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638161F000E6;
	Sat, 21 Nov 2026 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303618;
	bh=uNHo+Sfo4SO6w4MKR8YizO7/Dz3BQ3/Jvkiq3N5ai4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VpBjouCjqQQeI8P4RhYDWkheQLduY2KtRgjsuneT/skyQuzN+Cm9NkbngYx/vyJiM
	 Dbef+S20RA8XkAFHAsU9ksaA8j/sCG5zW85U1NFq0MWh8X97oL1TsaCv1iFTt+RQVo
	 lsPCPanYr0ZSGw8muAC/4zCt20iLBmOl1TGD/vJC+p05bYANijE+GKcgmCUxPXetrS
	 xsjcjlkhy44JYXELUhjjES+3aWYs0MdolvWpAwqxSTl9oXmqBngsHCqd8iBT2cb9BC
	 dq7nXqV95PUR8YrBkhhv5rxUTCg7Yk94OLRfVMYqyE/V9qbq0LTj383Rl1/CDZYzL6
	 QhjMB35gwuJDA==
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
Subject: Re: [PATCH net-next v22 15/15] net: airoha: add phylink support
Date: Sat, 21 Nov 2026 15:26:56 -0800
Message-ID: <20261121232656.1365664-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-16-ansuelsmth@gmail.com>
References: <20261117123956.11981-16-ansuelsmth@gmail.com>
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
net: airoha: add phylink support

This adds phylink support for each GDM port. GDM1 is limited to the
internal interface mode, and GDM2/3/4 use a PCS referenced through the
pcs-handle property. The ethtool link_ksettings ops now go through
phylink, and GDM4 TX/RX fragment sizes are set on link up.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 044ad0302ef35..e41dfad58b258 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -3752,6 +3790,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
>  	return false;
>  }
>  
> +/* Nothing to do in MAC, everything is handled in PCS */
> +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
> +						  phylink_config);
> +	struct airoha_gdm_port *port = dev->port;
> +	struct airoha_eth *eth = dev->eth;
> +	u32 frag_size_tx, frag_size_rx;
> +
> +	/* TX/RX frag is configured only for GDM4 */
> +	if (port->id != AIROHA_GDM4_IDX)
> +		return;

[Severity: Medium]
Should tx_pause and rx_pause be applied somewhere in airoha_mac_link_up()?

airoha_setup_phylink() advertises MAC_ASYM_PAUSE | MAC_SYM_PAUSE on every
GDM port. However, airoha_mac_link_up() returns right away for GDM1-3 and
only writes fragment sizes for GDM4.

Nothing in drivers/net/ethernet/airoha uses tx_pause, rx_pause or
GDM_INGRESS_FC_EN_MASK.

The only flow control setup on this path is in airoha_pcs_config():

drivers/net/pcs/airoha/pcs-airoha-common.c:airoha_pcs_config() {
    ...
	/* Configure Flow Control on XFI */
	regmap_update_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
			   AIROHA_PCS_XFI_TX_FC_EN | AIROHA_PCS_XFI_RX_FC_EN,
			   permit_pause_to_mac ?
				AIROHA_PCS_XFI_TX_FC_EN | AIROHA_PCS_XFI_RX_FC_EN :
				0);
    ...
}

permit_pause_to_mac reflects whether pause autoneg is enabled. It is not
the result negotiated with the link partner.

With the default MLO_PAUSE_AN, XFI TX/RX flow control ends up enabled even
when the partner does not support pause. With pause forced on and autoneg
off, it ends up disabled while phylink reports pause as on.

Can the hardware flow control state differ from what phylink resolved and
reports?

Also, only get/set_link_ksettings were moved to phylink in
airoha_ethtool_ops. These are not wired up:

  get/set_pauseparam (phylink_ethtool_get/set_pauseparam())
  nway_reset (phylink_ethtool_nway_reset())
  ndo_eth_ioctl (phylink_mii_ioctl())

Is that intended, given the commit message says "now that we fully support
phylink"?

[ ... ]

> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> +	struct device_node *np = netdev->dev.of_node;
> +	struct airoha_gdm_port *port = dev->port;
> +	struct phylink_config *config;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +	int err;
> +
> +	err = of_get_phy_mode(np, &phy_mode);
> +	if (err) {
> +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> +		return err;
> +	}

[Severity: Medium]
Does this stop DTs that follow the current airoha,en7581-eth.yaml binding
from probing?

The binding's ^ethernet@[1-4]$ and ^ethernet@[0-5]$ patternProperties
only require reg and compatible. The binding example has no phy-mode,
fixed-link or pcs-handle. That example is ethernet@1, plus ethernet@4
with eth-port children @0 and @1.

With this patch, a missing phy-mode on any enabled GDM or eth-port node
propagates up:

airoha_probe()
  airoha_alloc_gdm_port()
    airoha_alloc_gdm_device()
      return airoha_setup_phylink(netdev);
        of_get_phy_mode() fails

airoha_probe() then runs the error_napi_stop teardown, so every port is
lost, GDM1 included. Before this patch the driver never called
of_get_phy_mode(), and such DTs probed fine.

A similar problem shows up in airoha_dev_open():

	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
	if (err) {
		netdev_err(netdev, "could not attach PHY: %d\n", err);
		return err;
	}

Suppose a node has phy-mode but no phy-handle, fixed-link, SFP or in-band
managed mode. Phylink is then in MLO_AN_PHY, and
phylink_fwnode_phy_connect() returns -ENODEV. Won't ndo_open now fail
where it used to succeed?

The commit message implies that GDM2/3/4 need pcs-handle. The code means
GDM1 needs phy-mode = "internal" plus fixed-link, because only
PHY_INTERFACE_MODE_INTERNAL is in supported_interfaces. The ethernet
binding describes neither. The series updates the PCS binding but not
this one.

Should airoha,en7581-eth.yaml be updated too? Alternatively, should the
driver fall back (for example to internal on GDM1) when phy-mode is
absent?

The in-tree en7581.dtsi gdm1 node already has phy-mode = "internal" and
fixed-link, so in-tree boards still work.

> +
> +	config = &dev->phylink_config;
> +	config->dev = &netdev->dev;
> +	config->type = PHYLINK_NETDEV;

[ ... ]

> +	} else {
> +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +					   MAC_10 | MAC_100 | MAC_1000 |
> +					   MAC_2500FD | MAC_5000FD | MAC_10000FD;

[Severity: Medium]
MAC_10, MAC_100 and MAC_1000 include MAC_10HD, MAC_100HD and MAC_1000HD.
That means phylink will advertise and accept half duplex. Is half duplex
actually supported on these ports?

Nothing seems to configure duplex:

  airoha_mac_link_up() ignores its duplex argument
  airoha_pcs_link_up() never reads duplex
  the Airoha PCS get_state helpers hard code DUPLEX_FULL
  airoha_pcs_ops has no .pcs_validate to strip half duplex modes

So a PHY that links half duplex with a half-duplex-only partner would
leave the GDM/PCS running full duplex.

Separately, USXGMII is in supported_interfaces and MAC_10 is advertised.
In the out-of-band branch of airoha_pcs_link_up(), the USXGMII/10GBASE-R
speed switch has no SPEED_10 case:

drivers/net/pcs/airoha/pcs-airoha-common.c:airoha_pcs_link_up() {
    ...
		if (interface == PHY_INTERFACE_MODE_USXGMII ||
		    interface == PHY_INTERFACE_MODE_10GBASER) {
			...
			case SPEED_100:
				rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100;
				mode = AIROHA_PCS_USXGMII_MODE_100;
				break;
			default:
				/* Not supported */
				return;
			}
    ...
	if (data->link_up)
		data->link_up(priv, port->index);

	/* BPI BMI enable */
	regmap_clear_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
			  AIROHA_PCS_XFI_RXMPI_STOP |
			  AIROHA_PCS_XFI_RXMBI_STOP |
			  AIROHA_PCS_XFI_TXMPI_STOP |
			  AIROHA_PCS_XFI_TXMBI_STOP);
}

When a USXGMII PHY resolves to 10M, this returns before data->link_up().
It also returns before the MPI/MBI STOP bits set by pre_config/link_down
are cleared.

Would phylink then report carrier up while the XFI datapath stays stopped
and the USXGMII mode register keeps its old speed?

> +
> +		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
> +		config->fill_available_pcs = airoha_fill_available_pcs;

[Severity: Low]
The commit message says:

    These needs to be defined in the GDM port node using the pcs-handle
    property.

Is that accurate? fwnode_phylink_pcs_count() returns 0 when there is no
pcs-handle, and phylink_fill_available_pcs() then returns early:

	if (!config->num_possible_pcs)
		return 0;

phylink_create() then succeeds with SGMII, 1000BASE-X, 2500BASE-X,
10GBASE-R and USXGMII in supported_interfaces but no PCS at all. There is
no error or warning.

Can the port then report carrier up from the PHY while the SerDes is
never configured? Should a missing pcs-handle on GDM2/3/4 be rejected
here?

Also, config->dev is &netdev->dev. When sub-ports exist, its of_node is
the airoha,eth-port child. So pcs-handle is read from the child node, not
from "the GDM port node".

The commit message also leaves out the new GDM4 code in
airoha_mac_link_up():

  it writes speed-dependent TX/RX fragment sizes into
  REG_FE_GDM4_TMBI_FRAG and REG_FE_GDM4_RMBI_FRAG
  it picks the SGMII1 or SGMII0 fields based on dev->nbq == 1
  it serializes the writes with the new port->link_lock mutex

Could the commit message describe this as well?

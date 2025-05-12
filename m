Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396525B668
	for <llvm@lists.linux.dev>; Mon, 12 May 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042043; cv=none; b=XExfYOx1B870tgT9fONyzJA9Ijsolyew9J01HNJkv7v07vdVERwxrhZMSbC77JGSBeMo1GvTwLnpgkDeg4QEoCSajHIi5sjKMhrPQ4R7UMR14fNzZlovO2F+40EWvBWlwiFfs/Yp46QzYZ+fIpW0O2jovloBm2d5QbO6zxudPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042043; c=relaxed/simple;
	bh=tOe2lgKCbgqYYIMOtKeKhAwAOjWlZcBSaNqvUehU9UQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6p8I+cUU5brPmx9am+fvUELFnNQJAM6vjykXqrSqZPz62tbdwQ3YJoveR2frxla21EhV7gCa6ckDeQtupC19TwIsRsiRrY9Q6hfjFpbFsB7UDvu8VilSefLvnFMo0n5A4RoXsg9yJqax/xiJmm7eOk13tAHb6IyKwUaCads62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJSYaRID; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJSYaRID"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2318727f8f.3
        for <llvm@lists.linux.dev>; Mon, 12 May 2025 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042039; x=1747646839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EP5ciUrJhx2qjL/YTEW+Ro+6nfUBpD7HupJKLYyZ5WU=;
        b=IJSYaRIDsGrj73RXoDJeZ7dNUohoaLfST+PtqtP3bIfNcssqeg68Qse3Km7/xBFfo8
         CeYHiTHaYSseu4JpHop6jLzPE4NRzGnsBpQ2DBAYX1vpMhwGktOTQhvRgc1tSleG4FIS
         tAooXQWjT+oihEoK2nqQC2Ib5k6xtFd6zxN+O7nm/wZAOw8IM2xQO1wHyJdm+a6aME+M
         wUARaRcOXtleuZzIX8NKwWsX57uTyZZMNeHn2YsCfmBPD3k8FDKzZNfxo9W0NZdz6h7z
         ARPo7aJoUg3g6E2cYCrw3V8iyTaV+lUbBTpi4pLpVDs2rxdZmBqz3+QgUVrdffvDE6VO
         NA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042039; x=1747646839;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP5ciUrJhx2qjL/YTEW+Ro+6nfUBpD7HupJKLYyZ5WU=;
        b=a+M1b8io9d7roYKM7ig9VgFkFkV70QZR6Mc+Np5+2+E9vyvrdaqFLdPFyAre3iDCzp
         yavZ0fyp5HEJe1LjBd61pJub1Zcfat2C+8dCJ1KYZKSbaVt/mlBuhCXPopo6KYEYORL2
         F33xHEadgEDlnNA6PaZM75orRWgPLHc4mPZSZUH/3FhzeK+a/zQqA6gdT8+EC5ODoL2I
         LRfN49PhIPOx+Cn2h7dsMXMq+LtiZyeXETwiMpw3WBFIndI7W3v/Ew144+3j2/W0TTTO
         CdKw27ePmjfmJ9GOgsk8I4DS8NhryBKIv03toR6hcEq/gSUJoZEHF6p7M5T7KWmNaP/a
         /QNw==
X-Forwarded-Encrypted: i=1; AJvYcCXXVRpagmH1K8TdKJechur2zLrqO9xkVLjgTEbVgp2as+ylBGGhkfBD289+NBMWdiFbmCir@lists.linux.dev
X-Gm-Message-State: AOJu0YzYiI+oU2cPbz6etJk41/qrpLJ7ifgSi48Da506wMtfzNQhANef
	4RJOpHmxqB3HKCzV72UiKozbE46bkigOspoSHryLSgkYGitIn42l
X-Gm-Gg: ASbGncvVb5JFCEL27xhHLoXtYtcjKfEaHOndgo7ACUHt+3d0iODSiRo5UPWX1jWAlTY
	9lPPyWfQZWODQuTa9ILUEIrLIASARP05jc0e4TZU28g1bmmzQoQg6IY87bMSq/cnssd32yqMj/N
	YOJk1ggXiPtyaP9m82HKw/hMZP0+Q65ZdLz4AP97RU2Sk69VrMgcnUhw8GTWDMHlz38aPN9GlnI
	sbbcSxQ18dAka8IhYXrPJv6v1lqwALscGaYzIJWOXwyurJKqIMkKco2SlG3+G/VtJCUqoXEzy3/
	b0peuXS0UnFXSm5aQf3uK/OFTju4t5MBkVMjozFkFykKOuVZDO9R0PC/E2HGq4Nc1ImoGOurGIx
	uzV/YvzQ=
X-Google-Smtp-Source: AGHT+IEIx2dngjb6axDv4lWuQJCqhwKHcwmf+wk9ypXMGeGlR42a1KIrb2TLCO+LYY/WGRgWY7SQ1Q==
X-Received: by 2002:a05:6000:430d:b0:3a0:b378:a4eb with SMTP id ffacd0b85a97d-3a1f6487e1amr9306477f8f.40.1747042038492;
        Mon, 12 May 2025 02:27:18 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d96csm11933224f8f.69.2025.05.12.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:27:17 -0700 (PDT)
Message-ID: <6821bef5.5d0a0220.319347.d533@mx.google.com>
X-Google-Original-Message-ID: <aCG-8mJYlQoa_4ls@Ansuel-XPS.>
Date: Mon, 12 May 2025 11:27:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 11/11] net: airoha: add phylink support for
 GDM2/3/4
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-12-ansuelsmth@gmail.com>
 <aCG9q6i7HomgilI6@lore-desk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCG9q6i7HomgilI6@lore-desk>

On Mon, May 12, 2025 at 11:21:47AM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for GDM2/3/4 port that require configuration of the
> > PCS to make the external PHY or attached SFP cage work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 155 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  3 files changed, 169 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index 16c7896f931f..3be1ae077a76 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/of_net.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> >  	return port->id == 1;
> >  }
> >  
> > +static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
> > +{
> > +	return port->id != 1;
> > +}
> > +
> >  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
> >  {
> >  	struct airoha_eth *eth = port->qdma->eth;
> > @@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
> >  	struct airoha_gdm_port *port = netdev_priv(dev);
> >  	struct airoha_qdma *qdma = port->qdma;
> >  
> > +	if (airhoa_is_phy_external(port)) {
> > +		err = phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
> 
> nit: even if it is not strictly required, in order to align with the rest of the
> codebase, can you please stay below 79 columns?
> 
> > +		if (err) {
> > +			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
> > +				   err);
> 
> same here
> 
> > +			return err;
> > +		}
> > +
> > +		phylink_start(port->phylink);
> > +	}
> > +
> >  	netif_tx_start_all_queues(dev);
> >  	err = airoha_set_vip_for_gdm_port(port, true);
> >  	if (err)
> > @@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	if (airhoa_is_phy_external(port)) {
> > +		phylink_stop(port->phylink);
> > +		phylink_disconnect_phy(port->phylink);
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2795,6 +2817,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> 
> ditto.
> 
> > +{
> > +	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
> > +						    phylink_config);
> 
> ditto.
> 
> > +	struct airoha_qdma *qdma = port->qdma;
> > +	struct airoha_eth *eth = qdma->eth;
> > +	u32 frag_size_tx, frag_size_rx;
> > +
> > +	if (port->id != 4)
> > +		return;
> > +
> > +	switch (speed) {
> > +	case SPEED_10000:
> > +	case SPEED_5000:
> > +		frag_size_tx = 8;
> > +		frag_size_rx = 8;
> > +		break;
> > +	case SPEED_2500:
> > +		frag_size_tx = 2;
> > +		frag_size_rx = 1;
> > +		break;
> > +	default:
> > +		frag_size_tx = 1;
> > +		frag_size_rx = 0;
> > +	}
> > +
> > +	/* Configure TX/RX frag based on speed */
> > +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
> > +		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx));
> > +
> > +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
> > +		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx));
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_link_up = airoha_mac_link_up,
> > +};
> > +
> > +static int airoha_setup_phylink(struct net_device *dev)
> > +{
> > +	struct airoha_gdm_port *port = netdev_priv(dev);
> > +	struct device_node *np = dev->dev.of_node;
> > +	struct phylink_pcs **available_pcs;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +	unsigned int num_pcs;
> > +	int err;
> > +
> > +	err = of_get_phy_mode(np, &phy_mode);
> > +	if (err) {
> > +		dev_err(&dev->dev, "incorrect phy-mode\n");
> > +		return err;
> > +	}
> > +
> > +	port->phylink_config.dev = &dev->dev;
> > +	port->phylink_config.type = PHYLINK_NETDEV;
> > +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
> > +						MAC_5000FD | MAC_10000FD;
> 
> over 79 columns
> 
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
> > +	if (err)
> > +		return err;
> > +
> > +	available_pcs = kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
> 
> I guess you can use devm_kcalloc() and get rid of kfree() here.
>

I forgot to answer to this in the previous revision. No devm can't be
used there available_pcs is just an array allocated for phylink_config.

Phylink then copy the data in it and doesn't use it anymore hence it
just needs to be allocated here and doesn't need to stay till the driver
gets removed.

> > +	if (!available_pcs)
> > +		return -ENOMEM;
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
> > +				       &num_pcs);
> > +	if (err)
> > +		goto out;
> > +
> > +	port->phylink_config.available_pcs = available_pcs;
> > +	port->phylink_config.num_available_pcs = num_pcs;
> > +
> > +	__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +		  port->phylink_config.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > +		  port->phylink_config.supported_interfaces);
> > +
> > +	phy_interface_copy(port->phylink_config.pcs_interfaces,
> > +			   port->phylink_config.supported_interfaces);
> > +
> > +	phylink = phylink_create(&port->phylink_config,
> > +				 of_fwnode_handle(np),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink)) {
> > +		err = PTR_ERR(phylink);
> > +		goto out;
> > +	}
> > +
> > +	port->phylink = phylink;
> > +out:
> > +	kfree(available_pcs);
> > +
> > +	return err;
> > +}
> > +
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  				 struct device_node *np, int index)
> >  {
> > @@ -2873,7 +3004,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  	if (err)
> >  		return err;
> >  
> > -	return register_netdev(dev);
> > +	if (airhoa_is_phy_external(port)) {
> > +		err = airoha_setup_phylink(dev);
> 
> This will re-introduce the issue reported here:
> https://lore.kernel.org/netdev/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/
> 

I'm confused about this. The suggestion wasn't that register_netdev
might fail and I need to destroy phylink? Or the linked patch was merged
and I need to rebase on top of net-next?

I didn't include that change to not cause conflicts but once it's merged
I will rebase and include that fix.

> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	err = register_netdev(dev);
> > +	if (err)
> > +		goto free_phylink;
> > +
> > +	return 0;
> > +
> > +free_phylink:
> > +	if (airhoa_is_phy_external(port))
> > +		phylink_destroy(port->phylink);
> > +
> > +	return err;
> >  }
> >  
> >  static int airoha_probe(struct platform_device *pdev)
> > @@ -2967,6 +3114,9 @@ static int airoha_probe(struct platform_device *pdev)
> >  		struct airoha_gdm_port *port = eth->ports[i];
> >  
> >  		if (port && port->dev->reg_state == NETREG_REGISTERED) {
> > +			if (airhoa_is_phy_external(port))
> > +				phylink_destroy(port->phylink);
> > +
> >  			unregister_netdev(port->dev);
> >  			airoha_metadata_dst_free(port);
> >  		}
> > @@ -2994,6 +3144,9 @@ static void airoha_remove(struct platform_device *pdev)
> >  			continue;
> >  
> >  		airoha_dev_stop(port->dev);
> > +		if (airhoa_is_phy_external(port))
> > +			phylink_destroy(port->phylink);
> > +
> >  		unregister_netdev(port->dev);
> >  		airoha_metadata_dst_free(port);
> >  	}
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index 53f39083a8b0..73a500474076 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -498,6 +498,9 @@ struct airoha_gdm_port {
> >  	struct net_device *dev;
> >  	int id;
> >  
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> > +
> >  	struct airoha_hw_stats stats;
> >  
> >  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index d931530fc96f..54f7079b28b0 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -357,6 +357,18 @@
> >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> >  
> > +#define REG_GDMA4_TMBI_FRAG		0x2028
> > +#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> > +#define REG_GDMA4_RMBI_FRAG		0x202c
> > +#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> >  #define REG_MC_VLAN_EN			0x2100
> >  #define MC_VLAN_EN_MASK			BIT(0)
> >  
> > -- 
> > 2.48.1
> > 



-- 
	Ansuel

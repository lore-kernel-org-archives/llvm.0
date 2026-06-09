Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77371C84BC
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049107; cv=none; b=odXsWFIDGlvS6jspIUfkw56u4Q7l6HuLE4OolPsmb1lINeBEwwMgD0mWo94TYVAiErEQl6luo7MGQ1VvrWdDXN9OSRUMA9mIS5gm0+tSSzkDK6GFuwzkcEbVpp61yPUKaxG+v5fY3eyHDZuxDDrh2B59gHup341QfApA0Je/lPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049107; c=relaxed/simple;
	bh=GFvYv6F5JXSgGBdTvAtYZW/jY+Zo6S7GJXvCZR5lYOg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhzzoGi3a6KweQjEkDZrffbkN8lMcUeMWMplN6KolAeMYf2BFL+XlGciiqOcLvxEPlaUEXYp4yuEjokpNWMzF0HrVgGzgSay5bnk07+6v8zd5PrlnCRaI9LMGz7pzCmLsWy/LDGrhVOiNmnc6QIGH74WwYWI/3p21Yt2QUzH9FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPOL1fRB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPOL1fRB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b915ded5so52827685e9.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 16:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781049104; x=1781653904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcoODBbAmHhF71HEbR7vlQdemMO8cJnQFdN0SVH2Vk=;
        b=mPOL1fRB7rfxlTZAd+Pb7xUbeuBASbeWnA2GUcW1g+xbEFXpAUvwI/8mNJ1RNPUd8i
         S82bWcfCNMDF80o9GVeJt7KBQnaBaxU4/zGkD31AFGMEo0g9IYEtih5EQt00j1LZbxvZ
         WGeIBMISJYAG2Hhpwn48M2Tb5bGvSurYAveYytdnNOPKXLb3nAB/mlfdEKkSthlIKyE5
         QghpkJ1IlCuC9JQ3x7e22PqVOVV4PHh5iGJ32gh0uEzsGKjGz0yoWkOuMPD0j70ca/6c
         f6DCFiMU91VyaH+rv4VMQ6DRO0XyIv/jPYiXRIx2hOAi69hvHEONJaU8jm2Aj2XSfhsO
         w0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781049104; x=1781653904;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEcoODBbAmHhF71HEbR7vlQdemMO8cJnQFdN0SVH2Vk=;
        b=P1/hZYCARd9I8AVKacqslf/x+TA7vC/5vevYhuEzHSp/onyYfHdnd/EPj+lt9kjBxa
         pLI+XgtKEWSaxpUHgeM9C9SgiPbBOd5B3YT82bs8MKocFXHX7Hk9s53bdFDQHx9eOQhH
         oeq6zvPNhLYTHStvUfyWWNS6jA24LdtQDHrxe23rIiz6/mObmOMnuSF+atjUUFy7INK/
         N9SR4MPWU8w+mkIyJEG04uRvZmugAGmxxTmu2UuQsvp3n+EaDYZZ7qk9Z4nIdTTvNFPV
         ZJcSXTXQZr2JnEAvmUhrtwVGECOl7o3s90G7hp3IHrC2lfLUBSRgrxSkzCtRUbNBphna
         Bm+g==
X-Forwarded-Encrypted: i=1; AFNElJ/Tl0cwLWygn0/5drlTASAN5J1Rf+jVBIllSz87C9HcbSTIPhiYSlNP0M8HZ1M452nX9kEO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5xinl/a/0L5ZuX9jt3jxEqLvrLVMFZeaRaRx8ulGBhiUL6yUK
	w5hGBo74+W7T0NH1d2DPqgbrlVXO3IItXVR3mBOZBGCJyz2AkrFA3Z2T
X-Gm-Gg: Acq92OGK6UMXJffLj1h9RoqmRF+fuJZL0sGehIxatHRem5feZVmy9jDkFj0JpAKYeWi
	yW8VlSZELxKdRrrOCsZllDZr7p8daMoToemNN1nNDszpxaX4pDK9+VD3HTS+sso62cFlM5tWaVX
	+V+TodbOxg+QNgkBXvUtQO0iKxmNcEeWag5cnDUloV4RS85FGmPzmympQiLfW3RlxcmywI5lwnL
	suKRz2UOuxHJb7het2R6HmltFdAwLeD+NWryqMGvXeAZAdzW04I3AzImH78Q+tWb+FoKU0rowF8
	X+KJvFPvpzHH20Mi5IBs0nXuTQ5l2dJN7Y+6LdabfwfHq/DVKHfAwuf9kwK/87Gpe6WxUDKmtA/
	ZkrWRuWpT/gEoY58u/xwVdcGCypTmNOkjjzFv2+08fHjOajFe/dLFoL1pNhOOpD9edWjseCBrW/
	7TZHxBCUl19C5Jldm9gH5X94WOpax3Y+CYc6irGea6q/UyQEf8CTOT3PsntR0LOsYy
X-Received: by 2002:a05:600c:c165:b0:490:a2fd:e1e5 with SMTP id 5b1f17b1804b1-490c2623527mr425785595e9.17.1781049103934;
        Tue, 09 Jun 2026 16:51:43 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm23335215e9.1.2026.06.09.16.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:51:43 -0700 (PDT)
Message-ID: <6a28a70f.3dabba3e.312002.39c0@mx.google.com>
X-Google-Original-Message-ID: <aiinCyCvlCBpEVQX@Ansuel-XPS.>
Date: Wed, 10 Jun 2026 01:51:39 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v6 12/12] net: airoha: add phylink support
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
 <20260609151212.29469-13-ansuelsmth@gmail.com>
 <aigxaDtZDnI-RTwN@lore-desk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigxaDtZDnI-RTwN@lore-desk>

On Tue, Jun 09, 2026 at 05:29:44PM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for each GDM port. For GDM1 add the internal interface
> > mode as the only supported mode. For GDM2/3/4 add the required
> > configuration of the PCS to make the external PHY or attached SFP cage
> > work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> some nits inline.
> 
> Regards,
> Lorenzo
> 
> > ---
> >  drivers/net/ethernet/airoha/Kconfig       |   1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 167 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  4 files changed, 181 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> > index ad3ce501e7a5..38dcc76e5998 100644
> > --- a/drivers/net/ethernet/airoha/Kconfig
> > +++ b/drivers/net/ethernet/airoha/Kconfig
> > @@ -20,6 +20,7 @@ config NET_AIROHA
> >  	depends on NET_DSA || !NET_DSA
> >  	select NET_AIROHA_NPU
> >  	select PAGE_POOL
> > +	select PHYLINK
> >  	help
> >  	  This driver supports the gigabit ethernet MACs in the
> >  	  Airoha SoC family.
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index 5a8e84fa9918..eabd7b058f82 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> 
> Can you please respect the alphabetic order?
> 
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -1779,6 +1780,15 @@ static int airoha_dev_open(struct net_device *netdev)
> >  	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
> >  	struct airoha_qdma *qdma = dev->qdma;
> >  
> > +	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
> > +	if (err) {
> > +		netdev_err(netdev, "%s: could not attach PHY: %d\n", __func__,
> > +			   err);
> 
> Do we need specify the __func__ argument here?
>

I was following a pattern also used in other driver. Maybe we should stop
following it?
 
> > +		return err;
> > +	}
> > +
> > +	phylink_start(dev->phylink);
> > +
> >  	netif_tx_start_all_queues(netdev);
> >  	err = airoha_set_vip_for_gdm_port(dev, true);
> >  	if (err)
> > @@ -1876,6 +1886,9 @@ static int airoha_dev_stop(struct net_device *netdev)
> >  		}
> >  	}
> >  
> > +	phylink_stop(dev->phylink);
> > +	phylink_disconnect_phy(dev->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -3148,6 +3161,153 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> > +			      const struct phylink_link_state *state)
> > +{
> > +}
> > +
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
> > +						  phylink_config);
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct airoha_eth *eth = dev->eth;
> > +	u32 frag_size_tx, frag_size_rx;
> > +	u32 mask, val;
> > +
> > +	/* TX/RX frag is configured only for GDM4 */
> > +	if (port->id != 4)
> 
> 	if (port->id != AIROHA_GDM4_IDX)
> 		...
> 
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
> > +	if (dev->nbq == 1) {
> > +		mask = GDMA4_SGMII1_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII1_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}  else {
> > +		mask = GDMA4_SGMII0_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, mask, val);
> > +
> > +	if (dev->nbq == 1) {
> > +		mask = GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	} else {
> > +		mask = GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
> > +}
> > +
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
> > +				 phy_interface_t interface)
> > +{
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_config = airoha_mac_config,
> > +	.mac_link_up = airoha_mac_link_up,
> > +	.mac_link_down = airoha_mac_link_down,
> > +};
> > +
> > +static int airoha_fill_available_pcs(struct phylink_config *config,
> > +				     struct phylink_pcs **available_pcs,
> > +				     unsigned int num_available_pcs)
> > +{
> > +	struct device *dev = config->dev;
> > +
> > +	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> > +					&num_available_pcs);
> > +}
> > +
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +	struct device_node *np = netdev->dev.of_node;
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct phylink_config *config;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +	int err;
> > +
> > +	err = of_get_phy_mode(np, &phy_mode);
> > +	if (err) {
> > +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> > +		return err;
> > +	}
> > +
> > +	config = &dev->phylink_config;
> 
> remove new-line here.
> 
> > +
> > +	config->dev = &netdev->dev;
> > +	config->type = PHYLINK_NETDEV;
> > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |  MAC_10000FD;
> > +	if (port->id > AIROHA_GDM1_IDX)
> 
> maybe
> 	if (port->id != AIROHA_GDM1_IDX)
> 		...
> 
> > +		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000 |
> > +					    MAC_2500FD | MAC_5000FD;
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
> > +				       &config->num_available_pcs);
> > +	if (err)
> > +		return err;
> > +
> > +	config->fill_available_pcs = airoha_fill_available_pcs;
> > +
> > +	/*
> > +	 * GDM1 only supports internal for Embedded Switch
> > +	 * and doesn't require a PCS.
> > +	 */
> > +	if (port->id == AIROHA_GDM1_IDX) {
> > +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +			  config->supported_interfaces);
> > +	} else {
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_10GBASER,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > +			  config->supported_interfaces);
> > +
> > +		phy_interface_copy(config->pcs_interfaces,
> > +				   config->supported_interfaces);
> > +	}
> > +
> > +	phylink = phylink_create(config, of_fwnode_handle(np),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink))
> > +		return PTR_ERR(phylink);
> > +
> > +	dev->phylink = phylink;
> > +
> > +	return 0;
> > +}
> > +
> >  static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  				   struct airoha_gdm_port *port,
> >  				   int nbq, struct device_node *np)
> > @@ -3210,7 +3370,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  	dev->nbq = nbq;
> >  	port->devs[index] = dev;
> >  
> > -	return 0;
> > +	return airoha_setup_phylink(netdev);
> >  }
> >  
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > @@ -3435,8 +3595,10 @@ static int airoha_probe(struct platform_device *pdev)
> >  				continue;
> >  
> >  			netdev = netdev_from_priv(dev);
> > -			if (netdev->reg_state == NETREG_REGISTERED)
> > +			if (netdev->reg_state == NETREG_REGISTERED) {
> > +				phylink_destroy(dev->phylink);
> >  				unregister_netdev(netdev);
> > +			}
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > @@ -3472,6 +3634,7 @@ static void airoha_remove(struct platform_device *pdev)
> >  				continue;
> >  
> >  			netdev = netdev_from_priv(dev);
> > +			phylink_destroy(dev->phylink);
> >  			unregister_netdev(netdev);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index 8f42973f9cf5..1b25603dc64d 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -554,6 +554,9 @@ struct airoha_gdm_dev {
> >  
> >  	u32 flags;
> >  	int nbq;
> > +
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> >  };
> >  
> >  struct airoha_gdm_port {
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index 436f3c8779c1..27f2583e143a 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -358,6 +358,18 @@
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
> > 2.53.0
> > 



-- 
	Ansuel

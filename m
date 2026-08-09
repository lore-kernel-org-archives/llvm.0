Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540C739DBF7
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786297803; cv=none; b=sOE9tWXFo/Z0vhh/jkZKND2mf726fR9GXL++9+1Oq1wAc3eQGv6zODvxZtvdVhxCazix5dgYP+8zNnIk1PjWNUxFeJBQ19fWPzE4dv1cuKgZXLypOYRwWFluD2J3Ye9Y2VDt8CAi+I225Yjh1BW6jDK7t8UYHkKx9SApqOgCrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786297803; c=relaxed/simple;
	bh=ihEhCpdOiQJ7RiLVFIbBDlHDMYkCQhxi8LGrQZaYQO8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFyrHlPt39p6c5wr/wSN+kBE202ab5LGT8/kuh5ad8ikkhN6GT7UX1hJ6VR0aNgfIlkffVStX/dHG6+NCiFy4pzGL4OUMBHcSqY7B/6548Jwm0vWd3Ndn+hHev16X+Hr25FUdVuV62aD59/FCUAS8caAs/H1bw3nT4wQ+7jx42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V40BLDEq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V40BLDEq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49557167508so8883345e9.1
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786297799; x=1786902599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCnEd7tGfLsvqQ9t4dLxlXhkU3vDq79dR6i/bF6oDRI=;
        b=V40BLDEqdrNIL0uGn7zS5UL7q6vEPf79xk87WYyu9aZ4QKyFCLvzSTDKtdtnqJ3h/t
         qtCO5pl8qxAx1GTKHOdAPmxE0//3iW6tbiwsp9f+o75+L+pgXuEpejZm9QfJgCZmybWL
         kU9LPYEKt/vZGQqy+zi0flJ7GMgi2TqBz2Lm6gVXskkU9OfMbbfTGtDcHw96h14zNQRA
         pl8i2UYaFDHMMnGdrXTCKA7hnbWDyHdWBo3ubjOQyvPClIpDa/qR3Pglhy5vL/OJtlpn
         G6WC9Us0kUEmE5e031LtI4FH82VBFS3en6nRFKu2mi9OhfRvU/7gN1y3jP3JRyP5HsYD
         lGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786297799; x=1786902599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCnEd7tGfLsvqQ9t4dLxlXhkU3vDq79dR6i/bF6oDRI=;
        b=bMT8TbgDtDxhyTNHdtArvDEIaapz8ItRje0C4DufLxxblQe8e9waw6ADhZnzQOPcxn
         YY/EAY3LFPINQfq2i0HDp1gFiLMRXtEYwaoilwVyAywNnn0PK99y00HdVSZ2Il9tszzr
         AdQRgQVz1i2o8ctGKP/SDgQ3wqhijnmBtsKeybjBs1+E33NIsSlbvEx5hpnik3wQVHCE
         M25k3kxybqW25oR/oKNp/Pk2oyFmNIkZYwHIAwv8nPT2g9k28S5ASwmmdBIMPnifNX6m
         gbOeHASN7d7q1s0SjUFN+ydFrRZDERUtG7KUXxXsxwQ4tNm8V+apKL6A1FTGCf3mLTlr
         oWrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHtToy8yr+wb4/h5qxm7tOp/qqSzzepqxu2eew2FNvKgJYwCRUliaHwCgWoAksBbPzIwcv@lists.linux.dev
X-Gm-Message-State: AOJu0YxvbPpfBYF9m00E82sy4s4vTnTPYwFf+2gY8GosSN7cZMLHmawp
	4CG+7+6iPvVRfHC2PSZNNXmlAZrZVXt4c68RWSYpOTyyuFx2WUK+BCxT
X-Gm-Gg: AR+sD12YZGF60GZwutbh84HlBLMOdAddYM+BUJ8zAxvqtSfx+1RBJaKzFRAwdoZvxjD
	26kncElqsgfHgp7WqB6wdm3NJ3l3Zmv+lYJ9pnUm8RHPryJFmGwYcBm1Ar4U4zPRbqkFFtbiLC3
	qIk5dk8N7Z/pIzs2lW6kQXfbUccTApFVrecM0gxw4cHdBbptz303Vb5EYcrr2JlAuaH/UJz7sUu
	+bdkA+L1RJEQt8vGk0n3hHalyo/saEg88rwIWtdX3vzTPdWi/HB9Kaf2D3dQcQUpopOl1UepB2/
	l3ru29sKK5CSxJz12WIwOiQx2cyYQJmZyE/9fIYFQI0AY/sMZPnxvLGg+0hfdviDIGsdHpSKIqQ
	uPs6n7cKiex4MzdDykVcQMdBov0L+pck+Ly96RCTjXvAzxj1Xgtw0Q8AjGayvSp39gx4/WgBzlA
	qDrGZQS/WbrOCnalRW7UgLxn/kbnOrw1Fe+ycjmEKS4BFk0CatsStOfN/IO/3uzaXza66gXIIiH
	BBzskEeXrzXm9mjcteACWTXqabR/1G2x6pV/2FZ6aw=
X-Received: by 2002:a05:600c:630c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4994e71c87bmr402295485e9.7.1786297799337;
        Sun, 09 Aug 2026 10:49:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421934asm340945865e9.5.2026.08.09.10.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:49:58 -0700 (PDT)
Message-ID: <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
X-Google-Original-Message-ID: <ani9wg-GiHuUV9ab@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 19:49:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>

On Sun, Aug 09, 2026 at 07:44:55PM +0200, Andrew Lunn wrote:
> On Fri, Aug 07, 2026 at 03:12:42PM +0200, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> 
> One of Russells complaints was the phylink has too many bits of code
> for ideas which did not work out and were replaced by new ways of
> doing things.
> 
> We want .mac_select_pcs to go away, this framework should replace it.
> Please could you convert one of the exist users of .mac_select_pcs, so
> we get an idea of what that involved. If that conversion is pretty
> mechanical, i think we should have a second patchset which converts
> all the current users, and then remove support for .mac_select_pcs.
> 
> Overall i think the direction of this patchset is good.
>

Thanks for the initial check.

Maxime converted one device with this and the patch delta was small... let
me copy those patch here. (it was referenced in v9)

I think the most annoying one will be stmmac with the 3 different PCS
implementation but we already handled that in a upcoming ipq50xx driver
currently present in OpenWrt mainline.

Maybe if Maxime is O.K. I can include his patch in this series.

From 38ad94b1e62bf3523097983dfb515f59b1634477 Mon Sep 17 00:00:00 2001
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 21 Jul 2026 13:52:57 +0200
Subject: [PATCH] net: marvell: mvpp2: Convert to the new PCS API

Following the introduction of the PCS framework, port mvpp2 to the new
PCS API.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 161 +++++++++++-------
 1 file changed, 95 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index ccc24a1301f2..8d9663c7a023 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6499,21 +6499,6 @@ static void mvpp2_gmac_config(struct mvpp2_port *port, unsigned int mode,
                writel(ctrl4, port->base + MVPP22_GMAC_CTRL_4_REG);
 }

-static struct phylink_pcs *mvpp2_select_pcs(struct phylink_config *config,
-                                           phy_interface_t interface)
-{
-       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
-
-       /* Select the appropriate PCS operations depending on the
-        * configured interface mode. We will only switch to a mode
-        * that the validate() checks have already passed.
-        */
-       if (mvpp2_is_xlg(interface))
-               return &port->pcs_xlg;
-       else
-               return &port->pcs_gmac;
-}
-
 static int mvpp2_mac_prepare(struct phylink_config *config, unsigned int mode,
                             phy_interface_t interface)
 {
@@ -6786,7 +6771,6 @@ static int mvpp2_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 }

 static const struct phylink_mac_ops mvpp2_phylink_ops = {
-       .mac_select_pcs = mvpp2_select_pcs,
        .mac_prepare = mvpp2_mac_prepare,
        .mac_config = mvpp2_mac_config,
        .mac_finish = mvpp2_mac_finish,
@@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
        };
        struct phylink_pcs *pcs;

-       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
+       if (mvpp2_is_xlg(port->phy_interface))
+               pcs = &port->pcs_xlg;
+       else
+               pcs = &port->pcs_gmac;

        mvpp2_mac_prepare(&port->phylink_config, MLO_AN_INBAND,
                          port->phy_interface);
@@ -6823,6 +6810,78 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
                          SPEED_UNKNOWN, DUPLEX_UNKNOWN, false, false);
 }

+static int mvpp2_port_fill_pcs(struct phylink_config *config,
+                              struct phylink_pcs **available_pcs,
+                              unsigned int num_possible_pcs)
+{
+       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
+
+       available_pcs[0] = &port->pcs_gmac;
+
+       if (mvpp2_port_supports_xlg(port)) {
+               if (num_possible_pcs < 2)
+                       return -EINVAL;
+
+               available_pcs[1] = &port->pcs_xlg;
+       }
+
+       return 0;
+}
+
+static void mvpp2_port_init_pcs_xlg(struct phylink_pcs *pcs, bool has_comphy,
+                                   phy_interface_t phy_mode)
+{
+       if (has_comphy) {
+               __set_bit(PHY_INTERFACE_MODE_5GBASER,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_10GBASER,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_XAUI,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_5GBASER) {
+               __set_bit(PHY_INTERFACE_MODE_5GBASER,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_10GBASER) {
+               __set_bit(PHY_INTERFACE_MODE_10GBASER,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_XAUI) {
+               __set_bit(PHY_INTERFACE_MODE_XAUI,
+                         pcs->supported_interfaces);
+       }
+}
+
+static void mvpp2_port_init_pcs_gmac(struct phylink_pcs *pcs, bool has_comphy,
+                                    phy_interface_t phy_mode)
+{
+       if (has_comphy) {
+               /* If a COMPHY is present, we can support any of the
+                * serdes modes and switch between them.
+                */
+               __set_bit(PHY_INTERFACE_MODE_SGMII,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_1000BASEX,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_2500BASEX,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+               /* No COMPHY, with only 2500BASE-X mode supported */
+               __set_bit(PHY_INTERFACE_MODE_2500BASEX,
+                         pcs->supported_interfaces);
+       } else if (phy_mode == PHY_INTERFACE_MODE_1000BASEX ||
+                  phy_mode == PHY_INTERFACE_MODE_SGMII) {
+               /* No COMPHY, we can switch between 1000BASE-X and SGMII
+                */
+               __set_bit(PHY_INTERFACE_MODE_1000BASEX,
+                         pcs->supported_interfaces);
+               __set_bit(PHY_INTERFACE_MODE_SGMII,
+                         pcs->supported_interfaces);
+       }
+
+       /* RGMII and MII are still routed through the gmac PCS */
+       phy_interface_set_rgmii(pcs->supported_interfaces);
+       __set_bit(PHY_INTERFACE_MODE_MII, pcs->supported_interfaces);
+}
+
 /* In order to ensure backward compatibility for ACPI, check if the port
  * firmware node comprises the necessary description allowing to use phylink.
  */
@@ -7082,28 +7141,17 @@ static int mvpp2_port_probe(struct platform_device *pdev,
                        port->phylink_config.mac_capabilities |=
                                MAC_SYM_PAUSE | MAC_ASYM_PAUSE;

-               if (mvpp2_port_supports_xlg(port)) {
-                       /* If a COMPHY is present, we can support any of
-                        * the serdes modes and switch between them.
-                        */
-                       if (comphy) {
-                               __set_bit(PHY_INTERFACE_MODE_5GBASER,
-                                         port->phylink_config.supported_interfaces);
-                               __set_bit(PHY_INTERFACE_MODE_10GBASER,
-                                         port->phylink_config.supported_interfaces);
-                               __set_bit(PHY_INTERFACE_MODE_XAUI,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_5GBASER) {
-                               __set_bit(PHY_INTERFACE_MODE_5GBASER,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_10GBASER) {
-                               __set_bit(PHY_INTERFACE_MODE_10GBASER,
-                                         port->phylink_config.supported_interfaces);
-                       } else if (phy_mode == PHY_INTERFACE_MODE_XAUI) {
-                               __set_bit(PHY_INTERFACE_MODE_XAUI,
-                                         port->phylink_config.supported_interfaces);
-                       }
+               if (!mvpp2_port_supports_xlg(port))
+                       port->phylink_config.num_possible_pcs = 1;
+               else
+                       port->phylink_config.num_possible_pcs = 2;
+
+               port->phylink_config.fill_available_pcs = mvpp2_port_fill_pcs;

+               mvpp2_port_init_pcs_xlg(&port->pcs_xlg, comphy, phy_mode);
+               mvpp2_port_init_pcs_gmac(&port->pcs_gmac, comphy, phy_mode);
+
+               if (mvpp2_port_supports_xlg(port)) {
                        if (comphy)
                                port->phylink_config.mac_capabilities |=
                                        MAC_10000FD | MAC_5000FD;
@@ -7115,35 +7163,16 @@ static int mvpp2_port_probe(struct platform_device *pdev,
                                        MAC_10000FD;
                }

-               if (mvpp2_port_supports_rgmii(port)) {
-                       phy_interface_set_rgmii(port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_MII,
-                                 port->phylink_config.supported_interfaces);
-               }
+               phy_interface_copy(port->phylink_config.pcs_interfaces,
+                                  port->pcs_gmac.supported_interfaces);

-               if (comphy) {
-                       /* If a COMPHY is present, we can support any of the
-                        * serdes modes and switch between them.
-                        */
-                       __set_bit(PHY_INTERFACE_MODE_SGMII,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_1000BASEX,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_2500BASEX,
-                                 port->phylink_config.supported_interfaces);
-               } else if (phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
-                       /* No COMPHY, with only 2500BASE-X mode supported */
-                       __set_bit(PHY_INTERFACE_MODE_2500BASEX,
-                                 port->phylink_config.supported_interfaces);
-               } else if (phy_mode == PHY_INTERFACE_MODE_1000BASEX ||
-                          phy_mode == PHY_INTERFACE_MODE_SGMII) {
-                       /* No COMPHY, we can switch between 1000BASE-X and SGMII
-                        */
-                       __set_bit(PHY_INTERFACE_MODE_1000BASEX,
-                                 port->phylink_config.supported_interfaces);
-                       __set_bit(PHY_INTERFACE_MODE_SGMII,
-                                 port->phylink_config.supported_interfaces);
-               }
+               if (mvpp2_port_supports_xlg(port))
+                       phy_interface_or(port->phylink_config.pcs_interfaces,
+                                        port->phylink_config.pcs_interfaces,
+                                        port->pcs_xlg.supported_interfaces);
+
+               phy_interface_copy(port->phylink_config.supported_interfaces,
+                                  port->phylink_config.pcs_interfaces);

                phylink = phylink_create(&port->phylink_config, port_fwnode,
                                         phy_mode, &mvpp2_phylink_ops);
--
2.55.0



-- 
	Ansuel

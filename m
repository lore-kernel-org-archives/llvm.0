Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4618E773;
	Tue,  9 Jul 2024 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533499; cv=none; b=Cy7HnKIut3M0vr61DsXICY7Vf569D0vwivBrC1YQxH4NgYg+Yz39O/ZKBQoS21TMunhRmn1ze/LfhlAiFmsdwuSHxxcAvDLR1Uw+yVNV+ZSw3n5MxrSjE4iC0EvrgmYg7kCr6soLWezuZXF11ZYZFHBWM4OzbrniCPwS1wAeh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533499; c=relaxed/simple;
	bh=O5vT/WAVEi3I/1zZ1e6X9bF4G+TvWPZVtYQUS4pdoF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnwKjHI/JW+ExQkrMUvX6DGj1nX4r/FcD7xN0HJbgUpwr6CN5Wf1PJTIhKTZxbao4KTwWdek1ktrRhIrPQ+Nh/VdXv+D4ZH8Zx2tZaELxo2zHzQ8liJoPqenYMjo7ZKNND1expAIps5N0sud+T73/Su5MAJknUFblXY86Mwjeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUd71u3b; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUd71u3b"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367993463b8so3590018f8f.2;
        Tue, 09 Jul 2024 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720533495; x=1721138295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbYmgVACDAtRDSTL3B4NejRqBxXknmHxVQadZf89uHw=;
        b=LUd71u3b+qwPv4Phn8xfwWtCA5NUHOGzZPeqYc0WXlAHzk46e/KoH9Q793zAvPAQrn
         l8fpguWIVc2zDYyfA0TKs5uAFoeNwktAKGOY+QbXzjBfO2IZOeaDDK1EaIXv0e/VUpWd
         9iw0sDhlG4sSudGJq31d3X5iLTxna4WP775q9UthdKkEt6j4jABqvsivTXKeNv8+KN13
         fAnHl2FKAQK6c59J6+LrynyzDkqJonPJYkBQ7wLSs3Mz2qdtfJaw7SWZ29PsGK+/6LQm
         PFZHFn3Qx+jhKP5ovac9RcdVUetBgw1Q/p0Me1Z/MdSwTcf7NXbARmgB+LvzAD2rxo5H
         ngUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720533495; x=1721138295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbYmgVACDAtRDSTL3B4NejRqBxXknmHxVQadZf89uHw=;
        b=iUlqp65leb9csNOnlxF2IZCTG/4I+Hnrpz9xRoENh7pDhq1Lu1GVKxt43xrVjSRQ0S
         VKDddwTrGG7dhK3dsZndm3SY/D6ytCxyZGLydp5r8cneYYJR0YXB2XWsFSLc8MdJjTXF
         j5Kis+wdgr4sgs2aOh7bdkI0VCgGEmpFGZkZj3LsjvavC1/eo6zQGjh1t6cYb7kpft4O
         33uxaSokZAs9t5FUEsnxJ+A9j+Gy0S4riwyypdPQ4v6o2i9jnSTihcNvZdI4zRJvuUE5
         iOWKPdql4TsfKCjFJDKfO2sXfcma1Wi6vtYrpJUebT/Tq7OxzcNQ664MwXkoP04otewG
         PAlw==
X-Forwarded-Encrypted: i=1; AJvYcCVAtMUM3fg0KNZuQQu+KFGBVD300E24llGWKkdUz9soDq6/oJIC0UcROFUAPliY/DlCqpOxJyoSqxP133WXWGZYrw2NhgtjzClH03R/w3lFGqzLdSvbPwq0sgJhBpK/nKsY/Zk=
X-Gm-Message-State: AOJu0YzWSbzQ0lZh9gdTSkS6s8/fJwy6HDl/WlzIb404F58+9QObZQFU
	PoKEKwmWD6Q6B0Xsf7OTZpJLbG24tkN3D7ocKlJ3BQyDsDmQmdf4
X-Google-Smtp-Source: AGHT+IFhR6wXKYVJPy9dz+zWqOXpE2lauzhnAJp1D41g6UvLG42BZPLhgq5ODjo9utaXK51miT15Dw==
X-Received: by 2002:adf:ffcd:0:b0:367:9791:2939 with SMTP id ffacd0b85a97d-367cea6b804mr1603691f8f.21.1720533494785;
        Tue, 09 Jul 2024 06:58:14 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm206311405e9.7.2024.07.09.06.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:58:14 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:58:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240709135811.c7tqh3ocfumg6ctt@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
 <Zow5FUmOADrqUpM9@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="hpogfizkbgtmf2d4"
Content-Disposition: inline
In-Reply-To: <Zow5FUmOADrqUpM9@gmail.com>


--hpogfizkbgtmf2d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Breno,

On Mon, Jul 08, 2024 at 12:08:05PM -0700, Breno Leitao wrote:
> I thought about a patch like the following (compile tested only). What
> do you think?

To be honest, there are several things I don't really like about this
patch.

- I really struggled with applying it in the current format. Could you
  please post the output of git format-patch in the future?
- You addressed dpaa_set_coalesce() but not also dpaa_fq_setup()
- You misrepresented the patch content by saying you only allocate size
  for online CPUs in the commit message. But you allocate for all
  possible CPUs.
- You only kfree(needs_revert) in the error (revert_values) case, but
  not in the normal (return 0) case.
- The netdev coding style is to sort the lines with variable
  declarations in reverse order of line length (they call this "reverse
  Christmas tree"). Your patch broke that order.
- You should use kcalloc() instead of kmalloc_array() + memset()

I have prepared and tested the attached alternative patch on a board and
I am preparing to submit it myself, if you don't have any objection.

Thanks,
Vladimir

--hpogfizkbgtmf2d4
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-net-dpaa-avoid-on-stack-arrays-of-NR_CPUS-elements.patch"

From 00b942829ee283baa602011a05b02d18c6988171 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 8 Jul 2024 11:57:33 -0700
Subject: [PATCH] net: dpaa: avoid on-stack arrays of NR_CPUS elements

The dpaa-eth driver is written for PowerPC and Arm SoCs which have 1-24
CPUs. It depends on CONFIG_NR_CPUS having a reasonably small value in
Kconfig. Otherwise, there are 2 functions which allocate on-stack arrays
of NR_CPUS elements, and these can quickly explode in size, leading to
warnings such as:

  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning:
  stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]

The problem is twofold:
- Reducing the array size to the boot-time num_possible_cpus() (rather
  than the compile-time NR_CPUS) creates a variable-length array,
  avoidable in the Linux kernel.
- Using NR_CPUS as an array size makes the driver blow up in stack
  consumption with generic, as opposed to hand-crafted, .config files.

A simple solution is to use dynamic allocation for num_possible_cpus()
elements (aka a small number determined at runtime).

Link: https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 20 ++++++++++++++-----
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ddeb0a5f2317..c856b556929d 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -931,14 +931,18 @@ static inline void dpaa_setup_egress(const struct dpaa_priv *priv,
 	}
 }
 
-static void dpaa_fq_setup(struct dpaa_priv *priv,
-			  const struct dpaa_fq_cbs *fq_cbs,
-			  struct fman_port *tx_port)
+static int dpaa_fq_setup(struct dpaa_priv *priv,
+			 const struct dpaa_fq_cbs *fq_cbs,
+			 struct fman_port *tx_port)
 {
 	int egress_cnt = 0, conf_cnt = 0, num_portals = 0, portal_cnt = 0, cpu;
 	const cpumask_t *affine_cpus = qman_affine_cpus();
-	u16 channels[NR_CPUS];
 	struct dpaa_fq *fq;
+	u16 *channels;
+
+	channels = kcalloc(num_possible_cpus(), sizeof(u16), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
 
 	for_each_cpu_and(cpu, affine_cpus, cpu_online_mask)
 		channels[num_portals++] = qman_affine_channel(cpu);
@@ -997,6 +1001,10 @@ static void dpaa_fq_setup(struct dpaa_priv *priv,
 				break;
 		}
 	}
+
+	kfree(channels);
+
+	return 0;
 }
 
 static inline int dpaa_tx_fq_to_id(const struct dpaa_priv *priv,
@@ -3416,7 +3424,9 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 	 */
 	dpaa_eth_add_channel(priv->channel, &pdev->dev);
 
-	dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	err = dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	if (err)
+		goto free_dpaa_bps;
 
 	/* Create a congestion group for this netdev, with
 	 * dynamically-allocated CGR ID.
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 5bd0b36d1feb..3f8cd4a7d845 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -457,12 +457,16 @@ static int dpaa_set_coalesce(struct net_device *dev,
 			     struct netlink_ext_ack *extack)
 {
 	const cpumask_t *cpus = qman_affine_cpus();
-	bool needs_revert[NR_CPUS] = {false};
 	struct qman_portal *portal;
 	u32 period, prev_period;
 	u8 thresh, prev_thresh;
+	bool *needs_revert;
 	int cpu, res;
 
+	needs_revert = kcalloc(num_possible_cpus(), sizeof(bool), GFP_KERNEL);
+	if (!needs_revert)
+		return -ENOMEM;
+
 	period = c->rx_coalesce_usecs;
 	thresh = c->rx_max_coalesced_frames;
 
@@ -485,6 +489,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		needs_revert[cpu] = true;
 	}
 
+	kfree(needs_revert);
+
 	return 0;
 
 revert_values:
@@ -498,6 +504,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		qman_dqrr_set_ithresh(portal, prev_thresh);
 	}
 
+	kfree(needs_revert);
+
 	return res;
 }
 
-- 
2.34.1


--hpogfizkbgtmf2d4--

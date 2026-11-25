Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598137;
	b=LcPC0a4evVkpuZJPU+h0ka2o7qY75h/hcog3L5r2qrjRfwtKJ8+DFRbvl2Ff1YuJyW4S
	 lNSTY3d727XMgzgL2K7T4y65KQig01dXXFDQEFoF8C+TE/7G6AMBYWNT5Xf5QmeKOrCgK
	 n0GX5F+uv1B+S7vqI1e7RSV4K+cv/aKUsqekpKXpF+57cBVjAbvbORk3mucbilOENTOAf
	 1tpmo7FKIcnOPPMQbWBfWkZ9+tgxNTEuHmUEP23MQzgsmHvPVDogHFjLdSQKgBHh7gqed
	 UiEq47amz/RVfH+hN20ILnusR9lHbam4E+24RJcEtIue7JSlB+ONLPaDB9TmWzF4I0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598137;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hrRNPDtfKveUVTbNFVJLmLTa2pRjc1jDU56urNIEi8s=;
	b=Ke2W+ffwQ7dqs0c5Ma6X5F+b5XitHHno1hZiuB7lVFTQZWFDi0uz6NNRQ7TGwQMZJVDI
	 aRlRXHrhB/Tlfikg9z4nPn0QSF4vvy3thd3AZxjGH1l3GN16RDLrLVv/Vmb09nbZFxwxS
	 i0uQMBC7Nf7DelTAV8w/eUwgRKtyMCKp+Qf9tpo6dSgJqIFiVx/I41MwU20pYQo3nfc2b
	 yEeqX/4lFKoRuHjUYNvE2N3ahV/gBxxZITS04yNfFYJYq2Fn4LaqjcEoOsA2LxzljJojK
	 GqprrYE/q8zhzUJqUjxcjzRgqcJ4i1jgSBx99Ucu9PaniKBie+V4s6ZQs4Ui6pXUAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q9MDgEBo;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181C606A6AB
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3181C606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q9MDgEBo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795598131; x=1827134131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KWUqYV/VElJh+cNTl52WHVcIId83hNA9U9VjdH1qPbw=;
  b=Q9MDgEBocrPWaQ/0Eh4Wzq3aQHLGTffJ9+kbYQAFoi8Gmr4KYda1GnAF
   A2nd8UOb/GkBIaPPQqFDV3AMx89BcPR4Ct4Qc21yAVVMQ74hc6i1ge6Tt
   ZvFaqNNzQIdEf3MPAHYd2hSunvh1r6NYgMGI7ewAdfzMiHTufEnRu53y2
   0+eOhzQRIgt9QmK3f8d6kSlgUx6CYNkIzzhmyRbz0IcIRlPz9PEC6p/73
   WkHrhrwxcyjRkQIzgnRxPvbCGWxIlgBfg3LQeY1FLxwg1AiOalOoin7h/
   9fAUZ34dNK7cOCixZhlYK4OBoe8JLDAwg+iZKd9+dJJfc5rewPkPNdIBn
   g==;
X-CSE-ConnectionGUID: HbbNdfl8TmOuxpoi/e9WlQ==
X-CSE-MsgGUID: ex609EiBS8qGpX3cWZvRSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4467856"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4467856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:15:31 -0800
X-CSE-ConnectionGUID: MzJCY7uwRQ6k2rpiTCYyjQ==
X-CSE-MsgGUID: fta7EKZVTka5p2GHG6fgwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11678302"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 01:15:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 969CC98; Wed, 25 Nov 2026 10:15:27 +0100 (CET)
Date: Wed, 25 Nov 2026 10:15:27 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
Message-ID: <awanL3-lo2mVGVuT@black.igk.intel.com>
References: <20261122045313.18372-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122045313.18372-1-irogers@google.com>

On Sat, Nov 21, 2026 at 08:53:13PM -0800, Ian Rogers wrote:
> hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
> unsigned enum) yet returns negative regmap_read() error codes directly.
> Neither hd3ss3220_set_role() nor output_poll_execute() checks for errors;
> on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
> hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role()
> and disables VBUS power. On role-switch providers without a .get callback
> (where sw->role caches the value passed to usb_role_switch_set_role()),
> reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
> out-of-bounds.
> 
> Return an int status from hd3ss3220_get_attached_state() and
> hd3ss3220_set_role(), pass the resolved enum usb_role via an output
> pointer, leave the current role and VBUS state unchanged on I2C read
> errors, and propagate errors to hd3ss3220_probe() and hd3ss3220_irq().
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Notes:
>     v2:
>       - Propagate regmap_read() errors out of hd3ss3220_set_role() to
>         hd3ss3220_probe() and hd3ss3220_irq(), and test
>         !hd3ss3220_get_attached_state() in output_poll_execute() (Greg
>         Kroah-Hartman).
>       - Add Cc: stable@vger.kernel.org (Heikki Krogerus).
>     
>     v1: https://lore.kernel.org/r/20261119170650.1521609-1-irogers@google.com
> 
>  drivers/usb/typec/hd3ss3220.c | 38 ++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 60d6de9ba339..bdd4eaeca753 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_rol
>  				  src_pref);
>  }
>  
> -static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
> +static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
> +					enum usb_role *attached_state)
>  {
>  	unsigned int reg_val;
> -	enum usb_role attached_state;
>  	int ret;
>  
>  	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
> @@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
>  
>  	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
>  	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> -		attached_state = USB_ROLE_HOST;
> +		*attached_state = USB_ROLE_HOST;
>  		break;
>  	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> -		attached_state = USB_ROLE_DEVICE;
> +		*attached_state = USB_ROLE_DEVICE;
>  		break;
>  	default:
> -		attached_state = USB_ROLE_NONE;
> +		*attached_state = USB_ROLE_NONE;
>  		break;
>  	}
>  
> -	return attached_state;
> +	return 0;
>  }
>  
>  static int hd3ss3220_try_role(struct typec_port *port, int role)
> @@ -229,9 +229,14 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>  	hd3ss3220->vbus_enabled = on;
>  }
>  
> -static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> +static int hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  {
> -	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +	enum usb_role role_state;
> +	int ret;
> +
> +	ret = hd3ss3220_get_attached_state(hd3ss3220, &role_state);
> +	if (ret < 0)
> +		return ret;
>  
>  	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
>  
> @@ -250,6 +255,8 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
>  
>  	hd3ss3220->role_state = role_state;
> +
> +	return 0;
>  }
>  
>  static void output_poll_execute(struct work_struct *work)
> @@ -258,9 +265,10 @@ static void output_poll_execute(struct work_struct *work)
>  	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
>  						   struct hd3ss3220,
>  						   output_poll_work);
> -	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +	enum usb_role role_state;
>  
> -	if (hd3ss3220->role_state != role_state)
> +	if (!hd3ss3220_get_attached_state(hd3ss3220, &role_state) &&
> +	    hd3ss3220->role_state != role_state)
>  		hd3ss3220_set_role(hd3ss3220);
>  
>  	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
> @@ -270,7 +278,10 @@ static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
>  {
>  	int err;
>  
> -	hd3ss3220_set_role(hd3ss3220);
> +	err = hd3ss3220_set_role(hd3ss3220);
> +	if (err < 0)
> +		return IRQ_NONE;
> +
>  	err = regmap_write_bits(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
>  				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
>  				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> @@ -501,7 +512,10 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto err_unreg_port;
>  
> -	hd3ss3220_set_role(hd3ss3220);
> +	ret = hd3ss3220_set_role(hd3ss3220);
> +	if (ret < 0)
> +		goto err_unreg_port;
> +
>  	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
>  	if (ret < 0)
>  		goto err_unreg_port;
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 

-- 
heikki

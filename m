Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187178;
	b=dWTn9yIItpY5BGKuT9TGG9Ajs3M+XV/HZnxW6fxFTafesn+iOXod5J+h/wWkS+WBh08P
	 KPfmGz48FMozuu0D6nCyER8Qyi7uqqpHc33LcLsjYrxEL7pwde+J15XteE7c19eluVWcW
	 Ihslwb0VVnJgeQJfUG9evKf2JirXqWKlLSuWkdp4wDskw8Qga7zphis76lUZYcFsFzovv
	 EmLZob7w0FwOkr1vPMrhjvsFmLHm0j+jdOcHnn23N2Hep7kcd7r0p5DgC1uHZONEqaiOH
	 GikVT6uHfafDQ4KHuGPaOnMes5MuiPRSFlYWEv7Xr15CGRBzcEgHKpE6xddxY1QYicA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EAuWYfFjbXXdRKGkMUFxtHe0TJlcXwp3sYIp4VPcpKc=;
	b=Ko/szu3cIj+mrpybF/xzMSkbqnRj5aYXm2l5lxjY0qcNcgiHbSQnaJGRFHdrtF4nQzFX
	 7gjNKhMXOUgk0VBis2s/swxbexyfdCmtzxRA51rKjlUBM8tLfj12KRIGx6recL/jw02EK
	 8MxL5iG106beQ7FOEDhCmtmOKEERCZbtxZN0rlZ+HwuAMZl1kQeTXbyPyxYcCaxfM78Au
	 P1ivdUR8/x9+6lq3q4hD2huzvToyWSYF+Hc1x4Us0JGpCDbfke7sp4DhQT29PcK7fS9IB
	 qDbOf64u6kpDPTNSo7ylzLEb2w2p8m+lm4Uvj4kIQsdTVOzS8oryYoTa6v8R7D1qlZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2Kkd8fx;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF9606A325
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 15:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EF9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2Kkd8fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187177; x=1826723177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HF/fhKFXWR+yqPn0rejXIeI42zfVDMjdRvsE+UApABE=;
  b=S2Kkd8fxBU0KtIhDO3CKvXe3DT8E4xoste2tlrFin8K5NxKrQUTOCJLj
   yYeE806AvW/xaDz0oYhi2RSUZkk/jQZBzpq/4dNU3Tq43RgaBdRLwAZVa
   iEYdWT/uWOJkFg4kvQY9YgsOiaoyGGn01+FlWJKgkcJGL4lPw9rg9vmNJ
   9ZPKJcWBqv54mfkjis2wfMuaJ6cCujzbenoBeHzKOX3E+uiYVtsAWOPYz
   Svpj2aj0F97JyNs2TNke1vS6NU/eCC6CD+7kngCPnpeQiM6AX7PdFKXND
   OghTOYPMICTrJvAEqahfZZfATEVEiKwjNQIepzWtbHthgbkzQSeQ6r8v5
   g==;
X-CSE-ConnectionGUID: 1JTmg0J5SGGtu4rAYw9LxA==
X-CSE-MsgGUID: Hcn0MI5+TTSPmCL8eregpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4108600"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4108600"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:06:17 -0800
X-CSE-ConnectionGUID: QBC5tPAkRS2xjJdTSVRM9Q==
X-CSE-MsgGUID: QHE77ujPRVq+PEwtDmHPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11050941"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 07:06:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7A0DA99; Fri, 20 Nov 2026 16:06:14 +0100 (CET)
Date: Fri, 20 Nov 2026 16:06:14 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
Message-ID: <awBh5m0bWIgf_eVO@black.igk.intel.com>
References: <20261119170650.1521609-1-irogers@google.com>
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
In-Reply-To: <20261119170650.1521609-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:06:49AM -0800, Ian Rogers wrote:
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
> Return an int status from hd3ss3220_get_attached_state(), pass the
> resolved enum usb_role via an output pointer, and leave the current role
> and VBUS state unchanged on I2C read errors.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Signed-off-by: Ian Rogers <irogers@google.com>

LGTM, but no stable?

Thanks,

> ---
>  drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 60d6de9ba339..212c3624961c 100644
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
> @@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>  
>  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  {
> -	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +	enum usb_role role_state;
> +
> +	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
> +		return;
>  
>  	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
>  
> @@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct *work)
>  	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
>  						   struct hd3ss3220,
>  						   output_poll_work);
> -	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +	enum usb_role role_state;
>  
> -	if (hd3ss3220->role_state != role_state)
> +	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) == 0 &&
> +	    hd3ss3220->role_state != role_state)
>  		hd3ss3220_set_role(hd3ss3220);
>  
>  	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 

-- 
heikki

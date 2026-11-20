Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190725;
	b=QouJIgXA1NtSZQE9KlrE3us5bdLyT8orCQBJ9aEQ13CETttNDpjBG5ewg4KbXqU3+mty
	 34KjVF6JGzx1dBywg9wgWSqz1V0/nDup2IumKHeYUq64W8mBn2CTdOAI08n+tZyW+SU0d
	 59dAdVGmc/KyPC4fNKW0yKTnOGFCaKyJDI7YDk+Yv8Ec0cxZyEKvhbuGu9UGbh0V/gwr0
	 n/em/jqXlATerw63I7lmExnuRZuFE6W57SxeZOsc76baR7PjoL3vatgUfMApNsv4tYjR7
	 32iKH8mUjGjF7NrYlkTu4reN44zkjJMDntn2a/H3GcoIntwDsr+ziInOUSyHcZb8uMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190725;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9yBDWs9CMXbwkeV0/alYjRwMOzQ4HOenMYbfzoVJEGA=;
	b=uz8jO5QmrBRCRnQ0P8uwPkW3I7iMUqxHYwcJPPfUj+6uWuVrc7qAs50XAsbZ6WjB4LKO
	 Yx8ECcsP79V1GDOJD/vwSe9pKiUQJ/Vz7/QIBzT/IAJZjSGth1qyQwgleUAiAbeNbda0m
	 LDX4dqNSiQwiXkSWZhCspnkeTG0yE/458Vf/ZkXO+QEht4gAWhZ3einH5ygAO+8jPLeUi
	 lH/RAo9KOT5+56+Lf58uqmOPu/jW6C8YvQW8yjMLKGOvPHmd0l9knj0GIEkXWMASdcUHI
	 EW5UcSClw5yOdbVRzpQ0Nu+MUgUtm7Od7oefDnBct7aFfEgZJJ6NHk+z+1SpBow9/9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="S/VHkulp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7CF606A32A;
	Fri, 20 Nov 2026 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S/VHkulp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056541F0093E;
	Fri, 20 Nov 2026 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795190724;
	bh=9yBDWs9CMXbwkeV0/alYjRwMOzQ4HOenMYbfzoVJEGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S/VHkulptksunPQfeERGHooh8WSqe6HjOnYVGcaXtmSuL3k2pyp1pRjXW08g10JM7
	 2yQd43fvhoyf5C1rTlrbWcznb2Cn0Vd5As2QO9L3VWeTKv5a5QrbGHHAUj1M8ykqBU
	 brZuzbL0pZ81E1o30YYXocDWk7OkbSgC/2B7Gtw0=
Date: Fri, 20 Nov 2026 17:05:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Rogers <irogers@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
Message-ID: <2026112003-dreamlike-tricolor-f055@gregkh>
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

No error propagation backward?

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

Why test for 0?

thanks,

greg k-h

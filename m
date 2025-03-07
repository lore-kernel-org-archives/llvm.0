Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1C21B8EC;
	Fri,  7 Mar 2025 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741357358; cv=none; b=Kwa92HJAnMlGeguv8HYO1O3yfIqcrClwwxRWS/6ujYrmY6qj4lUpvlEUwL+hd9UcvQW/m0OUu+1XU6zKUkKyU+nSAVwLuSppp7gDexbZTpiOJ8uq3E14B5Id6pvIi+g620EvLzuQcMt4z7qKI9KDBvKj/w0xpHuBpK8QLp67DWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741357358; c=relaxed/simple;
	bh=t8WacfqO9bf4YHYgPU3DznP16OUNb9spi6ccczBLIP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkthfOWR9/BGZLoZHWnPHmwmV16atC7JWHw+FhK4Sgu9odmBfCCKyTr2ioNs5+BNuj5mJpG2s4Twsd3996AbWkyox83euLEK43JTqVlae3Iwbqz5Qx8Ed2tAF6DMr0l8KqX66jPZZM5Tgp8+GBpJzZQOpF/8NP4SEXvJsuiooSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1o4hU5yZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1o4hU5yZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB766C4CED1;
	Fri,  7 Mar 2025 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741357357;
	bh=t8WacfqO9bf4YHYgPU3DznP16OUNb9spi6ccczBLIP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1o4hU5yZnXyAa1uHsko5DnzTUG9ARqdgdTDtjr30cAw1oqpxA4zQpm2qM2YeGaAJ3
	 RiqM1S7N9SMSZFItZyEN/wF4FFFoNYOyasTS4XxONKZ14jrVRPDYHv/APQp8xnQKNm
	 6TZkFT3zISMxE4UGw36wIrgYJ3qdGWAzWp2fV/Gs=
Date: Fri, 7 Mar 2025 15:22:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Puchert, Aaron" <aaron.puchert@sap.com>,
	Marco Elver <elver@google.com>,
	Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <2025030700-research-pueblo-87ef@gregkh>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
 <20250307125225.GP31462@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307125225.GP31462@noisy.programming.kicks-ass.net>

On Fri, Mar 07, 2025 at 01:52:25PM +0100, Peter Zijlstra wrote:
> On Fri, Mar 07, 2025 at 09:52:04AM +0100, Peter Zijlstra wrote:
> 
> > Yeah, so IIRC I once proposed a guard that takes a NULL pointer to mean
> > not take the lock, but people had a bit of a fit.
> > 
> > It would've allowed writing the thing like:
> > 
> > 	{
> > 		guard(device)(parent);
> > 		device_release_driver(dev);
> > 	}
> 
> So the below does compile... Greg, how revolted are you? :-)

Eeek!  But why?

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 5a1f05198114..7c95e7800b89 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4796,33 +4796,30 @@ void device_shutdown(void)
>  		spin_unlock(&devices_kset->list_lock);
>  
>  		/* hold lock to avoid race with probe/release */
> -		if (parent)
> -			device_lock(parent);
> -		device_lock(dev);
> -
> -		/* Don't allow any more runtime suspends */
> -		pm_runtime_get_noresume(dev);
> -		pm_runtime_barrier(dev);
> -
> -		if (dev->class && dev->class->shutdown_pre) {
> -			if (initcall_debug)
> -				dev_info(dev, "shutdown_pre\n");
> -			dev->class->shutdown_pre(dev);
> -		}
> -		if (dev->bus && dev->bus->shutdown) {
> -			if (initcall_debug)
> -				dev_info(dev, "shutdown\n");
> -			dev->bus->shutdown(dev);
> -		} else if (dev->driver && dev->driver->shutdown) {
> -			if (initcall_debug)
> -				dev_info(dev, "shutdown\n");
> -			dev->driver->shutdown(dev);
> +		{
> +			guard(device_cond)(parent);

This is just so subtle it's scary.  I don't like that.

> +			guard(device)(dev);

This is fine, but really, why is this even needed?  None of the code you
are indenting here breaks out of the loop early, so how/why is this even
needed?

> +
> +			/* Don't allow any more runtime suspends */
> +			pm_runtime_get_noresume(dev);
> +			pm_runtime_barrier(dev);
> +
> +			if (dev->class && dev->class->shutdown_pre) {
> +				if (initcall_debug)
> +					dev_info(dev, "shutdown_pre\n");
> +				dev->class->shutdown_pre(dev);
> +			}
> +			if (dev->bus && dev->bus->shutdown) {
> +				if (initcall_debug)
> +					dev_info(dev, "shutdown\n");
> +				dev->bus->shutdown(dev);
> +			} else if (dev->driver && dev->driver->shutdown) {
> +				if (initcall_debug)
> +					dev_info(dev, "shutdown\n");
> +				dev->driver->shutdown(dev);
> +			}
>  		}
>  
> -		device_unlock(dev);
> -		if (parent)
> -			device_unlock(parent);
> -

So we save 3 lines?  Again, feels like total overkill.


>  		put_device(dev);
>  		put_device(parent);
>  
> diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
> index ec00e3f7af2b..bf72fec6f99b 100644
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -300,7 +300,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
>  #define DEFINE_GUARD_COND(_name, _ext, _condlock) \
>  	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true); \
>  	EXTEND_CLASS(_name, _ext, \
> -		     ({ void *_t = _T; if (_T && !(_condlock)) _t = NULL; _t; }), \
> +		     ({ void *_t = (_condlock) ? _T : NULL; _t; }), \
>  		     class_##_name##_t _T) \
>  	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
>  	{ return class_##_name##_lock_ptr(_T); }
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 80a5b3268986..4e7ebbb7fb64 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1046,6 +1046,7 @@ static inline void device_unlock(struct device *dev)
>  }
>  
>  DEFINE_GUARD(device, struct device *, device_lock(_T), device_unlock(_T))
> +DEFINE_GUARD_COND(device, _cond, (_T ? (device_lock(_T), true) : false))

As I really don't want others to be calling this, worst case, just put
it in the driver core C file.

But again, ick ick ick, I worry this is going to be very subtle and
cause problems over time.

But very cool hack :)

thanks,

greg k-h

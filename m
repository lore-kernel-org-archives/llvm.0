Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DC3E3C50
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041695; cv=none; b=kNLJ2C7npUAgbMUuxblYrtsIazeOssQayMg40p5ooz5N/+W0wuRo1X2E4n94k2h1eDXHANXWxIjKucvExlqA2hfHuhBwbK0CYV6uXmd+O2hoU4bahd/aThkNRvlrvuYbMx0k57Vdqt1ehvp/Q25Hyh1uTC/ZGZD+wTqc546iV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041695; c=relaxed/simple;
	bh=fT+Id2LA74s+kmxJ2r3rEYU7QJ7EFtpYf9vc/1kTxZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNrvToDEKvvep8PZtbISkCUqYil8KUgaslN5Cw8fER4O98dgwUjIT9c+hekQLmjeQyCDpkGqtbbii/719R/4Bcnhu2SQ5YMO38pcsF5vrTpzA7/Y1gGthdiKXBh9KFbcxiAJpF6T04EOPA9ZFVLVlp1rPphCtitAQB/zTLfNpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=AdLcoK9d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sMlwvS3T; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="AdLcoK9d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sMlwvS3T"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 3688E1300CC7
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 01:21:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 15 Oct 2026 01:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1792041691; x=1792048891; bh=YZbXf8XMHi
	MYDDe4CyAaIrQ1ZOnpEZtXM5Qp9HfiN1Y=; b=AdLcoK9dMpoRAJNea6yrKCITSv
	O2qWtAhjjSLfwZggoB6ei4EBSZGSCI4iYEiS2AHlz7IWpsyURPvJxT8zr3nL/NMe
	NlnGZVeSw1Zjg72Sjc9rDb44U8pWdqRUXH9GP501Y52wpjx0I3Q58+p0BCpQbaTM
	wk0abjowaYYUwHWiC9fNdwUmLkn/5UqYvM599+HkrO+9gtKu7JNo06H+PcbwemxV
	Ymg1Pyzov++NKDoujH4MPnC/mNqMyM7qiaJWWBN1eMo5GJ0OVIbIxiWPHZ/g66s2
	xvLamBZC3/GRLU+ZZD7ejCOMk/TQFGf5XjuwdDYOAPgS0tM7mx5XlH9523NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792041691; x=1792048891; bh=YZbXf8XMHiMYDDe4CyAaIrQ1ZOnpEZtXM5Q
	p9HfiN1Y=; b=sMlwvS3T1qO/lPAf1RchbwPOK9KdNVgQ4aKrkIgKErmyrFZLKhI
	r77yCruC7m2QdzQaEvWMbI+hcDg2C1qIvw9wZwQWvgPGe8Thivhi7gyyhjbsqt1y
	G7JuE5ZT1xULOQLxGGJy9mWvSJcRerMj2rY1BnRczYTS81THSVfssHyIxHywn+VJ
	+SpjYfzk6kb5uQTYrH9do0KQhjhCek0OtcYU8sPKjHn2jQDF1JO3+h9E9dCn0Lj/
	JZaW6xFzQJ7DSWYiBYaMd1oR0M47TuTvjxvzWTroliXqWgsdxqCm2g4sMCrUgRrW
	0o10v7r557nDTTRfb6rdw1VxbGaCRMBmp/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792041691; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:VbyBDSwkIY+hKheJu0GvtFLU698DYKP3s0kZFmU76o3yBNJ
	TqZ3ZI2NXgVckWfx0vvUT0+VoWCON8FBKfYKyAhWCnYgCLQ8ivHzNAfpL7bextO8
	0TwKfLkMQrD98ivlR+5W9jV+1B4Yi68uY5QVAB632F/vSEuc4+psRDH9CsIDe4r5
	hCMDXbU92XzMTLkZ4yFGnBrK2CS8ZXZezltUy7DU0tYW39x8M9ZyjOIr8waOgHfa
	5LJPnR5CWQAjYz3rCl84X1Vx4bax52xR86fmuR5hle1MjOQfrM86SLD6S0GvdoMZ
	vl3HUyzsRm95rYpMahuEUsIeJMGqY5RWQ191VBA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hf9AztGCgIRnregB6E6yn/9k05lnr1mC3auL3T/Ps8g=:fT+Id2LA74s+kmxJ2r3rEYU7QJ7EFtpYf9vc/1kTxZ4=;
X-ME-Sender: <xms:22LQaoctltF2g0XaJmXad11XIXqcrOVXElcGG3OxJQ14AnIjDAXa8A>
    <xme:22LQarb_b3EyeprQ9rkTc_GwYRM8WB2tJKXAJLEnFINvvcnNpqHFTlvC6ReXy7t-L
    a52OHEzZi7i0eqkAvBVxncF7kFMROHjLOPJt0tl9TO2X_UPYxc>
X-ME-Received: <xmr:22LQap9O8GD3F5pCi_3NSxY6E62q-5uUe4McD4YCYFOMn3mRAnt5LFhs5GfgnrWSLj9W5ovfyj1fSkVLtZv6nDA8ohjs62TNWRNoumQAT8w>
X-ME-Proxy-Cause: dmFkZTEijNWx0cSRy+etHUy1Usc70/NSIPvkJ5iC/hOONowf61UWNZoFG2yenVsGW3xUdm
    OuOrBTQH9C1zt8QTb3VyZLYiXR8cIZ5kUyG5tijMhlA8jkk4gq5L4NjkzEdquFndv48208
    ltG2exExMojOk2ZqCqjwN7ICcgjxGcen1H123fzvNF1WToix1u8u4TGVs+/bVbJKUAUKro
    jVd9MhBj8QjgEd2TEUfwzegeuZHv4KugbkGtnhjkRPZtbGrQUgmiRxmHQrW5z1N6N5deHK
    bSt21eVraH67bjTMAuWSCriT+VkletTYOl5cj1stZcI++yDd9EcLFsBDplzCkoq6Acm1R9
    YSccsQq0p06t13unhafYhu2LvHS7xZViO29WAMoTQl4pwdwuekbxDmQDzyS8u7Hq3kwMy4
    RxdXV6sURH0Mvk8FyOUG3EvdPmoZBb7XTud51WAo1bF2RNu1Cirly3t7FPriS7y8GKD+kf
    Vex4zvo691tj02ZAT0qxKw+o9o4/qhVlSW9a+/K+Z0jaxkYwqwIzlUZsbs992Unt3SFWRq
    X/ueS4JTYy15MrSOPb+2q4me3QuaRwYPJm6Tz2WR/J4u94O0nKqc7bxWvZNzqHHCBc3f9e
    HOHEDLmGrqWBS6N73obzaSsTKeEr4Z8uFcCZMMhzNejiBO9oxyn+wesS7peA
X-ME-Proxy: <xmx:22LQanXX0wXFRKFwqKEZ46QBqrpYELJE6O1VuzrE1ay85L1tY2ZUdQ>
    <xmx:22LQaqdCBxFwOnkcBdBiRtFdEXr8lv5CsWgXD4YuQP0HTjX6v34l9w>
    <xmx:22LQakVL9Xfu6e7z9cCnx1-xps3JoZnXFgNqF6FRkj7b0VhCEQqThg>
    <xmx:22LQapVog6mxBmXINzHvRfb6IONAnAxsMncbGpvkUdzAFLvezTt4_A>
    <xmx:22LQakLQlcWi2uU3GotSxqN0eug_7XzPWHq0GzpQmnNwQTI4ZME3YDqe>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 01:21:30 -0400 (EDT)
Date: Thu, 15 Oct 2026 07:21:28 +0200
From: Greg KH <greg@kroah.com>
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct
 seq_operations
Message-ID: <2026101517-profane-opponent-4523@gregkh>
References: <20261014225811.i.852-kees@kernel.org>
 <20261014225818.3457479-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014225818.3457479-2-kees@kernel.org>

On Wed, Oct 14, 2026 at 03:58:16PM -0700, Kees Cook wrote:
> In the very unlikely chance that a seq_operations didn't get initialized,
> we wouldn't want them calling some random location. As a first example
> user of __require_explicit_initialization, annotate them so a missing
> initializer is a compile-time warning.
> 
> Every seq_operations in the tree already sets all four, so no new warnings
> are added.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  include/linux/seq_file.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
> index dc0e8c62d9e0..f0e7e52a0905 100644
> --- a/include/linux/seq_file.h
> +++ b/include/linux/seq_file.h
> @@ -28,11 +28,16 @@ struct seq_file {
>  	void *private;
>  };
>  
> +/* All four are called without checking for NULL. */
>  struct seq_operations {
> -	void * (*start) (struct seq_file *m, loff_t *pos);
> -	void (*stop) (struct seq_file *m, void *v);
> -	void * (*next) (struct seq_file *m, void *v, loff_t *pos);
> -	int (*show) (struct seq_file *m, void *v);
> +	void *(*start)(struct seq_file *m, loff_t *pos)
> +		__require_explicit_initialization;
> +	void (*stop)(struct seq_file *m, void *v)
> +		__require_explicit_initialization;
> +	void *(*next)(struct seq_file *m, void *v, loff_t *pos)
> +		__require_explicit_initialization;
> +	int (*show)(struct seq_file *m, void *v)
> +		__require_explicit_initialization;
>  };

Hm, I acked the first patch, but seeing this "in the wild" is
interesting.  Feels kind of ackward, but I don't really know what to
suggest instead?  What about just making the lines longer:

	void *(*start)(struct seq_file *m, loff_t *pos)		__require_explicit_initialization;
	void (*stop)(struct seq_file *m, void *v)		__require_explicit_initialization;
	void *(*next)(struct seq_file *m, void *v, loff_t *pos) __require_explicit_initialization;
	int (*show)(struct seq_file *m, void *v)		__require_explicit_initialization;

?

Anyway, I don't know.  I like this feature, and maybe it's going to be
used so infrequently it's not a big deal, but feels clunky.

thanks,

greg k-h

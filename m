Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1772935C18E
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525212; cv=none; b=WsyZ7o1n27hFFYZL56HzJOFHsEQqVjlDOBSSYLFXOXi30LsEmbRVA2C4j3dgAWJNiIQXDqAjwg/MQu9cpD4Xt5lbxIJzI9zoQ6Tr1A3IHwy18wjUMYA4ICM8YQfFgLyPm29cILcgS7Gv/3hpxCNas0TNWSLk6B615XgyiwwRUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525212; c=relaxed/simple;
	bh=9RKO4nU8rGrY2rJzToXBwy7qqyRg6VuRq1QFDWuUt8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONwC3aPzC6n2Q7ZjEKGdvveG8jbrc6Q6EPTkWqDmfSHxWgVM+mPQh2ROuZiPsPDaUfd3ehCFQ4RpgPTJdl6tc0Dx9G9VMQX9PYCzAou/Q/niX2x3w9R3jw9lK6vJdGCiJ0+vZxXbWb3D6fzXtof6Z1R6lhY1jxz/Mihp4+WjUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=exZxKMUe; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="exZxKMUe"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6610c5b014cso2784514eaf.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769525210; x=1770130010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tb2f1vtujh1yFSAc7vww/wAqd7C0+upyJOHXMhwugE=;
        b=exZxKMUeCENKbfug77PqGqPdW/ojQpifd2BzSwAqHrE8aQWFwE6NO70W8lNC/KM+jK
         rkX0/yDBAoiHrmuiIQFhRUTFM90HHXd8W+fxY20HKtYYb5p74vbDiTZQ83KBywkgjx85
         gdlquNYXd++KzZtzutDL8SKN/CmjKIZoKrBhBSPmr64B3PrFAG4wtDFFd147kJE5w4KL
         yQzEE5vZnE0Xf5O+B7iCzpYqPStcBwKaEt4JaKgUjkmYX768JTrB/FNFPaQfamvOaHSz
         MRZkZNJo3ajZWVc+Rku1nk6VxBYMX9HZYMckb/9l8ZYPhZq9T7WXPz+Tddri/rvNF1tK
         wqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525210; x=1770130010;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tb2f1vtujh1yFSAc7vww/wAqd7C0+upyJOHXMhwugE=;
        b=VAx45DoApKT7m5IMbvkFcBapOM6fxSENDzwMqo5XyGGmqy0OP15WyYq3OveDzQCp8z
         y1j4IviTXZ8VueBEylMDShMcacPXkolTpaErSQq0TVB4ET8elphyLqwmM16DX039evbk
         KXZxFL7JO4wcp4KkuI9cCoKvIk/JwNW8+Oxy2h0GiT2XTp83ic5Rr4FId8RUv/2kss/N
         BZGZ64JGjtSrL4PpErip22o5EXl6BFLXorBulVmugAjm5IPyary0WHj9WcM3GCymf8DY
         XDhTAah8SBhXxoVWpJBpbljpxCLhdxhMnbtSC6ubhlWfdJyUB0A667VDPyJ1+LQ+Ojks
         L0rA==
X-Forwarded-Encrypted: i=1; AJvYcCVS0EsheNAS3/9LseBMH2ovY/LY7NqrkuL1U7OACe74CrEHIC9nzuZ5SalW81lhc68J7Dsc@lists.linux.dev
X-Gm-Message-State: AOJu0YypMSn1Eai2yH9nQ2n776ivVesngir84Hr11NgHcvCaBac763SI
	Apfp6jsMGxIo1JeZbLvpijeJb2Gwfi+rYNc48MRL3WIHU3E+0oz9MWwbfdQgu3p1rFE=
X-Gm-Gg: AZuq6aJXSsdYotIWohey6bBnqD81Q3huI3/S401lfJEew8AYYHGaf69ON8U4Kn2tLCz
	/985GOS9sHVQDCEPrMfKpU/V2+cb/NvcfLTLwqL5k+zFa9UkfKgTzn3cTQQ9nkq7iNAXoVXs8cW
	mvdCgL0Lt03pgdFfl7Rn8s8+RoxHlvXCusP6cc522ckC2BTg/GHZzQpooV8YtW7x4IJZM04cIpC
	rArV2z+Z1wj8VCtuo/wMf/8kVsHDxhR4HrPfggukH9tJe71aiGY9El9/KWm/RGONkj05Hx4uwd1
	Bu6t/P6gAgsDNV1b+fjfYqmjCUpZbmrkbTB+VmzVEoiHRZcihS4tWZoeRUWc7a9U6xyMcNlDou8
	ne2jQK9Wh6C/GsL58hhZCWuBEe/ST5BoBPvoJOoPckZYKZE4gHRuFY4blYU+JQWxaV1KNycCeGc
	jHHIQvBtSaetc+ZDSFofVrS1Ezfv2547RvK4kPOeB5TZf61HP81MhHDjGfTRuHSIin4Su6pob3p
	eo=
X-Received: by 2002:a05:6820:1caa:b0:659:9a49:8fb8 with SMTP id 006d021491bc7-662f20d4644mr1237703eaf.49.1769525209964;
        Tue, 27 Jan 2026 06:46:49 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662cb4f29e1sm6739005eaf.7.2026.01.27.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:46:49 -0800 (PST)
Date: Tue, 27 Jan 2026 08:46:44 -0600
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] ipmi: Fix use-after-free and list corruption on
 sender error
Message-ID: <aXjP1Hqsig7Z4m-7@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
 <20260127135917.1597762-2-corey@minyard.net>
 <aXjOK6ff9Va2hiNU@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjOK6ff9Va2hiNU@gmail.com>

On Tue, Jan 27, 2026 at 06:40:04AM -0800, Breno Leitao wrote:
> On Tue, Jan 27, 2026 at 07:54:39AM -0600, Corey Minyard wrote:
> > The analysis from Breno:
> > 
> > When the SMI sender returns an error, smi_work() delivers an error
> > response but then jumps back to restart without cleaning up properly:
> > 
> > 1. intf->curr_msg is not cleared, so no new message is pulled
> > 2. newmsg still points to the message, causing sender() to be called
> >    again with the same message
> > 3. If sender() fails again, deliver_err_response() is called with
> >    the same recv_msg that was already queued for delivery
> > 
> > This causes list_add corruption ("list_add double add") because the
> > recv_msg is added to the user_msgs list twice. Subsequently, the
> > corrupted list leads to use-after-free when the memory is freed and
> > reused, and eventually a NULL pointer dereference when accessing
> > recv_msg->done.
> > 
> > The buggy sequence:
> > 
> >   sender() fails
> >     -> deliver_err_response(recv_msg)  // recv_msg queued for delivery
> >     -> goto restart                    // curr_msg not cleared!
> >   sender() fails again (same message!)
> >     -> deliver_err_response(recv_msg)  // tries to queue same recv_msg
> >     -> LIST CORRUPTION
> > 
> > Fix this by freeing the message and setting it to NULL on a send error.
> > Also, always free the newmsg on a send error, otherwise it will leak.
> > 
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Fixes: 9cf93a8fa9513 ("ipmi: Allow an SMI sender to return an error")
> > Signed-off-by: Corey Minyard <corey@minyard.net>
> 
> Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks, I'll put this into the next tree and send it up after a bit
if everything is ok there.

-corey

> 
> --breno

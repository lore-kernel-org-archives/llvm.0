Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC97471260
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000563; cv=none; b=pKdcbpwiH1OOSdT/DxBbM/MfIQJUnHmqey6Cwnmjk1vJmXa1b2vkd9VE9R3HaQsfvC6ZDoaobkip8rMA4HEsYidH+/HTdKzV2xtt2Yu06UShf/X9Ir7oL6I3stahBp88Dq4ev1c+4Gq2JEi0y4AEM2JiPjsFaezEvOskSOfc6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000563; c=relaxed/simple;
	bh=OBF4nRNWRkXeGvYZgQo5/rE99ZlB0dZCjPG6K+A5+9o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPyJdJv7yCIDhpvWHVJojVR/uOcuCB5tkkrrh2gQv97BQMzOYC4g+Gxt4yNZpES7q7fcbtG84LMq05OMSHvlJ8T3bLuYUUEUWQkCyDCHXLvI7j0knUesY2g5Qyfvp4W3lv5d/inN0Mwi5aJtKRPCG5+z11VETxmHz9UMbURjRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDzHorLN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDzHorLN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980dc26022so39363115e9.1
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000560; x=1787605360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=QDzHorLNFtSW9UuaWl9mgs7Ldl4kAChipKeeSLJuyIWqB1A+qPqKL/y2CffNPuVUoe
         WFhHdGwmI2XtINW7mkTx+LI1uKMnN6lsuhg72gKMVZI58JrVHJ545mLR4TfbP2CQChEB
         MXSWKsZNL4uCv6PeRNa0Sc4x43yma1rLXpKvLc01E74TuRUIq1guRlDTiEDUkk4TPJNL
         6p9SWstGC8FKPhRUFZWGZQzq8ZrVzThgkzq1YyryxmRoD5m9aQ33e4nlq2sF8X4ANSv2
         3ggA44Xv3v0IOeKj39YKrtGt/xbsCkjKAShcgfKjGLCMQ8NKUgzVssG2LnlDx/4ALvPh
         QDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000560; x=1787605360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=idIFrqTiNIeGtR7gxcSw/azggX4IaB2KG3TgIAI6NpGPhEJhh1cbXyg2vX54On5Z5r
         HshORsvR21yzAtYXJcipEFpPTvQPTu/9Gzzk6ij+INK7hgHo7fn/y9/metwnuWZ1uvmR
         O1J8t0qfOjQbwsByl8Xi/jYYwnGlHodbtpAI8JcxEer1LGq09mIrlA/8kbZkpi34yMwC
         SBEQ/czaKr8OgdJcyM3yE1WY86JqPd9yCuvzz1XdIRzv133UcO6YU98vRjv0HRY81HM8
         KHv0/Q33uO5XVt6vSFRuJ9rlzMlzJCKDvWJaG4H2o2VUWmOtu0P3aqpbDTYtVOMF5H65
         HPDQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8eaFM2awK5HMZ1jHHET7sDEk6F5hyAF0UhHotG8aeTCISjtQPvB0/WVshYxY9vYO4ucs6@lists.linux.dev
X-Gm-Message-State: AOJu0YwSK+MFsljgFA7AZVr0ZlxtsWI7cDNHXUEBVdfgJ0O68gbmZvAv
	vsckcPD+0QcoVR8lAP8fcKQXYgHFFGWCReELok9K6Uh0htKSeQuuyDhS
X-Gm-Gg: AR+sD10Nd9c9i4asb5w3HoEXk9vW5k14GIQa1G3zgvg/c2/e9cDcYnO9UQW3z8TPD1v
	PgGu2jk6yLgzT7I2vjh/1xw9JPn3RV0rZcRx3EByRZ4otIC0YvDpULnUJkwXcUWnbwdNzHe/e3o
	XbAitov/AovDAmuyYK2Wike1YAhbyhtVBO1jPgiMpxXtJfQEosOLyWpq90GTK3Agb9fTABUWrW0
	dlXg7XE/ll7LoWvP7jBb0YXZHdnMt0lfse1wkjy1vjSOOlPIIU0nDgi8mLa3KAIQx7YQ5si++5+
	2SqyMUItNpgCF3JNbyplZt0YvFe0f8qs3lDiUnUSVDpgJVTDT+vK8kiLzM+xmJGKKSMELDbj6UO
	Vgx6xjWgrABpEIfkayZvtF4xf1pvr79aMS2xWO7f54dx4cKuUO59/jTjy9hoSzUHG3ibkgN0l7b
	Flql/SSHiQ/Xj56dFUpVg7omTQjAvnUOt9rVmWkqEf4DWZvSAMYsDwdyY9UJ5rMV5ObkbnT2ZCI
	gBtYbvh7fXSKJrNRcFGTyRuwgrALhU=
X-Received: by 2002:a05:600c:8209:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4998796f497mr470360865e9.13.1787000560141;
        Mon, 17 Aug 2026 14:02:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-21-27-15.retail.telecomitalia.it. [87.21.27.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm7050409f8f.37.2026.08.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:02:39 -0700 (PDT)
Message-ID: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
X-Google-Original-Message-ID: <aoN2606mlY7pWZ-X@Ansuel-XPS.>
Date: Mon, 17 Aug 2026 23:02:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260817134727.1f76d6dd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817134727.1f76d6dd@kernel.org>

On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> > 
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
> 
> Coccicheck says:
> 
>   drivers/net/phy/phylink.c:1039:31-34:
>     ERROR: invalid reference to the index variable of the iterator on line 1028
> 
>   drivers/net/phy/phylink.c:1364:26-29:
>     ERROR: invalid reference to the index variable of the iterator on line 1346
> 
>   drivers/net/phy/phylink.c:582:7-10:
>     ERROR: invalid reference to the index variable of the iterator on line 569
> 
> I vaguely recall that you're supposed to make a copy of the pointer,
> not just add a "found" boolean. Dunno if it ever happened but Linus
> was trying to make the list iterators override the pointer on exit.

Oh! I wasn't aware of this intention... I have seen lots of pattern where
the last value of the iterator was directly used (if detected valid)

It's and easy fix... I can send a new revision right away if you want,
I'm already on it fixing this in the meantime.

-- 
	Ansuel

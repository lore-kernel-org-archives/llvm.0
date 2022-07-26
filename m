Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229917A
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 00:22:15 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bp15so23417650ejb.6
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6fkE3E+IwWr/jMUVZLcimgZqvTNf8bUrcGGPFWeGqFc=;
        b=UXiUIlc4jhg/GkpTggAtu/yC1OXku8y/l6jETyO0Y4BEort+Bv2riNeWpduEMGzoh8
         gwpbWbCm2REVlRSrwhOwC2GpT4LhJCpD+W96w/S9zdBjR4HFK/9+4PZ+AM9Uanio74La
         d4zsjFmCNYfmx9ynZz8t1XLKYp/9B0Oqfa5AEZTXMlQdegyXszerZJwTPfw0MCbJScTz
         V5PzSF9VAYVgqtXvBdXKXSFtN7MA90WnN2WAkt2TdCyp10MBMpMmxlgO+DTmuSC9+ub8
         MBL4QEX76fy7/Bt8A6YfqB8pCP8H7iKOfrx3MSejVybkWp9s/TwopSPAAnW6ZldkobAT
         emIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6fkE3E+IwWr/jMUVZLcimgZqvTNf8bUrcGGPFWeGqFc=;
        b=tgrOlvROBsbnzgnQADPXsFy/OSBA1y+jy0Mh67D6rDVumJow9eOsZT9ui3Q4CtceZM
         AgiJNz/S8FaDObwA0IXTLOYjewghl6IlmrQOmwhGJAha1Cu10h9lwnqn4wkX+d+poGyP
         WI56bDp1HxzAk+xhPmveBpeVq0/4z2SdznJGvY+Ic1s/QE5QQIZWH1yM81mhvuvtZ29s
         XlY8GiQLe1EtStF43UQVVGOhpTGPaxQlepKCKuaRHu8U3taJ/LDJm69q8Q4bYnyRpBmt
         mc4KaPrDlGAy3U16m9MwJcMsm85uW3+nHNdx5kiyKY+NrwnYLLZjl/W7SS5OzNSg7JFd
         qWWw==
X-Gm-Message-State: AJIora/eVcufTVNaVV6VnH3A3S+uD8eht7q6bGmgKbq2zUcDlzb1Gunc
	3HVPvmv92h+dS6dzsJ0qum8=
X-Google-Smtp-Source: AGRyM1tGTVY8Y62yWUPM6oQzbeimq9TIf1ic2tZr8yzpO+trzKjRWA956uiZyxbNvxugVfNsdhC7Dg==
X-Received: by 2002:a17:907:a053:b0:72b:3051:b79b with SMTP id gz19-20020a170907a05300b0072b3051b79bmr11497426ejc.690.1658794933431;
        Mon, 25 Jul 2022 17:22:13 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b0072b1bc9b37fsm5855383ejt.22.2022.07.25.17.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 17:22:12 -0700 (PDT)
Date: Tue, 26 Jul 2022 03:22:10 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 00/14] net: dsa: qca8k: code split for qca8k
Message-ID: <20220726002210.vprs4qwgz7bucrjb@skbuf>
References: <20220724201938.17387-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724201938.17387-1-ansuelsmth@gmail.com>

On Sun, Jul 24, 2022 at 10:19:24PM +0200, Christian Marangi wrote:
> This is needed ad ipq4019 SoC have an internal switch that is
> based on qca8k with very minor changes. The general function is equal.
> 
> Because of this we split the driver to common and specific code.
> 
> As the common function needs to be moved to a different file to be
> reused, we had to convert every remaining user of qca8k_read/write/rmw
> to regmap variant.
> We had also to generilized the special handling for the ethtool_stats
> function that makes use of the autocast mib. (ipq4019 will have a
> different tagger and use mmio so it could be quicker to use mmio instead
> of automib feature)
> And we had to convert the regmap read/write to bulk implementation to
> drop the special function that makes use of it. This will be compatible
> with ipq4019 and at the same time permits normal switch to use the eth
> mgmt way to send the entire ATU table read/write in one go.

I'm done reviewing v4, from my side you can consider addressing the
style comments as well as the comment on patch 1 from v3 and you can
resend.
